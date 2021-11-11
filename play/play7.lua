--[[
    play7.lua -- 7K play skin.
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

local Skin = require("scripts.ash.skin")

local SIDE_1P = 0
local SIDE_2P = 1

local header = {
    type = Skin.SKINTYPE_7K,
    name = "aerial -- 7K play 1.0.0",
    w = 1920,
    h = 1080,
    loadend = 3000,
    playstart = 1000,
    scene = 3600000,
    input = 1000,
    close = 1000,
    fadeout = 1000,
    property = {},
}

local function main()
    local s = Skin:new(header)

    s.source = {
        { id = 0, path = "textures/frame-sp.png" },
        { id = 1, path = "textures/common.png" }
    }

    s:loadComponent(skin_config.get_path("scripts/stageframe-sp.lua"), SIDE_1P)

    s:loadComponent(skin_config.get_path("scripts/notes-textures.lua"))
    s:loadComponent(skin_config.get_path("scripts/notes-7k.lua"), 70, 370, SIDE_1P)

    s:loadComponent(skin_config.get_path("scripts/cover-sp.lua"), 70)

    s:loadComponent(skin_config.get_path("scripts/judge.lua"), 290, 490)

    return s
end

return {
    header = header,
    main = main
}
