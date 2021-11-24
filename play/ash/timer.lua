--[[
    Names for events in beatoraja that can trigger skin animations.
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

local keyNames = {
    "Scratch",
    "Key1",
    "Key2",
    "Key3",
    "Key4",
    "Key5",
    "Key6",
    "Key7",
    "Key8",
    "Key9"
}

local playerNames = {"1p", "2p"}

--[[
    Define timers triggered by a key press/release.
]]
local function AddKeyTimers(timers, action, initialIndex)
    for i = 0, 19, 1 do
        local k = keyNames[i % 10 + 1]
        local p = playerNames[i // 10 + 1]
        local timerName = k .. action .. p;
        timers[timerName] = initialIndex + i
    end
end

local Timer = {
    InputStart = 1,
    Fadeout = 2,
    Fail = 3,

    TracklistMove = 10,
    TracklistChange = 11,
    TracklistMoveUp = 12,
    TracklistMoveDown = 13,
    TracklistMoveStop = 14,

    ReadmeOpen = 15,
    ReadmeEnd = 16,

    Panel1On = 21,
    Panel2On = 22,
    Panel3On = 23,
    Panel4On = 24,
    Panel5On = 25,
    Panel6On = 26,
    Panel1Off = 31,
    Panel2Off = 32,
    Panel3Off = 33,
    Panel4Off = 34,
    Panel5Off = 35,
    Panel6Off = 36,

    Ready = 40,
    Play = 41,
    GaugeIncrease1p = 42,
    GaugeIncrease2p = 43,
    GaugeMax1p = 42,
    GaugeMax2p = 43,
    Judge1p = 46,
    Judge2p = 47,
    Judge3p = 247,
    Combo1p = 446,
    Combo2p = 447,
    Combo3p = 448,
    FullCombo1p = 48,
    FullCombo2p = 49,
    Rhythm = 140,
    Finish1p = 143,
    Finish2p = 144,

    ScoreA = 348,
    ScoreAA = 349,
    ScoreAAA = 350,
    ScoreBest = 351,
    ScoreTarget = 352,

    ResultGraphStart = 150,
    ResultGraphComplete = 151,
    ResultHighscore = 152,

    ConnectStart = 172,
    ConnectSucceed = 173,
    ConnectFail = 174
}

AddKeyTimers(Timer, "Great", 50)
AddKeyTimers(Timer, "LN", 70)
AddKeyTimers(Timer, "HCNOn", 250)
AddKeyTimers(Timer, "HCNOff", 270)
AddKeyTimers(Timer, "On", 100)
AddKeyTimers(Timer, "Off", 120)

return Timer
