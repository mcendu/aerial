--[[
    difficulty.lua -- Draws a level indicator.
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

local Option = require("ash.option")

local function diffIndicator(left, bottom, name, op)
    return {
        id = name,
        op = {op},
        loop = 833,
        dst = {
            { time = 667, x = left, y = bottom, w = 200, h = 32, a = 0 },
            { time = 833, a = 255 }
        }
    }
end

local image = {
    image = {
        { id = "diff-beginner", src = 1, x = 256, y = 160, w = 200, h = 32 },
        { id = "diff-normal", src = 1, x = 256, y = 224, w = 200, h = 32 },
        { id = "diff-hyper", src = 1, x = 256, y = 288, w = 200, h = 32 },
        { id = "diff-another", src = 1, x = 256, y = 352, w = 200, h = 32 },
        { id = "diff-insane", src = 1, x = 256, y = 416, w = 200, h = 32 },
        { id = "diff-unknown", src = 1, x = 768, y = 512, w = 200, h = 32 }
    },
    value = {
        { id = "difficulty", src = 1, x = 0, y = 168, w = 150, h = 20,
            divx = 10, divy = 1, digit = 2, ref = 96 }
    }
}

local function destination(left, bottom)
    return {
        destination = {
            diffIndicator(left, bottom, "diff-beginner", Option.DiffBeginner),
            diffIndicator(left, bottom, "diff-normal", Option.DiffNormal),
            diffIndicator(left, bottom, "diff-hyper", Option.DiffHyper),
            diffIndicator(left, bottom, "diff-another", Option.DiffAnother),
            diffIndicator(left, bottom, "diff-insane", Option.DiffInsane),
            diffIndicator(left, bottom, "diff-unknown", Option.DiffUnknown),

            {
                id = "difficulty",
                loop = 1000,
                dst = {
                    {
                        time = 833,
                        x = left + 154,
                        y = bottom + 6,
                        w = 15,
                        h = 20,
                        r = 0,
                        g = 0,
                        b = 0,
                        a = 0
                    },
                    {
                        time = 1000,
                        a = 255
                    }
                }
            }
        };
    }
end

return {
    image = image,
    destination = destination
}
