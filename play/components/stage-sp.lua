--[[
    stageframe-sp.lua -- Draws the playfield.
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

return function(side)
    local stage_origin = 0
    local notes_origin = 0
    local gauge_origin = 0
    local progress_origin = 0

    if side == 0 then
        stage_origin = 10
        notes_origin = stage_origin + 60
        gauge_origin = stage_origin + 35
        progress_origin = stage_origin + 15
    else
        stage_origin = 1920 - 586
        notes_origin = stage_origin + 56
        gauge_origin = stage_origin + 541
        progress_origin = stage_origin + 549
    end

    local c = Component:new()

    c:addComponent(require("components.stageframe-sp")(stage_origin, side))
    c:addComponent(require("components.notes-textures"))
    c:addComponent(require("components.notes-7k")(notes_origin, 370, side))
    c:addComponent(require("components.progress")(progress_origin, 370))

    c:addComponent(require("components.cover-sp")(notes_origin))
    c:addComponent(require("components.judge")(notes_origin + 230, 490))
    c:addComponent(require("components.gauge")(side, gauge_origin, 170))

    return c
end
