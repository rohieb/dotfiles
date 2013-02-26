-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },

    -- floating windows
    { rule_any = { class = {
      "MPlayer",
      "pinentry",
      "Gimp-2.8", "Gimp",
      "Gucharmap",
      "Kaffeine",
      "Evince",
      "Display.im6",
      "Knetwalk"
    } }, properties = { floating = true } },
    { rule_any = { name = {
      "Terminator Preferences",
      "Tegaki",
      "qtcreator_process_stub", -- xterm started by QtCreator for program output
      "Event Tester" -- xev
    } }, properties = { floating = true } },

    -- non-floating windows
    { rule_any = { class = {
      "Chromium",
      "Epiphany-browser",
      "Clementine"
    } }, properties = { floating = false } },
    { rule = { class = "Kmymoney", role = "MainWindow#1" },
      properties = { floating = false } },
    { rule = { instance = "sun-awt-X11-XFramePeer",
      class = "org-openstreetmap-josm-Main" },
      properties = { floating = false } },

    -- map specific windows to specific tags
    { rule = { class = "Gkrellm" },
      properties = { tag = tags[1][1] } },

    { rule = { instance = "sun-awt-X11-XFramePeer",
      class = "org-openstreetmap-josm-Main" },
      properties = { tag = tags[1][2] } },
    { rule = { class = "Qtcreator" },
      properties = { tag = tags[1][2] } },

    { rule = { class = "WikidPad" },
      properties = { tag = tags[1][3] } },

    { rule = { class = "Terminator" },
      properties = { tag = tags[1][4] } },

    { rule_any = { class = {
      "Iceweasel",
      "Firefox-bin",
      "Chromium",
      "Epiphany"
    } }, properties = { tag = tags[1][5] } },

    { rule_any = { class = {
      "Icedove",
      "Evolution"
    } }, properties = { tag = tags[1][6] } },

    { rule_any = { class = {
      "Last.fm",
      "Guayadeque",
      "Gpodder",
      "Vagalume",
      "Rhythmbox",
      "Kaffeine",
      "Clementine",
      "Pavucontrol"
    } }, properties = { tag = tags[1][7] } },

    { rule = { class = "Polly" },
      properties = { tag = tags[1][8] } },

    { rule = { class = "Xchat" },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "conversation" },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "buddy_list" },
      properties = { tag = tags[1][9] } },
}
-- }}}

-- vim: set tw=80 sw=2 ts=2 ai smartindent expandtab:
