AddEventHandler("rd-casino:wheel:toggleEnable", function()
    local characterId = exports["isPed"]:isPed("cid")
    local jobAccess = RPC.execute("IsEmployedAtBusiness", { character = { id = characterId }, business = { id = "casino" } })
    if not jobAccess then
      TriggerEvent("DoLHudText", "You cannot do that", 2)
      return
    end
    RPC.execute("rd-casino:wheel:toggleEnabled")
  end)
  
  AddEventHandler("rd-casino:wheel:spinWheel", function()
    if not hasMembership(false) then
      TriggerEvent("DoLHudText","You must have a membership", 2)
      return
    end
    local info = (exports["rd-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
    RPC.execute("rd-casino:wheel:spinWheel", false, json.decode(info.information).state_id)
  end)
  
  AddEventHandler("rd-casino:wheel:spinWheelTurbo", function()
    if not hasMembership(false) then
      TriggerEvent("DoLHudText","You must have a membership", 2)
      return
    end
    local info = (exports["rd-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
    RPC.execute("rd-casino:wheel:spinWheel", "turbo", json.decode(info.information).state_id)
  end)
  
  AddEventHandler("rd-casino:wheel:spinWheelOmega", function()
    if not hasMembership(false) then
      TriggerEvent("DoLHudText","You must have a membership", 2)
      return
    end
    local info = (exports["rd-inventory"]:GetInfoForFirstItemOfName("casinoloyalty") or { information = "{}" })
    RPC.execute("rd-casino:wheel:spinWheel", "omega", json.decode(info.information).state_id)
  end)
  
  AddEventHandler("rd-casino:wheel:pickupWheelCash", function()
    RPC.execute("rd-casino:wheel:pickupWheelCash")
  end)
  
  RegisterCommand('spin', function(source, args, RawCommand)
    TriggerServerEvent("rd-luckywheel:getLucky")
  end)