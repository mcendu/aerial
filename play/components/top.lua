--[[
    top.lua -- Displays song information.
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

local difficulty = require("components.difficulty")

local centerX = 960
local baselineY = 1024

local decorations = {
    image = {
        { id = "tophud-bborder", src = 0, x = 1792, y = 93, w = 640, h = 3 },
        { id = "tophud-rborder", src = 0, x = 1920, y = 0, w = 96, h = 64 }
    },
    destination = {
        {
            id = "tophud-bborder",
            loop = 500,
            dst = {
                { time = 333, x = centerX - 320, y = baselineY, w = 640, h = 3, a = 0 },
                { time = 500, a = 255 }
            }
        },
        {
            id = "tophud-rborder",
            loop = 333,
            dst = {
                { time = 0, x = centerX, y = baselineY, w = -94, h = 64, a = 0, acc = 2 },
                { time = 333, x = centerX - 300, a = 255 }
            }
        },
        {
            id = "tophud-rborder",
            loop = 333,
            dst = {
                { time = 0, x = centerX, y = baselineY, w = 94, h = 64, a = 0, acc = 2 },
                { time = 333, x = centerX + 300, a = 255 }
            }
        }
    }
}

local function information(field)
    return {
        text = {
            { id = "information", font = "ja", size = 24, align = 1, ref = field }
        },
        destination = {
            {
                id = "information",
                loop = 1000,
                dst = {
                    { time = 500, x = centerX, y = baselineY + 12, w = 640, h = 24, a = 0 },
                    { time = 1000, a = 255 }
                }
            }
        }
    }
end

return function(side)
    local c = Component:new(decorations)

    local diffLabelX

    if side == 0 then
        diffLabelX = 570
    else
        diffLabelX = 1920 - 770
    end

    c:addComponent(information(10))
    c:addComponent(difficulty.image)
    c:addComponent(difficulty.destination(diffLabelX, 976))

    return c
end
