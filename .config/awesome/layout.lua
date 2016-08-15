awful = require("awful")
suits = awful.layout.suit

lain = require("lain")

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  suits.floating,
  lain.layout.cascade,
  lain.layout.cascadetile,
  suits.tile,
  suits.tile.left,
  suits.tile.bottom,
  suits.tile.top,
  suits.fair,
  suits.fair.horizontal,
  lain.layout.termfair,
  lain.layout.centerwork,
  lain.layout.centerfair,
  suits.max,
  suits.max.fullscreen,
  suits.magnifier,
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
    suits.floating,       suits.max,       suits.max,
    suits.tile,           suits.max,       suits.max,
    suits.tile.bottom,    suits.max,       suits.tile.left,
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- set default column widths
    awful.tag.setmwfact(0.2, tags[s][9])
end

-- vim: set ts=2 sw=2 et:
