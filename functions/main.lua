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
  local myPed = PlayerPedId()
  local player = PlayerId()
  local vehicle = GetHashKey(model)
  RequestModel(vehicle)
  while not HasModelLoaded(vehicle) do
    Wait(1)
  end
  local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0, 5.0, 0)
  local spawned_car = CreateVehicle(vehicle, coords, GetEntityHeading(myPed), true, false)
  SetVehicleOnGroundProperly(spawned_car)
  SetVehicleNumberPlateText(spawned_car, "- RENT -")
  SetModelAsNoLongerNeeded(vehicle)
  SetPedIntoVehicle(myPed,spawned_car,-1)
  Citizen.InvokeNative(0xB736A491E64A32CF,Citizen.PointerValueIntInitialized(spawned_car))
  close_ui()
end)

RegisterNetEvent('succes:message')
AddEventHandler('succes:message', function()
	exports['vrp_notify']:DoShortHudText("success", "Ai inchiriat o masina", "Succes")
end)

RegisterNetEvent('errorbani:message')
AddEventHandler('errorbani:message', function()
	exports['vrp_notify']:DoShortHudText("error", "Nu ai destui bani.", "Error")
end)