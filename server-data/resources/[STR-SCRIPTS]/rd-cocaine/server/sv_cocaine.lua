RPC.register("heists:cocaine_paynow", function()
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    if user:getCash() >= 150000 then
        user:removeMoney(150000)
    return true
    else
        return false
    end
end)

RPC.register("heists:cocaine_start_vehicle", function()
    local src = source
    TriggerClientEvent('rd-heists:doVehicle', src, "dinghy",2004.4, 4007.85, 29.22)
    return 
end)

RPC.register("heists:cocaine_dump_vehicle", function(x,y,z)
    local src = source
    TriggerClientEvent('rd-heists:doVehicle', src, "sultan",x,y,z)
end)

RegisterServerEvent("fx:spell:target")
AddEventHandler("fx:spell:target", function(x,y,z,pTimesent)
    TriggerClientEvent("fx:do:Effect", -1, x,y,z ,pTimesent)
end)

pPlateNum = {}

RegisterServerEvent("rd-cocaine:create_coke_riddle")
AddEventHandler("rd-cocaine:create_coke_riddle", function(riddle)
    pPlateNum = riddle
end)

RPC.register("rd-cocaine:create_coke", function()
    local pTime = os.time()
        exports.oxmysql:execute('INSERT INTO inventory (item_id, name, information, slot, dropped, creationDate) VALUES (@item_id, @name, @information, @slot, @dropped, @creationDate)', {
            ['@item_id'] = 'coke50g',
            ['@name'] = 'Glovebox-'..pPlateNum,
            ['@information'] = '{}',
            ['@slot'] = '1',
            ['@dropped'] = '0',
            ['@creationDate'] = pTime
          --  ['@quality'] = '100'
        }, function()
       -- print('Number Plate: ' ..pPlateNum)
    end)
end)