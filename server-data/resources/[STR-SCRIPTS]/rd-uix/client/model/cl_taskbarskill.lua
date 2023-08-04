local listening = false
local success = false

function taskBarSkillCheck(difficulty, skillGapSent, cb)
  TriggerEvent("menu:menuexit")
  Wait(100)
  if listening then
    cb(0)
    return
  end
  listening = true
  sendAppEvent("taskbarskill", {
    display = true,
    duration = difficulty,
    difficulty = skillGapSent,
  }, { ["_withFocus"] = true })
  SetUIFocus(true, false)
  while listening do
    if IsPedRagdoll(GetPed()) then
      closeApplication("taskbarskill")
      listening = false
      success = false
    end
    SetCursorLocation(0.5, 0.5)
    Wait(50)
  end
  local result = success == true and 100 or 0
  if not success then
    TriggerEvent("DoLongHudText", "Failed attempt", 2)
  end
  if cb then cb(result) end
  return result
end

exports("taskBarSkill", taskBarSkillCheck)

RegisterNUICallback("rd-uix:taskBarSkillResult", function(data, cb)
  sendAppEvent("taskbarskill", { display = false }, { ["_withFocus"] = false })
  SetUIFocus(false, false)
  listening = false
  success = data.success
  cb({ data = {}, meta = { ok = true, message = 'done' } })
end)
