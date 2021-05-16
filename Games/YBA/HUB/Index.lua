--[[ UI LIB ]]--

local VapeLIB = ("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt")
local VapeMOD = loadstring(syn.request({Url = VapeLIB, Method = "GET", Headers = {}}).Body)()

--[[ UI WINDOWS ]]--

local AutoDropWindow = VapeMOD:Window("AUTO DROP")
local AutoSellWindow = VapeMOD:Window("AUTO SELL")

local StandFarmWindow = VapeMOD:Window("STAND FARM")
local ShinyFarmWindow = VapeMOD:Window("SHINY FARM")

local ItemCounterWindow = VapeMOD:Window("ITEM COUNTER")

--[[ UI REQUESTS ]]--

local Roka = ("")
local Arrow = ("")
