   local PlayerService = game:GetService("Players")   

   local function HorseCheck(Seated, SeatObj)
      warn(tostring(Seated), SeatObj.Parent.Name)
      
      if Seated then
         if SeatObj.Parent.Name == (game:GetService("Players").LocalPlayer.Name .. "'s Horse") then
            _G.SeatedH = true
            
            warn("TRUE!")
         end
      end

      if not Seated and SeatObj == nil then
         _G.SeatedH = false
      end
   end

   PlayerService.LocalPlayer.CharacterAdded:Connect(function(Character)
       local Humanoid = Character:WaitForChild("Humanoid")
 
       Humanoid.Seated:Connect(HorseCheck)
   end)

   PlayerService.LocalPlayer.Character["Humanoid"].Seated:Connect(HorseCheck)
