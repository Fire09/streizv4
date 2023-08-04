local StorageItems = {
  ["dodopackagesmall"] = {
    label = "Dodo Small Packaging",
    slots = 5,
    weight = 100,
    price = 200,
  },

  ["dodopackagemedium"] = {
    label = "Dodo Medium Packaging",
    slots = 30,
    weight = 425,
    price = 500
  },

  ["dodopackagelarge"] = {
    label = "Dodo Large Packaging",
    slots = 60,
    weight = 700,
    price = 825
  },

}

AddEventHandler("rd-business:getDodoLogisticsContainer", function(pItemId)
  local genId = tostring(math.random(10000, 99999999))
  local invId = "container-" .. genId .. "-dodo container"
  local metaData = json.encode({
    inventoryId = invId,
    _hideKeys = {"inventoryId", "slots", "weight"},
  })
  TriggerEvent("player:receiveItem", pItemId, 1, false, {}, metaData)
end)

AddEventHandler("rd-inventory:itemUsed", function(pItem, pInfo)
  if pItem == "dodopackagesmall" or pItem == "dodopackagemedium" or pItem == "dodopackagelarge" then
    data = json.decode(pInfo)
    TriggerEvent("InteractSound_CL:PlayOnOne", "unwrap", 0.1)
    TriggerEvent("inventory-open-container", data.inventoryId, StorageItems[pItem].slots, StorageItems[pItem].weight)
  end
end)

AddEventHandler("rd-business:dodoLogisticsDisplayPackaging", function()
  local MenuData = {}

  for k, v in pairs(StorageItems) do
    MenuData[#MenuData+1] = {
      title = v.label,
      description = "Capacity: " .. v.weight .. ", Price: $" .. v.price,
      action = "rd-business:dodoLogisticsPurchaseItem",
      key = { item = k },
    }
  end

  exports["rd-ui"]:showContextMenu(MenuData)
end)

RegisterUICallback("rd-business:dodoLogisticsPurchaseItem", function(pData, cb)
  local itemInfo = StorageItems[pData.key.item]

  local purchaseSuccess = RPC.execute("rd-business:dodoLogisticsPurchasePackage", itemInfo.price)
  if not purchaseSuccess then 
    TriggerEvent("DoLongHudText", "You don't have enough money!", 2)
  elseif purchaseSuccess then
    TriggerEvent("DoLongHudText", "Successfully purchased item!")
    TriggerEvent("rd-business:getDodoLogisticsContainer", pData.key.item)
  end


  cb({ data = {}, meta = { ok = true, message = "done" } })
end)
