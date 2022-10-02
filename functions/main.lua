-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

function rent_vehicle(model, price, location)
	for k,v in pairs(Config.Locations) do 
		if k == location then
			local spawn_coords = v.spawn_coords
			print("^0[^1DRENT^0] RENT ^2SUCCES")
			print("^0[^1DRENT^0] MODEL: ^1"..model)
			print("^0[^1DRENT^0] PRICE: ^1"..price)
			print("^0[^1DRENT^0] LOCATION: ^1"..location)
			TriggerServerEvent('drent:cumparadexo', price, model)
		end
	end
end

function open_ui(location)

	local vehicles = {}

	for k,v in pairs(Config.Vehicles) do 
		table.insert(vehicles, {location = location,  model = k, label = v.label, description = v.description, price = v.price, type = v.type, image = v.image_name})
	end

	TriggerScreenblurFadeIn(1)
	SendNUIMessage({action = 'open', content = { vehicles = vehicles }})
	SetNuiFocus(true, true)

	InMenu = true
end

function close_ui()
  TriggerScreenblurFadeOut(1000)
	SendNUIMessage({action = "close"})
	SetNuiFocus(false, false)

	InMenu = false
end

RegisterNetEvent('drent:spawneazaundexo')
AddEventHandler('drent:spawneazaundexo', function(model)
dexospawnmasina(model, Config.Locations.coords)
  close_ui()
end)

function dexospawnmasina(masina,pos)
	local dexoped = PlayerPedId()
    local hash = GetHashKey(masina)
    local n = 0
    while not HasModelLoaded(hash) and n < 500 do
        RequestModel(hash)
        Citizen.Wait(100)
        n = n+1
    end

    if HasModelLoaded(hash) then
		for k, v in pairs(Config.Locations) do
		local coords = vector3(v.coords.x, v.coords.y, v.coords.z)
        Inchiriat = false
        veh = CreateVehicle(hash, coords, GetEntityHeading(dexoped),true,false)
        SetEntityHeading(veh,GetEntityHeading(dexoped))
        SetEntityInvincible(veh,false)
        SetModelAsNoLongerNeeded(hash)
        SetVehicleNumberPlateTextIndex(veh,2)
        SetVehicleNumberPlateText(veh,"[ RENT ]")
        SetPedIntoVehicle(dexoped,veh,-1)
		if Config.Options.time == true then
        	Citizen.SetTimeout(Config.Options.time_rent * 60 * 1000,function()
        	    if DoesEntityExist(veh) then
        	        Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
					exports['vrp_notify']:DoShortHudText("info", Config.Options.time_finished, "Info")
        	    end
        	end)
		end
	end
    else
        exports['vrp_notify']:DoShortHudText("error", Config.Options.car_error, "Error")
    end    
end

RegisterNetEvent('dexospuneacestmesaj:pines')
AddEventHandler('dexospuneacestmesaj:pines', function()
	exports['vrp_notify']:DoShortHudText("error", Config.Options.rent_no_money, "Error")
end)

function DrawText3D(x, y, z, text)
	local px, py, pz = table.unpack(GetEntityCoords(PlayerPedId()))

	local distance = GetDistanceBetweenCoords(x, y, z, px, py, pz, false)

	if distance <= 6 then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(true)
		AddTextComponentString(text)
		SetDrawOrigin(x,y,z, 0)
		DrawText(0.0, 0.0)
		local factor = (string.len(text)) / 370
		DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
		ClearDrawOrigin()
	end
end