--[[
    gauge.lua -- Groove Gauge.
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

local Beatoraja = require("main_state")

return function(side, anchorX, anchorY)
    local direction = 1;

    if (side == 1) then
        direction = -1
    end

    local c = {
        source = {
            { id = "gauge", path = "textures/gauge/*.png" }
        },
        image = {
            -- Assisted Easy
            { id = "gaugeStart_a", src = "gauge", x = 0, y = 0, w = 25, h = 50 },
            { id = "gaugeEnd_a", src = "gauge", x = 65, y = 0, w = 25, h = 50 },
            { id = "gaugeUnder_on_a", src = "gauge", x = 25, y = 0, w = 10, h = 50 },
            { id = "gaugeUnder_off_a", src = "gauge", x = 35, y = 0, w = 10, h = 50 },
            { id = "gaugeClear_on_a", src = "gauge", x = 45, y = 0, w = 10, h = 50 },
            { id = "gaugeClear_off_a", src = "gauge", x = 55, y = 0, w = 10, h = 50 },
            -- Easy
            { id = "gaugeStart_e", src = "gauge", x = 0, y = 64, w = 25, h = 50 },
            { id = "gaugeEnd_e", src = "gauge", x = 65, y = 64, w = 25, h = 50 },
            { id = "gaugeUnder_on_e", src = "gauge", x = 25, y = 64, w = 10, h = 50 },
            { id = "gaugeUnder_off_e", src = "gauge", x = 35, y = 64, w = 10, h = 50 },
            { id = "gaugeClear_on_e", src = "gauge", x = 45, y = 64, w = 10, h = 50 },
            { id = "gaugeClear_off_e", src = "gauge", x = 55, y = 64, w = 10, h = 50 },
            -- Normal
            { id = "gaugeStart_n", src = "gauge", x = 0, y = 128, w = 25, h = 50 },
            { id = "gaugeEnd_n", src = "gauge", x = 65, y = 128, w = 25, h = 50 },
            { id = "gaugeUnder_on_n", src = "gauge", x = 25, y = 128, w = 10, h = 50 },
            { id = "gaugeUnder_off_n", src = "gauge", x = 35, y = 128, w = 10, h = 50 },
            { id = "gaugeClear_on_n", src = "gauge", x = 45, y = 128, w = 10, h = 50 },
            { id = "gaugeClear_off_n", src = "gauge", x = 55, y = 128, w = 10, h = 50 },
            -- Hard
            { id = "gaugeStart_h", src = "gauge", x = 0, y = 192, w = 25, h = 50 },
            { id = "gaugeEnd_h", src = "gauge", x = 65, y = 192, w = 25, h = 50 },
            { id = "gaugeUnder_on_h", src = "gauge", x = 25, y = 192, w = 10, h = 50 },
            { id = "gaugeUnder_off_h", src = "gauge", x = 35, y = 192, w = 10, h = 50 },
            { id = "gaugeClear_on_h", src = "gauge", x = 45, y = 192, w = 10, h = 50 },
            { id = "gaugeClear_off_h", src = "gauge", x = 55, y = 192, w = 10, h = 50 },
            -- Extremely Hard and Hazard variants
            { id = "gaugeStart_x", src = "gauge", x = 128, y = 0, w = 25, h = 50 },
            { id = "gaugeEnd_x", src = "gauge", x = 193, y = 0, w = 25, h = 50 },
            { id = "gaugeUnder_on_x", src = "gauge", x = 153, y = 0, w = 10, h = 50 },
            { id = "gaugeUnder_off_x", src = "gauge", x = 163, y = 0, w = 10, h = 50 },
            { id = "gaugeClear_on_x", src = "gauge", x = 173, y = 0, w = 10, h = 50 },
            { id = "gaugeClear_off_x", src = "gauge", x = 183, y = 0, w = 10, h = 50 },
        },
        value = {
            { id = "hp", src = 1, x = 0, y = 64, w = 240, h = 32, divx = 10, digit = 3, ref = 107 },
        },
        gauge = {
            id = "gauge",
            --[[
                Type 0: Random flickering
                Type 1: Flickers in an increasing pattern
                Type 2: Flickers in a decreasing pattern
                Type 3: No flickering
            ]]
            type = 1,
            starttime = 333,
            endtime = 667,
            nodes = {
                -- On (clear),On (fail),Off (clear),Off (fail),On (?),Off (?)
                -- Assisted Easy
                "gaugeClear_on_a",
                "gaugeUnder_on_a",
                "gaugeClear_off_a",
                "gaugeUnder_off_a",
                "gaugeClear_on_a",
                "gaugeUnder_on_a",
                -- Easy
                "gaugeClear_on_e",
                "gaugeUnder_on_e",
                "gaugeClear_off_e",
                "gaugeUnder_off_e",
                "gaugeClear_on_e",
                "gaugeUnder_on_e",
                -- Normal
                "gaugeClear_on_n",
                "gaugeUnder_on_n",
                "gaugeClear_off_n",
                "gaugeUnder_off_n",
                "gaugeClear_on_n",
                "gaugeUnder_on_n",
                -- Hard
                "gaugeClear_on_h",
                "gaugeUnder_on_h",
                "gaugeClear_off_h",
                "gaugeUnder_off_h",
                "gaugeClear_on_h",
                "gaugeUnder_on_h",
                -- Extremely Hard
                "gaugeClear_on_x",
                "gaugeUnder_on_x",
                "gaugeClear_off_x",
                "gaugeUnder_off_x",
                "gaugeClear_on_x",
                "gaugeUnder_on_x",
                -- Hazard uses same textures as EX hard
                "gaugeClear_on_x",
                "gaugeUnder_on_x",
                "gaugeClear_off_x",
                "gaugeUnder_off_x",
                "gaugeClear_on_x",
                "gaugeUnder_on_x",
            }
        },
        destination = {
            {
                id = "gauge",
                loop = 333,
                dst = {
                    { time = 0, x = anchorX + 25 * direction, y = anchorY + 960, w = 500 * direction, h = 50, acc = 2 },
                    { time = 333, y = anchorY }
                }
            }
        }
    }

    local gaugeSuffix = {"a", "e", "n", "h", "x", "x", "h", "x", "x"}

    for i, suffix in ipairs(gaugeSuffix) do
        local function shouldDraw()
            return Beatoraja.gauge_type() == i - 1
        end

        table.insert(c.destination, {
            id = "gaugeStart_" .. suffix,
            draw = shouldDraw,
            loop = 333,
            dst = {
                { time = 0, x = anchorX, y = anchorY + 960, w = 25 * direction, h = 50, acc = 2 },
                { time = 333, y = anchorY }
            }
        })

        table.insert(c.destination, {
            id = "gaugeEnd_" .. suffix,
            draw = shouldDraw,
            loop = 333,
            dst = {
                { time = 0, x = anchorX + 525 * direction, y = anchorY + 960, w = 25 * direction, h = 50, acc = 2 },
                { time = 333, y = anchorY }
            }
        })
    end

    return c
end
