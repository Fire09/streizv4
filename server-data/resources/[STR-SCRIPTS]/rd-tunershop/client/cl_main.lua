RegisterNetEvent('FinishMoneyCheckForVehtuner')
RegisterNetEvent('tunerShop:SpawnVeh')
local vehshop_blips = {}
local buyPlate = {}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local vehicle_price = 0
local backlock = false
local firstspawn = 0
local commissionbuy = 0
local rank = 0

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
local currentCarSpawnLocation = 0
local ownerMenu = false

local vehshopDefault = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Cycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Job Vehicles", description = ''},
			}
		},
		["jobvehicles"] = {
			title = "job vehicles",
			name = "job vehicles",
			buttons = {
				{name = "Taxi Cab", costs = 4000, description = {}, model = "taxi"},
				{name = "Flat Bed", costs = 5000, description = {}, model = "flatbed"},
				{name = "News Rumpo", costs = 5000, description = {}, model = "rumpo"},
			}
		},
		["cycles"] = {
			title = "cycles",
			name = "cycles",
			buttons = {
				{name = "BMX", costs = 200, description = {}, model = "bmx"},
				{name = "Cruiser", costs = 250, description = {}, model = "cruiser"},
				{name = "Fixter", costs = 400, description = {}, model = "fixter"},
				{name = "Scorcher", costs = 200, description = {}, model = "scorcher"},
				{name = "Pro 1", costs = 600, description = {}, model = "tribike"},
				{name = "Pro 2", costs = 600, description = {}, model = "tribike2"},
				{name = "Pro 3", costs = 600, description = {}, model = "tribike3"},
			}
		},		
	}
}

vehshop = vehshopDefault
local vehshopOwner = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	menu = {
		x = 0.14,
		y = 0.15,
		width = 0.12,
		height = 0.03,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.29,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "6rd-Vehicles", description = ''},
				{name = "Tuner Vehicles", description = ''},
			}
		},
		["6rd-vehicles"] = {
			title = "6rd-vehicles",
			name = "6rd-vehicles",
			buttons = {
				{name = "Ellie 6STR", costs = 750000, description = {}, model = "ellie6str"},
				{name = "BeaterGauntlet 6STR", costs = 700000, description = {}, model = "gauntlet6str"},
				{name = "Ruiner 6STR", costs = 750000, description = {}, model = "ruiner6str"},
				{name = "Hellion", costs = 350000, description = {}, model = "hellion6str"},
				{name = "Yosemite 6STR", costs = 450000, description = {}, model = "yosemite6str"},
				{name = "Futo 6STR", costs = 450000, description = {}, model = "futo3"},
				{name = "Deluxo 6STR", costs = 850000, description = {}, model = "deluxo6str"},
				{name = "Hustler 6STR", costs = 1500000, description = {}, model = "hustler6str"},
				{name = "Schwartzer 6STR", costs = 450000, description = {}, model = "schwarzer2"},
				{name = "Sentinel 6STR", costs = 750000, description = {}, model = "sentinel6str"},
				{name = "Sentinel Classic 6STR", costs = 450000, description = {}, model = "sentinel6str2"},
				{name = "Pigalle 6STR", costs = 400000, description = {}, model = "pigalle6str"},
			}
		},
		["tuner_cars"] = {
			title = "tuner_cars",
			name = "tuner_cars",
			buttons = {
				{name = "Kawasaki ZX-10", costs = 350000, description = {}, model = "zx10"},
				{name = "BMW R", costs = 350000, description = {}, model = "bmwr"},
				{name = "Yamaha R1", costs = 350000, description = {}, model = "R1"},
				{name = "Charger 1969", costs = 750000, description = {}, model = "69charger"},
				{name = "Challenger Demon", costs = 850000, description = {}, model = "demon"},
				{name = "Challenger Raid", costs = 950000, description = {}, model = "raid"},
				{name = "Lambo", costs = 1000000, description = {}, model = "lpi8004"},
				{name = "Nissan Skyline R33", costs = 800000, description = {}, model = "R33"},
				{name = "Stratumc", costs = 700000, description = {}, model = "stratumc"},
				{name = "Lexus LC500", costs = 950000, description = {}, model = "lc500"},
				{name = "Starone", costs = 700000, description = {}, model = "starone"},
				{name = "BT62-R", costs = 1500000, description = {}, model = "bt62r"},
				--{name = "Valkyrie", costs = 1500000, description = {}, model = "valkyrietp"},
				{name = "Aventador LP700", costs = 850000, description = {}, model = "lp700"},
				{name = "LFA", costs = 950000, description = {}, model = "lfa"},
				{name = "Carrera GT", costs = 1450000, description = {}, model = "cgt"},
				{name = "Skyline R32 GT-R", costs = 800000, description = {}, model = "r32"},
				{name = "M4 Competition", costs = 750000, description = {}, model = "m4"},
				{name = "R8 Hycade", costs = 1250000, description = {}, model = "r8h"},
				{name = "NSX", costs = 850000, description = {}, model = "filthynsx"},
				{name = "Continental GT Dragon", costs = 700000, description = {}, model = "bdragon"},
				{name = "BMW M3 E36", costs = 850000, description = {}, model = "e36prb"},
				{name = "BMW M3 E46", costs = 950000, description = {}, model = "m3e46"},
				{name = "Davidson Fatboy", costs = 350000, description = {}, model = "rudiharley"},
				{name = "Integra Type-R DC5", costs = 450000, description = {}, model = "dc5"},
				{name = "NSX NA1", costs = 750000, description = {}, model = "na1"},
				{name = "Diablo GTR", costs = 750000, description = {}, model = "500gtrlam"},
				{name = "Lexus RCF", costs = 700000, description = {}, model = "rcf"},
				{name = "Lancer Evolution VI GSR TME", costs = 750000, description = {}, model = "cp9a"},
				{name = "Lancer Evolution IX MR FQ-400", costs = 850000, description = {}, model = "evo9"},
				{name = "GT-R R35", costs = 900000, description = {}, model = "gtr"},
				{name = "GT-R R35 L", costs = 1000000, description = {}, model = "r35"},
				{name = "Skyline GTR R34", costs = 800000, description = {}, model = "fnf4r34"},
				{name = "Silvia S15", costs = 850000, description = {}, model = "s15rb"},
				{name = "Supra 90's", costs = 760000, description = {}, model = "a80"},
				{name = "Supra 2020", costs = 950000, description = {}, model = "tsgr20"},
				{name = "Sultan RSV8", costs = 950000, description = {}, model = "SULTANRSV8"},
				{name = "Tampa Drift edition", costs = 650000, description = {}, model = "tampa5"},
				{name = "Aston Martin DB11", costs = 1000000, description = {}, model = "db11"},
				{name = "Mclaren Senna", costs = 1000000, description = {}, model = "senna"},
				{name = "Bugatti Chiron", costs = 1000000, description = {}, model = "chiron17"},
				{name = "Pagani", costs = 1000000, description = {}, model = "bc"},
				{name = "Laferrari", costs = 1000000, description = {}, model = "laferrari17"},
				{name = "Bugatti Divo", costs = 1000000, description = {}, model = "DIVO"},
				{name = "Audi A6", costs = 700000, description = {}, model = "a6"},
				{name = "Alfa Romeo", costs = 740000, description = {}, model = "gtam21"},
				{name = "BMW M3 E30", costs = 840000, description = {}, model = "m3e30"},
				{name = "Pourche GTS 3", costs = 950000, description = {}, model = "pgt322"},
				{name = "Dodge Viper", costs = 850000, description = {}, model = "acr"},
				{name = "Aston Martin Vulcan", costs = 1000000, description = {}, model = "VULCAN"},
				{name = "Jeep Grand Cherokee", costs = 450000, description = {}, model = "SRT8B"},
				{name = "BMW M2", costs = 740000, description = {}, model = "m2f22"},
				{name = "Honda Odyssey", costs = 450000, description = {}, model = "honody"},
				{name = "Veloster N", costs = 500000, description = {}, model = "veln"},
				{name = "Kia GT", costs = 450000, description = {}, model = "kiagt"},
				{name = "Mazda RX7", costs = 550000, description = {}, model = "mfc"},
				{name = "Nissan 350z", costs = 500000, description = {}, model = "maj350z"},
				{name = "Silvia S14", costs = 850000, description = {}, model = "s14"},
				{name = "Silvia S14 Boss", costs = 950000, description = {}, model = "s14boss"},
				{name = "Subi Impreza", costs = 750000, description = {}, model = "22b"},
				{name = "BMW M5", costs = 780000, description = {}, model = "22m5"},
				{name = "Ford focus RS", costs = 480000, description = {}, model = "ffrs"},
				{name = "AMG A45", costs = 550000, description = {}, model = "a45amg"},
				{name = "Mercedes Benz C63", costs = 550000, description = {}, model = "mbc63"},
				{name = "Toyota GT86", costs = 750000, description = {}, model = "gt86"},
				{name = "Porsche 930", costs = 650000, description = {}, model = "por930"},
				{name = "McLaren 675LT", costs = 1000000, description = {}, model = "675ltsp"},
				{name = "McLaren 720S", costs = 1000000, description = {}, model = "720s"},
				{name = "AMG Black Seires", costs = 700000, description = {}, model = "gtrc"},
				{name = "Toyota LC500", costs = 550000, description = {}, model = "lc500"},
				{name = "HSV GTS", costs = 550000, description = {}, model = "bluecunt"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {
	{
		entering = {126.88586, -3011.494, 7.0223045},
		inside = {-37.94512, -1053.851, -43.42375},
		outside = {126.88586, -3011.494, 7.0223045},
	}
}

local carspawns = {
	[1] =  { ['x'] = 134.62208, ['y'] = -3046.049, ['z'] = 6.6357007, ['h'] = 324.58984, ['info'] = ' Car Spot 1' },
	[2] =  { ['x'] = 138.94248, ['y'] = -3046.172, ['z'] = 6.3291606, ['h'] = 328.91287, ['info'] = ' Car Spot 2' },
	[3] =  { ['x'] = 145.06944, ['y'] = -3047.399, ['z'] = 6.3196263, ['h'] = 320.13928, ['info'] = ' Car Spot 3' },
	[4] =  { ['x'] = 150.54808, ['y'] = -3041.22, ['z'] = 6.3427586, ['h'] = 54.906009, ['info'] = ' Car Spot 4' },
	[5] =  { ['x'] = 124.84173, ['y'] = -3022.919, ['z'] = 6.4359374, ['h'] = 239.94905, ['info'] = ' Car Spot 5' },
}

local carTable = { 
	[1] = { ["model"] = "gtr", ["baseprice"] = 100000, ["commission"] = 15 },
	[2] = { ["model"] = "gt86", ["baseprice"] = 100000, ["commission"] = 15 },
	[3] = { ["model"] = "sultanrsv8", ["baseprice"] = 50000, ["commission"] = 15 },
	[4] = { ["model"] = "gtrc", ["baseprice"] = 100000, ["commission"] = 15 },
}

function updateCarTable(model,price,name)
	for i=1, #carTable do
		carTable[currentCarSpawnLocation]["id"] = i
		carTable[currentCarSpawnLocation]["model"] = model
		carTable[currentCarSpawnLocation]["baseprice"] = price
		carTable[currentCarSpawnLocation]["name"] = name
		TriggerServerEvent("rd-tunershop:CarTableTunerShop",carTable)
	end
end

local myspawnedvehs = {}

RegisterNetEvent("rd-tunershop:testdrive")
AddEventHandler("rd-tunershop:testdrive", function()
	if exports["rd-business"]:IsEmployedAt("tuner") or #(vector3(144.35664, -3005.489, 7.0309138) - GetEntityCoords(PlayerPedId())) > 50.0 then

	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end

	local model = GetEntityModel(veh)
	local veh = GetClosestVehicle(133.30462, -2994.638, 7.0309133, 3.000, 0, 70)

	if not DoesEntityExist(veh) then

		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,133.30462, -2994.638, 7.0309133, 4.2229189,true,true)
		local netid = NetworkGetNetworkIdFromEntity(veh)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(veh))
		local vehplate = "TUNER"..math.random(10000,99999)
		SetVehicleNumberPlateText(veh, vehplate)
		local plate = GetVehicleNumberPlateText(veh, vehplate)
		Citizen.Wait(100)
		TriggerEvent("keys:addNew",vehplate, plate)
		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)

		TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
		Citizen.Wait(100)
		exports['rd-ui']:hideInteraction()
		myspawnedvehs[veh] = true
		end
	else
		TriggerEvent('DoLongHudText', 'A car is on the spawn point.', 2)
	end
end)

RegisterNetEvent("rd-tunershop:EnableBuy")
AddEventHandler("rd-tunershop:EnableBuy", function()
	if #(vector3(vector3(144.35664, -3005.489, 7.0309138)) - GetEntityCoords(PlayerPedId())) > 50.0 and exports["rd-business"]:IsEmployedAt("tuner") then
		return
	end

	local veh = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end
	local vehplate = GetVehicleNumberPlateText(veh)
	TriggerServerEvent("rd-tunershop:BuyEnabledSV",vehplate)
end)

RegisterNetEvent("rd-tunershop:BuyEnabledCL")
AddEventHandler("rd-tunershop:BuyEnabledCL", function(addplate)
	buyPlate[addplate] = true
	Citizen.Wait(60000)
	buyPlate[addplate] = nil
end)

RegisterNetEvent("rd-tunershop:VehicleCommission")
AddEventHandler("rd-tunershop:VehicleCommission", function(newAmount)
	if eexports["rd-business"]:IsEmployedAt("tuner") or #(vector3(-30.31887, -1089.345, 26.04948) - GetEntityCoords(PlayerPedId())) > 50.0 then
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			carTable[i]["commission"] = tonumber(newAmount)
			TriggerServerEvent("rd-tunershop:CarTableTunerShop",carTable)
			end
		end
	end
end)

RegisterNetEvent("rd-tunershop:ReturnVehicleTunerTable")
AddEventHandler("rd-tunershop:ReturnVehicleTunerTable", function(newTable)
	carTable = newTable
	DespawnSaleVehicles()
	SpawnSaleVehicles()
end)

local hasspawned = false
local spawnedvehicles = {}
local vehicles_spawned = false

function BuyMenu()
	for i = 1, #carspawns do

		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
			local addplate = GetVehicleNumberPlateText(veh)
			if GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= nil and GetVehiclePedIsTryingToEnter(PlayerPedId()) ~= 0 then
				ClearPedTasksImmediately(PlayerPedId())
			end
			DisableControlAction(0,23)
			if IsControlJustReleased(0,47) and buyPlate[addplate] ~= nil then
				TriggerEvent('DoLongHudText', 'Attempting Purchase!', 1)
				AttemptBuy(i, false)
			end
		end
	end
end

function AttemptBuy(tableid)

	local veh = GetClosestVehicle(carspawns[tableid]["x"],carspawns[tableid]["y"],carspawns[tableid]["z"], 3.000, 0, 70)
	if not DoesEntityExist(veh) then
		TriggerEvent('DoLongHudText', 'Could not locate vehicle!', 2)
		return
	end

	local model = carTable[tableid]["model"]
	local commission = carTable[tableid]["commission"]
	local baseprice = carTable[tableid]["baseprice"]
	local name = carTable[tableid]["name"]
	local price = baseprice + (baseprice * commission/ 100)

	currentlocation = vehshop_blips[1]
	TaskWarpPedIntoVehicle(PlayerPedId(),veh,-1)
	TriggerEvent("keys:addNew",veh, plate)
	TriggerServerEvent('rd-tunershop:ChechMoney',name, model, price)
	commissionbuy = (baseprice * commission / 100)
	Citizen.Wait(100)
	exports['rd-ui']:hideInteraction()
end

function OwnerMenu()
	if not vehshop.opened then
		currentCarSpawnLocation = 0
		ownerMenu = false
	end
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			ownerMenu = true
			currentCarSpawnLocation = i
			if IsControlJustReleased(0,38) then
				if vehshop.opened then
					pCloseCreator()
				else
					OpenCreator()
				end
			end
		end
	end
end

function DrawPrices()
	for i = 1, #carspawns do
		if #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 1.5 then
			local commission = carTable[i]["commission"]
			local baseprice = carTable[i]["baseprice"]
			local price = baseprice + (baseprice * commission/100)
			local veh = GetClosestVehicle(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"], 3.000, 0, 70)
			local addplate = GetVehicleNumberPlateText(veh)
			icon = "<center><i class='fas fa-car' style=' color: white;font-size: 25px;text-align:center; padding:5px;'></i></center>"
			if exports["rd-business"]:IsEmployedAt("tuner") then
				if buyPlate[addplate] ~= nil then
					exports['rd-ui']:showInteraction("$" .. math.ceil(price) .. " | Com: %" ..commission.. " | [E] to change | [G] to buy.")
				else
					exports['rd-ui']:showInteraction("$" .. math.ceil(price) .. " | Com: %" ..commission.. " | [E] to change")
				end
			else
				if buyPlate[addplate] ~= nil then
					exports['rd-ui']:showInteraction("$" .. math.ceil(price) .. " [G] to buy.")
				else
					exports['rd-ui']:showInteraction("Buy Price: $" .. math.ceil(price) .. " ")
				end
			end
		elseif #(vector3(carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]) - GetEntityCoords(PlayerPedId())) < 2.0 then
			exports['rd-ui']:hideInteraction()
		end
	end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function SpawnSaleVehicles()
	if not hasspawned then
		TriggerServerEvent("rd-tunershop:RequestTableTunerShopCars")
		Citizen.Wait(1500)
	end
	DespawnSaleVehicles(true)
	hasspawned = true
	for i = 1, #carTable do
		local model = GetHashKey(carTable[i]["model"])
		RequestModel(model)
		while not HasModelLoaded(model) do
			Citizen.Wait(0)
		end

		local veh = CreateVehicle(model,carspawns[i]["x"],carspawns[i]["y"],carspawns[i]["z"]-1,carspawns[i]["h"],false,true)

		SetModelAsNoLongerNeeded(model)
		SetVehicleOnGroundProperly(veh)
		SetEntityInvincible(veh,true)

		FreezeEntityPosition(veh,true)
		spawnedvehicles[#spawnedvehicles+1] = veh
		SetVehicleNumberPlateText(veh, i .. "CARSALE")
	end
	vehicles_spawned = true
end

function DespawnSaleVehicles(pDontWait)
	if pDontWait == nil and not pDontWait then
		Wait(15000)
	end
	for i = 1, #spawnedvehicles do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(spawnedvehicles[i]))
	end
	vehicles_spawned = false
end

Controlkey = {["generalUse"] = {38,"E"},["generalUseSecondary"] = {191,"Enter"}}
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
	Controlkey["generalUse"] = table["generalUse"]
	Controlkey["generalUseSecondary"] = table["generalUseSecondary"]
end)

--[[Functions]]--

function LocalPed()
	return PlayerPedId()
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

function ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			vehshop_blips[#vehshop_blips+1]= {blip = blip, pos = loc}
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(1)
				local inrange = false

				if #(vector3(133.30462, -2994.638, 7.0309133) - GetEntityCoords(LocalPed())) < 5.0 then
					local veh = GetVehiclePedIsUsing(LocalPed())
					if myspawnedvehs[veh] ~= nil then
						DrawText3D(133.30462, -2994.638, 7.0309133,"["..Controlkey["generalUse"][2].."] Return Vehicle")
						if IsControlJustReleased(0,Controlkey["generalUse"][1]) then
							Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
						end
					end
				end

				for i,b in ipairs(vehshop_blips) do
					if #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) < 100 then
						currentlocation = b
						if not vehicles_spawned then
--							print("Spawning Display Vehicles?")
							SpawnSaleVehicles()
						end
						if #(vector3(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3]) - GetEntityCoords(LocalPed())) < 35 then
							DrawPrices()
						end

						if exports["rd-business"]:IsEmployedAt("tuner") then
							OwnerMenu()
						end
						BuyMenu()
					else
						if vehicles_spawned then
--							print("Despawning Display ?")
							DespawnSaleVehicles()
						end
						Citizen.Wait(1000)
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreator()
	boughtcar = false
	if ownerMenu then
		vehshop = vehshopOwner
	else
		vehshop = vehshopDefault
	end

	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	exports['rd-ui']:hideInteraction()
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

function pCloseCreator(name, veh, price, plate)
	Citizen.CreateThread(function()
		local ped = LocalPed()
		local pPrice = price
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else
			local name = name	
			local vehicle = veh
			local price = price		
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocation.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicle = CreateVehicle(model,133.30462, -2994.638, 7.0309133,true,true)
			local netid = NetworkGetNetworkIdFromEntity(personalvehicle)
        	SetNetworkIdCanMigrate(netid, true)
        	NetworkRegisterEntityAsNetworked(VehToNet(personalvehicle))
			SetEntityHeading(personalvehicle, 4.2229189)
			SetModelAsNoLongerNeeded(model)

			if name == "rumpo" then
				SetVehicleLivery(personalvehicle,0)
			end

			if name == "taxi" then
				SetVehicleExtra(personalvehicle, 8, 0)
				SetVehicleExtra(personalvehicle, 9, 0)
				SetVehicleExtra(personalvehicle, 5, 1)
			end

			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicle,0)
				SetVehicleMod(personalvehicle,i,mod)
			end

			SetVehicleOnGroundProperly(personalvehicle)
			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicle)
			SetNetworkIdCanMigrate(id, true)
			Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
			SetVehicleColours(personalvehicle,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(PlayerPedId(),personalvehicle,-1)
			SetEntityVisible(ped,true)			
			local primarycolor = colors[1]
			local secondarycolor = colors[2]	
			local pearlescentcolor = extra_colors[1]
			local wheelcolor = extra_colors[2]
			local VehicleProps = exports['rd-bennys']:FetchVehProps(personalvehicle)
			local model = GetEntityModel(personalvehicle)
			local vehname = GetDisplayNameFromVehicleModel(model)
			SetVehicleNumberPlateText(personalvehicle, plate)
			TriggerEvent("keys:addNew",personalvehicle, plate)
			TriggerServerEvent('rd-tunershop:BuyVehicle', plate, vehname, vehicle, price, VehicleProps)
			TriggerServerEvent('rd-cardealer:log', exports['isPed']:isPed('cid'), vehname, price, plate, 'Tuner Shop')
			TriggerServerEvent('rd-financials:business_money', price / 10, 'tuner', 'add')
			exports['rd-ui']:hideInteraction()
			DespawnSaleVehicles()
			SpawnSaleVehicles()
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

RegisterNetEvent("rd-tunershop:FailedPurchase")
AddEventHandler("rd-tunershop:FailedPurchase", function()
	local veh = GetVehiclePedIsUsing(PlayerPedId())
	TaskLeaveVehicle(PlayerPedId(),veh,0)
end)


function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,255,55,55,220)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,250)
	DrawText(0.255, 0.254)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.2, 0.2)
	--SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(250,250,250, 255)
	end

	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 + 0.025, y - menu.height/3 + 0.0002)

	if selected then
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255,255,255,255)
	else
		DrawRect(x + menu.width/2 + 0.025, y,menu.width / 3,menu.height,255,55,55,220)
	end
end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.25, 0.25)

	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,250)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = PlayerPedId()
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		end
	elseif this == "vehicles" then
		if btn == "6rd-Vehicles" then
			OpenMenu('6rd-vehicles')
		elseif btn == "Tuner Vehicles" then
			OpenMenu('tuner_cars')
		end
	elseif this == "6rd-vehicles" or this == "tuner_cars" then
		if ownerMenu then
			updateCarTable(button.model,button.costs,button.name)
		else
			TriggerServerEvent('rd-tunershop:ChechMoney',button.name, button.model, button.costs)
		end
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		pCloseCreator()
	elseif vehshop.currentmenu == "6rd-vehicles" or vehshop.currentmenu == "tuner_cars" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ( IsControlJustPressed(1,Controlkey["generalUse"][1]) or IsControlJustPressed(1, Controlkey["generalUseSecondary"][1]) ) and IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				pCloseCreator()
			else
				OpenCreator()
			end
		end
		if vehshop.opened then

			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false
			for i,button in pairs(menu.buttons) do
				--local br = button.rank ~= nil and button.rank or 0
				if exports["rd-business"]:IsEmployedAt("tuner") and i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)

					if button.costs ~= nil then
						drawMenuRight("$"..button.costs,vehshop.menu.x,y,selected)
					end

					y = y + 0.04
					if vehshop.currentmenu == "6rd-vehicles" or vehshop.currentmenu == "tuner_cars" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)


								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,true)
								
								SetModelAsNoLongerNeeded(hash)
								local timer = 9000
								while not DoesEntityExist(veh) and timer > 0 do
									timer = timer - 1
									Citizen.Wait(1)
								end
								TriggerEvent("vehsearch:disable",veh)

								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}
								local topspeed = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveMaxFlatVel') / 2)
								local handling = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fSteeringLock') * 2)
								local braking = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fBrakeForce') * 100)
								local accel = math.ceil(GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce') * 100) 
								if button.model == "rumpo" then
									SetVehicleLivery(veh,2)
								end
							end
						end
					end
					if selected and ( IsControlJustPressed(1,Controlkey["generalUse"][1]) or IsControlJustPressed(1, Controlkey["generalUseSecondary"][1])  ) then
						ButtonSelected(button)
					end
				end
			end

		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,188) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,187)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end
	end
end)

AddEventHandler('FinishMoneyCheckForVehtuner', function(name, vehicle, price, plate)
	local name = name
	local vehicle = vehicle
	local price = price
	boughtcar = true
	pCloseCreator(name, vehicle, price, plate)
end)

local firstspawn = 0

ShowVehshopBlips(true)
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		--326 car blip 227 225
		ShowVehshopBlips(true)
		firstspawn = 1
	end
end)

AddEventHandler('tunerShop:SpawnVeh', function(v)
	local car = GetHashKey(v)
	local playerPed = PlayerPedId()
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
			Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)
		veh = CreateVehicle(car, playerCoords, 0.0, true, true)
		local netid = NetworkGetNetworkIdFromEntity(veh)
        SetNetworkIdCanMigrate(netid, true)
        NetworkRegisterEntityAsNetworked(VehToNet(veh))
		
		SetModelAsNoLongerNeeded(car)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
	end
end)

RegisterCommand('commissiontuner', function(source, args, raw)
	if exports["rd-business"]:IsEmployedAt("tuner") then
		local amount = args[1]
		if tonumber(amount) > 0 and tonumber(amount) <= 60 then
			TriggerEvent('rd-tunershop:VehicleCommission', amount)
		else
			TriggerEvent('DoLongHudText', 'Invalid amount "/commision [amount]', 2)
		end
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)

RegisterCommand('testdrivetuner', function(source, args, raw)
	if exports["rd-business"]:IsEmployedAt("tuner") then
		TriggerEvent('rd-tunershop:testdrive')
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)

RegisterCommand('enableBuytuner', function(source, args, raw)
	if exports["rd-business"]:IsEmployedAt("tuner") then
		TriggerEvent('rd-tunershop:EnableBuy')
	else
		TriggerEvent('DoLongHudText', 'You dont have permissions for this!', 2)
	end
end)