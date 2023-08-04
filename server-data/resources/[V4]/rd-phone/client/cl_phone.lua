RegisterNUICallback("activateSelfieMode", function(data, cb)
  open = not open
  SetNuiFocus(open, open)
  SendReactMessage('closeApps')
  SendReactMessage('openPhone', open)
  TriggerEvent("destroyPropPhone")
  ClearPedSecondaryTask(PlayerPedId())
  DestroyMobilePhone()
  Wait(0)
  CreateMobilePhone(0)
  CellCamActivate(true, true)
  CellCamDisableThisFrame(true)
  Citizen.CreateThread(function()
    local selfieMode = true
    while selfieMode == true do
      if IsControlJustPressed(0, 177) then
        selfieMode = false
        DestroyMobilePhone()
        Wait(0)
        CellCamDisableThisFrame(false)
        CellCamActivate(false, false)
      end
      Wait(0)
    end
  end)
  cb({ data = {}, meta = { ok = true, message = '' } })
  end)
  


RegisterNetEvent('sendMessagePhoneN')
AddEventHandler('sendMessagePhoneN', function(phonenumberlol)
  TriggerServerEvent('message:tome', phonenumberlol)
  local closestPlayer, closestDistance = GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 5.0 then
    TriggerServerEvent('message:inDistanceZone', GetPlayerServerId(closestPlayer), phonenumberlol)
  else    
  end
end)

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local closestPed = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	if not IsPedInAnyVehicle(PlayerPedId(), false) then
		for index,value in ipairs(players) do
			local target = GetPlayerPed(value)
			if(target ~= ply) then
				local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
				local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestPed = target
					closestDistance = distance
				end
			end
		end
		return closestPlayer, closestDistance, closestPed
	end
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end
function GetClosestPlayers()
  local players = GetPlayers()
  local ply = PlayerPedId()
  local plyCoords = GetEntityCoords(ply, 0)
  local closestplayers = {}
  for index,value in ipairs(players) do
    local target = GetPlayerPed(value)
    if(target ~= ply) then
      local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
      local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
      if(distance < 25) then
        closestplayers[#closestplayers+1]=target
      end
    end
  end
  return #closestplayers
end

function CountPlayers() -- function to get players
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return #players
end

function getContactName(number)
  local characterId = exports["isPed"]:isPed("cid")
  local contacts = RPC.execute("getCharacterContacts", characterId)
  if (#contacts ~= 0) then
    for k,v in pairs(contacts) do
      if v ~= nil then
        if (v.number ~= nil and tonumber(v.number) == tonumber(number)) then
          return v.name, true
        end
      end
    end
  end

  return number, false
end