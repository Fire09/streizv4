-- second part of this is for the pastels company, only here to save copy pasta

local function PermissionCheck()
  local dist1 = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),707.23,-966.9,30.41)
  local pass = false
  if HasPermission("comic_store", "craft_access") then
     pass = true
  end
  if (HasPermission("ottos_pastels", "craft_access") and dist1 < 10.0) then
     pass = true
  end
  return pass
end

AddEventHandler("rd-business:comicshop:writeBook", function()
  RefreshEmploymentList();
  if not PermissionCheck() then
    TriggerEvent("DoLongHudText", "You do not have access.", 2)
    return
  end
  TriggerEvent("rd-books:writeBook")
end)

AddEventHandler("rd-business:comicshop:copyBook", function()
  RefreshEmploymentList();
  if not PermissionCheck() then
    TriggerEvent("DoLongHudText", "You do not have access.", 2)
    return
  end
  TriggerEvent("rd-books:copyBook")
end)

AddEventHandler('rd-business:ped:comicRecycleGive', function()
    TriggerEvent('server-inventory-open', '1', 'comicshop_recycle')
end)

AddEventHandler('rd-business:ped:comicRecycle', function()
    local ped = PlayerPedId()
    FreezeEntityPosition(ped, true)
    local finished = exports["rd-taskbar"]:taskBar(30000, 'Scrapping items...')
    FreezeEntityPosition(ped, false)
    if finished ~= 100 then return end
    TriggerServerEvent('rd-inventory:comicshop-recycle')
end)

CreateThread(function()
  exports["rd-polytarget"]:AddBoxZone(
    "comic_shop_writing_table",
    vector3(-144.68, 218.17, 94.99), 1.2, 1.0,
    {
      minZ = 94.64,
      maxZ = 96.04
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "comic_shop_writing_table",
    {
      {
        event = "rd-business:comicshop:writeBook",
        id = "comic_shop_book_write",
        icon = "book",
        label = "Write a book"
      },
      {
        event = "rd-business:comicshop:copyBook",
        id = "comic_shop_book_copy",
        icon = "copy",
        label = "Copy a book"
      }
    },
    {
      distance = { radius = 2.0 }
    }
  )

  exports["rd-polytarget"]:AddBoxZone(
    "pastels_shop_writing_table",
    vector3(707.23,-966.9,30.41), 1.2, 1.0,
    {
      minZ = 28.64,
      maxZ = 32.04
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "pastels_shop_writing_table",
    {
      {
        event = "rd-business:comicshop:writeBook",
        id = "pastels_shop_book_write",
        icon = "book",
        label = "Create Magazine"
      },
      {
        event = "rd-business:comicshop:copyBook",
        id = "pastels_shop_book_copy",
        icon = "copy",
        label = "Copy Magazine"
      }
    },
    {
      distance = { radius = 1.0 }
    }
  )

end)
