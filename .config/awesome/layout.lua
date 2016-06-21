awful = require("awful")

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.tile.top,
  awful.layout.suit.fair,
  awful.layout.suit.fair.horizontal,
  awful.layout.suit.max,
  awful.layout.suit.max.fullscreen,
  awful.layout.suit.magnifier,
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {
  names = {
    1,2,3,4,5,6,7,8,9
    -- or, a wider version:
    -- "１","２","３","４","５","６","７","８","９"
  },
  layout = {
    awful.layout.suit.tile, awful.layout.suit.max, awful.layout.suit.max,
    awful.layout.suit.tile, awful.layout.suit.max, awful.layout.suit.max,
    awful.layout.suit.tile.bottom, awful.layout.suit.max, awful.layout.suit.tile.left,
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- set default column widths
    awful.tag.setmwfact(0.2, tags[s][9])
end

-- vim: set ts=2 sw=2 et:
