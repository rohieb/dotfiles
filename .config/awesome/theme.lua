theme = theme or {}

theme.settings = {
  font_family   = "Terminus",
  font_size     = 8,
  icon_size     = 18
}

if theme.fontsize == "bigger" then
  theme.settings.font_size = 10
  theme.settings.icon_size = 21
end

theme.font      = theme.settings.font_family .. " " .. theme.settings.font_size
theme.icon_size = theme.settings.icon_size

-- Solarized color scheme
theme.base03    = "#002b36"
theme.base02    = "#073642"
theme.base01    = "#586e75"
theme.base00    = "#657b83"
theme.base0     = "#839496"
theme.base1     = "#93a1a1"
theme.base2     = "#eee8d5"
theme.base3     = "#fdf6e3"
theme.yellow    = "#b58900"
theme.orange    = "#cb4b16"
theme.red       = "#dc322f"
theme.magenta   = "#d33682"
theme.violet    = "#6c71c4"
theme.blue      = "#268bd2"
theme.cyan      = "#2aa198"
theme.green     = "#859900"

-- functional color definitions
theme.bg_normal     = "#000000"
theme.bg_focus      = theme.base03
theme.bg_urgent     = theme.red
theme.bg_minimize   = theme.bg_normal
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = theme.base0
theme.fg_focus      = theme.base2
theme.fg_urgent     = theme.base3
theme.fg_minimize   = theme.base02

theme.border_width  = 1
theme.border_normal = theme.base02
theme.border_focus  = theme.yellow
theme.border_marked = theme.green

theme.menu_width  = 150
theme.menu_height = theme.icon_size

-- Icons from Powerarrow Darker
-- see https://github.com/copycat-killer/awesome-copycats
themes_dir = ("~/.config/awesome/icons-%dpx"):format(theme.icon_size)

theme.awesome_icon                  = themes_dir .. "/awesome.png"
theme.submenu_icon                  = themes_dir .. "/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/square_unsel.png"

theme.layout_tile                   = themes_dir .. "/layout/tile.png"
theme.layout_tileleft               = themes_dir .. "/layout/tileleft.png"
theme.layout_tilebottom             = themes_dir .. "/layout/tilebottom.png"
theme.layout_tiletop                = themes_dir .. "/layout/tiletop.png"
theme.layout_fairv                  = themes_dir .. "/layout/fairv.png"
theme.layout_fairh                  = themes_dir .. "/layout/fairh.png"
theme.layout_max                    = themes_dir .. "/layout/max.png"
theme.layout_fullscreen             = themes_dir .. "/layout/fullscreen.png"
theme.layout_magnifier              = themes_dir .. "/layout/magnifier.png"
theme.layout_floating               = themes_dir .. "/layout/floating.png"

theme.widget_mem                    = themes_dir .. "/widget/mem.png"
theme.widget_cpu                    = themes_dir .. "/widget/cpu.png"
theme.widget_load                   = themes_dir .. "/widget/load.png"
theme.widget_net                    = themes_dir .. "/widget/net_wired.png"
theme.widget_play                   = themes_dir .. "/widget/play.png"
theme.widget_pause                  = themes_dir .. "/widget/pause.png"
theme.widget_stop                   = themes_dir .. "/widget/stop.png"
theme.widget_consume                = themes_dir .. "/widget/consume.png"
theme.widget_random                 = themes_dir .. "/widget/random.png"
theme.widget_repeat                 = themes_dir .. "/widget/repeat.png"
theme.widget_repeat_single          = themes_dir .. "/widget/repeat_single.png"
theme.widget_single                 = themes_dir .. "/widget/single.png"
theme.widget_task                   = themes_dir .. "/widget/task.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "ubuntu-mono-dark"

theme.wallpaper = os.getenv("HOME") .. "/.wallpapers/Andromeda_Galaxy_(with_h-alpha).jpg"

return theme
-- vim: set ts=2 sw=2 et:
