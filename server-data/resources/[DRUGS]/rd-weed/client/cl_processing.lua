local inWeedRun = false
local pHasPackaged = false
local pStartedPackaging = false
local pSentNoti = false
local CurrentDeliveryNPC
local pDeliverAmt = 0

RegisterNetEvent('rd-weed:package_smallbud')
AddEventHandler('rd-weed:package_smallbud', function()
    if exports['rd-inventory']:hasEnoughOfItem('smallbud', 10) then
        if not pStartedPackaging then
            pStartedPackaging = true
            local finished = exports['rd-taskbar']:taskBar(10000, 'Preparing')
            if finished == 100 then
                TriggerEvent('inventory:removeItem', 'smallbud', 10)
                TriggerEvent('DoLongHudText', 'Stay nearby for a few minutes while i package this', 1)
                Citizen.Wait(60000)
                pHasPackaged = true
            end
        else
            TriggerEvent('DoLongHudText', 'You\'re already waiting on a package.', 2)
        end
    end
end)

RegisterNetEvent('rd-weed:grab_package')
AddEventHandler('rd-weed:grab_package', function()
    if pHasPackaged then
        TriggerEvent('player:receiveItem', 'weedpackage', 1)
        pStartedPackaging = false
        pHasPackaged = false
    end
end)

function WeedPackaged()
    if pHasPackaged == 1 then
      pHasPackaged = true
    elseif pHasPackaged == 0 then
      pHasPackaged = false
    end
    return pHasPackaged
end
  

-- Weed Run --

-- Sign In

local InteractHandOff = {
    data = {
      {
        id = 'crim_taco_handoff',
        label = 'deliver package',
        icon = 'hand-holding',
        event = 'rd-weed:deliver_package',
        parameters = {},
      },
    },
    options = {
      distance = { radius = 2.5 },
      npcIds = { 'npc_weed_package_dropoff' },
      isEnabled = function(pEntity, pContext)
        return pCanDeliver
      end,
    },
  }

DropOffsClose = {
    [1] = {['x'] = -1546.747, ['y'] = -586.5095, ['z'] = 34.941089, ['h'] = 302.75042},
    [2] = {['x'] = -1678.297, ['y'] = -408.6895, ['z'] = 43.922473, ['h'] = 150.17553},
    [3] = {['x'] = -1706.736, ['y'] = -453.3375, ['z'] = 42.649162, ['h'] = 138.2274},
    [4] = {['x'] = 178.88632, ['y'] = 293.1408, ['z'] = 105.36894, ['h'] = 1.9567621},
    [5] = {['x'] = 267.57949, ['y'] = 270.64007, ['z'] = 105.63394, ['h'] = 339.72204},
    [6] = {['x'] = 397.34161, ['y'] = 175.90946, ['z'] = 103.85585, ['h'] = 67.40361},
    [7] = {['x'] = 550.86889, ['y'] = -154.5866, ['z'] = 57.035644, ['h'] = 285.70181},
    [8] = {['x'] = 596.25097, ['y'] = -427.4638, ['z'] = 24.740036, ['h'] = 267.79296},
    [9] = {['x'] = 679.57879, ['y'] = -886.6347, ['z'] = 23.460855, ['h'] = 88.687026},
    [10] = {['x'] = 707.65917, ['y'] = -1142.507, ['z'] = 23.495204, ['h'] = 92.68473},
    [11] = {['x'] = 991.58697, ['y'] = -1550.522, ['z'] = 30.75485, ['h'] = 340.62316},
    [12] = {['x'] = 1077.8724, ['y'] = -2334.022, ['z'] = 30.271074, ['h'] = 270.12127},
    [13] = {['x'] = 1077.8724, ['y'] = -2334.022, ['z'] = 30.271074, ['h'] = 270.12127},
    [14] = {['x'] = 1122.6275, ['y'] = -1571.672, ['z'] = 35.379013, ['h'] = 129.94602},
    [15] = {['x'] = 1002.4105, ['y'] = -1527.987, ['z'] = 30.835784, ['h'] = 197.2785},
    [16] = {['x'] = 1002.4105, ['y'] = -1527.987, ['z'] = 30.835784, ['h'] = 197.2785},
    [17] = {['x'] = 932.93029, ['y'] = -1151.26, ['z'] = 25.952497, ['h'] = 274.3402},
    [18] = {['x'] = -1339.11, ['y'] = -941.5256, ['z'] = 12.353552, ['h'] = 289.78585},
    [19] = {['x'] = -1166.38, ['y'] = -1109.188, ['z'] = 2.2394247, ['h'] = 151.31536},
    [20] = {['x'] = -1177.871, ['y'] = -1184.375, ['z'] = 5.6179394, ['h'] = 280.83984},    
}

DeliveryNpcs = {
    'a_f_m_downtown_01',
    'a_m_m_tourist_01',
    'a_m_o_soucent_03',
    'a_m_y_juggalo_01',
    'a_m_y_soucent_02',
    'a_m_y_vinewood_01',
    'g_m_y_famfor_01',
    'g_m_y_mexgang_01',
    'g_m_m_chigoon_01',
    'g_f_importexport_01',
  }

local weedAttach = {
    ["animDict"] = "anim@heists@narcotics@trash",
    ["animName"] = "drop_side",
    ["model"] = `hei_prop_heist_weed_block_01`,
    ["bone"] = 28422,
    ["x"] = 0.01,
    ["y"] = -0.02,
    ["z"] = -0.12,
    ["xR"] = 0.0,
    ["yR"] = 0.0,
    ["zR"] = 0.0,
    ["vertexIndex"] = 0,
}

RegisterNetEvent('rd-weed:get_delivery')
AddEventHandler('rd-weed:get_delivery', function()
    if pDeliverAmt == 3 then
        pDeliverAmt = 0
        inWeedRun = false
        pSentNoti = false
        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'Run complete.', 1)
        return
    end
    if inWeedRun then
        pDeliverAmt = pDeliverAmt + 1
        pSentNoti = false
    end
    inWeedRun = true
    exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'Drive to the delivery location with the goods.', 1)

    rnd = math.random(1, #DropOffsClose)
    pDropOff = AddBlipForCoord(DropOffsClose[rnd]["x"],DropOffsClose[rnd]["y"],DropOffsClose[rnd]["z"])
    SetBlipSprite(pDropOff, 514)
    SetBlipScale(pDropOff, 1.0)
    SetBlipAsShortRange(pDropOff, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Delivery Location")
    EndTextCommandSetBlipName(pDropOff)
    SetBlipRoute(pDropOff, true)
    SetBlipRouteColour(pDropOff, 25)
    SetBlipColour(pDropOff, 25)

    TriggerEvent('rd-weed:create_ped')
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if inWeedRun then
                local distance = #(vector3(DropOffsClose[rnd]["x"],DropOffsClose[rnd]["y"],DropOffsClose[rnd]["z"]) - GetEntityCoords(PlayerPedId()))
                if distance < 40 then
                    if not pSentNoti then
                        exports["rd-phone"]:DoPhoneNotification("home-screen", "CURRENT", 'Deliver the package.', 1)
                        pSentNoti = true
                        pCanDeliver = true
                    end
                end
            end
        end
    end)
end)

RegisterNetEvent("rd-weed:create_ped")
AddEventHandler("rd-weed:create_ped", function()
    Citizen.Wait(5000)
    local coords = vector3(DropOffsClose[rnd]["x"],DropOffsClose[rnd]["y"],DropOffsClose[rnd]["z"] - 1.0)
    local data = {
        id = 'npc_weed_package_dropoff',
        position = {
            coords = coords,
            heading = DropOffsClose[rnd]["h"],
        },
        pedType = 4,
        model = DeliveryNpcs[math.random(1,#DeliveryNpcs)],
        networked = true,
        distance = 50.0,
        settings = {
            { mode = 'invincible', active = true },
            { mode = 'ignore', active = true },
            { mode = "freeze", active = false }
        },
        flags = {
            isNPC = true,
        },
    }
    if not CurrentDeliveryNPC then
        CurrentDeliveryNPC = exports["rd-npcs"]:RegisterNPC(data, 'rd-weed:dropOffNpc')
    else
        exports["rd-npcs"]:UpdateNPCData(CurrentDeliveryNPC.id, "position", {
            coords = coords,
            heading = DropOffsClose[rnd]["h"]
        })
        exports["rd-npcs"]:UpdateNPCData(CurrentDeliveryNPC.id, "model", DeliveryNpcs[math.random(1,#DeliveryNpcs)])
        exports["rd-npcs"]:DisableNPC(CurrentDeliveryNPC.id)
        Wait(500)
        exports["rd-npcs"]:EnableNPC(CurrentDeliveryNPC.id)
    end
    if math.random() < WeedConfig.AlertChance then
        TriggerEvent('civilian:alertPolice', 8.0, 'drugsale', 0);
    end
end)

Citizen.CreateThread(function()
    exports['rd-interact']:AddPeekEntryByFlag({'isNPC'}, InteractHandOff.data, InteractHandOff.options)
end)

RegisterNetEvent("rd-weed:deliver_package")
AddEventHandler("rd-weed:deliver_package", function()
    if not inWeedRun then return end
    RemoveBlip(pDropOff)

    local hasPackage = exports["rd-inventory"]:hasEnoughOfItem("weedpackage", 1, false, true)
    if not hasPackage then return end

    if CurrentDeliveryNPC ~= nil then
        CurrentDeliveryNPC = exports["rd-npcs"]:GetNPC(CurrentDeliveryNPC.id)
    end

    local pRndCop = math.random(1, 2)
    if pRndCop == 1 then
        TriggerEvent('rd-mdt:drugsale')
    end

    PlayAmbientSpeech1(CurrentDeliveryNPC.entity, "Chat_State", "Speech_Params_Force")
    TaskTurnPedToFaceEntity(CurrentDeliveryNPC.entity, PlayerPedId(), 0)
    local finished = exports["rd-taskbar"]:taskBar(20000, "Weighing Package", false, true, false, false, nil, 5.0, PlayerPedId())
    if finished == 100 then
    PlayAmbientSpeech1(CurrentDeliveryNPC.entity, "Chat_State", "Speech_Params_Force")
    Citizen.Wait(200)
    local finished = exports['rd-taskbar']:taskBar(15000, "Counting Bills")
        if finished == 100 then
        RPC.execute("rd-weed:deliverpackage")
        pCanDeliver = false
        Wait(1000)
        TriggerEvent("rd-weed:drop_weed_package", 0.5)

        PlayAmbientSpeech1(CurrentDeliveryNPC.entity, "GENERIC_THANKS", "Speech_Params_Force")

        RequestAnimDict('anim@heists@box_carry@')
        while not HasAnimDictLoaded("anim@heists@box_carry@") do
            Citizen.Wait(0)
        end
        ClearPedTasksImmediately(CurrentDeliveryNPC.entity)
        RequestModel(weedAttach.model)
        while not HasModelLoaded(weedAttach.model) do
            Citizen.Wait(0)
        end
        local plyCoords = GetEntityCoords(PlayerPedId())
        local weedObject = CreateObjectNoOffset(weedAttach.model, plyCoords.x, plyCoords.y, plyCoords.z - 5.0, 1, 1, 0)
        SetObjectAsNoLongerNeeded(weedObject)
        AttachEntityToEntity(weedObject, CurrentDeliveryNPC.entity, GetPedBoneIndex(CurrentDeliveryNPC.entity, weedAttach.bone), weedAttach.x, weedAttach.y, weedAttach.z, weedAttach.xR, weedAttach.yR, weedAttach.zR, 1, 1, 0, 0, 2, 1)
        TaskPlayAnim(CurrentDeliveryNPC.entity, "anim@heists@box_carry@", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
        TaskWanderStandard(CurrentDeliveryNPC.entity, 10.0, 10)

        Citizen.Wait(30000)
        DeleteObject(weedObject)
        TriggerEvent('rd-weed:get_delivery')
        end
    end
end)

local pCleanItems = {
    ["band"] = { extra = 5, price = 50 },
    ["markedbills"] = { extra = 8, price = 100 },
    ["rollcash"] = { extra = 15, price = 15 },
    ["inkset"] = { extra = 15, price = 25 },
}

AddEventHandler("rd-weed:drop_weed_package", function(pRandomChance)
    local payment = 0
    for typ, conf in pairs(pCleanItems) do
      local randomAmount = math.random(4, 12)
      local randomChance = pRandomChance and pRandomChance or 0.4
      local totalAmount = randomAmount + conf.extra
      if math.random() < randomChance and exports["rd-inventory"]:hasEnoughOfItem(typ, totalAmount, false) then
        TriggerEvent("inventory:removeItem", typ, totalAmount)
        payment = payment + (conf.price * totalAmount)
        payment = payment + math.random(5, 15)
        TriggerServerEvent('zyloz:payout', payment)
      end
    end
    if payment == 0 then
      TriggerServerEvent('zyloz:payout', math.random(500, 1670))
    end
end)