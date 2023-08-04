PPId = {
  ["1"] = {
      ["status"] = "false"
  },
  ["2"] = {
      ["status"] = "false"
  },
  ["3"] = {
      ["status"] = "false"
  },
  ["4"] = {
      ["status"] = "false"
  },
  ["5"] = {
      ["status"] = "false"
  },
  ["6"] = {
      ["status"] = "false"
  },
  ["7"] = {
      ["status"] = "false"
  },
  ["8"] = {
      ["status"] = "false"
  },
}

local striez = PPId

RegisterServerEvent("rd-heists:generator:exploded")
AddEventHandler("rd-heists:generator:exploded",function(pId, particleCoords)
  local id = pId
  local src = source
  local Powerplants = striez["".. id .. ""]
  local statusCheck = Powerplants["status"]
  if statusCheck == "false" then
    TriggerClientEvent("rd-heists:generator:exploded", src, particleCoords)
    Wait(100)
    striez["".. id .. ""]["status"] = true
    TriggerEvent("rd-heists:generator:exploded:check")
  else
    TriggerClientEvent("DoLongHudText", src, "Not activated", 2)
  end
end)

RegisterServerEvent("rd-heists:generator:exploded:check")
AddEventHandler("rd-heists:generator:exploded:check",function()
if striez["1"]["status"] == true and
   striez["2"]["status"] == true and
   striez["3"]["status"] == true and
   striez["4"]["status"] == true and
   striez["5"]["status"] == true and
   striez["6"]["status"] == true and
   striez["7"]["status"] == true and
   striez["8"]["status"] == true then
    TriggerClientEvent("rd-heists:powerstation:setWanted", -1)
    Wait(1000)
    TriggerClientEvent("rd-heists:powerstation:setWanted", -1)
    Wait(1000)
    TriggerClientEvent("rd-heists:powerstation:setWanted", -1)
    Wait(1000)
    TriggerClientEvent("rd-heists:powerstation:setWanted", -1)
    Wait(1000)
    TriggerClientEvent("rd-heists:powerstation:setWanted", -1)
    Wait(1000)
    TriggerClientEvent("rd-heists:powerstation:BlackoutON", -1)
    TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power is currently out, we're working on restoring it!")
    coolDownTime()
   else 
    print("RAGGSYY TEST 2")
   end
end)

function coolDownTime()
  local pTime = 1800

  repeat 
      Citizen.Wait(1000)
      pTime = pTime - 1
  until pTime == 0

  TriggerClientEvent('chatMessage', -1, "^1[LS Water & Power]", {255, 0, 0}, "City power has been restored!")
  TriggerClientEvent("rd-heists:powerstation:BlackoutOff", -1)
end