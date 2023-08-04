--[[

    Variables

]]

local inBinder = false
local inPackOpening = true

--[[

    Functions

]]

function LoadAnimationDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)

        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

local function playPackOpeningAnimation()
    inPackOpening = true
    Citizen.Wait(500)
    ClearPedTasksImmediately()
    Citizen.Wait(500)
    LoadAnimationDic("amb@world_human_tourist_map@male@idle_a")
    TaskPlayAnim(PlayerPedId(), "amb@world_human_tourist_map@male@idle_a", "idle_b", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
    TriggerEvent("attachItemPhone", "tcg_card_inspect")
end

local function stopPackOpeningAnimation()
    Citizen.Wait(1000)
    StopAnimTask(PlayerPedId(), "amb@world_human_tourist_map@male@idle_a", "idle_b", 1.0)
    TriggerEvent("destroyPropPhone")
    inPackOpening = false
end

local function playBinderAnimation()
    inBinder = true
    TriggerEvent('closeInventoryGui')
    Citizen.Wait(500)
    ClearPedTasksImmediately()
    Citizen.Wait(500)
    LoadAnimationDic("amb@code_human_in_bus_passenger_idles@female@tablet@base")
    TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
    TriggerEvent("attachItemPhone", "binder01")
end

local function stopBinderAnimation()
    Citizen.Wait(1000)
    StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
    TriggerEvent("destroyPropPhone")
    inBinder = false
end

local hasPermission = false

function checkJobPermission(characterId)
    Citizen.Wait(5000)
    hasPermission = exports['rd-business']:IsEmployedAt('nopixelcards') and RPC.execute("rd-business:hasPermission", 'nopixelcards', 'craft_access', characterId)
end

function checkJobPermissionAlt()
    checkJobPermission(exports['isPed']:isPed('cid'))
end

RegisterNetEvent('rd-spawn:characterSpawned')
AddEventHandler('rd-spawn:characterSpawned', checkJobPermission)
RegisterNetEvent('rd-business:employmentStatus')
AddEventHandler('rd-business:employmentStatus', checkJobPermissionAlt)
AddEventHandler('rd-tcg:hotreload', checkJobPermissionAlt)

Citizen.CreateThread(function()
    exports["rd-interact"]:AddPeekEntryByModel({ GetHashKey('boxville7') }, {
        {
            id = "tcg_truckstock",
            label = "Stock",
            icon = "truck-loading",
            event = "rd-tcg:truck-stock",
            parameters = {}
        },
    }, {
        distance = { radius = 5.0 },
        isEnabled = function(pEntity, pContext)
            if not hasPermission then return false end
            local lockStatus = GetVehicleDoorLockStatus(pEntity)
            return isCloseToBoot(pEntity, PlayerPedId(), 3.0, pContext.model) and (lockStatus == 1 or lockStatus == 0 or lockStatus == 4)
        end
    })
end)

AddEventHandler("rd-tcg:truck-tailgate", function(pParams, pEntity)
    local vin = exports['rd-vehicles']:GetVehicleIdentifier(pEntity)
    TriggerEvent("server-inventory-open", "1", "tcg_truck_tailgate_" .. vin)
end)

Citizen.CreateThread(function()
    exports["rd-interact"]:AddPeekEntryByModel({ GetHashKey('boxville7') }, {
        {
            id = "tcg_trucktailgate",
            label = "Tailgate",
            icon = "box",
            event = "rd-tcg:truck-tailgate",
            parameters = {}
        },
    }, {
        distance = { radius = 5.0 },
        isEnabled = function(pEntity, pContext)
            return isCloseToBoot(pEntity, PlayerPedId(), 3.0, pContext.model)
        end
    })
end)

--[[

    Events

]]

AddEventHandler("rd-inventory:itemUsed", function(item, info, inventory, slot, dbid)
    local itemInfo = json.decode(info)
    local cid = exports['isPed']:isPed('cid')
    if item == "tcgcard" then
        TriggerEvent("rd-tcg:previewCard", itemInfo)
    elseif TCG.Packs[item] then
        TriggerEvent("inventory:removeItem", item, 1)
        TriggerEvent("rd-tcg:openPack", item)
    elseif item == "tcgbinder" then
        TriggerEvent("rd-tcg:openBinder", cid)
    end
end)

AddEventHandler("rd-tcg:openPack", function(type)
    playPackOpeningAnimation()

    local packCards = TCG.Packs[type]

    local cards = {}
    local _cards = {}
    local count = 0
    for i=1, 1000 do
        local randomCard = packCards[math.random(#packCards)]
        if not _cards[randomCard] then
            _cards[randomCard] = true
            count = count + 1

            if count == 5 then
                break
            end
        end
    end

    for k, v in pairs(_cards) do
        table.insert(cards, {
            card = k,
            image = TCG.Cards[k]["image"],
            hollow = math.random(100) > 95,
        })
    end

	SetNuiFocus(true, true)
    SendNUIMessage({
		open = true,
		cards = cards
	})
end)

AddEventHandler("rd-tcg:previewCard", function(pInfo)
	playPackOpeningAnimation()

    SetNuiFocus(true, true)
    SendNUIMessage({
		open = true,
		card = pInfo._image_url,
		hollow = pInfo._hollow
	})
end)

AddEventHandler("rd-tcg:openBinder", function(pDBID)
    playBinderAnimation()
    TriggerEvent("server-inventory-open", "1", "tcg_binder_" .. pDBID)
end)

AddEventHandler("inventory:wepDropCheck", function()
    if inBinder then
        stopBinderAnimation()
    end
end)

AddEventHandler("rd-tcg:shop", function(pParams, pEntity, pContext)
    TriggerServerEvent("rd-tcg:buy", pParams.type)
end)

--[[

    NUI

]]

RegisterNUICallback("giveCard", function(data, cb)
	local name = TCG.Cards[data.card]["name"]
	local description = TCG.Cards[data.card]["description"]
    local image = TCG.Cards[data.card]["image"]
    local hollow = data.hollow

    if hollow then
        name = name .. " (Brilhante)"
    end

    local metaInfo = {
        _name = name,
        _description = description,
        _image_url = image,
        _hollow = data.hollow,
        _remove_id = math.random(1000000, 9999999),

        _hideKeys = {
            "_name",
            "_description",
            "_image_url",
            "_hollow",
            "_remove_id",
        },
    }

    TriggerEvent("player:receiveItem", "tcgcard", 1, true, metaInfo)

    cb(true)
end)

RegisterNUICallback("close", function(data, cb)
	SetNuiFocus(false, false)

    if inPackOpening then
        stopPackOpeningAnimation()
    end

	cb(true)
end)


--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(1000)


    local data = {
        id = 'tcg_seller_npc',
        position = {
            coords = vector3(1211.299, -445.0821, 65.98),
            heading = 74.320,
        },
        pedType = 4,
        model = "a_m_y_vinewood_01",
        networked = false,
        distance = 25.0,
        settings = {
            { mode = 'invincible', active = true },
            { mode = 'ignore', active = true },
            { mode = 'freeze', active = true },
        },
        flags = {
            isNPC = true,
        },
        scenario = "WORLD_HUMAN_STAND_MOBILE",
    }

    local seller = exports["rd-npcs"]:RegisterNPC(data, "rd-tcg:tcgseller")
    exports["rd-npcs"]:EnableNPC(seller)

    exports["rd-interact"]:AddPeekEntryByFlag({ "isNPC" }, {
        {
            id = "tgc_buy_binder",
            label = "Buy Binder - $250",
            icon = "book-open",
            event = "rd-tcg:shop",
            parameters = {
                type = "tcgbinder",
            },
        },
        {
            id = "tgc_buy_pack_1",
            label = "Buy Card Pack - $50",
            icon = "circle",
            event = "rd-tcg:shop",
            parameters = {
                type = "tcgcivsbooster",
            },
        },
    }, { distance = { radius = 2.5 }, npcIds = { "tcg_seller_npc" } })
    local blip = AddBlipForCoord(vector3(1211.299, -445.0821, 65.98))
    SetBlipSprite(blip, 614)
    SetBlipScale(blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("NPC TCG Dealer")
    EndTextCommandSetBlipName(blip)
end)

-- rd-interact helpers
function getTrunkOffset(pEntity)
    local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
    return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, minDim.y - 0.5, 0.0)
  end
  
  function getFrontOffset(pEntity)
      local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
      return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, maxDim.y + 0.5, 0.0)
  end
  
  local ModelData = {}
  
  function GetModelData(pEntity, pModel)
      if ModelData[pModel] then return ModelData[pModel] end
  
      local modelInfo = {}
  
      local coords = getTrunkOffset(pEntity)
      local boneCoords, engineCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'engine'))
  
      if #(boneCoords - coords) <= 2.0 then
          engineCoords = coords
          modelInfo = { engine = { position = 'trunk', door = 4 }, trunk = { position = 'front', door = 5 } }
      else
          engineCoords = getFrontOffset(pEntity)
          modelInfo = { engine = { position = 'front', door = 4 }, trunk = { position = 'trunk', door = 5 } }
      end
  
      local hasBonnet = DoesVehicleHaveDoor(pEntity, 4)
      local hasTrunk = DoesVehicleHaveDoor(pEntity, 5)
  
      if hasBonnet then
          local bonnetCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'bonnet'))
  
          if #(engineCoords - bonnetCoords) <= 2.0 then
              modelInfo.engine.door = 4
              modelInfo.trunk.door = hasTrunk and 5 or 3
          elseif hasTrunk then
              modelInfo.engine.door = 5
              modelInfo.trunk.door = 4
          end
      elseif hasTrunk then
          local bootCoords = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, 'boot'))
  
          if #(engineCoords - bootCoords) <= 2.0 then
              modelInfo.engine.door = 5
          end
      end
  
      ModelData[pModel] = modelInfo
  
      return modelInfo
  end
  
  function isCloseToBoot(pEntity, pPlayerPed, pDistance, pModel)
      local model = pModel or GetEntityModel(pEntity)
      local modelData = GetModelData(pEntity, model)
  
      local playerCoords = GetEntityCoords(pPlayerPed)
  
      local engineCoords = modelData.trunk.position == 'front' and getFrontOffset(pEntity) or getTrunkOffset(pEntity)
  
      return #(engineCoords - playerCoords) <= pDistance
  end