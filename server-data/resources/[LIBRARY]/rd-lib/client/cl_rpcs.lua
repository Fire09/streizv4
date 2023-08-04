local Resource, Promises, Functions, CallIdentifier = GetCurrentResourceName(), {}, {}, 0

STR = {}

function ClearPromise(callID)
    Citizen.SetTimeout(5000, function()
        Promises[callID] = nil
    end)
end

function ParamPacker(...)
    local params, pack = {...} , {}

    for i = 1, 15, 1 do
        pack[i] = {param = params[i]}
    end

    return pack
end

function ParamUnpacker(params, index)
    local idx = index or 1

    if idx <= #params then
        return params[idx]["param"], ParamUnpacker(params, idx + 1)
    end
end

function UnPacker(params, index)
    local idx = index or 1

    if idx <= 15 then
        return params[idx], UnPacker(params, idx + 1)
    end
end

function TriggerNetEvent(pEvent, ...)
    local payload = msgpack.pack({...})

    if payload:len() < 5000 then
        TriggerServerEventInternal(pEvent, payload, payload:len())
    else
        TriggerLatentServerEventInternal(pEvent, payload, payload:len(), 128000)
    end
end

------------------------------------------------------------------
--                  (Trigger Server Calls)
------------------------------------------------------------------

function STR.execute(name, ...)
    local callID, solved = CallIdentifier, false
    CallIdentifier = CallIdentifier + 1

    Promises[callID] = promise:new()

    TriggerNetEvent("striez:rpc:request", Resource, name, callID, ParamPacker(...), true)

    Citizen.SetTimeout(20000, function()
        if not solved then
            Promises[callID]:resolve({nil})
            TriggerServerEvent("rpc:server:timeout", Resource, name)
        end
    end)

    local response = Citizen.Await(Promises[callID])

    solved = true

    ClearPromise(callID)

    return ParamUnpacker(response)
end

function STR.executeLatent(name, timeout, ...)
    local callID, solved = CallIdentifier, false
    CallIdentifier = CallIdentifier + 1
    Promises[callID] = promise:new()

    TriggerLatentServerEvent("rpc:latent:request", 50000, Resource, name, callID, ParamPacker(...), true)

    Citizen.SetTimeout(timeout, function()
        if not solved then
            Promises[callID]:resolve({nil})
            TriggerServerEvent("rpc:server:timeout", Resource, name)
        end
    end)

    local response = Citizen.Await(Promises[callID])

    solved = true

    ClearPromise(callID)

    return ParamUnpacker(response)
end

RegisterNetEvent("striez:rpc:response")
AddEventHandler("striez:rpc:response", function(origin, callID, response)
    if Resource == origin and Promises[callID] then
        Promises[callID]:resolve(response)
    end
end)

------------------------------------------------------------------
--                  (Receive Remote Calls)
------------------------------------------------------------------

function STR.register(name, func)
    Functions[name] = func
end

function STR.remove(name)
    Functions[name] = nil
end

RegisterNetEvent("striez:rpc:request")
AddEventHandler("striez:rpc:request", function(origin, name, callID, params)
    local response

    if Functions[name] == nil then return end

    local success, error = pcall(function()
        if packaged then
            response = ParamPacker(Functions[name](ParamUnpacker(params)))
        else
            response = ParamPacker(Functions[name](UnPacker(params)))
        end
    end)

    if not success then
        TriggerServerEvent("rpc:client:error", Resource, origin, name, error)
    end

    if response == nil then
        response = {}
    end

    TriggerNetEvent("striez:rpc:response", origin, callID, response, true)
end)

RegisterNetEvent("rpc:latent:request")
AddEventHandler("rpc:latent:request", function(origin, name, callID, params)
    local response

    if Functions[name] == nil then return end

    local success, error = pcall(function()
        if packaged then
            response = ParamPacker(Functions[name](ParamUnpacker(params)))
        else
            response = ParamPacker(Functions[name](UnPacker(params)))
        end
    end)

    if not success then
        TriggerServerEvent("rpc:client:error", Resource, origin, name, error)
    end

    if response == nil then
        response = {}
    end

    TriggerLatentServerEvent("striez:rpc:response", 50000, origin, callID, response,  true)
end)
