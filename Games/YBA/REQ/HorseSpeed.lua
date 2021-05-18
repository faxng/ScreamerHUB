   local PlayerService = game:GetService("Players")   

   local function HorseCheck(Seated, SeatObj)
      if Seated then
         if SeatObj.Parent.Name == (game:GetService("Players").LocalPlayer.Name .. "'s Horse") then
            _G.SeatedH = true
         end
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

   local function NoHorseCheck()
      local Hum = PlayerService.LocalPlayer.Character["Humanoid"]
   
      if Hum.SeatPart == (nil) then
         _G.SeatedH = false
      end
   end

   CurrentCheck()

   PlayerService.LocalPlayer.CharacterAdded:Connect(function(Character)
       local Humanoid = Character:WaitForChild("Humanoid")
 
       Humanoid.Seated:Connect(HorseCheck)
       Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(NoHorseCheck)
   end)

   PlayerService.LocalPlayer.Character["Humanoid"].Seated:Connect(HorseCheck)  
   PlayerService.LocalPlayer.Character["Humanoid"]:GetPropertyChangedSignal("SeatPart"):Connect(NoHorseCheck)

   game:GetService("RunService").RenderStepped:Connect(function(...)
       if _G.HORSESPEED then
          local Horse = workspace:WaitForChild((game:GetService("Players").LocalPlayer.Name .. "'s Horse"))
       
          if Horse:FindFirstChild("HumanoidRootPart") and _G.SeatedH then
              
             Horse:FindFirstChild("HumanoidRootPart").CFrame = Horse:FindFirstChild("HumanoidRootPart").CFrame + Horse:FindFirstChild("HumanoidRootPart").CFrame.LookVector * _G.HORSESPEEDVALUE
          end
       end
   end)
