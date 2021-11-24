--[[
    Helpers for constructing a table out of components.
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

local Skin = {
    -- Named values for skin types.
    SKINTYPE_7K = 0,
    SKINTYPE_5K = 1,
    SKINTYPE_14K = 2,
    SKINTYPE_10K = 3,
    SKINTYPE_9K = 4,
    SKINTYPE_SELECT = 5,
    SKINTYPE_DECIDE = 6,
    SKINTYPE_RESULT = 7,
    SKINTYPE_KEYCONFIG = 8,
    SKINTYPE_SKINSELECT = 9,
    SKINTYPE_SOUNDSET = 10,
    SKINTYPE_THEME = 11,
    SKINTYPE_7KBATTLE = 12,
    SKINTYPE_5KBATTLE = 13,
    SKINTYPE_9KBATTLE = 14,
    SKINTYPE_COURSERESULT = 15,
    SKINTYPE_24K = 16,
    SKINTYPE_48K = 17,
    SKINTYPE_24KBATTLE = 18,
}

--[[
    Methods. `skin:method` should be used instead of
    `Skin.prototype.method`.
]]
Skin.prototype = {
    --[[
        Copies the contents of a component to the skin hierarchy.
    ]]
    addComponent = function(self, component)
        for property, contents in pairs(component) do
            if (self[property] == nil) then
                self[property] = {}
            end

            -- Insert contents with numerical indices to the end
            for index, value in ipairs(contents) do
                table.insert(self[property], value)
            end

            -- Contents with non-numeric index are merged into self
            for index, value in pairs(contents) do
                if type(index) ~= "number" then
                    self[property][index] = value
                end
            end
        end
    end,

    --[[
        Loads and executes a function that returns a table from another
        Lua script, and merges the table (component) into the skin.
    ]]
    loadComponent = function(self, path, ...)
        -- Load and run the component constructor
        local component_args = {...}
        local status, component = pcall(function ()
            local c = dofile(path)
            return c(table.unpack(component_args));
        end)

        if (status and component) then
            self:addComponent(component)
        end
    end
}

Skin.__index = Skin.prototype;

function Skin:new(o)
    o = o or {}
    setmetatable(o, self)
    return o
end

return Skin
