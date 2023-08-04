isDialing = false
isRinging = false
incomingCallId = nil
activeCallId = nil
isDead = false
notifications = false

function isInActiveCall()
    return isDialing or isRinging or activeCallId
end

RegisterNetEvent("rd-ui:restartUI")
AddEventHandler("rd-ui:restartUI", function()
  if activeCallId ~= nil then
    RPC.execute('phone:callEnd', activeCallId)
  end
  if incomingCallId ~= nil then
    RPC.execute('phone:callEnd', incomingCallId)
  end
  isDialing = false
  isRinging = false
  incomingCallId = nil
  activeCallId = nil
end)

-- This is what you should call on the receiving end ;)
RegisterNetEvent("phone:call:receive")
AddEventHandler("phone:call:receive", function(pNumber, pCallId, pPayphone)
    local serverid = GetPlayerServerId(PlayerId())
    local contactName = getContactName(pNumber)
    if pPayphone then contactName = "Unknown Number" end
    SendReactMessage('setNotify', {
      serverid = serverid,
      app = "phone",
      data = {
        action = "call-receiving",
        name = contactName,
        number = pNumber,
        callId = pCallId,
        isPayphone = pPayphone
      }
    })
  isRinging = true
  incomingCallId = pCallId

  while isRinging do
    if notifications then
      Wait(100)
    end
    if not notifications then
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 2.0, "cellcall", 0.5)
    end
    Wait(3000)
  end
end)

-- call this event when call begins
RegisterNetEvent("phone:call:in-progress")
AddEventHandler("phone:call:in-progress", function(pNumber, pCallId, pPayphone)
    local serverid = GetPlayerServerId(PlayerId())
    local contactName = getContactName(pNumber)
    if pPayphone then contactName = "Unknown Number" end
    SendReactMessage('closeNotifyByCallID', {
        callId = pCallId
    })
  
    Wait(500)

    SendReactMessage('setNotify', {
      serverid = serverid,
      app = "phone",
      data = {
        action = "call-in-progress",
        number = contactName,
        callId = pCallId
      }
    })
  isDialing, isRinging = false, false
  activeCallId = pCallId
  playPhoneCallAnim()

end)

-- call this event when call is outgoing
RegisterNetEvent("phone:call:dialing")
AddEventHandler("phone:call:dialing", function(pNumber, pCallId)
  TriggerEvent("attachItemPhone", "phone01")
  local serverid = GetPlayerServerId(PlayerId())
  local contactName = getContactName(pNumber)
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "call-dialing",
      number = contactName,
      callId = pCallId
    }
  })
  isDialing = true
  incomingCallId = pCallId
  playPhoneCallAnim()

  while isDialing do
    TriggerEvent("InteractSound_CL:PlayOnOne", "celldialing", 0.5)
    Wait(3200)
  end
end)

-- call this when there is no active calling state (not dialing, receiving, in call - after hang up)
RegisterNetEvent("phone:call:inactive")
AddEventHandler("phone:call:inactive", function(pNumber, callId, bool)
  TriggerEvent("destroyPropPhone")
  local serverid = GetPlayerServerId(PlayerId())
  local contactName = getContactName(pNumber)

  SendReactMessage('updateNotifyByCallID', {
      callId = callId
  })

  if bool then
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "call-inactive",
      number = contactName,
    }
  })
  end
  isDialing, isRinging = false, false
  activeCallId = nil
  incomingCallId = nil

end)

RegisterNUICallback("toggleNotifications", function(data, cb)
  notifications = not notifications
  cb(notifications)
end)

-- answer from phone
RegisterNUICallback("rd-ui:callAccept", function(data, cb)
    local call_id = data.callId
    local success, message = RPC.execute('phone:callAccept', call_id)
    TriggerEvent("attachItemPhone", "phone01")
end)

RegisterCommand("testpayphone", function(src, args,  raw)
  local target_number = args[1]
  RPC.execute("phone:callStart", target_number, true)
end)

-- dial from phone
RegisterNUICallback("rd-ui:callStart", function(data, cb)
  if isInActiveCall() then print("in a call") return end
  local cid = exports["isPed"]:isPed("cid")
  local caller = RPC.execute("getMyPhoneNumber", cid)
  local caller_number, target_number = caller, data.number
  RPC.execute("phone:callStart", target_number, false)
  TriggerEvent("attachItemPhone", "phone01")
  local calls = RPC.execute("getCharacterCalls", cid)
  if calls then
    local callarray = {}
    for i = 1, #calls do
      local contactName = getContactName(calls[tonumber(i)].number)
      callarray[#callarray + 1] = {
          id = tonumber(i),
          cid = calls[tonumber(i)].citizenid,
          number = calls[tonumber(i)].number,
          name = contactName,
          date = calls[tonumber(i)].date,
          state = calls[tonumber(i)].state
        }
    end
    cb(callarray)
  else
    cb(calls)
  end
end)

-- end from phone
RegisterNUICallback("rd-ui:callEnd", function(data, cb)
    local call_id = data.callId
    local success, message = RPC.execute('phone:callEnd', call_id)
    cb(true)
end)

function answerPhoneCall()
    if not incomingCallId then return end
    if isDead then return end
    RPC.execute("phone:callAccept", incomingCallId)
    TriggerEvent("attachItemPhone", "phone01")
end

function endPhoneCall()
    if isDead then return end
    if activeCallId ~= nil then
      TriggerEvent("destroyPropPhone")
      RPC.execute('phone:callEnd', activeCallId)
    elseif incomingCallId ~= nil then
      TriggerEvent("destroyPropPhone")
      RPC.execute('phone:callEnd', incomingCallId)
    end
  
    local timeout = false
  
    Citizen.SetTimeout(1500, function() timeout = true end)
  
    while not timeout and (isRinging or isDialing or activeCallId) do
      Citizen.Wait(100)
    end
end

function LoadAnimDict(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
  
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(0)
        end
    end
end

AddEventHandler("pd:deathcheck", function()
    isDead = not isDead
    if isDead then
      endPhoneCall()
      open = not open
      SetNuiFocus(open, open)
      SendReactMessage('closeApps')
      SendReactMessage('openPhone', open)
      TriggerEvent("destroyPropPhone")
      ClearPedSecondaryTask(PlayerPedId())
    end
end)

function playPhoneCallAnim()
    local dict, anim = "cellphone@", "cellphone_text_to_call"

    Citizen.CreateThread(function() 
      LoadAnimDict(dict)

      local playerPed = PlayerPedId()

      while (isDialing or activeCallId) and not isDead do
        if not IsEntityPlayingAnim(playerPed, dict, anim, 3) then
          TaskPlayAnim(playerPed, dict, anim, 3.0, -1, -1, 50, 0, false, false, false)
        end

        Citizen.Wait(5000)
      end
      -- TODO: add transitions between browse and call mode rather than clearing task
      TriggerEvent("destroyPropPhone")
      -- ClearPedTasks(playerPed)
      StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_to_call", 1.0)
    end)
end

RegisterNUICallback('getCallsData', function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local calls = RPC.execute("getCharacterCalls", characterId)

  if calls then
    local callarray = {}
    for i = 1, #calls do
      local contactName = getContactName(calls[tonumber(i)].number)
      callarray[#callarray + 1] = {
          id = tonumber(i),
          cid = calls[tonumber(i)].citizenid,
          number = calls[tonumber(i)].number,
          name = contactName,
          date = calls[tonumber(i)].date,
          state = calls[tonumber(i)].state
        }
    end
    cb({calls = callarray, contacts = contacts})
  else
    cb({calls = calls, contacts = contacts})
  end
end)

-- init
Citizen.CreateThread(function()
  exports["rd-keybinds"]:registerKeyMapping("","Phone", "Call Answer", "+answerPhoneCall", "-answerPhoneCall")
  RegisterCommand('+answerPhoneCall', answerPhoneCall, false)
  RegisterCommand('-answerPhoneCall', function() end, false)
  exports["rd-keybinds"]:registerKeyMapping("","Phone", "Call End", "+endPhoneCall", "-endPhoneCall")
  RegisterCommand('+endPhoneCall', endPhoneCall, false)
  RegisterCommand('-endPhoneCall', function() end, false)
end)