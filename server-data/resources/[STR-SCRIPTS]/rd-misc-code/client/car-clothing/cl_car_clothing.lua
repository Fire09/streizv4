RegisterUICallback("rd-ui:car-clothing:swapCurrentOutfit", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true)
  local finished = exports["rd-taskbar"]:taskBar(30000, "Swapping Outfit")
  ClearPedTasksImmediately(PlayerPedId())
  if finished ~= 100 then return end
  local rd = RPC.execute("rd-car-clothing:swapCurrentOutfit", NetworkGetNetworkIdFromEntity(data.key), data.values)
  rd = rd[1]
  exports['rd-vehicles']:SetVehicleAppearance(data.key, rd.app)
  exports['rd-vehicles']:SetVehicleMods(data.key, rd.mods)
  exports['rd-vehicles']:SetVehicleColors(data.key, rd.colors)
end)

AddEventHandler("rd-car-clothing:swapCurrentOutfit", function(p1, pEntity)
  exports["rd-ui"]:openApplication("textbox", {
    callbackUrl = "rd-ui:car-clothing:swapCurrentOutfit",
    key = pEntity,
    items = {
      {
        label = "Slot",
        name = "slot",
        _type = "select",
        options = {
          {
            name = "1",
            id = "1",
          },
          {
            name = "2",
            id = "2",
          },
        },
      },
    },
    show = true,
  })
end)

RegisterUICallback("rd-ui:car-clothing:saveCurrentOutfit", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  exports["rd-ui"]:closeApplication("textbox")
  RPC.execute("rd-car-clothing:saveCurrentOutfit", NetworkGetNetworkIdFromEntity(data.key), data.values)
end)

AddEventHandler("rd-car-clothing:saveCurrentOutfit", function(p1, pEntity, p3)
  exports["rd-ui"]:openApplication("textbox", {
    callbackUrl = "rd-ui:car-clothing:saveCurrentOutfit",
    key = pEntity,
    items = {
      { label = "Name", name = "name" },
      {
        label = "Slot",
        name = "slot",
        _type = "select",
        options = {
          {
            name = "1",
            id = "1",
          },
          {
            name = "2",
            id = "2",
          },
        },
      },
    },
    show = true,
  })
end)

Citizen.CreateThread(function()
  exports["rd-polyzone"]:AddBoxZone("custom_car_clothing", vector3(143.13, 319.25, 112.14), 16.2, 9.2, {
    name="usethis",
    heading=295,
    minZ=110.74,
    maxZ=113.94,
  })
  exports["rd-polyzone"]:AddBoxZone("bennys", vector3(143.13, 319.25, 112.14), 16.2, 9.2, {
    name="usethis",
    heading=295,
    minZ=110.74,
    maxZ=113.94,
  })
  -- mission row clothing spot
  exports["rd-polyzone"]:AddBoxZone("custom_car_clothing", vector3(435.43, -976.03, 25.7), 9.2, 4.2, {
    name="mrcs",
    heading=270,
    minZ=24.3,
    maxZ=28.3
  })
end)
