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

local width = {
    scratch = 100,
    white = 60,
    black = 40
}

local function textureList(group, layout)
    local l = {}
    for i, coltype in ipairs(layout) do
        table.insert(l, group .. "-" .. coltype)
    end
    return l
end

return function(anchorX, anchorY, relativeX, layout)
    local img_note = textureList("note", layout)
    local img_lnhead = textureList("lnhead", layout)
    local img_lntail = textureList("lntail", layout)
    local img_ln = textureList("ln", layout)
    local img_lna = textureList("lna", layout)
    local img_mine = textureList("mine", layout)

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
        -- ?
        time = nil
    }

    for i, value in ipairs(relativeX) do
        c.note.dst[i] = {
            x = anchorX + value,
            y = anchorY,
            w = width[layout[i]],
            h = 710
        }
    end

    c.destination = {
        { id = "playfield" }
    }

    return c
end
