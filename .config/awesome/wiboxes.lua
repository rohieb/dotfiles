awful = require("awful")
wibox = require("wibox")
lain = require("lain")
markup = lain.util.markup
awful.util = require("awful.util")
  escape_f = awful.util.  escape
unescape_f = awful.util.unescape

-- {{{ Wibox
-- helpers
function timestring(seconds)
  seconds = tonumber(seconds)

  if not seconds then
    return ""    -- some chiptunes don't have a duration.
  end

  local s = seconds % 60
  local m = math.floor(seconds / 60) % 60
  local h = math.floor(seconds / (60*60))
  if h > 0 then
    return ("%d:%.2d:%.2d"):format(h, m, s)
  else
    return ("%d:%.2d"):format(m, s)
  end
  return str
end

function shorten(str, maxlen)
  if str:len() > maxlen then
    return str:sub(0, maxlen-1) .. "…"
  else
    return str
  end
end

-- format a size in kB/MB/GB, padded to 4 characters
function format_size(kb)
  kb = tonumber(kb)
  if     kb >= 1000*1000*10 then return ("%3dG")  :format(math.floor(kb / (1024 * 1024)))
  elseif kb >= 1000*1000    then return ("%1.1fG"):format(kb / (1024 * 1024))
  elseif kb >= 1000*10      then return ("%3dM")  :format(math.floor(kb / (1024)))
  elseif kb >= 1000         then return ("%1.1fM"):format(kb / (1024))
  elseif kb >= 10           then return ("%3dk")  :format(math.floor(kb))
  else                           return ("%1.1fk"):format(kb)
  end
end

-- apply color to string according to number in range. thresholds must be
-- monotonic, i.e. either   yellow < orange < magenta < MAX_INT   or
-- MAX_INT > yellow > orange > magenta   must be true.
-- also applies fn(num) to the value before coloring it.
function mycolor(yellow, orange, magenta, num, fn)
  if type(fn) ~= "function" then fn = function(s) return s end end
  local op = function(n,m)
		if yellow > magenta then return n <= m else return n >= m end
	end
  print(("%s %s %s %s"):format(yellow, orange, magenta, num)) ---- FIXME
  local n = tonumber(num)
  if op(n,magenta)                      then return markup(theme.magenta, fn(n)) end
  if op(n,orange) and not op(n,magenta) then return markup(theme.orange,  fn(n)) end
  if op(n,yellow) and not op(n,orange)  then return markup(theme.yellow,  fn(n)) end
  return fn(n)
end

-- space between items
spacerwidget    = wibox.widget.textbox(" ")

-- Create a textclock widget
mytextclock = awful.widget.textclock("%a %b %d, <span foreground='" ..
  theme.fg_focus .. "'>%H:%M:%S </span>", 1)

-- mpd widget
if string.len(awful.util.pread("mpc | grep -v '^error' ")) > 0 then
  HAVE_MPD = true

  mpdicon = wibox.widget.imagebox()
  mpdicon_random  = wibox.widget.imagebox()
  mpdicon_single  = wibox.widget.imagebox()
  mpdicon_repeat  = wibox.widget.imagebox()
  mpdicon_consume = wibox.widget.imagebox()
  mpdwidget = lain.widgets.mpd({
    timeout = 1,
    notify = "off",
    settings = function()
      -- mode icons
      img_repeat, img_single, img_random, img_consume = nil, nil, nil, nil
      if mpd_now.repeat_mode and mpd_now.single_mode then
        img_repeat = beautiful.widget_repeat_single
      else
        if mpd_now.repeat_mode then img_repeat = beautiful.widget_repeat end
        if mpd_now.single_mode then img_single = beautiful.widget_single end
      end
      if mpd_now.random_mode  then img_random  = beautiful.widget_random  end
      if mpd_now.consume_mode then img_consume = beautiful.widget_consume end

      mpdicon_repeat :set_image(img_repeat)
      mpdicon_single :set_image(img_single)
      mpdicon_random :set_image(img_random)
      mpdicon_consume:set_image(img_consume)

      -- some info may be missing
      local function isset(s) return (s and s ~= "N/A") end
      local playlistinfo, artisttitle, timeinfo = "", "", ""

      if mpd_now.pls_pos and tonumber(mpd_now.pls_pos) ~= nil then
        playlistinfo = "(" .. tonumber(mpd_now.pls_pos) + 1 .. "/"
          .. mpd_now.pls_len .. ")"
      end
      if isset(mpd_now.artist) and isset(mpd_now.title) then
        artisttitle = escape_f(shorten(unescape_f(mpd_now.artist), 22)) .. " – "
          .. escape_f(shorten(unescape_f(mpd_now.title), 26))
      end
      if isset(mpd_now.elapsed) and isset(mpd_now.time) then
        timeinfo = "(" .. timestring(mpd_now.elapsed) .. "/"
          .. timestring(mpd_now.time) .. ")"
      end

      -- play/pause/stop
      if mpd_now.state == "play" then
        icon = beautiful.widget_play
        text = playlistinfo .. " " .. markup(theme.fg_focus, artisttitle) .. " "
          .. timeinfo

      elseif mpd_now.state == "pause" then
        icon = beautiful.widget_pause
        text = playlistinfo .. " " .. artisttitle .. " " .. timeinfo

      else  -- stopped
        icon = beautiful.widget_stop
        text = playlistinfo .. " " .. artisttitle
      end

      widget:set_markup(text)
      mpdicon:set_image(icon)
    end
  })
end

-- cpu widget
cpuicon = wibox.widget.imagebox(beautiful.widget_cpu)
cpuwidget = lain.widgets.cpu({
  timeout = 1,
  settings = function()
    function color(percentage)
      local padded = ("%3d%%"):format(percentage)
      if     percentage >= 90 then return markup(theme.magenta, padded)
      elseif percentage >= 60 then return markup(theme.orange,  padded)
      elseif percentage >= 30 then return markup(theme.yellow,  padded)
      else                        return padded
      end
    end
    local cpustring = ""
    for i,_ in ipairs(cpu_now) do
      cpustring = cpustring .. color(cpu_now[i].usage)
    end
    widget:set_markup(cpustring)
  end
})

-- loadavg widget
loadicon = wibox.widget.imagebox(beautiful.widget_load)
loadwidget = lain.widgets.sysload({
  timeout = 5,
  settings = function()
    function color(loadavg)
      local n = tonumber(loadavg)
      if     n >= 5   then return markup(theme.magenta, loadavg)
      elseif n >= 2.5 then return markup(theme.orange,  loadavg)
      elseif n >= 1.5 then return markup(theme.yellow,  loadavg)
      else                return loadavg
      end
    end
    widget:set_markup(color(load_1) .. ", " .. color(load_5))
  end
})

-- memory widget
memicon = wibox.widget.imagebox(beautiful.widget_mem)
memwidget = lain.widgets.mem({
  timeout = 2,
  settings = function()
    local m  = function(n) return n * 1024 end
    local g  = function(n) return m(m(n)) end
    local mn = function(s) return m(mem_now[s]) end  -- mem_now uses `free -m`
    -- FIXME: make thresholds more configurable, detect total amount of RAM?
    local used = mycolor(g(1.6), g(2.2), g(2.6), mn("used"    ), format_size)
    local free = mycolor(m(500), m(300), m(100), mn("free"    ), format_size)
    local swap = mycolor(m(100), m(350), m(700), mn("swapused"), format_size)
    widget:set_markup(used .. " " .. free .. " " .. swap)
  end
})

-- net widget
neticon = wibox.widget.imagebox(beautiful.widget_net)
netwidget = lain.widgets.net({
  timeout = 2,
  notify = "off",
  settings = function()
    local up_color, down_color = theme.fg_normal, theme.fg_normal
    if tonumber(net_now.sent)     > 0.2 then up_color = theme.green end
    if tonumber(net_now.received) > 0.2 then down_color = theme.red end
    widget:set_markup(markup(up_color  , format_size(net_now.sent) .. "↑")
            .. " " .. markup(down_color, format_size(net_now.received) .. "↓"))
  end
})

if  posix.stat(homepath .. "/.taskrc") and
    string.len(awful.util.pread("task --version")) > 0 then
  HAVE_TASK = true

  taskicon = wibox.widget.imagebox(beautiful.widget_task)
  lain.widgets.contrib.task.attach(taskicon, {
    followmouse = true,
    font_size   = beautiful.settings.font_size,
    timeout     = 7,
    cmdline     = "nextpopup",
  })
end

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
    top_left_layout = wibox.layout.fixed.horizontal()
    top_left_layout:add(mylauncher)
    top_left_layout:add(mytaglist[s])
    top_left_layout:add(mypromptbox[s])
    if HAVE_MPD then
      top_left_layout:add(mpdicon_consume)
      top_left_layout:add(mpdicon_repeat)
      top_left_layout:add(mpdicon_single)
      top_left_layout:add(mpdicon_random)
      top_left_layout:add(mpdicon)
      top_left_layout:add(mpdwidget)
    end

    -- Widgets that are aligned to the right
    top_right_layout = wibox.layout.fixed.horizontal()
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
    if HAVE_TASK then
      top_right_layout:add(taskicon)
    end

    -- Now bring it all together (with the tasklist in the middle)
    top_layout = wibox.layout.align.horizontal()
    top_layout:set_left(top_left_layout)
    --top_layout:set_middle(mytasklist[s])
    top_layout:set_right(top_right_layout)

    mytopwibox[s]:set_widget(top_layout)

    -- Create a bottom wibox with the task list
    mybottomwibox[s] = awful.wibox({ position = "bottom", screen = s })

    bottom_layout = wibox.layout.align.horizontal()
    bottom_layout:set_right(mylayoutbox[s])
    bottom_layout:set_middle(mytasklist[s])
    bottom_layout:set_left(nil)

    mybottomwibox[s]:set_widget(bottom_layout)
end
-- }}}
-- vim: set ts=2 sw=2 et:
