--[[
    stageframe-sp.lua -- Background of the playfield.
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

return function(originX, side)
    local c = {}

    local player_prefix
    local progress_border_x = 0
    local progress_tborder_x = 0

    if side == 0 then
        player_prefix = "1p-"
        progress_border_x = originX + 38
        progress_tborder_x = progress_border_x - 30
    else
        player_prefix = "2p-"
        progress_border_x = originX + 535
        progress_tborder_x = progress_border_x + 1
    end

    c.image = {
        { id = "1p-stage", src = 0, x = 0, y = 0, w = 576, h = 960 },
        { id = "2p-stage", src = 0, x = 576, y = 0, w = 576, h = 960 },

        { id = "progress-border", src = 0, x = 1792, y = 128, w = 32, h = 594 },
        { id = "1p-progress-tborder", src = 0, x = 1824, y = 128, w = 32, h = 64 },
        { id = "2p-progress-tborder", src = 0, x = 1824, y = 192, w = 32, h = 64 },
    }

    c.destination = {
        {
            id = player_prefix .. "stage",
            blend = 1,
            loop = 333,
            dst = {
                { time = 0, x = originX, y = 1080, w = 576, h = 960, acc = 2 },
                { time = 333, y = 120 }
            }
        },
        {
            id = "progress-border",
            blend = 1,
            loop = 667,
            dst = {
                { time = 333, x = progress_border_x, y = 388, w = 32, h = 0 },
                { time = 667, h = 594 }
            }
        },
        {
            id = player_prefix .. "progress-tborder",
            blend = 1,
            loop = 750,
            dst = {
                { time = 667, x = progress_tborder_x, y = 983, w = 32, h = 64, a = 0 },
                { time = 750, a = 255 }
            }
        }
    }

    return c
end
