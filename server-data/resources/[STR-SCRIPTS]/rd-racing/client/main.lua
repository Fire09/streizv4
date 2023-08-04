local guiEnabled = false
local pTabletOpen = false

function phasTablet()
  return hasTablet()
end

function pNotify()
  return phoneNotifications
end

function hasTablet()
  return true
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent("phoneEnabled")
AddEventHandler("phoneEnabled", function(phoneopensent)
  phoneopen = phoneopensent
end)

RegisterNUICallback("rd-racing:pingReject", function(data, cb)
  TriggerServerEvent("rd-ping:rejected", lastPingerId)
  lastPingerId = -1
  pingCoords = vector3(0, 0, 0)
end)

function hasDecrypt()
    if exports["rd-inventory"]:hasEnoughOfItem("racingusb",1,false) then
      return true
    else
      return false
    end
end

function hasTablet()
    if exports['rd-inventory']:hasEnoughOfItem("racingipad", 1) and exports['rd-inventory']:hasEnoughOfItem("racingusb", 1) then
      return true
    else
      return false
    end
end

function LoadAnimationDic(dict)
  if not HasAnimDictLoaded(dict) then
      RequestAnimDict(dict)

      while not HasAnimDictLoaded(dict) do
          Citizen.Wait(0)
      end
  end
end

function getCardinalDirectionFromHeading()
  local heading = GetEntityHeading(PlayerPedId())
  if heading >= 315 or heading < 45 then
      return "North Bound"
  elseif heading >= 45 and heading < 135 then
      return "West Bound"
  elseif heading >= 135 and heading < 225 then
      return "South Bound"
  elseif heading >= 225 and heading < 315 then
      return "East Bound"
  end
end

local function playAnimation()
  LoadAnimationDic("amb@code_human_in_bus_passenger_idles@female@tablet@base")
  TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
  TriggerEvent("attachItemPhone", "tablet01")
end

RegisterNetEvent("rd-racing:openGUI")
AddEventHandler("rd-racing:openGUI", function()
  print('[rd-RACING] OPENING GUI...')
  print('[rd-RACING] ANIMATION LOADED...')
  openGui()
  print('[rd-RACING] GUI OPENED...')
end)

-- RegisterCommand('open', function()
--     openGui()
-- end)

function openGui()
  if recentopen then
    return
  end
  pTabletOpen = true
  if hasTablet() then
    playAnimation()
    GiveWeaponToPed(PlayerPedId(), 0xA2719263, 0, 0, 1)
    guiEnabled = true
    SetNuiFocus(false,false)
    SetNuiFocus(true,true)
    local decrypt = false
    if hasDecrypt() then
      decrypt = true
    end
    SendNUIMessage({openPhone = true, pOpenPhone = true, hasDecrypt = decrypt, playerId = GetPlayerServerId(PlayerId())})
  else
    closeGui()
    if not exports["isPed"]:isPed("disabled") then
      StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
      TriggerEvent("DoLongHudText","You're missing something.",2)
    else
      TriggerEvent("DoLongHudText","You cannot use your phone right now.",2)
    end
  end
  recentopen = false
end

-- Close Gui and disable NUI
function closeGui()
  print('[rd-RACING] CLOSING GUI...')
  SetNuiFocus(false,false)
  SendNUIMessage({openPhone = false})
  StopAnimTask(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@base", "base", 1.0)
  TriggerEvent("destroyPropPhone")
  print('[rd-RACING] STOPPING ANIMATION...')
  guiEnabled = false
  pTabletOpen = false
  recentopen = true
  Citizen.Wait(500)
  recentopen = false
  print('[rd-RACING] GUI CLOSED...')
end

RegisterNetEvent('rd-racing:UpdateStatePhone')
AddEventHandler('rd-racing:UpdateStatePhone', function()
    Wait(5)
    if callStatus == isCallInProgress then 
      SendNUIMessage({openSection = "phonemedio"}) 
    end
end)

function closeGui2()
  SetNuiFocus(false,false)
  SendNUIMessage({openPhone = false})
  guiEnabled = false
  recentopen = true
  Citizen.Wait(500)
  recentopen = false  
end

-- Opens our phone
RegisterNetEvent('phoneGui2')
AddEventHandler('phoneGui2', function()
  openGui()
end)

-- NUI Callback Methods
RegisterNUICallback('close', function(data, cb)
  closeGui()
  cb('ok')
  TriggerEvent('AttachWeapons')
end)

RegisterNetEvent('phone:close')
AddEventHandler('phone:close', function(number, message)
  closeGui()
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('phone:addJobNotify')
AddEventHandler('phone:addJobNotify', function(message)
    SendNUIMessage({openSection = "jobNotify", pEHandle = 'CURRENT', pEMessages = message})
end)

-- RegisterCommand('addJobNotify', function()
--   TriggerEvent('phone:addJobNotify', 'GAY QUEER FAGGOT RETARDED NITTY FAG')
-- end)