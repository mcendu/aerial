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

local Skin = require("ash.skin")

local options = require("config.options-sp")

local version = "0.1"

local header = {
    type = Skin.SKINTYPE_7K,
    name = "aerial -- 7K play " + version,
    w = 1920,
    h = 1080,
    loadend = 3000,
    playstart = 1000,
    scene = 3600000,
    input = 1000,
    close = 2000,
    fadeout = 1000,
    property = options.property,
    filepath = options.filepath
}

local function main()
    local s = Skin:new(header)

    s.source = {
        { id = 0, path = "textures/frame-sp.png" },
        { id = 1, path = "textures/common.png" }
    }

    s.font = {
        { id = "latin", path = "fonts/Exo2-Regular.ttf" },
        { id = "latin-italic", path = "fonts/Exo2-Italic.ttf" },
        { id = "latin-bold", path = "fonts/Exo2-Bold.ttf" },
        { id = "ja", path = "fonts/SourceHanSansJP-Regular.otf" },
        { id = "ja-bold", path = "fonts/SourceHanSansJP-Bold.otf" },
    }

    s:addComponent(require("components.background"))

    s:addComponent(require("components.stage-sp")(options.playerSide()))

    if options.graphOn() then
        s:addComponent(require("components.graph-sp")(options.playerSide()))
    end

    s:addComponent(require("components.movie-sp")(960, 660))
    s:addComponent(require("components.score")(options.playerSide()))

    s:addComponent(require("components.fadeout"))
    s:addComponent(require("components.fail"))

    return s
end

return {
    header = header,
    main = main
}
