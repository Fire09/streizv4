RPC.register("rd-character:GetCharacterType",function(pSource)
    local GetCharacterType = {}
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local characterId = user:getCurrentCharacter().id
     exports["rd-db"]:execute("SELECT * FROM characters WHERE cid = @cid", {['cid'] = characterId}, function(result)
        GetCharacterType = result[1].hardcore
    return GetCharacterType
    end)
end)

RPC.register("rd-character:AddHCScore",function(pSource, pValue)

    return
end)

RPC.register("rd-character:RollICU",function(pSource)

    return
end)