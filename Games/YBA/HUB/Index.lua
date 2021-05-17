--[[ UI LIB ]]--

local VapeLIB = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/LIB/Vape.lua")
local VapeMOD = loadstring(game:HttpGet(VapeLIB))() or loadstring(syn.request({Url = VapeLIB, Method = "GET", Headers = {}}).Body)()

--[[ UI WINDOW ]]

local VapeWIN = VapeMOD:Window("Screamer HUB", Color3.fromRGB(0, 255, 0) , Enum.KeyCode.RightControl)

--[[ UI TABS ]]--

local AutoDropWindow = VapeWIN:Tab("AUTO DROP")
local AutoSellWindow = VapeWIN:Tab("AUTO SELL")
local StandFarmWindow = VapeWIN:Tab("STAND FARM")
local ItemCounterWindow = VapeWIN:Tab("ITEM COUNTER")
local SBRWindow = VapeWIN:Tab("SBR")
local MiscWindow = VapeWIN:Tab("MISC")

--[[ HTTP REQUESTS ]]--

local Roka = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Roka.lua")
local Arrow = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Arrow.lua")
local RokaWarn = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/RokaW.lua")
local WorthTwo = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/WorthTwo.lua")
local AutoDrop = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Drop.lua")
local AutoSell = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Sell.lua")

--[[ JSON REQUESTS ]]--

local ITEMS = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Item.JSON")
--[[ SERVICES ]]--

local HttpService = game:GetService("HttpService")
local PlayerService = game:GetService("Players")

--[[ TABLES ]]--

local STANDS = HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Stands.JSON")) or HttpService:JSONDecode(syn.request({Url = ("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Stands.JSON"), Method = ("GET"), Headers = {}}).Body)
local StandSession = {}

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
_G.StandFarmS = (true)
_G.StandLogging = (false)
_G.WebHookLogging = (false)

_G.HORSESPEED = (false)
_G.HORSESPEEDVALUE = (0.2)

_G.ANTIPOISON = false
_G.ANTIWEATHER = false

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

--[[ RAW FUNCTIONS ]]--

local function StandLOG(Name, Wanted)
   StandSession[#StandSession + 1] = {
    StandRolled = Name,
    W = Wanted
   }
end

local function StandSave()
    
   local Temp = {}
   
   
   for i = 1,#StandSession do
      if StandSession[i].StandRolled then
         local String = (StandSession[i].StandRolled .. " [ " .. tostring(StandSession[i].W) .. " ]\n")
         
         table.insert(Temp, String)
      end
   end
   
   local Concat = table.concat(Temp, "")
   
   for i = 1,500 do
      if not isfile("Standlog_" .. tostring(i) .. ".txt") then
         writefile("Standlog_" .. tostring(i) .. ".txt", Concat)
         return
      end
   end
   
end

local function YNTCN(Name)
    if Name == ("White Poison") then return ("White Snake") end
    if Name == ("Platinum Sun") then return ("Star Platinum") end
    if Name == ("The Universe") then return ("The World") end
    if Name == ("Scarlet King") then return ("King Crimson") end
    if Name == ("Golden Spirit") then return ("Golden Experience") end
    if Name == ("Deadly King") then return ("Killer Queen") end
    if Name == ("Shining Sapphire") then return ("Crazy Diamond") end
    if Name == ("Grey Rapier") then return ("Silver Chariot") end
    if Name == ("Void") then return ("Cream") end
    if Name == ("That Hand") then return ("The Hand") end
    if Name == ("Six Pistols") then return ("Sex Pistols") end
    if Name == ("Violet Fog") then return ("Purple Haze") end
    if Name == ("Zipper Fingers") then return ("Sticky Fingers") end
    if Name == ("Tentacle Green") then return ("Hierophant Green") end
    if Name == ("Magician's Ember") then return ("Magician's Red") end
    if Name == ("Ice Album") then return ("White Album") end
    if Name == ("Violet Vine") then return ("Hermit Purple") end
    if Name == ("Ms. Vice President") then return ("Mr. President") end
    if Name == ("Ocean Boy") then return ("Beach Boy") end
    if Name == ("Airsmith") then return ("Aerosmith") end
    if Name == ("Anubiz") then return ("Anubis") end
end

local function CNTYN(StandNAME)
   if StandNAME == ("White Snake") then return ("White Poison") end
   if StandNAME == ("Star Platinum") then return ("Platinum Sun") end
   if StandNAME == ("The World") then return ("The Universe") end
   if StandNAME == ("King Crimson") then return ("Scarlet King") end
   if StandNAME == ("Golden Experience") then return ("Golden Spirit") end
   if StandNAME == ("Killer Queen") then return ("Deadly King") end
   if StandNAME == ("Crazy Diamond") then return ("Shining Sapphire") end
   if StandNAME == ("Silver Chariot") then return ("Grey Rapier") end
   if StandNAME == ("Cream") then return ("Void") end
   if StandNAME == ("The Hand") then return ("That Hand") end
   if StandNAME == ("Sex Pistols") then return ("Six Pistols") end
   if StandNAME == ("Purple Haze") then return ("Violet Fog") end
   if StandNAME == ("Sticky Fingers") then return ("Zipper Fingers") end
   if StandNAME == ("Hierophant Green") then return ("Tentacle Green") end
   if StandNAME == ("Magician's Red") then return ("Magician's Ember") end
   if StandNAME == ("White Album") then return ("Ice Album") end
   if StandNAME == ("Hermit Purple") then return ("Violet Vine") end
   if StandNAME == ("Mr. President") then return ("Ms. Vice President") end
   if StandNAME == ("Beach Boy") then return ("Ocean Boy") end
   if StandNAME == ("Aerosmith") then return ("Airsmith") end
   if StandNAME == ("Anubis") then return ("Anubiz") end
end

local function StandWarnN(StandNAME, Pity)
    
   local Farming = {}
   
   for i = 1,#STANDS do
       if STANDS[i].Farming == (true) then
          table.insert(Farming, CNTYN(STANDS[i].Stand))
       end
   end
   
   if Pity == (0) and table.find(Farming, StandNAME) then 
      game.StarterGui:SetCore("SendNotification", {
        Title = "Shiny Rolled;",
        Text = ("You Rolled a SHINY: " .. StandNAME),
        Duration = 15
      })
      
      if _G.StandLogging then
         StandLOG(("Shiny: " .. YNTCN(StandNAME)), true)
      end
      
      SFN = false
   elseif table.find(Farming, StandNAME) and not _G.StandFarmS then
       
      if _G.StandLogging then
        StandLOG(YNTCN(StandNAME), true) 
      end
      
      game.StarterGui:SetCore("SendNotification", {
        Title = "Stand Rolled;",
        Text = ("You Rolled your stand! : " .. StandNAME),
        Duration = 15
      })
  
      SFN = false
   else
      GET(Roka)
      
      if _G.StandLogging then 
         StandLOG(YNTCN(StandNAME), false) 
      end
      
   end
    
end

local function StandFarm()
   if game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value == ("None") then
      GET(WorthTwo)
      GET(Arrow)
        
      repeat 
            wait()
      until game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None")
        
      StandWarnN(game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value, game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value)
   
   elseif game:GetService("Players").LocalPlayer:WaitForChild("PlayerStats"):WaitForChild("Stand").Value ~= ("None") then
      if game:GetService("Players").LocalPlayer:FindFirstChild("PityCount") then
          if not game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value == (0) or game:GetService("Players").LocalPlayer:WaitForChild("PityCount").Value ~= 0 then
             GET(RokaW)
          end
      else
         GET(Roka)
      end
   end
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

--[[ STAND FARM ]]--

StandFarmWindow:Toggle("ENABLED", false, function(Bool)
    _G.StandFarm = Bool
    
    if Bool then
       StandFarm()
    end
end)

StandFarmWindow:Toggle("KEEP SPECIFIC SHINIES", true, function(Bool)
    _G.StandFarmS = Bool
end)

StandFarmWindow:Label("STANDS:")

for i = 1,#STANDS do
   StandFarmWindow:Toggle(STANDS[i].Stand, false, function(Bool)
       STANDS[i].Farming = Bool
   end)
end

--[[ ITEM COUNTER ]]--

ItemCounterWindow:Label("Coming Soon...")

--[[ SBR ]]--

SBRWindow:Label("HORSE FEATURES:")

SBRWindow:Button("BRING", function()
    local Horse = workspace:WaitForChild((game:GetService("Players").LocalPlayer.Name .. "'s Horse"))
    local Human = PlayerService.LocalPlayer.Character.HumanoidRootPart
    
    Horse:WaitForChild("HumanoidRootPart").CFrame = Human.CFrame
end)

SBRWindow:Toggle("SPEED", _G.HORSESPEED, function(Bool)
    _G.HORSESPEED = Bool
end)

SBRWindow:Dropdown("SPEED TYPE", {"OBVIOUS", "FAST", "NOTICEABLE", "UN-NOTICEABLE"}, function(Option)
    if Option == ("OBVIOUS") then
       _G.HORSESPEEDVALUE = (1)
       
       SpeedType.Text = Option
    elseif Option == ("FAST") then
       _G.HORSESPEEDVALUE = (0.6)    
       
       SpeedType.Text = Optiond
    elseif Option == ("NOTICEABLE") then
       _G.HORSESPEEDVALUE = (0.4)    
       
       SpeedType.Text = Option
    elseif Option == ("UN-NOTICEABLE") then
       _G.HORSESPEEDVALUE = (0.2)    
       
       SpeedType.Text = Option
    end
end)

SBRWindow:Label("CLIENT FEATURES:")

SBRWindow:Toggle("ANTI-POISON", _G.ANTIPOISON, function(Bool)
    _G.ANTIPOISON = Bool
end)

SBRWindow:Toggle("ANTI-WEATHER", _G.ANTIWEATHER, function(Bool)
    _G.ANTIWEATHER = Bool
    
    if Bool then
       game:GetService()
    end
end)

--[[ MISC ]]--

MiscWindow:Toggle("STAND LOGGING", false, function(Bool)
    _G.StandLogging = Bool
end)

MiscWindow:Button("SAVE LOG", function()
    StandSave()
    VapeMOD:Notification("Stand Logging", "Successfully saved your stand LOG to the workspace folder.", "OK!")
end)

--[[ EXTRA / ADDONS ]]--

PlayerService.LocalPlayer.CharacterAdded:Connect(function(Character)
    wait(.1)
    
    if _G.StandFarm then
       StandFarm()
    end
end)

if game.PlaceId == (4643697430) then
    
   game:GetService("RunService").RenderStepped:Connect(function(...)
       if _G.HORSESPEED then
          local Horse = workspace:WaitForChild((game:GetService("Players").LocalPlayer.Name .. "'s Horse"))
       
          if Horse:FindFirstChild("HumanoidRootPart") then
          
             Horse:FindFirstChild("HumanoidRootPart").CFrame = Horse:FindFirstChild("HumanoidRootPart").CFrame + Horse:FindFirstChild("HumanoidRootPart").CFrame.LookVector * _G.HORSESPEEDVALUE
          end
       end
   end)
   
   local Hooks;

   Hooks = hookfunction(getrawmetatable(game).__namecall, function(self, ...)
       local Prod = { ... }
       
       if self.Name == ("RemoteEvent") then 
       
          if Prod[1] == ("Poison") and _G.ANTIPOISON then
             return
          elseif Prod[1] == ("UpdateWeatherTemperature") and _G.ANTIWEATHER then
             if Prod[2] == ("None") then return Hooks(self, ...) end
             return
          end
            
       end
       
       return Hooks(self, ...)
   end)
   
end
