awful = require("awful")
lain = require("lain")

-- lain layout settings
lain.layout.termfair.nmaster = 2   -- up to 2 rows
lain.layout.termfair.ncol = 1      -- full height when ≤ 2 clients

lain.layout.centerfair.nmaster = 2 -- up to 2 rows
lain.layout.centerfair.ncol = 5    -- up to 5 in one row before spitting the
                                   -- next row (no effect with only 2 rows)

lain.layout.cascadetile.ncol = 2   -- 1 ⇒ overlap slaves with master, x≠1 ⇒ don't
lain.layout.cascadetile.offset_x = 10
lain.layout.cascadetile.offset_y = 110 -- about 8 console lines
lain.layout.cascade.offset_x = 10
lain.layout.cascade.offset_y = 110

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
  suit.tileright,
  suit.tileleft,
  suit.tilebottom,
  suit.tiletop,
  suit.fairh,
  suit.cascadetile,

  -- these are farily similar, group them together
  suit.fairv,
  suit.centerfair,
  suit.termfair,

  --suit.centerwork,  -- useless on small screens
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
    suit.floating,       suit.max,       suit.centerfair,
    suit.fairv,          suit.max,       suit.max,
    suit.tilebottom,     suit.max,       suit.tileleft,
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)

    -- set default column widths
    awful.tag.setmwfact(0.2, tags[s][1])
    awful.tag.setmwfact(0.3, tags[s][7])
    awful.tag.setmwfact(0.2, tags[s][9])
end

-- vim: set ts=2 sw=2 et:
