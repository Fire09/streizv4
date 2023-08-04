local isNearBox = false
local isNearElectricalBox = false

local DepoLocation = {x = -424.33847045898, y = -2789.8154296875, z = 6.5157470703125}

local ElectricalLocation = {
    [1] = {name = "Capital Boulevard",x = 1219.8198242188, y = -1462.9187011719 , z = 34.84033203125},
    [2] = {name = "Capital Boulevard",x = 976.49670410156, y = -1388.8879394531 , z = 31.537719726562},
    [3] = {name = "Popular Street",x = 817.9912109375, y = -493.1340637207 , z = 30.526733398438},
    [4] = {name = "Bridge Street",x = 1114.6812744141, y = -335.36703491211 , z = 67.0908203125},
    [5] = {name = "Portola Drive",x = -765.89013671875, y = -218.03076171875 , z = 37.283569335938},
    [6] = {name = "Cougar Avenue",x = -1563.5999755859, y = -233.6967010498 , z = 49.465942382812},
    [7] = {name = "West Eclipse Boulevard",x = -2064.5275878906, y = -312.89669799805, z = 13.272583007812},
    [8] = {name = "Bay City Ave",x = -1817.7098388672, y = -342.51428222656, z = 49.12890625},
}

local isCurrentlyWorkingOnElectrical = false
local ElectricalPoint = 0
local isOnTheWayToWaterNPowerJob = false
local isOnWaterNPowerJob = false

local px = 0
local py = 0
local pz = 0

local JobBlip = nil

--// Shit

function npCoolHaha(ElectricalLocation,ElectricalPoint)
    JobBlip = AddBlipForCoord(ElectricalLocation[ElectricalPoint].x,ElectricalLocation[ElectricalPoint].y, ElectricalLocation[ElectricalPoint].z)
    SetBlipSprite(JobBlip, 1)
    SetNewWaypoint(ElectricalLocation[ElectricalPoint].x,ElectricalLocation[ElectricalPoint].y)
end

RegisterNetEvent('rd-civjobs:waternpower:cancel')
AddEventHandler('rd-civjobs:waternpower:cancel', function(groupId, members)
    local clientId = PlayerId()
    local src = GetPlayerServerId(clientId)
    for k,v in pairs(members) do
        if tonumber(v.src) == tonumber(src) then
            RemoveBlip(JobBlip)
            JobBlip = nil
        end
    end
end)

RegisterNetEvent("waterAndPowerIsAtLocation")
AddEventHandler("waterAndPowerIsAtLocation", function(groupId, members)
    local clientId = PlayerId()
    local src = GetPlayerServerId(clientId)
    for k,v in pairs(members) do
        if tonumber(v.src) == tonumber(src) then
            math.randomseed(GetCloudTimeAsInt())
            ElectricalPoint = math.random(1,9)
            px = ElectricalLocation[ElectricalPoint].x
            py = ElectricalLocation[ElectricalPoint].y
            pz = ElectricalLocation[ElectricalPoint].z
            --distance = round(GetDistanceBetweenCoords(DepoLocation.x, DepoLocation.y, DepoLocation.z, px,py,pz))
            npCoolHaha(ElectricalLocation,ElectricalPoint)
            isNearBox = true
            isAtBox()
        end
    end
end)

function isAtBox()
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while isNearBox do
            Citizen.Wait(1000)
            local playerCoords = GetEntityCoords(playerPed)
            local location = vector3(px, py, pz)
            local dist = #(playerCoords - location)
            if dist <= 10.0 then
                RPC.execute("completeTask", "waterandpower", 3)
                isNearBox = false
            end
        end
    end)
end

RegisterNetEvent("waterAndPowerIsAtElectricalBox")
AddEventHandler("waterAndPowerIsAtElectricalBox", function(groupId, members)
    local clientId = PlayerId()
    local src = GetPlayerServerId(clientId)
    for k,v in pairs(members) do
        if tonumber(v.src) == tonumber(src) then

            isNearElectricalBox = true
            isAtElectricalBox()
        end
    end
end)

function isAtElectricalBox()
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while isNearElectricalBox do
            Citizen.Wait(1000)
            local playerCoords = GetEntityCoords(playerPed)
            local location = vector3(px, py, pz)
            local dist = #(playerCoords - location)
            if dist <= 2.0 then
                canPlyFix = 1
                exports['rd-ui']:showInteraction('[F1] Fix Electricals')
            else
                canPlyFix = 0
                exports['rd-ui']:hideInteraction()
            end
        end
    end)
end

RegisterNetEvent('rd-jobs:fix_elec')
AddEventHandler('rd-jobs:fix_elec', function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    TriggerEvent("animation:PlayAnimation","welding")
    canPlyFix = 0
    isNearBox = false
    exports['rd-ui']:hideInteraction()
    local canwork = exports['rd-taskbar']:taskBar(15000, 'Fixing Electricals')
    if (canwork == 100) then
        FreezeEntityPosition(GetPlayerPed(-1), false)
        RemoveBlip(JobBlip)

        RPC.execute("completeTask", "waterandpower", 4)

        isNearElectricalBox = false
        Citizen.Wait(2000)
        exports['rd-ui']:hideInteraction()
        canPlyFix = 0
    else
        FreezeEntityPosition(GetPlayerPed(-1), false)
        TriggerEvent('DoLongHudText', 'Something went wrong try again...', 2)
    end
end)

function canFixElec()
    if canPlyFix == 1 then
        fixElec = true
    elseif canPlyFix == 0 then
        fixElec = false
    end
    return fixElec
end