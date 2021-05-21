local function RollArcade()
    local ArcadeInfo = {
        "EndDialogue",
        {NPC = "Item Machine", Option = "Option1", Dialogue = "Dialogue1"}
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
        unpack(ArcadeInfo))
end

local ItemCount(ITEM)

   local Found = 0

   for I, V in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
      if V.Name == (ITEM) then
         Found = (Found + 1)
      end
   end

end

local function AutoCount()
   for i = 1,#_G.ItemCounter do
   
      local Count = ItemCount(_G.ItemCounter[i].ItemName)
    
      _G.ItemCounter[i].Amount = (Count)
      _G.ItemCounter[i].TextObject.Text = (_G.ItemCounter[i].ItemName .. ": " .. _G.ItemCounter[i].Amount)
   end
end

game:GetService("RunService").RenderStepped:Connect(function(...)
    if _G.AutoArcade then
       RollArcade()
    end
    
    if _G.AutoCount then
       AutoCount()
    end
end) 
