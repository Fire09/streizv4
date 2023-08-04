RPC.register("getMessageData", function(pSource, pCid)
    local data = Await(SQL.execute("SELECT phone_number FROM characters WHERE id = @id", {
        ["id"] = pCid.param
    }))

    if not data then return {} end

    local mynumber = data[1].phone_number

    local result = Await(SQL.execute("SELECT * FROM user_messages WHERE receiver = @mynumber OR sender = @mynumber ORDER BY id DESC", {
        ["mynumber"] = mynumber
    }))

    local numbers ={}
    local convos = {}
    local valid
    
    for k, v in pairs(result) do
        valid = true
        if v.sender == mynumber then
            for i=1, #numbers, 1 do
                if v.receiver == numbers[i] then
                    valid = false
                end
            end
            if valid then
                table.insert(numbers, v.receiver)
            end
        elseif v.receiver == mynumber then
            for i=1, #numbers, 1 do
                if v.sender == numbers[i] then
                    valid = false
                end
            end
            if valid then
                table.insert(numbers, v.sender)
            end
        end
    end
    
    for i, j in pairs(numbers) do
        for g, f in pairs(result) do
            if j == f.sender or j == f.receiver then
                table.insert(convos, {
                    id = f.id,
                    sender = f.sender,
                    receiver = f.receiver,
                    message = f.message,
                    date = f.date
                })
                break
            end
        end
    end

    return convos, mynumber
end)

RPC.register("getChatData", function(pSource, pSender, pNumber)
    local result = Await(SQL.execute("SELECT * FROM user_messages WHERE (sender = @sender AND receiver = @receiver) OR (sender = @receiver AND receiver = @sender) ORDER BY id DESC", {
        ["sender"] = pSender.param,
        ["receiver"] = pNumber.param
    }))
    if result ~= nil then
        return result
    end
end)

RPC.register("sendMessage", function(pSource, pSender, pNumber, pMessage)
    local result = Await(SQL.execute("INSERT INTO user_messages (sender, receiver, message, isRead, time, unix) VALUES (@sender, @receiver, @message, @isRead, @time, @unix)", {
        ["sender"] = pSender.param,
        ["receiver"] = pNumber.param,
        ["message"] = pMessage.param,
        ["isRead"] = 0,
        ["time"] = os.time(),
        ["unix"] = os.time()
    }))
    
    if not result then return false end

    local data = Await(SQL.execute("SELECT id FROM characters WHERE phone_number = @phone_number", {
        ["phone_number"] = pNumber.param
    }))
    --print("try get data")

    if not data then return false end
    --print("get data", data[1].id)

    TriggerClientEvent("messageNotify", -1, data[1].id, pSender.param, pMessage.param)

    return true

    -- handle notify here, and also update chat for other user if online (get cid from the phone nr
    --  and then do a search see if cid matches and then upd? idk look into it)
end)