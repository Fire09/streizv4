
local interiors = {}
local currentWorld = {}
local buildEvents = {}
local tempWorlds = {}

RegisterNetEvent("rd-infinity:interiors:exitInterior")
AddEventHandler("rd-infinity:interiors:exitInterior", function(pID)
    local src = source
    local state = Player(src).state
    local newWorld = GetPlayerRoutingBucket(src)

    if tonumber(newWorld) ~= 0 then
        SetPlayerRoutingBucket(src, pID)
        state.routingBucketName = "default"
    end
end)

RegisterNetEvent("rd-infinity:interiors:enteredInterior")
AddEventHandler("rd-infinity:interiors:enteredInterior", function(pID)
    local src = source
    local state = Player(src).state
    local newWorld = GetPlayerRoutingBucket(src)


    if tonumber(newWorld) ~= 0 then
        SetPlayerRoutingBucket(src, 0)
        state.routingBucketName = "default"
    end
end)

RegisterServerEvent("build:event:inside")
AddEventHandler("build:event:inside", function(pState, planData)
    local src = source
    local state = Player(src).state
    if pState then
        SetPlayerRoutingBucket(src, planData.name .. "_" .. planData.posGen)
        local newWorld = GetPlayerRoutingBucket(src)
        SetRoutingBucketPopulationEnabled(newWorld, true)
        SetRoutingBucketEntityLockdownMode(newWorld, "inactive")
        buildEvents[src] = {
            name = planData.name .. "_" .. planData.posGen,
            interior = planData.name,
            world = newWorld
        }
        state.routingBucketName = buildEvents[src].name
    else
        buildEvents[src] = nil
        SetPlayerRoutingBucket(src, 0)
        local newWorld = GetPlayerRoutingBucket(src)
        SetRoutingBucketPopulationEnabled(newWorld, true)
        SetRoutingBucketEntityLockdownMode(newWorld, "inactive")
        state.routingBucketName = "default"
    end
end)

RPC.register("rd-infinity:setWorld", function(src, bucket, pType, pState)
    local state = Player(src).state
    local newWorld = 0 
    local bucketString = bucket and bucket or "Nopixel_"

    if bucket == "default" then
        SetPlayerRoutingBucket(src, 0)
        newWorld = GetPlayerRoutingBucket(src)
        state.routingBucketName = bucketString
    else
        local name, id = CreateTempWorld(bucketString)
        SetPlayerRoutingBucket(src, id)
        newWorld = GetPlayerRoutingBucket(src)
        state.routingBucketName = name
    end

    if pType then
        SetRoutingBucketEntityLockdownMode(newWorld, pType)
    end

    if pState then
        SetRoutingBucketPopulationEnabled(newWorld, pState)
    else
        SetRoutingBucketPopulationEnabled(newWorld, true)
    end
end)

function setWorld(src, bucket, pType, pState)
    local state = Player(src).state
    local newWorld = 0 
    local bucketString = bucket and bucket or "Nopixel_"

    if bucket == "default" then
        SetPlayerRoutingBucket(src, 0)
        newWorld = GetPlayerRoutingBucket(src)
        state.routingBucketName = bucketString
    else
        local name, id = CreateTempWorld(bucketString)
        SetPlayerRoutingBucket(src, id)
        newWorld = GetPlayerRoutingBucket(src)
        state.routingBucketName = name
    end

    if pType then
        SetRoutingBucketEntityLockdownMode(newWorld, pType)
    end

    if pState then
        SetRoutingBucketPopulationEnabled(newWorld, pState)
    else
        SetRoutingBucketPopulationEnabled(newWorld, true)
    end
end

function CreateTempWorld(bucketString)
    if tempWorlds[bucketString] then
        if bucketString == tempWorlds[bucketString].bucket then
            return tempWorlds[bucketString].bucket, tempWorlds[bucketString].id
        end
    else
        tempWorlds[bucketString] = {
            id = math.random(11111, 55555),
            bucket = bucketString,
        }
        for k, v in pairs(tempWorlds) do
            if v.bucket == bucketString then
                return v.bucket, v.id
            end
        end
    end
end

exports("setWorld", setWorld)
