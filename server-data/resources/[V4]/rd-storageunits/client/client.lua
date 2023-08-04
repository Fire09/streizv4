
local id
local result
local password

AddEventHandler('playerSpawned', function () 
    for k,v in pairs(Config.Coords) do
   exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-78.5969, -1204.14, 27.631), 1.0, 1.0, {
     heading=60,
     minZ=26.04,
     maxZ=28.24,
     data = {
       id = 1,
     },
   })

   exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-73.4055, -1197.12, 27.656), 1.0, 1.0, {
    heading=60,
    minZ=26.04,
    maxZ=28.24,
    data = {
      id = 2,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-66.9857, -1199.58, 27.803), 1.0, 1.0, {
    heading=60,
    minZ=26.04,
    maxZ=28.24,
    data = {
      id = 3,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-70.8540, -1206.48, 27.888), 1.0, 1.0, {
    heading=60,
    minZ=26.04,
    maxZ=28.24,
    data = {
      id = 4,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-61.3920, -1205.29, 28.167), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 5,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-65.6510, -1211.73, 28.377), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 6,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-56.1455, -1210.52, 28.499), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 7,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-53.0251, -1216.50, 28.705), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 8,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-56.1286, -1228.50, 28.778), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 9,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-66.6008, -1226.67, 28.841), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 10,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-61.0751, -1233.83, 28.904), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=29.24,
    data = {
      id = 11,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-72.2103, -1233.58, 29.078), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=30.24,
    data = {
      id = 12,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-66.5511, -1239.70, 29.043), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=30.24,
    data = {
      id = 13,
    },
  })

  exports["rd-polytarget"]:AddBoxZone("storage_units", vector3(-73.4129, -1242.95, 29.110), 1.0, 1.0, {
    heading=60,
    minZ=27.04,
    maxZ=30.24,
    data = {
      id = 14,
    },
  })
        
    exports["rd-interact"]:AddPeekEntryByPolyTarget("storage_units", {{
    event = "rd-storageunits:openStorage",
    id = "storage_units_open",
    icon = "box",
    label = "Open Storage",
    parameters = {},
}},
{ distance = { radius = 3.0 } })

    end
end)

RegisterNetEvent('rd-storageunits:getTable')
AddEventHandler('rd-storageunits:getTable', function(table)
    result = table
end)

local striezStorageUnitsId = {}

RegisterNetEvent("rd-storageunits:openStorage")
AddEventHandler("rd-storageunits:openStorage", function(p1, p2, pArgs)
    TriggerServerEvent("rd-storageunits:getTables")
    Wait(150)
    local id = pArgs.zones["storage_units"].id
    striezStorageUnitsId = id
    local checkTable = result
    local storageOptions = checkTable["" .. id .. ""]
    password = storageOptions["password"]
    if storageOptions["buy"] == "true" then
        local context = {
            {
              title = "Open Storage Container",
              description = "View what you have in this storage container",
              action = "rd-storageunits:openStorageContainer",
              key = {id = id}
            },
          }
          exports["rd-ui"]:showContextMenu(context)
    else
        local context = {
            {title = "Storage", icon = "box-open" },
            {
              title = "Buy Storage",
              description = "Click if you want to rent the storage",
              action = "rd-storageunits:buyStorage",
              key = {id = id}
            },
          }
          exports["rd-ui"]:showContextMenu(context)
    end
end)

local storageUnitsIdCheck = striezStorageUnitsId

RegisterUICallback("rd-storageunits:buyStorage", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    local currentPrices = 500
    local checkMoney = RPC.execute("rd-storageunits:BuyStorage", currentPrices)
    if not checkMoney then
        TriggerEvent('DoLongHudText', 'You do not have enough money !', 2)
    end
    local selectPassword = data.key.id 
    TriggerServerEvent('rd-storageunits:buyStorages', data.key.id)

	exports['rd-ui']:openApplication('textbox', {
		callbackUrl = 'rd-storageunits:SelectPassword',
		key = {sPassId = selectPassword},
		items = {
		  {
			icon = "user-lock",
			label = "Select Password",
			name = "SelectStorageContainer",
		  },
		},
	  show = true,
	})

    TriggerEvent('DoLongHudText', 'You have purchased a storage!', 1)
end)

RegisterUICallback("rd-storageunits:SelectPassword", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    local StorageUId = data.key.sPassId
    TriggerServerEvent("rd-storageunits:SelectPassword", StorageUId, data.values.SelectStorageContainer)
end)

RegisterUICallback("rd-storageunits:openStorageContainer", function(data, cb)
    cb({ data = {}, meta = { ok = true, message = "done" } })
    local StorageUId = data.key.id
	exports['rd-ui']:openApplication('textbox', {
		callbackUrl = 'rd-storageunits:CheckPassword',
		key = {sId = StorageUId},
		items = {
		  {
			icon = "user-lock",
			label = "Password",
			name = "storageContainer",
		  },
		},
	  show = true,
	})
end)

local CheckPassword = {}

RegisterNetEvent("StorageUnitsServerPassword")
AddEventHandler("StorageUnitsServerPassword", function(ServerPassword)
    CheckPassword = ServerPassword
end)

RegisterUICallback('rd-storageunits:CheckPassword', function(data, cb)
    cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerServerEvent("storageUnitssendId", data.key.sId)
    Wait(150)
    RPC.execute("rd-storageunits:CheckStoragePassword")
    if data.values.storageContainer == CheckPassword then
        TriggerEvent("server-inventory-open", "1", "Storage Units - " .. data.key.sId)
    else
        TriggerEvent('DoLongHudText', 'Wrong password !', 2)
    end
end) 