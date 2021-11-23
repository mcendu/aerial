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
                { name = "LEFT", op = 920 },
                { name = "RIGHT", op = 921 }
            }
        }
    },
    filepath = {
        { name = "BACKGROUND", path = "textures/bg/*.png" },
        { name = "NOTE", path = "textures/note/*.png" },
        { name = "JUDGE FONT", path = "textures/judge/*.png" },
        { name = "HIDDEN+ COVER", path = "textures/lanecover/*.png" },
        { name = "LIFT COVER", path = "textures/lift/*.png" },
        { name = "GAUGE", path = "textures/gauge/*.png" }
    },
    playerSide = function()
        if skin_config.option["PLAYER SIDE"] == 920 then
            return SIDE_1P
        elseif skin_config.option["PLAYER SIDE"] == 921 then
            return SIDE_2P
        end
    end
}
