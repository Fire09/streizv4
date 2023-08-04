cuffStates = {}

isEscorting = false
hasOxygenTankOn = false
isHandcuffed = false
isHandcuffedAndWalking = false

polyChecks = {
    vanillaUnicorn = { isInside = false, data = nil },
    gasStation = { isInside = false, data = nil },
    bennys = { isInside = false, data = nil },
    townhallCourtGavel = { isInside = false, data = nil },
    prison = { isInside = false, data = nil },
    ottosAuto = { isInside = false, data = nil },
    tuner = { isInside = false, data = nil },
}

CurrentJob = 'unemployed'
myJob = "unemployed"

isDoc = false
isPolice = false
isMedic = false
isDead = false
isJudge = false
isDoctor = false
isNews = false
isInstructorMode = false

currentlyRentedBoat = nil

bypassedNetVehicles = {}

function IsDisabled()
    return isDead or isHandcuffed or isHandcuffedAndWalking
end

function GetPedContext(pEntity, pContext)
    local npcId = DecorGetInt(pEntity, 'NPC_ID')

    if pContext.flags['isJobEmployer'] then
        pContext.job = exports['rd-jobs']:GetNPCJobData(npcId)
    end
end

function GetEntityContext(pEntity, pEntityType, pEntityModel)
    local context = { flags = {}, model = nil, type = nil, isDead = nil, zones = {} }

    if not pEntity then return context end

    context.type = pEntityType or GetEntityType(pEntity)
    context.model = pEntityModel or GetEntityModel(pEntity)
    context.isDead = IsEntityDead(pEntity)

    if context.type == 1 then
        context.flags = exports['rd-flags']:GetPedFlags(pEntity)
        context.flags['isPlayer'] = IsPedAPlayer(pEntity)
        if context.flags['isNPC'] then GetPedContext(pEntity, context) end
    elseif context.type == 2 then
        context.meta = exports['rd-vehicles']:GetVehicleMetadata(pEntity)
        context.flags = exports['rd-flags']:GetVehicleFlags(pEntity)
    elseif context.type == 3 then
        context.meta = exports['rd-objects']:GetObjectByEntity(pEntity)
        context.flags = exports['rd-flags']:GetObjectFlags(pEntity)
    end

    if ModelFlags[context.model] then
        for _, flag in ipairs(ModelFlags[context.model]) do
            context.flags[flag] = true
        end
    end

    return context
end

exports('GetEntityContext', GetEntityContext)

function GetBoneDistance(pEntity, pType, pBone)
    local bone

    if pType == 1 then
        bone = GetPedBoneIndex(pEntity, pBone)
    else
        bone = GetEntityBoneIndexByName(pEntity, pBone)
    end

    local boneCoords = GetWorldPositionOfEntityBone(pEntity, bone)
    local playerCoords = GetEntityCoords(PlayerPedId())

    return #(boneCoords - playerCoords)
end

exports("GetBoneDistance", GetBoneDistance)

function HasWeaponEquipped(pWeaponHash)
    return GetSelectedPedWeapon(PlayerPedId()) == pWeaponHash
end

function isDeveloperMode()
    return GetConvar("sv_environment", "prod") == "debug"
end

function IsMenuWanted(pMenu, pEntity)
    return pMenu == 'general' or pMenu == 'peds' and pEntity == 1 or pMenu == 'vehicles' and pEntity == 2 or pMenu == 'objects' and pEntity == 3 or pMenu =='news' and isNews or pMenu == 'k9' and isPolice or pMenu == 'judge' and isJudge
end

function isPersonBeingHeldUp(pEntity)
  return (IsEntityPlayingAnim(pEntity, "dead", "dead_a", 3) or IsEntityPlayingAnim(pEntity, "amb@code_human_cower_stand@male@base", "base", 3) or IsEntityPlayingAnim(pEntity, "amb@code_human_cower@male@base", "base", 3) or IsEntityPlayingAnim(pEntity, "random@arrests@busted", "idle_a", 3) or IsEntityPlayingAnim(pEntity, "mp_arresting", "idle", 3) or IsEntityPlayingAnim(pEntity, "random@mugging3", "handsup_standing_base", 3) or IsEntityPlayingAnim(pEntity, "missfbi5ig_22", "hands_up_anxious_scientist", 3) or IsEntityPlayingAnim(pEntity, "missfbi5ig_22", "hands_up_loop_scientist", 3) or IsEntityPlayingAnim(pEntity, "missminuteman_1ig_2", "handsup_base", 3))
end

function getTrunkOffset(pEntity)
  local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
  return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, minDim.y - 0.5, 0.0)
end

function getFrontOffset(pEntity)
    local minDim, maxDim = GetModelDimensions(GetEntityModel(pEntity))
    return GetOffsetFromEntityInWorldCoords(pEntity, 0.0, maxDim.y + 0.5, 0.0)
  end

function isCloseToTrunk(pEntity, pPlayerPed, pDistance, pMustBeOpen)
  return #(getTrunkOffset(pEntity) - GetEntityCoords(pPlayerPed)) <= (pDistance or 1.0) and GetVehicleDoorLockStatus(pEntity) == 1 and (not pMustBeOpen or GetVehicleDoorAngleRatio(pEntity, 5) >= 0.1)
end

function isCloseToHood(pEntity, pPlayerPed, pDistance, pMustBeOpen)
    return #(getFrontOffset(pEntity) - GetEntityCoords(pPlayerPed)) <= (pDistance or 1.0) and GetVehicleDoorLockStatus(pEntity) == 1 and (not pMustBeOpen or GetVehicleDoorAngleRatio(pEntity, 4) >= 0.1)
end

function isCloseToDriverDoor(pEntity, pPlayerPed, pDistance)
    local bonePos = GetWorldPositionOfEntityBone(pEntity, GetEntityBoneIndexByName(pEntity, "door_dside_f"))
    local dist = #(bonePos - GetEntityCoords(pPlayerPed))

    return dist < pDistance
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

function isCloseToEngine(pEntity, pPlayerPed, pDistance, pModel)
    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    local playerCoords = GetEntityCoords(pPlayerPed)

    local engineCoords = modelData.engine.position == 'front' and getFrontOffset(pEntity) or getTrunkOffset(pEntity)

    return #(engineCoords - playerCoords) <= pDistance
end

function isCloseToBoot(pEntity, pPlayerPed, pDistance, pModel)
    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    local playerCoords = GetEntityCoords(pPlayerPed)

    local engineCoords = modelData.trunk.position == 'front' and getFrontOffset(pEntity) or getTrunkOffset(pEntity)

    return #(engineCoords - playerCoords) <= pDistance
end

local CachedEntity, CachedEngineDoor, CachedTrunkDoor = nil, nil, nil

function getEngineDoor(pEntity, pModel)
    if CachedEntity == pEntity and CachedEngineDoor then return CachedEngineDoor end

    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    CachedEntity, CachedEngineDoor = pEntity, modelData.engine.door

    return modelData.engine.door
end

function getTrunkDoor(pEntity, pModel)
    if CachedEntity == pEntity and CachedTrunkDoor then return CachedTrunkDoor end

    local model = pModel or GetEntityModel(pEntity)
    local modelData = GetModelData(pEntity, model)

    CachedEntity, CachedTrunkDoor = pEntity, modelData.trunk.door

    return modelData.trunk.door
end

function isVehicleDoorOpen(pEntity, pDoor)
    return GetVehicleDoorAngleRatio(pEntity, pDoor) >= 0.1
end

function canRefuelHere(pEntity, pPolyZoneData)
    local vehicleClass = GetVehicleClass(pEntity)
    if (pPolyZoneData and pPolyZoneData.vehicleClassRequirement == vehicleClass) then
        return true
    elseif pPolyZoneData and not pPolyZoneData.vehicleClassRequirement and vehicleClass ~= 15 and vehicleClass ~= 16 and (GetBoneDistance(pEntity, 2, 'wheel_lr') <= 1.2 or GetBoneDistance(pEntity, 2, 'wheel_rr') <= 1.2) then
        return true
    end
    return false
end

local HasKeysCache = {}
local HasJobPermission = {}
local VehicleOwnerShipCache = {}

function hasKeys(pEntity)
    if HasKeysCache[pEntity] then return HasKeysCache[pEntity] end

    local hasKeys = exports['rd-vehicles']:HasVehicleKey(pEntity)

    HasKeysCache[pEntity] = hasKeys

    return hasKeys
end

function hasJobPermission(pJob, pPermission)
  if not pPermission then
    pPermission = "employee"
  end

  if HasJobPermission[pJob] and HasJobPermission[pJob][pPermission] ~= nil then return HasJobPermission[pJob][pPermission] end

  local hasJobPermission = function()
    if pPermission == "employee" then
      local characterId = exports["isPed"]:isPed("cid")
      return RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = pJob }})
    else
      return RPC.execute('rd-business:hasPermission', pJob, pPermission)
    end
  end

  local hasPerm = hasJobPermission()

  if not HasJobPermission[pJob] then HasJobPermission[pJob] = {} end

  HasJobPermission[pJob][pPermission] = hasPerm
  return hasPerm
end

RegisterNetEvent("rd-interact:bustVehicleOwnerShipCache", function(pEntity)
  VehicleOwnerShipCache[pEntity] = nil
end)

function getVehicleOwner(pEntity)
  if VehicleOwnerShipCache[pEntity] ~= nil then return VehicleOwnerShipCache[pEntity] end
  local vin = exports['rd-vehicles']:GetVehicleIdentifier(pEntity)
  local vehicleOwner = RPC.execute("rd-ottosauto:getVehicleOwner", vin)
  VehicleOwnerShipCache[pEntity] = vehicleOwner
  print(vehicleOwner)
  return vehicleOwner
end


RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)

RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("rd-jobmanager:playerBecameJob")
AddEventHandler("rd-jobmanager:playerBecameJob", function(job, name, notify)
    if isMedic and job ~= "ems" then isMedic = false end
    if isPolice and job ~= "police" then isPolice = false end
    if isDoc and job ~= "doc" then isDoc = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isNews and job ~= "news" then isNews = false end
    if job == "police" then isPolice = true end
    if job == "ems" then isMedic = true end
    if job == "news" then isNews = true end
    if job == "doctor" then isDoctor = true end
    if job == "doc" then isDoc = true end
    myJob = job
end)

RegisterNetEvent('rd-jobs:jobChanged')
AddEventHandler('rd-jobs:jobChanged', function(pJobId)
    CurrentJob = pJobId

    HasKeysCache = {}
    HasJobPermission = {}
end)

AddEventHandler("playerSpawned", function()
  HasJobPermission = {}
  VehicleOwnerShipCache = {}
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end

    HasKeysCache = {}
    HasJobPermission = {}
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    isInstructorMode = mode
end)

RegisterNetEvent("rd-police:cuffs:state")
AddEventHandler("rd-police:cuffs:state", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('rd-police:drag:escort')
AddEventHandler('rd-police:drag:escort', function()
    isEscorting = true
end)

RegisterNetEvent('rd-police:drag:releaseEscort')
AddEventHandler('rd-police:drag:releaseEscort', function()
    isEscorting = false
end)

AddEventHandler("rd-polyzone:enter", function(zone, data)
    if zone == "rd-jobs:impound:dropOff" then IsImpoundDropOff = true end
    if zone == "vanilla_unicorn_stage" then polyChecks.vanillaUnicorn = { isInside = true, polyData = data } end
    if zone == "gas_station" then polyChecks.gasStation = { isInside = true, polyData = data } end
    if zone == "bennys" then
        local plyPed = PlayerPedId()

        if data and data.type == "boats" and not IsPedInAnyBoat(plyPed) then
            return
        end
        if data and data.type == "planes" and not (IsPedInAnyPlane(plyPed) or IsPedInAnyHeli(plyPed)) then
            return
        end

        polyChecks.bennys = { isInside = true, polyData = data }
    end
    if zone == "townhall_court_gavel" then polyChecks.townhallCourtGavel = { isInside = true, polyData = nil } end
    if zone == "prison" then polyChecks.prison = { isInside = true, polyData = nil } end
    if zone == "ottos_auto" then polyChecks.ottosAuto = { isInside = true, polyData = nil} end
    if zone == "tuner" then polyChecks.tuner = { isInside = true, polyData = nil } end
end)

AddEventHandler("rd-polyzone:exit", function(zone)
    if zone == "vanilla_unicorn_stage" then polyChecks.vanillaUnicorn = { isInside = false, polyData = nil } end
    if zone == "gas_station" then polyChecks.gasStation = { isInside = false, polyData = nil } end
    if zone == "bennys" then polyChecks.bennys = { isInside = false, polyData = nil } end
    if zone == "townhall_court_gavel" then polyChecks.townhallCourtGavel = { isInside = false, polyData = nil } end
    if zone == "prison" then polyChecks.prison = { isInside = false, polyData = nil } end
    if zone == "ottos_auto" then
      polyChecks.ottosAuto = { isInside = false, polyData = nil}
      HasJobPermission["ottos_auto"] = {}
    end
    if zone == "tuner" then 
        polyChecks.tuner = { isInside = false, polyData = nil }
        HasJobPermission["tuner"] = {}
    end
end)

AddEventHandler("rd-fishing:currentlyRentedBoat", function(handle)
    currentlyRentedBoat = handle
end)

AddEventHandler("rd-interact:openFridge", function()
  TriggerEvent("server-inventory-open", "31", "Craft");
end)

AddEventHandler("rd-interact:grabDrink", function(args, entity, context)
  TriggerEvent("server-inventory-open", "1", context.zones["bar:grabDrink"].name)
end)

RegisterNetEvent('rd-interact:setNetVehicleBypassed', function(netId, bypass)
    bypassedNetVehicles[netId] = bypass
end)


-- meth1g


AddEventHandler("rd-inventory:itemUsed", function(item, info)
    if item == "methtable" then
      TriggerEvent('rd-meth:place_table')
    end
  end)
  
  local Entries = {}
  local MethInformation = {}
  local Meth = {}
  local KnownTables = {}
  local PeekEntries = { ['model'] = {}, ['flag'] = {}, ['entity'] = {}, ['polytarget'] = {} }
  EntryCount, ListCount, UpdateRequired, RefreshingList = 0, 0, false, false
  local MethbenchID = 0 
  local ConCoords = 0
  local PlacedTable = false
  
  RegisterNetEvent('rd-meth:place_table')
  AddEventHandler('rd-meth:place_table', function()
      PlacedTable = true
      TriggerEvent('inventory:removeItem', 'methtable', 1)
      TriggerEvent("rd-drugs:place-meth", `bkr_prop_meth_table01a`)
  end)
  
  RegisterNetEvent("rd-drugs:place-meth-bench")
  AddEventHandler("rd-drugs:place-meth-bench", function(model, coords)
      RequestModel(model)
      CreatedObjects = CreateObject(model, coords)
      FreezeEntityPosition(CreatedObjects, true)
      TriggerServerEvent("rd-drugs:new-meth-bench", model, coords)
  end)
  
  function MethTarget(distance)
      local Cam = GetGameplayCamCoord()
      local _, Hit, Coords, _, Entity = GetShapeTestResult(StartExpensiveSynchronousShapeTestLosProbe(Cam, GetCoordsFromCam(7.0, Cam), -1, PlayerPedId(), 4))
      return Coords
  end
  
  function GetCoordsFromCam(distance, coords)
      local rotation = GetGameplayCamRot()
      local adjustedRotation = vector3((math.pi / 180) * rotation.x, (math.pi / 180) * rotation.y, (math.pi / 180) * rotation.z)
      local direction = vector3(-math.sin(adjustedRotation[3]) * math.abs(math.cos(adjustedRotation[1])), math.cos(adjustedRotation[3]) * math.abs(math.cos(adjustedRotation[1])), math.sin(adjustedRotation[1]))
      return vector3(coords[1] + direction[1] * distance, coords[2] + direction[2] * distance, coords[3] + direction[3] * distance)
  end
  
  local hidden = false
  scenes = {}
  local riddleDrugsMethB = false
  local coords = {}
  
  RegisterNetEvent("rd-drugs:place-meth")
  AddEventHandler("rd-drugs:place-meth", function(model)
      exports['rd-ui']:showInteraction('[E] Confirm Placement')
      local placement = MethTarget()
      coords = {}
      riddleDrugsMethB = true
  
      while riddleDrugsMethB do
          RequestModel(model)
          DisableControlAction(0, 200, true)
          placement = MethTarget()
          if placement ~= nil then
              Object = model
              local objTypeKey = GetHashKey(Object)
              curObject = CreateObject(Object,placement,false,false,false)
              Citizen.Wait(0)
              DeleteObject(curObject)
              SetModelAsNoLongerNeeded(objTypeKey)
              SetEntityCollision(curObject, false)
              SetEntityCompletelyDisableCollision(curObject, false, false)
              SetEntityAlpha(Object, 0)
          end
          if IsControlJustReleased(0, 46) then
              exports['rd-ui']:hideInteraction()
              TriggerEvent("animation:PlayAnimation","mechanic3")
              local finished = exports['rd-taskbar']:taskBar(7000, 'Placing')
              if finished == 100 then
                  TriggerEvent("rd-drugs:place-meth-bench", model, placement)
                  TriggerEvent('DoLongHudText', 'You placed the meth bench use the eye to interact', 1)
                  return
              end
          end
      end
  end)
  
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(1500)
          TriggerServerEvent("ReceiveCoords")
      break
      end
  end)
  
  -- Script
  
  local StartedCook = false
  local PreparedGoods = false
  local CombinedGoods = false
  local MixedInWater = false
  local AddedSolvent = false
  local Crystalized = false
  local Packed = false
  
  local CooldownCook = false
  
  -- Start Cook Interact 3rd eye
  
  RegisterNetEvent('rd-meth:start_cook')
  AddEventHandler('rd-meth:start_cook', function()
      if PlacedTable and not CooldownCook then
          StartedCook = true
          -- Minigame
          TriggerEvent('DoLongHudText', 'Cook Started', 1)
      else
          print('[DEBUG] - [riddleRP] - WAIT 1 HOUR COOLDOWN PER METH COOK!')
      end
  end)
  
  -- Prepare Good interact 3rd eye
  
  RegisterNetEvent('rd-meth:prepare-goods')
  AddEventHandler('rd-meth:prepare-goods', function()
      if StartedCook and not PreparedGoods then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          TriggerEvent("animation:PlayAnimation","browse")
          local finished = exports['rd-taskbar']:taskBar(30000, 'Preparing Goods')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              PreparedGoods = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Combine Goods 3rd Eye Interact
  
  RegisterNetEvent('rd-meth:combine-goods')
  AddEventHandler('rd-meth:combine-goods', function()
      if StartedCook and PreparedGoods and not CombinedGoods then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          TriggerEvent("animation:PlayAnimation","type")
          local finished = exports['rd-taskbar']:taskBar(60000,'Combine Goods')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              CombinedGoods = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Mix In Water
  
  RegisterNetEvent('rd-meth:mix_in_water')
  AddEventHandler('rd-meth:mix_in_water', function()
      if StartedCook and PreparedGoods and CombinedGoods and not MixedInWater then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          RequestAnimDict("weapon@w_sp_jerrycan")
          while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
              Wait(10)
          end
          Wait(50)
          TaskPlayAnim(GetPlayerPed(-1),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
          Wait(50)
          TaskPlayAnim(GetPlayerPed(-1),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
          local finished = exports['rd-taskbar']:taskBar(45000,'Mix In Water')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              MixedInWater = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Add Solvent
  
  RegisterNetEvent('rd-meth:add_solvent')
  AddEventHandler('rd-meth:add_solvent', function()
      if StartedCook and PreparedGoods and CombinedGoods and MixedInWater and not AddedSolvent then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          RequestAnimDict("weapon@w_sp_jerrycan")
          while ( not HasAnimDictLoaded( "weapon@w_sp_jerrycan" ) ) do
              Wait(10)
          end
          Wait(50)
          TaskPlayAnim(GetPlayerPed(-1),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
          Wait(50)
          TaskPlayAnim(GetPlayerPed(-1),"weapon@w_sp_jerrycan","fire",2.0, -8, -1,49, 0, 0, 0, 0)
          local finished = exports['rd-taskbar']:taskBar(50000,'Adding Solvent')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              ClearPedTasks(PlayerPedId())
              AddedSolvent = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Crystalize Product
  
  RegisterNetEvent('rd-meth:crystalize_product')
  AddEventHandler('rd-meth:crystalize_product', function()
      if StartedCook and PreparedGoods and CombinedGoods and MixedInWater and AddedSolvent and not Crystalized then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          TriggerEvent("animation:PlayAnimation","browse")
          local finished = exports['rd-taskbar']:taskBar(120000,'Crystalizing Product')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              Crystalized = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Pack Product
  
  RegisterNetEvent('rd-meth:pack-product')
  AddEventHandler('rd-meth:pack-product', function()
      if StartedCook and PreparedGoods and CombinedGoods and MixedInWater and AddedSolvent and Crystalized and not Packed then
          FreezeEntityPosition(GetPlayerPed(-1), true)
          TriggerEvent("animation:PlayAnimation","browse")
          local finished = exports['rd-taskbar']:taskBar(170000,'Packing Product')
          if finished == 100 then
              FreezeEntityPosition(GetPlayerPed(-1), false)
              Packed = true
              TriggerEvent('DoLongHudText', 'Step completed.', 1)
              TriggerEvent('player:receiveItem', 'methlabcured', 1)
              TriggerEvent('rd-meth:cooldown')
          else
              FreezeEntityPosition(GetPlayerPed(-1), false)
          end
      end
  end)
  
  -- Delete Bench
  
  RegisterNetEvent('rd-methtable:pick_up')
  AddEventHandler('rd-methtable:pick_up', function()
      if PlacedTable then
          TriggerEvent("animation:PlayAnimation","mechanic3")
          FreezeEntityPosition(PlayerPedId(), true)
          local finished = exports['rd-taskbar']:taskBar(10000 ,'Picking Up Table')
          if finished == 100 then
              TriggerEvent('player:receiveItem', 'methtable', 1)
              FreezeEntityPosition(PlayerPedId(), false)
              DeleteEntity(CreatedObjects)
              PlacedTable = false
          end
      else
          print('NOT PLACED A TABLE')
      end
  end)
  
  RegisterNetEvent('rd-meth:cooldown')
  AddEventHandler('rd-meth:cooldown', function()
      CooldownCook = true
      Citizen.Wait(3.6e+6)
      StartedCook = false
      PreparedGoods = false
      CombinedGoods = false
      MixedInWater = false
      AddedSolvent = false
      Crystalized = false
      Packed = false
      CooldownCook = false
  end)
  
  -- Target
  
  Citizen.CreateThread(function()
      for _, entry in ipairs(Entries) do
          if entry.type == 'flag' then
              AddPeekEntryByFlag(entry.group, entry.data, entry.options)
          elseif entry.type == 'model' then
              AddPeekEntryByModel(entry.group, entry.data, entry.options)
          elseif entry.type == 'entity' then
              AddPeekEntryByEntityType(entry.group, entry.data, entry.options)
          elseif entry.type == 'polytarget' then
              AddPeekEntryByPolyTarget(entry.group, entry.data, entry.options)
          end
      end
  end)
  
  -- Start Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'start_cooking',
              label = "Start Cook",
              icon = "temperature-high",
              event = "rd-meth:start_cook",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return not StartedCook
          end,
      }
  }
  
  -- Prepare Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'prepare_meth_goods',
              label = "Preparing Goods",
              icon = "temperature-high",
              event = "rd-meth:prepare-goods",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and not PreparedGoods
          end,
      }
  }
  
  -- Combine Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
      
          {
              id = 'combine_meth_goods',
              label = "Combine Goods",
              icon = "temperature-high",
              event = "rd-meth:combine-goods",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and PreparedGoods and not CombinedGoods
          end,
      }
  }
  
  -- Mix In Water Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'mix_in_water',
              label = "Mix in water",
              icon = "temperature-high",
              event = "rd-meth:mix_in_water",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and PreparedGoods and CombinedGoods and not MixedInWater
          end,
      }
  }
  
  -- Add Solvent Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'add_solvent',
              label = "Add Solvent",
              icon = "temperature-high",
              event = "rd-meth:add_solvent",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and PreparedGoods and CombinedGoods and MixedInWater and not AddedSolvent
          end,
      }
  }
  
  -- Crystalize Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'crystalize_product',
              label = "Crystalize Product",
              icon = "temperature-high",
              event = "rd-meth:crystalize_product",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and PreparedGoods and CombinedGoods and MixedInWater and AddedSolvent and not Crystalized
          end,
      }
  }
  
  -- Pack Product Eye
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'pack_product',
              label = "Pack Product",
              icon = "temperature-high",
              event = "rd-meth:pack-product",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
          isEnabled = function()
              return StartedCook and PreparedGoods and CombinedGoods and MixedInWater and AddedSolvent and Crystalized and not Packed
          end,
      }
  }
  
  Entries[#Entries + 1] = {
      type = 'model',
      group = { 538990259 },
      data = {
          {
              id = 'pick_up_table',
              label = "Pickup table",
              icon = "arrow-up",
              event = "rd-methtable:pick_up",
              parameters = {}
          }
      },
      options = {
          distance = { radius = 1.5 },
      }
  }
  
  -- Animations
  