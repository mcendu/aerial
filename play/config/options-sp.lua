--[[
    options-sp.lua -- Definition of options.
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

local SIDE_1P = 0
local SIDE_2P = 1

return {
    property = {
        {
            name = "PLAYER SIDE", item = {
                { name = "LEFT", op = 900 },
                { name = "RIGHT", op = 901 }
            }
        },
        {
            name = "TARGET DIFFERENCE", item = {
                { name = "HIDE", op = 902 },
                { name = "SHOW", op = 903 }
            }
        },
        {
            name = "EARLY/LATE", item = {
                { name = "HIDE", op = 904 },
                { name = "EARLY/LATE", op = 905 },
                { name = "TIME DIFF", op = 906 }
            }
        },
        {
            name = "GRAPH", item = {
                { name = "HIDE", op = 907 },
                { name = "SHOW", op = 908 }
            }
        }
    },
    filepath = {
        { name = "BACKGROUND", path = "textures/bg/*.png" },
        { name = "NOTE", path = "textures/note/*.png" },
        { name = "LIGHTING", path = "textures/light/*.png" },
        { name = "JUDGE FONT", path = "textures/judge/*.png" },
        { name = "LANE COVER", path = "textures/lanecover/*.png" },
        { name = "LIFT COVER", path = "textures/lift/*.png" },
        { name = "GAUGE", path = "textures/gauge/*.png" }
    },
    playerSide = function()
        if skin_config.option["PLAYER SIDE"] == 900 then
            return SIDE_1P
        elseif skin_config.option["PLAYER SIDE"] == 901 then
            return SIDE_2P
        end
    end,
    graphOn = function()
        return skin_config.option["GRAPH"] == 908
    end
}
