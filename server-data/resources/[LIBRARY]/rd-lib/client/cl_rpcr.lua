local Resource, Promises, Functions, CallIdentifier = GetCurrentResourceName(), {}, {}, 0

RGS = {}

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

function RGS.execute(name, ...)
    local callID, solved = CallIdentifier, false
    CallIdentifier = CallIdentifier + 1

    Promises[callID] = promise:new()

    TriggerNetEvent("raggsyy:rpc:request", Resource, name, callID, ParamPacker(...), true)

    Citizen.SetTimeout(20000, function()
        if not solved then
            Promises[callID]:resolve({nil})
            TriggerServerEvent("raggsyy:rpc:server:timeout", Resource, name)
        end
    end)

    local response = Citizen.Await(Promises[callID])

    solved = true

    ClearPromise(callID)

    return ParamUnpacker(response)
end

function RGS.executeLatent(name, timeout, ...)
    local callID, solved = CallIdentifier, false
    CallIdentifier = CallIdentifier + 1
    Promises[callID] = promise:new()

    TriggerLatentServerEvent("raggsyy:rpc:latent:request", 50000, Resource, name, callID, ParamPacker(...), true)

    Citizen.SetTimeout(timeout, function()
        if not solved then
            Promises[callID]:resolve({nil})
            TriggerServerEvent("raggsyy:rpc:server:timeout", Resource, name)
        end
    end)

    local response = Citizen.Await(Promises[callID])

    solved = true

    ClearPromise(callID)

    return ParamUnpacker(response)
end

RegisterNetEvent("raggsyy:rpc:response")
AddEventHandler("raggsyy:rpc:response", function(origin, callID, response)
    if Resource == origin and Promises[callID] then
        Promises[callID]:resolve(response)
    end
end)

------------------------------------------------------------------
--                  (Receive Remote Calls)
------------------------------------------------------------------

function RGS.register(name, func)
    Functions[name] = func
end

function RGS.remove(name)
    Functions[name] = nil
end

RegisterNetEvent("raggsyy:rpc:request")
AddEventHandler("raggsyy:rpc:request", function(origin, name, callID, params)
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
        TriggerServerEvent("raggsyy:rpc:client:error", Resource, origin, name, error)
    end

    if response == nil then
        response = {}
    end

    TriggerNetEvent("raggsyy:rpc:response", origin, callID, response, true)
end)

RegisterNetEvent("raggsyy:rpc:latent:request")
AddEventHandler("raggsyy:rpc:latent:request", function(origin, name, callID, params)
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
        TriggerServerEvent("raggsyy:rpc:client:error", Resource, origin, name, error)
    end

    if response == nil then
        response = {}
    end

    TriggerLatentServerEvent("raggsyy:rpc:response", 50000, origin, callID, response,  true)
end)