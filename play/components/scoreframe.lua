--[[
    score.lua -- Draws the background for score display.
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

return {
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
