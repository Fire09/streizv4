local doors = {}
local elevators = {}

RegisterNetEvent('rd-doors:request-lock-state')
AddEventHandler('rd-doors:request-lock-state', function()
    local src = source
    TriggerClientEvent('rd-doors:initial-lock-state', src, doors)
end)

RegisterNetEvent('rd-doors:change-lock-state')
AddEventHandler('rd-doors:change-lock-state', function(pDoorId, pDoorLockState)
    if doors[pDoorId] then
        doors[pDoorId].lock = pDoorLockState
        TriggerClientEvent('rd-doors:change-lock-state', -1, pDoorId, pDoorLockState)
    end
end)

RegisterNetEvent("rd-door:add")
AddEventHandler("rd-door:add", function(doorCoords, doorModel)
    local src = source
    local name = GetPlayerName(src)

    local output = '--Name: ' .. name .. ' | ' .. os.date('!%Y-%m-%dT%H:%M:%SZ\n')

    output = output .. '{\n'
    output = output .. '    ["active"] = true,\n'
    output = output .. '    ["model"] = ' .. doorModel .. ',\n'
    output = output .. '    ["coords"] = vector3(' .. string.format("%.2f", doorCoords["x"]) .. ', ' .. string.format("%.2f", doorCoords["y"]) .. ', ' .. string.format("%.2f", doorCoords ["z"]) .. '),\n'
    output = output .. '    ["lock"] = 1,\n'
    output = output .. '    ["automatic"] = {},\n'
    output = output .. '    ["access"] = {},\n'
    output = output .. '},\n\n'


    file = io.open('doors.txt', "a")
    io.output(file)
    io.write(output)
    io.close(file)

    TriggerClientEvent("DoLongHudText", src, "Door saved")
end)
Citizen.CreateThread(function()
    for _,door in ipairs(DOOR_CONFIG) do
        doors[#doors + 1] = door
    end
end)

-- RegisterNetEvent("rd-doors:save-config")
-- AddEventHandler("rd-doors:save-config", function(pDoorData)
--     if pDoorData ~= nil then
--         local fileHandle = io.open("doorCoords.log", "a")
--         if fileHandle then
--             fileHandle:write(json.encode(pDoorData))
--         end
--         fileHandle:close()
--     end
-- end)

RPC.register("rd-doors:elevators:fetch",function()
    return ELEVATOR_CONFIG
end)

RegisterServerEvent("rd-doors:change-elevator-state")
AddEventHandler("rd-doors:change-elevator-state",function(elevatorId, floorId, locked)
    if ELEVATOR_CONFIG[elevatorId] then
        ELEVATOR_CONFIG[elevatorId].floors[floorId].locked = locked
        TriggerClientEvent("rd-doors:elevators:updateState", -1, elevatorId,floorId,locked,ELEVATOR_CONFIG[elevatorId].floors[floorId].forceUnlocked)
    end
end)
