local compass_bool = true
local full_oof = true
Citizen.CreateThread( function()
	local heading, lastHeading = 0, 1
	SendNUIMessage({ action = "display", compass = compass })
	while Config.ShowCompass do
		Citizen.Wait(0)
		local camRot = GetGameplayCamRot(0)
		heading = tostring(round(360.0 - ((camRot.z + 360.0) % 360.0)))
		if heading == '360' then heading = '0' end

		if heading ~= lastHeading then
			if IsPedInAnyVehicle(PlayerPedId()) and full_oof == true and not IsPauseMenuActive() then
				SendNUIMessage({ action = "display", value = heading })
			else
				SendNUIMessage({ action = "hide", value = heading })
			end
		end
		lastHeading = heading
	end
end)


RegisterNetEvent('change:full_oof')
AddEventHandler('change:full_oof', function(bool)
	full_oof = bool
end)

