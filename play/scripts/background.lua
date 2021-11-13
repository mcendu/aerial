--[[
    background.lua -- Draws the background image.
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
    return {
        source = {
            { id = "background", path = "textures/bg/_default.png" }
        },
        image = {
            { id = "background", src = "background", x = 0, y = 0, w = -1, h = -1}
        },
        destination = {
            {
                id = "background",
                loop = 1000,
                dst = {
                    { time = 500, x = 0, y = 0, w = 1920, h = 1080, r = 0, g = 0, b = 0 },
                    { time = 1000, r = 128, g = 128, b = 128 }
                }
            }
        }
    }
end
