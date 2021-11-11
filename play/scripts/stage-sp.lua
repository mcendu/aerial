--[[
    stage-sp.lua
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

return function(side)
    local c = {}

    local player_prefix
    local progress_border_x = 0
    local progress_tborder_x = 0
    local stage_x = 0

    if side == 0 then
        player_prefix = "1p-"
        progress_border_x = 48
        progress_tborder_x = progress_border_x - 33
        stage_x = 10
    else
        player_prefix = "2p-"
        progress_border_x = 1920 - 3 - 48
        progress_tborder_x = progress_border_x + 1
        stage_x = 1920 - 10 - 576
    end

    -- Textures
    c.image = {
        { id = "1p-stage", src = 0, x = 0, y = 0, w = 576, h = 960 },
        { id = "2p-stage", src = 0, x = 576, y = 0, w = 576, h = 960 },

        { id = "progress-border", src = 0, x = 1792, y = 128, w = 32, h = 608 },
        { id = "1p-progress-tborder", src = 0, x = 1824, y = 128, w = 32, h = 64 },
        { id = "2p-progress-tborder", src = 0, x = 1824, y = 192, w = 32, h = 64 },
    }

    -- Sprites
    c.destination = {
        {
            id = player_prefix .. "stage",
            blend = 1,
            dst = {
                { time = 0, x = stage_x, y = -930, w = 576, h = 960, acc = 2 },
                { time = 333, y = 0 }
            }
        },
        {
            id = "progress-border",
            blend = 1,
            dst = {
                { time = 0, x = progress_border_x, y = 98, w = 32, h = 608, a = 0 },
                { time = 333 },
                { time = 416, a = 255 }
            }
        },
        {
            id = player_prefix .. "progress-tborder",
            blend = 1,
            dst = {
                { time = 0, x = progress_tborder_x, y = 97 - 64, w = 32, h = 64, a = 0 }
            }
        }
    }

    return c
end
