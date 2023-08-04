function Login.playerLoaded() end

function Login.characterLoaded()
 -- Main events leave alone 
 TriggerEvent("rd-base:playerSpawned")
 TriggerEvent("playerSpawned")
 TriggerServerEvent('character:loadspawns')
 -- Main events leave alone 

 TriggerEvent("Relog")

 -- Everything that should trigger on character load 
 TriggerServerEvent('checkTypes')
 TriggerServerEvent('isVip')
 TriggerEvent('rehab:changeCharacter')
 TriggerEvent("resetinhouse")
 TriggerEvent("fx:clear")
 TriggerServerEvent("raid_clothes:retrieve_tats")
 TriggerServerEvent('Blemishes:retrieve')
 TriggerServerEvent("currentconvictions")
 TriggerServerEvent("GarageData")
 TriggerServerEvent("Evidence:checkDna")
 TriggerEvent("banking:viewBalance")
 TriggerServerEvent("police:getLicensesCiv")
 TriggerServerEvent('rd-doors:requestlatest')
 TriggerServerEvent("item:UpdateItemWeight")
 TriggerServerEvent("rd-weapons:getAmmo")
 TriggerServerEvent("ReturnHouseKeys")
 TriggerServerEvent("requestOffices")
 TriggerServerEvent('rd-base:addLicenses')
 Wait(500)
 TriggerEvent("rd-housing:loadHousingClient")
 TriggerServerEvent("rd-housing:getGarages")
 TriggerServerEvent('commands:player:login')
 TriggerServerEvent("police:getAnimData")
 TriggerServerEvent("police:getEmoteData")
 TriggerServerEvent("police:SetMeta")
 TriggerServerEvent("retreive:licenes:server")
 TriggerServerEvent("clothing:checkIfNew")
 -- Anything that might need to wait for the client to get information, do it here.
 Wait(3000)
 TriggerServerEvent("bones:server:requestServer")
 TriggerEvent("apart:GetItems")
 TriggerEvent("rd-editor:readyModels")
 Wait(4000)
 TriggerServerEvent('distillery:getDistilleryLocation')
 TriggerServerEvent("retreive:jail",exports["isPed"]:isPed("cid"))	
 TriggerServerEvent("bank:getLogs")
 TriggerEvent('rd-hud:EnableHud', true)
 TriggerServerEvent('str:getmapprefrence')
 TriggerServerEvent('rd-phone:grabWallpaper')
 TriggerServerEvent('evidence:StoringEnabled')
 TriggerServerEvent('evidence:getDNA')
 TriggerServerEvent('banking-loaded-in')
 TriggerServerEvent('rd-base:updatedphoneLicenses')
 TriggerServerEvent('getallplayers')
 TriggerServerEvent('evidence:bonesRaggsyy')
 TriggerEvent("rd-base:PolyZoneUpdate")
 TriggerServerEvent('rd-playerlist:AddPlayer')
 TriggerServerEvent("server:currentpasses")
 TriggerServerEvent('rd-base:addLicenses')
 TriggerEvent("rd-phone:phone:fetch")
 TriggerEvent("isJudgeOff")
 exports['rd-ui']:showInteraction("UI Started")
 Wait(1000)
 exports['rd-ui']:hideInteraction()
 TriggerServerEvent("request-dropped-items")
 TriggerServerEvent("server-request-update", exports["isPed"]:isPed("cid"))
 TriggerServerEvent("request-dropped-items")
 TriggerEvent("rd-inventory:request:client:update")
 TriggerServerEvent("server-request-update", exports["isPed"]:isPed("cid"))
 TriggerServerEvent("rd-inventory:request:update", exports["isPed"]:isPed("cid"))
 TriggerServerEvent("striez-ready-inventory")
end

function Login.characterSpawned()
  isNear = false
  TriggerServerEvent('rd-base:sv:player_control')
  TriggerServerEvent('rd-base:sv:player_settings')

  TriggerServerEvent("TokoVoip:clientHasSelecterCharacter")
  TriggerEvent("spawning", false)
  TriggerEvent("inSpawn", false)
  TriggerEvent("attachWeapons")
  TriggerEvent("tokovoip:onPlayerLoggedIn", true)

  TriggerEvent("rd-hud:initHud")

  TriggerServerEvent("request-dropped-items")
  TriggerServerEvent("server-request-update", exports["isPed"]:isPed("cid"))
  TriggerServerEvent("rd-inventory:request:update", exports["isPed"]:isPed("cid"))
  TriggerEvent("rd-inventory:request:client:update")
  TriggerServerEvent("striez-ready-inventory")
  TriggerEvent("isJudgeOff")
  if Spawn.isNew then
      Wait(1000)
      TriggerEvent("hud:saveCurrentMeta")

      local src = GetPlayerServerId(PlayerId())
      TriggerServerEvent("reviveGranted", src)
      TriggerEvent("Hospital:HealInjuries", src, true)
      TriggerServerEvent("ems:healplayer", src)
      TriggerEvent("heal", src)
      TriggerEvent("status:needs:restore", src)
      TriggerServerEvent('rd-spawn:initBoosting')
      TriggerServerEvent("rd-spawn:newPlayerFullySpawned")
  end

  SetPedMaxHealth(PlayerPedId(), 200)
  
  runGameplay() -- moved from rd-base 
  Spawn.isNew = false
end
RegisterNetEvent("rd-spawn:characterSpawned");
AddEventHandler("rd-spawn:characterSpawned", Login.characterSpawned);

RegisterNetEvent("rd-spawn:getStartingItems");
AddEventHandler("rd-spawn:getStartingItems", function()
  TriggerEvent("player:receiveItem", "idcard",1,true,information)
	TriggerEvent("player:receiveItem", "mobilephone",1,true,information)
end)

RegisterNetEvent("rd-spawn:getNewAccountBox");
AddEventHandler("rd-spawn:getNewAccountBox", function(cid)
 -- // TriggerEvent("player:receiveItem", "presents", 1)
end)
