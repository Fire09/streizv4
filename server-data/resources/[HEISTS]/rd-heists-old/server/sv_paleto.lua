local LootPaleto = false
CnaRob = true
Step1 = false

RegisterServerEvent("step1enable", function()
    local source = source
    Step1 = true
end)

RegisterServerEvent("rd-paleto:startCoolDown", function()
    local source = source
    CnaRob = false
    Available = false
    CreateThread(function()
        while true do
            Citizen.Wait(7200000)
            CnaRob = true
            Available = true
            TriggerServerEvent('rd-doors:change-lock-state', 45, true) 
        end
    end)
end)

RegisterServerEvent('rd-paleto:tut_tut')
AddEventHandler('rd-paleto:tut_tut', function()
    local src = source
    if not LootPaleto then
        LootPaleto = true
        TriggerClientEvent('rd-vault:grab', src)
        Citizen.Wait(40000)
        LootPaleto = false
    end
end)

RegisterServerEvent('rd-paleto:hacklaptop')
AddEventHandler('rd-paleto:hacklaptop', function()
    if Step1 then
        TriggerClientEvent('rd-paleto:startpaleto', source)
    end
end)