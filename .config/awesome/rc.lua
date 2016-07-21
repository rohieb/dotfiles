-- Standard awesome library
awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
wibox = require("wibox")
-- Theme handling library
beautiful = require("beautiful")
-- Notification library
naughty = require("naughty")
gears = require("gears")

-- {{{ naughty configuration
-- List of file extensions that will be searched for icons
--   Default: { "png", "gif" }
naughty.config.icon_formats = { "png", "gif", "xpm" }
-- List of directories that will be serached for icons
--   Default: { "/usr/share/pixmaps/", }
naughty.config.icon_dirs = {
    "/usr/share/pixmaps/",
    "/usr/share/icons/Human/",
}
-- Prefer 32x32 icons before searching for other sizes
naughty.config.icon_size = 32

-- }}}

-- Load Debian menu entries
require("debian.menu")

-- more helpers
posix = require("posix")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions

-- Path to local config (should be something like ~/.config/awesome)
cfgpath = awful.util.getdir("config")
homepath = os.getenv("HOME")

-- Themes define colours, icons, font and wallpapers.
-- We fork the default theme to set a custom background
theme = { fontsize = "bigger" }
beautiful.init(cfgpath .. "/theme.lua")

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- This is used later as the default terminal and editor to run.
-- terminal = "xterm"
terminal = "urxvtcd"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Pull in all the other modular config
dofile(cfgpath .. "/debug.lua")
dofile(cfgpath .. "/layout.lua")
dofile(cfgpath .. "/menu.lua")
dofile(cfgpath .. "/wiboxes.lua")
dofile(cfgpath .. "/bindings.lua")
dofile(cfgpath .. "/rules.lua")
dofile(cfgpath .. "/signals.lua")
dofile(cfgpath .. "/autostart.lua")

-- vim: set ts=2 sw=2 et:
