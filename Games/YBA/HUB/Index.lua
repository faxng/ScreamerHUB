--[[ UI LIB ]]--

local VapeLIB = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/LIB/Vape.lua")
local VapeMOD = loadstring(game:HttpGet(VapeLIB))() or loadstring(syn.request({Url = VapeLIB, Method = "GET", Headers = {}}).Body)()

--[[ UI WINDOW ]]

local VapeWIN = VapeMOD:Window("Screamer HUB", Color3.fromRGB(0, 255, 0) , Enum.KeyCode.RightControl)

--[[ UI TABS ]]--

local AutoDropWindow = VapeWIN:Tab("AUTO DROP")
local AutoSellWindow = VapeWIN:Tab("AUTO SELL")

local StandFarmWindow = VapeWIN:Tab("STAND FARM")
local ShinyFarmWindow = VapeWIN:Tab("SHINY FARM")

local ItemCounterWindow = VapeWIN:Tab("ITEM COUNTER")
local MiscWindow = VapeWIN:Tab("MISC")

--[[ HTTP REQUESTS ]]--

local Roka = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Arrow.lua")
local Arrow = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Roka.lua")
local RokaWarn = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/RokaW.lua")
local WorthTwo = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/WorthTwo.lua")
local AutoDrop = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Drop.lua")
local AutoSell = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Sell.lua")


--[[ JSON REQUESTS ]]--

local ITEMS = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Item.JSON")

--[[ SERVICES ]]--

local HttpService = game:GetService("HttpService")
local PlayerService = game:GetService("Players")

--[[ GLOBAL ]]--

_G.DropAmount = ("ALL")
_G.DropEnabled = (true)
_G.CurrentDrop = ("")

_G.SellAmount = ("ALL")
_G.SellEnabled = (true)
_G.CurrentSell = ("")

_G.AutoPickupEnabled = (false)
_G.AutoCount = (false)
_G.AutoArcade = (false)

_G.StandFarm = (false)
_G.ShinyFarm = (false)
_G.StandLogging = (false)
_G.WebHookLogging = (false)

_G.AFK = (true)

--[[ MAIN FUNCTIONS ]]--

local function GET(URL)
   
   local Data = {
    Url = URL,
    Method = "GET",
    Headers = {}
   }
 
   local Request = game:HttpGet(URL) or (syn.request(Data).Body)
   
   warn(Request)
   
   return loadstring(Request)()
end

local function GETBODY(URL)
   
   local Data = {
    Url = URL,
    Method = "GET",
    Headers = {}
   }
 
   local Request = game:HttpGet(URL) or (syn.request(Data).Body)
   
   return Request
end

local function Decode(JSON)
   return HttpService:JSONDecode(JSON)
end

local function ChangeProperty(Object, Prop, NewPropValue)
   Object["Prop"] = (NewPropValue)
end

--[[ AUTO DROP ]]--

AutoDropWindow:Toggle("ENABLED", true, function(Bool)
    _G.DropEnabled = Bool
end)

AutoDropWindow:Textbox("AMOUNT", false, function(Input)
    if not tonumber((Input)) then return end
    
    _G.DropAmount = tonumber((Input))
end)

AutoDropWindow:Button("DROP", function()
    GET(AutoDrop)
end)

local Dropping = AutoDropWindow:Label("Currently Dropping: N/A")

AutoDropWindow:Label("")
AutoDropWindow:Label("Items:")

for Index, Value in pairs(Decode(GETBODY(ITEMS))) do
   AutoDropWindow:Button(Value, function()
       
       _G.CurrentDrop = Value
       
       Dropping.Text = ("Currently Dropping: " .. Value)
   end)
end

--[[ AUTO SELL ]]--

AutoSellWindow:Toggle("ENABLED", true, function(Bool)
    _G.SellEnabled = Bool
end)

AutoSellWindow:Textbox("AMOUNT", false, function(Input)
    if not tonumber((Input)) then return end
    
    _G.SellAmount = tonumber((Input))
end)

AutoSellWindow:Button("SELL", function()
    GET(AutoSell)
end)

local Selling = AutoSellWindow:Label("Currently Selling: N/A")

AutoSellWindow:Label("")
AutoSellWindow:Label("Items:")

for Index, Value in pairs(Decode(GETBODY(ITEMS))) do
   AutoSellWindow:Button(Value, function()
       
       _G.CurrentSell = Value
       
       Selling.Text = ("Currently Selling: " .. Value)
   end)
end
