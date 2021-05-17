local function Sell(Name, Wait, AS)

    local Success, Error = pcall(function()
      
    local Info = {
        "EndDialogue",
        {NPC = "Merchant", Option = "Option1", Dialogue = "Dialogue5"}
    }

    local Amount = 0
    local SellAmount = AS

    if SellAmount == "" or tonumber(SellAmount) == tonumber(0) then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
                
                if not _G.SellEnabled then return end
                
                Obj.Parent = game:GetService("Players").LocalPlayer.Character

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    unpack(Info))
                wait(Time)
            end
        end

    end

    if SellAmount ~= "" and tonumber(SellAmount) ~= 0 then

        for Index, Obj in pairs(
                              game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if Obj.Name == (Name) then
                

                if Amount == tonumber(SellAmount) then return end
                if not _G.SellEnabled then return end

                Amount = Amount + 1

                Obj.Parent = game:GetService("Players").LocalPlayer.Character

                game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
                    unpack(Info))
                wait(Time)
            end
        end

    end
    
   end)
  
   if not Success then
      warn(Error)
   end
end

Sell(_G.CurrentSell, 0, _G.SellAmount)
