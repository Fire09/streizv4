 


 AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
    return
  end
  TriggerServerEvent("rd-commands:buildCommands","")
end)

RegisterCommand("cpr", function(source, args, rawCommand)
  TriggerEvent('pixerium:check', 3, 'trycpr', false)
end, false)

RegisterCommand("givekey", function(source, args, rawCommand)
  TriggerEvent("keys:give")
end, false)

RegisterCommand("window", function(source, args, rawCommand)
  TriggerEvent("car:windows",args[2], args[3])
end, false)


RegisterCommand("rollup", function(source, args, rawCommand)
  TriggerEvent("car:windowsup")
end, false)

RegisterCommand("finance", function(source, args, rawCommand)
  TriggerEvent('finance1')
end, false)


RegisterCommand("news", function(source, args, rawCommand)
  TriggerEvent('NewsStandCheck')
end, false)

RegisterCommand("confirm", function(source, args, rawCommand)
  TriggerEvent('housing:confirmed')
end, false)

-- RegisterCommand("notes", function(source, args, rawCommand)
--   TriggerEvent('Notepad:open')
-- end, false)

-- RegisterCommand("trunkkidnap", function(source, args, rawCommand)
--   TriggerEvent('ped:forceTrunk')
-- end, false)

-- RegisterCommand("trunkeject", function(source, args, rawCommand)
--   TriggerEvent('ped:releaseTrunkCheck')
-- end, false)

RegisterCommand("trunkgetin", function(source, args, rawCommand)
  TriggerEvent('ped:forceTrunkSelf')
end, false)

RegisterCommand("trunkejectself", function(source, args, rawCommand)
  TriggerEvent('ped:releaseTrunkCheckSelf')
end, false)

RegisterCommand("anchor", function(source, args, rawCommand)
  TriggerEvent('client:anchor')
end, false)

RegisterCommand("atm", function(src, args, raw)
  TriggerEvent('bank:checkATM')
end)


RegisterCommand("callsignveh", function(source,args,user)
  setVehicleCallsign(args[1], args[2], args[3])
end)

function setVehicleCallsign(pCallsign1, pCallsign2, pCallsign3)
  local plyVeh = GetVehiclePedIsIn(PlayerPedId(),false)
  exports['rd-bennys']:ApplyMod(42, tonumber(pCallsign1))
  exports['rd-bennys']:ApplyMod(44, tonumber(pCallsign2))
  exports['rd-bennys']:ApplyMod(45, tonumber(pCallsign3))
end