--[[
    cover-sp.lua -- Draws the lane cover.
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

local function coverValue(name, centerX, anchorY, op, offsets)
    return {
        destination = {
            {
                id = name,
                loop = 1200,
                op = op,
                offsets = offsets,
                dst = {
                    { time = 1000, x = centerX - 90, y = anchorY, w = 15, h = 20, a = 0 },
                    { time = 1200, a = 255 }
                }
            },
            {
                id = "green-number",
                loop = 1200,
                op = op,
                offsets = offsets,
                dst = {
                    { time = 1000, x = centerX + 45, y = anchorY, w = 15, h = 20,
                        r = 0x93, g = 0xd1, b = 0x98, a = 0 },
                    { time = 1200, a = 255 }
                }
            }
        }
    }
end

return function(anchorX, anchorY)
    anchorY = anchorY or 370

    local height = 1080 - anchorY

    local c = Component:new {
        source = {
            { id = "cover", path = "textures/lanecover/*.png" },
            { id = "lift", path = "textures/lift/*.png"}
        },
        slider = {
            { id = "lanecover", src = "cover", x = 0, y = 0, w = -1, h = -1, angle = 2, range = 710, type = 4 }
        },
        liftCover = {
            { id = "lift", src = "lift", x = 0, y = 0, w = -1, h = -1, disapearLine = 370 }
        },
        hiddenCover = {
            { id = "hiddencover", src = "lift", x = 0, y = 0, w = 460, h = 710, disapearLine = 370 }
        },
        value = {
            { id = "cover-amount", src = 1, x = 0, y = 128, w = 165, h = 20, divx = 11, digit = 3, ref = 14 },
            { id = "lift-amount", src = 1, x = 0, y = 128, w = 165, h = 20, divx = 11, digit = 3, ref = 314 },
            { id = "hidden-amount", src = 1, x = 0, y = 128, w = 165, h = 20, divx = 11, digit = 3, ref = 315 },
            { id = "green-number", src = 1, x = 0, y = 128, w = 165, h = 20, divx = 11, digit = 3, ref = 313 },
        },
        destination = {
            {
                id = "lanecover",
                loop = 1000,
                dst = {
                    { time = 500, x = anchorX, y = 1080 + height, w = 460, h = height, acc = 2 },
                    { time = 1000, y = 1080 }
                }
            },
            {
                id = "lift",
                loop = 750,
                dst = {
                    { time = 333, x = anchorX, y = anchorY - height * 2, w = 460, h = height, acc = 2 },
                    { time = 750, y = anchorY - height }
                }
            },
            {
                id = "hiddencover",
                loop = 1000,
                dst = {
                    { time = 500, x = anchorX, y = anchorY - height * 2, w = 460, h = height, acc = 2 },
                    { time = 1000, y = anchorY - height }
                }
            }
        }
    }

    c:addComponent(coverValue("cover-amount", anchorX + 230, 1090, {270, 271}, {4}))
    c:addComponent(coverValue("lift-amount", anchorX + 230, anchorY - 30, {270, 272}, {3}))
    c:addComponent(coverValue("hidden-amount", anchorX + 230, anchorY - 30, {270, 273}, {5}))

    return c
end
