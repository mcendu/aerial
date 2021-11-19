--[[
    score.lua -- Displays score and other info.
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

local background = {
    image = {
        { id = "1p-score-bg", src = 0, x = 1152, y = 768, w = 640, h = 128 },
        { id = "2p-score-bg", src = 0, x = 1152, y = 896, w = 640, h = 128 },
        { id = "1p-score-uborder", src = 0, x = 1920, y = 128, w = 403, h = 3 },
        { id = "2p-score-uborder", src = 0, x = 1920, y = 128, w = 403, h = 3 },
        { id = "1p-score-rborder", src = 0, x = 1920, y = 192, w = 256, h = 122 },
        { id = "2p-score-lborder", src = 0, x = 1920, y = 192, w = 256, h = 122 }
    },
    destination = {
        {
            id = "1p-score-bg",
            blend = 1,
            loop = 500,
            dst = {
                { time = 333, x = 0, y = 0, w = 640, h = 128, a = 0 },
                { time = 500, a = 255 }
            }
        },
        {
            id = "2p-score-bg",
            blend = 1,
            loop = 500,
            dst = {
                { time = 333, x = 1280, y = 0, w = 640, h = 128, a = 0 },
                { time = 500, a = 255 }
            }
        },
        {
            id = "1p-score-uborder",
            loop = 167,
            dst = {
                { time = 0, x = -2, y = 128, w = 0, h = 3, },
                { time = 167, w = 403 }
            }
        },
        {
            id = "2p-score-uborder",
            loop = 167,
            dst = {
                { time = 0, x = 1922, y = 128, w = 0, h = 3, },
                { time = 167, w = -403 }
            }
        },
        {
            id = "1p-score-rborder",
            loop = 333,
            blend = 1,
            dst = {
                { time = 167, x = 403, y = 8, w = 256, h = 122, a = 0 },
                { time = 333, a = 255 }
            }
        },
        {
            id = "2p-score-lborder",
            loop = 333,
            blend = 1,
            dst = {
                { time = 167, x = 1517, y = 8, w = -256, h = 122, a = 0 },
                { time = 333, a = 255 }
            }
        }
    }
}

local function scoreDisplay(side)
    local originScore = 0

    if (side == 0) then
        originScore = 40
    else
        originScore = 1520
    end

    return {
        image = {
            -- Labels
            { id = "label-exscore", src = 1, x = 0, y = 352, w = 112, h = 32 },
            { id = "label-speed", src = 1, x = 0, y = 384, w = 80, h = 32 },
            -- Decimal points
            { id = "speed-point", src = 1, x = 288, y = 64, w = 6, h = 32 }
        },
        value = {
            { id = "exscore", src = 1, x = 0, y = 0, w = 400, h = 40, divx = 10, digit = 5, ref = 101 },
            { id = "speed", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 1, ref = 310 },
            { id = "speed-decimal", src = 1, x = 0, y = 64, w = 264, h = 32, divx = 11, digit = 2, ref = 311 },
        },
        destination = {
            -- Score (EX score)
            {
                id = "label-exscore",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore, y = 70, w = 112, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            {
                id = "exscore",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore, y = 30, w = 40, h = 40, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            -- Speed (Hi-speed)
            {
                id = "label-speed",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore + 240, y = 70, w = 80, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            {
                id = "speed",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore + 280, y = 30, w = 24, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            {
                id = "speed-point",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore + 304, y = 30, w = 6, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            {
                id = "speed-decimal",
                blend = 1,
                loop = 1000,
                dst = {
                    { time = 800, x = originScore + 313, y = 30, w = 24, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            }
        }
    }
end

return function(side)
    local c = Component:new()

    c:addComponent(background)
    c:addComponent(scoreDisplay(side))

    return c
end
