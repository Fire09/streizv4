
local FirstLowerDoorOpen = false
local SecondLowerDoorOpen = false
local drill, temp = nil, false
local lowerVautlCode = {}

RGS = {
    doorchecks = {
        {x = 235.2066, y = 229.7055, z = 97.1356, he = 280.000, h = GetHashKey("v_ilev_bk_vaultdoor"), status = 0,}
    },
    disableinput = false, -- don't change anything else unless you know what you are doing
    info = {},
    vault = {x = 235.2066, y = 229.7055, z = 97.1356, type = "v_ilev_bk_vaultdoor"},
    cur = 7,
}

Citizen.CreateThread(function()
    exports["rd-polytarget"]:AddBoxZone(
      "electricbox1",
      vector3(258.0246, 274.55, 105.63), 1.00, 1.00,
      {
        minZ=103.63,
        maxZ=107.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "electricbox1",
      {
        {
          event = "rd-heists:disruptelectricbox",
          id = "electricbox1_main",
          icon = "bolt",
          label = "Disrupt the Electrical System"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    ----------------------

    exports["rd-polytarget"]:AddBoxZone(
      "lower_rooms_door_1",
      vector3(247.289, 233.725, 97.6188), 1.00, 1.00,
      {
        minZ=95.63,
        maxZ=99.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lower_rooms_door_1",
      {
        {
          event = "rd-heists:lowerRoomsDoor",
          id = "lower_rooms_door_1_main",
          icon = "circle",
          label = "Hack"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-polytarget"]:AddBoxZone(
      "lower_rooms_door_2",
      vector3(241.7773, 218.4857, 97.6338), 1.00, 1.00,
      {
        minZ=95.63,
        maxZ=99.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lower_rooms_door_2",
      {
        {
          event = "rd-heists:lowerRoomsDoorSecond",
          id = "lower_rooms_door_2_main",
          icon = "circle",
          label = "Hack"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

  end)

RegisterNetEvent("rd-heists:succesdisruptelectricbox")
AddEventHandler("rd-heists:succesdisruptelectricbox", function()
    exports["rd-polytarget"]:AddBoxZone(
      "electricbox2",
      vector3(285.3655, 264.2815, 105.5623), 1.00, 1.00,
      {
        minZ=103.63,
        maxZ=107.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "electricbox2",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "electricbox2_main",
          icon = "bolt",
          label = "Disrupt the Electrical System"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )
end)

RegisterNetEvent("rd-heists:UpperMinigames")
AddEventHandler("rd-heists:UpperMinigames", function()

    -- First Room

    exports["rd-polytarget"]:AddBoxZone(
      "upperminigames1",
      vector3(260.5842, 205.4962, 110.2335), 1.00, 1.00,
      {
        minZ=108.2335,
        maxZ=111.2335
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "upperminigames1",
      {
        {
          event = "rd-heists:OpenLaptopFirst",
          id = "upperminigames1_main",
          icon = "laptop",
          label = "Open"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    -- Second Room

    exports["rd-polytarget"]:AddBoxZone(
        "upperminigames2",
        vector3(251.98, 208.8166, 110.3454), 1.00, 1.00,
        {
          minZ=108.2335,
          maxZ=111.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames2",
        {
          {
            event = "rd-heists:OpenLaptopSecond",
            id = "upperminigames2_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )

    -- Third Room

    exports["rd-polytarget"]:AddBoxZone(
        "upperminigames3",
        vector3(270.1702, 231.5602, 110.238), 1.00, 1.00,
        {
          minZ=108.2335,
          maxZ=111.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames3",
        {
          {
            event = "rd-heists:OpenLaptopThird",
            id = "upperminigames3_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )

      -- Fourth Room

      exports["rd-polytarget"]:AddBoxZone(
        "upperminigames4",
        vector3(261.5024, 234.7588, 110.2674), 1.00, 1.00,
        {
          minZ=108.2335,
          maxZ=111.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames4",
        {
          {
            event = "rd-heists:OpenLaptopFourth",
            id = "upperminigames4_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )

      -- Fifth Room

      exports["rd-polytarget"]:AddBoxZone(
        "upperminigames5",
        vector3(260.5514, 205.7241, 106.4433), 1.00, 1.00,
        {
          minZ=104.2335,
          maxZ=108.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames5",
        {
          {
            event = "rd-heists:OpenLaptopFifth",
            id = "upperminigames5_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )

      -- Sixth Room

      exports["rd-polytarget"]:AddBoxZone(
        "upperminigames6",
        vector3(252.0868, 208.6492, 106.3384), 1.00, 1.00,
        {
          minZ=104.2335,
          maxZ=108.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames6",
        {
          {
            event = "rd-heists:OpenLaptopSixth",
            id = "upperminigames6_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )
      
      -- Seventh Room

      exports["rd-polytarget"]:AddBoxZone(
        "upperminigames7",
        vector3(270.029, 231.573, 106.3883), 1.00, 1.00,
        {
          minZ=104.2335,
          maxZ=108.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames7",
        {
          {
            event = "rd-heists:OpenLaptopSeventh",
            id = "upperminigames7_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )
            
      -- Eighth Room

      exports["rd-polytarget"]:AddBoxZone(
        "upperminigames8",
        vector3(261.7155, 234.6507, 106.3483), 1.00, 1.00,
        {
          minZ=104.2335,
          maxZ=108.2335
        }
      );
    
      exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "upperminigames8",
        {
          {
            event = "rd-heists:OpenLaptopEighth",
            id = "upperminigames8_main",
            icon = "laptop",
            label = "Open"
          }
        },
        {
          distance = { radius = 2.0 }
        }
      )
end)

RegisterNetEvent("rd-heists:UpperMainDoorLaptop")
AddEventHandler("rd-heists:UpperMainDoorLaptop", function()

    -- First Room

    exports["rd-polytarget"]:AddBoxZone(
      "uppermainroomlaptop",
      vector3(279.0839, 213.1739, 110.2179), 1.00, 1.00,
      {
        minZ=108.2335,
        maxZ=111.2335
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "uppermainroomlaptop",
      {
        {
          event = "rd-heists:OpenLaptopMainRoom",
          id = "uppermainroomlaptop_main",
          icon = "laptop",
          label = "Open"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

end)

Citizen.CreateThread(function()

    exports["rd-polytarget"]:AddBoxZone(
      "lower_key_card",
      vector3(269.39, 223.77, 97.12), 1.00, 1.00,
      {
        minZ=95.2335,
        maxZ=99.2335
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lower_key_card",
      {
        {
          event = "rd-heists:PickupLeftKeycard",
          id = "lower_key_card_main",
          icon = "circle",
          label = "Pickup Left Keycard"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lower_key_card",
      {
        {
          event = "rd-heists:PickupRightKeycard",
          id = "lower_key_card_main2",
          icon = "circle",
          label = "Pickup Right Keycard"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

end)

AddEventHandler("rd-heists:PickupLeftKeycard", function()
  TriggerEvent('player:receiveItem',"heistentrycard", 1)
end)

AddEventHandler("rd-heists:PickupRightKeycard", function()
  TriggerEvent('player:receiveItem',"heistkeycard_vault", 1)
end)

RegisterNetEvent("rd-heists:OpenLaptopMainRoom")
AddEventHandler("rd-heists:OpenLaptopMainRoom", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  local OpenLaptopPassword = RPC.execute("rd-heists:OpenLaptopPassword")
  return OpenLaptopPassword
end)

RegisterNetEvent("rd-heists:LowerCodePeek")
AddEventHandler("rd-heists:LowerCodePeek", function(pPassword)

    exports["rd-polytarget"]:AddBoxZone(
      "lowerfirstdoor",
      vector3(267.5035, 213.2502, 97.64), 1.00, 1.00,
      {
        minZ=95.2335,
        maxZ=99.2335
      }
    );

    exports["rd-polytarget"]:AddBoxZone(
        "lowersecondtdoor",
        vector3(270.4584, 221.4009, 97.54), 1.00, 1.00,
        {
          minZ=95.2335,
          maxZ=99.2335
        }
      );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lowerfirstdoor",
      {
        {
          event = "rd-heists:OpenPasswordMenu",
          id = "lowerfirstdoor_main",
          icon = "passport",
          label = "Enter Password"
        }
      },
      {
        distance = { radius = 1.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "lowersecondtdoor",
        {
          {
            event = "rd-heists:OpenPasswordMenu",
            id = "lowersecondtdoor_main",
            icon = "passport",
            label = "Enter Password"
          }
        },
        {
          distance = { radius = 1.0 }
        }
      )
      lowerVautlCode = pPassword
end)

RegisterNetEvent("rd-heists:LowerCrackCodePeek")
AddEventHandler("rd-heists:LowerCrackCodePeek", function()

    exports["rd-polytarget"]:AddBoxZone(
      "lowerfirstdoor2",
      vector3(267.5035, 213.2502, 97.64), 1.00, 1.00,
      {
        minZ=95.2335,
        maxZ=99.2335
      }
    );

    exports["rd-polytarget"]:AddBoxZone(
        "lowersecondtdoo2r",
        vector3(270.4584, 221.4009, 97.54), 1.00, 1.00,
        {
          minZ=95.2335,
          maxZ=99.2335
        }
      );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "lowerfirstdoor2",
      {
        {
          event = "rd-heists:OpenLowerDoor:First",
          id = "lowerfirstdoor2_main",
          icon = "bug",
          label = "System Decrypt"
        }
      },
      {
        distance = { radius = 1.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
        "lowersecondtdoor",
        {
          {
            event = "rd-heists:OpenLowerDoor:Second",
            id = "lowersecondtdoor2_main",
            icon = "bug",
            label = "System Decrypt"
          }
        },
        {
          distance = { radius = 1.0 }
        }
      )

end)

RegisterNetEvent("rd-heists:OpenPasswordMenu")
AddEventHandler("rd-heists:OpenPasswordMenu", function()
    local riddlevPassword = exports["rd-input"]:showInput({
        {
            icon = "code",
            label = "Enter Password",
            name = "vault_password",
        },
    })

    if lowerVautlCode ~= riddlevPassword["vault_password"] then
        local PasswordConfirm = RPC.execute("rd-heists:PasswordConfirm")
        return PasswordConfirm,  print(json.encode(riddlevPassword))
    else
      print("FAILED")
    end
end)

RegisterNetEvent("rd-heists:OpenLowerDoor:First")
AddEventHandler("rd-heists:OpenLowerDoor:First", function()

exports['rd-vault']:OpenVaultGame(function(success)

    if success then
      FirstLowerDoorOpen = true
      local OpenLowerDoorFirst = RPC.execute("rd-heists:OpenLowerDoorFirst")
      return OpenLowerDoorFirst
    else
        local OpenLowerDoorFailed = RPC.execute("rd-heists:OpenLowerDoorFailed")
        return OpenLowerDoorFailed
    end
  end, 14, 20)

end)


RegisterNetEvent("rd-heists:OpenLowerDoor:Second")
AddEventHandler("rd-heists:OpenLowerDoor:Second", function()

exports['rd-vault']:OpenVaultGame(function(success)

    if success then
      SecondLowerDoorOpen = true
      local OpenLowerDoorSecond = RPC.execute("rd-heists:OpenLowerDoorSecond")
      return OpenLowerDoorSecond
    else
        local OpenLowerDoorFailed = RPC.execute("rd-heists:OpenLowerDoorFailed")
        return OpenLowerDoorFailed
    end
  end, 14, 20)

end)

RegisterNetEvent("rd-heists:OpenLowerDoors")
AddEventHandler("rd-heists:OpenLowerDoors", function()

  if not FirstLowerDoorOpen == true and SecondLowerDoorOpen == true then

    local OpenLowerDoorsFailed = RPC.execute("rd-heists:OpenLowerDoorFailed")
    return OpenLowerDoorsFailed

  else

    local OpenLowerDoorsSuccess = RPC.execute("rd-heists:OpenLowerDoorSuccess")
    return OpenLowerDoorsSuccess

  end
end)


-- Safe Cracking

Citizen.CreateThread(function()
  exports["rd-polytarget"]:AddBoxZone(
    "heist-safe",
    vector3(278.6387, 217.4219, 110.1751), 1.00, 1.00,
    {
      minZ=108.63,
      maxZ=112.63
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "heist-safe",
    {
      {
        event = "rd-heists:safecracking:start",
        id = "heist-safe_main",
        icon = "user-secret",
        label = "Safe Crack"
      }
    },
    {
      distance = { radius = 2.0 }
    }
  )
end)

RegisterNetEvent("rd-heists:safecracking:start")
AddEventHandler("rd-heists:safecracking:start", function()
			TriggerEvent("safecracking:loop",5,"safe:success")
			TriggerEvent("client:newStress",true,math.random(100))
end)

cracking = false
RegisterNetEvent("safecracking:loop")
AddEventHandler("safecracking:loop", function(difficulty,functionName)
	loadSafeTexture()
	loadSafeAudio()
	difficultySetting = {}
	for z = 1, difficulty do
		difficultySetting[z] = 1
	end
	curLock = 1
	factor = difficulty
	i = 0.0
	safelock = 0
	desirednum = math.floor(math.random(99))
	if desirednum == 0 then desirednum = 1 end
	openString = "lock_open"
	closedString = "lock_closed"
	cracking = true
	mybasepos = GetEntityCoords(PlayerPedId())
	dicks = 1
	local pinfall = false

	TriggerEvent("DoLongHudText","Press Shift+F or F to rotate, H to crack!")

	while cracking do

		 
		DisableControlAction(38, 0, true)
		DisableControlAction(44, 0, true)
		DisableControlAction(74, 0, true)

		if IsControlPressed(1, 21) and IsControlPressed(1, 23) then
			if dicks > 1 then
				i = i + 1.8
				PlaySoundFrontend( 0, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", true );

				dicks = 0
				crackingsafeanim(1)
			end
		end

		if IsControlPressed(1, 23) then

			if dicks > 1 then
				i = i - 1.8
				PlaySoundFrontend( 0, "TUMBLER_TURN", "SAFE_CRACK_SOUNDSET", true );
				dicks = 0
				crackingsafeanim(1)
			end
		end

		dicks = dicks + 0.2
		Citizen.Wait(1)

		if i < 0.0 then i = 360.0 end
		if i > 360.0 then i = 0.0 end

		safelock = math.floor(100-(i / 3.6))

		if #(mybasepos - GetEntityCoords(PlayerPedId())) > 1 or curLock > difficulty then
			cracking = false
		end

		if IsDisabledControlPressed(1, 74) and safelock ~= desirednum then
			Citizen.Wait(1000)
		end

		if safelock == desirednum then

			if not pinfall then
				PlaySoundFrontend( 0, "TUMBLER_PIN_FALL", "SAFE_CRACK_SOUNDSET", true );
				pinfall = true
			end

			if IsDisabledControlPressed(1, 74) then
				pinfall = false
				PlaySoundFrontend( 0, "TUMBLER_RESET", "SAFE_CRACK_SOUNDSET", true );
				factor = factor / 2
				i = 0.0
				safelock = 0
				desirednum = math.floor(math.random(99))
				crackingsafeanim(3)
				if desirednum == 0 then desirednum = 1 end
				difficultySetting[curLock] = 0
				curLock = curLock + 1
			end

		else
			pinfall = false
		end

		DrawSprite( "MPSafeCracking", "Dial_BG", 0.65, 0.5, 0.18, 0.32, 0, 255, 255, 211, 255 )
		DrawSprite( "MPSafeCracking", "Dial", 0.65, 0.5, 0.09, 0.16, i, 255, 255, 211, 255 )



		addition = 0.45
		xaddition = 0.58
		for x = 1, difficulty do

			if difficultySetting[x] ~= 1 then
				DrawSprite( "MPSafeCracking", openString, xaddition, addition, 0.012, 0.024, 0, 255, 255, 211, 255 )
			else
				DrawSprite( "MPSafeCracking", closedString, xaddition, addition, 0.012, 0.024, 0, 255, 255, 211, 255 )
			end

			addition = addition + 0.05

			if x == 10 or x == 20 or x == 30 then
				addition = 0.25
				xaddition = xaddition + 0.05
			end

		end

		--factor = factor / factor
		-- if factor < 1 then factor = 0.5 end

	end

	if curLock > difficulty then
		TriggerEvent(functionName)
	end
    resetAnim()
    local SuccessSafeCrack = RPC.execute("rd-heists:SuccessSafeCrack")
    return SuccessSafeCrack
end)

animsIdle = {}
animsIdle[1] = "idle_base"
animsIdle[2] = "idle_heavy_breathe"
animsIdle[3] = "idle_look_around"

animsSucceed = {}
animsSucceed[1] = "dial_turn_succeed_1"
animsSucceed[2] = "dial_turn_succeed_2"
animsSucceed[3] = "dial_turn_succeed_3"
animsSucceed[4] = "dial_turn_succeed_4"


function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

function resetAnim()
	 local player = GetPlayerPed( -1 )
	ClearPedSecondaryTask(player)
end

function crackingsafeanim(animType)
    local player = GetPlayerPed( -1 )
  	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "mini@safe_cracking" )


        if animType == 1 then

			if IsEntityPlayingAnim(player, "mini@safe_cracking", "dial_turn_anti_fast_1", 3) then
				--ClearPedSecondaryTask(player)
			else
				TaskPlayAnim(player, "mini@safe_cracking", "dial_turn_anti_fast_1", 8.0, -8, -1, 49, 0, 0, 0, 0)
			end	

	    end

        if animType == 2 then
	        TaskPlayAnim( player, "mini@safe_cracking", animsIdle[math.floor(math.ceil(4))], 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	    end

        if animType == 3 then
	        TaskPlayAnim( player, "mini@safe_cracking", animsSucceed[math.floor(math.ceil(4))], 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
	    end	

    end
end


function loadSafeTexture()
	RequestStreamedTextureDict( "MPSafeCracking", false );
	while not HasStreamedTextureDictLoaded( "MPSafeCracking" ) do
		Citizen.Wait(0)
	end
end

function loadSafeAudio()
	RequestAmbientAudioBank( "SAFE_CRACK", false )
end

function GetClosestPlayers(targetVector,dist)
	local players = GetPlayers()
	local ply = PlayerPedId()
	local plyCoords = targetVector
	local closestplayers = {}
	local closestdistance = {}
	local closestcoords = {}

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
			if(distance < dist) then
				valueID = GetPlayerServerId(value)
				closestplayers[#closestplayers+1]= valueID
				closestdistance[#closestdistance+1]= distance
				closestcoords[#closestcoords+1]= {targetCoords["x"], targetCoords["y"], targetCoords["z"]}

			end
		end
	end
	return closestplayers, closestdistance, closestcoords
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+10]= i
        end
    end

    return players
end

local validHeistBoxProp = {
    ["hei_prop_heist_wooden_box"] = true,
  }
  local heistBoxObjects = {}
  Citizen.CreateThread(function()
    for k, _ in pairs(validHeistBoxProp) do
        heistBoxObjects[#heistBoxObjects + 1] = GetHashKey(k)
    end
  end)

Citizen.CreateThread(function()
    exports["rd-interact"]:AddPeekEntryByModel(heistBoxObjects, {
      {
        id = "heist_removeBox",
        event = "rd-heist:client:removeBox",
        icon = "box",
        label = "Pickup",
      },
    }, 
    { 
      distance = { radius = 2.5 },
      isEnabled = function(pEntity, pContext)
        local objInfo = exports["rd-objects"]:GetObjectByEntity(pEntity)
        return objInfo ~= nil
      end
    })
  end)

  AddEventHandler("rd-heist:client:removeBox", function (pData, pEntity)
    local objInfo = exports["rd-objects"]:GetObjectByEntity(pEntity)
    if objInfo == nil then return end
  
    local finished = exports["rd-taskbar"]:taskBar(1000, "Destroying Box")
    ClearPedTasks(PlayerPedId())
    if finished ~= 100 then return end
    local plyPos = GetEntityCoords(PlayerPedId(), true)
    local heistBoxDeleted = GetClosestObjectOfType(plyPos.x, plyPos.y, plyPos.z, 1.0, GetHashKey("hei_prop_heist_wooden_box"), false)
  
    SetEntityAsMissionEntity(heistBoxDeleted, true, true)
    DeleteObject(heistBoxDeleted)
    SetEntityAsNoLongerNeeded(heistBoxDeleted)
    local deleted = true

    if not deleted then
      TriggerEvent("DoLongHudText", "Error while deleting object", 2)
    else
        RPC.execute("rd-heists:DeleteObjectSuccess")
    end
  end)

local heistboxItems = {
    ["heistbox"] = "hei_prop_heist_wooden_box",
}

local heistboxOffsets = {
    ["heistbox"] = 0.0
}

AddEventHandler("rd-inventory:itemUsed", function (name)
    if not heistboxItems[name] then return end
    placeheistbox(name)
end)

function placeheistbox (name)
    local result = exports['rd-objects']:PlaceAndSaveObject(
        heistboxItems[name],
        {},
        {
            groundSnap = true,
            zOffset = heistboxOffsets[name]
        }
    )
    if not result then
        return false
    end

    TriggerEvent('inventory:removeItem', name, 1)
end

RegisterNetEvent("rd-heists:ElectricBoxActivate")
AddEventHandler("rd-heists:ElectricBoxActivate", function()

    exports["rd-polytarget"]:AddBoxZone(
      "electrickactive",
      vector3(260.7123, 212.7911, 99.00), 1.00, 1.00,
      {
        minZ=98.0397,
        maxZ=101.0397
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "electrickactive",
      {
        {
          event = "rd-heists:ElectricBoxMinigameActivate",
          id = "electrickactive_main",
          icon = "keyboard",
          label = "Activate"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

end)

RegisterNetEvent("rd-heists:ElectricBoxMinigameActivate")
AddEventHandler("rd-heists:ElectricBoxMinigameActivate", function()

    exports['rd-hackdevice']:OpenDevice(function(success)
        if success then
            local SuccessHackDevice = RPC.execute("rd-heists:SuccessHackDevice")
            return SuccessHackDevice
        else
            local FailedHackDevice = RPC.execute("rd-heists:FailedHackDevice")
            return FailedHackDevice
        end
      end, 2, 15)

end)

Citizen.CreateThread(function()

    exports["rd-polytarget"]:AddBoxZone(
      "vaultdooropen",
      vector3(236.256, 231.8615, 97.53), 1.00, 1.00,
      {
        minZ=96.53,
        maxZ=99.53
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultdooropen",
      {
        {
          event = "rd-heists:OpenVaultDoor",
          id = "vaultdooropen_main",
          icon = "dungeon",
          label = "Hack"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

end)

RegisterNetEvent("rd-heists:OpenVaultDoor")
AddEventHandler("rd-heists:OpenVaultDoor", function()
    Citizen.CreateThread(function()
    exports['rd-hacking']:OpenHackingGame(20, 5, 5, function(Success)
        if Success then
            Citizen.Wait(20)
            local OpenVaultDoor = RPC.execute("rd-heists:OpenVaultDoor")
            return OpenVaultDoor
        else
            local FailedOpenVaultDoor = RPC.execute("rd-heists:FailedOpenVaultDoor")
            return FailedOpenVaultDoor
        end
        end)
    end)
end)

RegisterNetEvent("rd-heists:VaultDoorDrillPoly")
AddEventHandler("rd-heists:VaultDoorDrillPoly", function()
exports["rd-polytarget"]:AddBoxZone(
    "vaultdoordrill",
    vector3(235.6633, 229.5982, 97.69), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "vaultdoordrill",
    {
      {
        event = "rd-heists:OpenDrill",
        id = "vaultdoordrill_main",
        icon = "wrench",
        label = "Drill"
      }
    },
    {
      distance = { radius = 2.0 }
    }
  )

end)

function attachObject()
	drill = CreateObject(`hei_prop_heist_drill`, 0, 0, 0, true, true, true)
	AttachEntityToEntity(drill, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 64017), 0.100, 0.0250, 0.018, 0.024, 35.0, 73.0, true, true, false, true, 1, true)
end

function DrillStartAnim()
	if not temp then
		RequestAnimDict("anim@heists@fleeca_bank@drilling")
		while not HasAnimDictLoaded("anim@heists@fleeca_bank@drilling") do
			Citizen.Wait(0)
		end
		attachObject()
		TaskPlayAnim(PlayerPedId(), "anim@heists@fleeca_bank@drilling", "drill_straight_idle", 8.0, 8.0, -1, 1, 0, false, false, false)
		temp = true
	end
end

function DrillStopAnim()
	StopAnimTask(PlayerPedId(), "anim@heists@fleeca_bank@drilling", "drill_straight_idle" ,8.0, -8.0, -1, 50, 0, false, false, false)
	DeleteObject(drill)
	temp = false
	drill = nil
end

RegisterNetEvent("rd-heists:OpenDrill")
AddEventHandler("rd-heists:OpenDrill", function()
    Citizen.CreateThread(function()
      DrillStartAnim()
    TriggerEvent("rd-drilling:start",function(success)
        if (success) then
            Citizen.Wait(300)
            DrillStopAnim()
            TriggerServerEvent("rd-heists:OpenVaultDoor:Server", method)
        else
            DrillStopAnim()
            TriggerEvent("DoLongHudText","Drilling Failed",2)
        end
      end)
    end)
end)

 RegisterNetEvent("rd-heists:OpenVaultDoor:Client")
 AddEventHandler("rd-heists:OpenVaultDoor:Client", function(method)
     TriggerEvent("rd-heists:OpenVaultDoor:Success", method)
 end)
 RegisterNetEvent("rd-heists:OpenVaultDoor:Success")
 AddEventHandler("rd-heists:OpenVaultDoor:Success", function(method)
     local obj = GetClosestObjectOfType(RGS.vault.x, RGS.vault.y, RGS.vault.z, 15.0, GetHashKey(RGS.vault.type), false, false, false)
     local count = 0
 
     if method == 1 then
         repeat
             local rotation = GetEntityHeading(obj) - 1.00
 
             SetEntityHeading(obj, 1.00)
             count = count + 1
             Citizen.Wait(10)
         until count == 3600000
     else
         repeat
             local rotation = GetEntityHeading(obj) + 1.00
 
             SetEntityHeading(obj, -10.00)
             count = count + 1
             Citizen.Wait(10)
         until count == 3600000
     end
     FreezeEntityPosition(obj, true)
 end)

RegisterNetEvent('rd-heists:vault:ServerCreateTolleys')
AddEventHandler('rd-heists:vault:ServerCreateTolleys', function()
TriggerEvent("rd-heists:vault:CreateTrolleys", true)
end)  

RegisterNetEvent('rd-heists:vault:lootCashtray')
AddEventHandler('rd-heists:vault:lootCashtray', function()
    TriggerServerEvent('rd-heists:cash_tray')
end)

RegisterNetEvent("rd-heists:vault:grabFromTray")
AddEventHandler("rd-heists:vault:grabFromTray", function()
    local chance = math.random(120)
    Loot()
    if chance < 25 then
		TriggerEvent("player:receiveItem",'heistusb1', 1)
        TriggerEvent('rd-mining:get_gem')
	end
    TriggerEvent("player:receiveItem", "inkset",math.random(25, 50))
    TriggerEvent("player:receiveItem", "inkedmoneybag",math.random(1, 2))
end)

function Loot()
    Grab2clear = false
    Grab3clear = false
    Trolley = nil
    local ped = PlayerPedId()
    local model = "hei_prop_heist_cash_pile"
    Trolley = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `hei_prop_hei_cash_trolly_01`, false, false, false)
    local CashAppear = function()
        local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)
        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(0)
        end
        local grabobj = CreateObject(grabmodel, pedCoords, true)
        FreezeEntityPosition(grabobj, true)
        SetEntityInvincible(grabobj, true)
        SetEntityNoCollisionEntity(grabobj, ped)
        SetEntityVisible(grabobj, false, false)
        AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
        local startedGrabbing = GetGameTimer()
        Citizen.CreateThread(function()
            while GetGameTimer() - startedGrabbing < 37000 do
                Citizen.Wait(0)
                DisableControlAction(0, 73, true)
                if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
                    if not IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, true, false)
                    end
                end
                if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                    end
                end
            end
            DeleteObject(grabobj)
        end)
    end
    local emptyobj = `ch_prop_gold_trolly_01c_empty`
    if IsEntityPlayingAnim(Trolley, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
        return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(0)
    end
    while not NetworkHasControlOfEntity(Trolley) do
        Citizen.Wait(0)
        NetworkRequestControlOfEntity(Trolley)
    end
    GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(Grab1)
    Citizen.Wait(1500)
    CashAppear()
    if not Grab2clear then
        Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(Trolley, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab2)
        Citizen.Wait(37000)
    end
    if not Grab3clear then
        Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab3)
        NewTrolley = CreateObject(emptyobj, GetEntityCoords(Trolley) + vector3(0.0, 0.0, - 0.985), true, false, false)
        SetEntityRotation(NewTrolley, GetEntityRotation(Trolley))
        DeleteObject(Trolley)
        while DoesEntityExist(Trolley) do
            Citizen.Wait(0)
            DeleteEntity(Trolley)
        end
        PlaceObjectOnGroundProperly(NewTrolley)
        SetEntityAsMissionEntity(NewTrolley, 1, 1)
        Citizen.SetTimeout(5000, function()
            DeleteObject(NewTrolley)
            while DoesEntityExist(NewTrolley) do
              Citizen.Wait(0)
              DeleteEntity(NewTrolley)
            end
        end)
    end
    Citizen.Wait(1800)
    if DoesEntityExist(GrabBag) then
        DeleteEntity(GrabBag)
    end
    RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
    SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
    TriggerServerEvent("zyloz-pacificbank:giveMoney")
end

function LootGold()
    Grab2clear = false
    Grab3clear = false
    Trolley = nil
    local ped = PlayerPedId()
    local model = "prop_gold_bar"
    Trolley = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 1.0, `ch_prop_gold_trolly_01c`, false, false, false)
    local CashAppear = function()
        local pedCoords = GetEntityCoords(ped)
        local grabmodel = GetHashKey(model)
        RequestModel(grabmodel)
        while not HasModelLoaded(grabmodel) do
            Citizen.Wait(0)
        end
        local grabobj = CreateObject(grabmodel, pedCoords, true)
        FreezeEntityPosition(grabobj, true)
        SetEntityInvincible(grabobj, true)
        SetEntityNoCollisionEntity(grabobj, ped)
        SetEntityVisible(grabobj, false, false)
        AttachEntityToEntity(grabobj, ped, GetPedBoneIndex(ped, 60309), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 0, true)
        local startedGrabbing = GetGameTimer()
        Citizen.CreateThread(function()
            while GetGameTimer() - startedGrabbing < 37000 do
                Citizen.Wait(0)
                DisableControlAction(0, 73, true)
                if HasAnimEventFired(ped, GetHashKey("CASH_APPEAR")) then
                    if not IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, true, false)
                    end
                end
                if HasAnimEventFired(ped, GetHashKey("RELEASE_CASH_DESTROY")) then
                    if IsEntityVisible(grabobj) then
                        SetEntityVisible(grabobj, false, false)
                    end
                end
            end
            DeleteObject(grabobj)
        end)
    end
    local emptyobj = `ch_prop_gold_trolly_01c_empty`
    if IsEntityPlayingAnim(Trolley, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 3) then
        return
    end
    local baghash = GetHashKey("hei_p_m_bag_var22_arm_s")
    RequestAnimDict("anim@heists@ornate_bank@grab_cash")
    RequestModel(baghash)
    RequestModel(emptyobj)
    while not HasAnimDictLoaded("anim@heists@ornate_bank@grab_cash") and not HasModelLoaded(emptyobj) and not HasModelLoaded(baghash) do
        Citizen.Wait(0)
    end
    while not NetworkHasControlOfEntity(Trolley) do
        Citizen.Wait(0)
        NetworkRequestControlOfEntity(Trolley)
    end
    GrabBag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), GetEntityCoords(PlayerPedId()), true, false, false)
    Grab1 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, Grab1, "anim@heists@ornate_bank@grab_cash", "intro", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(GrabBag, Grab1, "anim@heists@ornate_bank@grab_cash", "bag_intro", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(Grab1)
    Citizen.Wait(1500)
    CashAppear()
    if not Grab2clear then
        Grab2 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab2, "anim@heists@ornate_bank@grab_cash", "grab", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab2, "anim@heists@ornate_bank@grab_cash", "bag_grab", 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(Trolley, Grab2, "anim@heists@ornate_bank@grab_cash", "cart_cash_dissapear", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab2)
        Citizen.Wait(37000)
    end
    if not Grab3clear then
        Grab3 = NetworkCreateSynchronisedScene(GetEntityCoords(Trolley), GetEntityRotation(Trolley), 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, Grab3, "anim@heists@ornate_bank@grab_cash", "exit", 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(GrabBag, Grab3, "anim@heists@ornate_bank@grab_cash", "bag_exit", 4.0, -8.0, 1)
        NetworkStartSynchronisedScene(Grab3)
        NewTrolley = CreateObject(emptyobj, GetEntityCoords(Trolley) + vector3(0.0, 0.0, - 0.985), true, false, false)
        SetEntityRotation(NewTrolley, GetEntityRotation(Trolley))
        DeleteObject(Trolley)
        while DoesEntityExist(Trolley) do
            Citizen.Wait(0)
            DeleteEntity(Trolley)
        end
        PlaceObjectOnGroundProperly(NewTrolley)
        SetEntityAsMissionEntity(NewTrolley, 1, 1)
        Citizen.SetTimeout(5000, function()
            DeleteObject(NewTrolley)
            while DoesEntityExist(NewTrolley) do
              Citizen.Wait(0)
              DeleteEntity(NewTrolley)
            end
        end)
    end
    Citizen.Wait(1800)
    if DoesEntityExist(GrabBag) then
        DeleteEntity(GrabBag)
    end
    RemoveAnimDict("anim@heists@ornate_bank@grab_cash")
    SetModelAsNoLongerNeeded(emptyobj)
    SetModelAsNoLongerNeeded(GetHashKey("hei_p_m_bag_var22_arm_s"))
end

RegisterNetEvent('rd-heists:vault:lootGoldtray')
AddEventHandler('rd-heists:vault:lootGoldtray', function()
    TriggerServerEvent('rd-heists:vault:lootTrayGolds')
end)

RegisterNetEvent("rd-heists:vault:GrabTrolleys")
AddEventHandler("rd-heists:vault:GrabTrolleys", function()
    local chance = math.random(120)
    LootGold()
    if chance < 25 then
		TriggerEvent("player:receiveItem",'goldbar', 3)
	end
    TriggerEvent("player:receiveItem", "goldbar",math.random(4,15))
end)


RegisterNetEvent('rd-heists:vault:CreateTrolleys')
AddEventHandler('rd-heists:vault:CreateTrolleys', function(toggle)
    if toggle == true then
    cashTrolley = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"),  232.0563, 233.2187, 96.11, true,  true, true)
    CreateObject(cashTrolley)
    SetEntityHeading(cashTrolley, 101.55)
    FreezeEntityPosition(cashTrolley, true)

    cashTrolleySecond = CreateObject(GetHashKey("hei_prop_hei_cash_trolly_01"), 228.0918, 234.918, 96.11, true,  true, true)
    CreateObject(cashTrolleySecond)
    SetEntityHeading(cashTrolleySecond, 198.34)
    FreezeEntityPosition(cashTrolleySecond, true) 

    goldTrolley = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 225.4181, 226.8245, 96.11, true,  true, true) 
    CreateObject(goldTrolley)
    SetEntityHeading(goldTrolley, 308.35)
    FreezeEntityPosition(goldTrolley, true)

    goldTrolleySecond = CreateObject(GetHashKey("ch_prop_gold_trolly_01c"), 228.7167, 225.6992, 96.11, true,  true, true) 
    CreateObject(goldTrolleySecond)
    SetEntityHeading(goldTrolleySecond, 318.78)
    FreezeEntityPosition(goldTrolleySecond, true)  


    elseif toggle == false then
        DeleteObject(cashTrolley)
        DeleteObject(cashTrolleySecond)
        DeleteObject(goldTrolley)
        DeleteObject(goldTrolleySecond)
    end
end)

RegisterNetEvent("rd-heists:vaultlowerroom")
AddEventHandler("rd-heists:vaultlowerroom", function()
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom1",
      vector3(240.1457, 214.3684, 97.61), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom2",
      vector3(245.1075, 212.6672, 97.47), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom3",
      vector3(241.1475, 209.2611, 97.50), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom1",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom1_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom2",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom2_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom2",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom3_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )
end)

RegisterNetEvent("rd-heists:vaultlowerroomsec")
AddEventHandler("rd-heists:vaultlowerroomsec", function()
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom1sec",
      vector3(252.7156, 241.1717, 97.35), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom2sec",
      vector3(254.106, 236.2023, 97.45), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-polytarget"]:AddBoxZone(
      "vaultlowerroom3sec",
      vector3(248.0056, 238.438, 97.55), 1.00, 1.00,
      {
        minZ=96.63,
        maxZ=99.63
      }
    );
  
    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom1sec",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom1sec_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom2sec",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom2sec_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )

    exports["rd-interact"]:AddPeekEntryByPolyTarget(
      "vaultlowerroom3sec",
      {
        {
          event = "rd-heists:disruptelectricbox2",
          id = "vaultlowerroom3sec_main",
          icon = "user-secret",
          label = "Rob"
        }
      },
      {
        distance = { radius = 2.0 }
      }
    )
end)

RegisterNetEvent("rd-heists:lowerRoomsDoor")
AddEventHandler("rd-heists:lowerRoomsDoor", function()
    Citizen.CreateThread(function()
    exports['rd-hacking']:OpenHackingGame(20, 5, 5, function(Success)
        if Success then
            Citizen.Wait(20)
            local OpenVaultDoor = RPC.execute("rd-heists:lowerRoomsDoor")
            return OpenVaultDoor
        else
            local FailedOpenVaultDoor = RPC.execute("rd-heists:FailedOpenVaultDoor")
            return FailedOpenVaultDoor
        end
        end)
    end)
end)

RegisterNetEvent("rd-heists:lowerRoomsDoorSecond")
AddEventHandler("rd-heists:lowerRoomsDoorSecond", function()
    Citizen.CreateThread(function()
    exports['rd-hacking']:OpenHackingGame(20, 5, 5, function(Success)
        if Success then
            Citizen.Wait(20)
            local OpenVaultDoor = RPC.execute("rd-heists:lowerRoomsDoorSecond")
            return OpenVaultDoor
        else
            local FailedOpenVaultDoor = RPC.execute("rd-heists:FailedOpenVaultDoor")
            return FailedOpenVaultDoor
        end
        end)
    end)
end)

RegisterCommand("lowerRoomPoly", function()
  TriggerEvent("rd-heists:lowerRoom:Poly")
end)

RegisterNetEvent("rd-heists:lowerRoom:PolySecond")
AddEventHandler("rd-heists:lowerRoom:PolySecond", function()
exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly1",
    vector3(253.81977844238,236.41319274902,97.572143554688), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly1",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly1_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

  exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly2",
    vector3(248.92747497559,238.29890441895,97.403686523438), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly2",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly2_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

  exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly3",
    vector3(252.50109863281,241.01538085938,97.656372070312), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly3",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly3_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

end)

RegisterNetEvent("rd-heists:lowerRoom:Poly")
AddEventHandler("rd-heists:lowerRoom:Poly", function()
exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly4",
    vector3(240.10549926758,213.91648864746,97.437377929688), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly4",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly4_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

  exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly5",
    vector3(245.32746887207,212.20220947266,97.386840820312), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly5",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly5_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

  exports["rd-polytarget"]:AddBoxZone(
    "lowerRoom_poly6",
    vector3(241.12088012695,209.64395141602,97.555297851562), 1.00, 1.00,
    {
      minZ=96.53,
      maxZ=98.53
    }
  );

  exports["rd-interact"]:AddPeekEntryByPolyTarget(
    "lowerRoom_poly6",
    {
      {
        event = "rd-heists:lowerRoomDoorsOpen",
        id = "lowerRoom_poly6_main",
        icon = "circle",
        label = "Open"
      }
    },
    {
      distance = { radius = 6.0 }
    }
  )

end)

AddEventHandler("rd-heists:lowerRoomDoorsOpen", function()
  local closePlayers = GetClosestPlayers(GetEntityCoords(PlayerPedId()), 20.0)
  local missionplayers = {}
  local ply = PlayerId()

  for i = 1, #closePlayers, 1 do
      if closePlayers[i] ~= ply then
          table.insert(missionplayers, GetPlayerServerId(closePlayers[i]))
      end
  end

  exports['rd-slider']:OpenSliderGame(function(success)
    if success then    
      OpenLaptopSeventh = true
    TriggerEvent("rd-heists:lowerRoomDoorsOpenDrill")
    else
      local FailedOpenMainDoor = RPC.execute("rd-heists:FailedOpenMainDoor")
      return FailedOpenMainDoor
    end
  end, 8, 5)

end)

RegisterNetEvent("rd-heists:lowerRoomDoorsOpenDrill")
AddEventHandler("rd-heists:lowerRoomDoorsOpenDrill", function()
    Citizen.CreateThread(function()
      DrillStartAnim()
    TriggerEvent("rd-drilling:start",function(success)
        if (success) then
            Citizen.Wait(300)
            DrillStopAnim()
            local success = RPC.execute("heists:SuccessRobbery")
            return success
        else
            DrillStopAnim()
            TriggerEvent("DoLongHudText","Drilling Failed",2)
        end
      end)
    end)
end)

local riddlevtTest = true
local validTrolleyProp = {
  ["hei_prop_hei_cash_trolly_01"] = true,
}
local heistTrolleyObjects = {}
Citizen.CreateThread(function()
  for k, _ in pairs(validTrolleyProp) do
    heistTrolleyObjects[#heistTrolleyObjects + 1] = GetHashKey(k)
  end
end)

Citizen.CreateThread(function()
  exports["rd-interact"]:AddPeekEntryByModel(heistTrolleyObjects, {
    {
      id = "heist_trolley",
      event = "rd-heists:vault:grabFromTray",
      icon = "circle",
      label = "Grab",
    },
  }, 
  { 
    distance = { radius = 2.5 },

  })
end)

local validTrolleyProp2 = {
  ["ch_prop_gold_trolly_01c"] = true,
}
local heistTrolleyObjects2 = {}
Citizen.CreateThread(function()
  for k, _ in pairs(validTrolleyProp2) do
    heistTrolleyObjects2[#heistTrolleyObjects2 + 1] = GetHashKey(k)
  end
end)

Citizen.CreateThread(function()
  exports["rd-interact"]:AddPeekEntryByModel(heistTrolleyObjects2, {
    {
      id = "heist_trolleys",
      event = "rd-heists:vault:GrabTrolleys",
      icon = "circle",
      label = "Grab",
    },
  }, 
  { 
    distance = { radius = 2.5 },

  })
end)

Citizen.CreateThread(function()
exports["rd-polytarget"]:AddBoxZone(
  "lowertwodooropen",
  vector3(227.8505, 228.2262, 97.68548), 1.00, 1.00,
  {
    minZ=96.0397,
    maxZ=99.0397
  }
);

exports["rd-interact"]:AddPeekEntryByPolyTarget(
  "lowertwodooropen",
  {
    {
      event = "rd-heists:lowertwodooropen",
      id = "lowertwodooropen_main",
      icon = "keyboard",
      label = "Open Door"
    }
  },
  {
    distance = { radius = 2.0 }
  }
)
end)

AddEventHandler("rd-heists:lowertwodooropen", function()
  if exports["rd-inventory"]:hasEnoughOfItem("heistentrycard", 1) then
    TriggerEvent('rd-doors:change-lock-state', 1112, false)
    if exports["rd-inventory"]:hasEnoughOfItem("heistkeycard_vault", 1) then
      TriggerEvent('rd-doors:change-lock-state', 1113, false)
    end
  end
end)


