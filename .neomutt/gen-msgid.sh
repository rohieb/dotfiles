#!/usr/bin/env bash
#
# This generates friendly Message-ID headers that are safe, unique, and provide
# better UX for someone using lore/b4 to retrieve messages.
#
# Instructions for using with mutt/neomutt:
#
# Save this as ~/.config/mutt/gen-msgid, then add
# ~/.config/mutt/gen-msgid.muttrc with the following, fixing your path
# to the file:
#
# my_hdr Message-ID: <`~/.config/mutt/gen-msgid.sh`>
#
# then edit ~/.config/mutt/muttrc to add:
#
# send-hook . "source ~/.config/mutt/gen-msgid.muttrc"

# I like my msgid to start with the date
msgid="$(date -u +%s)-"

if [ -x "$(which coolname)" ]; then
    msgid="${msgid}$(coolname 3)-$(openssl rand -hex 3)"
elif [ -x "$(which diceware)" ]; then
    # I like memorable nonsense, so I can visually tell one message
    # from another, by looking at the lore URL, so use diceware for
    # that
    msgid="${msgid}$(diceware --no-caps -d- -n4)-$(openssl rand -hex 6)"
else
    # Just use openssl with some extra randomness
    msgid="${msgid}$(openssl rand -hex 12)"
fi

msgid="${msgid}@$(hostname --fqdn)"
echo "${msgid}"
