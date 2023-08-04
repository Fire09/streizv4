-- CLOSE APP
function SetUIFocus(hasKeyboard, hasMouse)
  HasNuiFocus = hasKeyboard or hasMouse
  SetNuiFocus(hasKeyboard, hasMouse)
end

exports('SetUIFocus', SetUIFocus)

RegisterNUICallback("rd-ui:closeApp", function(data, cb)
    SetUIFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    Wait(800)
    TriggerEvent("attachedItems:block",false)
end)

RegisterNUICallback("rd-ui:applicationClosed", function(data, cb)
    TriggerEvent("rd-ui:application-closed", data.name, data)
    SendUIMessage({source = "rd-nui", app = "", show = false});
    cb({data = {}, meta = {ok = true, message = 'done'}})
end)

-- FORCE CLOSE
RegisterCommand("rd-ui:force-close", function()
    SendUIMessage({source = "rd-nui", app = "", show = false});
    SetUIFocus(false, false)
end, false)

-- SMALL MAP
RegisterCommand("rd-ui:small-map", function()
  SetRadarBigmapEnabled(false, false)
end, false)

local function restartUI(withMsg)
  SendUIMessage({ source = "rd-nui", app = "main", action = "restart" });
  if withMsg then
    TriggerEvent("DoLongHudText", "You can also use 'ui-r' as a shorter version to restart!")
  end
  Wait(5000)
  TriggerEvent("rd-ui:restarted")
  SendUIMessage({ app = "hud", data = { display = true }, source = "rd-nui" })
  local cj = exports["police"]:getCurrentJob()
end
RegisterCommand("rd-ui:restart", function() restartUI(true) end, false)
RegisterCommand("ui-r", function() restartUI() end, false)
RegisterNetEvent("rd-ui:server-restart")
AddEventHandler("rd-ui:server-restart", restartUI)

RegisterCommand("rd-ui:debug:show", function()
    SendUIMessage({ source = "rd-nui", app = "debuglogs", data = { display = true } });
end, false)

RegisterCommand("rd-ui:debug:hide", function()
    SendUIMessage({ source = "rd-nui", app = "debuglogs", data = { display = false } });
end, false)

RegisterNUICallback("rd-ui:resetApp", function(data, cb)
    SetUIFocus(false, false)
    cb({data = {}, meta = {ok = true, message = 'done'}})
    --sendCharacterData()
end)

RegisterNetEvent("rd-ui:server-relay")
AddEventHandler("rd-ui:server-relay", function(data)
    SendUIMessage(data)
end)

RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
  sendAppEvent("character", { job = "judge" })
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
  sendAppEvent("character", { job = "unemployed" })
end)

RegisterNetEvent("rd-jobmanager:playerBecameJob")
AddEventHandler("rd-jobmanager:playerBecameJob", function(job)
  sendAppEvent("character", { job = job })
end)
