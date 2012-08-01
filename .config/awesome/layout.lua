-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,         -- 1
    awful.layout.suit.tile,             -- 2
    awful.layout.suit.tile.left,        -- 3
    awful.layout.suit.tile.bottom,      -- 4
    awful.layout.suit.tile.top,         -- 5
--    awful.layout.suit.fair,             -- 6
--    awful.layout.suit.fair.horizontal,  -- 7
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,              -- 8
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier         -- 9
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
    layouts[2], layouts[6], layouts[2],
    layouts[6], layouts[6], layouts[6],
    layouts[4], layouts[6], layouts[3]
  }
}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag(tags.names, s, tags.layout)
end

