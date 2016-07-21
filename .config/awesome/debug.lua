naughty = require("naughty")

--
-- Functions for debugging
--
function dbg(vars)
    local text = ""
    for i=1, #vars do text = text .. vars[i] .. " | " end
    naughty.notify({ text = text, timeout = 0 })
end

-- vim: set tw=80 ts=2 sw=2 et:
