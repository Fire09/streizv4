-- CONFIG --

-- Blacklisted vehicle models
carblacklist = {
	"SHAMAL", -- They spawn on LSIA and try to take off
	"LUXOR", -- They spawn on LSIA and try to take off
	"LUXOR2", -- They spawn on LSIA and try to take off
	"JET", -- They spawn on LSIA and try to take off and land, remove this if you still want em in the skies
	"LAZER", -- They spawn on Zancudo and try to take off
	"TITAN", -- They spawn on Zancudo and try to take off
	"BARRACKS", -- Regularily driving around the Zancudo airport surface
	"BARRACKS2", -- Regularily driving around the Zancudo airport surface
	"CRUSADER", -- Regularily driving around the Zancudo airport surface
	"RHINO", -- Regularily driving around the Zancudo airport surface
	"AIRTUG", -- Regularily spawns on the LSIA airport surface
	"RIPLEY", -- Regularily spawns on the LSIA airport surface
	"Buzzard",
	"Buzzard2",
	"Cargobob",
	"Cargobob3",
	"Cargobob4",
	"Savage",
	"Valkyrie",
	"Valkyrie2",
}

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		if playerPed then
			checkCar(GetVehiclePedIsIn(playerPed, false))

			x, y, z = table.unpack(GetEntityCoords(playerPed, true))
			for _, blacklistedCar in pairs(carblacklist) do
                Citizen.Wait(1000)
				checkCar(GetClosestVehicle(x, y, z, 100.0, GetHashKey(blacklistedCar), 70))
			end
		end
	end
end)

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)

		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
		end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(carblacklist) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end