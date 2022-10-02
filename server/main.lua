-- 
--   ____      __  __      _____     ___   _ 
--   |  _ \  ___\ \/ /___  / _ \ \   / / | | |
--   | | | |/ _ \\  // _ \| | | \ \ / /| |_| |
--   | |_| |  __//  \ (_) | |_| |\ V / |  _  |
--   |____/ \___/_/\_\___(_)___/  \_/  |_| |_|
--                                            
--  
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")

function formatMoney(amount)
	local left,num,right = string.match(tostring(amount),'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1.'):reverse())..right
end

RegisterServerEvent('drent:cumparadexo')
AddEventHandler('drent:cumparadexo', function(amount, dexoveh)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local userBalance = vRP.getMoney({user_id})

	function adabaniludexo(price, vehic)
		vRP.setMoney({user_id, userBalance - amount})
		vRPclient.notify(source,{string.format("Succes: Ai inchiriat masina <span style='color:yellow'>%s</span>. Pentru <span style='color:green'>%s$</span>. Acum ai balanta egala cu <span style='color:red'>%s$</span>!",vehic,amount,formatMoney(userBalance))})
		inchiriat = true
		print(inchiriat)
		TriggerClientEvent("drent:spawneazaundexo", player, dexoveh)
	end

	function checkbani(amount)
		if userBalance < amount then 
			print("1")
			TriggerClientEvent('dexospuneacestmesaj:pines', player)
		else
			adabaniludexo(amount, dexoveh)
		end
	end

	checkbani(amount)
	print(user_id, amount, dexoveh)
end)