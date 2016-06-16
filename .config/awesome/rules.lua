local awful = require("awful")
awful.rules = require("awful.rules")
local beautiful = require("beautiful")

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     --raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },

    -- floating windows
    { rule_any = { class = {
      "d-feet",
      "MPlayer",
      "mpv",
      "pinentry",
      "Gimp-2.8", "Gimp",
      "Gnome-calculator",
      "Gucharmap",
      "Kaffeine",
      "Evince",
      "Kmines",
      "Xsane",
      "Display.im6",
      "Hamster-time-tracker",
      "kpat",
      "kmines",
      "Xmessage",
      "Knetwalk"
    } }, properties = { floating = true } },
    { rule_any = { name = {
      "Variety Images",
      "Variety Recent Downloads",
      "Terminator Preferences",
      "Tegaki",
      "qtcreator_process_stub", -- xterm started by QtCreator for program output
      "Event Tester" -- xev
    } }, properties = { floating = true } },

    -- non-floating windows
    { rule_any = { class = {
      "Gkrellm",
      "Wireshark",
      "Chromium",
      "Epiphany-browser",
      "Dolphin",
      "Iceweasel",
      "Firefox",
      "Rawtherapee",
      "Clementine"
    } }, properties = { floating = false } },
    { rule = { class = "Okteta", role = "Shell" },
      properties = { floating = false } },
    { rule = { class = "Kmymoney", role = "MainWindow#1" },
      properties = { floating = false } },
    { rule = { instance = "sun-awt-X11-XFramePeer",
      class = "org-openstreetmap-josm-Main" },
      properties = { floating = false } },

    -- map specific windows to specific tags
    { rule = { class = "Gkrellm" },
      properties = { tag = tags[1][1] } },
    { rule = { role = "vimboy" },
      properties = { tag = tags[1][1] } },
    { rule = { role = "Hamster-time-tracker" },
      properties = { tag = tags[1][1] } },

    { rule = { instance = "sun-awt-X11-XFramePeer",
      class = "org-openstreetmap-josm-Main" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Qtcreator" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Gitk" },
      properties = { tag = tags[1][2] } },

    { rule = { class = "Eclipse" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Meld" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Git-cola" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Meld" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "Git-cola" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "com-st-microxplorer-maingui-IOConfigurator" },
      properties = { tag = tags[1][3] } },

    { rule = { class = "Terminator" },
      properties = { tag = tags[1][4] } },

    { rule_any = { class = {
      "Iceweasel",
      "Firefox-bin",
      "Firefox",
      "Epiphany"
    } }, properties = { tag = tags[1][5] } },
    { rule = { class = "Chromium", role = "browser" },
      properties = { tag = tags[1][5] } },

    { rule_any = { class = {
      "Icedove",
      "Thunderbird",
      "Evolution"
    } }, properties = { tag = tags[1][6] } },

    { rule_any = { class = {
      "Last.fm",
      "Guayadeque",
      "Gpodder",
      "Gmpc",
      "Vagalume",
      "Rhythmbox",
      "Kaffeine",
      "Clementine",
      "Pavucontrol"
    } }, properties = { tag = tags[1][7] } },

    { rule = { class = "Polly" },
      properties = { tag = tags[1][8] } },
    { rule = { class = "Chromium", role = "pop-up" },  -- TweetDeck app window
      properties = { tag = tags[1][8] } },

    { rule_any = { class = { "Xchat", "Hexchat" } },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "conversation" },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "buddy_list" },
      properties = { tag = tags[1][9] } },
}
-- }}}

-- vim: set tw=80 sw=2 ts=2 ai smartindent expandtab:
