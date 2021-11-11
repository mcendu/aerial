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

return function(anchorX)
    return {
        source = {
            { id = 3, path = "textures/lanecover/_default.png" }
        },
        slider = {
            { id = "lanecover", src = 3, x = 0, y = 0, w = 460, h = 710, angle = 2, range = 710, type = 4 }
        },
        destination = {
            {
                id = "lanecover",
                dst = {
                    { x = anchorX, y = 1080, w = 460, h = 710 }
                }
            }
        }
    }
end
