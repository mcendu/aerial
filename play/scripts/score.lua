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

return function()
    local originScore = 40

    return {
        image = {
            -- Background and decorations
            { id = "1p-score-bg", src = 0, x = 1152, y = 768, w = 640, h = 128 },
            { id = "2p-score-bg", src = 0, x = 1152, y = 896, w = 640, h = 128 },
            -- Labels
            { id = "label-exscore", src = 1, x = 0, y = 352, w = 112, h = 32 },
            { id = "label-speed", src = 1, x = 0, y = 384, w = 80, h = 32 },
            -- Decimal points
            { id = "speed-point", src = 1, x = 288, y = 64, w = 6, h = 32 }
        },
        value = {
            { id = "exscore", src = 1, x = 0, y = 0, w = 400, h = 40, divx = 10, digit = 5, ref = 101 },
            { id = "speed", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 1, ref = 310 },
            { id = "speed-decimal", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 2, ref = 311 },
        },
        destination = {
            -- Background
            {
                id = "1p-score-bg",
                blend = 1,
                loop = 800,
                dst = {
                    { time = 500, x = 0, y = 0, w = 640, h = 128, a = 0 },
                    { time = 800, a = 255 }
                }
            },
            {
                id = "2p-score-bg",
                blend = 1,
                loop = 800,
                dst = {
                    { time = 500, x = 1280, y = 0, w = 640, h = 128, a = 0 },
                    { time = 800, a = 255 }
                }
            },
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
                    { time = 800, x = originScore + 310, y = 30, w = 24, h = 32, a = 0 },
                    { time = 1000, a = 255 }
                }
            }
        }
    }
end
