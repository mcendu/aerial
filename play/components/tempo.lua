--[[
    tempo.lua -- Displays tempo.
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

local startTime = 1000
local kTime1 = startTime + 200
local kTime2 = kTime1 + 200

return {
    image = {
        { id = "label-min", src = 1, x = 0, y = 224, w = 64, h = 32 },
        { id = "label-bpm", src = 1, x = 0, y = 256, w = 64, h = 32 },
        { id = "label-max", src = 1, x = 0, y = 288, w = 64, h = 32 },
    },
    value = {
        { id = "tempo", src = 1, x = 0, y = 0, w = 440, h = 40, divx = 11, digit = 3, ref = 160 },
        { id = "min-tempo", src = 1, x = 0, y = 96, w = 264, h = 32, divx = 11, digit = 3, ref = 91 },
        { id = "max-tempo", src = 1, x = 0, y = 96, w = 264, h = 32, divx = 11, digit = 3, ref = 90 },
    },
    destination = {
        {
            id = "label-bpm",
            blend = 1,
            loop = kTime1,
            dst = {
                { time = startTime, x = 960 - 32, y = 20, w = 64, h = 32, a = 0 },
                { time = kTime1, a = 255 }
            }
        },
        {
            id = "tempo",
            blend = 1,
            loop = kTime1,
            dst = {
                { time = startTime, x = 900, y = 60, w = 40, h = 40, a = 0 },
                { time = kTime1, a = 255 }
            }
        },
        {
            id = "label-min",
            blend = 1,
            loop = kTime2,
            op = {177},
            dst = {
                { time = kTime1, x = 840 - 32, y = 20, w = 64, h = 32, a = 0 },
                { time = kTime2, a = 255 }
            }
        },
        {
            id = "label-max",
            blend = 1,
            loop = kTime2,
            op = {177},
            dst = {
                { time = kTime1, x = 1080 - 32, y = 20, w = 64, h = 32, a = 0 },
                { time = kTime2, a = 255 }
            }
        },
        {
            id = "min-tempo",
            blend = 1,
            loop = kTime2,
            op = {177},
            dst = {
                { time = kTime1, x = 840 - 36, y = 60, w = 24, h = 32, a = 0 },
                { time = kTime2, a = 255 }
            }
        },
        {
            id = "max-tempo",
            blend = 1,
            loop = kTime2,
            op = {177},
            dst = {
                { time = kTime1, x = 1080 - 36, y = 60, w = 24, h = 32, a = 0 },
                { time = kTime2, a = 255 }
            }
        }
    }
}
