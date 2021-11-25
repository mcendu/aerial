--[[
    light.lua -- Column lighting.
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

local Timer = require("ash.timer")

local width = {
    scratch = 100,
    white = 60,
    black = 40
}

local lightHeight = 350

local sprites = {
    source = {
        { id = "light", path = "textures/light/*.png" }
    },
    image = {
        { id = "light-scratch", src = "light", x = 0, y = 0, w = 100, h = 350 },
        { id = "light-white", src = "light", x = 120, y = 0, w = 60, h = 350 },
        { id = "light-black", src = "light", x = 200, y = 0, w = 40, h = 350 },
    }
}

local function draw(anchorX, anchorY, relativeX, layout, scratchOn, scratchOff)
    local c = {
        destination = {}
    }

    for i, col in ipairs(layout) do
        local sprite = "light-" .. col
        local timerOn
        local timerOff

        if col == "scratch" then
            timerOn = scratchOn
            timerOff = scratchOff
        else
            timerOn = scratchOn + i
            timerOff = scratchOff + i
        end

        table.insert(c.destination, {
            id = sprite,
            timer = timerOn,
            loop = 100,
            dst = {
                {
                    time = 0,
                    x = anchorX + relativeX[i],
                    y = anchorY,
                    w = width[col],
                    h = 0
                },
                {
                    time = 100,
                    h = lightHeight
                }
            }
        })
        table.insert(c.destination, {
            id = sprite,
            timer = timerOff,
            loop = -1,
            dst = {
                {
                    time = 0,
                    x = anchorX + relativeX[i],
                    y = anchorY,
                    w = width[col],
                    h = lightHeight
                },
                {
                    time = 100,
                    x = anchorX + relativeX[i] + width[col] / 2,
                    w = 0
                }
            }
        })
    end

    return c
end

return {
    sprites = sprites,
    draw = draw
}
