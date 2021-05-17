local PlayerService = game:GetService("Players")
local Group = (3194064)

PlayerService.PlayerAdded:Connect(function(Player)
    if Player:IsInGroup(Group) and _G.AutoKick then
       PlayerService["LocalPlayer"]:Kick("YBA ASSOCIATE JOINED:", Player.Name)
    end
end)
