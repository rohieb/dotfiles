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
    { rule = { class = "Gimp-2.8" }, properties = { floating = true } },
    { rule = { class = "Gimp" }, properties = { floating = true } },
    { rule = { class = "Gucharmap" }, properties = { floating = true } },
    { rule = { class = "Kaffeine" }, properties = { floating = true } },
    { rule = { class = "Evince" }, properties = { floating = true } },
    { rule = { class = "Knetwalk" }, properties = { floating = true } },
    { rule = { name = "Terminator Preferences" }, properties = { floating = true } },
    { rule = { class = "Epiphany-browser" }, properties = { floating = false } },

    -- map specific windows to specific tags
    { rule = { class = "Gkrellm" },
      properties = { tag = tags[1][1] } },

    { rule = { class = "WikidPad" },
      properties = { tag = tags[1][3] } },

    { rule = { class = "Terminator" },
      properties = { tag = tags[1][4] } },

    { rule_any = { class = { "Iceweasel", "Firefox-bin", "Chromium",
			"Epiphany" } },
      properties = { tag = tags[1][5] } },

    { rule_any = { class = { "Icedove", "Evolution" } },
      properties = { tag = tags[1][6] } },

    { rule_any = { class = { "Guayadeque", "Gpodder", "Vagalume",
      "Rhythmbox", "Kaffeine", "Pavucontrol" } },
      properties = { tag = tags[1][7] } },

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

