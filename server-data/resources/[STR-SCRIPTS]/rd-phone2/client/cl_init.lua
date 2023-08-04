Citizen.CreateThread(function()
    exports["rd-polyzone"]:AddBoxZone("heist_wifi_spot_1", vector3(-223.06, -1329.84, 30.89), 10, 10, {
        heading = 0,
        minZ = 29.89,
        maxZ = 33.89,
    })
end)

local validZones = {
  ["heist_wifi_spot_1"] = true,
  ["heist_wifi_spot_2"] = true,
  ["heist_wifi_spot_3"] = true,
  ["heist_wifi_spot_4"] = true,
}

RegisterNUICallback("connectWifi", function(data, cb)
    hiddenapp = true
    cb(true)
end)

AddEventHandler("rd-polyzone:enter", function(zone, data)
    if validZones[zone] ~= true then return end
    SendReactMessage('handleWifi', {
        show = true
    })

  local zonessss = "heist1"

    heistzone = zonessss
end)

AddEventHandler("rd-polyzone:exit", function(zone, data)
    if validZones[zone] ~= true then return end
    -- also handle wifi disconnection, and hiding of the app
    SendReactMessage('handleWifi', {
        show = false
    })
    heistzone = nil
end)

local lastTime = 0;
RegisterNetEvent('phone:triggerPager')
AddEventHandler('phone:triggerPager', function(hospital)
    print(hospital)
  local job = exports["isPed"]:isPed("myjob")
  if job == "doctor" or job == "ems" then
    local currentTime = GetGameTimer()
    if lastTime == 0 or lastTime + (5 * 60 * 1000) < currentTime then
      TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'pager', 0.4)
      exports['rd-uix']:openApplication('drpager')
      Wait(5000)
      exports['rd-uix']:openApplication('drpager')
      lastTime = currentTime
    end
  end
end)

RegisterNetEvent('phone:purchaseCar')
AddEventHandler('phone:purchaseCar', function()
  local serverid = GetPlayerServerId(PlayerId())
  local groupId = 1
  SendReactMessage('setNotify', {
      app = "phone",
      data = {
          action = "job-notification",
          title = "PDM",
          text = "Your vehicle was sent to the Alta garage.",
          icon = { name = "car", color = "white" },
          bgColor = "#dd0f08",
          jobGroupId = groupId
      },
      serverid = serverid
    })
    Wait(5000)
    SendReactMessage('closeNotify', {
      id = groupId, -- or use groupId to identify noti instead? 5head
  })
end)