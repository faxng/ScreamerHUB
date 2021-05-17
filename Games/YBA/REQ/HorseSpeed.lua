   local PlayerService = game:GetService("Players")   

   local function HorseCheck(Seated, SeatObj)
      warn(tostring(Seated), SeatObj.Parent.Name)
      
      if Seated then
         if SeatObj.Parent.Name == (game:GetService("Players").LocalPlayer.Name .. "'s Horse") then
            _G.SeatedH = true
         end
      else
         _G.SeatedH = false
      end
   end

   local function CurrentCheck()
      local Hum = PlayerService.LocalPlayer.Character["Humanoid"]
   
      if Hum.SeatPart ~= nil then
         if Hum.SeatPart.Parent.Name == (game:GetService("Players").LocalPlayer.Name .. "'s Horse") then
            _G.SeatedH = true
         end
      end
   
   end

   CurrentCheck()

   PlayerService.LocalPlayer.CharacterAdded:Connect(function(Character)
       local Humanoid = Character:WaitForChild("Humanoid")
 
       Humanoid.Seated:Connect(HorseCheck)
   end)

   PlayerService.LocalPlayer.Character["Humanoid"].Seated:Connect(HorseCheck)  
