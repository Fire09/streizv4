RPC.register("getCharacterContacts", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT * FROM phone_contacts WHERE citizenid = @citizenid", {
        ["citizenid"] = pCid.param
    }))

    if not data then return false, "" end

    return data
end)

RPC.register("addPhoneContact", function(pSource, pCid, pNumber, pName)
    local data = Await(SQL.execute("INSERT INTO phone_contacts (citizenid, name, number) VALUES (@citizenid, @name, @number)", {
        ["citizenid"] = pCid.param,
        ["name"] = pName.param,
        ["number"] = pNumber.param
    }))

    if not data then return false, "" end

    return data
end)

RPC.register("removePhoneContact", function(pSource, pId)
    local data = Await(SQL.execute("DELETE FROM phone_contacts WHERE id = @id", {
        ["id"] = pId.param
    }))

    if not data then return false, "" end

    return true
end)