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
		vRPclient.notify(source,{string.format("Succes: Ai primit masina %s. Pentru %s$. Acum ai balanta egala cu %s$!",vehic,amount,formatMoney(userBalance))})
		inchiriat = true
		print(inchiriat)
		TriggerClientEvent("drent:spawneazaundexo", player, dexoveh)
	end

	if adabaniludexo(amount, dexoveh) then
		print(inchiriat)
	end

	print(user_id, amount, dexoveh)
end)