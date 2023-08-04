local CoordTable = Config.CoordTable


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(10)
        getStorageUnitsData()
        return
    end
end)

function getStorageUnitsData()
    for k,v in pairs(CoordTable) do
        exports.oxmysql:execute(
        'SELECT * FROM storages_units WHERE id = @value',{['@value'] = k},
        function(result)
            result = result[1]
            local Settings = CoordTable[k]
            Settings["buy"] = result.buy
            Settings["password"] = result.password
        end)
    end
end

RegisterNetEvent('rd-storageunits:getTables')
AddEventHandler('rd-storageunits:getTables', function(source)
    local src = source
    TriggerClientEvent('rd-storageunits:getTable', -1, CoordTable)
end)

RPC.register("rd-storageunits:BuyStorage",function(pSource,pPrice)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    if user:getCash() >= pPrice.param then
        user:removeMoney(pPrice.param)
    else
       -- TriggerClientEvent('DoLongHudText', src, 'You do not have enough money !', 2)
    end
    return true
end)

RegisterNetEvent('rd-storageunits:buyStorages')
AddEventHandler('rd-storageunits:buyStorages', function(value, source)
    local Settings = CoordTable[''..value..'']
    Settings["buy"] = true
    exports.oxmysql:execute("UPDATE storages_units SET buy = @buy WHERE id = @id", {
        ['@buy'] = "true",
        ['@id'] = value
    })
    getStorageUnitsData()
end)

local storageId = {}

RegisterNetEvent('storageUnitssendId')
AddEventHandler('storageUnitssendId', function(pStorageId)
    storageId = pStorageId
end)

RPC.register("rd-storageunits:CheckStoragePassword", function(pSource)
    exports.oxmysql:execute("SELECT `password` FROM `storages_units` WHERE id = @id", {
        ['id'] = storageId}, 
        function(result)
          --  print(result[1].password)
            local data = result[1].password
            TriggerClientEvent("StorageUnitsServerPassword", pSource, data)
    end)
end)

RegisterNetEvent('rd-storageunits:SelectPassword')
AddEventHandler('rd-storageunits:SelectPassword', function(pStorageId, pStoragePassword)
local update = exports.oxmysql:execute("UPDATE storages_units SET password = @password WHERE id = @id", {
  ["password"] = pStoragePassword,
  ["id"] = pStorageId
})
if not update then return false end
end)