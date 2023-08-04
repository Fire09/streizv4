RegisterServerEvent('GPSTrack:Accepted')
AddEventHandler('GPSTrack:Accepted', function(x,y,z,stage)
	local srcid = source
	TriggerClientEvent("GPSTrack:Accepted",-1,x,y,z,srcid,stage)
end)

local max_number_weapons = 55
local cost_radio = 100

RegisterServerEvent('car:spotlight')
AddEventHandler('car:spotlight', function(state)
	local serverID = source
	TriggerClientEvent('car:spotlight', -1, serverID, state)
end)

local locations = {}

 RegisterNetEvent("facewear:adjust")
 AddEventHandler("facewear:adjust", function(pTargetId, pType, pShouldRemove)
 	TriggerClientEvent("facewear:adjust", pTargetId, pType, pShouldRemove)
 end)

RegisterCommand("anchor", function(source, args, rawCommand)
    TriggerClientEvent('client:anchor', source)
end)

RegisterCommand("roll", function(source, args, rawCommand)
TriggerClientEvent("roll", source, args[1], args[2])
end)

RegisterServerEvent('actionclose')
AddEventHandler('actionclose', function(player,text,id)
    TriggerClientEvent('outlawNoticeRangeText', player, id, text)
end)