local VirtualService = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:Connect(function()
    if _G.AFK then
       VirtualService:CaptureController()
       VirtualService:ClickButton2(Vector2.new())
    end
end)