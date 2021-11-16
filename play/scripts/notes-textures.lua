--[[
    notes-textures.lua -- Textures for notes.
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

return {
    source = {
        { id = 2, path = "textures/note/_default.png" }
    },
    image = {
        -- Normal note
        { id = "note-scratch", src = 2, x = 0, y = 8, w = 100, h = 24 },
        { id = "note-autoscratch", src = 2, x = 128, y = 8, w = 100, h = 24 },
        { id = "note-white", src = 2, x = 256, y = 8, w = 60, h = 24 },
        { id = "note-black", src = 2, x = 384, y = 8, w = 40, h = 24 },
        -- LN start
        { id = "lnhead-scratch", src = 2, x = 0, y = 40, w = 100, h = 24 },
        { id = "lnhead-autoscratch", src = 2, x = 128, y = 40, w = 100, h = 24 },
        { id = "lnhead-white", src = 2, x = 256, y = 40, w = 60, h = 24 },
        { id = "lnhead-black", src = 2, x = 384, y = 40, w = 40, h = 24 },
        -- LN end
        { id = "lntail-scratch", src = 2, x = 0, y = 72, w = 100, h = 24 },
        { id = "lntail-autoscratch", src = 2, x = 128, y = 72, w = 100, h = 24 },
        { id = "lntail-white", src = 2, x = 256, y = 72, w = 60, h = 24 },
        { id = "lntail-black", src = 2, x = 384, y = 72, w = 40, h = 24 },
        -- Landmine
        { id = "mine-scratch", src = 2, x = 0, y = 104, w = 100, h = 24 },
        { id = "mine-white", src = 2, x = 256, y = 104, w = 60, h = 24 },
        { id = "mine-black", src = 2, x = 384, y = 104, w = 40, h = 24 },
        -- LN inactive
        { id = "ln-scratch", src = 2, x = 0, y = 128, w = 100, h = 32 },
        { id = "ln-autoscratch", src = 2, x = 128, y = 128, w = 100, h = 32 },
        { id = "ln-white", src = 2, x = 256, y = 128, w = 60, h = 32 },
        { id = "ln-black", src = 2, x = 384, y = 128, w = 40, h = 32 },
        -- LN active
        { id = "lna-scratch", src = 2, x = 0, y = 160, w = 100, h = 1, divy = 96, cycle = 800 },
        { id = "lna-autoscratch", src = 2, x = 128, y = 160, w = 100, h = 1, divy = 96, cycle = 800 },
        { id = "lna-white", src = 2, x = 256, y = 160, w = 60, h = 1, divy = 96, cycle = 800 },
        { id = "lna-black", src = 2, x = 384, y = 160, w = 40, h = 1, divy = 96, cycle = 800 },
        -- Measure line
        { id = "measure", src = 1, x = 0, y = 800, w = 64, h = 2 },
        -- Judge reference
        { id = "judge-line", src = 1, x = 96, y = 800, w = 64, h = 24 }
    }
}
