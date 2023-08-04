RPC.register("getEmailData", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT * FROM character_emails WHERE cid = @cid ORDER BY id DESC", {
        ["cid"] = pCid.param
    }))

    if not data then return {} end

    return data
end)

RPC.register("sendEmail", function(pSource, pFrom, pSubject, pMessage, pTime)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()
    local CitizenId = char.id
--[[     local data = Await(SQL.execute("INSERT INTO character_emails (cid, from, subject, message) VALUES (@cid, @from, @subject, @message)", {
        ["cid"] = CitizenId,
        ["from"] = pFrom.param,
        ["subject"] = pSubject.param,
        ["message"] = pMessage.param
    })) ]]

    local data = Await(SQL.execute("INSERT INTO character_emails (`cid`, `from`, `subject`, `message`, `time`) VALUES (@cid, @from, @subject, @message, @time)",{
        ["cid"] = CitizenId,
        ["from"] = pFrom.param,
        ["subject"] = pSubject.param,
        ["message"] = pMessage.param,
        ["time"] = pTime.param
    }))

    if not data then return false end

    TriggerClientEvent("emailNotify", pSource, pMessage.param)

    return true
end)