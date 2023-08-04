local firstCall = true

RegisterNUICallback("rd-hud:setKVPValue", function(data, cb)
  SetResourceKvp(data.key, json.encode(data.value))

  if firstCall then
    firstCall = false
    Wait(30000)
  end
  TriggerEvent("rd-hud:settings", data.key, data.value)
  cb({ data = {}, meta = { ok = true, message = 'done' } })
end)

RegisterNUICallback("rd-hud:getKVPValue", function(data, cb)
  local result = GetResourceKvpString(data.key)
  local value = json.decode(result or "{}")
  cb({ data = { value = value }, meta = { ok = true, message = 'done' } })
end)

function GetPreferences()
  local result = GetResourceKvpString('rd-preferences')
  return json.decode(result or "{}")
end

exports('GetPreferences', GetPreferences)