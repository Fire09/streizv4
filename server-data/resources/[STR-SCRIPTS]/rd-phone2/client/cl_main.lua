open = false
hiddenapp = false
heistzone = nil

Citizen.CreateThread(function()
  local deleteCalls = RPC.execute("deleteCalls")
end)

RegisterNetEvent("rd-phone:SendNotify")
AddEventHandler("rd-phone:SendNotify", function(message, type, title, number)
local serverid = GetPlayerServerId(PlayerId())
if type == "messages" then
  local contactName = getContactName(number)
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "messages",
      title = contactName,
      body = message
    }
  })
elseif type == "charge" then
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "home-screen",
      title = title,
      body = message,
      bgColor = "rgba(39, 48, 53, 255)"
    }
  })
elseif type == "jobcenter" then
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "home-screen",
      title = title,
      body = message,
      bgColor = "#2a3038"
    }
  })
elseif type == "gasstations" then
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "home-screen",
      title = title,
      body = message,
      bgColor = "#90c9f9"
    }
  })
elseif type == "notif" then
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "home-screen",
      title = title,
      body = message,
      bgColor = "#e69138"
    }
  })
end
end)



RegisterNUICallback('hideFrame', function(_, cb)
  open = not open
  SetNuiFocus(open, open)
  SendReactMessage('closeApps')
  --SendReactMessage('openPhone', open)
  SendReactMessage('closePhone')
  TriggerEvent("destroyPropPhone")
  ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent("rd-ui:restartUI")
AddEventHandler("rd-ui:restartUI", function()
  open = false
  SetNuiFocus(false, false)
  SendReactMessage('closeApps')
  --SendReactMessage('openPhone', false)
  SendReactMessage('closePhone')
  TriggerEvent("destroyPropPhone")
  ClearPedSecondaryTask(PlayerPedId())
end)

-- function hasPhone()
--   if exports["rd-inventory"]:hasEnoughOfItem("mobilephone",1,false)
--   then
--     return true
--   else
--     return false
--   end
-- end

function SendAlert(type,message,delay)
  TriggerEvent("rd-phone:SendNotify", message, "notif", "Notification")
end

--[[

  Exports

]]

exports("SendAlert", SendAlert)

function generalPhone()
  if not exports["rd-inventory"]:hasEnoughOfItem("mobilephone",1,false)
     and not exports["rd-inventory"]:hasEnoughOfItem("assphone",1,false)
     and not exports["rd-inventory"]:hasEnoughOfItem("stolenpixel3",1,false)
     and not exports["rd-inventory"]:hasEnoughOfItem("stoleniphone",1,false)
     and not exports["rd-inventory"]:hasEnoughOfItem("stolens8",1,false)
     and not exports["rd-inventory"]:hasEnoughOfItem("boomerphone",1,false) then
 --   exports['rd-phone']:SendAlert('error', 'You don\'t have a phone.', 3000)
    return
  end
  if exports['ragdoll']:GetDeathStatus() then
   -- exports['rd-phone']:SendAlert('error', 'You can\'t use your phone while you are dead.', 3000)
    return
  end
  if exports["isPed"]:isPed("disabled") and exports["isPed"]:isPed("handcuffed") then
  --  exports['rd-phone']:SendAlert('error', 'You can\'t use your phone while you are handcuffed.', 3000)
    return
  end
  LoadAnimationDic("cellphone@")
  TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
  TriggerEvent("attachItemPhone", "phone01")
  open = not open
  serverid = GetPlayerServerId(PlayerId())
  -- local hasDongle = exports["rd-inventory"]:hasEnoughOfItem("racingusb", 1, false)
  local hasVPN = exports["rd-inventory"]:hasEnoughOfItem("vpnxj", 1, false)
  SetNuiFocus(open, open)
  SendReactMessage('openPhone', {
    bool = open,
    serverid = serverid,
    hiddenapp = hiddenapp,
    burner = false,
    notifications = notifications,
    -- hasDongle = hasDongle,
    hasVPN = hasVPN
  })
end
exports("generalPhone", generalPhone)

Citizen.CreateThread(function()
  local serverid = GetPlayerServerId(PlayerId())
  while true do
    Citizen.Wait(0)
    -- upd
    local hour = GetClockHours()
    local minute = GetClockMinutes()

    if hour < 10 then
      hour = '0'..hour
    end
    if minute < 10 then
      minute = '0'..minute
    end
    local time = hour .. ":" .. minute
    SendReactMessage('setTime', time)
    SendReactMessage('setSrc', serverid)
    Citizen.Wait(1000)
  end
end)

exports["rd-keybinds"]:registerKeyMapping("", "Phone", "Open", "+generalPhone", "-generalPhone", "P")
RegisterCommand('+generalPhone', generalPhone, false)
RegisterCommand('-generalPhone', function() end, false)