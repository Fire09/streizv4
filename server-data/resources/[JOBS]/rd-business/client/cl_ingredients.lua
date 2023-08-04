local NPC_DATA = {
  { name = 'Factory Worker', coords = vector4(526.0, -1653.72, 29.32, 128.44), id = 'leaven', model = 's_f_y_factory_01', sprite = 569 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

leavenReserveStock = false
leavenStock = false
local leavenAvailableStock = 400
local leavenAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA) do
    local data = {
      id = 'npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'rd-business:ingredients:open' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('rd-business:ingredients:open', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Leaven Producer',
       description = 'Leaven',
       icon = 'industry',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. leavenAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = leavenStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Leaven x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectLeaven',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. leavenAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = leavenReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchaseLeaven',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("leavenAvailableStockS")
AddEventHandler("leavenAvailableStockS", function(raggsyy, ragzi)
  leavenAvailableStock = ragzi
end)

RegisterNetEvent("leavenAvailableStockSSpare")
AddEventHandler("leavenAvailableStockSSpare", function(raggsyy, ragzi)
  leavenAvailableStockSpare = ragzi
  print(leavenAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectLeaven', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("leavenAvailableStock", leavenAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectLeaven")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    leavenStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchaseLeaven', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("leavenAvailableStockSpare", leavenAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchaseLeaven")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    leavenReserveStock = true
  end
end)

local NPC_DATA_CHEF = {
  { name = 'Chef', coords = vector4(-1455.73, -169.91, 48.83, 98.5), id = 'season', model = 's_m_y_chef_01', sprite = 568 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

chefReserveStock = false
chefStock = false
local chefAvailableStock = 400
local chefAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_CHEF) do
    local data = {
      id = 'chef_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'chef_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'chef_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:chef' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:chef', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_CHEF) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Chef Producer',
       description = 'Chef',
       icon = 'chess-king',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. chefAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = chefStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Chef x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectchef',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. chefAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = chefReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasechef',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("chefAvailableStockS")
AddEventHandler("chefAvailableStockS", function(raggsyy, ragzi)
  chefAvailableStock = ragzi
end)

RegisterNetEvent("chefAvailableStockSSpare")
AddEventHandler("chefAvailableStockSSpare", function(raggsyy, ragzi)
  chefAvailableStockSpare = ragzi
  print(chefAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectchef', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("chefAvailableStock", chefAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectchef")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    chefStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasechef', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("chefAvailableStockSpare", chefAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasechef")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    chefReserveStock = true
  end
end)

local NPC_DATA_DAIRY = {
  { name = 'Dairy Farmer', coords = vector4(1195.84, 1819.34, 78.93, 98.78), id = 'milk', model = 's_m_y_winclean_01', sprite = 479 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

dairyReserveStock = false
dairyStock = false
local dairyAvailableStock = 400
local dairyAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_DAIRY) do
    local data = {
      id = 'dairy_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'dairy_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'dairy_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:dairydairy' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:dairydairy', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_DAIRY) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Dairy Producer',
       description = 'Dairy',
       icon = 'tractor',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. dairyAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = dairyStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Dairy x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectdairy',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. dairyAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = dairyReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasedairy',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("dairyAvailableStockS")
AddEventHandler("dairyAvailableStockS", function(raggsyy, ragzi)
  dairyAvailableStock = ragzi
end)

RegisterNetEvent("dairyAvailableStockSSpare")
AddEventHandler("dairyAvailableStockSSpare", function(raggsyy, ragzi)
  dairyAvailableStockSpare = ragzi
  print(dairyAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectdairy', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("dairyAvailableStock", dairyAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectdairy")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    dairyStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasedairy', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("dairyAvailableStockSpare", dairyAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasedairy")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    dairyReserveStock = true
  end
end)

local NPC_DATA_DOCK_DOCK = {
  { name = 'Dock Worker', coords = vector4(797.59, -2988.53, 6.03, 92.98), id = 'docks', model = 's_m_m_trucker_01', sprite = 477 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

docksReserveStock = false
docksStock = false
local docksAvailableStock = 400
local docksAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_DOCK_DOCK) do
    local data = {
      id = 'dock_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'dock_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'dock_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:dockDock' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:dockDock', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_DOCK_DOCK) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Docks Producer',
       description = 'Docks',
       icon = 'anchor',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. docksAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = docksStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Docks x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectdocks',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. docksAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = docksReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasedocks',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("docksAvailableStockS")
AddEventHandler("docksAvailableStockS", function(raggsyy, ragzi)
  docksAvailableStock = ragzi
end)

RegisterNetEvent("docksAvailableStockSSpare")
AddEventHandler("docksAvailableStockSSpare", function(raggsyy, ragzi)
  docksAvailableStockSpare = ragzi
  print(docksAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectdocks', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("docksAvailableStock", docksAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectdocks")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    docksStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasedocks', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("docksAvailableStockSpare", docksAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasedocks")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    docksReserveStock = true
  end
end)

local NPC_DATA_MEAT = {
  { name = 'Meat Processor', coords = vector4(961.81, -2189.56, 30.51, 73.62), id = 'meat', model = 's_m_y_factory_01', sprite = 154 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

meatReserveStock = false
meatStock = false
local meatAvailableStock = 400
local meatAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_MEAT) do
    local data = {
      id = 'meat_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'meat_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'meat_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:meat' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:meat', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_MEAT) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Meat Producer',
       description = 'Meat',
       icon = 'drumstick-bite',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. meatAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = meatStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Meat x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectmeat',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. meatAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = meatReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasemeat',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("meatAvailableStockS")
AddEventHandler("meatAvailableStockS", function(raggsyy, ragzi)
  meatAvailableStock = ragzi
end)

RegisterNetEvent("meatAvailableStockSSpare")
AddEventHandler("meatAvailableStockSSpare", function(raggsyy, ragzi)
  meatAvailableStockSpare = ragzi
  print(meatAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectmeat', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("meatAvailableStock", meatAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectmeat")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    meatStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasemeat', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("meatAvailableStockSpare", meatAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasemeat")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    meatReserveStock = true
  end
end)

local NPC_DATA_VEG = {
  { name = 'Vegetable Farmer', coords = vector4(1710.02, 4728.64, 42.15, 105.76), id = 'vegetable', model = 's_f_y_migrant_01', sprite = 568 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

vegetableReserveStock = false
vegetableStock = false
local vegetableAvailableStock = 400
local vegetableAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_VEG) do
    local data = {
      id = 'vegetab_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'vegetab_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'vegetab_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:Veg' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:Veg', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_VEG) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Vegetable Producer',
       description = 'Vegetable',
       icon = 'carrot',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. vegetableAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = vegetableStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Vegetable x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectvegetable',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. vegetableAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = vegetableReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasevegetable',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("vegetableAvailableStockS")
AddEventHandler("vegetableAvailableStockS", function(raggsyy, ragzi)
  vegetableAvailableStock = ragzi
end)

RegisterNetEvent("vegetableAvailableStockSSpare")
AddEventHandler("vegetableAvailableStockSSpare", function(raggsyy, ragzi)
  vegetableAvailableStockSpare = ragzi
  print(vegetableAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectvegetable', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("vegetableAvailableStock", vegetableAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectvegetable")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    vegetableStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasevegetable', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("vegetableAvailableStockSpare", vegetableAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasevegetable")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    vegetableReserveStock = true
  end
end)

local NPC_DATA_GRAIN = {
  { name = 'Grain Farmer', coords = vector4(2016.6, 4987.49, 42.1, 199.57), id = 'grain', model = 'a_m_m_farmer_01', sprite = 557 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

grainReserveStock = false
grainStock = false
local grainAvailableStock = 400
local grainAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_GRAIN) do
    local data = {
      id = 'grain_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'grain_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'grain_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:grain' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:grain', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_GRAIN) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Grain Producer',
       description = 'Grain',
       icon = 'egg',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. grainAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = grainStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Grain x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectgrain',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. grainAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = grainReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasegrain',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("grainAvailableStockS")
AddEventHandler("grainAvailableStockS", function(raggsyy, ragzi)
  grainAvailableStock = ragzi
end)

RegisterNetEvent("grainAvailableStockSSpare")
AddEventHandler("grainAvailableStockSSpare", function(raggsyy, ragzi)
  grainAvailableStockSpare = ragzi
  print(grainAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectgrain', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("grainAvailableStock", grainAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectgrain")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    grainStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasegrain', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("grainAvailableStockSpare", grainAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasegrain")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    grainReserveStock = true
  end
end)

local NPC_DATA_FISH = {
  { name = 'Fish Extracts', coords = vector4(-1810.62, -1207.84, 14.31, 102.21), id = 'oil', model = 's_m_y_uscg_01', sprite = 410 },
}

local BUSINESS_CODES = { 'burger_shot', 'uwu_cafe', 'roosters', 'maldinis' }

fishReserveStock = false
fishStock = false
local fishAvailableStock = 400
local fishAvailableStockSpare = 200

Citizen.CreateThread(function()
  local ids = {}
  for idx, npc in ipairs(NPC_DATA_FISH) do
    local data = {
      id = 'fish_npc_ingred_' .. npc.id,
      position = { coords = vector3(npc.coords.x, npc.coords.y, npc.coords.z - 1.0), heading = npc.coords.w },
      pedType = 4,
      model = npc.model,
      networked = false,
      distance = 50.0,
      settings = { { mode = 'invincible', active = true }, { mode = 'ignore', active = true }, { mode = 'freeze', active = true } },
      flags = { isNPC = true },
      blip = { color = idx + 2, sprite = npc.sprite, scale = 0.8, text = npc.name, short = true },
    }
    local _npc = exports['rd-npcs']:RegisterNPC(data, 'fish_rd-biz:ingr_' .. npc.id)
    exports['rd-npcs']:EnableNPC(_npc.id)
    ids[#ids + 1] = _npc.id
  end

  exports['rd-interact']:AddPeekEntryByFlag({ 'isNPC' }, {
    { id = 'fish_biz_open_ingredients', label = 'View Stock', icon = 'list-alt', event = 'NPC_DATA_rd-business:ingredients:open:fish' },
  }, { distance = { radius = 2.5 }, npcIds = ids })
end)

AddEventHandler('NPC_DATA_rd-business:ingredients:open:fish', function(pArgs, pEntity, pContext)
  -- local passed = false
  -- for _, biz in ipairs(BUSINESS_CODES) do
  --   if IsEmployedAt(biz) then
  --     passed = true
  --     break
  --   end
  -- end
  -- if not passed then
  --   TriggerEvent('DoLongHudText', 'You cannot access this shop.', 2)
  --   return
  -- end
  local npcType
  for _, npc in ipairs(NPC_DATA_FISH) do
    -- this should maybe be replaced with coord distance check
    if GetHashKey(npc.model) == GetEntityModel(pEntity) then
      npcType = npc.id
      break
    end
  end

     local _context = {
     {
       title = 'Fish Producer',
       description = 'Fish',
       icon = 'fish',
     },
     {
       title = 'Buy Stock',
       description = 'Currently Available: '.. fishAvailableStock ..'',
       icon = 'hand-holding-usd',
       disabled = fishStock,
       children = {
        {
          title = 'Total cost: $280',
          description = 'Fish x40',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:collectfish',
        },
      }
     },
     {
      title = 'Buy Spare Stock',
      description = 'On reserve: '.. fishAvailableStockSpare ..'',
      icon = 'dollar-sign',
      disabled = fishReserveStock,
      children = {
        {
          title = 'Total cost: $2800',
          description = 'You will receive all goods immediately.',
          icon = 'dollar-sign',
        },
        {
          title = 'Accept',
          icon = 'check',
          action = 'rd-business:ingredients:purchasefish',
        },
      }
     }
   }
  exports['rd-ui']:showContextMenu(_context)
end)

RegisterNetEvent("fishAvailableStockS")
AddEventHandler("fishAvailableStockS", function(raggsyy, ragzi)
  fishAvailableStock = ragzi
end)

RegisterNetEvent("fishAvailableStockSSpare")
AddEventHandler("fishAvailableStockSSpare", function(raggsyy, ragzi)
  fishAvailableStockSpare = ragzi
  print(fishAvailableStockSpare)
end)

RegisterUICallback('rd-business:ingredients:collectfish', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("fishAvailableStock", fishAvailableStock)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:collectfish")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    fishStock = true
  end
end)

RegisterUICallback('rd-business:ingredients:purchasefish', function(data, cb)
  cb({ data = {}, meta = { ok = true, message = '' } })
  TriggerServerEvent("fishAvailableStockSpare", fishAvailableStockSpare)
  Wait(500)
  local success = RPC.execute("rd-business:ingredients:purchasefish")
  if not success then 
    -- TriggerEvent("DoLongHudText", "You don't have enough money.", 2)
  else
    fishReserveStock = true
  end
end)

