RPC.register("getTwitterData", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM phone_tweets ORDER BY id DESC", {}))

    if not data then return {} end

    return data
end)

RPC.register("postTweet", function(pSource, pMessage)
    --print("postTweet", pMessage.param)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    --print("get user")
    local char = user:getCurrentCharacter()
    --print("get char")
    local CitizenId = char.id
    --print(CitizenId)
    local name = char.first_name.."_"..char.last_name
    local data = Await(SQL.execute("INSERT INTO phone_tweets (citizenid, sender, message, date) VALUES (@citizenid, @sender, @message, @date)", {
        ["citizenid"] = CitizenId,
        ["sender"] = name,
        ["message"] = pMessage.param,
        ["date"] = os.time()
    }))

    if not data then return false end

    --print("SQL")
    TriggerClientEvent("twitterNotify", -1, name, pMessage.param, pSource)

    return true
end)