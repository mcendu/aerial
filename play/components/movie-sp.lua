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

local Component = require("ash.skin")
local Timer = require("ash.timer")

local function movie(centerX, centerY)
    return {
        bga = { id = "movie" },
        destination = {
            {
                id = "movie",
                loop = 1000,
                dst = {
                    { time = 0, x = centerX - 320, y = centerY - 240, w = 640, h = 480 }
                }
            }
        }
    }
end

local function loadtimeText(id, centerX, anchorY, height)
    return {
        destination = {
            {
                id = id,
                op = {80},
                loop = 1000,
                blend = 2,
                dst = {
                    { time = 667, x = centerX, y = anchorY, w = 640, h = height, a = 0 },
                    { time = 1000, a = 255 }
                }
            },
            {
                id = id,
                timer = Timer.Ready,
                loop = -1,
                blend = 2,
                dst = {
                    { time = 0, x = centerX, y = anchorY, w = 640, h = height, a = 255 },
                    { time = 333, a = 0 }
                }
            }
        }
    }
end

local function loadtimeTitle(centerX, centerY)
    local c = Component:new {
        text = {
            { id = "load_title", font = "ja", size = 48, align = 1, ref = 10 },
            { id = "load_subtitle", font = "ja", size = 24, align = 1, ref = 11 },
            { id = "load_genre", font = "ja", size = 24, align = 1, ref = 13 },
            { id = "load_artist", font = "ja", size = 24, align = 1, ref = 14 },
            { id = "load_subartist", font = "ja", size = 24, align = 1, ref = 15 },
        }
    }

    c:addComponent(loadtimeText("load_genre", centerX, centerY + 150, 24))

    c:addComponent(loadtimeText("load_title", centerX, centerY + 30, 48))
    c:addComponent(loadtimeText("load_subtitle", centerX, centerY, 24))

    c:addComponent(loadtimeText("load_artist", centerX, centerY - 150, 24))
    c:addComponent(loadtimeText("load_subartist", centerX, centerY - 180, 24))

    return c
end

return function(centerX, centerY)
    local c = Component:new {
        image = {
            { id = "movie-frame", src = 0, x = 1184, y = 1472, w = 704, h = 512 },
        },
        destination = {
            {
                id = "movie-frame",
                dst = {
                    { x = centerX - 352, y = centerY - 256, w = 704, h = 512 },
                }
            }
        }
    }

    c:addComponent(movie(centerX, centerY))
    c:addComponent(loadtimeTitle(centerX, centerY))

    return c
end
