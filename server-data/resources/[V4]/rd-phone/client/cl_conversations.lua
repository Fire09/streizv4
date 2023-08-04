RegisterNUICallback('getMessageData', function(data, cb)
  local characterId = exports["isPed"]:isPed("cid")
  local data, mynumber = RPC.execute("getMessageData", characterId)
  local isDisplayName = false
  lstMsgs = {}
  if (#data ~= 0) then
    for k,v in pairs(data) do
      if v ~= nil then
        local msgDisplayName = ""
        if v.receiver == mynumber then
          msgDisplayName, isDisplayName = getContactName(v.sender)
        else
          msgDisplayName, isDisplayName = getContactName(v.receiver)
        end
        local message = {
          id = tonumber(v.id),
          msgDisplayName = msgDisplayName,
          sender = tonumber(v.sender),
          receiver = tonumber(v.receiver),
          date = v.date,
          message = v.message,
          isDisplayName = isDisplayName
        }
        lstMsgs[#lstMsgs+1]= message
      end
    end
  end

  cb({data = lstMsgs, mynumber = mynumber})
end)

RegisterNUICallback('getChatData', function(data, cb)
  local displayName, isDisplayName = getContactName(data.number)
  local cid = exports["isPed"]:isPed("cid")
  local sender = RPC.execute("getMyPhoneNumber", cid)
  local data = RPC.execute("getChatData", sender, data.number)
  cb({
    messages = data,
    displayName = displayName,
    clientNumber = sender,
    isDisplayName = isDisplayName
  })
end)

RegisterNUICallback('sendMessage', function(data, cb)
  local displayName, isDisplayName = getContactName(data.number)
  local cid = exports["isPed"]:isPed("cid")
  local sender = RPC.execute("getMyPhoneNumber", cid)
  local result = RPC.execute("sendMessage", sender, data.number, data.message)
  if result then
  local data = RPC.execute("getChatData", sender, data.number)

  cb({
    messages = data,
    displayName = displayName,
    clientNumber = sender,
    isDisplayName = isDisplayName,
    receiverNumber = data.number
  })

  local characterId = exports["isPed"]:isPed("cid")
  local msgdata, mynumber = RPC.execute("getMessageData", characterId)
  local isDisplayName = false
  lstMsgs = {}
  if (#msgdata ~= 0) then
    for k,v in pairs(msgdata) do
      if v ~= nil then
        local msgDisplayName = ""
        if v.receiver == mynumber then
          msgDisplayName, isDisplayName = getContactName(v.sender)
        else
          msgDisplayName, isDisplayName = getContactName(v.receiver)
        end
        local message = {
          id = tonumber(v.id),
          msgDisplayName = msgDisplayName,
          sender = tonumber(v.sender),
          receiver = tonumber(v.receiver),
          date = v.date,
          message = v.message,
          isDisplayName = isDisplayName
        }
        lstMsgs[#lstMsgs+1]= message
      end
    end
  end

  SendReactMessage('updateMessages', {
    data = lstMsgs,
    mynumber = mynumber
  })

  end
end)

RegisterNetEvent("messageNotify")
AddEventHandler("messageNotify", function(cid, number, message)
  local mycid = exports["isPed"]:isPed("cid")
  if tonumber(mycid) == tonumber(cid) then
    -- is receiver
    local serverid = GetPlayerServerId(PlayerId())
    local contactName = getContactName(number)
    SendReactMessage('setNotify', {
      serverid = serverid,
      app = "phone",
      data = {
        action = "notification",
        target_app = "messages",
        title = contactName,
        body = message
      }
    })

    local displayName, isDisplayName = getContactName(number)
    local cid = exports["isPed"]:isPed("cid")
    local receiver = RPC.execute("getMyPhoneNumber", cid)
    local data = RPC.execute("getChatData", number, receiver)
    SendReactMessage('updateChatMessages', {
      sender = number,
      messages = data,
      displayName = displayName,
      clientNumber = receiver,
      isDisplayName = isDisplayName
    })
    

    local characterId = exports["isPed"]:isPed("cid")
    local msgdata, mynumber = RPC.execute("getMessageData", characterId)
    local isDisplayName = false
    lstMsgs = {}
    if (#msgdata ~= 0) then
      for k,v in pairs(msgdata) do
        if v ~= nil then
          local msgDisplayName = ""
          if v.receiver == mynumber then
            msgDisplayName, isDisplayName = getContactName(v.sender)
          else
            msgDisplayName, isDisplayName = getContactName(v.receiver)
          end
          local message = {
            id = tonumber(v.id),
            msgDisplayName = msgDisplayName,
            sender = tonumber(v.sender),
            receiver = tonumber(v.receiver),
            date = v.date,
            message = v.message,
            isDisplayName = isDisplayName
          }
          lstMsgs[#lstMsgs+1]= message
        end
      end
    end
  
    SendReactMessage('updateMessages', {
      data = lstMsgs,
      mynumber = mynumber
    })
  end
end)