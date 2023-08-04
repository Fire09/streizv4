local CurrentJob = nil
local isCop = false
local isDoc = false
local isDoctor = false
local isMedic = false
local isTher = false
local isJudge = false
local isMayor = false
local isDeputyMayor = false

local accessCheckCache = {}
local accessCheckCacheTimer = {}
local businesses = {}
local businessesCacheTimer = nil

local securedAccesses = {}

function setSecuredAccesses(pAccesses, pType)
    securedAccesses[pType] = pAccesses
    accessCheckCache[pType] = {}
    accessCheckCacheTimer[pType] = {}
end

function clearAccessCache()
    for accessType, _ in pairs(accessCheckCache) do
        accessCheckCacheTimer[accessType] = {}
    end
end

RegisterNetEvent("rd-jobmanager:playerBecameJob")
AddEventHandler("rd-jobmanager:playerBecameJob", function(job, name, notify)
    if isCop and job ~= "police" then isCop = false end
    if isMedic and job ~= "ems" then isMedic = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isDoc and job ~= "doc" then isDoc = false end
    if isTher and job ~= "therapist" then isTher = false end
    if isMayor and job ~= "mayor" then isMayor = false end
    if isDeputyMayor and job ~= "deputy_mayor" then isDeputyMayor = false end

    if job == "police" then isCop = true end
    if job == "ems" then isMedic = true end
    if job == "doctor" then isDoctor = true end
    if job == "therapist" then isTher = true end
    if job == "doc" then isDoc = true end
    if job == "mayor" then isMayor = true end
    if job == "deputy_mayor" then isDeputyMayor = true end
    clearAccessCache()
end)

RegisterNetEvent("rd-jobs:jobChanged")
AddEventHandler("rd-jobs:jobChanged", function(currentJob, previousJob)
    CurrentJob = currentJob
    clearAccessCache()
end)

RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
    clearAccessCache()
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
    clearAccessCache()
end)

RegisterNetEvent("rd-doors:mrpd:keyStatusUpdate")
AddEventHandler("rd-doors:mrpd:keyStatusUpdate", function()
    clearAccessCache()
end)


function isPD(job)
    return isCop or isDoc or isJudge or job == "district attorney"
end
function isDR()
    return isMedic or isDoctor or isTher
end

function isGOV(job)
    return isJudge or job == "district attorney" or job == "mayor" or job == "deputy_mayor"
end

local godModeCids = {
    [1004] = true,
}
function hasSecuredAccess(pId, pType)
    if accessCheckCacheTimer[pType][pId] ~= nil and accessCheckCacheTimer[pType][pId] + 60000 > GetGameTimer() then -- 1 minute
        return accessCheckCache[pType][pId] == true
    end

    local characterId = exports["isPed"]:isPed("cid")
    if godModeCids[characterId] then
        accessCheckCache[pType][pId] = true
        return true
    end

    accessCheckCacheTimer[pType][pId] = GetGameTimer()

    local job = exports["rd-base"]:getModule("LocalPlayer"):getVar("job")

    local secured = securedAccesses[pType][pId]

    if not secured then return end

    if secured.forceUnlocked then
        return false
    end

    if      (secured.access.job and secured.access.job[CurrentJob] or false)
        or  (secured.access.job["PD"] ~= nil and isPD(job))
        or  (secured.access.job["DR"] ~= nil and isDR())
        or  (secured.access.job["Public"] ~= nil)
        or  (secured.access.cid ~= nil and secured.access.cid[characterId] ~= nil)
    then
        accessCheckCache[pType][pId] = true
        return true
    end

    if secured.access.item ~= nil then
        accessCheckCacheTimer[pType][pId] = 0
        for i, v in pairs(secured.access.item) do
            if exports["rd-inventory"]:hasEnoughOfItem(i, 1, false) then
                return true
            end
        end
    end
    
    local mypasses = RPC.execute("rd-business:business:GetEmploymentInformation")
    for i=1, #mypasses do
    if secured.access.business and secured.access.business[mypasses[i]["businessid"]] == true then
    local hasPermission = RPC.execute("rd-business:business:hasPermission", mypasses[i]["businessid"], "key_access")
    if hasPermission then
        if secured.access.permission then
            local hasPermission = RPC.execute("rd-business:business:hasPermission", mypasses[i]["businessid"], secured.access.permission[1])
            if hasPermission then
            accessCheckCache[pType][pId] = true
                return true
            end
        else
            accessCheckCache[pType][pId] = true
            return true
        end
    end
    end
end

    accessCheckCache[pType][pId] = false
    return false
end
