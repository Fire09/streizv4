function isGrapeBarrel(p2)
  return p2 and p2.meta and p2.meta.data and p2.meta.data.metadata and p2.meta.data.metadata.type == "vinewood_grape_barrel"
end

AddEventHandler("rd-inventory:itemUsed", function(pItem, pData)
  if pItem ~= "vineyardbarrel" then return end
  local meta = json.decode(pData)
  if not meta then return end
  if not meta.id then return end
  local cid = exports["isPed"]:isPed("cid")
  local result = exports['rd-objects']:PlaceAndSaveObject(
    "prop_wooden_barrel",
    {
      cid = cid,
      id = meta.id,
      type = "vinewood_grape_barrel",
      name = meta.name or "Unnamed",
      sealed = meta.sealed or false,
      created_at = meta.created_at,
      grapes = (meta.grapes or {}),
      _hideKeys = { "cid", "id", "type", "sealed", "created_at", "grapes" },
    },
    { groundSnap = true, allowHousePlacement = true },
    function(pCoords, pMaterial, pEntity)
      return true
    end
  )
  if not result then
    print('no obj result', result)
    return
  end
  print('obj result', result, 'trigger remove', "vineyardbarrel", 1, "id", meta.id)
  TriggerEvent("inventory:removeItemByMetaKV", "vineyardbarrel", 1, "id", meta.id)
end)

AddEventHandler("rd-vineyard:pickupBarrel", function(p1, p2, p3)
  if not isGrapeBarrel(p3) then return end
  local characterId = exports["isPed"]:isPed("cid")
  local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "hero_wine"} })
  if not jobAccess then
    TriggerEvent("DoLongHudText", "You can't do that.", 2)
    return
  end
  local data = p3.meta.data.metadata
  exports['rd-objects']:DeleteObject(p3.meta.id)
  TriggerEvent("player:receiveItem", "vineyardbarrel", 1, false, data, data)
end)


RegisterUICallback("rd-vineyard:changeBarrelName", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  RPC.execute("rd-vineyard:changeBarrelName", data.key, data.values.name)
end)

RegisterUICallback("rd-vineyard:addGrapesToBarrel", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  local newData = data.key.newData
  local objectId = data.key.objectId
  local items = exports["rd-inventory"]:getItemsOfType("vineyardgrapes", false, true)
  if #items == 0 then return end
  for _, item in pairs(items) do
    local info = json.decode(item.information)
    if (info.status ~= "dead") and (info.class == data.values.class) and (item.amount >= tonumber(data.values.amount)) and (info.type == data.values.type) then
      if not newData.grapes[info.class] then
        newData.grapes[info.class] = {}
      end
      if not newData.grapes[info.class][info.type] then
        newData.grapes[info.class][info.type] = 0
      end
      newData.grapes[info.class][info.type] = newData.grapes[info.class][info.type] + tonumber(data.values.amount)
      TriggerEvent("inventory:removeItemBySlot", "vineyardgrapes", tonumber(data.values.amount), item.slot)
      Wait(250)
    end
  end
  RPC.execute("rd-vineyard:changeBarrelData", objectId, newData)
end)

local function getTimestamp(data)
  local remaining = math.floor((exports["rd-misc-code"]:getCurrentTime() - data.created_at) / 1000)
  local years = math.floor(remaining / (86400 * 30 * 12))
  remaining = remaining % (86400 * 30 * 12)
  local months = math.floor(remaining / (86400 * 30))
  remaining = remaining % (86400 * 30)
  local days = math.floor(remaining / 86400)
  if years > 0 then
    return tostring(years) .. "y " .. tostring(months) .. "m " .. tostring(days) .. "d"
  end
  if months > 0 then
    return tostring(months) .. "m " .. tostring(days) .. "d"
  end
  if days > 0 then
    return tostring(days) .. "d"
  end
  remaining = remaining % 86400
  local hours = math.floor(remaining / 3600)
  if hours > 0 then
    return tostring(hours) .. "h"
  end
  remaining = remaining % 3600
  local minutes = math.floor(remaining / 60)
  if minutes > 0 then
    return tostring(minutes) .. "m"
  end
  remaining = remaining % 60
  local seconds = remaining
  return tostring(seconds) .. "s"
end

AddEventHandler("rd-vineyard:barrelAction", function(p1, p2, p3)
  if not isGrapeBarrel(p3) then return end
  local data = p3.meta.data.metadata
  local objectId = p3.meta.id
  if p1.action == "view_details" then
    local pcts = {}
    local total = 0
    local detailsString =
      "\nName: " .. data.name ..
      "\nAge: " .. (data.sealed and getTimestamp(data) or "Not Sealed") ..
      "\nGrapes: 0"
    if data.grapes then
      for cls, types in pairs(data.grapes) do
        for type, cnt in pairs(types) do
          total = total + cnt
        end
      end
      detailsString = detailsString:sub(1, -2)
      detailsString = detailsString .. "~" .. tostring(math.floor(((total + 1) / 100)) * 100)
      for cls, types in pairs(data.grapes) do
        detailsString = detailsString .. " \n " .. ((cls == "red") and "Red" or "White") .. ":"
        for type, cnt in pairs(types) do
          detailsString = detailsString .. "\n - " .. type .. ": " .. math.floor(cnt / total * 100) .. "%"
        end
        -- detailsString = detailsString:sub(1, -4)
        -- detailsString = detailsString .. ")"
      end
    end
    TriggerEvent("chatMessage", "----- Hero Wine -----", 2, detailsString, "feed", false, { i18n = {
      "Name",
      "Age",
      "Red",
      "White",
      "sweet",
      "sour",
      "extra-sweet",
    }})
    -- TriggerEvent("DoLongHudText", detailsString, 1, 12000, { i18n = {
    --   "Name",
    --   "Age",
    --   "Red",
    --   "White",
    --   "sweet",
    --   "sour",
    --   "extra-sweet",
    -- }})
    return
  end
  if p1.action == "change_name" then
    exports["rd-ui"]:openApplication("textbox", {
      callbackUrl = "rd-vineyard:changeBarrelName",
      key = objectId,
      items = {
        { label = "Name", name = "name" },
      },
      show = true,
    })
    return
  end
  if p1.action == "seal" then
    if not data.grapes then
      TriggerEvent("DoLongHudText", "You need at least 1200 grapes to seal!", 2)
      return
    end
    local total = 0
    for cls, types in pairs(data.grapes) do
      for type, cnt in pairs(types) do
        total = total + cnt
      end
    end
    if total < 12 then
      TriggerEvent("DoLongHudText", "You need at least 1200 grapes to seal!", 2)
      return
    end
    local newData = { sealed = true, created_at = exports["rd-misc-code"]:getCurrentTime() }
    RPC.execute("rd-vineyard:changeBarrelData", objectId, newData)
    return
  end
  if p1.action == "open_heroine_container" then
    local heroineInventoryId = data.heroine_inventory_id
    if not heroineInventoryId then
      heroineInventoryId = math.random(100000000, 999999999)
      local newData = { heroine_inventory_id = heroineInventoryId }
      RPC.execute("rd-vineyard:changeBarrelData", objectId, newData)
    end
    TriggerEvent("inventory-open-container", "hw-barrel-" .. tostring(heroineInventoryId), 1, 10)
    return
  end
  if p1.action == "add_grapes" then
    local newData = { grapes = (data.grapes or {}) }
    local items = exports["rd-inventory"]:getItemsOfType("vineyardgrapes", false, true)
    if #items == 0 then return end
    exports["rd-ui"]:openApplication("textbox", {
      callbackUrl = "rd-vineyard:addGrapesToBarrel",
      key = { objectId = objectId, newData = newData },
      items = {
        { label = "Amount", name = "amount" },
        {
          label = "Class",
          name = "class", 
          _type = "select",
          options = {
            { name = "Green", id = "green" },
            { name = "Red", id = "red" },
          },
        },
        {
          label = "Type",
          name = "type", 
          _type = "select",
          options = {
            { name = "Sweet", id = "sweet" },
            { name = "Extra Sweet", id = "extra-sweet" },
            { name = "Dry", id = "dry" },
          },
        },
      },
      show = true,
    })
    return
  end
  if p1.action == "pour_bottles" then
    local hasEnough = exports["rd-inventory"]:hasEnoughOfItem("vineyardwinebottleempty", 1, false, true)
    if not hasEnough then
      TriggerEvent("DoLongHudText", "You need empty wine bottles!", 2)
      return
    end
    TriggerEvent("doAnim","cokecut")
    local finished = exports["rd-taskbar"]:taskBar(10000, "Bottling Wine")
    ClearPedTasks(PlayerPedId())
    if finished ~= 100 then return end
    exports['rd-objects']:DeleteObject(objectId)
    TriggerEvent("inventory:removeItem", "vineyardwinebottleempty", 1)
    Wait(500)
    for i = 1, 6 do
      local mData = {
        aged = getTimestamp(data),
        id = math.random(1000000000, 9999999999),
        _hideKeys = { "id" },
      }
      TriggerEvent("player:receiveItem", "vineyardwinebottle", 1, false, mData, mData)
      Wait(250)
    end
    return
  end
end)

local clipsetChanged = false
AddEventHandler("rd-inventory:attachmentsToggle", function(pEnabled, pId)
  if pEnabled and pId == "vineyardbarrel" then
    if clipsetChanged then return end
    clipsetChanged = true
    TriggerEvent("AnimSet:Set:temp", true, "move_m@hiking")
    return
  end
  if clipsetChanged and (not pEnabled) then
    clipsetChanged = false
    TriggerEvent("AnimSet:Set:temp", false, "move_m@hiking")
    return
  end
end)

Citizen.CreateThread(function()
  exports["rd-interact"]:AddPeekEntryByModel({ `prop_wooden_barrel` }, {
    {
      id = "peek_prop_vineyard_barrel",
      event = "rd-vineyard:pickupBarrel",
      icon = "shopping-basket",
      label = "Pick Up",
    },
    {
      id = "peek_prop_vineyard_barrel_details",
      event = "rd-vineyard:barrelAction",
      icon = "info-circle",
      label = "View Label",
      parameters = { action = "view_details" },
    },
    {
      id = "peek_prop_vineyard_barrel_name",
      event = "rd-vineyard:barrelAction",
      icon = "pencil-alt",
      label = "Change Name",
      parameters = { action = "change_name" },
    },
  }, {
    distance = { radius = 2.0 },
    isEnabled = function(p1, p2, p3)
      return isGrapeBarrel(p2)
    end,
  })
  exports["rd-interact"]:AddPeekEntryByModel({ `prop_wooden_barrel` }, {
    {
      id = "peek_prop_vineyard_barrel_add",
      event = "rd-vineyard:barrelAction",
      icon = "plus",
      label = "Add Grapes",
      parameters = { action = "add_grapes" },
    },
    {
      id = "peek_prop_vineyard_barrel_seal",
      event = "rd-vineyard:barrelAction",
      icon = "cog",
      label = "Seal (Permanently)",
      parameters = { action = "seal" },
    },
  }, {
    distance = { radius = 2.0 },
    isEnabled = function(p1, p2, p3)
      local data = p2.meta.data.metadata
      return isGrapeBarrel(p2) and not data.sealed
    end,
  })

  exports["rd-interact"]:AddPeekEntryByModel({ `prop_wooden_barrel` }, {
    {
      id = "peek_prop_vineyard_barrel_pour",
      event = "rd-vineyard:barrelAction",
      icon = "plus-circle",
      label = "Pour Bottles",
      parameters = { action = "pour_bottles" },
    },
  }, {
    distance = { radius = 2.0 },
    isEnabled = function(p1, p2, p3)
      local data = p2.meta.data.metadata
      return isGrapeBarrel(p2) and data.sealed
    end,
  })

  exports["rd-interact"]:AddPeekEntryByModel({ `prop_wooden_barrel` }, {
    {
      id = "peek_prop_vineyard_barrel_open_h",
      event = "rd-vineyard:barrelAction",
      icon = "lock-open",
      label = "Open Barrel Head (Break Seal)",
      parameters = { action = "open_heroine_container" },
    },
  }, {
    distance = { radius = 2.0 },
    isEnabled = function(p1, p2, p3)
      local data = p2.meta.data.metadata
      if not isGrapeBarrel(p2) then return false end
      local hasEnough = exports["rd-inventory"]:hasEnoughOfItem("vineyardbarrelheadopener", 1, false, true)
      return hasEnough
    end,
  })
end)
