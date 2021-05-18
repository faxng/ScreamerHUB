local function RollArcade()
    local ArcadeInfo = {
        "EndDialogue",
        {NPC = "Item Machine", Option = "Option1", Dialogue = "Dialogue1"}
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
        unpack(ArcadeInfo))
end

local function AutoCount()
   return {}
end

game:GetService("RunService").RenderStepped:Connect(function(...)
    if _G.AutoArcade then
       RollArcade()
    end
    
    if _G.AutoCount then
       _G.Updated = AutoCount()
    end
end) 