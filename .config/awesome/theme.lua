theme = {}

theme.font = "Terminus 8"

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

-- Icons from Powerarrow Darker
-- see https://github.com/copycat-killer/awesome-copycats
local themes_dir = os.getenv("HOME") .. "/.config/awesome"

theme.submenu_icon                  = themes_dir .. "/icons/submenu.png"
theme.taglist_squares_sel           = themes_dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = themes_dir .. "/icons/square_unsel.png"

theme.layout_tile                   = themes_dir .. "/icons/tile.png"
theme.layout_tileleft               = themes_dir .. "/icons/tileleft.png"
theme.layout_tilebottom             = themes_dir .. "/icons/tilebottom.png"
theme.layout_tiletop                = themes_dir .. "/icons/tiletop.png"
theme.layout_fairv                  = themes_dir .. "/icons/fairv.png"
theme.layout_fairh                  = themes_dir .. "/icons/fairh.png"
theme.layout_spiral                 = themes_dir .. "/icons/spiral.png"
theme.layout_dwindle                = themes_dir .. "/icons/dwindle.png"
theme.layout_max                    = themes_dir .. "/icons/max.png"
theme.layout_fullscreen             = themes_dir .. "/icons/fullscreen.png"
theme.layout_magnifier              = themes_dir .. "/icons/magnifier.png"
theme.layout_floating               = themes_dir .. "/icons/floating.png"

theme.arrl                          = themes_dir .. "/icons/arrl.png"
theme.arrl_dl                       = themes_dir .. "/icons/arrl_dl.png"
theme.arrl_ld                       = themes_dir .. "/icons/arrl_ld.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = "ubuntu-mono-dark"

-- set the wallpaper
theme.wallpaper_cmd = { "set-wallpaper" }

return theme
-- vim: set ts=2 sw=2 et:
