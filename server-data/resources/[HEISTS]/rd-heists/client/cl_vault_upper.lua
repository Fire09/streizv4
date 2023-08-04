local OpenLaptopFirst = false
local OpenLaptopSecond = false
local OpenLaptopThird = false
local OpenLaptopFourth = false
local OpenLaptopFifth = false
local OpenLaptopSixth = false
local OpenLaptopSeventh = false
local OpenLaptopEighth = false

Citizen.CreateThread(function()

  local LaserStatus = RPC.execute("rd-heists:LaserStatus")
  
  return LaserStatus
end)

RegisterNetEvent("rd-heists:disruptelectricbox")
AddEventHandler("rd-heists:disruptelectricbox", function()
  if exports["rd-inventory"]:hasEnoughOfItem("thermitecharge", 1) then

  exports['rd-thermite']:OpenThermiteGame(function(success)
      if success then
        TriggerEvent("rd-heists:vault:electrickbox1")
      else
          local FailedThermite = RPC.execute("rd-heists:FailedThermite")
          return FailedThermite
      end
  end)

else
  TriggerEvent("DoLongHudText","You don't have the necessary items to disrupt the electrical system.",2)
end

end)

RegisterNetEvent("rd-heists:disruptelectricbox2")
AddEventHandler("rd-heists:disruptelectricbox2", function()
  if exports["rd-inventory"]:hasEnoughOfItem("thermitecharge", 1) then

  exports['rd-thermite']:OpenThermiteGame(function(success)
      if success then
        TriggerEvent("rd-heists:vault:electrickbox2")
      else
          local FailedThermite = RPC.execute("rd-heists:FailedThermite")
          return FailedThermite
      end
  end)

      else
          TriggerEvent("DoLongHudText","You don't have the necessary items to disrupt the electrical system.",2)
  end
end)

RegisterNetEvent("rd-heists:OpenLaptopFirst")
AddEventHandler("rd-heists:OpenLaptopFirst", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopFirst = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopSecond")
AddEventHandler("rd-heists:OpenLaptopSecond", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopSecond = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopThird")
AddEventHandler("rd-heists:OpenLaptopThird", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopThird = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopFourth")
AddEventHandler("rd-heists:OpenLaptopFourth", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopFourth = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopFifth")
AddEventHandler("rd-heists:OpenLaptopFifth", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopFifth = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopSixth")
AddEventHandler("rd-heists:OpenLaptopSixth", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopSixth = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopSeventh")
AddEventHandler("rd-heists:OpenLaptopSeventh", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopSeventh = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenLaptopEighth")
AddEventHandler("rd-heists:OpenLaptopEighth", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopEighth = true
        local OpenMainDoor = RPC.execute("rd-heists:OpenMainDoor")
        return OpenMainDoor
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:OpenMainDoor")
AddEventHandler("rd-heists:OpenMainDoor", function()
  if OpenLaptopFirst  and OpenLaptopSecond  and OpenLaptopThird  and OpenLaptopFourth  and OpenLaptopFifth  and OpenLaptopSixth  and OpenLaptopSeventh  and OpenLaptopEighth  then
    local OpenMainDoorSuccess = RPC.execute("rd-heists:OpenMainDoorSuccess")
    return OpenMainDoorSuccess
  end
end)