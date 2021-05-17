local function RollArcade()
    local ArcadeInfo = {
        "EndDialogue",
        {NPC = "Item Machine", Option = "Option1", Dialogue = "Dialogue1"}
    }
    game:GetService("Players").LocalPlayer.Character.RemoteEvent:FireServer(
        unpack(ArcadeInfo))
end

RollArcade()
