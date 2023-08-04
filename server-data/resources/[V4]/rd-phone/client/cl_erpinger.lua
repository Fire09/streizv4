--- PINGER
local pingCoords = vector3(0, 0, 0)
local lastPingerId = -1
local blipMarker = nil

RegisterNUICallback("sendPlayerPing", function(data, cb)
  local targetId, anon, coords = data.target, data.anon, GetEntityCoords(PlayerPedId())
  RPC.execute("ping:request", targetId, coords, anon)
  cb('ok')
end)

RegisterNetEvent("ping:receive")
AddEventHandler("ping:receive", function(pCoords, pName)
  pingCoords = pCoords
  lastPingerId = pName
  PlaySound(-1, "Click_Fail", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
    local result = DoPhoneConfirmation(nil, pName, "Accept Ping", "map-marker-alt", "linear-gradient(0deg, rgba(72,105,255,1) 0%, rgba(121,37,255,1) 100%)")
    if result then
        if DoesBlipExist(blipMarker) then
            RemoveBlip(blipMarker)
        end
        blipMarker = AddBlipForCoord(pingCoords)
        SetBlipSprite(blipMarker, 280)
        SetBlipAsShortRange(blipMarker, false)
        BeginTextCommandSetBlipName("STRING")
        SetBlipColour(blipMarker, 4)
        SetBlipScale(blipMarker, 1.2)
        AddTextComponentString("Accepted GPS Marker")
        EndTextCommandSetBlipName(blipMarker)
        exports['rd-phone']:SendAlert('success', 'Their GPS ping has been marked on the map!', 3000)
        -- todo: show that ping was accepted to pinger
        -- todo: show that ping was rejected to pinger
        SetTimeout(60000, function()
        if DoesBlipExist(blipMarker) then
            RemoveBlip(blipMarker)
        end
          end)
    end
end)