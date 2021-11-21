--[[
    progress.lua -- Displays song progress.
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

return function(anchorX, anchorY)
    return {
        slider = {
            { id = "song-progress", src = 1, x = 192, y = 800, w = 12, h = 32, angle = 2, range = 598, type = 6 }
        },
        graph = {
            { id = "load-progress", src = 1, x = 192, y = 800, w = 12, h = 32, type = 102 }
        },
        destination = {
            {
                id = "load-progress",
                op = {80},
                loop = -1,
                dst = {
                    { time = 667, x = anchorX, y = anchorY, w = 12, h = 0, acc = 2 },
                    { time = 1000, h = 630 }
                }
            },
            {
                id = "load-progress",
                op = {80},
                loop = 1000,
                blend = 1,
                dst = {
                    { time = 1000, x = anchorX, y = anchorY, w = 12, h = 630, a = 255, acc = 1 },
                    { time = 1250, a = 192, acc = 2 },
                    { time = 1500, a = 128, acc = 1 },
                    { time = 1750, a = 192, acc = 2 },
                    { time = 2000, a = 255 }
                }
            },
            {
                id = "load-progress",
                timer = 40,
                loop = -1,
                blend = 1,
                dst = {
                    { time = 0, x = anchorX, y = anchorY, w = 12, h = 630, a = 255, acc = 2 },
                    { time = 1000, y = anchorY + 598, h = 32, a = 128 },
                }
            },
            {
                id = "song-progress",
                timer = 140,
                op = {81},
                blend = 1,
                dst = {
                    { time = 0, x = anchorX, y = anchorY + 598, w = 12, h = 32, a = 255, acc = 2 },
                    { time = 1000, a = 128 }
                }
            }
        }
    }
end
