--[[
    fadeout.lua - Fadeout animation.
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

local Timer = require("ash.timer")

return {
    destination = {
        {
            id = "-110",
            blend = 1,
            loop = 1000,
            timer = Timer.Fadeout,
            dst = {
                { time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0 },
                { time = 1000, a = 255 }
            }
        }
    }
}
