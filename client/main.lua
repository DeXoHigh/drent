-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
InMenu = false

  Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
        sleep = true
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Locations) do
            if not InMenu then
                local distance = #(coords - v.coords)

                    if distance < 3 then
                        sleep = false
                        DrawText3D(v.coords.x, v.coords.y, v.coords.z + 0.35, v.markers.spawn.text)
                        if IsControlJustReleased(0, v.markers.spawn.key) then
                            open_ui(k)
                        end
                    end

                    if distance <= 7 then
                        sleep = false
                        DrawMarker(v.markers.spawn.type, v.coords.x, v.coords.y, v.coords.z - 0.10, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.markers.spawn.size.x, v.markers.spawn.size.y, v.markers.spawn.size.z, v.markers.spawn.color.r, v.markers.spawn.color.g, v.markers.spawn.color.b, 50, false, true, 2, false, nil, nil, false)
                    end
            end
        end
        if sleep then
            Citizen.Wait(150)
        end
    end
end)

for k, v in pairs(Config.Locations) do
	rent = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
	SetBlipSprite (rent, v.blips.spawn.sprite)
	SetBlipDisplay(rent, 4)
	SetBlipScale  (rent, 0.65)
	SetBlipAsShortRange(rent, true)
	SetBlipColour(rent, v.blips.spawn.color)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(v.blips.spawn.name)
	EndTextCommandSetBlipName(rent)
end
