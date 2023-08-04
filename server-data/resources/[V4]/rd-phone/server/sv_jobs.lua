jobs = {
    {
        id = "trucker",
        name = "24/7 Deliveries",
        icon = "fa-truck",
        limit = 2,
        x = 919.13482666016,
        y = -1256.0007324219
    },
    {
        id = "recycle",
        name = "Garbage Collector",
        icon = "fa-recycle",
        limit = 4,
        x = -353.16677856445,
        y = -1542.1300048828
    },
    {
        id = "fishing",
        name = "Fishing",
        icon = "fa-fish",
        limit = 4,
        x = -335.83563232422,
        y = 6106.2534179688
    },
    {
        id = "waterandpower",
        name = "Water & Power",
        icon = "fa-faucet",
        limit = 2,
        x = 448.0541,
        y = -1969.967
    },
    {
        id = "postop",
        name = "Post OP",
        icon = "fa-mail-bulk",
        limit = 2,
        x = -410.2616,
        y = -2795.366
    },
    {
        id = "hunting",
        name = "Hunting",
        icon = "fa-horse",
        limit = 1,
        x = -681.4046,
        y = 5832.3022
    },
    {
        id = "chicken",
        name = "Chicken",
        icon = "fa-drumstick-bite",
        limit = 1,
        x = 2386.385,
        y = 5043.8427
    },
    {
        id = "mining",
        name = "Mining",
        icon = "fa-gem",
        limit = 1,
        x = -595.1467,
        y = 2091.7565
    }
}

jobsVpn = {
    {
        id = "trucker",
        name = "24/7 Deliveries",
        icon = "fa-truck",
        limit = 2,
        x = 919.13482666016,
        y = -1256.0007324219
    },
    {
        id = "recycle",
        name = "Garbage Collector",
        icon = "fa-recycle",
        limit = 4,
        x = -353.16677856445,
        y = -1542.1300048828
    },
    {
        id = "chop_shop",
        name = "Chop Shop",
        icon = "fa-car-crash",
        limit = 9,
        x = -231.4058,
        y = -1364.013
    },
    {
        id = "fishing",
        name = "Fishing",
        icon = "fa-fish",
        limit = 4,
        x = -335.83563232422,
        y = 6106.2534179688
    },
    {
        id = "waterandpower",
        name = "Water & Power",
        icon = "fa-faucet",
        limit = 2,
        x = 448.0541,
        y = -1969.967
    },
    {
        id = "postop",
        name = "Post OP",
        icon = "fa-mail-bulk",
        limit = 2,
        x = -410.2616,
        y = -2795.366
    },
    {
        id = "hunting",
        name = "Hunting",
        icon = "fa-horse",
        limit = 1,
        x = -681.4046,
        y = 5832.3022
    },
    {
        id = "chicken",
        name = "Chicken",
        icon = "fa-drumstick-bite",
        limit = 1,
        x = 2386.385,
        y = 5043.8427
    },
    {
        id = "mining",
        name = "Mining",
        icon = "fa-gem",
        limit = 1,
        x = -595.1467,
        y = 2091.7565
    }
}
groups = {}

twentyforsevenStores = {
    [1] = vector3(-707.91296386719, -914.61614990234, 19.209251403809),
    [2] = vector3(-48.336109161377, -1757.7857666016, 29.414108276367),
    [3] = vector3(2557.4499511719, 382.97436523438, 108.62291717529),
    [4] = vector3(1961.5646972656, 3740.6901855469, 32.337738037109),
    [5] = vector3(547.49011230469, 2671.2131347656, 42.150630950928),
}

jobCoords = {
    ["trucker"] = {
        x = 919.13482666016,
        y = -1256.0007324219
    },
    ["recycle"] = {
        x = -353.16677856445,
        y = -1542.1300048828
    },
    ["chop_shop"] = {
        x = -231.4058,
        y = -1364.013
    },
    ["fishing"] = {
        x = -335.83563232422,
        y = 6106.2534179688
    },
    ["waterandpower"] = {
        x = 448.0541,
        y = -1969.967
    },
    ["postop"] = {
        x = -410.2616,
        y = -2795.366
    },
    ["hunting"] = {
        x = -681.4046,
        y = 5832.3022
    },
    ["chicken"] = {
        x = 2386.385,
        y = 5043.8427
    },
    ["mining"] = {
        x = -595.1467,
        y = 2091.7565
    }
}

currentActivityTasks = {
    ["trucker"] = {
        [1] = {
            header = "CURRENT",
            task = "Go to the foreman",
            completed = false,
        },
        [2] = {
            header = "CURRENT",
            task = "Get in the delivery vehicle",
            completed = false,
        },
        [3] = {
            header = "CURRENT",
            task = "Go to the assigned store",
            completed = false,
        },
        [4] = {
            header = "CURRENT",
            task = "Drop off goods",
            completed = false,
        },
        [5] = {
            header = "CURRENT",
            task = "Return the vehicle",
            completed = false,
        }
    },
    ["fishing"] = {
        [1] = {
            header = "CURRENT",
            task = "Find the current fishing spot",
            completed = false,
        },
        [2] = {
            header = "(0/30) CURRENT",
            task = "Test the waters", -- this will get updated + the notify
            completed = false,
        },
        [3] = {
            header = "CURRENT",
            task = "Let them know the spot is good",
            completed = false,
        }
    },
    ["boosting"] = {
        [1] = {
            header = "CURRENT",
            task = "Locate the car",
            completed = false,
        },
        [2] = {
            header = "CURRENT",
            task = "Steal the car",
            completed = false,
        },
        [3] = { -- will change to tracker if tracker
            header = "CURRENT",
            task = "Drive to the drop-off",
            completed = false,
        },
        [4] = {
            header = "CURRENT",
            task = "Leave the area",
            completed = false,
        }
    },
    ["recycle"] = {
        [1] = {
            header = "CURRENT",
            task = "Go to the foreman",
            completed = false,
        },
        [2] = {
            header = "CURRENT",
            task = "Get in the garbage truck",
            completed = false,
        },
        [3] = {
            -- header updates:
            -- (0/15) CURRENT
            -- task updates:
            -- Collect trash
            header = "CURRENT", -- this gets updated, to a random zone
            task = "Go to the assigned zone", -- and then updates when you get first
            completed = false, -- trash bag to how many left in that zone
            zone = nil,
        },
        [4] = {
            header = "CURRENT", -- this gets updated, to a random zone
            task = "Go to the assigned zone", -- and then updates when you get first
            completed = false, -- trash bag to how many left in that zone
            zone = nil,
        },
        [5] = {
            header = "CURRENT",
            task = "Return the vehicle",
            completed = false,
        }
    },
    ["waterandpower"] = {
        [1] = {
            header = "CURRENT",
            task = "Go to the foreman",
            completed = false,
        },
        [2] = {
            header = "CURRENT",
            task = "Get in the work truck",
            completed = false,
        },
        [3] = {
            header = "CURRENT",
            task = "Go to assigned electrical box",
            completed = false,
        },
        [4] = {
            header = "CURRENT",
            task = "Fix the electrical box",
            completed = false,
        },
        [5] = {
            header = "CURRENT",
            task = "Return the vehicle",
            completed = false,
        },
    },
    ["postop"] = {
        [1] = {
            header = "CURRENT",
            task = "Go to the foreman",
            completed = false,
        },
        [2] = {
            header = "CURRENT",
            task = "Get in the post truck",
            completed = false,
        },
        [3] = {
            header = "CURRENT",
            task = "Go to assigned building",
            completed = false,
        },
        [4] = {
            header = "CURRENT",
            task = "Drop off the package",
            completed = false,
        },
        [5] = {
            header = "CURRENT",
            task = "Return the vehicle",
            completed = false,
        },
    }
}

activityGroupLimits = {
    ["trucker"] = 2,
    ["recycle"] = 4,
    ["chop_shop"] = 9,
    ["fishing"] = 4,
    ["boosting"] = 2,
    ["waterandpower"] = 2,
    ["postop"] = 2,
    ["hunting"] = 1,
    ["chicken"] = 1,
    ["mining"] = 1
}

garbageZones = {
    [1] = "Los Santos International Airport",
    [2] = "Alamo Sea",
    [3] = "Alta",
    [4] = "Vespucci Beach",
    [5] = "Burton",
    [6] = "Chamberlain Hills",
    [7] = "Vinewood Hills",
    [8] = "Chumash",
    [9] = "Cypress Flats",
    [10] = "Davis",
    [11] = "Del Perro",
    [12] = "La Puerta",
    [13] = "Downtown",
    [14] = "Downtown Vinewood",
    [15] = "East Vinewood",
    [16] = "Elysian Island",
    [17] = "Harmony",
    [18] = "Hawick",
    [19] = "Little Seoul",
    [20] = "La Mesa",
    [21] = "La Puerta",
    [22] = "Mirror Park",
    [23] = "Paleto Bay",
    [24] = "Pillbox Hill",
    [25] = "Rancho",
    [26] = "Richman",
    [27] = "Rockford Hills",
    [28] = "Sandy Shores",
    [29] = "Vespucci",
    [30] = "West Vinewood",
}

signinnames = {
    ["trucker"] = "24/7 Deliverer",
    ["recycle"] = "Garbage Collector",
    ["fishing"] = "Fisherman",
    ["boosting"] = "Criminal",
    ["waterandpower"] = "Water & Power Worker",
    ["postop"] = "Post OP Deliverer",

    ["chop_shop"] = "Chop Shop",
}

jobnames = {
    ["chop_shop"] = "Chop Shop",
    ["recycle"] = "Garbage Collector",
    ["fishing"] = "Fishing",
    ["boosting"] = "Boosting",
    ["waterandpower"] = "Water & Power",
    ["postop"] = "Post OP"
}

cachedRuns = {
    ["fishing"] = {},
    ["boosting"] = {},
    ["trucker"] = {},
    ["waterandpower"] = {},
    ["postop"] = {},
    ["chop_shop"] = {},
}

paycheckCooldowns = {
    ["fishing"] = {},
    ["trucker"] = {},
    ["waterandpower"] = {},
    ["postop"] = {},
    ["chop_shop"] = {},
}

paycheckConfig = {
    ["fishing"] = {
        memberMultiplier = 1000
    },
    ["trucker"] = {
        memberMultiplier = 520
    },
    ["waterandpower"] = {
        memberMultiplier = 400
    },
    ["postop"] = {
        memberMultiplier = 900
    },
}

local function deepCopy(t)
	local result = {}
	for key, value in pairs(t) do
		if type(value) == "table" then
			result[key] = deepCopy(value)
		else
			result[key] = value
		end
	end
	return result
end



local simez = {}

RPC.register("getJobsData", function(pSource)

    local job = {}
    if simez then
    for k,v in pairs(jobs) do
    
    job[#job + 1] = {
        id = v.id,
        name = v.name,
        icon = v.icon,
        limit = v.limit,
        x = v.x,
        y = v.y,
        groups = groups[v.id] or {}
    }
    end
else
    for k,v in pairs(jobsVpn) do
    
        job[#job + 1] = {
            id = v.id,
            name = v.name,
            icon = v.icon,
            limit = v.limit,
            x = v.x,
            y = v.y,
            groups = groups[v.id] or {}
        }
        end
    end

    return job
end)

RegisterServerEvent("phone:Vpn:state")
AddEventHandler("phone:Vpn:state", function(riddle)
    simez = riddle
end)

RPC.register("getGroupData", function(pSource, pJob)
    -- check status of group and seperate into
    -- idle, busy
    -- when joining a group, update group to busy if limit met
    local job = pJob.param

    -- check if they are in group, and return diff data
    if groups[job] then
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                return {}, {}, true, groups[job][groupId], pSource, jobnames[job]
            end
        end
    end
    end

    local idle = {}
    local busy = {}

    if groups[job] then
        for k,v in pairs(groups[job]) do
            local count = 0
            for l,p in pairs(groups[job][k]) do
                count = count + 1
            end

            if tonumber(count) == activityGroupLimits[job] then
                busy[#busy + 1] = {
                    id = groups[job][k]["id"],
                    name = groups[job][k]["name"],
                    leader = groups[job][k]["leader"],
                    ready = groups[job][k]["ready"],
                    members = groups[job][k]["members"],
                    tasks = deepCopy(currentActivityTasks[job]),
                    limit = activityGroupLimits[job]
                }
            else
                if groups[job][k]["ready"] then
                    busy[#busy + 1] = {
                        id = groups[job][k]["id"],
                        name = groups[job][k]["name"],
                        leader = groups[job][k]["leader"],
                        ready = groups[job][k]["ready"],
                        members = groups[job][k]["members"],
                        tasks = deepCopy(currentActivityTasks[job]),
                        limit = activityGroupLimits[job]
                    }
                else
                    idle[#idle + 1] = {
                        id = groups[job][k]["id"],
                        name = groups[job][k]["name"],
                        leader = groups[job][k]["leader"],
                        ready = groups[job][k]["ready"],
                        members = groups[job][k]["members"],
                        tasks = deepCopy(currentActivityTasks[job]),
                        limit = activityGroupLimits[job]
                    }
                end
            end
        end
    end

    return idle, busy, false, {}, pSource, jobnames[job] --groups[job]
end)

RPC.register("getJobCoords", function(pSource, pId)
    return jobCoords[pId.param].x, jobCoords[pId.param].y
end)

RPC.register("GetSignInName", function(pSource, pJob)
    local job = pJob.param
    return signinnames[job]
end)

RPC.register("collectPaycheck", function(pSource, pJob)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id

    local getPaycheck = Await(SQL.execute("SELECT id, amount FROM paychecks WHERE cid = @cid AND job = @job", {
        ["cid"] = cid,
        ["job"] = pJob.param
    }))

    if getPaycheck[1] ~= nil then
        local delete = Await(SQL.execute("DELETE FROM paychecks WHERE id = @id AND cid = @cid", {
            ["id"] = getPaycheck[1].id,
            ["cid"] = cid
        }))
        user:addBank(tonumber(getPaycheck[1].amount))
        local payoutMessage = "$" .. tostring(getPaycheck[1].amount) .. " transferred from your paycheck."
        TriggerClientEvent("rd-phone:SendNotify", pSource, payoutMessage, "jobcenter", "Paycheck")
    else
        TriggerClientEvent("rd-phone:SendNotify", pSource, "$0 transferred from your paycheck.", "jobcenter", "Paycheck")
    end
end)

-- trigger server-side app update (to refresh groups)
RPC.register("createGroup", function(pSource, pJob, pId)--only show if no group
    local job = pJob.param
    local id = pId.param
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local name = user:getCurrentCharacter().first_name .. " " .. user:getCurrentCharacter().last_name
    if groups[job] then -- job exists in groups table (add onto it)
        math.randomseed(os.time())
        local uniqueId = tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9))
        
        groups[job][uniqueId] = {
            id = uniqueId,
            name = name, -- grab name
            leader = pSource, -- will use this to send noti to leaders phone
            status = 0,
            ready = false,
            inActivity = false,
            fishCount = 0,
            zonesDone = 0,
            trashCount = 0,
            trackersDone = 0,
            totalTrackers = 0,
            currentZone = nil,
            readyCooldownUnix = 0,
            members = {}, -- maybe include leader as a member
            tasks = deepCopy(currentActivityTasks[job]),
            limit = activityGroupLimits[job]
        }

        if groups[job][uniqueId] then
            if groups[job][uniqueId]["members"] then
                tbl = {
                    name = name,
                    src = pSource
                }
                table.insert(groups[job][uniqueId]["members"], tbl)
            end
        end

        TriggerClientEvent("updateGroups", -1)
        TriggerClientEvent("rd-phone:UpdateJobNotification", pSource, "REQUESTING TO JOIN", "Joined Group!", id)
    else -- job doesnt exist in groups table (make one)
        math.randomseed(os.time())
        local uniqueId = tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9)) .. tonumber(math.random(1,9))
        -- store trackers removed in here?
        -- kinda like fish count works
        groups[job] = {
            [uniqueId] = {
                id = uniqueId,
                name = name,
                leader = pSource,
                status = 0,
                ready = false,
                inActivity = false,
                fishCount = 0,
                zonesDone = 0,
                trashCount = 0,
                trackersDone = 0,
                totalTrackers = 0,
                currentZone = nil,
                readyCooldownUnix = 0,
                members = {},
                tasks = deepCopy(currentActivityTasks[job]),
                limit = activityGroupLimits[job]
            }
        }

        if groups[job][uniqueId] then    
            if groups[job][uniqueId]["members"] then
                tbl = {
                    name = name,
                    src = pSource
                }
                table.insert(groups[job][uniqueId]["members"], tbl)
                end
        end
        TriggerClientEvent("updateGroups", -1)
        TriggerClientEvent("rd-phone:UpdateJobNotification", pSource, "REQUESTING TO JOIN", "Joined Group!", id)
    end
end)

RPC.register("requestJoinGroup", function(pSource, pJob, pGroupId)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local name = user:getCurrentCharacter().first_name .. " " .. user:getCurrentCharacter().last_name
    local leader = groups[job][groupId]["leader"]
    local requester = pSource

    TriggerClientEvent("showJoinRequest", leader, requester, job, groupId, name)
end)

RPC.register("resetCooldown", function(pSource, pRequester)
    local requester = pRequester.param

    TriggerClientEvent("resetCooldown", requester)
end)

-- this func is called after request to join is granted
RPC.register("joinGroup", function(pSource, pJob, pGroupId, pRequester)
    local job = pJob.param
    local requester = tonumber(pRequester.param)
    local groupId = tostring(pGroupId.param)
    local user = exports["rd-base"]:getModule("Player"):GetUser(requester)
    local name = user:getCurrentCharacter().first_name .. " " .. user:getCurrentCharacter().last_name

    if groups[job][groupId] then
        if groups[job][groupId]["members"] then
            tbl = {
                name = name,
                src = requester
            }
            table.insert(groups[job][groupId]["members"], tbl)
        end
        TriggerClientEvent("updateGroups", -1)
    end

    TriggerClientEvent("resetCooldown", requester)
end)

RPC.register("leaveGroup", function(pSource, pJob, pGroupId)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)

    if groups[job][groupId] then
        if groups[job][groupId]["members"] then

            for k,v in pairs(groups[job][groupId]["members"]) do
                if tonumber(v.src) == pSource then
                    groups[job][groupId]["members"][k] = nil
                end
            end
        end
        TriggerClientEvent("updateGroups", -1)
    end
end)

RPC.register("disbandGroup", function(pSource, pJob, pGroupId)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)
    if groups[job][groupId]["ready"] then
        TriggerClientEvent('DoLongHudText', source, 'You cant dispand a ready group.', 2)
    else
        groups[job][groupId] = nil
        TriggerClientEvent("updateGroups", -1)
    end
end)

RPC.register("cancelActivity", function(pSource, pJob, pGroupId)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)
    groups[job][groupId]["ready"] = false
    groups[job][groupId]["inActivity"] = false
    groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])
    groups[job][groupId]["fishCount"] = 0
    groups[job][groupId]["zonesDone"] = 0
    groups[job][groupId]["trashCount"] = 0
    groups[job][groupId]["trackersDone"] = 0
    groups[job][groupId]["totalTrackers"] = 0
    groups[job][groupId]["currentZone"] = nil
    groups[job][groupId]["readyCooldownUnix"] = 0
    TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])
    TriggerClientEvent("OfferNotCompleted", -1, groupId, groups[job][groupId]["members"])
    TriggerClientEvent("updateGroups", -1)

    if job == "waterandpower" then
        TriggerClientEvent("rd-civjobs:waternpower:cancel", -1, groupId, groups[job][groupId]["members"])
    elseif job == "postop" then
        TriggerClientEvent("rd-civjobs:postop:cancel", -1, groupId, groups[job][groupId]["members"])
    end
    -- clear notis
    -- send not completed
    -- clear gps stuff

    TriggerClientEvent("truckerClearGPS", -1,  groupId, groups[job][groupId]["members"])
end)

RPC.register("readyGroup", function(pSource, pJob, pGroupId)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)

    if not groups[job][groupId]["ready"] then
        unix = os.time()
        groups[job][groupId]["readyCooldownUnix"] = unix
        groups[job][groupId]["ready"] = true
        TriggerClientEvent("updateGroups", -1)
        if job ~= "boosting" then
        if groups[job][groupId]["ready"] then
            if not groups[job][groupId]["inActivity"] then
                TriggerClientEvent("offerJob", pSource, groupId, job, jobnames[job])
            end
        end
        end

        return true
    else
        groups[job][groupId]["ready"] = false
        TriggerClientEvent("updateGroups", -1)

        return true
    end

    -- init a timer here for job receival?
    -- or maybe keep it seperate and loop thru all readied groups
    -- make sure to check if they are still ready when job shows

    return false
end)

RPC.register("kickGroup", function(pSource, pJob, pGroupId, pSrc)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)
    local src = pSrc.param

    if groups[job][groupId] then
        if groups[job][groupId]["members"] then

            for k,v in pairs(groups[job][groupId]["members"]) do
                if tonumber(v.src) == tonumber(src) then
                    groups[job][groupId]["members"][k] = nil
                end
            end
        end
        TriggerClientEvent("updateGroups", -1)
    end
end)

RPC.register("startActivity", function(pSource, pJob, pGroupId, pContractId, pTrackerCount)
    local job = pJob.param
    local groupId = tostring(pGroupId.param)
    groups[job][groupId]["inActivity"] = true
    if tostring(job) == "fishing" then
        Wait(900)
        TriggerClientEvent("findFishingSpot", -1, groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    elseif tostring(job) == "trucker" then
        Wait(900)
        -- this should send group id to the notification itself for the cancel activity shit
        TriggerClientEvent("talkToTruckerForeMan", -1, groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    elseif tostring(job) == "recycle" then
        Wait(900)
        TriggerClientEvent("talkToGarbageForeMan", -1, groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    elseif tostring(job) == "boosting" then
        Wait(900)
        -- this event should trigger for all members
        -- this will handle blip, contract info, currentContract
        -- all of that will get handled when this event gets
        -- triggered
        local trackerCount = tonumber(pTrackerCount.param)
        groups[job][groupId]["totalTrackers"] = trackerCount
        
        TriggerClientEvent("startBoostingContract", -1, tonumber(pContractId.param), groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    elseif tostring(job) == "waterandpower" then
        TriggerClientEvent("talkToWaterAndPowerForeMan", -1, groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    elseif tostring(job) == "postop" then
        TriggerClientEvent("talkToPostOpForeMan", -1, groupId, groups[job][groupId], groups[job][groupId]["members"], groups[job][groupId]["tasks"][1])
    end
    TriggerClientEvent("updateGroups", -1)
end)

RPC.register("completeTask", function(pSource, pJob, pTaskId, pTracker)
    local job = pJob.param
    local taskId = tonumber(pTaskId.param)

    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                if not groups[job][groupId]["tasks"][taskId]["completed"] then
                groups[job][groupId]["tasks"][taskId]["completed"] = true
                TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][taskId+1])
                TriggerClientEvent("updateGroups", -1)
                if job == "fishing" then
                    if taskId == 2 then
                        TriggerClientEvent("letThemKnowSpotIsGood", -1, groupId, groups[job][groupId]["members"])  
                    elseif taskId == 3 then

                    if not groups[job][groupId]["inActivity"] then return end
                    -- arrive back at the fishing stand
                    -- when they array back at fishing stand:

                    -- clear notify
                    TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                    TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])  
                    
                    -- add to paycheck
                    Wait(2000)
                    -- count amount of members, used to multiply base paycheck payout
                    local count = 0
                    for k,v in pairs(groups[job][groupId]["members"]) do
                        count = count + 1
                    end

                    -- add cid to group data, so we can check their cooldowns
                    for k,v in pairs(groups[job][groupId]["members"]) do

                        local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(v.src))
                        local cid = tostring(user:getCurrentCharacter().id)

                        local payout = tonumber(paycheckConfig[job]["memberMultiplier"]) * count
                    
                        if paycheckCooldowns[job][cid] then
                            -- is in paycheck cooldown array
                            -- but we need to make sure its not/or is expired

                            local curUnix = os.time()
                            local cooldownUnix = paycheckCooldowns[job][cid]

                            if tonumber(curUnix) < tonumber(cooldownUnix) then
                                -- cooldown for job has not expired. nerf payout
                                payout = 100
                            end
                        else
                            -- is not in cooldown array, check cachedRuns for job
                            if cachedRuns[job][cid] then
                                -- has previous cached runs. add onto it
                                cachedRuns[job][cid] = cachedRuns[job][cid] + 1

                                if tonumber(cachedRuns[job][cid]) == 3 then
                                    -- reached cooldown for job. apply 1 hour cooldown

                                    local time = os.time()
                                    local added = 3600

                                    local cooldown = tonumber(time) + tonumber(added)

                                    paycheckCooldowns[job][cid] = cooldown
                                end
                            else
                                -- doesnt have previous cached runs make it
                                cachedRuns[job][cid] = 1
                            end
                        end

                        -- actually add it to the jobs paycheck in db
                        local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM paychecks WHERE cid = @cid AND job = @job", {
                            ["cid"] = user:getCurrentCharacter().id,
                            ["job"] = job
                        }))
                    
                        if tonumber(count[1].total) > 0 then
                            -- paycheck exists
                            -- add onto it
                            local update = Await(SQL.execute("UPDATE paychecks SET amount = amount + @amount WHERE cid = @cid AND job = @job", {
                                ["amount"] = tonumber(payout),
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job
                            }))
                        else
                            -- paycheck doesnt exist create it
                            local insert = Await(SQL.execute("INSERT INTO paychecks (cid, job, amount) VALUES (@cid, @job, @amount)", {
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job,
                                ["amount"] = tonumber(payout)
                            }))
                        end

                        -- send notify
                        local payoutMessage = "$" .. tostring(payout) .. " added to your paycheck."
                        TriggerClientEvent("rd-phone:SendNotify", v.src, payoutMessage, "jobcenter", "Paycheck")
                    end

                    -- set group inActivity to false
                    groups[job][groupId]["inActivity"] = false

                    -- set group ready to false
                    groups[job][groupId]["ready"] = false

                    -- reset tasks
                    groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])

                    -- reset job count
                    groups[job][groupId]["fishCount"] = 0
                    end
                elseif job == "trucker" then
                    if taskId == 1 then
                        -- Start checking if any of the members sit in the car
                        -- To update and make task 2 finished
                        TriggerClientEvent("truckerIsInCar", -1, groupId, groups[job][groupId]["members"])
                    elseif taskId == 2 then
                        -- select random store
                        math.randomseed(os.time())
                        local location = twentyforsevenStores[math.random(1,5)]
                        -- trigger wide event to show marker for all members
                        TriggerClientEvent("truckerAddGPS", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)

                        -- also trigger event to check if they are at store
                        TriggerClientEvent("truckerIsAtStore", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                    elseif taskId == 3 then
                        TriggerClientEvent("truckerClearGPS", -1, groupId, groups[job][groupId]["members"])
                    elseif taskId == 4 then
                    
                        -- foreman gps
                        local location = vector3(919.12567138672, -1256.06640625, 25.518676757812)
                        TriggerClientEvent("truckerAddGPS", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                    
                        -- now trigger client to detect if they are back
                        TriggerClientEvent("truckerIsAtForeman", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)

                    elseif taskId == 5 then
                        if not groups[job][groupId]["inActivity"] then return end

                        -- when this happens, trigger
                        -- a client event that checks
                        -- if the driver? leaves car
                        -- it will delete it
                        -- delete vehicle in area of that
                        TriggerClientEvent("truckerDelCar", -1, groupId, groups[job][groupId]["members"])

                        -- clear gps
                        TriggerClientEvent("truckerClearGPS", -1, groupId, groups[job][groupId]["members"])

                        -- clear notify
                        TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                        -- complete offer
                        TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])  

                    -- add to paycheck
                    Wait(2000)

                    -- count amount of members, used to multiply base paycheck payout
                    local count = 0
                    for k,v in pairs(groups[job][groupId]["members"]) do
                        count = count + 1
                    end

                    -- add cid to group data, so we can check their cooldowns
                    for k,v in pairs(groups[job][groupId]["members"]) do

                        local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(v.src))
                        local cid = tostring(user:getCurrentCharacter().id)

                        local payout = tonumber(paycheckConfig[job]["memberMultiplier"]) * count
                    
                        if paycheckCooldowns[job][cid] then
                            -- is in paycheck cooldown array
                            -- but we need to make sure its not/or is expired

                            local curUnix = os.time()
                            local cooldownUnix = paycheckCooldowns[job][cid]

                            if tonumber(curUnix) < tonumber(cooldownUnix) then
                                -- cooldown for job has not expired. nerf payout
                                payout = 100
                            end
                        else
                            -- is not in cooldown array, check cachedRuns for job
                            if cachedRuns[job][cid] then
                                -- has previous cached runs. add onto it
                                cachedRuns[job][cid] = cachedRuns[job][cid] + 1

                                if tonumber(cachedRuns[job][cid]) == 3 then
                                    -- reached cooldown for job. apply 1 hour cooldown

                                    local time = os.time()
                                    local added = 3600

                                    local cooldown = tonumber(time) + tonumber(added)

                                    paycheckCooldowns[job][cid] = cooldown
                                end
                            else
                                -- doesnt have previous cached runs make it
                                cachedRuns[job][cid] = 1
                            end
                        end

                        -- actually add it to the jobs paycheck in db
                        local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM paychecks WHERE cid = @cid AND job = @job", {
                            ["cid"] = user:getCurrentCharacter().id,
                            ["job"] = job
                        }))
                    
                        if tonumber(count[1].total) > 0 then
                            -- paycheck exists
                            -- add onto it
                            local update = Await(SQL.execute("UPDATE paychecks SET amount = amount + @amount WHERE cid = @cid AND job = @job", {
                                ["amount"] = tonumber(payout),
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job
                            }))
                        else
                            -- paycheck doesnt exist create it
                            local insert = Await(SQL.execute("INSERT INTO paychecks (cid, job, amount) VALUES (@cid, @job, @amount)", {
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job,
                                ["amount"] = tonumber(payout)
                            }))
                        end

                        -- send notify
                        local payoutMessage = "$" .. tostring(payout) .. " added to your paycheck."
                        TriggerClientEvent("rd-phone:SendNotify", v.src, payoutMessage, "jobcenter", "Paycheck")
                    end
                    
                        -- set group inActivity to false
                        groups[job][groupId]["inActivity"] = false

                        -- set group ready to false
                        groups[job][groupId]["ready"] = false

                        -- reset tasks
                        groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])
                        groups[job][groupId]["fishCount"] = 0
                        groups[job][groupId]["zonesDone"] = 0
                        groups[job][groupId]["trashCount"] = 0
                        groups[job][groupId]["trackersDone"] = 0
                        groups[job][groupId]["totalTrackers"] = 0
                        groups[job][groupId]["currentZone"] = nil
                        groups[job][groupId]["readyCooldownUnix"] = 0
                    end
                elseif job == "recycle" then
                    if taskId == 1 then
                        -- set 2 random zones in tasks
                        math.randomseed(os.time())
                        local zone1 = garbageZones[math.random(1,35)]
                        local zone1String = "Go to the assigned zone (".. zone1 .. ")"
                        Wait(1000)
                        math.randomseed(os.time())
                        local zone2 = garbageZones[math.random(1,35)]
                        local zone2String = "Go to the assigned zone (".. zone2 .. ")"
                        -- also update currentZone to task 1 zone
                        groups[job][groupId]["currentZone"] = zone1
                        groups[job][groupId]["tasks"][3]["task"] = zone1String
                        groups[job][groupId]["tasks"][3]["zone"] = zone1
                        groups[job][groupId]["tasks"][4]["task"] = zone2String
                        groups[job][groupId]["tasks"][4]["zone"] = zone2


                        -- trigger client event to check if they enter
                        -- garbage truck
                        TriggerClientEvent("garbageIsInCar", -1, groupId, groups[job][groupId]["members"])
                    elseif taskId == 5 then
                        if not groups[job][groupId]["inActivity"] then return end
                        -- offer completed
                        -- paycheck added

                        -- when this happens, trigger
                        -- a client event that checks
                        -- if the driver? leaves car
                        -- it will delete it
                        -- delete vehicle in area of that
                        TriggerClientEvent("garbageDelCar", -1, groupId, groups[job][groupId]["members"])

                        -- clear gps
                        TriggerClientEvent("truckerClearGPS", -1, groupId, groups[job][groupId]["members"])

                        -- add to paycheck

                        -- give recycables to all in the group
                        Wait(2000)

                        -- clear notify
                        TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                        -- complete offer
                        TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])  
                    
                        -- give mats
                        TriggerClientEvent("giveMaterial", -1, groupId, groups[job][groupId]["members"]) 

                        -- set group inActivity to false
                        groups[job][groupId]["inActivity"] = false

                        -- set group ready to false
                        groups[job][groupId]["ready"] = false

                        -- reset tasks
                        groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])
                        groups[job][groupId]["fishCount"] = 0
                        groups[job][groupId]["zonesDone"] = 0
                        groups[job][groupId]["trashCount"] = 0
                        groups[job][groupId]["trackersDone"] = 0
                        groups[job][groupId]["totalTrackers"] = 0
                        groups[job][groupId]["currentZone"] = nil
                        groups[job][groupId]["readyCooldownUnix"] = 0
                    end
                elseif job == "boosting" then
                    if taskId == 2 then
                        local hasTracker = pTracker.param
                        if hasTracker then
                        local trackerCount = tostring(groups[job][groupId]["totalTrackers"])
                        local string = "(0/" .. trackerCount .. ") CURRENT"
                        groups[job][groupId]["tasks"][3]["header"] = string
                        groups[job][groupId]["tasks"][3]["task"] = "Disable the trackers"
                        TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][3])
                        -- trigger client event to check if they enter
                        -- garbage truck
                        --TriggerClientEvent("garbageIsInCar", -1, groupId, groups[job][groupId]["members"])
                        end
                    elseif taskId == 4 then
                        -- should upd phone?
                        Wait(2000)

                        -- clear notify
                        TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                        -- complete offer
                        TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])  
                    
                        -- set group inActivity to false
                        groups[job][groupId]["inActivity"] = false

                        -- set group ready to false
                        groups[job][groupId]["ready"] = false

                        -- reset tasks
                        groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])

                        -- reset trackers
                    
                        TriggerClientEvent("updateGroups", -1)
                    end
                elseif job == "waterandpower" then
                if taskId == 1 then
                    -- make event vv
                    TriggerClientEvent("waterAndPowerIsInCar", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 2 then
                    TriggerClientEvent("waterAndPowerIsAtLocation", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 3 then
                    -- start the new loop
                    TriggerClientEvent("waterAndPowerIsAtElectricalBox", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 4 then
                    -- start drive back loop
                    -- add gps
                    local location = vector3(448.0541, -1969.967, 22.998455)
                    TriggerClientEvent("truckerAddGPS", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                
                    TriggerClientEvent("waterAndPowerIsAtForeman", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                elseif taskId == 5 then
                    if not groups[job][groupId]["inActivity"] then return end
                    -- del car event
                    TriggerClientEvent("truckerDelCar", -1, groupId, groups[job][groupId]["members"])

                    -- clear gps
                    TriggerClientEvent("truckerClearGPS", -1, groupId, groups[job][groupId]["members"])

                    -- clear notify
                    TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                    -- complete offer
                    TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])

                     -- add to paycheck
                    Wait(2000)

                    local count = 0
                    for k,v in pairs(groups[job][groupId]["members"]) do
                        count = count + 1
                    end

                    -- add cid to group data, so we can check their cooldowns
                    for k,v in pairs(groups[job][groupId]["members"]) do

                        local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(v.src))
                        local cid = tostring(user:getCurrentCharacter().id)

                        local payout = tonumber(paycheckConfig[job]["memberMultiplier"]) * count
                    
                        if paycheckCooldowns[job][cid] then
                            -- is in paycheck cooldown array
                            -- but we need to make sure its not/or is expired

                            local curUnix = os.time()
                            local cooldownUnix = paycheckCooldowns[job][cid]

                            if tonumber(curUnix) < tonumber(cooldownUnix) then
                                -- cooldown for job has not expired. nerf payout
                                payout = 100
                            end
                        else
                            -- is not in cooldown array, check cachedRuns for job
                            if cachedRuns[job][cid] then
                                -- has previous cached runs. add onto it
                                cachedRuns[job][cid] = cachedRuns[job][cid] + 1

                                if tonumber(cachedRuns[job][cid]) == 3 then
                                    -- reached cooldown for job. apply 1 hour cooldown

                                    local time = os.time()
                                    local added = 3600

                                    local cooldown = tonumber(time) + tonumber(added)

                                    paycheckCooldowns[job][cid] = cooldown
                                end
                            else
                                -- doesnt have previous cached runs make it
                                cachedRuns[job][cid] = 1
                            end
                        end

                        -- actually add it to the jobs paycheck in db
                        local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM paychecks WHERE cid = @cid AND job = @job", {
                            ["cid"] = user:getCurrentCharacter().id,
                            ["job"] = job
                        }))
                    
                        if tonumber(count[1].total) > 0 then
                            -- paycheck exists
                            -- add onto it
                            local update = Await(SQL.execute("UPDATE paychecks SET amount = amount + @amount WHERE cid = @cid AND job = @job", {
                                ["amount"] = tonumber(payout),
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job
                            }))
                        else
                            -- paycheck doesnt exist create it
                            local insert = Await(SQL.execute("INSERT INTO paychecks (cid, job, amount) VALUES (@cid, @job, @amount)", {
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job,
                                ["amount"] = tonumber(payout)
                            }))
                        end

                        -- send notify
                        local payoutMessage = "$" .. tostring(payout) .. " added to your paycheck."
                        TriggerClientEvent("rd-phone:SendNotify", v.src, payoutMessage, "jobcenter", "Paycheck")
                    end
                
                    -- set group inActivity to false
                    groups[job][groupId]["inActivity"] = false

                    -- set group ready to false
                    groups[job][groupId]["ready"] = false

                    -- reset tasks
                    groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])
                    groups[job][groupId]["fishCount"] = 0
                    groups[job][groupId]["zonesDone"] = 0
                    groups[job][groupId]["trashCount"] = 0
                    groups[job][groupId]["trackersDone"] = 0
                    groups[job][groupId]["totalTrackers"] = 0
                    groups[job][groupId]["currentZone"] = nil
                    groups[job][groupId]["readyCooldownUnix"] = 0
                end
            elseif job == "postop" then
                if taskId == 1 then
                    TriggerClientEvent("postOpIsInCar", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 2 then
                    TriggerClientEvent("postOpAddGPS", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 3 then
                    -- start the new loop
                    TriggerClientEvent("postOpIsAtDropOff", -1, groupId, groups[job][groupId]["members"])
                elseif taskId == 4 then
                    -- add gps
                    local location = vector3(-410.2715, -2795.365, 5.9931931)
                    TriggerClientEvent("truckerAddGPS", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                
                    -- now trigger client to detect if they are back
                    TriggerClientEvent("postOpIsAtForeman", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                elseif taskId == 5 then
                        if not groups[job][groupId]["inActivity"] then return end
                        -- delete vehicle in area of that
                        TriggerClientEvent("truckerDelCar", -1, groupId, groups[job][groupId]["members"])

                        -- clear gps
                        TriggerClientEvent("truckerClearGPS", -1, groupId, groups[job][groupId]["members"])

                        -- clear notify
                        TriggerClientEvent("rd-phone:ClearJobNotify", -1, groupId, groups[job][groupId]["members"])

                        -- complete offer
                        TriggerClientEvent("OfferCompleted", -1, groupId, groups[job][groupId]["members"])  

                    -- add to paycheck
                    Wait(2000)

                    -- count amount of members, used to multiply base paycheck payout
                    local count = 0
                    for k,v in pairs(groups[job][groupId]["members"]) do
                        count = count + 1
                    end

                    -- add cid to group data, so we can check their cooldowns
                    for k,v in pairs(groups[job][groupId]["members"]) do

                        local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(v.src))
                        local cid = tostring(user:getCurrentCharacter().id)

                        local payout = tonumber(paycheckConfig[job]["memberMultiplier"]) * count
                    
                        if paycheckCooldowns[job][cid] then
                            -- is in paycheck cooldown array
                            -- but we need to make sure its not/or is expired

                            local curUnix = os.time()
                            local cooldownUnix = paycheckCooldowns[job][cid]

                            if tonumber(curUnix) < tonumber(cooldownUnix) then
                                -- cooldown for job has not expired. nerf payout
                                payout = 100
                            end
                        else
                            -- is not in cooldown array, check cachedRuns for job
                            if cachedRuns[job][cid] then
                                -- has previous cached runs. add onto it
                                cachedRuns[job][cid] = cachedRuns[job][cid] + 1

                                if tonumber(cachedRuns[job][cid]) == 3 then
                                    -- reached cooldown for job. apply 1 hour cooldown

                                    local time = os.time
                                    local added = 3600

                                    local cooldown = tonumber(time) + tonumber(added)

                                    paycheckCooldowns[job][cid] = cooldown
                                end
                            else
                                -- doesnt have previous cached runs make it
                                cachedRuns[job][cid] = 1
                            end
                        end

                        -- actually add it to the jobs paycheck in db
                        local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM paychecks WHERE cid = @cid AND job = @job", {
                            ["cid"] = user:getCurrentCharacter().id,
                            ["job"] = job
                        }))
                    
                        if tonumber(count[1].total) > 0 then
                            -- paycheck exists
                            -- add onto it
                            local update = Await(SQL.execute("UPDATE paychecks SET amount = amount + @amount WHERE cid = @cid AND job = @job", {
                                ["amount"] = tonumber(payout),
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job
                            }))
                        else
                            -- paycheck doesnt exist create it
                            local insert = Await(SQL.execute("INSERT INTO paychecks (cid, job, amount) VALUES (@cid, @job, @amount)", {
                                ["cid"] = user:getCurrentCharacter().id,
                                ["job"] = job,
                                ["amount"] = tonumber(payout)
                            }))
                        end

                        -- send notify
                        local payoutMessage = "$" .. tostring(payout) .. " added to your paycheck."
                        TriggerClientEvent("rd-phone:SendNotify", v.src, payoutMessage, "jobcenter", "Paycheck")
                    end
                    
                        -- set group inActivity to false
                        groups[job][groupId]["inActivity"] = false

                        -- set group ready to false
                        groups[job][groupId]["ready"] = false

                        -- reset tasks
                        groups[job][groupId]["tasks"] = deepCopy(currentActivityTasks[job])
                        groups[job][groupId]["fishCount"] = 0
                        groups[job][groupId]["zonesDone"] = 0
                        groups[job][groupId]["trashCount"] = 0
                        groups[job][groupId]["trackersDone"] = 0
                        groups[job][groupId]["totalTrackers"] = 0
                        groups[job][groupId]["currentZone"] = nil
                        groups[job][groupId]["readyCooldownUnix"] = 0
                end
                end
                end
            end
        end
    end
end)

RPC.register("getGroupingData", function(pSource, pJob)
    -- check status of group and seperate into
    -- idle, busy
    -- when joining a group, update group to busy if limit met
    local job = pJob.param

    -- check if they are in group, and return diff data
    if groups[job] then
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                return groups[job][groupId], true, pSource, jobnames[job]
            end
        end
    end
end

return groups[job], false, pSource, jobnames[job]
end)

RPC.register("getCurrentObjectCount", function(pSource, pJob)
    local job = pJob.param
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                if job == "fishing" then
                    return tonumber(groups[job][groupId]["fishCount"])
                elseif job == "recycle" then
                    return tonumber(groups[job][groupId]["trashCount"])
                elseif job == "boosting" then
                    return tonumber(groups[job][groupId]["trackersDone"])
                end
            end
        end
    end
end)

RPC.register("updateObjectiveData", function(pSource, pJob, pTaskId, pCount, pZone)
    local job = pJob.param
    local count = tonumber(pCount.param)
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then

                if job == "fishing" then
                local taskId = tonumber(pTaskId.param)

                if not groups[job][groupId]["tasks"][taskId]["completed"] then
                groups[job][groupId]["fishCount"] = count
                local count = count --tostring(groups[job][groupId]["fishCount"])
                local string = "(" .. count .. "/30" .. ")" .. " CURRENT"
                groups[job][groupId]["tasks"][taskId]["header"] = string
                TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][taskId])
                end
                elseif job == "recycle" then
                    local zone = pZone.param

                    -- add else check to this, to notify the player that it is the wrong zone
                    if tostring(zone) == tostring(groups[job][groupId]["currentZone"]) then
                        if groups[job][groupId]["tasks"][4]["completed"] then return end
                        groups[job][groupId]["trashCount"] = count
                        if not groups[job][groupId]["tasks"][3]["completed"] then
                            local string = "(" .. count .. "/15" .. ")" .. " CURRENT"
                            groups[job][groupId]["tasks"][3]["header"] = string
                            groups[job][groupId]["tasks"][3]["task"] = "Collect trash"
                            TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][3])
                        else
                            local string = "(" .. count .. "/15" .. ")" .. " CURRENT"
                            groups[job][groupId]["tasks"][4]["header"] = string
                            groups[job][groupId]["tasks"][4]["task"] = "Collect trash"
                            TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][4])
                        end
                        if count == 15 then
                            if not groups[job][groupId]["tasks"][3]["completed"] then

                                if groups[job][groupId]["tasks"][4]["completed"] then return end

                                -- zone 1 not completed complete it.
                                groups[job][groupId]["tasks"][3]["completed"] = true
                                groups[job][groupId]["currentZone"] =  groups[job][groupId]["tasks"][4]["zone"]
                                groups[job][groupId]["trashCount"] = 0 

                                -- reset header/task
                                local zone1String = "Go to the assigned zone (".. groups[job][groupId]["tasks"][3]["zone"] .. ")"
                                groups[job][groupId]["tasks"][3]["header"] = "CURRENT"
                                groups[job][groupId]["tasks"][3]["task"] = zone1String

                                TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][4])
                                TriggerClientEvent("updateGroups", -1)

                            else -- zone 1 completed
                                groups[job][groupId]["tasks"][4]["completed"] = true
                                groups[job][groupId]["currentZone"] =  groups[job][groupId]["tasks"][4]["zone"]
                                groups[job][groupId]["trashCount"] = 0 

                                local location = vector3(-332.12319946289, -1565.8051757812, 25.232130050659)
                                TriggerClientEvent("truckerAddGPS", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)
                    
                                -- now trigger client to detect if they are back
                                TriggerClientEvent("garbageIsAtForeman", -1, groupId, groups[job][groupId]["members"], location.x, location.y, location.z)

                                -- reset header/task
                                local zone2String = "Go to the assigned zone (".. groups[job][groupId]["tasks"][4]["zone"] .. ")"
                                groups[job][groupId]["tasks"][4]["header"] = "CURRENT"
                                groups[job][groupId]["tasks"][4]["task"] = zone2String

                                TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][5])
                                TriggerClientEvent("updateGroups", -1)
                            end
                        end
                    end
                elseif job == "boosting" then
                        groups[job][groupId]["trackersDone"] = count
                        if not groups[job][groupId]["tasks"][3]["completed"] then
                            local totalTrackers = tostring(groups[job][groupId]["totalTrackers"])
                            local string = "(" .. count .. "/" .. totalTrackers .. ")" .. " CURRENT"
                            groups[job][groupId]["tasks"][3]["header"] = string
                            groups[job][groupId]["tasks"][3]["task"] = "Disable trackers"
                            TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][3])
                        end
                        if count == tonumber(groups[job][groupId]["totalTrackers"]) then
                            if not groups[job][groupId]["tasks"][3]["completed"] then
                                groups[job][groupId]["trackersDone"] = 0 
                                groups[job][groupId]["totalTrackers"] = 0 

                                -- reset header/task
                                groups[job][groupId]["tasks"][3]["header"] = "CURRENT"
                                groups[job][groupId]["tasks"][3]["task"] = "Drive to the drop-off"

                                TriggerClientEvent("removedTracker", -1, groups[job][groupId]["members"])
                                TriggerClientEvent("updateJobActivity", -1, groupId, groups[job][groupId]["members"], groups[job][groupId]["tasks"][3])
                                TriggerClientEvent("updateGroups", -1)
                            end
                        end
                end
            end
        end
    end
end)

RPC.register("disbandAnyGroup", function(pSource)
    for k,v in pairs(groups) do
        for i,u in pairs(groups[k]) do
            for l,p in pairs(groups[k][i]) do
                if tonumber(groups[k][i]["leader"]) == tonumber(pSource) then
                    groups[k][i] = nil
                    TriggerClientEvent("updateGroups", -1)
                end
            end
        end
    end
end)

RPC.register("isReadiedUp", function(pSource, pJob)
    local job = pJob.param
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                return groups[job][groupId]["ready"]
            end
        end
    end
end)

RPC.register("getGroupId", function(pSource, pJob)
    local job = pJob.param
    for k,v in pairs(groups[job]) do
        local groupId = k
        for i,u in pairs(groups[job][groupId]["members"]) do
            if tonumber(u.src) == tonumber(pSource) then
                return groupId
            end
        end
    end
end)