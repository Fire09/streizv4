local isNancyEnabled = false
RegisterServerEvent('doctor:enableTriage')
AddEventHandler('doctor:enableTriage', function()
    isNancyEnabled = true
    TriggerEvent('doctor:setTriageState')
end)

RegisterServerEvent('doctor:disableTriage')
AddEventHandler('doctor:disableTriage', function()
    isNancyEnabled = false
    TriggerEvent('doctor:setTriageState')
end)

RegisterServerEvent('doctor:setTriageState')
AddEventHandler('doctor:setTriageState', function(pHospital)
    TriggerClientEvent('doctor:setTriageState', -1, pHospital, isNancyEnabled)
end)

RegisterServerEvent('rd-healthcare:updateBoardRoomUrl')
AddEventHandler('rd-healthcare:updateBoardRoomUrl', function(url)
    TriggerClientEvent('rd-healthcare:boardRoomUrlUpdated', -1, url)
    getDuiUrl = url
end)

local getDuiUrl = {}

STR.register("rd-healthcare:getBoardRoomUrl", function()
    if getDuiUrl ~= nil then
        getDuiUrl = 'https://i.imgur.com/5Ust2GQ.jpg'
    end
    return getDuiUrl
end)