--[[
    light-sp.lua -- Column lighting.
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
local LightBase = require("components.light")

return function(anchorX, anchorY, relativeX, layout)
    local c = Component:new()

    c:addComponent(LightBase.sprites)
    c:addComponent(LightBase.draw(anchorX, anchorY, relativeX, layout,
        Timer.ScratchOn1p, Timer.ScratchOff1p))

    return c
end
