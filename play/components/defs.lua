--[[
    defs.lua -- Texture definitions.
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

--[[
    NOTE: This file is probably never going to be used. Once all
    portions appear elsewhere, this would be deleted.
]]

local source = {
    { id = 0, path = "textures/frame-sp.png" },
    { id = 1, path = "textures/note/default.png" }
}

local image = {
    { id = "1p-stage", src = 0, x = 0, y = 0, w = 576, h = 960 },
    { id = "2p-stage", src = 0, x = 576, y = 0, w = 576, h = 960 },

    { id = "1p-graph", src = 0, x = 576, y = 1024, w = 576, h = 960 },
    { id = "2p-graph", src = 0, x = 576, y = 1024, w = 576, h = 960 },

    { id = "1p-info", src = 0, x = 1152, y = 768, w = 640, h = 128 },
    { id = "2p-info", src = 0, x = 1152, y = 896, w = 640, h = 128 },

    { id = "movie-frame", src = 0, x = 1184, y = 1472, w = 704, h = 512 },
    { id = "bpm-frame", src = 0, x = 1152, y = 1024, w = 640, h = 128 },

    -- Decorative features

    { id = "stage-border", src = 0, x = 1216, y = 0, w = 480, h = 736 },

    { id = "progress-border", src = 0, x = 1792, y = 128, w = 32, h = 608 },
    { id = "1p-progress-tborder", src = 0, x = 1824, y = 128, w = 32, h = 64 },
    { id = "2p-progress-tborder", src = 0, x = 1824, y = 192, w = 32, h = 64 },

    { id = "title-bborder", src = 0, x = 1792, y = 64, w = 640, h = 32},
    { id = "title-lborder", src = 0, x = 1792, y = 0, w = 96, h = 64},
    { id = "title-rborder", src = 0, x = 1920, y = 0, w = 96, h = 64},

    { id = "1p-info-tborder", src = 0, x = 1920, y = 160, w = 448, h = 32},
    { id = "2p-info-tborder", src = 0, x = 1920, y = 128, w = 448, h = 32},
    { id = "1p-info-rborder", src = 0, x = 2176, y = 192, w = 256, h = 128},
    { id = "2p-info-lborder", src = 0, x = 1920, y = 192, w = 256, h = 128},

    { id = "bpm-frame-tborder", src = 0, x = 1920, y = 352, w = 256, h = 32},
    { id = "bpm-frame-lborder", src = 0, x = 1920, y = 384, w = 192, h = 128},
    { id = "bpm-frame-rborder", src = 0, x = 2176, y = 384, w = 192, h = 128},

    { id = "graph-baseline", src = 0, x = 2048, y = 1152, w = 128, h = 32},
    { id = "1p-graph-lbaseline", src = 0, x = 2048, y = 1216, w = 96, h = 64},
    { id = "2p-graph-rbaseline", src = 0, x = 2176, y = 1216, w = 96, h = 64},

    -- Labels

    { id = "l-min", src = 0, x = 1920, y = 768, w = 64, h = 32},
    { id = "l-bpm", src = 0, x = 1920, y = 800, w = 64, h = 32},
    { id = "l-max", src = 0, x = 1920, y = 832, w = 64, h = 32},

    { id = "l-score", src = 0, x = 1920, y = 896, w = 128, h = 32},
    { id = "l-speed", src = 0, x = 1920, y = 928, w = 128, h = 32},
    { id = "l-grade", src = 0, x = 1920, y = 960, w = 128, h = 32},

    -- Difficulty badges

    { id = "diff-beginner", src = 0, x = 2048, y = 768, w = 224, h = 32},
    { id = "diff-normal", src = 0, x = 2048, y = 832, w = 224, h = 32},
    { id = "diff-hyper", src = 0, x = 2048, y = 896, w = 224, h = 32},
    { id = "diff-another", src = 0, x = 2048, y = 960, w = 224, h = 32},
    { id = "diff-insane", src = 0, x = 2048, y = 1024, w = 224, h = 32},

    -- Gauges

    { id = "1p-gauge-bg", src = 0, x = 2560, y = 0, w = 550, h = 50},

    { id = "1p-gauge-normal", src = 0, x = 2560, y = 64, w = 550, h = 50},
    { id = "1p-gauge-hard", src = 0, x = 2560, y = 128, w = 550, h = 50},
    { id = "1p-gauge-exhard", src = 0, x = 2560, y = 192, w = 550, h = 50},
    { id = "1p-gauge-easy", src = 0, x = 2560, y = 256, w = 550, h = 50},
    { id = "1p-gauge-aeasy", src = 0, x = 2560, y = 320, w = 550, h = 50},

    { id = "1p-gauge-normal-empty", src = 0, x = 3200, y = 64, w = 550, h = 50},
    { id = "1p-gauge-hard-empty", src = 0, x = 3200, y = 128, w = 550, h = 50},
    { id = "1p-gauge-exhard-empty", src = 0, x = 3200, y = 192, w = 550, h = 50},
    { id = "1p-gauge-easy-empty", src = 0, x = 3200, y = 256, w = 550, h = 50},
    { id = "1p-gauge-aeasy-empty", src = 0, x = 3200, y = 320, w = 550, h = 50},

    { id = "2p-gauge-bg", src = 0, x = 2560, y = 384, w = 550, h = 50},

    { id = "2p-gauge-normal", src = 0, x = 2560, y = 448, w = 550, h = 50},
    { id = "2p-gauge-hard", src = 0, x = 2560, y = 512, w = 550, h = 50},
    { id = "2p-gauge-exhard", src = 0, x = 2560, y = 576, w = 550, h = 50},
    { id = "2p-gauge-easy", src = 0, x = 2560, y = 640, w = 550, h = 50},
    { id = "2p-gauge-aeasy", src = 0, x = 2560, y = 704, w = 550, h = 50},

    { id = "2p-gauge-normal-empty", src = 0, x = 3200, y = 448, w = 550, h = 50},
    { id = "2p-gauge-hard-empty", src = 0, x = 3200, y = 512, w = 550, h = 50},
    { id = "2p-gauge-exhard-empty", src = 0, x = 3200, y = 576, w = 550, h = 50},
    { id = "2p-gauge-easy-empty", src = 0, x = 3200, y = 640, w = 550, h = 50},
    { id = "2p-gauge-aeasy-empty", src = 0, x = 3200, y = 704, w = 550, h = 50},
}

return function()
    return {
        source = source,
        image = image
    }
end
