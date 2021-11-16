--[[
    judge.lua -- Shows the judgement and current combo when a note is hit.
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

return function(centerX, anchorY)
    local displayTime = 500
    local anchorX = centerX - 117

    return {
        -- Use ModernChic judge textures
        source = {
            { id = 4, path = "textures/judge/DSegment.png" }
        },
        image = {
		    { id = "pgreat", src = 4, x = 0, y = 0, w = 227, h = 252, divy = 3, cycle = 100 },
		    { id = "great", src = 4, x = 0, y = 252, w = 227, h = 168, divy = 2, cycle = 100 },
		    { id = "good", src = 4, x = 0, y = 420, w = 227, h = 168, divy = 2, cycle = 100 },
		    { id = "bad", src = 4, x = 227, y = 420, w = 227, h = 168, divy = 2, cycle = 100 },
		    { id = "poor", src = 4, x = 454, y = 420, w = 227, h = 168, divy = 2, cycle = 100 }
        },
        value = {
            { id = "combo-pg", src = 4, x = 227, y = 0, w = 550, h = 252, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 100 },
            { id = "combo-g", src = 4, x = 227, y = 252, w = 550, h = 168, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 100 },
        },
        judge = {
            {
                id = "nowjudge",
                index = 0,
                images = {
                    {
                        id = "pgreat",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32}, -- offset by lift and customized judge offset
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "great",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32},
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "good",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32},
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "bad",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32},
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "poor",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32},
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "poor",
                        loop = -1,
                        timer = 46,
                        offsets = {3, 32},
                        dst = {
                            { time = 0, x = anchorX, y = anchorY, w = 227, h = 84 },
                            { time = displayTime }
                        }
                    }
                },
                -- x and y for numbers are relative to the corresponding text
                numbers = {
                    {
                        id = "combo-pg",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 237, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "combo-g",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 237, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "combo-g",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 237, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "combo-g",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 0, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "combo-g",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 0, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    },
                    {
                        id = "combo-g",
                        loop = -1,
                        timer = 46,
                        offsets = {32},
                        dst = {
                            { time = 0, x = 0, y = 0, w = 55, h = 84 },
                            { time = displayTime }
                        }
                    }
                },
                shift = true
            }
        },
        destination = {
            { id = "nowjudge" }
        }
    }
end
