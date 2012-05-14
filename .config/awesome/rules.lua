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
    { rule = { class = "MPlayer" }, properties = { floating = true } },
    { rule = { class = "pinentry" }, properties = { floating = true } },
    { rule = { class = "gimp" }, properties = { floating = true } },
    { rule = { class = "Gucharmap" }, properties = { floating = true } },
    { rule = { class = "Kaffeine" }, properties = { floating = true } },
    { rule = { class = "Evince" }, properties = { floating = true } },

    -- map specific windows to specific tags
    { rule = { class = "Wikidpad" },
      properties = { tag = tags[1][3] } },

    { rule = { class = "Terminator" },
      properties = { tag = tags[1][4] } },

    { rule_any = { class = { "Firefox", "Chromium-browser", "Epiphany" } },
      properties = { tag = tags[1][5] } },

    { rule_any = { class = { "Thunderbird", "Evolution" } },
      properties = { tag = tags[1][6] } },

    { rule_any = { class = { "Guayadeque", "Gpodder", "Vagalume",
      "Rhythmbox", "Kaffeine" } },
      properties = { tag = tags[1][7] } },

    { rule = { class = "Xchat" },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "conversation" },
      properties = { tag = tags[1][9] } },
    { rule = { class = "Pidgin", role = "buddy_list" },
      properties = { tag = tags[1][9] } },
}
-- }}}

