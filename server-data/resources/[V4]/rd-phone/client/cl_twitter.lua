RegisterNUICallback('getTwitterData', function(data, cb)
  local data = RPC.execute("getTwitterData")
  cb(data)
end)

RegisterNUICallback('postTwitter', function(data, cb)
    local result = RPC.execute("postTweet", data.message)
    if result then
    local data = RPC.execute("getTwitterData")
    cb({
      success = true,
      data = data,
      message = ""
    })
    end
end)

RegisterNetEvent("twitterNotify")
AddEventHandler("twitterNotify", function(name, message, src)
  local serverid = GetPlayerServerId(PlayerId())
  if tonumber(serverid) == tonumber(src) then return end
  SendReactMessage('setNotify', {
    serverid = serverid,
    app = "phone",
    data = {
      action = "notification",
      target_app = "twitter",
      title = "@" .. name,
      body = message,
      show_even_if_app_active = false
    }
  })

  local data = RPC.execute("getTwitterData")
  SendReactMessage('updateTwitter', data)
end)