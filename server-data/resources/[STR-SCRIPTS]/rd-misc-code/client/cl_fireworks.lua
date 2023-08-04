local canFireWork = true
AddEventHandler("rd-inventory:itemUsed", function(pItem)
  if pItem ~= "fireworks_starter" then return end
  if not canFireWork then return end
  canFireWork = false
  Citizen.CreateThread(function()
    Citizen.Wait(30000)
    canFireWork = true
  end)
  TriggerServerEvent("fx:fireworks")
end)

local test = false
RegisterNetEvent("playSound")
AddEventHandler("playSound", function(sound)
  if not test then
    TriggerServerEvent('InteractSound_SV:PlayOnSource', sound, 0.2)
    Wait(500)
    test = true
  end
end)

RegisterNetEvent("riddle:delete")
AddEventHandler("riddle:delete", function(sound)
print("test")
end)