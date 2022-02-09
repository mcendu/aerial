--[[
    graph-sp.lua -- Visualizes the performance of the player.
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

-- Draws the graph itself.
local function graph(originX, side)
    local o;

    if side == 0 then
        o = -1
    else
        o = 1
    end

    return {
        image = {
            { id = "graph-baseline", src = 0, x = 2048, y = 1152, w = 120, h = 3 },
            { id = "graph-end", src = 0, x = 2176, y = 1216, w = 96, h = 64 }
        },
        graph = {
            { id = "graph-score", src = 0, x = 2688, y = 1280, w = 112, h = 630, type = 110 },
            { id = "graph-acc", src = 0, x = 2688, y = 1280, w = 112, h = 630, type = 111 },
            { id = "graph-high-cur", src = 0, x = 2816, y = 1280, w = 112, h = 630, type = 112 },
            { id = "graph-high", src = 0, x = 2816, y = 1280, w = 112, h = 630, type = 113 },
            { id = "graph-target-cur", src = 0, x = 2944, y = 1280, w = 112, h = 630, type = 114 },
            { id = "graph-target", src = 0, x = 2944, y = 1280, w = 112, h = 630, type = 115 },
        },
        destination = {
            {
                id = "graph-baseline",
                loop = 400,
                dst = {
                    { time = 333, x = originX + 240 * o, y = 364, w = 120 * o, h = 3, a = 0 },
                    { time = 400, a = 255 }
                }
            },
            {
                id = "graph-score",
                dst = {
                    { x = originX + 244 * o, y = 370, w = 112 * o, h = 630 }
                }
            },
            {
                id = "graph-baseline",
                loop = 467,
                dst = {
                    { time = 400, x = originX + 120 * o, y = 364, w = 120 * o, h = 3, a = 0 },
                    { time = 467, a = 255 }
                }
            },
            {
                id = "graph-high",
                loop = 733,
                dst = {
                    { time = 400, x = originX + 124 * o, y = 370, w = 112 * o, h = 0, a = 64, acc = 2 },
                    { time = 733, h = 630 }
                }
            },
            {
                id = "graph-high-cur",
                dst = {
                    { x = originX + 124 * o, y = 370, w = 112 * o, h = 630 }
                }
            },
            {
                id = "graph-baseline",
                loop = 533,
                dst = {
                    { time = 467, x = originX, y = 364, w = 120 * o, h = 3, a = 0 },
                    { time = 533, a = 255 }
                }
            },
            {
                id = "graph-target",
                loop = 800,
                dst = {
                    { time = 467, x = originX + 4 * o, y = 370, w = 112 * o, h = 0, a = 64, acc = 2 },
                    { time = 800, h = 630 }
                }
            },
            {
                id = "graph-target-cur",
                dst = {
                    { x = originX + 4 * o, y = 370, w = 112 * o, h = 630 }
                }
            },
            {
                id = "graph-end",
                loop = 600,
                dst = {
                    { time = 533, x = originX, y = 302, w = 96 * -o, h = 64, a = 0 },
                    { time = 600, a = 255 }
                }
            }
        }
    }
end

-- Draws the reference lines for A, AA, AAA, and perfect play.
local function lines(originX, originY, side)
    local function graph_line(name, fadeTime, originX, originY, op, timer)
        if op == nil then
            return {
                destination = {
                    {
                        id = name,
                        loop = fadeTime + 200,
                        dst = {
                            { time = fadeTime, x = originX, y = originY, w = 420, h = 32, a = 0 },
                            { time = fadeTime + 200, a = 255 }
                        }
                    }
                }
            }
        else
            return {
                destination = {
                    {
                        id = name,
                        loop = fadeTime + 200,
                        op = {-op},
                        dst = {
                            { time = fadeTime, x = originX, y = originY, w = 420, h = 32, a = 0 },
                            { time = fadeTime + 200, a = 64 }
                        }
                    },
                    {
                        id = name,
                        loop = 500,
                        timer = timer,
                        dst = {
                            { time = 0, x = originX, y = originY, w = 420, h = 32, a = 255, r = 0xff, g = 0xff, b = 0xff },
                            { time = 500, r = 0xd1, g = 0x94, b = 0xaf }
                        }
                    }
                }
            }
        end
    end

    local line_a, line_aa, line_aaa, line_max
    local real_origin

    if side == 0 then
        line_a = { id = "line-a", src = 0, x = 2048, y = 1280, w = 420, h = 32 }
        line_aa = { id = "line-aa", src = 0, x = 2048, y = 1312, w = 420, h = 32 }
        line_aaa = { id = "line-aaa", src = 0, x = 2048, y = 1344, w = 420, h = 32 }
        line_max = { id = "line-max", src = 0, x = 2048, y = 1376, w = 420, h = 32 }
        real_origin = originX - 360
    else
        line_a = { id = "line-a", src = 0, x = 2048, y = 1536, w = 420, h = 32 }
        line_aa = { id = "line-aa", src = 0, x = 2048, y = 1568, w = 420, h = 32 }
        line_aaa = { id = "line-aaa", src = 0, x = 2048, y = 1600, w = 420, h = 32 }
        line_max = { id = "line-max", src = 0, x = 2048, y = 1632, w = 420, h = 32 }
        real_origin = originX - 60
    end

    local c = Component:new {
        image = { line_a, line_aa, line_aaa, line_max },
        destination = {}
    }

    c:addComponent(graph_line("line-a", 667, real_origin, originY + 420, 222, Timer.ScoreA))
    c:addComponent(graph_line("line-aa", 733, real_origin, originY + 490, 221, Timer.ScoreAA))
    c:addComponent(graph_line("line-aaa", 800, real_origin, originY + 560, 220, Timer.ScoreAAA))
    c:addComponent(graph_line("line-max", 866, real_origin, originY + 630))

    return c
end

return function(side)
    local player_prefix
    local stage_origin = 0
    local graph_origin = 0

    -- The side of the graph is always the opposite of the side of the
    -- player. The input parameter, `side`, takes the side of the
    -- player, while references to "side" in the body of this function
    -- refers to the side of the graph.
    if side == 0 then
        player_prefix = "2p-"
        stage_origin = 1920 - 596
        graph_origin = 1770
    else
        player_prefix = "1p-"
        stage_origin = 20
        graph_origin = 150
    end

    local c = Component:new {
        image = {
            { id = "1p-graph", src = 0, x = 0, y = 1024, w = 576, h = 960 },
            { id = "2p-graph", src = 0, x = 576, y = 1024, w = 576, h = 960 }
        },
        destination = {
            {
                id = player_prefix .. "graph",
                blend = 1,
                loop = 333,
                dst = {
                    { time = 0, x = stage_origin, y = 1080, w = 576, h = 960, acc = 2 },
                    { time = 333, y = 120 }
                }
            }
        }
    }

    c:addComponent(lines(graph_origin, 370, side))
    c:addComponent(graph(graph_origin, side))

    return c
end
