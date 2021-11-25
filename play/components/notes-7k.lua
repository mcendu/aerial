--[[
    notes.lua -- Displays incoming notes.
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

return function(anchorX, anchorY, side)

    -- Textures for notes on each column.
    local img_note = {
        "note-white",
        "note-black",
        "note-white",
        "note-black",
        "note-white",
        "note-black",
        "note-white",
        "note-scratch"
    }
    local img_lnhead = {
        "lnhead-white",
        "lnhead-black",
        "lnhead-white",
        "lnhead-black",
        "lnhead-white",
        "lnhead-black",
        "lnhead-white",
        "lnhead-scratch"
    }
    local img_lntail = {
        "lntail-white",
        "lntail-black",
        "lntail-white",
        "lntail-black",
        "lntail-white",
        "lntail-black",
        "lntail-white",
        "lntail-scratch"
    }
    local img_mine = {
        "mine-white",
        "mine-black",
        "mine-white",
        "mine-black",
        "mine-white",
        "mine-black",
        "mine-white",
        "mine-scratch"
    }
    local img_ln = {
        "ln-white",
        "ln-black",
        "ln-white",
        "ln-black",
        "ln-white",
        "ln-black",
        "ln-white",
        "ln-scratch"
    }
    local img_lna = {
        "lna-white",
        "lna-black",
        "lna-white",
        "lna-black",
        "lna-white",
        "lna-black",
        "lna-white",
        "lna-scratch"
    }

    local width_black = 40
    local width_white = 60
    local width_scratch = 100

    -- horizontal position of notes relative to the leftmost column.
    local relativeX_1p = {100, 160, 200, 260, 300, 360, 400, 0}
    local relativeX_2p = {0, 60, 100, 160, 200, 260, 300, 360}

    local width = {
        width_white,
        width_black,
        width_white,
        width_black,
        width_white,
        width_black,
        width_white,
        width_scratch
    }

    local relativeX = nil

    if (side == 0) then
        relativeX = relativeX_1p
    else
        relativeX = relativeX_2p
    end

    local c = {}

    c.note = {
        id = "playfield",
        -- How the columns appear on screen
        dst = {},
        -- Normal notes
        note = img_note,
        -- Long notes
        lnend = img_lntail,
        lnstart = img_lnhead,
        lnbody = img_lna,   -- Due to a coding error by exch or lavalse,
        lnactive = img_ln,  -- lnactive does the exact opposite of its name
        -- Landmine
        mine = img_mine,
        -- Hell charge notes (a special way to handle long notes)
        -- Can be turned on in beatoraja for all maps with LN
        hcnend = img_lntail,
        hcnstart = img_lnhead,
        hcnbody = img_ln,
        hcnactive = img_lna,
        hcndamage = img_ln,
        hcnreactive = img_lna,
        -- Invisible notes
        hidden = {},
        -- Pressed notes?
        processed = {},
        -- Height of notes?
        size = {},
        -- Normal measure lines
        group = {
            {
                id = "measure",
                offsets = {3}, -- offset by value of lift
                loop = 250,
                dst = {
                    { time = 0, x = anchorX, y = anchorY, w = 460, h = 2, a = 0 },
                    { time = 250, a = 255 }
                }
            }
        },
        -- BPM change indicator
        bpm = nil,
        -- Stop indicator
        stop = nil,
        time = nil
    }

    for i, value in ipairs(relativeX) do
        c.note.dst[i] = {
            x = anchorX + value,
            y = anchorY,
            w = width[i],
            h = 710
        }
    end

    c.destination = {
        {
            id = "judge-line",
            offsets = {3},
            loop = 750,
            dst = {
                { time = 500, x = anchorX + 230, y = anchorY, w = 0, h = 24, acc = 2 },
                { time = 750, x = anchorX, w = 460 }
            }
        },
        {
            id = "playfield"
        }
    }

    return c
end
