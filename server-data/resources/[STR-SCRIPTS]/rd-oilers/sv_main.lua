RegisterNetEvent('rd-fuel:initFuel')
AddEventHandler('rd-fuel:initFuel', function(sentVeh)
	local veh = NetworkGetEntityFromNetworkId(sentVeh)
	if veh ~= 0 then
		Entity(veh).state.fuel = math.random(40, 60)
	end
end)

AddEventHandler('rd-fuel:setFuel', function(sentVeh, sentFuel)
	if type(sentFuel) == 'number' and sentFuel >= 0 and sentFuel <= 100 then
		if DoesEntityExist(sentVeh) then
			Entity(sentVeh).state.fuel = sentFuel
		else
			Entity(NetworkGetEntityFromNetworkId(sentVeh)).state.fuel = sentFuel
		end
	end
end)

local function GetFuel(sentVeh)
	if DoesEntityExist(sentVeh) then
		return Entity(sentVeh).state.fuel
	else
		return Entity(NetworkGetEntityFromNetworkId(sentVeh)).state.fuel
	end
end

exports('GetFuel', GetFuel) -- exports['rd-fuel']:GetFuel(veh)

RegisterNetEvent('rd-fuel:PurchaseSuccessfulCash', function(gprice)
	local pSrc = source
	local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)

	if user:getBalance() >= gprice then
		print("Gas Price Cash", gprice)
		user:removeMoney(gprice)
		TriggerClientEvent("rd-fuel:OfferAcceptedCash", pSrc)
	else
		TriggerClientEvent('DoLongHudText', pSrc, 'There is not enough money on it!', 2)
	end
end)

RegisterNetEvent('prd-fuel:PurchaseSuccessfulSelfServer', function(gprice)
	local pSrc = source
		
	TriggerClientEvent("prd-fuel:OfferAcceptedCash", pSrc)

end)

STR.register('rd-fuel:PurchaseSuccessful', function(src, gprice)
	local pSrc = src
	local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)
	print("OJHSDUIOJHJOH")
	print(gprice)
	if user:getBalance() >= gprice then
		print("OJHSDUIOJHJOH,2")
		print(gprice)
		user:removeBank(gprice)
		return true
	else
		TriggerClientEvent('DoLongHudText', pSrc, 'Not enough money in bank!', 2)
		return false
	end
end)

RegisterNetEvent('rd-fuel:Refund', function(gprice)
	local pSrc = source
	exports['rd-fw']:GetModule('AddBank')(pSrc, tonumber(gprice))
end)

RegisterNetEvent('rd-fuel:testing', function()
	local src = source
	local data = src
	TriggerClientEvent("rd-fuel:send_billSelf2",src ,data)
end)