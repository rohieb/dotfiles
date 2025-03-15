#!/usr/bin/env python3

# Firefox "Open in MPV" plugin
# forked and adapted from https://github.com/woodruffw/ff2mpv/blob/master/ff2mpv.py
# commit b312d7e816a99f4c7abd (2024-12-03, William Woodruff: "Delete .github/FUNDING.yml")
# for https://addons.mozilla.org/en-US/firefox/addon/ff2mpv/

import json
import os
import platform
import struct
import sys
import subprocess


def main():
    message = get_message()
    url = message.get("url")
    options = message.get("options") or []

    args = ["mpve", url]

    kwargs = {}
    # https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/Native_messaging#Closing_the_native_app
    if platform.system() == "Windows":
        kwargs["creationflags"] = subprocess.CREATE_BREAKAWAY_FROM_JOB

    # HACK(ww): On macOS, graphical applications inherit their path from `launchd`
    # rather than the default path list in `/etc/paths`. `launchd` doesn't include
    # Homebrew in its default list, which means that any installations
    # of MPV and/or youtube-dl under that prefix aren't visible when spawning
    # from, say, Firefox. The real fix is to modify `launchd.conf`, but that's
    # invasive and maybe not what users want in the general case.
    # Hence this nasty hack.
    if platform.system() == "Darwin":
        path = os.environ.get("PATH")
        os.environ["PATH"] = f"/opt/homebrew/bin:/usr/local/bin:{path}"

    subprocess.Popen(args, **kwargs)

    # Need to respond something to avoid "Error: An unexpected error occurred"
    # in Browser Console.
    send_message("ok")


# https://developer.mozilla.org/en-US/Add-ons/WebExtensions/Native_messaging#App_side
def get_message():
    raw_length = sys.stdin.buffer.read(4)
    if not raw_length:
        return {}
    length = struct.unpack("@I", raw_length)[0]
    message = sys.stdin.buffer.read(length).decode("utf-8")
    return json.loads(message)


def send_message(message):
    # https://stackoverflow.com/a/56563264
    # https://docs.python.org/3/library/json.html#basic-usage
    # To get the most compact JSON representation, you should specify
    # (',', ':') to eliminate whitespace.
    content = json.dumps(message, separators=(",", ":")).encode("utf-8")
    length = struct.pack("@I", len(content))
    sys.stdout.buffer.write(length)
    sys.stdout.buffer.write(content)
    sys.stdout.buffer.flush()


if __name__ == "__main__":
    main()
