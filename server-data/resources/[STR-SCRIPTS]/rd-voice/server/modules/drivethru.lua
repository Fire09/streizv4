local activeChannels = {}
local channelSubscribers = {}

RPC.register("rd-voice:drivethru:subscribe", function(pServerId, pFrequency)
    if channelSubscribers[pServerId] then
        removePlayerFromRadio(pServerId, channelSubscribers[pServerId])
    end

    if activeChannels[pFrequency] == nil then
        activeChannels[pFrequency] = {}
        activeChannels[pFrequency]["subscribers"] = {}
    end

    for _, subscriber in ipairs(activeChannels[pFrequency]["subscribers"]) do
        TriggerClientEvent("rd-voice:drivethru:addSubscriber", subscriber, pFrequency, pServerId)
    end

    table.insert(activeChannels[pFrequency]["subscribers"], pServerId)

    channelSubscribers[pServerId] = pFrequency

    TriggerClientEvent("rd-voice:drivethru:addSubscriber", pServerId, pFrequency, activeChannels[pFrequency]["subscribers"])

    return true
end)

RPC.register("rd-voice:drivethru:unsubscribe", function(pSource, pCid, pNumber, pName)
    if not activeChannels[pFrequency] then return end

    for index, subscriber in ipairs(activeChannels[pFrequency]["subscribers"]) do
        if pServerId == subscriber then
            table.remove(activeChannels[pFrequency]["subscribers"], index)
        end
    end

    if #activeChannels[pFrequency]["subscribers"] == 0 then
        activeChannels[pFrequency] = nil
    else
        for _, subscriber in ipairs(activeChannels[pFrequency]["subscribers"]) do
            TriggerClientEvent("rd-voice:drivethru:removeSubscriber", subscriber, pFrequency, pServerId)
        end
    end

    channelSubscribers[pServerId] = nil

    return false
end)