--[[

    Variables

]]

local registers = {}
local registerCooldown = 60000 * 15
local players = {}
local playerCooldown = 60000 * 30

--[[

    RPCs

]]

RPC.register("heists:canRobRegister", function(src, pRegisterId)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    local cid = user:getCurrentCharacter().id
    if not cid then
        return "No cid found"
    end

    if players[cid] and players[cid] > GetGameTimer() then
        return "You can't commit that same crime that fast, wait for the dust to settle."
    end

    if registers[pRegisterId] and registers[pRegisterId] > GetGameTimer() then
        return "There's nothing here, someone already stole this box."
    end

    registers[pRegisterId] = GetGameTimer() + registerCooldown
    players[cid] = GetGameTimer() + playerCooldown

    return
end)