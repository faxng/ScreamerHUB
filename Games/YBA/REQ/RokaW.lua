local function WarnUseRoka()
    local CB = Instance.new("BindableFunction")
    
    CB.OnInvoke = function(Text)
       if Text == ("Yes") then
          loadstring(game:HttpGet("https://raw.githubusercontent.com/ScreamerUWU/ScreamerHUB/main/Games/YBA/REQ/Roka.lua")()
       elseif Text == ("No") then
          return
       end
    end
    
   game.StarterGui:SetCore("SendNotification", {
     Title = "HUB;",
     Text = "This will roka your current stand, continue?",
     Duration = 999999,
     Button1 = "Yes",
     Button2 = "No",
     Callback = CB
   })
end

WarnUseRoka()
