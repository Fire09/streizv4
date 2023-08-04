Citizen.CreateThread(function()
    local deleteEmails = Await(SQL.execute("DELETE FROM character_emails", {}))
    local deleteTwitter = Await(SQL.execute("DELETE FROM phone_tweets", {}))
    local deleteYp = Await(SQL.execute("DELETE FROM phone_yp", {}))
end)

RegisterNetEvent('rd-phone:showGasPrice')
AddEventHandler('rd-phone:showGasPrice', function(targetId, pFuelCost)
    local pSrc = source
    
	if targetId ~= nil then
        TriggerClientEvent('rd-phone:GasStationConfirm', targetId, pFuelCost, pSrc)
    end
end)

RegisterServerEvent('phone:triggerPager')
AddEventHandler('phone:triggerPager', function(hospital)
    TriggerClientEvent('phone:triggerPager', -1, hospital)
end)