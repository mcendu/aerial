--[[
    Helpers for defining configuration options of beatoraja skins.
    Part of Aerial Skin Helpers.
    Copyright (C) 2021 McEndu.

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 3 of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this program.  If not,
    see <https://www.gnu.org/licenses/>.
]]

local Options = {};

Options.prototype = {
    --[[
        Returns the next configuration-defined op available.
    ]]
    _nextCustomOp = function(self)
        self.customOps = self.lastOp + 1
        return self.customOps
    end,

    --[[
        Returns the next option ID available.
    ]]
    _nextOption = function(self)
        self.options = self.lastOption + 1
        return self.options
    end,

    --[[
        Returns the next configurable offset available.
    ]]
    _nextOffset = function(self)
        self.offsets = self.lastOffset + 1
        return self.offsets
    end,

    --[[
        Creates a normal option.
    ]]
    createOption = function(self, name)
        table.insert(self, {
            name = name,
            label = self:_nextOption()
        })
    end,

    --[[
        Creates an option that
    ]]

    --[[
        Creates an option entry.
    ]]
}

Options.__index = Options.prototype;

function Options:new(o)
    o = o or {}
    setmetatable(o, self)

    o.lastOp = 899
    o.lastOption = 0
    o.lastOffset = 39
    o.property = {}
    o.filepath = {}
    o.offset = {}
    o.category = {}

    return o
end
