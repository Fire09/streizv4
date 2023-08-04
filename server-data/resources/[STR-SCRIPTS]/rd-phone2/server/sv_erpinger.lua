RPC.register("ping:request", function(pSource, pTarget, pCoords, pAnon)
    local isAnon = pAnon.param
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()
    local name = char.first_name
    local last = char.last_name
    local name = name .. " " .. last
    if isAnon then
        name = "Anonymous"
    end
    local target = pTarget.param
    local coords = pCoords.param
    TriggerClientEvent("ping:receive", target, coords, name)
    return true
end)