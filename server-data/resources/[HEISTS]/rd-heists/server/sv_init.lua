RPC.register("rd-heists:LaserStatus", function(pSource)

  local status = true

  local laser = TriggerClientEvent("rd-heists:vault:laserState", pSource, status)

  return laser
end)

RPC.register("rd-heists:OpenVaultUpperDoors", function(pSource)

  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1100, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1101, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1099, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1097, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1096, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1093, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1092, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1098, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1094, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1095, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1090, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1091, false)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:OpenMainDoorSuccess", function(pSource)

  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1103, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1102, false)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:OpenMainDoorFailed", function(pSource)

  local msg = "failed"

  return print(msg)
end)

RPC.register("rd-heists:OpenLowerDoorFailed", function(pSource)

  local msg = "failed"

  return print(msg)
end)

RPC.register("rd-heists:FailedThermite", function(pSource)

  TriggerClientEvent("inventory:removeItem", pSource, "thermitecharge", 1) 

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Failed!", 2)

  return true, msg
end)

RPC.register("rd-heists:DisruptElectricBox", function(pSource)

  TriggerClientEvent('rd-heists:succesdisruptelectricbox', pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:ActivateUpperMinigame", function(pSource)

  TriggerClientEvent('rd-heists:UpperMinigames', pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:OpenMainDoor", function(pSource)

  TriggerClientEvent("rd-heists:OpenMainDoor", pSource)

  local msg = TriggerClientEvent("addEmail", pSource, {title = "PASIFIC", subject = "Crack Password", message = "You have successfully cracked the password! To open the door, you need to crack other passwords."})

  return true, msg
end)

RPC.register("rd-heists:FailedOpenMainDoor", function(pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Failed!", 2)

  return true, msg
end)

RPC.register("rd-heists:SuccessSafeCrack", function(pSource)

  TriggerClientEvent('player:receiveItem',"Gruppe6Card22", pSource, 1)
  TriggerClientEvent('rd-heists:UpperMainDoorLaptop', pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!", 1)

  return true, msg
end)

RPC.register("rd-heists:OpenLaptopPassword", function(pSource)

  local password = math.random (1000000,9999999)

  local msg =  TriggerClientEvent("addEmail", pSource, {title = "Pasific Informant.", subject = "Pasific Bank", message = "Here's the details you need to gain access to the panel, You're on your own after that. | PASSWORD: "..password})
  TriggerClientEvent('rd-heists:LowerCodePeek', pSource, password)
  return true, msg
end)

RPC.register("rd-heists:OpenLowerDoorFirst", function(pSource)

  TriggerClientEvent("rd-heists:OpenLowerDoors", pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:OpenLowerDoorSecond", function(pSource)

  TriggerClientEvent("rd-heists:OpenLowerDoors", pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:OpenLowerDoorFailed", function(pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Failed!", 2)

  return true, msg
end)

RPC.register("rd-heists:OpenLowerDoorSuccess", function(pSource)

  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1105, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1104, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1107, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1108, false)
  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1106, false)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:PasswordConfirm", function(pSource)

  TriggerClientEvent('rd-heists:LowerCrackCodePeek', pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Access granted, but system put itself into panic mode. You need to solve the private security system.",2)

  return true, msg
end)

RPC.register("rd-heists:DeleteObjectSuccess", function(pSource)

  TriggerClientEvent('player:receiveItem',"heistbox", pSource, 1)

  TriggerClientEvent('rd-heists:ElectricBoxActivate', pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Box Removed!", 1)

  return true, msg
end)

RPC.register("rd-heists:SuccessHackDevice", function(pSource)

  local status = false

  local laser = TriggerClientEvent("rd-heists:vault:laserState", pSource, status)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Suceess!", 1)

  return msg, laser
end)

RPC.register("rd-heists:FailedHackDevice", function(pSource)

  local msg = TriggerClientEvent("DoLongHudText",pSource,"Failed!", 2)

  return true, msg
end)


RPC.register("rd-heists:FailedOpenVaultDoor", function(pSource)


  local msg = TriggerClientEvent("DoLongHudText",pSource,"Failed!", 2)

  return true, msg
end)

RPC.register("rd-heists:OpenVaultDoor", function(pSource)

  TriggerClientEvent('rd-heists:VaultDoorDrillPoly', pSource)
  TriggerClientEvent('rd-heists:vault:ServerCreateTolleys', pSource, -1)


  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!", 1)

  return true, msg
end)

RegisterServerEvent("rd-heists:OpenVaultDoor:Server")
AddEventHandler("rd-heists:OpenVaultDoor:Server", function(method)
    TriggerClientEvent("rd-heists:OpenVaultDoor:Client", -1, method)
    TriggerClientEvent('rd-doors:change-lock-state', pSource, 1111, false)
end)

local pLootLowerVault = false

RegisterServerEvent('rd-heists:vault:lootTrayGolds')
AddEventHandler('rd-heists:vault:lootTrayGolds', function()
    local src = source
    if not pLootLowerVault then
        pLootLowerVault = true
        TriggerClientEvent('rd-heists:vault:GrabTrolleys', src)
        Citizen.Wait(40000)
        pLootLowerVault = false
    end
end)

RegisterServerEvent('rd-heists:cash_tray')
AddEventHandler('rd-heists:cash_tray', function()
    local src = source
    if not Loot then
        Loot = true
        TriggerClientEvent('rd-heists:vault:grabFromTray', src)
        Citizen.Wait(40000)
        Loot = false
    end
end)

RPC.register("rd-heists:lowerRoomsDoor", function(pSource)

  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1110, false)
  TriggerClientEvent('rd-heists:lowerRoom:PolySecond', pSource)
  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

RPC.register("rd-heists:lowerRoomsDoorSecond", function(pSource)

  TriggerClientEvent('rd-doors:change-lock-state', pSource, 1109, false)
  TriggerClientEvent('rd-heists:lowerRoom:Poly', pSource)
  local msg = TriggerClientEvent("DoLongHudText",pSource,"Success!",1)

  return true, msg
end)

function SuccessRobbery(pSource)
  local chance = math.random(120)
  if chance < 25 then
    TriggerClientEvent("player:receiveItem",pSource,'band', math.random(15, 20))
end
TriggerClientEvent("player:receiveItem", pSource, "inkset",math.random(25, 50))
TriggerClientEvent("player:receiveItem", pSource, "markedbills",math.random(50, 75))
TriggerClientEvent("player:receiveItem", pSource, "inkedmoneybag",math.random(1, 2))
TriggerClientEvent("player:receiveItem", pSource, "rollcash",math.random(30, 60))
end

RPC.register("heists:SuccessRobbery", function(pSource)
  return SuccessRobbery(pSource)
end)

RegisterServerEvent("boat:SpawnHeists")
AddEventHandler("boat:SpawnHeists", function()
  local model = "patrolboat"
  local getHash = GetHashKey(model)
  local netId = CreateVehicle(getHash, 580.40, -3154.900, 2.02, 23.60,true,true)
  TriggerClientEvent('rd-heists:car:keys', source, getHash)
  return true , netId
end)

RPC.register("OilRig:spawnBoat", function(pSource)

  local malOcUgur = vector3(-2088.447, 2605.616, 0.516)

  local target = source
  local vehicle = "patrolboat"
  local coords = "-2088.447, 2605.616, 0.516"
  print("ESINASKIM",coords)
  local heading = "200.28"
  local mathRandom = math.random(15000, 99990)
  local vin = 'RN '.. mathRandom .. ' STR ' .. mathRandom ..''
  local addMods = nil
  local vehicleSpawn = exports["rd-vehicles"]:BasicSpawn(source, "patrolboat", "-2088.447, 2605.616, 0.516", "200.28", 'menu', nil, vin, addMods)
  print("OROSPUEVLADIUGURCAN")
  return vehicleSpawn
end)