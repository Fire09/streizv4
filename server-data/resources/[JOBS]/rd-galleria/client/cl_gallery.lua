-- local camCoords = vector3(-542.3707, -436.3848, 94.16705)
local gemCoords = vector4(-468.39, 32.69, 46.92, 264.01)
local inAppraisalArea = false
local staticCam
local gem = 0

function IsGalleryEmployee()
  local jobAccess = exports['rd-business']:IsEmployedAt('gallery')
  if not jobAccess then
    TriggerEvent("DoLongHudText", "They do not recognize you", 2)
    return false
  end
  return true
end

function IsJewelryEmployee()
  local jobAccess = exports['rd-business']:IsEmployedAt('jeweled_dragon')
  if not jobAccess then
    TriggerEvent("DoLongHudText", "They do not recognize you", 2)
    return false
  end
  return true
end

AddEventHandler("rd-polyzone:enter", function(name)
  if name ~= "gallery_appraisals" then return end
  inAppraisalArea = true
end)

AddEventHandler("rd-polyzone:exit", function(name)
  if name ~= "gallery_appraisals" then return end
  inAppraisalArea = false
end)

AddEventHandler("rd-gallery:sellGems", function()
  local anyoneSellGems = exports['rd-config']:GetMiscConfig("gallery.anyone.sell.gems")
  if anyoneSellGems then
    TriggerServerEvent("rd-gallery:sellGemsFromNPC")
    return
  end
  if not IsGalleryEmployee() then return end
  local craftAccess = RPC.execute("rd-business:hasPermission", "gallery", "craft_access", characterId)
  if not craftAccess then
    TriggerEvent("DoLongHudText", "Insufficient permissions", 2)
    return
  end
  TriggerServerEvent("rd-gallery:sellGemsFromNPC")
end)

AddEventHandler("rd-inventory:itemUsed", function(item, info)
  if item ~= "gallerygem" then return end
  if not inAppraisalArea then
    TriggerEvent("DoLongHudText", "Can't do that here.", 2)
    return
  end
  local info = json.decode(info)
  createGem(info.color, info.purity)
end)

local listening = false
function listenForEscapeKeypress()
  if listening then return end
  listening = true
  Citizen.CreateThread(function()
    exports["rd-ui"]:showInteraction("[ESC] Exit")
    while listening do
      if IsControlJustReleased(0, 177) then
          listening = false
          exports["rd-ui"]:hideInteraction()
          FreezeEntityPosition(PlayerPedId(), false)
          DoScreenFadeOut(1000)
          Wait(1000)
          deleteGem()
          exports["rd-ui"]:sendAppEvent("preferences", {
            ["hud.blackbars.enabled"] = false,
          })
          DoScreenFadeIn(1000)
          return
      end
      local curHeading = GetEntityHeading(gem)
      if curHeading >= 360 then
        curHeading = 0.0
      end
      SetEntityHeading(gem, curHeading + 0.1)
      DisablePlayerFiring(PlayerPedId(), true)
      Wait(0)
    end
  end)
end

function createGem(color, purity)
  RequestModel("npgem")
  while not HasModelLoaded("npgem") do
    Wait(0)
  end
  DeleteEntity(gem)
  local obj = -1
  local loopcount = 0
  while loopcount < 5 do
    obj = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 10.0, `npgem`, 0)
    loopcount = loopcount + 1
    DeleteEntity(obj)
  end
  DoScreenFadeOut(1000)
  FreezeEntityPosition(PlayerPedId(), true)
  Wait(1000)
  local dirtLevel = (15 - math.floor(purity / 6.66)) + 0.0
  gem = CreateVehicle(`npgem`, gemCoords, 0, 0)
  FreezeEntityPosition(gem, true)
  SetEntityCollision(gem, false, false)
  SetVehicleDirtLevel(gem, dirtLevel)
  SetVehicleColours(gem, color, 0)
  SetVehicleExtraColours(gem, 0, false)
  staticCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
  SetCamCoord(staticCam, GetOffsetFromEntityInWorldCoords(gem, 0.5, 0.0, 0.1))
  SetCamRot(staticCam, -20.0, 0.0, 352.0)
  SetCamFov(staticCam, 50.0)
  RenderScriptCams(true, false, 0, 1, 0)
  exports["rd-ui"]:sendAppEvent("preferences", {
    ["hud.blackbars.enabled"] = true,
  })
  Wait(200)
  DoScreenFadeIn(1000)
  listenForEscapeKeypress()
end

function deleteGem()
  RenderScriptCams(false, false, 0, 1, 0)
  DeleteEntity(gem)
end

AddEventHandler('rd-gallery:gemTrade', function(pParameters, pEntity, pContext)
  TriggerEvent('server-inventory-open', '1', 'gallery_gemtrade')
end)

RegisterUICallback("rd-ui:galleryGemCraft", function(data, cb)
  cb({ data = {}, meta = { ok = true, message = "done" } })
  local gemType = data.key
  local ringCount = 0
  local items = exports["rd-inventory"]:GetItemsByItemMetaKV("gallerygem", "type", gemType)
  if #items == 0 then
    TriggerEvent("DoLongHudText", "Not enough gems found.", 2)
    return
  end
  TriggerEvent("inventory:removeItemByMetaKV", "gallerygem", #items, "type", gemType)
  Wait(500)
  TriggerEvent("player:receiveItem", "craftedgem" .. gemType, #items)
end)

AddEventHandler('rd-gallery:gemCraft', function(pParameters, pEntity, pContext)
  if not IsGalleryEmployee() then return end
  local data = {
    {
      title = "Jade",
      description = "Nourishment",
      key = "jade",
      action = "rd-ui:galleryGemCraft",
    },
    {
      title = "Citrine",
      description = "Rejuvenation",
      key = "citrine",
      action = "rd-ui:galleryGemCraft",
    },
    {
      title = "Aquamarine",
      description = "Water",
      key = "aquamarine",
      action = "rd-ui:galleryGemCraft",
    },
    {
      title = "Sapphire",
      description = "5g",
      key = "sapphire",
      action = "rd-ui:galleryGemCraft",
    },
    {
      disabled = true,
      title = "Ruby",
      description = "Find out soon",
      key = "ruby",
      action = "rd-ui:galleryGemCraft",
    },
    {
      disabled = true,
      title = "Diamond",
      description = "Find out soon",
      key = "diamond",
      action = "rd-ui:galleryGemCraft",
    },
    {
      disabled = true,
      title = "Tanzanite",
      description = "Find out soon",
      key = "tanzanite",
      action = "rd-ui:galleryGemCraft",
    },
    {
      disabled = true,
      title = "Onyx",
      description = "Find out soon (maybe, do some work)",
      key = "onyx",
      action = "rd-ui:galleryGemCraft",
    },
  }
  exports["rd-ui"]:showContextMenu(data)
end)

local onUseItems = {
  ["craftedgemjade"] = true,
  ["craftedgemcitrine"] = true,
  ["craftedgemaquamarine"] = true,
}
AddEventHandler("rd-inventory:itemUsed", function(item)
  if not onUseItems[item] then return end
  TriggerEvent("inventory:removeItem", item, 1)
  TriggerEvent("buffs:triggerBuff", item)
  if item == "craftedgemaquamarine" then
    TriggerEvent("rd-buffs:applyBuff", "craftedgemaquamarine", { { buff = "swimming", percent = 0.5 } })
  end
  if item == "craftedgemjade" then
    TriggerEvent("DoLongHudText", "You feel nourished")
  end
end)