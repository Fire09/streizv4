RegisterNetEvent("rd-npcs:set:ped")
AddEventHandler("rd-npcs:set:ped", function(pNPCs)
  if type(pNPCs) == "table" then
    for _, ped in ipairs(pNPCs) do
      RegisterNPC(ped, 'rd-npcs')
      EnableNPC(ped.id)
    end
  else
    RegisterNPC(ped, 'rd-npcs')
    EnableNPC(ped.id)
  end
end)

RegisterNetEvent("rd-npcs:set:position")
AddEventHandler("rd-npcs:set:position", function(pId, pVectors, pHeading)
  local position = { coords = pVectors, heading = pHeading}
  UpdateNPCData(pId, 'position', position)
end)

RegisterNetEvent("rd-npcs:ped:giveStolenItems")
AddEventHandler("rd-npcs:ped:giveStolenItems", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["rd-taskbar"]:taskBar(15000, "Preparing to receive goods, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      local serverCode = exports["rd-config"]:GetServerCode()
      TriggerEvent("server-inventory-open", "1", "Stolen-Goods-1-" .. serverCode)
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 105)
    end
  end
end)

RegisterNetEvent("rd-npcs:ped:exchangeRecycleMaterial")
AddEventHandler("rd-npcs:ped:exchangeRecycleMaterial", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local npcCoords = GetEntityCoords(pEntity)
  local finished = exports["rd-taskbar"]:taskBar(3000, "Preparing to exchange material, don't move.")
  if finished == 100 then
    if #(GetEntityCoords(PlayerPedId()) - npcCoords) < 2.0 then
      TriggerEvent("server-inventory-open", "35", "Craft");
    else
      TriggerEvent("DoLongHudText", "You moved too far you idiot.", 105)
    end
  end
end)

RegisterNetEvent("rd-npcs:ped:signInJob")
AddEventHandler("rd-npcs:ped:signInJob", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  if #pArgs == 0 then
    local npcId = DecorGetInt(pEntity, 'NPC_ID')
    if npcId == `news_reporter` then
      TriggerServerEvent("jobssystem:jobs", "news")
    elseif npcId == `head_stripper` then
      TriggerServerEvent("jobssystem:jobs", "entertainer")
    end
  else
    TriggerServerEvent("jobssystem:jobs", "unemployed")
  end
end)

RegisterNetEvent("rd-npcs:ped:paycheckCollect")
AddEventHandler("rd-npcs:ped:paycheckCollect", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerServerEvent("server:paySlipPickup")
end)

RegisterNetEvent("rd-npcs:ped:receiptTradeIn")
AddEventHandler("rd-npcs:ped:receiptTradeIn", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local cid = exports["isPed"]:isPed("cid")
  local accountStatus, accountTarget = RPC.execute("GetDefaultBankAccount", cid)
  if not accountStatus then return end
  RPC.execute("rd-inventory:tradeInReceipts", cid, accountTarget)
end)

RegisterNetEvent("rd-npcs:ped:receiptTradeInMarket")
AddEventHandler("rd-npcs:ped:receiptTradeInMarket", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local cid = exports["isPed"]:isPed("cid")
  RPC.execute("rd-inventory:tradeInReceiptsMarket", cid)
end)

RegisterNetEvent("rd-npcs:ped:sellStolenItems")
AddEventHandler("rd-npcs:ped:sellStolenItems", function()
  RPC.execute("rd-inventory:sellStolenItems", false)
end)

RegisterNetEvent("rd-npcs:ped:keeper")
AddEventHandler("rd-npcs:ped:keeper", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerEvent("server-inventory-open", pArgs[1], "Shop")
end)
RegisterNetEvent("rd-npcs:ped:keeperLiqour")
AddEventHandler("rd-npcs:ped:keeperLiqour", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  TriggerEvent("server-inventory-open", pArgs[1], "Shop");
end)

TriggerServerEvent("rd-npcs:location:fetch")

AddEventHandler("rd-npcs:ped:weedSales", function(pArgs, pEntity, pEntityFlags, pEntityCoords)
  local result, message = RPC.execute("rd-npcs:weedShopOpen")
  if not result then
    TriggerEvent("DoLongHudText", message, 2)
    return
  end
  TriggerEvent("server-inventory-open", "44", "Shop");
end)

AddEventHandler("rd-npcs:ped:licenseKeeper", function(pData)
  RPC.execute("rd-npcs:purchaseDriversLicense", pData.type)
end)

AddEventHandler('rd-island:hideBlips', function(pState)
  for _, data in pairs(Handler.npcs) do
    if data["npc"].blipHandler then
      data["npc"].blipHandler:hide(pState)
    end
  end
end)
