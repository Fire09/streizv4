local CheckOcUgur = false
local MiningSounds = {
    good = {
        name = "Hack_Success",
        dictionary = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"
    },
}

RegisterNetEvent("rd-mining:aluminium")
AddEventHandler("rd-mining:aluminium", function ()
    if exports['rd-inventory']:hasEnoughOfItem('aluminium', 1) then
        TriggerEvent("inventory:removeItem","aluminium", 1) 
        TriggerServerEvent('rd-rental:aluminium')
    else
        TriggerEvent("DoLongHudText","You have no aluminum to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:glass")
AddEventHandler("rd-mining:glass", function ()
    if exports['rd-inventory']:hasEnoughOfItem('glass', 1) then
        TriggerEvent("inventory:removeItem","glass", 1) 
        TriggerServerEvent('rd-rental:glass')
    else
        TriggerEvent("DoLongHudText","You have no glass to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:plastic")
AddEventHandler("rd-mining:plastic", function ()
    if exports['rd-inventory']:hasEnoughOfItem('plastic', 1) then
        TriggerEvent("inventory:removeItem","plastic", 1) 
        TriggerServerEvent('rd-rental:plastic')
    else
        TriggerEvent("DoLongHudText","You have no plastic to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:copper")
AddEventHandler("rd-mining:copper", function ()
    if exports['rd-inventory']:hasEnoughOfItem('copper', 1) then
        TriggerEvent("inventory:removeItem","copper", 1) 
        TriggerServerEvent('rd-rental:copper')
    else
        TriggerEvent("DoLongHudText","You have no copper to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:rubber")
AddEventHandler("rd-mining:rubber", function ()
    if exports['rd-inventory']:hasEnoughOfItem('rubber', 1) then
        TriggerEvent("inventory:removeItem","rubber", 1) 
        TriggerServerEvent('rd-rental:rubber')
    else
        TriggerEvent("DoLongHudText","You have no rubber to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:scrapmetal")
AddEventHandler("rd-mining:scrapmetal", function ()
    if exports['rd-inventory']:hasEnoughOfItem('scrapmetal', 1) then
        TriggerEvent("inventory:removeItem","scrapmetal", 1)
        TriggerServerEvent('rd-rental:scrapmetal') 
    else
        TriggerEvent("DoLongHudText","You have no scrap metal to sell!",2)
    end
end)

RegisterNetEvent("rd-mining:server:givepickaxe")
AddEventHandler("rd-mining:server:givepickaxe", function ()
    TriggerServerEvent('rd-rental:checkcashpickaxe', 250, args)
end)

RegisterNetEvent("rd-mining:client:givepickaxe")
AddEventHandler("rd-mining:client:givepickaxe", function ()
    TriggerEvent("player:receiveItem", "miningpickaxe", 1)
end)

RegisterNetEvent("rd-mining:client:giveminingprobe")
AddEventHandler("rd-mining:client:giveminingprobe", function ()
    TriggerEvent("player:receiveItem", "miningprobe", 1)
end)

RegisterNetEvent("rd-mining:server:giveminingprobe")
AddEventHandler("rd-mining:server:giveminingprobe", function ()
    TriggerServerEvent('rd-rental:checkcashprobe', 75, args)
end)

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
     Citizen.Wait(5)
    end
end


function randomitems()
	local rnd = math.random()
  if rnd < 0.15 then
    TriggerEvent("player:receiveItem", "aluminium", math.random(1, 8))
    Wait(100)
    TriggerEvent("player:receiveItem", "glass", math.random(1, 3))
    Wait(100)
    TriggerEvent("player:receiveItem", "plastic", math.random(1, 5))
    Wait(100)
    TriggerEvent("player:receiveItem", "copper", math.random(1, 7))
    Wait(100)
    TriggerEvent("player:receiveItem", "rubber", math.random(1, 8))
    Wait(100)
    TriggerEvent("player:receiveItem", "scrapmetal", math.random(1, 7))
    CheckOcUgur = false
	else
    TriggerEvent("player:receiveItem", "rubber", math.random(1, 8))
    Wait(100)
    TriggerEvent("player:receiveItem", "scrapmetal", math.random(1, 7))
    Wait(100)
    TriggerEvent("player:receiveItem", "steel", math.random(1, 4))
    Wait(100)
    TriggerEvent("player:receiveItem", "steel", math.random(1, 4))
    CheckOcUgur = false
	end
end

RegisterNetEvent("rd-mining:MiningProbe")
AddEventHandler("rd-mining:MiningProbe", function ()
    local finished = exports["rd-taskbar"]:taskBar(3000,"Mining Probe",false,false,ped)
    if (finished == 100) then
    CheckOcUgur = true
    PlaySoundFromCoord(-1, MiningSounds.good.name, plyCoords, MiningSounds.good.dictionary, 0, 0, 0)
    end
end)

RegisterNetEvent("rd-mining:MineGoose")
AddEventHandler("rd-mining:MineGoose", function ()
    if CheckOcUgur then
    local ped = PlayerPedId()
    RequestAnimDict("melee@large_wpn@streamed_core")
    Citizen.Wait(100)
    TaskPlayAnim(ped, "melee@large_wpn@streamed_core", "ground_attack_on_spot", 8.0, -8.0, -1, 1, 0, false, false, false)
    local finished = exports["rd-taskbar"]:taskBar(15000,"Mining",false,false,ped)
    if (finished == 100) then
        ClearPedTasks(ped) 
        randomitems()
    else
        ClearPedTasks(ped)
    end
else
    TriggerEvent('DoLongHudText', 'No mine found here!')
end 
end)

RegisterNetEvent("rd-mining:OpenMenu")
AddEventHandler("rd-mining:OpenMenu", function ()
local menuData = {
    {
        title = "Items",
        description = "Mining Items",
        key = "EVENTS.MIN",
        children = {
            { title = "Mining Picaxe", action = "rd-mining:server:givepickaxe", key = "EVENTS.MIN" },
            { title = "Mining Probe", action = "rd-mining:server:giveminingprobe", key = "EVENTS.MIN" },
        },
    },
    {
        title = "Sell Items",
        description = "Sell mining Items",
        key = "EVENTS.SELLMIN",
        children = {
            { title = "Aluminum", action = "rd-mining:aluminium", key = "EVENTS.SELLMIN" },
            { title = "Glass", action = "rd-mining:glass", key = "EVENTS.SELLMIN" },
            { title = "Plastic", action = "rd-mining:plastic", key = "EVENTS.SELLMIN" },
            { title = "Copper", action = "rd-mining:copper", key = "EVENTS.SELLMIN" },
            { title = "Rubber", action = "rd-mining:rubber", key = "EVENTS.SELLMIN" },
            { title = "Scrap metal", action = "rd-mining:scrapmetal", key = "EVENTS.SELLMIN" },
        },
    },
}
exports["rd-ui"]:showContextMenu(menuData)
end)

RegisterNetEvent("rd-mining:client:collectItem")
AddEventHandler("rd-mining:client:collectItem", function (pArgs, pEntity, pEntityFlags, pEntityCoords)
    TriggerEvent("player:receiveItem", pArgs[1], 1)
    print(pArgs[1])
end)

AddEventHandler("rd-inventory:itemUsed", function (item, info)
    if item ~= "miningpickaxe" then return end
    local dist = #(vector3(-591.43463134766, 2074.7041015625, 131.36854553223) - GetEntityCoords(PlayerPedId()))
    if dist < 15.0 then
    TriggerEvent("rd-mining:MineGoose",itemid)   
    else
        TriggerEvent("DoLongHudText","You must be in the mine!",2) 
    end
  end)

  AddEventHandler("rd-inventory:itemUsed", function (item, info)
    if item ~= "miningprobe" then return end
    TriggerEvent("rd-mining:MiningProbe",itemid)
  end)