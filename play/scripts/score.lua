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
            { id = "label-exscore", src = 1, x = 0, y = 352, w = 112, h = 32 },
            { id = "label-speed", src = 1, x = 0, y = 384, w = 80, h = 32 }
        },
        value = {
            { id = "exscore", src = 1, x = 0, y = 0, w = 400, h = 40, divx = 10, digit = 5, ref = 101 },
            { id = "speed", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 1, ref = 310 },
            { id = "speed-decimal", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 2, ref = 311 },
        },
        destination = {
            -- Score (EX score)
            {
                id = "label-exscore",
                dst = {
                    { x = originScore, y = 70, w = 112, h = 32 }
                }
            },
            {
                id = "exscore",
                dst = {
                    { x = originScore, y = 30, w = 40, h = 40 }
                }
            },
            -- Speed (Hi-speed)
            {
                id = "label-speed",
                dst = {
                    { x = originScore + 240, y = 70, w = 80, h = 32 }
                }
            },
            {
                id = "speed",
                dst = {
                    { x = originScore + 280, y = 30, w = 24, h = 32 }
                }
            },
            {
                id = "decimal-point",
                dst = {
                    { x = originScore + 304, y = 30, w = 6, h = 32 }
                }
            },
            {
                id = "speed-decimal",
                dst = {
                    { x = originScore + 310, y = 30, w = 24, h = 32 }
                }
            }
        }
    }
end
