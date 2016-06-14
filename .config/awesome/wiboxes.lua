local awful = require("awful")
local wibox = require("wibox")
local lain = require("lain")
local markup = lain.util.markup

-- {{{ Wibox
-- helpers
local function timestring(seconds)
  seconds = tonumber(seconds)
  local s = seconds % 60
  local m = math.floor(seconds / 60)
  local h = math.floor(seconds / (60*60))
  if h > 0 then
    return ("%d:%.2d:%.2d"):format(h, m, s)
  else
    return ("%d:%.2d"):format(m, s)
  end
  return str
end

local function shorten(str, maxlen)
  if str:len() > maxlen then
    return str:sub(0, maxlen-1) .. "…"
  else
    return str
  end
end

-- space between items
local spacerwidget    = wibox.widget.textbox(" ")

-- Create a textclock widget
mytextclock = awful.widget.textclock("%a %b %d, %H:%M:%S ", 1)

-- mpd widget
local mpdicon = wibox.widget.imagebox()
local mpdwidget = lain.widgets.mpd({
  timeout = 1,
  notify = "off",
  settings = function()
    local function get_text(artistmarkupfn)
      artistmarkupfn = artistmarkupfn or function(s) return s end
      return artistmarkupfn(shorten(mpd_now.artist, 30) .. " > " ..
        shorten(mpd_now.title, 30)) .. " (" ..
        timestring(mpd_now.elapsed) .. "/" ..
        timestring(mpd_now.time) .. ")"
    end

    if mpd_now.state == "play" then
      widget:set_markup(get_text(function(s)
        return markup(theme.fg_focus, s)
      end))
      mpdicon:set_image(beautiful.widget_play)

    elseif mpd_now.state == "pause" then
      widget:set_markup(get_text() .. " [paused]")
      mpdicon:set_image(beautiful.widget_pause)

    else  -- stopped
      widget:set_markup("")
      mpdicon:set_image(nil)
    end
  end
})

-- cpu widget
local cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
local cpuwidget = lain.widgets.cpu({
  timeout = 1,
  settings = function()
    function color(percentage)
      local padded = ("%3d%%"):format(percentage)
      if     percentage > 90 then return markup(theme.magenta, padded)
      elseif percentage > 60 then return markup(theme.orange,  padded)
      elseif percentage > 30 then return markup(theme.yellow,  padded)
      else                        return padded
      end
    end
    widget:set_markup(color(cpu_now[1].usage) .. color(cpu_now[2].usage))
  end
})

-- loadavg widget
local loadicon = wibox.widget.imagebox(beautiful.widget_load)
local loadwidget = lain.widgets.sysload({
  timeout = 5,
  settings = function()
    function color(loadavg)
      local n = tonumber(loadavg)
      if     n > 5   then return markup(theme.magenta, loadavg)
      elseif n > 2.5 then return markup(theme.orange,  loadavg)
      elseif n > 1.5 then return markup(theme.yellow,  loadavg)
      else                return loadavg
      end
    end
    widget:set_markup(color(load_1) .. ", " .. color(load_5))
  end
})

-- memory widget
local memicon = wibox.widget.imagebox(beautiful.widget_mem)
local memwidget = lain.widgets.mem({
  timeout = 2,
  settings = function()
    function format_size(mb)
      if     mb > 1000*10   then return ("%3dG")  :format(mb / 1024)
      elseif mb > 1000      then return ("%1.1fG"):format(mb / 1024)
      elseif mb > 10        then return ("%3dM")  :format(mb)
      else                       return ("%1.1fM"):format(mb)
      end
    end
    -- FIXME: memory formatting with color
    widget:set_markup(format_size(mem_now.used) .. " " ..
      format_size(mem_now.free) .. " " ..
      format_size(mem_now.swapused)
    )
  end
})

-- net widget
local neticon = wibox.widget.imagebox(beautiful.widget_net)
local netwidget = lain.widgets.net({
  timeout = 2,
  notify = "off",
  settings = function()
    function format_size(kb)
      kb = tonumber(kb)
      if     kb > 1000*1024 then return ("%1.1fG"):format(kb / (1024 * 1024))
      elseif kb > 1000*10   then return ("%3dM")  :format(kb / (1024))
      elseif kb > 1000      then return ("%1.1fM"):format(kb / (1024))
      elseif kb > 10        then return ("%3dk")  :format(kb)
      else                       return ("%1.1fk"):format(kb)
      end
    end
    local up_color, down_color = theme.fg_normal, theme.fg_normal
    if tonumber(net_now.sent)     > 0.2 then up_color = theme.green end
    if tonumber(net_now.received) > 0.2 then down_color = theme.red end
    widget:set_markup(markup(up_color  , format_size(net_now.sent) .. "↑")
            .. " " .. markup(down_color, format_size(net_now.received) .. "↓"))
  end
})


-- Create a wibox for each screen and add it
mytopwibox = {}
mybottomwibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create a top wibox with tags and widgets
    mytopwibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local top_left_layout = wibox.layout.fixed.horizontal()
    top_left_layout:add(mylauncher)
    top_left_layout:add(mytaglist[s])
    top_left_layout:add(mypromptbox[s])
    top_left_layout:add(mpdicon)
    top_left_layout:add(mpdwidget)

    -- Widgets that are aligned to the right
    local top_right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then
      top_right_layout:add(cpuicon)
      top_right_layout:add(cpuwidget)
      top_right_layout:add(spacerwidget)

      top_right_layout:add(loadicon)
      top_right_layout:add(loadwidget)
      top_right_layout:add(spacerwidget)

      top_right_layout:add(memicon)
      top_right_layout:add(memwidget)
      top_right_layout:add(spacerwidget)

      top_right_layout:add(neticon)
      top_right_layout:add(netwidget)
      top_right_layout:add(spacerwidget)

      top_right_layout:add(wibox.widget.systray())
      top_right_layout:add(spacerwidget)
    end
    top_right_layout:add(mytextclock)

    -- Now bring it all together (with the tasklist in the middle)
    local top_layout = wibox.layout.align.horizontal()
    top_layout:set_left(top_left_layout)
    --top_layout:set_middle(mytasklist[s])
    top_layout:set_right(top_right_layout)

    mytopwibox[s]:set_widget(top_layout)

    -- Create a bottom wibox with the task list
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s })

    local bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_right(mylayoutbox[s])
    bottom_layout:set_middle(mytasklist[s])
    bottom_layout:set_left(nil)

    mybottomwibox[s]:set_widget(bottom_layout)
end
-- }}}
-- vim: set ts=2 sw=2 et:
