ActiveCalls = {}

function FindPlayerIdById(id)
    for k,v in ipairs(GetPlayers()) do
        local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(v))
        local CitizenId = user:getCurrentCharacter().id
        if(CitizenId == id) then
            return v
        end
    end
end

RPC.register("phone:callStart", function(pSource, pTargetNumber, isPayphone)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local pCallNumber = user:getCurrentCharacter().phone_number
    local pCid = user:getCurrentCharacter().id

    print(pCallNumber, pTargetNumber.param)

    -- add in log
    -- add out log

    startPhoneCall(pSource, pCid, pCallNumber, pTargetNumber.param, isPayphone.param)
end)

function PromiseTimeout(time)
    local timeout = promise:new()

    Citizen.SetTimeout(time or 1000, function ()
        timeout:resolve(false)
    end)

    return timeout
end

function startPhoneCall(pSource, pCid, pCallNumber, pTargetNumber, isPayphone)
    local call = {}
    print("yo??")
    --print(pCallNumber, pTargetNumber)
    local result =  Await(SQL.execute('SELECT id FROM characters WHERE phone_number = @phone_number', {['phone_number'] = pTargetNumber}))
    local targetCid = result[1].id

--[[     local ins = Await(SQL.execute("INSERT INTO phone_calls (citizenid, number, date, state) VALUES (@citizenid, @number, @date, @state)", {
        ["citizenid"] = pCid,
        ["number"] = pTargetNumber,
        ["date"] = os.time(),
        ["state"] = "out",
    }))

    if not isPayphone then
        print("not payphone")
    local ins1 = Await(SQL.execute("INSERT INTO phone_calls (citizenid, number, date, state) VALUES (@citizenid, @number, @date, @state)", {
        ["citizenid"] = targetCid,
        ["number"] = pCallNumber,
        ["date"] = os.time(),
        ["state"] = "in",
    }))
    else
        print("is payphone")
        local ins1 = Await(SQL.execute("INSERT INTO phone_calls (citizenid, number, date, state) VALUES (@citizenid, @number, @date, @state)", {
            ["citizenid"] = targetCid,
            ["number"] = "Unknown Number",
            ["date"] = os.time(),
            ["state"] = "in",
        }))
    end ]]

    print(targetCid)
    local targetId = FindPlayerIdById(targetCid)
    print(targetId)

    -- make sure to check if receiver is in a call

    -- make sure they are in-city
    -- if targetId == nil then
    --    TriggerClientEvent('radiant-phone:SendNotify', pSource, 'This phone is off :(', 'calls')
    --    return
    --end

    if tonumber(pCallNumber) == tonumber(pTargetNumber) then
        TriggerClientEvent("phone:call:inactive", pSource, pTargetNumber, nil, true)
        return
    end

    -- loop thru ActiveCalls, and see if the person
    -- they are calling is in a call.
    -- if they are
    -- it should say disconnected
    -- just call inactive event
    -- before
    if ActiveCalls then
        --print("ActiveCalls")
        for k,v in pairs(ActiveCalls) do
            -- did testREC and now i couldnt call jerry?

            if tonumber(pTargetNumber) == tonumber(v.caller.number) then
                --print("target number equals, active call caller number")
                --print("caller number: ", pTargetNumber)
                --print("found caller number: ", v.caller.number)
                TriggerClientEvent("phone:call:inactive", pSource, pTargetNumber, nil, true)
                return
            end

            if tonumber(pTargetNumber) == tonumber(v.target.number) then
                --print("target number equals, active call target number")
                --print("target number: ", pTargetNumber)
                --print("found target number: ", v.target.number)
                TriggerClientEvent("phone:call:inactive", pSource, pTargetNumber, nil, true)
                return
            end

            --print(v.caller.id)
            --print(v.target.id)

            --print(v.caller.number)
            --print(v.target.number)
        end
    end

    -- call state [ completed = 0, establishing = 1, active = 2 ]
    call.state = 1
    --print("set call state")

    --call participants
    call.caller = { id = pSource, number = pCallNumber }
    call.target = { id = targetId, number = pTargetNumber }

    --print("add call participants")

    --promises for handling connection and disconnection
    call.establish = promise:new()
    --print("promise establish")
    call.completed = promise:new()
    --print("promise completed")

    local callId = registerCallData(call)
    --print("callId", callId)

    -- do call receive logic here
    
    if targetId ~= nil then -- check payphone
    TriggerClientEvent("phone:call:receive", call.target.id, call.caller.number, callId, isPayphone)
    --print("receive noti for reciever")
    end
    print(call.caller.id)
    print(call.target.number)
    if pSource ~= nil then
    TriggerClientEvent("phone:call:dialing", call.caller.id, call.target.number, callId)
    --print("dialing noti for caller")
    end
    -- play sound for caller/receiver
    --call.target.soundId = triggerAudio(call.target.id, 1, 3.0, 'ringing', 0.5, 'playLooped')
    --call.caller.soundId = triggerAudio(call.caller.id, 1, 0.2, 'dialing', 0.5, 'playLooped')

    -- Time before automatically ending if no one answers or hangups
    --print("set promise timeout")
    local timeout = 30000 --PromiseTimeout(30, 1000)
    --print("after timeout", timeout)
    -- Race between the Promises and then we proceed to establish or complete the call depending of the winner
    promise.first({ call.establish, call.completed }):next(function (establish)
        --print("promise")
        if establish then
            --print("establish promise")
            establishPhoneCall(callId, isPayphone)
        else
            --print("not establish promise", callId)
            completePhoneCall(callId)
        end
    end)

    --call.completed:resolve(false)
end

function establishPhoneCall(callId, isPayphone)
    local call = ActiveCalls[callId]

    if call then
        --print(callId)
        -- set the call state to active
        call.state = 2
        --Notify the participants
        -- this should dismiss any receiving/dialing shit
        if call.target.id ~= nil then
        TriggerClientEvent("phone:call:in-progress", call.target.id, call.caller.number, callId, isPayphone)
        end
        if call.caller.id ~= nil then
        TriggerClientEvent("phone:call:in-progress", call.caller.id, call.target.number, callId, false) -- isPayphone
        end
        -- start the mumble call
        TriggerEvent('rd:voice:phone:call:start', call.caller.id, call.target.number, callId)
        --Once the promise is resolved we proceed to end the call 
        call.completed:next(function()
            completePhoneCall(callId)
        end)
    end
end

function completePhoneCall(callId)
    --print("completePhoneCall", callId)
    local call = ActiveCalls[callId]

    if call then 
        --set the call state to completed
        call.state = 0
        --notify the completion to the participants
        --print(call.target.id, call.caller.id)
        if call.target.id ~= nil then
                    -- have isPayphone here?????
            --print("target id not nil")
        TriggerClientEvent("phone:call:inactive", call.target.id, call.caller.number, callId)
        end
        --- this has to update the body text instead of making new noti
        if call.caller.id ~= nil then
                    -- have isPayphone here?????
            --print("caller id not nil")
        TriggerClientEvent("phone:call:inactive", call.caller.id, call.target.number, callId)
        end
        --stop the mumble call 
        TriggerEvent('rd:voice:phone:call:end', call.caller.id, call.target.id, callId)
        -- we clear the call data 
        
        clearCallData(callId)
    end
end

RPC.register("phone:callAccept", function(pSource, pCallId)
    acceptPhoneCall(pCallId.param)
end)

RPC.register("phone:callEnd", function(pSource, pCallId)
    --print("phone:callEnd", pCallId.param)
    endPhoneCall(pCallId.param) -- convert to number?
end)

function acceptPhoneCall(pCallId)
    local call = ActiveCalls[pCallId]
    if call and call.state == 1 then
        call.establish:resolve(true)
    elseif call and call.state == 0 then
        return false, 'Caller Hung up'
    elseif not call then
        return false, 'Invalid Call ID'
    end
    return true, 'Call Established'
end

RegisterCommand("answercall", function(src, args, raw)
    local callId = tonumber(args[1])
    acceptPhoneCall(callId)
end)

function endPhoneCall(pCallId)
    --print("endPhoneCall", pCallId)
    local call = ActiveCalls[pCallId]
    --print(call, call.state)
    if call and call.state == 1 then
        --print("call state 1, resolve")
        call.completed:resolve(false)
    elseif call and call.state == 2 then
        call.completed:resolve(true)
    elseif not call then
        return false, 'Invalid Call ID'
    end
    return true, 'Call Completed'
end

RegisterCommand("endcall", function(src, args, raw)
    local callId = tonumber(args[1])
    endPhoneCall(callId)
end)

function registerCallData(callData)
    local callId = #ActiveCalls +1
    ActiveCalls[callId] = callData 
    return callId
end

function clearCallData(callId)
    print("clear", callId)
    --Citizen.SetTimeout(30 * 1000, function ()
        ActiveCalls[callId] = nil
    --end)
end

RPC.register("getCharacterCalls", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT * FROM phone_calls WHERE citizenid = @citizenid ORDER BY id DESC", {
        ["citizenid"] = pCid.param
    }))

    if not data then return false, "" end

    return data
end)

RPC.register("getMyPhoneNumber", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT phone_number FROM characters WHERE id = @id", {
        ["id"] = pCid.param
    }))

    return data[1].phone_number
end)

RPC.register("deleteCalls", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local deleteCalls = Await(SQL.execute("DELETE FROM phone_calls WHERE citizenid = @citizenid", {
        ["citizenid"] = cid
    }))
end)