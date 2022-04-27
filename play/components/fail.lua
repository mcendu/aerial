--[[
    fail.lua - Fail animation.
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

local Timer = require("ash.timer")
local Image = require("ash.image")

local centerX = 960
local skewX = 290

local closeTime = 1000
local layer1Time = 400
local layer2Time = 450
local layer3Time = 500

local halfTextmarkWidth = 580

local function failBackgroundLeftHalf(time, r, g, b)
    return {
        id = "fail-background",
        blend = 1,
        loop = time,
        timer = Timer.Fail,
        dst = {
            { time = 0, x = -skewX * 0.5 + 1, y = 1080, w = 1540, h = 1080, acc = 2,
                r = r, g = g, b = b },
            { time = time, x = -skewX * 1.5 + 1, y = 0, acc = 0 }
        }
    }
end

local function failBackgroundRightHalf(time, r, g, b)
    return {
        id = "fail-background",
        blend = 1,
        loop = time,
        timer = Timer.Fail,
        dst = {
            { time = 0, x = centerX + skewX * -1.5 - 1, y = -1080, w = 1540, h = 1080, acc = 2,
                r = r, g = g, b = b },
            { time = time, x = centerX + skewX * -0.5 - 1, y = 0 }
        }
    }
end

return {
    source = {
        -- this name is hardcoded as fail animation is not intended to
        -- be customized using textures alone
        { id = "fail", path = "textures/fail/default.png" }
    },
    image = {
        { id = "fail-background", src = "fail", x = 0, y = 0, w = 1540, h = 1080 },
        { id = "fail-text-stripe", src = "fail", x = 0, y = 1152, w = 1920, h = 240 },
        { id = "failtext-stage", src = "fail", x = 0, y = 1440, w = 560, h = 144 },
        { id = "failtext-failed", src = "fail", x = 0, y = 1600, w = 600, h = 144 }
    },
    destination = {
        -- layers below the base fail background
        failBackgroundLeftHalf(layer1Time, 0xff, 0xd9, 0x66),
        failBackgroundRightHalf(layer1Time, 0xff, 0xd9, 0x66),
        failBackgroundLeftHalf(layer2Time, 0xff, 0x66, 0x66),
        failBackgroundRightHalf(layer2Time, 0xff, 0x66, 0x66),
        failBackgroundLeftHalf(layer3Time, 0x6f, 0x5d, 0x5d),
        failBackgroundRightHalf(layer3Time, 0x6f, 0x5d, 0x5d),
        -- base fail background
        failBackgroundLeftHalf(closeTime, 0x26, 0x26, 0x22),
        failBackgroundRightHalf(closeTime, 0x26, 0x26, 0x22),
        -- "STAGE FAILED" wordmark
        {
            id = "fail-text-stripe",
            loop = 500,
            timer = Timer.Fail,
            dst = {
                { time = 0, x = 0, y = 540, w = 1920, h = 0, acc = 2 },
                { time = 500, y = 420, h = 240 }
            }
        },
        {
            id = "failtext-stage",
            loop = 2000,
            filter = 1,
            timer = Timer.Fail,
            dst = {
                { time = 0, x = centerX - halfTextmarkWidth, y = 540 - 72, w = 560, h = 144, a = 0 },
                { time = 500, x = centerX - halfTextmarkWidth - 20, a = 255 },
                { time = 2000, x = centerX - halfTextmarkWidth - 80 }
            }
        },
        {
            id = "failtext-failed",
            loop = 2000,
            filter = 1,
            timer = Timer.Fail,
            dst = {
                { time = 0, x = centerX - 20, y = 540 - 72, w = 560, h = 144, a = 0 },
                { time = 500, x = centerX, a = 255 },
                { time = 2000, x = centerX + 60 }
            }
        },
        {
            id = Image.Black,
            loop = 2000,
            timer = Timer.Fail,
            dst = {
                { time = 1500, x = 0, y = 0, w = 1920, h = 1080, a = 0 },
                { time = 2000, a = 255 }
            }
        }
    }
}
