local currentBoardUrl = nil
local dui = nil

Citizen.CreateThread(function()
  -- Class room
  exports["rd-polyzone"]:AddBoxZone("right_of_way_classroom", vector3(-30.14, -220.52, 46.31), 14.0, 9.4, {
    heading = 340,
    minZ = 45.31,
    maxZ = 48.31,
    data = {
      id = "right_of_way_classroom"
    }
  })

  -- Whiteboard for class room
  exports["rd-polytarget"]:AddBoxZone("right_of_way_whiteboard", vector3(-33.29, -226.77, 46.31), 0.4, 2.8, {
    heading = 340,
    minZ = 45.71,
    maxZ = 47.91,
    data = {
      id = "right_of_way_whiteboard"
    }
  })

  exports["rd-interact"]:AddPeekEntryByPolyTarget("right_of_way_whiteboard", {{
    event = "rd-business:client:changeRightOfWayBoard",
    id = "right_of_way_whiteboard",
    icon = "circle",
    label = "Change URL",
    parameters = { }
}}, {
  distance = { radius = 2.5 },
  isEnabled = function()
    return IsEmployedAt("right_of_way")
  end
})
end)

AddEventHandler("rd-polyzone:enter", function(pZone)
  if pZone ~= "right_of_way_classroom" then return end
  inClassRoom = true
  TriggerServerEvent("rd-business:server:requestRightOfWayBoard")
end)

AddEventHandler("rd-polyzone:exit", function(pZone)
  if pZone ~= "right_of_way_classroom" then return end

  if dui ~= nil then
    exports["rd-lib"]:releaseDui(dui.id)
    dui = nil
  end

  inClassRoom = false
end)


RegisterUICallback("rd-business:ui:changeRightOfWayBoard", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "" } })
  exports["rd-ui"]:closeApplication("textbox")
  TriggerServerEvent("rd-business:server:changeRightOfWayBoard", data.values.url)
end)

RegisterNetEvent("rd-business:client:updateRightOfWayBoard")
AddEventHandler("rd-business:client:updateRightOfWayBoard", function(pUrl)
  if not inClassRoom then return end
  
  currentBoardUrl = pUrl
  if not dui then
    dui = exports["rd-lib"]:getDui(currentBoardUrl, 256, 256)
    AddReplaceTexture("hei_prop_hei_muster_01", "script_rt_planning", dui.dictionary, dui.texture)
  else
    exports["rd-lib"]:changeDuiUrl(dui.id, currentBoardUrl)
  end
end)

AddEventHandler("rd-business:client:changeRightOfWayBoard", function(pParams)
  exports["rd-ui"]:openApplication("textbox", {
    callbackUrl = "rd-business:ui:changeRightOfWayBoard",
    key = 1,
    items = {
      {
        icon = "circle",
        label = "URL",
        name = "url",
      },
    },
    show = true,
  })
end)
