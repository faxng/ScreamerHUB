local MarketPlaceService = game:GetService("MarketplaceService")

local AutoPickUPM = {
 { 
  Mesh = ("rbxassetid://3497428510"), 
  ItemName = ("Rokakaka"),
  Max = 25
 },
 { 
  Mesh = ("rbxassetid://4496695972"), 
  ItemName = ("Mysterious Arrow"),
  Max = 25
 },
 { 
  Mesh = ("rbxassetid://3583727108"), 
  ItemName = ("Gold Coin"),
  Max = 45
 },
 { 
  Mesh = ("rbxassetid://4551120971"), 
  ItemName = ("Stone Mask"),
  Max = 10
 },
 { 
  Mesh = ("rbxassetid://5675321032"), 
  ItemName = ("DEO's Diary"),
  Max = 10
 },
 { 
  Mesh = ("rbxassetid://5291254518"), 
  ItemName = ("Steel Ball"),
  Max = 10
 },
 { 
  Mesh = ("rbxassetid://5249254947"), 
  ItemName = ("Rib Cage of The Saint's Corpse"),
  Max = 10
 },
 { 
  Mesh = ("180620778"), 
  ItemName = ("Quinton's Glove"),
  Max = 10
 }, 
 { 
  Mesh = ("60791940"), 
  ItemName = ("Anicent Scroll"),
  Max = 10
 },
}

if MarketPlaceService:UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 14597778) then
   for i = 1,#AutoPickUPM do
      AutoPickUPM[i].Max = (AutoPickUPM[i].Max * 2)
   end
end

local function CheckAmount(Name, Check)
   
   local Found = 0

   for Index, Value in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
      if Value.Name == (Name) then
         Found = Found + 1
      end
   end

   if Found == (Check) or Found > Check then
      return false
   else
      return true
   end
end

local function CheckItem(Model)
   if Model:FindFirstChildOfClass("MeshPart") then
      for i = 1,#AutoPickUPM do
         if AutoPickUPM[i].Mesh == (Model:FindFirstChildOfClass("MeshPart").MeshId) then
            
            if AutoPickUPM[i].ItemName == ("Rokakaka") or AutoPickUPM[i].ItemName == ("Mysterious Arrow") then
               if AutoPickUPM[i].ItemName == ("Rokakaka") then
                  if Model:FindFirstChildOfClass("MeshPart").Material == (Enum.Material.ForceField) then
                     local PureInfo = {
                      ItemName = ("Pure Rokakaka"),
                      Max = 10
                     }

                     if MarketPlaceService:UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 14597778) then
                        PureInfo.Max = 20
                     end

                     if not CheckAmount(PureInfo.ItemName, PureInfo.Max) then
                        return true
                     end
                  end
               end
               
               if AutoPickUPM[i].ItemName == ("Mysterious Arrow") then
                  if Model:FindFirstChildOfClass("MeshPart"):FindFirstChild("Attachment"):FindFirstChild("ParticleEmitter2") then
                     local LuckyInfo = {
                      ItemName = ("Lucky Arrow"),
                      Max = 10
                     }

                     if MarketPlaceService:UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 14597778) then
                        LuckyInfo.Max = 20
                     end

                     if not CheckAmount(LuckyInfo.ItemName, LuckyInfo.Max) then
                        return true
                     end

                  end
               end

               if not CheckAmount(AutoPickUPM[i].ItemName, AutoPickUPM[i].Max) then
                  return true
               else
                  return false
               end
            end
         end
      end 
   end
end

local function ItemCollect(Child)
   if Child.Name == ("Item") and _G.AutoPickupEnabled and Child:IsA("Model") then
  
      local CD = Child:WaitForChild("ClickDetector")
      
      if Child:FindFirstChild("ClickDetector") then
         
         local Player = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
         local Item = Child:WaitForChild("Base") or Child:WaitForChild("Part")

         local Magnitude = (Player.Position - Item.Position).Magnitude
            
         if Magnitude > 70 then
            return
         else
            local Attempt = 0
            local TargetInfo = CheckItem(Child)
            
            if not TargetInfo then return end
        
            repeat
                 wait()
            Attempt = Attempt + 1
            fireclickdetector(Child:WaitForChild("ClickDetector"))
            until not Child or Attempt > 1000
         end
      end
   end
end

workspace.ChildAdded:Connect(ItemCollect)
