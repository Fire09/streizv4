local switchModels = {
  [`mp_m_freemode_01`] = true,
  [`mp_f_freemode_01`] = true,
}

AddEventHandler("rd-heists:vault:electrickbox1", function(item)
  local playerPed = PlayerPedId()
  local position = GetEntityCoords(playerPed, false)
  local endPosition = position + GetEntityForwardVector(playerPed)
  local raycast = StartShapeTestSweptSphere(position.x, position.y, position.z, endPosition.x, endPosition.y, endPosition.z, 0.2, 16, playerPed, 4)
  local retval, hit, endCoords, surfaceNormal, entity = GetShapeTestResult(raycast)
  local heading = 0
  Citizen.CreateThread(function()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
      Citizen.Wait(0)
    end
    local ped = PlayerPedId()
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(ped)))
    local bagscene = NetworkCreateSynchronisedScene(endCoords.x, endCoords.y, endCoords.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), endCoords.x, endCoords.y, endCoords.z,  true,  true, false)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(bag), false)
    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    local curVar = 0
    if switchModels[GetEntityModel(PlayerPedId())] then
      GetPedDrawableVariation(ped, 5)
      SetPedComponentVariation(ped, 5, 0, 0, 0)
    end
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(bomba), false)
    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(4000)
    DeleteObject(bag)
    if curVar > 0 then
      SetPedComponentVariation(ped, 5, curVar, 0, 0)
    end
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 6000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    TriggerServerEvent("fx:ThermiteChargeEnt", NetworkGetNetworkIdFromEntity(bomba), endCoords)
    Citizen.Wait(2000)
    ClearPedTasks(ped) 
    DeleteObject(bomba)
    local disruptelectricbox = RPC.execute("rd-heists:DisruptElectricBox")
    return disruptelectricbox
  end)  
end)

AddEventHandler("rd-heists:vault:electrickbox2", function(item)
  local playerPed = PlayerPedId()
  local position = GetEntityCoords(playerPed, false)
  local endPosition = position + GetEntityForwardVector(playerPed)
  local raycast = StartShapeTestSweptSphere(position.x, position.y, position.z, endPosition.x, endPosition.y, endPosition.z, 0.2, 16, playerPed, 4)
  local retval, hit, endCoords, surfaceNormal, entity = GetShapeTestResult(raycast)
  local heading = 0
  Citizen.CreateThread(function()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") do
      Citizen.Wait(0)
    end
    local ped = PlayerPedId()
    Citizen.Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(ped)))
    local bagscene = NetworkCreateSynchronisedScene(endCoords.x, endCoords.y, endCoords.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), endCoords.x, endCoords.y, endCoords.z,  true,  true, false)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(bag), false)
    SetEntityCollision(bag, false, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    local curVar = 0
    if switchModels[GetEntityModel(PlayerPedId())] then
      GetPedDrawableVariation(ped, 5)
      SetPedComponentVariation(ped, 5, 0, 0, 0)
    end
    NetworkStartSynchronisedScene(bagscene)
    Citizen.Wait(1500)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local bomba = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(bomba), false)
    SetEntityCollision(bomba, false, true)
    AttachEntityToEntity(bomba, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    Citizen.Wait(4000)
    DeleteObject(bag)
    if curVar > 0 then
      SetPedComponentVariation(ped, 5, curVar, 0, 0)
    end
    DetachEntity(bomba, 1, 1)
    FreezeEntityPosition(bomba, true)
    NetworkStopSynchronisedScene(bagscene)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 6000, 49, 1, 0, 0, 0)
    Citizen.Wait(5000)
    TriggerServerEvent("fx:ThermiteChargeEnt", NetworkGetNetworkIdFromEntity(bomba), endCoords)
    Citizen.Wait(2000)
    ClearPedTasks(ped) 
    DeleteObject(bomba)
    local OpenDoors = RPC.execute("rd-heists:OpenVaultUpperDoors")
    local ActivateMinigame = RPC.execute("rd-heists:ActivateUpperMinigame")
    return OpenDoors
  end)  
end)

RegisterNetEvent("rd-heists:vault:laserHit")
AddEventHandler('rd-heists:vault:laserHit', function()
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    234.99,
    228.07,
    97.72,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    234.99,
    228.07,
    97.72,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    234.99,
    228.07,
    97.72,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    253.47,
    222.99,
    97.12,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    253.47,
    222.99,
    97.12,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
  PlaySoundFromCoord(
    -1,
    'TIMER_STOP',
    253.47,
    222.99,
    97.12,
    'HUD_MINI_GAME_SOUNDSET',
    false,
    100,
    false
  )
end)