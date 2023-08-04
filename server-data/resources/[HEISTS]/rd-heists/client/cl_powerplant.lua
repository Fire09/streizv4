local ptxfName = "scr_cncpolicestationbustout"
local ptfxDict = "scr_alarm_damage_sparks"

Citizen.CreateThread(function()
 exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2792.49, 1482.55, 24.53), 3.0, 3.0, {
   heading=340,
   minZ=23.33,
   maxZ=26.53,
   data = {
     id = 1,
     ptfxCoords = vector3(2791.18, 1482.4, 24.51),
   },
 })

 exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2801.36, 1514.54, 24.54), 3.0, 3.0, {
  heading=340,
  minZ=23.33,
  maxZ=26.53,
  data = {
    id = 2,
    ptfxCoords = vector3(2799.66, 1514.2, 24.46),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2810.34, 1547.69, 24.54), 3.0, 3.0, {
  heading=340,
  minZ=23.33,
  maxZ=26.53,
  data = {
    id = 3,
    ptfxCoords = vector3(2808.61, 1547.59, 24.44),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2756.06, 1491.45, 24.5), 3.0, 3.0, {
  heading=340,
  minZ=23.33,
  maxZ=26.53,
  data = {
    id = 4,
    ptfxCoords = vector3(2756.98, 1491.15, 24.36),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2772.73, 1563.18, 24.5), 3.0, 3.0, {
  heading=60,
  minZ=23.33,
  maxZ=26.33,
  data = {
    id = 5,
    ptfxCoords = vector3(2771.72, 1563.27, 24.25),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2733.49, 1476.34, 45.3), 3.0, 3.0, {
  heading=340,
  minZ=44.1,
  maxZ=47.3,
  data = {
    id = 6,
    ptfxCoords = vector3(2734.92, 1475.55, 45.46),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2741.59, 1507.02, 45.3), 3.0, 3.0, {
  heading=340,
  minZ=44.1,
  maxZ=47.3,
  data = {
    id = 7,
    ptfxCoords = vector3(2743.12, 1505.79, 45.45),
  },
})

exports["rd-polytarget"]:AddBoxZone("heist_power_generator", vector3(2757.21, 1561.91, 42.89), 3.0, 3.0, {
  heading=340,
  minZ=42.1,
  maxZ=47.3,
  data = {
    id = 8,
    ptfxCoords = vector3(2759.01, 1562.72, 43.56),
  },
})
      
  exports["rd-interact"]:AddPeekEntryByPolyTarget("heist_power_generator", {{
  event = "rd-heists:powerstation:generator",
  id = "heist_power_generators",
  icon = "keyboard",
  label = "Activate",
  parameters = {},
}},
{ distance = { radius = 4.0 } })

end)

function LoadParticleDictionary(dictionary)
  if not HasNamedPtfxAssetLoaded(dictionary) then
      RequestNamedPtfxAsset(dictionary)
      while not HasNamedPtfxAssetLoaded(dictionary) do
          Citizen.Wait(0)
      end
  end
end

RegisterNetEvent("rd-heists:powerstation:generator")
AddEventHandler("rd-heists:powerstation:generator", function(p1, p2, pArgs)
  local id = pArgs.zones["heist_power_generator"].id
  local ptfxCoords = pArgs.zones["heist_power_generator"].ptfxCoords
  local particleCoords = vector3(ptfxCoords.x, ptfxCoords.y,ptfxCoords.z)
  exports['rd-drillminigame']:hacking(function(success)
    if success then
      TriggerServerEvent("rd-heists:generator:exploded", id, particleCoords)
      TriggerEvent("DoLongHudText", "Success", 1)
    else
      TriggerEvent("DoLongHudText", "Failed", 2)
  end
end, 4, 50) -- mode (tables), time
end)

RegisterNetEvent("rd-heists:generator:exploded")
AddEventHandler("rd-heists:generator:exploded", function(Coords)
  RequestNamedPtfxAsset(ptxfName)
  while not HasNamedPtfxAssetLoaded(ptxfName) do
      Citizen.Wait(1)
  end
  SetPtfxAssetNextCall(ptxfName)
  local effect = StartParticleFxLoopedAtCoord(ptfxDict, Coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
  Citizen.Wait(4000)
  StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("rd-heists:powerstation:BlackoutON")
AddEventHandler("rd-heists:powerstation:BlackoutON", function()
  SetArtificialLightsState(true)
  SetArtificialLightsStateAffectsVehicles(false)
end)

RegisterNetEvent("rd-heists:powerstation:BlackoutOff")
AddEventHandler("rd-heists:powerstation:BlackoutOff", function()
  SetArtificialLightsState(false)
  SetArtificialLightsStateAffectsVehicles(true)
end)

RegisterNetEvent("rd-heists:powerstation:setWanted")
AddEventHandler("rd-heists:powerstation:setWanted", function()
  RequestNamedPtfxAsset(ptxfName)
  while not HasNamedPtfxAssetLoaded(ptxfName) do
      Citizen.Wait(1)
  end
  SetPtfxAssetNextCall(ptxfName)
  if not IsStreamPlaying() and LoadStream("submarine_explosions_stream", "dlc_xm_submarine_sounds") then
    PlayStreamFromPosition(2854.3, 1550.34, 24.58)
  end
  local effect = StartParticleFxLoopedAtCoord(ptfxDict, 2854.3, 1550.34, 24.58, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect2 = StartParticleFxLoopedAtCoord(ptfxDict, 2837.5, 1556.19, 24.74, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect3 = StartParticleFxLoopedAtCoord(ptfxDict, 2825.65, 1512.43, 24.58, 150.0, 18000, 5 * 10000, 1000.0, false, false, false, false)
  Citizen.Wait(4000)
  local effect5 = StartParticleFxLoopedAtCoord(ptfxDict, 2854.3, 1550.34, 24.58, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect5 = StartParticleFxLoopedAtCoord(ptfxDict, 2837.5, 1556.19, 24.74, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect6 = StartParticleFxLoopedAtCoord(ptfxDict, 2825.65, 1512.43, 24.58, 150.0, 18000, 5 * 10000, 1000.0, false, false, false, false)
  Citizen.Wait(4000)
  local effect7 = StartParticleFxLoopedAtCoord(ptfxDict, 2854.3, 1550.34, 24.58, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect8 = StartParticleFxLoopedAtCoord(ptfxDict, 2837.5, 1556.19, 24.74, 150.0, 18000, 5 * 1000, 1000.0, false, false, false, false)
  local effect9 = StartParticleFxLoopedAtCoord(ptfxDict, 2825.65, 1512.43, 24.58, 150.0, 18000, 5 * 10000, 1000.0, false, false, false, false)
  Citizen.Wait(4000)
  StopParticleFxLooped(effect,effect2,effect3,effect4,effect5,effect6,effect7,effect8,effect9, 0)
  if IsStreamPlaying() then
    StopStream()
  end
end)
