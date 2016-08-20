awful = require("awful")
lain = require("lain")

-- lain layout settings
lain.layout.termfair.nmaster = 2
lain.layout.termfair.ncol = 2

-- short names for layout suits
suit = {
  floating      = awful.layout.suit.floating,
  tileright     = awful.layout.suit.tile,
  tileleft      = awful.layout.suit.tile.left,
  tilebottom    = awful.layout.suit.tile.bottom,
  tiletop       = awful.layout.suit.tile.top,
  fairv         = awful.layout.suit.fair,
  fairh         = awful.layout.suit.fair.horizontal,
  max           = awful.layout.suit.max,
  fullscreen    = awful.layout.suit.max.fullscreen,
  magnifier     = awful.layout.suit.magnifier,
  cascade       = lain.layout.cascade,
  cascadetile   = lain.layout.cascadetile,
  termfair      = lain.layout.termfair,
  centerwork    = lain.layout.centerwork,
  centerfair    = lain.layout.centerfair,
}

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts = {
  suit.floating,
  suit.cascade,
  suit.cascadetile,
  suit.tileright,
  suit.tileleft,
  suit.tilebottom,
  suit.tiletop,
  suit.fairv,
  suit.fairh,
  suit.termfair,
  suit.centerwork,
  suit.centerfair,
  suit.max,
  suit.fullscreen,
  suit.magnifier,
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
    suit.floating,       suit.max,       suit.termfair,
    suit.termfair,       suit.max,       suit.max,
    suit.tilebottom,     suit.max,       suit.tileleft,
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- set default column widths
    awful.tag.setmwfact(0.2, tags[s][9])
end

-- vim: set ts=2 sw=2 et:
