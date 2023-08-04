RegisterNetEvent("rd-thermite:purchase")
AddEventHandler("rd-thermite:purchase", function()
  if exports["rd-inventory"]:hasEnoughOfItem("keya", 1) then
  local finished = exports["rd-taskbar"]:taskBar(3000, "Speaking to the seller")
  if finished == 100 then
      TriggerEvent("server-inventory-open", "12222", "Craft");
  end
  else 
    TriggerEvent("DoLongHudText", "I dont recgonize your Key", 2)
  end
end)

--
AddEventHandler("rd-inventory:itemUsed", function(pItem)
  local info = exports["rd-inventory"]:itemListInfo(pItem)
  info = json.decode(info)
  if not info.object then return end
  local success, businesses = RPC.execute("GetBusinesses")

  if not success then
    return TriggerEvent("DoLongHudText", "Error while fetching businesses", 2)
  end

  local businessOptions = {}
  for _, business in pairs(businesses) do
    businessOptions[#businessOptions+1] = {
      name = business.business_name,
      id = business.business_id
    }
  end

  exports["rd-ui"]:openApplication("textbox", {
      callbackUrl = "rd-business:craft:enteredBusiness",
      key = { object = info.object, item = pItem },
      items = {
        { icon = "id-card", _type = "select", name = "businessCode", label = "Select Business", options = businessOptions },
      },
      show = true,
  })
end)

RegisterUICallback("rd-business:craft:enteredBusiness", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  if data.values.businessCode == "" or data.values.businessCode == nil then return TriggerEvent("DoLongHudText", "You must enter a valid Business.", 2) end
  startPlacing(data.key.object, data.values.businessCode, data.key.item)
end)

function startPlacing(object, businessCode, item)
  local cid = exports["isPed"]:isPed("cid")
  local result = exports["rd-objects"]:PlaceAndSaveObject(
    object, 
    { businessCode = businessCode, item = item, cid = cid }, 
    { groundSnap = true }
  )
  if result then
    TriggerEvent("inventory:removeItem", item, 1)
  end
end

AddEventHandler("rd-craft:pickup", function(p1, p2, p3)
  local wantedCid = p3.meta.metaData.cid

  if tonumber(wantedCid) ~= tonumber(exports["isPed"]:isPed("cid")) then
    return TriggerEvent("DoLongHudText", "You can't pick up this object.", 2)
  end

  local id = p3.meta.id
  local deleted = exports["rd-objects"]:DeleteObject(id)
  if deleted then
  TriggerEvent("player:receiveItem", p3.meta.metaData.item, 1)
  end
end)

RegisterNetEvent('evan-craftbench:open')
AddEventHandler('evan-craftbench:open', function(p1, p2, p3)
  local businessCode = p3.meta.metaData.businessCode
  local employed = RPC.execute("IsEmployedAt", businessCode)
  local hasPerm = RPC.execute("rd-business:hasPermission", businessCode, "craft_access")  
  if not employed or not hasPerm then return end
end)