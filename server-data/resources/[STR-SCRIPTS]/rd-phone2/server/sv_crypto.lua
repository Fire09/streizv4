RPC.register("purchaseCrypto", function(pSource, pCid, pCryptoId, pAmount, pDate)
    if pAmount.param == nil then
        return false, "Amount can't be empty"
    end

    if tonumber(pAmount.param) < 0 then
        return false, "Negative values not allowed"
    end

    local getCryptoValue = Await(SQL.execute("SELECT value, cryptotag FROM cryptos WHERE cryptoid = @cryptoid",{
        ["cryptoid"] = pCryptoId.param
    }))

    local getBankValue = Await(SQL.execute("SELECT bank FROM characters WHERE id = @id",{
        ["id"] = pCid.param
    }))

    local total = tonumber(pAmount.param) * tonumber(getCryptoValue[1].value)
    local bank = tonumber(getBankValue[1].bank)

    if total > bank then
        return false, "Not enough money in bank" 
    end

    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    user:removeBank(total)
    addCrypto(pCid.param, pAmount.param, pCryptoId.param)

    local transactionId = uuid()

    local char = user:getCurrentCharacter()

    local comment = "Bought " .. tostring(pAmount.param) .. " " .. getCryptoValue[1].cryptotag

    -- insert civ transaction log
    local insert = Await(SQL.execute("INSERT INTO bank_transactions (identifier, sender, target, label, amount, iden, type, date, transaction_id) VALUES (@identifier, @sender, @target, @label, @amount, @iden, @type, @date, @transaction_id)", {
        ["identifier"] = pCid.param,
        ["sender"] = char.first_name .. " " .. char.last_name,
        ["target"] = "San Andreas Crypto Exchange",
        ["label"] = comment,
        ["amount"] = total,
        ["iden"] = "PURCHASE",
        ["type"] = "neg",
        ["date"] = pDate.param,
        ["transaction_id"] = transactionId
    }))

    return true, "success"
end)

RPC.register("exchangeCrypto", function(pSource, pCid, pCryptoId, pReceiver, pAmount)
    --print("exchangeCrypto")
    if pReceiver.param == nil or pReceiver.param == "" then
        return false, "Number can't be empty"
    end
    --print("Number not empty")
    if pAmount.param == nil or pAmount.param == "" then
        return false, "Amount can't be empty"
    end
    --print("Amount not empty")
    local data = Await(SQL.execute("SELECT * FROM user_crypto WHERE cryptocid = @cid AND cryptoid = @cryptoid",{
        ["cid"] = pCid.param,
        ["cryptoid"] = pCryptoId.param
    }))
    --print("data select")
    if tonumber(pAmount.param) > tonumber(data[1].cryptoamount) then
        return false, "Not enough crypto"
    end
    --print("enough crypto")

    -- check if receiver has wallet?
    -- if they dont generate one

    if tonumber(pAmount.param) < 0 then
        return false, "Negative values not allowed"
    end

    --print("not a negative value")

    local receiver = Await(SQL.execute("SELECT * FROM characters WHERE phone_number = @phone_number",{
        ["phone_number"] = pReceiver.param
    }))

    --print("send it")

    local receivercid = receiver[1].id

    takeCrypto(pCid.param, pAmount.param, pCryptoId.param)
    giveCrypto(receivercid, pAmount.param, pCryptoId.param)

    return true
end)

RPC.register("phone:removeCrypto", function(pSource, pCryptoId, pAmount)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local char = user:getCurrentCharacter()

    local data = Await(SQL.execute("SELECT * FROM user_crypto WHERE cryptocid = @cid AND cryptoid = @cryptoid",{
        ["cid"] = char.id,
        ["cryptoid"] = pCryptoId.param
    }))

    if tonumber(pAmount.param) > tonumber(data[1].cryptoamount) then
        return false, "Not enough crypto"
    end

    local update = Await(SQL.execute("UPDATE user_crypto SET cryptoamount = cryptoamount - @cryptoamount WHERE cryptocid = @cryptocid AND cryptoid = @cryptoid", {
        ["cryptoamount"] = tonumber(pAmount.param),
        ["cryptocid"] = char.id,
        ["cryptoid"] = tonumber(pCryptoId.param)
    }))

    return true, "Success"
end)

RPC.register("phone:getCryptos", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM cryptos", {}))
    return data
end)

RPC.register("phone:getCryptoBalance", function(pSource, pCid, pCryptoId)
    local data = Await(SQL.execute("SELECT * FROM user_crypto WHERE cryptocid = @cid AND cryptoid = @cryptoid",{
        ["cid"] = pCid.param,
        ["cryptoid"] = pCryptoId.param
    }))

    return data[1].cryptoamount
end)

RPC.register("phone:generateWallet", function(pSource, pCid, pCryptoId)
    local insert = Await(SQL.execute("INSERT INTO user_crypto (cryptoid, cryptoamount, cryptocid) VALUES (@cryptoid, @cryptoamount, @cryptocid)",{
        ["cryptoid"] = pCryptoId.param,
        ["cryptoamount"] = 0,
        ["cryptocid"] = pCid.param
    }))

    return true
end)

function addCrypto(cid, amount, cryptoid)
    local add = Await(SQL.execute("UPDATE user_crypto SET cryptoamount = cryptoamount + @cryptoamount WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
        ["cryptoamount"] = amount,
        ["cryptoid"] = cryptoid,
        ["cryptocid"] = cid
    }))
end

function takeCrypto(cid, amount, cryptoid)
    local take = Await(SQL.execute("UPDATE user_crypto SET cryptoamount = cryptoamount - @cryptoamount WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
        ["cryptoamount"] = amount,
        ["cryptoid"] = cryptoid,
        ["cryptocid"] = cid
    }))
end

function giveCrypto(cid, amount, cryptoid)
    local give = Await(SQL.execute("UPDATE user_crypto SET cryptoamount = cryptoamount + @cryptoamount WHERE cryptoid = @cryptoid AND cryptocid = @cryptocid", {
        ["cryptoamount"] = amount,
        ["cryptoid"] = cryptoid,
        ["cryptocid"] = cid
    }))
end