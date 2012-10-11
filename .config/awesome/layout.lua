-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  awful.layout.suit.floating,         -- 1
  awful.layout.suit.tile,             -- 2
  awful.layout.suit.tile.left,        -- 3
  awful.layout.suit.tile.bottom,      -- 4
  awful.layout.suit.tile.top,         -- 5
  awful.layout.suit.fair,             -- 6
  awful.layout.suit.fair.horizontal,  -- 7
  awful.layout.suit.spiral,           -- 8
  awful.layout.suit.spiral.dwindle,   -- 9
  awful.layout.suit.max,              -- 10
  awful.layout.suit.max.fullscreen,   -- 11
  awful.layout.suit.magnifier         -- 12
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names = {
    1, 2, 3,
    "4:work", "5:www", "6:mail",
    "7:snd", "9:twtr", "9:im"
  },
  layout = {
    layouts[10], layouts[10], layouts[10],
    layouts[10], layouts[10], layouts[10],
    layouts[4], layouts[10], layouts[3]
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- set default column widths
    awful.tag.setmwfact(0.2, tags[s][9])
end

-- vim: set ts=2 sw=2 et:
