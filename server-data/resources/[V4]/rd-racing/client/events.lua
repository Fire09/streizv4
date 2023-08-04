previewEnabled = false
local usedItemId, usedItemSlot, usedItemMetadata

RegisterNetEvent("rd-racing:addedActiveRace")
AddEventHandler("rd-racing:addedActiveRace", function(race)
    print("ADDING ACTIVE RACE")
    activeRaces[race.id] = race

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("rd-racing:api:addedActiveRace", race, activeRaces)
    TriggerEvent("rd-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("rd-racing:removedActiveRace")
AddEventHandler("rd-racing:removedActiveRace", function(id)
    print("REMOVE ACTIVE RACE")
    activeRaces[id] = nil

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("rd-racing:api:removedActiveRace", activeRaces)
    TriggerEvent("rd-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("rd-racing:updatedActiveRace")
AddEventHandler("rd-racing:updatedActiveRace", function(race)
    if activeRaces[race.id] then
        activeRaces[race.id] = race
    end

    if not config.nui.hudOnly then
        SendNUIMessage({
            activeRaces = activeRaces
        })
    end

    TriggerEvent("rd-racing:api:updatedActiveRace", activeRaces)
    TriggerEvent("rd-racing:api:updatedState", { activeRaces = activeRaces })
end)

RegisterNetEvent("rd-racing:endRace")
AddEventHandler("rd-racing:endRace", function(race)
    print("RACE FUCKING END")
    SendNUIMessage({
        showHUD = false
    })

    TriggerEvent("rd-racing:api:raceEnded", race)
    TriggerEvent('rd-racing:rd-racing:api:updatedStat')
    cleanupRace()
end)

RegisterNetEvent("rd-racing:raceHistory")
AddEventHandler("rd-racing:raceHistory", function(race)
    finishedRaces[#finishedRaces + 1] = race

    if race then
        if not config.nui.hudOnly then
            SendNUIMessage({
                leaderboardData = race
            })
        end
    end

    TriggerEvent("rd-racing:api:raceHistory", race)
    TriggerEvent("rd-racing:api:updatedState", { finishedRaces = finishedRaces })
end)

RegisterNetEvent("rd-racing:startRace")
AddEventHandler("rd-racing:startRace", function(race, startTime)
    TriggerEvent("rd-racing:api:startingRace", startTime)
    -- Wait for race countdown
    Citizen.Wait(startTime - 3000)

    SendNUIMessage({
        type = "countdown",
        start = 3,
    })

    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS")
    Citizen.Wait(1000)
    PlaySoundFrontend(-1, "Oneshot_Final", "MP_MISSION_COUNTDOWN_SOUNDSET")

    if not curRace then
        initRace(race)
        TriggerEvent("rd-racing:api:raceStarted", race)
    end
end)

RegisterNetEvent("rd-racing:updatePosition")
AddEventHandler("rd-racing:updatePosition", function(position)
    -- print("Position is now: " .. position)
    SendNUIMessage({
        HUD = { position = position }
    })
end)

RegisterNetEvent("rd-racing:dnfRace")
AddEventHandler("rd-racing:dnfRace", function()
    SendNUIMessage({
        HUD = { dnf = true }
    })

    TriggerEvent("rd-racing:api:dnfRace", race)
end)

RegisterNetEvent("rd-racing:startDNFCountdown")
AddEventHandler("rd-racing:startDNFCountdown", function(dnfTime)
    SendNUIMessage({
        HUD = { dnfTime = dnfTime }
    })
end)

function round(x, n) 
    return tonumber(string.format("%." .. n .. "f", x))
end

RegisterNetEvent("rd-racing:finishedRace")
AddEventHandler("rd-racing:finishedRace", function(position, time, pEnterAmt)
    if position == 1 then
        RPC.execute('rd-racing:awardPlayer', math.random(40, 50) + round(pEnterAmt / 6, 0))
    elseif position == 2 then
        RPC.execute('rd-racing:awardPlayer', math.random(20, 30))
    elseif position == 3 then
        RPC.execute('rd-racing:awardPlayer', math.random(10))
    end
    SendNUIMessage({
        HUD = {
            position = position,
            finished = time,
        }
    })
end)

RegisterNetEvent("rd-racing:joinedRace")
AddEventHandler("rd-racing:joinedRace", function(race)
    race.start.pos = tableToVector3(race.start.pos)
    spawnCheckpointObjects(race.start, config.startObjectHash)
end)

RegisterNetEvent("rd-racing:leftRace")
AddEventHandler("rd-racing:leftRace", function()
    cleanupProps()
    TriggerEvent('rd-racing:api:updatedState')
end)

RegisterNetEvent("rd-racing:playerJoinedYourRace")
AddEventHandler("rd-racing:playerJoinedYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("rd-racing:api:playerJoinedYourRace", characterId, name)
end)

RegisterNetEvent("rd-racing:playerLeftYourRace")
AddEventHandler("rd-racing:playerLeftYourRace", function(characterId, name)
    if characterId == getCharacterId() then return end

    TriggerEvent("rd-racing:api:playerLeftYourRace", characterId, name)
end)

RegisterNetEvent("rd-racing:addedPendingRace")
AddEventHandler("rd-racing:addedPendingRace", function(race)
    pendingRaces[race.id] = race
    if not config.nui.hudOnly then
        SendNUIMessage({
            pendingRaces = pendingRaces
        })
    end

    TriggerEvent("rd-racing:api:addedPendingRace", race, pendingRaces)
    TriggerEvent("rd-racing:api:updatedState", { pendingRaces = pendingRaces })
end)

RegisterNetEvent("rd-racing:removedPendingRace")
AddEventHandler("rd-racing:removedPendingRace", function(id)
    pendingRaces[id] = nil

    SendNUIMessage({ pendingRaces = pendingRaces })

    TriggerEvent("rd-racing:api:removedPendingRace", pendingRaces)
    TriggerEvent("rd-racing:api:updatedState", {pendingRaces=pendingRaces})
end)

RegisterNetEvent("rd-racing:startCreation")
AddEventHandler("rd-racing:startCreation", function()
    startRaceCreation()
end)

RegisterNetEvent("rd-racing:addedRace")
AddEventHandler("rd-racing:addedRace", function(newRace, newRaces)
    if not races then return end
    races = newRaces

    SendNUIMessage({
        races = newRaces
    })

    TriggerEvent("rd-racing:api:addedRace")
    TriggerEvent("rd-racing:api:updatedState", {races=races})
end)

local function openAliasTextbox()
  exports['rd-ui']:openApplication('textbox', {
    callbackUrl = 'rd-ui:racing:input:alias',
    key = 1,
    items = {{icon = "pencil-alt", label = "Alias", name = "alias"}},
    show = true
  })
end

AddEventHandler("rd-inventory:itemUsed", function(item, metadata, inventoryName, slot)
  usedItemId = item
  usedItemSlot = slot

   if item == "racingusb2" then
  openAliasTextbox()
   end
end)

RegisterUICallback("rd-ui:racing:input:alias", function(data, cb)
  cb({data = {}, meta = {ok = true, message = ''}})
  exports['rd-ui']:closeApplication('textbox')
  local alias = data.values.alias
  print( data.values.alias)

  --if usedItemMetadata.Alias then return end

  if  alias == nil then
    TriggerEvent("DoLongHudText", "No alias entered!", 2)
    return
  end

  local success, msg = RPC.execute("rd-racing:setAlias", usedItemId, usedItemSlot, alias)
  if success then
    exports["rd-phone"]:phoneNotification("racen", "Welcome to the underground, " .. alias .. ".", "From the PM", 5000)
  else
    TriggerEvent("DoLongHudText", msg or "Alias could not be set.", 2)
    if msg == "Alias already taken!" then
      openAliasTextbox()
    end
  end
end)

-- RegisterCommand("rd-racing:giveRacingUSB", function()
--     RPC.execute("rd-racing:giveRacingUSB")
-- end)

AddEventHandler("onResourceStop", function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    cleanupProps()
    clearBlips()
    ClearGpsMultiRoute()
end)

RegisterNetEvent('rd-racing:api:currentRace')
AddEventHandler("rd-racing:api:currentRace", function(currentRace)
    print(json.encode(currentRace))
    -- print("FUCK THIS SHIT HERE******************************************************")
    isRacing = currentRace ~= nil
    if isRacing then
        startBubblePopper(currentRace)
    end
end)

   RegisterCommand('openracing', function()
    openAliasTextbox()
      end)