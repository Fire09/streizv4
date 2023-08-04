RegisterServerEvent("lift:up:serverx")
AddEventHandler("lift:up:serverx", function()
    local src = source
    TriggerClientEvent("lift:up", -1, src)
end)

RegisterServerEvent("lift:down:serverx")
AddEventHandler("lift:down:serverx", function()
    local src = source
    TriggerClientEvent("lift:down", -1, src)
end)

RegisterServerEvent("lift:stop:serverx")
AddEventHandler("lift:stop:serverx", function()
    local src = source
    TriggerClientEvent("lift:stop", -1, src)
end)