
RegisterNetEvent('rd-crafting:smgcraft')
AddEventHandler('rd-crafting:smgcraft', function()
    local hasItem = exports["rd-inventory"]:hasEnoughOfItem("key1", 1)
    if hasItem then
        TriggerEvent('server-inventory-open', '0003', 'Craft')
    else
        TriggerEvent('DoLongHudText', "You don't have a key!", 2)
    end
end)