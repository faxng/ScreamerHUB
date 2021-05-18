   local Hooks;

   Hooks = hookfunction(getrawmetatable(game).__namecall, function(self, ...)
       local Prod = { ... }
       
       if not self.Name == ("RemoteEvent") then return Hooks(self, ...) end
       
       if Prod[1] == ("Poison") and _G.ANTIPOISON then
          return
       elseif Prod[1] == ("UpdateWeatherTemperature") and _G.ANTIWEATHER then
          if Prod[2] == ("None") then return Hooks(self, ...) end
          return
       end
       
       return Hooks(self, ...)
   end)
