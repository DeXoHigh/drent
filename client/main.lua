--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- SCRIPT BY REDYY#0449
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PlayerData = nil
InMenu = false

Citizen.CreateThread(function()
    Wait(1000)
    while true do 
        Citizen.Wait(40)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Locations) do
            if not InMenu then
                local distance = #(coords - v.coords)
                if distance < 5 then
                    if IsControlJustReleased(1--[[input group]],  51--[[control index]]) then
                        if IsInVehicle() then
                            exports['vrp_notify']:DoShortHudText("error", "Esti intr-o masina.", "Error")
                          else
                            open_ui(k)
                        end
                    end
                end
            end
        end
    end
end)

function IsInVehicle()
    local ply = PlayerPedId()
    if IsPedSittingInAnyVehicle(ply) then
      return true
    else
      return false
    end
  end