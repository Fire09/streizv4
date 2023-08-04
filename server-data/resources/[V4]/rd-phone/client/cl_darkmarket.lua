RegisterNUICallback("getDarkmarketData", function(data, cb)
  local products = RPC.execute("getDarkMarketProducts", heistzone)
  cb(products)
end)

RegisterNUICallback("purchaseProduct", function(data, cb)
  if data.id ~= nil then
    local cid = exports["isPed"]:isPed("cid")
    local result, message = RPC.execute("purchaseProduct", cid, data.id)
    if not result then 
      cb({
        success = false,
        message = message
      })
      exports['rd-phone']:SendAlert('error', message, 3000)
      return
    end
    cb({
      success = true,
      message = ""
    })
    TriggerEvent("rd-heists:pickup:blip")
    local pTime = GetCloudTimeAsInt()
    RPC.execute("sendEmail", "Dark Market", "#A-1001", "You know where to go.", pTime)
  end
end)