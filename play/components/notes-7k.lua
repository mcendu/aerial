--[[
    notes-7k.lua -- Displays incoming notes.
    Part of Aerial, a skin for beatoraja.
    Copyright (C) 2021 McEndu.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

local Component = require("ash.skin")

return function(anchorX, anchorY, side)
    -- horizontal position of notes relative to the leftmost column.
    local relativeX
    local relativeX_1p = {100, 160, 200, 260, 300, 360, 400, 0}
    local relativeX_2p = {0, 60, 100, 160, 200, 260, 300, 360}

    local layout = {
        "white",
        "black",
        "white",
        "black",
        "white",
        "black",
        "white",
        "scratch"
    }

    if (side == 0) then
        relativeX = relativeX_1p
    else
        relativeX = relativeX_2p
    end

    local c = Component:new()

    c.destination = {
        {
            id = "judge-line",
            offsets = {3},
            loop = 1333,
            dst = {
                { time = 1000, x = anchorX + 230, y = anchorY, w = 0, h = 24, acc = 2 },
                { time = 1333, x = anchorX, w = 460 }
            }
        }
    }

    c:addComponent(require("components.light-sp")(anchorX, anchorY, relativeX, layout))
    c:addComponent(require("components.notes")(anchorX, anchorY, relativeX, layout))

    return c
end
