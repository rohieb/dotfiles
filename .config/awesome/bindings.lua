awful = require("awful")

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Up",     function () awful.tag.viewidx(-3) end),
    awful.key({ modkey,           }, "Down",   function () awful.tag.viewidx( 3) end),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "Escape", awful.placement.no_offscreen),
    awful.key({ modkey,           }, "-", awful.client.movetoscreen),
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "Tab", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "^",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Shift"   }, "q", awesome.restart),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "0",     function () awful.tag.setmwfact(0.5)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Shift"   }, "j",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Shift"   }, "k",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Change layouts
    awful.key({ modkey, "Mod1"    }, "m",  function () awful.layout.set(suit.floating) end),
    awful.key({ modkey, "Mod1"    }, "o",  function () awful.layout.set(suit.centerfair) end),
    awful.key({ modkey, "Mod1"    }, "u",  function () awful.layout.set(suit.fairv) end),
    awful.key({ modkey, "Mod1"    }, "k",  function () awful.layout.set(suit.tileright) end),
    awful.key({ modkey, "Mod1"    }, "8",  function () awful.layout.set(suit.termfair) end),
    awful.key({ modkey, "Mod1"    }, "9",  function () awful.layout.set(suit.cascadetile) end),
    awful.key({ modkey, "Mod1"    }, "i",  function () awful.layout.set(suit.max) end),
    awful.key({ modkey, "Mod1", "Shift" }, "i",  function () awful.layout.set(suit.max.fullscreen) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- utilities
    awful.key({ modkey, "Control" }, "l", function () awful.util.spawn("xflock4") end),
    awful.key({ }, "XF86ScreenSaver",     function () awful.util.spawn("xflock4") end),
    awful.key({ modkey, "Control" }, "r", function () awful.util.spawn("setscreens reset") end),
    awful.key({ modkey, "Control" }, "d", function () awful.util.spawn("setscreens home-dual") end),
    awful.key({ }, "XF86Launch1",         function () awful.util.spawn("gnome-calculator") end),
    awful.key({ }, "XF86Calculator",      function () awful.util.spawn("gnome-calculator") end),
    awful.key({ modkey, "Control" }, "plus", function () awful.util.spawn("gnome-calculator") end),
    awful.key({ modkey,           }, "c", function () awful.util.spawn_with_shell("xclip -o -selection primary | xclip -i -selection clipboard") end),
    awful.key({ modkey            }, "numbersign", function () awful.util.spawn("variety --next") end),

		-- Multimedia keys
		awful.key({}, "XF86AudioRaiseVolume", function () awful.util.spawn("volume.rb up") end),
		awful.key({}, "XF86AudioLowerVolume", function () awful.util.spawn("volume.rb down") end),
		awful.key({}, "XF86AudioMute", function () awful.util.spawn("volume.rb toggle") end),
		awful.key({}, "XF86AudioPlay", function () awful.util.spawn("mpc toggle") end),
		awful.key({ modkey, "Control" }, "Down", function () awful.util.spawn("mpc toggle") end),
		awful.key({}, "XF86AudioNext", function () awful.util.spawn("mpc next") end),
		awful.key({ modkey, "Control" }, "Right",  function () awful.util.spawn("mpc next") end),
		awful.key({}, "XF86AudioPrev", function () awful.util.spawn("mpc prev") end),
		awful.key({ modkey, "Control" }, "Left", function () awful.util.spawn("mpc prev") end),
		awful.key({}, "XF86AudioStop", function () awful.util.spawn("mpc stop") end),
		awful.key({ modkey, "Control" }, "Up", function () awful.util.spawn("mpc stop") end),
		awful.key({ modkey, "Shift" }, "period", function () awful.util.spawn("mpc single") end),
		awful.key({ modkey, "Shift" }, "comma", function () awful.util.spawn("mpc repeat") end),
		awful.key({ modkey, "Shift" }, "minus", function () awful.util.spawn("mpc random") end),

    -- Prompt
    awful.key({ modkey, "Control" }, "t",                 lain.widgets.contrib.task.prompt_add),
    awful.key({ modkey, "Shift"   }, "t",                 lain.widgets.contrib.task.prompt_search),
    awful.key({ modkey,           }, "r",     function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- vim: set ts=2 sw=2 et:
