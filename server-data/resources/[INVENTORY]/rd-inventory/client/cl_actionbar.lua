local ammoTable = {}
unholsteringactive = false
local prevupdate = 0
local armed = false
local currentInformation = 0
local CurrentSqlID = 0
local TIME_REMOVED_FOR_DEG = 1000 * 60 * 5 -- 5 mins
local focusTaken = false
local UNARMED_HASH = `WEAPON_UNARMED`
local isActionBarDisabled = false
local shotRecently = false


local throwableWeapons = {}
throwableWeapons["741814745"] = true
throwableWeapons["-1600701090"] = true
throwableWeapons["615608432"] = true
throwableWeapons["1233104067"] = true
throwableWeapons["2874559379"] = true
throwableWeapons["126349499"] = true
throwableWeapons["-73270376"] = true
throwableWeapons["-1169823560"] = true
throwableWeapons["2481070269"] = true
throwableWeapons["-1813897027"] = true
throwableWeapons["600439132"] = true
throwableWeapons["1064738331"] = true
throwableWeapons["-691061592"] = true
throwableWeapons["126349499"] = true
throwableWeapons["-828058162"] = true
throwableWeapons["571920712"] = true
throwableWeapons["-1569615261"] = true
throwableWeapons["-37975472"] = true
throwableWeapons["181559993"] = true

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RPC.register("police:gsr", function()
	return shotRecently
end)

isCop = false
 
RegisterNetEvent('nowCopSpawn')
AddEventHandler('nowCopSpawn', function()
    isCop = true
end)

RegisterNetEvent('nowCopSpawnOff')
AddEventHandler('nowCopSpawnOff', function()
    isCop = false
end)


RegisterNetEvent('rd-items:SetAmmo')
AddEventHandler('rd-items:SetAmmo', function(sentammoTable)
	if sentammoTable ~= nil then
		ammoTable = sentammoTable
		GiveAmmoNow()
		Wait(300)
	end
end)

function GiveAmmoNow()
	for i,v in pairs(ammoTable) do
		for x,b in pairs(v) do
			SetPedAmmoByType(PlayerPedId(), v.type, v.ammo)
		end
	end
end



local lastWeaponDeg = 0
function attemptToDegWeapon()
	if math.random(100) > 85 then
		local hasTimer = 99999
		hasTimer = (GetGameTimer()-lastWeaponDeg)

		if  hasTimer >= 2000 then
			lastWeaponDeg = GetGameTimer();
		end
	end
end

local reDelayed = false
function actionBarDown()
    if focusTaken or reDelayed then return end
    TriggerEvent("inventory-bar", true)
    ExecuteCommand('cash')
    --ExecuteCommand('bank')
    exports["rd-hud"]:sendAppEvent("hud", {
        displayAllForce = true,
        displayAllForceVehicle = GetVehiclePedIsIn(PlayerPedId()) ~= 0,
        displayRadioChannel = true,
    })
--   exports["rd-ui"]:sendAppEvent("hud", {
--     displayAllForce = true,
--     displayAllForceVehicle = GetVehiclePedIsIn(PlayerPedId()) ~= 0,
--   })
--   TriggerServerEvent("rd-financials:cash:get", GetPlayerServerId(PlayerId()))
end

function actionBarUp()
  if focusTaken then return end
  reDelayed = true
  TriggerEvent("inventory-bar", false)
--   exports["rd-ui"]:sendAppEvent("hud", {
--     displayAllForce = false,
--     displayAllForceVehicle = false,
--   })
exports["rd-hud"]:sendAppEvent("hud", {
    displayAllForce = false,
    displayAllForceVehicle = false,
  })
  Citizen.SetTimeout(5000, function()
    exports["rd-hud"]:sendAppEvent("hud", {
        displayRadioChannel = false,
    })
  end)
  Citizen.SetTimeout(2500, function() reDelayed = false end)
end

function playerWink()
  Citizen.CreateThread(function()
    SetFacialIdleAnimOverride(GetPlayerPed(-1), "pose_aiming_1")
    Citizen.Wait(300)
    SetFacialIdleAnimOverride(GetPlayerPed(-1), "pose_normal_1")
  end)
end

Citizen.CreateThread(function()
  exports["rd-keybinds"]:registerKeyMapping("", "Player", "Action Bar", "+actionBar", "-actionBar", "TAB")
  RegisterCommand('+actionBar', actionBarDown, false)
  RegisterCommand('-actionBar', actionBarUp, false)

  exports["rd-keybinds"]:registerKeyMapping("", "Player", "Wink", "+playerWink", "-playerWink")
  RegisterCommand('+playerWink', playerWink, false)
  RegisterCommand('-playerWink', function() end, false)
end)

local excludedWeapons = {
    [`WEAPON_FIREEXTINGUISHER`] = true,
    [`WEAPON_FLARE`] = true,
    [`WEAPON_PetrolCan`] = true,
    [`WEAPON_STUNGUN`] = true,
	[-2009644972] = true, -- paintball gun bruv
	[1064738331] = true, -- bricked
    [-828058162] = true, -- shoed
}

local lastShot = 0
local lastDamageTrigger = 0
local shotRecentlyLoopActive = false
local disableGSR = false
local enableStressReliefWhenShooting = false

local function shotRecently()
	if shotRecentlyLoopActive then return end
	shotRecentlyLoopActive = true
	Citizen.CreateThread(function()
		while shotRecentlyLoopActive do
			Citizen.Wait(60000)
			if (lastShot + 2400000) < GetGameTimer() then
				shotRecentlyLoopActive = false
			end
		end
	end)
end

AddEventHandler("rd-voice:focus:set", function(pState)
	focusTaken = pState
  end)
  
  RegisterNetEvent("police:hasShotRecently")
  AddEventHandler("police:hasShotRecently", function(copId)
	  TriggerServerEvent("police:hasShotRecently", shotRecentlyLoopActive, copId)
  end)
  

AddEventHandler('rd-actionbar:hotreload', function()
    TriggerServerEvent("rd-weapons:getAmmo")
end)

Citizen.CreateThread( function()
	local lastWeapon
	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()

		local selectedWeapon = GetSelectedPedWeapon(ped)

		if UNARMED_HASH ~= selectedWeapon then
			lastWeapon = selectedWeapon
		end

		if selectedWeapon == 741814745 then
			TriggerEvent('Evidence:StateSet', 29, 3600)
		end

		if IsPedShooting(ped) then
			local hash = GetSelectedPedWeapon(ped)
			local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)
			newammo = GetPedAmmoByType(ped, ammoType)
			if newammo < 5 then
				updateAmmo()
			end
			if hash ~= 0 then
				attemptToDegWeapon()
			end
			local weapon = "".. hash ..""
      if weapon == "-37975472" then
        TriggerEvent("rd-weapons:threwSmokeGrenade")
        if lastEquippedItemToRemove then
          if exports["rd-inventory"]:hasEnoughOfItem(lastEquippedItemToRemove,1,false) then
            TriggerEvent("inventory:removeItem", lastEquippedItemToRemove, 1)
            Citizen.Wait(3000)
          end
        end
        lastEquippedItemToRemove = nil
      end
			if throwableWeapons[weapon] and exports["rd-inventory"]:hasEnoughOfItem(weapon,1,false) then
				TriggerEvent("inventory:removeItem", weapon, 1)
				Citizen.Wait(3000)
			end
			if not excludedWeapons[hash] and not disableGSR then
				nextLastShot = GetGameTimer()
				if nextLastShot - lastShot > 30000 then
					TriggerEvent("client:newStress", true, 50, true)
				end
				lastShot = nextLastShot
				shotRecently()
			else
				nextLastShot = GetGameTimer()
				if enableStressReliefWhenShooting and ((nextLastShot - lastShot) > 30000) then
					TriggerEvent("client:newStress", false, 1000)
				elseif ((nextLastShot - lastShot) > 30000) and hash == -2009644972 then
					-- paintball reduce stress YAY :)
					TriggerEvent("client:newStress", false, 1000)
				end
				lastShot = nextLastShot
			end

			if hash == `WEAPON_FIREEXTINGUISHER` then
				local pos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 3.0, 0.0)
				if GetNumberOfFiresInRange(pos,4.0) > 1 then
					local rnd = math.random(100)
					if rnd > 40 then TriggerServerEvent('fire:serverStopFire',pos.x,pos.y,pos.z,4.0) end
				end
			end

			if selectedWeapon ~= lastWeapon and (lastWeapon == 741814745 or lastWeapon == -1600701090 or lastWeapon == 600439132 or lastWeapon == 126349499 or lastWeapon == -828058162 or lastWeapon == 1064738331 or lastWeapon == -691061592 or lastWeapon == 1233104067 or lastWeapon == 181559993) then
				TriggerEvent("inventory:removeItem", lastWeapon, 1)
			end

			if selectedWeapon ~= lastWeapon and (lastWeapon == 571920712) then
				local hasItem = exports["rd-inventory"]:hasEnoughOfItem("571920712", 1, false, true, lastEquippedInfo)
				if not hasItem then
					lastEquippedInfo = {}
				else
					TriggerEvent("inventory:removeItemByMetaKV", lastWeapon, 1, "id", lastEquippedInfo.id)
				end
			end
		end

		if unholsteringactive then
			DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
		end


		prevupdate = prevupdate - 1

		if (IsControlJustReleased(0,157) or IsDisabledControlJustReleased(0,157)) and not focusTaken and not isActionBarDisabled then
			TriggerEvent("inventory-bind",1)
		end

		if (IsControlJustReleased(0,158) or IsDisabledControlJustReleased(0,158)) and not focusTaken and not isActionBarDisabled then
			TriggerEvent("inventory-bind",2)
		end

		if (IsControlJustReleased(0,160) or IsDisabledControlJustReleased(0,160)) and not focusTaken and not isActionBarDisabled then
			TriggerEvent("inventory-bind",3)
		end

		if (IsControlJustReleased(0,164) or IsDisabledControlJustReleased(0,164)) and not focusTaken and not isActionBarDisabled then
			TriggerEvent("inventory-bind",4)
		end

		if UNARMED_HASH ~= selectedWeapon and 741814745 ~= selectedWeapon and 100416529 ~= selectedWeapon then
			DisplayAmmoThisFrame(true)
		end

		if IsPedPlantingBomb(ped) then
			if exports["rd-inventory"]:hasEnoughOfItem("741814745",1,false) then

				TriggerEvent("inventory:removeItem", 741814745, 1)
				Citizen.Wait(3000)
			end
		end

	end
end)

AddEventHandler("rd-voice:focus:set", function(pState)
  focusTaken = pState
end)

local cannotPullWeaponInAnimation = false

-- local PetrolCanAmmoSet = false
RegisterNetEvent('equipWeaponID')
AddEventHandler('equipWeaponID', function(hash,newInformation,sqlID,itemToRemove)
	--GiveAmmoNow()
	if not exports["rd-propattach"]:canPullWeaponHoldingEntity() then return end
	
	if cannotPullWeaponInAnimation  then return end

  -- if tonumber(hash) == 1593441988 then
  --   hash = 453432689
  -- end

	cannotPullWeaponInAnimation = true
	CurrentSqlID = sqlID
	currentInformation = json.decode(newInformation)

	


	if (currentInformation.cartridge == nil) then
		currentInformation = "Scratched off data"
	else
		currentInformation = currentInformation.cartridge
	end
	TriggerEvent("evidence:bulletInformation", currentInformation)

	local dead = exports["isPed"]:isPed("dead")
	if dead then
		return
	end

	lastEquippedItemToRemove = itemToRemove

	if UNARMED_HASH == GetSelectedPedWeapon(PlayerPedId()) then
		armed = false
	end

	SetPlayerCanDoDriveBy(PlayerId(),false)
	
	if armed then
		armed = false
		TriggerEvent("hud-display-item",tonumber(hash),"Holster")
		--TriggerEvent('rd-hud:hide_weapon_out')
		holster1h()		
	else
		armed = true
		TriggerEvent("hud-display-item",tonumber(hash),"Equip")
		--TriggerEvent('rd-hud:show_weapon_out')
		unholster1h(tonumber(hash),true, json.decode(newInformation))
	end	

	if hash == "-72657034" then
		RemoveAllPedWeapons(PlayerPedId(),hash)
	end

	SetPedAmmo(PlayerPedId(),  `WEAPON_FIREEXTINGUISHER`, 10000)
	SetPedAmmo(PlayerPedId(),  `WEAPON_PetrolCan`, 4500)
	SetPedAmmo(PlayerPedId(),  `WEAPON_STICKYBOMB`, 1)
	
	SetPlayerCanDoDriveBy(PlayerId(),true)
	TriggerEvent("rd-weapons:client:showWeaponFireRate", armed)
	TriggerEvent("rd-weapons:client:weaponEquiped", hash, newInformation, sqlID, itemToRemove, armed)
	TriggerServerEvent("rd-weapons:weaponEquiped", hash, newInformation, sqlID, itemToRemove, armed)
end)

RegisterNetEvent('brokenWeapon')
AddEventHandler('brokenWeapon', function()

	local dead = exports["isPed"]:isCharacter("dead")
	if dead then
		return
	end


	holster1h()
	armed = false

	SetPedAmmo(PlayerPedId(),  `WEAPON_FIREEXTINGUISHER`, 10000)

end)


function ammoTypeCheck(atype)
	if type(atype) == "number" then
		if ammoTable["" .. atype .. ""] == nil then
			ammoTable["" .. atype .. ""] = {}
			ammoTable["" .. atype .. ""]["ammo"] = 0
			ammoTable["" .. atype .. ""]["type"] = atype
		end
	end
end



RegisterNetEvent('actionbar:ammo')
AddEventHandler('actionbar:ammo', function(hash,amount,addition)

	local ped = PlayerPedId()
	local ammoType = hash
	ammoTypeCheck(ammoType)

	if ammoTable == nil then
		TriggerServerEvent("rd-weapons:getAmmo")
		
	end

	if ammoTable["" .. ammoType .. ""] == nil then
		TriggerServerEvent("rd-weapons:getAmmo")
	end


	if hash == Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, GetSelectedPedWeapon(ped)) then
		curAmmo = GetPedAmmoByType(ped, hash)
	else
		curAmmo = ammoTable["" .. ammoType .. ""]["ammo"]

		if curAmmo == nil then
			ammoTable["" .. ammoType .. ""]["ammo"] = 0
		end
	end

	if addition then
	    newammo = tonumber(curAmmo) + tonumber(amount)
	else
		newammo = tonumber(curAmmo) - tonumber(amount)
	end

	if (curAmmo == newammo) then
		newammo = newammo + 30
	end

	if addition and newammo < amount then newammo = amount end


	if newammo > 150 and ammoType ~= -899475295 then
   		newammo = 150
    elseif newammo < 0 then
    	newammo = 0
    end

    ammoTable["" .. ammoType .. ""]["ammo"] = newammo

    SetPedAmmoByType(PlayerPedId(), ammoType, newammo)

    prevupdate = 0
	updateAmmoTable(newammo,ammoType)
end)


function updateAmmoTable(newammo,ammoType)
	local ped = PlayerPedId()
	local hash = GetSelectedPedWeapon(ped)
	if hash == UNARMED_HASH then
		updateAmmo(true)
		return
	end
	TriggerServerEvent("rd-weapons:updateAmmo",newammo,ammoType,ammoTable)
end

RegisterNetEvent('armory:ammo')
AddEventHandler('armory:ammo', function()
	TriggerEvent("actionbar:ammo",1950175060,150,true)
	TriggerEvent("actionbar:ammo",218444191,150,true)
	TriggerEvent("actionbar:ammo",-1878508229,150,true)
	TriggerEvent("actionbar:ammo",1820140472,150,true)
	TriggerEvent("actionbar:ammo",965225813,150,true)
end)

RegisterNetEvent('actionbar:setEmptyHanded')
AddEventHandler('actionbar:setEmptyHanded', function(ignoreUpdateAmmo)
	prevupdate = 0
  if not ignoreUpdateAmmo then
	  updateAmmo(true)
  end
	Wait(500)
	SetCurrentPedWeapon(PlayerPedId(), UNARMED_HASH, true)
end)


local lastUsedAmmo = GetSelectedPedWeapon(PlayerPedId())
function updateAmmo(isForced)

	if prevupdate > 0 then
		return
	end

	prevupdate = 5
	local ped = PlayerPedId()
	local hash = GetSelectedPedWeapon(ped)
	if hash == UNARMED_HASH then
		hash = lastUsedAmmoHash
	end
	lastUsedAmmoHash = hash
	local newammo = 0
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)

	if type(ammoType) == 'number' then 

		ammoTypeCheck(ammoType)

		newammo = GetPedAmmoByType(ped, ammoType)
		
		if newammo == nil then
			return
		end

		if isForced and newammo == 0 then 
			return
		end

		if newammo > 150 and ammoType ~= -899475295 then
			newammo = 150
		end

		ammoTable["" .. ammoType .. ""]["ammo"] = newammo


		TriggerServerEvent("rd-weapons:updateAmmo",newammo,ammoType,ammoTable)

	end

	return newammo
end


function getAmmo(hash)
	if (throwableWeapons[""..hash..""]) then
    	return 2
    end

	local ped = PlayerPedId()
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, hash)

	local newammo = 0

	if type(ammoType) == "number" then
		ammoTypeCheck(ammoType)
		newammo = ammoTable["" .. ammoType .. ""]["ammo"]
	end

	if newammo > 150 and ammoType ~= -899475295 then
		newammo = 150
	end

	return newammo
end

RegisterNetEvent('rd-item:CheckClientAmmo')
AddEventHandler('rd-item:CheckClientAmmo', function(weapons)
	local ped = PlayerPedId()
	local ammoType = Citizen.InvokeNative(0x7FEAD38B326B9F74, ped, weapons)
	local newammo = 0

	ammoTypeCheck(ammoType)

	if type(ammoType) == "number" then
		ammoTypeCheck(ammoType)
		newammo = ammoTable["" .. ammoType .. ""]["ammo"]
	end


end)


function unholster1h(weaponHash, a, info)

	unholsteringactive = true

	local dict = "reaction@intimidation@1h"
	local anim = "intro"
	local myJob = exports["isPed"]:isPed("myJob")
	local ped = PlayerPedId()

	if myJob == "police" or myJob == "doc" or myJob == "state" or myJob == "sheriff" or myJob == "ranger" then
		  copunholster(weaponHash)

	    if weaponHash == 3219281620 then
			  GiveWeaponComponentToPed(PlayerPedId(), 3219281620, `COMPONENT_AT_PI_FLSH_02` )
	    end

	    if weaponHash == 736523883 then
        GiveWeaponComponentToPed( ped, 736523883, `COMPONENT_AT_AR_FLSH` )
        GiveWeaponComponentToPed( ped, 736523883, `COMPONENT_AT_SCOPE_MACRO_02` )	
	    end

	    if weaponHash == -2084633992 then
        GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_AR_FLSH` )
        GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_AR_AFGRIP` )
        GiveWeaponComponentToPed( ped, -2084633992, `COMPONENT_AT_SCOPE_MEDIUM` )
		end
		
	     if weaponHash == 1432025498 then
         GiveWeaponComponentToPed( ped, 1432025498, `COMPONENT_AT_SCOPE_MACRO_MK2` )
         GiveWeaponComponentToPed( ped, 1432025498, `COMPONENT_AT_AR_FLSH` )
	     end

	    if weaponHash == 2024373456 then
        GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_AR_FLSH` )
        GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_SIGHTS_SMG` )	
        GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_MUZZLE_01` )
        GiveWeaponComponentToPed( ped, 2024373456, `COMPONENT_AT_SB_BARREL_02` )	
	    end

	    if weaponHash == -86904375 then
	    	GiveWeaponComponentToPed( ped, -86904375, `COMPONENT_AT_AR_FLSH` )
	    	GiveWeaponComponentToPed( ped, -86904375, `COMPONENT_AT_SIGHTS` )
	    end

	    if weaponHash == -1075685676 then
	    	GiveWeaponComponentToPed( ped, -1075685676, `COMPONENT_AT_PI_FLSH_02` )
	    end

		  AttachmentCheck(weaponHash)
		
	    Citizen.Wait(450)
      unholsteringactive = false
      cannotPullWeaponInAnimation = false
		return
	end	

	RemoveAllPedWeaponsP(ped,weaponHash)
	if weaponHash ~= -538741184 and weaponHash ~= 615608432 then
		local animLength = GetAnimDuration(dict, anim) * 1000
	    loadAnimDict(dict) 
	    TaskPlayAnim(ped, dict, anim, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
	    Citizen.Wait(900)
	    GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 0, 1)
	    SetCurrentPedWeapon(ped, weaponHash, 1)
	else
      GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 1, 0)
      SetCurrentPedWeapon(ped, weaponHash, 0)
	end

  if weaponHash == 218362403 then
      SetPedWeaponTintIndex(ped, weaponHash, 6)
  end
  
  if info and info.weaponTint then
    SetPedWeaponTintIndex(ped, weaponHash, info.weaponTint)
  end

  if weaponHash == 1692590063 and info and info.componentVariant then
    local variants = {
      ["1"] = 0x6218EEB8,
      ["2"] = 0xA4BF7400,
      ["3"] = 0x3F2DA8E2, -- cursed katana, never use this one
      ["4"] = 0x849233A6,
    }
    if variants[info.componentVariant] then
      GiveWeaponComponentToPed(ped, weaponHash, variants[info.componentVariant])
    end
  end
   
  AttachmentCheck(weaponHash)
  Citizen.Wait(500)
  cannotPullWeaponInAnimation = false
  ClearPedTasks(ped)
  Citizen.Wait(1200)
  
  unholsteringactive = false

end



function AttachmentCheck(weaponhash)

	if exports["rd-inventory"]:hasEnoughOfItem("weapon_silencer_assault", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_AR_SUPP` )
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_AR_SUPP_02` )
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, 0x3164BAB )
	end

	if exports["rd-inventory"]:hasEnoughOfItem("weapon_silencer_pistol", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_PI_SUPP_02` )
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_PI_SUPP` )	
	end

	if exports["rd-inventory"]:hasEnoughOfItem("weapon_oil_silencer", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, 1532150734 )
	end

	if exports["rd-inventory"]:hasEnoughOfItem("weaponscope", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_MEDIUM` )	
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_MACRO` )	
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, `COMPONENT_AT_SCOPE_SMALL` )	
	end

	if exports["rd-inventory"]:hasEnoughOfItem("weaponuziextended", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, 0xE40F1CD2 )	
	end
	if exports["rd-inventory"]:hasEnoughOfItem("weaponuzifoldstock", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, 0x8FBBD54C )		
	end
	if exports["rd-inventory"]:hasEnoughOfItem("weaponuziwoodstock", 1, false, true) then
		GiveWeaponComponentToPed( PlayerPedId(), weaponhash, 0x722C6CA6 )		
	end

end


function copunholster(weaponHash)
  local dic = "reaction@intimidation@cop@unarmed"
  local anim = "intro"
  local ammoCount = 0
   loadAnimDict( dic ) 

	local ped = PlayerPedId()
	RemoveAllPedWeaponsP(ped,weaponHash)

	TaskPlayAnim(ped, dic, anim, 10.0, 2.3, -1, 49, 1, 0, 0, 0 )

	Citizen.Wait(600)

    GiveWeaponToPed(ped, weaponHash, getAmmo(weaponHash), 0, 1)
	
	SetCurrentPedWeapon(ped, weaponHash, 1)
	ClearPedTasks(ped)

end

function RemoveAllPedWeaponsP(ped,weaponHash)
	local chute = false
	if HasPedGotWeapon(ped,`gadget_parachute`,false) then
		chute = true
	end
	RemoveAllPedWeapons(ped)
	if chute or weaponHash == '-72657034' then
		GiveWeaponToPed(ped, -72657034, 1, 0, 1)
	end
end

function copholster()

  local dic = "reaction@intimidation@cop@unarmed"
  local anim = "intro"
  local ammoCount = 0
   loadAnimDict( dic ) 

	local ped = PlayerPedId()
	prevupdate = 0
	updateAmmo()

	TaskPlayAnim(ped, dic, anim, 10.0, 2.3, -1, 49, 1, 0, 0, 0 )

	Citizen.Wait(600)
	SetCurrentPedWeapon(ped, UNARMED_HASH, 1)
	RemoveAllPedWeaponsP(ped,0)
	ClearPedTasks(ped)
end

function holster1h()
	unholsteringactive = true
	local dict = "reaction@intimidation@1h"
	local anim = "outro"
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == "police" or myJob == "doc" or myJob == "state" or myJob == "sheriff" or myJob == "ranger" then
		copholster()
		Citizen.Wait(600)
		unholsteringactive = false
		cannotPullWeaponInAnimation = false
		return
	end
	local ped = PlayerPedId()
	prevupdate = 0
	updateAmmo()
	local animLength = GetAnimDuration(dict, anim) * 1000
    loadAnimDict(dict) 
    TaskPlayAnim(ped, dict, anim, 1.0, 1.0, -1, 50, 0, 0, 0, 0)   
    Citizen.Wait(animLength - 2200)
    
    SetCurrentPedWeapon(ped, UNARMED_HASH, 1)
    Citizen.Wait(300)
    RemoveAllPedWeaponsP(ped,0)
    ClearPedTasks(ped)
    Citizen.Wait(800)
	unholsteringactive = false
	cannotPullWeaponInAnimation = false
end


exports('disableActionBar', function(pState)
  isActionBarDisabled = pState
end)