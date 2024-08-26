-- pcall(require, "luarocks.loader")

-- local gears = require("gears")
-- local awful = require("awful")
-- require("awful.autofocus")


-- local function update_border(c)
--     if c.maximized then
--         c.border_width = 0
--     else
--         c.border_width = 2
--         if client.focus == c then
--             c.border_color = "#7C6F64"
--         else
--             c.border_color = "#EBDBB2"
--         end
--     end
-- end


-- -- no graphic bugs when resizing windows
-- client.connect_signal("manage", function (c)
--     c.shape = gears.shape.rectangle 
--     update_border(c)
-- end)

-- -- { border color depending on focus
-- client.connect_signal("focus", function(c)
--     if not c.maximized then
--         c.border_color = "#7C6F64" -- focused window
--     end
-- end)

-- client.connect_signal("unfocus", function(c)
--     if not c.maximized then
--         c.border_color = "#EBDBB2" -- unfocused window
--     end
-- end)
-- -- }


-- -- no border for maximised window
-- client.connect_signal("property::maximized", function(c)
--     update_border(c)
-- end)


pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

local function update_border(c)
    -- Sprawdź, na którym ekranie znajduje się okno
    local screen_index = c.screen.index
    
    -- Jeśli okno jest na drugim ekranie (screen_index == 2), usuń obramowanie
    if screen_index == 2 then
        c.border_width = 0
    else
        if c.maximized then
            c.border_width = 0
        else
            c.border_width = 2
            if client.focus == c then
                c.border_color = "#7C6F64"
            else
                c.border_color = "#EBDBB2"
            end
        end
    end
end

-- no graphic bugs when resizing windows
client.connect_signal("manage", function (c)
    c.shape = gears.shape.rectangle 
    update_border(c)
end)

-- { border color depending on focus
client.connect_signal("focus", function(c)
    if not c.maximized then
        update_border(c)
    end
end)

client.connect_signal("unfocus", function(c)
    if not c.maximized then
        update_border(c)
    end
end)
-- }

-- no border for maximised window
client.connect_signal("property::maximized", function(c)
    update_border(c)
end)


