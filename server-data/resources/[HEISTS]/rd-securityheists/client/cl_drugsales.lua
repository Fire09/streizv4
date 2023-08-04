--############--
--## Void RP##--
--############--

-- Start Of Clock In / Out --

local ChosenWeed = false
local ChosenCoke = false
local ChosenMeth = false

RegisterNetEvent('rd-drugsales:clockin')
AddEventHandler('rd-drugsales:clockin', function()
    if exports['rd-inventory']:hasEnoughOfItem('vpnxj', 1) then
        TriggerEvent('rd-illegal_activities:drug_run_choose')
    else
        TriggerEvent('DoLongHudText', 'You\'re Missing a VPN!', 2)
    end
end)

-- End Of Clock In / Out --

-- Start Of Picking Drug To Run --

RegisterNetEvent('rd-illegal_activities:drug_run_choose')
AddEventHandler('rd-illegal_activities:drug_run_choose', function()

	local iLikeDrugs = {
		{
            title = "Run Cocaine",
            description = "White Stuff",
            key = "EVENTS.COCAINE",
            action = 'rd-illegalactivivies:coke',
        },
        {
            title = "Run Meth",
            description = "Blue Crystals",
            key = "EVENTS.METH",
            action = 'rd-illegalactivivies:meth',
        },
    }
    exports["rd-ui"]:showContextMenu(iLikeDrugs)
end)

RegisterUICallback('rd-illegalactivivies:coke', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-illegalactivities:choose_coke')
end)

RegisterUICallback('rd-illegalactivivies:weed', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-illegalactivities:choose_weed')
end)

RegisterUICallback('rd-illegalactivivies:meth', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-illegalactivities:choose_meth')
end)

-- Coke Run

RegisterNetEvent('rd-illegalactivities:choose_coke')
AddEventHandler('rd-illegalactivities:choose_coke', function()
    if exports['rd-inventory']:hasEnoughOfItem('coke5g', 1) then
        ChosenCoke = true
        SetNewWaypoint(1533.4417724609,793.26593017578,77.487182617188)
        TriggerEvent('rd-drugs:drop_cocaine_blip')
        TriggerEvent('rd-illegalactivities:create_coke_ped')
        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You\'re GPS Has been updated.') 
    else
        TriggerEvent('DoLongHudText', 'You dont got any Coke to run', 2)
    end
end)

RegisterNetEvent('rd-drugs:drop_cocaine_blip')
AddEventHandler('rd-drugs:drop_cocaine_blip', function()
    CokeDropBlip = AddBlipForCoord(1533.4417724609,793.26593017578,77.487182617188)
    SetBlipSprite(CokeDropBlip, 514)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Cocaine Drop Location")
    EndTextCommandSetBlipName(CokeDropBlip)
end)

RegisterNetEvent('rd-drugs:do_drop_coke')
AddEventHandler('rd-drugs:do_drop_coke', function()
    TriggerEvent('rd-mdt:drugsale')
    if exports['rd-inventory']:hasEnoughOfItem('coke5g', 1) then
        exports['rd-ui']:openApplication('textbox', {
            callbackUrl = 'rd-illegalactivities:sell_coke',
            key = 1,
            items = {
            {
                icon = "comment-dollar",
                label = "Amount",
                name = "AmountCoke",
            },
            },
            show = true,
        })
    else
        TriggerEvent('DoLongHudText', 'I need Cocaine not thin air bwo', 2)
    end
end)

RegisterUICallback('rd-illegalactivities:sell_coke', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local CokePayment = math.random(50, 124)
    local cokeAmt = data.values.AmountCoke
    local pPaymentAmountCoke = CokePayment*cokeAmt

    if exports['rd-inventory']:hasEnoughOfItem('coke5g', cokeAmt) then
        if exports['rd-inventory']:hasEnoughOfItem('coke5g', cokeAmt) then
            local finished = exports['rd-taskbar']:taskBar(1250*cokeAmt, 'Selling Cocaine to the Dealer')
            if (finished == 100) then
                TriggerEvent('inventory:removeItem', 'coke5g', cokeAmt)
                exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You sold '..cokeAmt..'x 5g Coke Baggies.', 1)
                DeletePed(created_ped)
                RemoveBlip(CokeDropBlip)
                ChosenCoke = false
                    if exports['rd-buffs']:getJobLuckMultiplier() then
                        TriggerServerEvent('rd-payout', math.random(120,170) *cokeAmt)
                    else
                        TriggerServerEvent('rd-payout', math.random(100,142) *cokeAmt)
            end
        end
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have x' ..cokeAmt.. ' Coke5g On you.')
    end
end)

-- Coke Run End

-- Weed Run

RegisterNetEvent('rd-illegalactivities:choose_weed')
AddEventHandler('rd-illegalactivities:choose_weed', function()
    if exports['rd-inventory']:hasEnoughOfItem('weedq', 1) then
        ChosenWeed = true
        SetNewWaypoint(861.96923828125,-479.61758422852,30.00439453125)
        TriggerEvent('rd-drugs:drop_weed_blip')
        TriggerEvent('rd-illegalactivities:create_weed_ped')
        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You\'re GPS Has been updated.')
    else
        TriggerEvent('DoLongHudText', 'You dont got any weed to run', 2)
    end
end)

RegisterNetEvent('rd-drugs:drop_weed_blip')
AddEventHandler('rd-drugs:drop_weed_blip', function()
    WeedDropBlip = AddBlipForCoord(861.96923828125,-479.61758422852,30.00439453125)
    SetBlipSprite(WeedDropBlip, 469)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Weed Drop Location")
    EndTextCommandSetBlipName(WeedDropBlip)
end)

RegisterNetEvent('rd-drugs:do_drop')
AddEventHandler('rd-drugs:do_drop', function()
    TriggerEvent('rd-mdt:drugsale')

    if exports['rd-inventory']:hasEnoughOfItem('weedq', 1) then
        exports['rd-ui']:openApplication('textbox', {
            callbackUrl = 'rd-illegalactivities:sell_weed',
            key = 1,
            items = {
              {
                icon = "comment-dollar",
                label = "Amount",
                name = "AmountWeed",
              },
            },
          show = true,
        })
    else
        TriggerEvent('DoLongHudText', 'I need Weed Q\'s not thin air bwo', 2)
    end
end)

RegisterUICallback('rd-illegalactivities:sell_weed', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    local weedAmt = data.values.AmountWeed
    local WeedPayment = math.random(50, 100)
    local WeedQ = WeedPayment*data.values.AmountWeed

    if exports['rd-inventory']:hasEnoughOfItem('weedq', weedAmt) then
        if exports['rd-inventory']:hasEnoughOfItem('weedq', weedAmt) then
            TriggerEvent('inventory:removeItem', 'weedq', weedAmt)
           if exports['rd-buffs']:getJobLuckMultiplier() then
                TriggerServerEvent('rd-payout', math.random(90,160) *weedAmt)
                else
                    TriggerServerEvent('rd-payout', math.random(50,121) *weedAmt)
        end
            exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You sold '..weedAmt..'x Weed Q For $'..WeedQ)
            DeletePed(created_ped)
            RemoveBlip(WeedDropBlip)
            ChosenWeed = false
        end
    else
        TriggerEvent('DoLongHudText', 'You dont have x' ..weedAmt.. ' Weed Q On you.')
    end
end) 

-- Weed Run End --

-- Meth Run --

RegisterNetEvent('rd-illegalactivities:choose_meth')
AddEventHandler('rd-illegalactivities:choose_meth', function()
    if exports['rd-inventory']:hasEnoughOfItem('meth1g', 1) then
        ChosenMeth = true
        SetNewWaypoint(-1584.9099121094,-838.73406982422,10.138427734375)
        TriggerEvent('rd-drugs:drop_meth_blip')
        TriggerEvent('rd-illegalactivities:create_meth_ped')
        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You\'re GPS Has been updated.')
    else
        TriggerEvent('DoLongHudText', 'You dont got any Meth to run', 2)
    end
end)

RegisterNetEvent('rd-drugs:drop_meth_blip')
AddEventHandler('rd-drugs:drop_meth_blip', function()
    MethDropBlip = AddBlipForCoord(-1584.9099121094,-838.73406982422,10.138427734375)
    SetBlipSprite(MethDropBlip, 514)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Meth Drop Location")
    EndTextCommandSetBlipName(MethDropBlip)
end)

RegisterNetEvent('rd-drugs:do_drop_meth')
AddEventHandler('rd-drugs:do_drop_meth', function()
    TriggerEvent('rd-mdt:drugsale')
    if exports['rd-inventory']:hasEnoughOfItem('meth1g', 1) then
        exports['rd-ui']:openApplication('textbox', {
            callbackUrl = 'rd-illegalactivities:sell_meth',
            key = 1,
            items = {
              {
                icon = "comment-dollar",
                label = "Amount",
                name = "AmountMeth",
              },
            },
          show = true,
        })
    else
        TriggerEvent('DoLongHudText', 'I need Meth not thin air bwo', 2)
    end
end)

RegisterUICallback('rd-illegalactivities:sell_meth', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    print(data.values.AmountMeth)
    local MethDropPayment = math.random(75, 175)
    local methAmt = data.values.AmountMeth
    local pPaymentAmountMeth = MethDropPayment*methAmt
    if exports['rd-inventory']:hasEnoughOfItem('meth1g', methAmt) then
        TriggerEvent('inventory:removeItem', 'meth1g', methAmt)
       if exports['rd-buffs']:getJobLuckMultiplier() then
            TriggerServerEvent('rd-payout', math.random(150,180) *methAmt)
            else
            TriggerServerEvent('rd-payout', math.random(100,162) *methAmt)
    end
        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'You sold '..methAmt..'x Meth Baggies.')
        DeletePed(created_ped)
        RemoveBlip(MethDropBlip)
        ChosenMeth = false
    else
        TriggerEvent('DoLongHudText', 'You dont have x' ..methAmt.. ' Meth Baggies On you.', 2)
    end
end)

-- Meth Run End --

-- Start Of Weed Interact --

-- Weed Ped --
exports["rd-polytarget"]:AddBoxZone("arp_weed_do_drop", vector3(862.07, -479.68, 30.01), 0.8, 0.8, {
    heading=0,
    --debugPoly=true,
    minZ=27.01,
    maxZ=31.01
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("arp_weed_do_drop", {{
    event = "rd-drugs:do_drop",
    id = "arp_weed_do_drop",
    icon = "comment-dollar",
    label = "Sell",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return ChosenWeed
    end,
});
-- End Weed Ped --

-- Start Coke Ped -- 

exports["rd-polytarget"]:AddBoxZone("arp_coke_do_drop", vector3(1533.38, 793.12, 77.51), 1, 1, {
    heading=330,
    --debugPoly=true,
    minZ=74.71,
    maxZ=78.71
})

-- End Coke Ped --

-- Start Meth Ped -- 

exports["rd-polytarget"]:AddBoxZone("arp_meth_do_drop", vector3(-1584.65, -838.81, 9.96), 1.5, 1.3, {
    heading=320,
    --debugPoly=true,
    minZ=7.36,
    maxZ=11.36
})

exports["rd-interact"]:AddPeekEntryByPolyTarget("arp_meth_do_drop", {{
    event = "rd-drugs:do_drop_meth",
    id = "arp_meth_do_drop",
    icon = "comment-dollar",
    label = "Sell",
    parameters = {},
}}, {
    distance = { radius = 2.5 },
    isEnabled = function()
        return ChosenMeth
    end,
});

-- End Meth Ped --

-- End Of Weed Interact --

-- Start Of All Peds --

RegisterNetEvent('rd-illegalactivities:create_weed_ped')
AddEventHandler('rd-illegalactivities:create_weed_ped', function()
    modelHash = GetHashKey("csb_ramp_gang")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , 861.96923828125,-479.61758422852,30.00439453125  -1, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityHeading(created_ped, 51.0)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_AA_SMOKE", 0, true)
end)

RegisterNetEvent('rd-illegalactivities:create_coke_ped')
AddEventHandler('rd-illegalactivities:create_coke_ped', function()
    modelHash = GetHashKey("g_m_importexport_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , 1533.4417724609,793.26593017578,77.487182617188  -1, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityHeading(created_ped, 180.0)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_AA_SMOKE", 0, true)
end)

RegisterNetEvent('rd-illegalactivities:create_meth_ped')
AddEventHandler('rd-illegalactivities:create_meth_ped', function()
    modelHash = GetHashKey("g_m_importexport_01")
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do
        Wait(1)
    end
    created_ped = CreatePed(0, modelHash , -1584.9099121094,-838.73406982422,10.138427734375  -1, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityHeading(created_ped, 45.0)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "WORLD_HUMAN_AA_SMOKE", 0, true)
end)

-- End Of Peds --