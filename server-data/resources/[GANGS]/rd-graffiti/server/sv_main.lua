
RegisterServerEvent("rd-sprays:purchaseGangSpray", function(sprayModel)

    local pSrc = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)

    print(json.encode(user:getCash())) 


    if user:getCash() >= 5000 then
        user:removeMoney(5000)
        local information = {
            ["model"] = sprayModel,
        }
        print(json.encode(information))
        
        TriggerClientEvent('player:receiveItem', source, 'spraycan', 1, false, information)
         
    else
        TriggerClientEvent('DoLongHudText', source, 'Not enough cash.', 2) 
    end
end)

STR.register('rd-sprays:purchaseScrubbingCloth', function()
    local user = exports['rd-base']:getModule("Player"):GetUser(source)

    if user:getCash() >= 50000 then
        user:removeMoney(50000)
        TriggerClientEvent('player:receiveItem', source, 'scrubbingcloth', 1)
    else
        TriggerClientEvent('DoLongHudText', source, 'Not enough cash.', 2)
    end
end)