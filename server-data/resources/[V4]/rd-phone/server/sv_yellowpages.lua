RPC.register("getYpData", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local data = Await(SQL.execute("SELECT * FROM phone_yp ORDER BY id DESC", {}))

    if not data then return {} end

    local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM phone_yp WHERE cid = @cid", {
        ["cid"] = cid
    }))

    return data, count[1].total or 0
end)

RPC.register("postAd", function(pSource, pMessage)
    --print("postAd", pMessage.param)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()
    local CitizenId = char.id
    local name = char.first_name.." "..char.last_name
    local data = Await(SQL.execute("INSERT INTO phone_yp (cid, phonenr, message, name) VALUES (@cid, @phonenr, @message, @name)", {
        ["cid"] = CitizenId,
        ["phonenr"] = char.phone_number,
        ["message"] = pMessage.param,
        ["name"] = name
    }))

    if not data then return false end

    --TriggerClientEvent("twitterNotify", -1, name, pMessage.param)

    return true
end)

RPC.register("removeYp", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local data = Await(SQL.execute("DELETE FROM phone_yp WHERE cid = @cid", {
        ["cid"] = cid
    }))

    if not data then return false end

    return true
end)