RegisterNUICallback('getYpData', function(data, cb)
  local data, hasAd = RPC.execute("getYpData")
  cb({ads = data, hasAd = hasAd})
end)

RegisterNUICallback('postAd', function(data, cb)
  local result = RPC.execute("postAd", data.message)
  if result then
  local data, hasAd = RPC.execute("getYpData")
  cb({
    success = true,
    data = data,
    hasAd = hasAd,
    message = ""
  })
  end
end)

RegisterNUICallback('removeYp', function(data, cb)
  local result = RPC.execute("removeYp")
  if result then
    local data, hasAd = RPC.execute("getYpData")
    cb({
      success = true,
      data = data,
      hasAd = hasAd,
      message = ""
    })
    end
end)