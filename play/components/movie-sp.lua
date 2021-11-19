--[[
    movie-sp.lua -- Displays the movie of a BMS.
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

return function(centerX, centerY)
    return {
        bga = { id = "movie" },
        image = {
            { id = "movie-frame", src = 0, x = 1184, y = 1472, w = 704, h = 512 },
        },
        destination = {
            {
                id = "movie-frame",
                loop = 667,
                dst = {
                    { time = 333, x = centerX - 352, y = centerY, w = 704, h = 0, acc = 2 },
                    { time = 667, y = centerY - 256, h = 512 }
                }
            },
            {
                id = "movie",
                timer = 41,
                blend = 2,
                dst = {
                    { time = 0, x = centerX - 320, y = centerY - 240, w = 640, h = 480 }
                }
            }
        }
    }
end
