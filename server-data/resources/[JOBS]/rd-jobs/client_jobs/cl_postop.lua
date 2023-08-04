local postop = {x = -424.33847045898, y = -2789.8154296875, z = 6.5157470703125}

local dropoffpoints = {
    [1] = {name = "El Rancho Factory",x = 956.65057373047, y = -2176.6418457031 , z = 31.150146484375},
    [2] = {name = "The Secure Unit",x = 919.31866455078, y = -1268.6900634766 , z = 25.539184570312},
    [3] = {name = "Popular Street",x = 845.05053710938, y = -902.65057373047 , z = 25.23583984375},
    [4] = {name = "Hawick Avenue",x = 401.92086791992, y = -339.27032470703 , z = 46.97216796875},
    [5] = {name = "Spanish Ave",x = 358.69451904297, y = -74.597801208496 , z = 67.0908203125},
    [6] = {name = "Pearls - Pier",x = -1793.7890625, y = -1199.0373535156 , z = 13.0029296875},
    [7] = {name = "Great Ocean Highway",x = -2947.5561523438, y = 57.019779205322 , z = 11.604370117188},
}

local isInJobPost = false
local isToDropLocation = false
local isToPostOP = false
local isNearPostOp = false
local isNearDropOff = false

local px = 0
local py = 0
local pz = 0

local PostBlip = nil

-------------------------------
-------------BLIPS-------------
-------------------------------

function Iracasa(dropoffpoints,coordinates)
    PostBlip = AddBlipForCoord(dropoffpoints[coordinates].x,dropoffpoints[coordinates].y, dropoffpoints[coordinates].z)
    SetBlipSprite(PostBlip, 1)
    SetNewWaypoint(dropoffpoints[coordinates].x,dropoffpoints[coordinates].y)
end

RegisterNetEvent('rd-civjobs:postop:cancel')
AddEventHandler('rd-civjobs:postop:cancel', function(groupId, members)
    local clientId = PlayerId()
    local src = GetPlayerServerId(clientId)
    for k,v in pairs(members) do
        if tonumber(v.src) == tonumber(src) then
            RemoveBlip(PostBlip)
            PostBlip = nil
        end
    end
end)

RegisterNetEvent('postOpIsAtLocation')
AddEventHandler('postOpIsAtLocation', function()
    isToDropLocation = true
    coordinates = math.random(1,7)
    px = dropoffpoints[coordinates].x
    py = dropoffpoints[coordinates].y
    pz = dropoffpoints[coordinates].z
    --distance = round(GetDistanceBetweenCoords(postop.x, postop.y, postop.z, px,py,pz))
    --paga = math.ceil(distance * multiplicador_De_dinero)
    Iracasa(dropoffpoints,coordinates)
    isNearPostOp = true
    isAtPostOp()
    --TriggerEvent('phone:addJobNotify', "Delivery Available: Check You GPS And Come Back For Your Paycheck")
end)

RegisterNetEvent("postOpIsAtDropOff")
AddEventHandler("postOpIsAtDropOff", function(groupId, members)
    local clientId = PlayerId()
    local src = GetPlayerServerId(clientId)
    for k,v in pairs(members) do
        if tonumber(v.src) == tonumber(src) then
            isNearDropOff = true
            isAtDropOff()
        end
    end
end)

function isAtPostOp()
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while isNearPostOp do
            Citizen.Wait(1000)
            local playerCoords = GetEntityCoords(playerPed)
            local location = vector3(px, py, pz)
            local dist = #(playerCoords - location)
            if dist <= 10.0 then
                RPC.execute("completeTask", "postop", 3)
                isNearPostOp = false
            end
        end
    end)
end

function isAtDropOff()
    local playerPed = PlayerPedId()
    Citizen.CreateThread(function()
        while isNearDropOff do
            Citizen.Wait(1000)
            local playerCoords = GetEntityCoords(playerPed)
            local location = vector3(px, py, pz)
            local dist = #(playerCoords - location)
            if dist <= 2.0 then
                canPlyDrop = 1
                exports['rd-ui']:showInteraction('[F1] Drop Off Package')
            else
                canPlyDrop = 0
                exports['rd-ui']:hideInteraction()
            end
        end
    end)
end

RegisterNetEvent('rd-jobs:drop_package')
AddEventHandler('rd-jobs:drop_package', function()
    exports['rd-ui']:hideInteraction()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    local finished = exports['rd-taskbar']:taskBar(2500, 'Dropping Goods')
    if finished == 100 then
        ClearPedTasks(PlayerPedId())
        ClearPedTasks(PlayerPedId(-1))

        RemoveBlip(PostBlip)

        RPC.execute("completeTask", "postop", 4)

        isNearDropOff = false

        Citizen.Wait(1000)
        canPlyDrop = 0
        exports['rd-ui']:hideInteraction()
    end
end)

function canDropPackage()
    if canPlyDrop == 1 then
        dropPackage = true
    elseif canPlyDrop == 0 then
        dropPackage = false
    end
    return dropPackage
end