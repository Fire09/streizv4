STX.Jobs.CurPlayerJobs = {}

for k,v in pairs(STX.Jobs.ValidJobs) do
    STX.Jobs.CurPlayerJobs[k] = {}
end

function STX.Jobs.IsWhiteListed(self, hexId, characterId, job, callback)
    if not hexId or not characterId then return end

    local q = [[SELECT cid, job, rank FROM jobs_whitelist WHERE cid = @cid AND job = @job LIMIT 1]]
    local v = {["cid"] = characterId, ["job"] = job}

    exports.oxmysql:execute(q, v, function(results)
        if not results then callback(false, false) return end

        local isWhiteListed = (results and results[1]) and results[1] or false
        local rank = (isWhiteListed and results[1].rank) and results[1].rank or false
        callback(isWhiteListed, rank)
    end)
end

function STX.Jobs.JobExists(self, job)
    return STX.Jobs.ValidJobs[job] ~= nil
end

function STX.Jobs.CountJob(self, job)
    if not STX.Jobs:JobExists(job) then return 0 end

    local count = 0
    for k,v in pairs(STX.Jobs.CurPlayerJobs[job]) do
        if job == "ems" then
            if v.isWhiteListed == true then
                count = count + 1
            end
        else
            count = count + 1
        end
    end

    return count
end

function STX.Jobs.CanBecomeJob(self, user, job, callback)
    if not user then callback(false) return end
    if not user:getVar("characterLoaded") then callback(false, "Character not loaded") return end

    local src = user:getVar("source")
    local hexId = user:getVar("hexid")
    local characterId = user:getVar("character").id

    -- if STX.Jobs.ValidJobs[job].requireDriversLicense and not exports["police"]:CheckLicense(characterId, "Drivers License") then
    --     callback(false, "You need a drivers license.")
    --     return
    -- end

    if not hexId or not characterId or not src then callback(false, "Id's don't exist") return end
        if not STX.Jobs.ValidJobs[job] then callback(false, "Job isn't a valid job") return end
        
        TriggerEvent("rd-jobmanager:attemptBecomeJob", src, characterId, function(allowed, reason)
            if not allowed then callback(false, reason) return end
        end)

        if WasEventCanceled() then callback(false) return end

        -- if STX.Jobs:CountJob(job) < 1 and STX.Jobs.ValidJobs[job].name == "EMS" then
        --     callback(true)
        --     return
        -- else
        --     callback(false)
        --     return
        -- end

        if STX.Jobs.ValidJobs[job].whitelisted then
            STX.Jobs:IsWhiteListed(hexId, characterId, job, function(whiteListed, rank)
                if not whiteListed then callback(false, "You're not whitelisted for this job") return end
                callback(true, nil, rank)
            end)
            return
        end

        if STX.Jobs:JobExists(job) then
            local jobTable = STX.Jobs.ValidJobs[job]
            if jobTable and jobTable.max then
                if STX.Jobs:CountJob(job) >= jobTable.max then callback(false, "There are too many employees for this job right now, try again later") return end
            end
        end
        callback(true)
end

function STX.Jobs.AddWhiteList(self, user, job, rank)
    local cid = user:getCurrentCharacter().id
    local hexId = user:getVar("hexid")
    local q = [[INSERT INTO jobs_whitelist (cid, job, rank) VALUES (@cid, @job, @rank)]]
    local v = {["cid"] = cid, ["owner"] = hexId, ["job"] = job, ["rank"] = rank}
    exports.oxmysql:execute(q, v)
end

function STX.Jobs.SetRank(self, user, job, rank)
    local q = [[UPDATE jobs_whitelist SET (rank) VALUES (@rank) WHERE cid = @cid]]
    local v = {["cid"] = cid, ["rank"] = rank}
    exports.oxmysql:execute(q, v)
end

function STX.Jobs.SetJob(self, user, job, notify, callback)
    if not user then return false end
    if not job or type(job) ~= "string" then return false end
    if not user:getVar("characterLoaded") then return false end 


    STX.Jobs:CanBecomeJob(user, job, function(allowed, reason, rank)
        if not allowed then
            if reason and type(reason) == "string" then
                TriggerClientEvent("DoLongHudText", user.source, tostring(reason), 2)
            end
            return
        end

        local src = user:getVar("source")
        local oldJob = user:getVar("job")
        local hexId = user:getVar("hexid")
        local characterId = user:getVar("character").id

        if oldJob then
            STX.Jobs.CurPlayerJobs[oldJob][src] = nil
        end

        user:setVar("job", job)
        STX.Jobs.CurPlayerJobs[job][src] = {rank = rank and rank or 0, lastPayCheck = GetGameTimer(),isWhiteListed = false} 

        local name = STX.Jobs.ValidJobs[job].name


        TriggerClientEvent("rd-jobmanager:playerBecameJob", src, job, name, false)
        exports.oxmysql:execute("UPDATE characters SET `job` = @job WHERE id = @id", {['@id'] = characterId, ['@job'] = job})
        TriggerClientEvent("rd-jobmanager:playerBecomeEvent", src, job, name, notify)

        -- if STX.Jobs:CountJob("trucker") >= 1 then
        --     TriggerEvent("lscustoms:IsTruckerOnline",true)
        -- elseif STX.Jobs:CountJob("trucker") <= 0 then
        --     TriggerEvent("lscustoms:IsTruckerOnline", false)
        -- end

        if callback then callback() end
    end)
end

AddEventHandler("playerDropped", function(reason)
    local src = source

    for j,u in pairs(STX.Jobs.CurPlayerJobs) do
        for k,s in pairs(u) do
            if k == src then STX.Jobs.CurPlayerJobs[j][k] = nil end
        end
    end
end)

AddEventHandler("rd-base:characterLoaded", function(user, char)
    STX.Jobs:SetJob(user, "unemployed", false)
end)

-- Need to think of a better way to do this, says no such export when resource is started
AddEventHandler("rd-base:exportsReady", function()
    exports["rd-base"]:addModule("JobManager", STX.Jobs)
end)

local policebonus = 0
local emsbonus = 0
local civbonus = 0

RegisterServerEvent('updatePays')
AddEventHandler('updatePays', function(policebonus1,emsbonus1,civbonus1)
    policebonus = policebonus1
    emsbonus = emsbonus1
    civbonus = civbonus1
end)

RegisterServerEvent('jobssystem:jobs')
AddEventHandler('jobssystem:jobs', function(job, src)
    if src == nil or src == 0 then src = source end

    local jobs = exports["rd-base"]:getModule("JobManager")
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)

    if not user then return end
    if not jobs then return end

    jobs:SetJob(user, tostring(job))

end)

STR.register("rd-jobmanager:jobCount", function(pSource, pJob)
    return STX.Jobs:CountJob(pJob)
end)