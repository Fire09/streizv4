local WebHook = "https://discord.com/api/webhooks/1080980627102384158/OoCJ40fFpOwDe_ojNSAn_gdaEt0Ss1j7ECdPprecGZrG12dNOQGEAeLMzRd1U3FdXoDu"

--QBCore.Functions.CreateUseableItem("photo", function(source, item)
 --   local src = source
 --   if item.info and item.info.photourl then
 --       TriggerClientEvent("rd-camera:client:use-photo", src, item.info.photourl)
 --  end
--end)

RegisterNetEvent("rd-camera:server:add-photo-item", function(url)
    print("TEST", url)
    local src = source
    local ply = exports["rd-base"]:getModule("Player"):GetUser(src)
    if ply then
        local info = {
            photourl = url
        }
       -- ply.Functions.AddItem("photo", 1, nil, info)
        TriggerClientEvent("player:receiveItem",src,info,1)
    end
end)

RPC.register("rd-camera:server:webhook",function(source,cb)
  --  local results = false
	if WebHook ~= "" then
		cb(WebHook)
     --   results = true
	else
		cb(nil)
      --  results = false
	end
  --  print(results)
    return true
end)