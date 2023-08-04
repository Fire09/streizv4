local Ran = false
RegisterNetEvent("loading:disableLoading")
AddEventHandler("loading:disableLoading", function()
	Citizen.CreateThread(function()
        DisplayRadar(0)
        SetRadarBigmapEnabled(true, false)
        Citizen.Wait(0)
        SetRadarBigmapEnabled(false, false)
        DisplayRadar(0)
        Citizen.Wait(0)
    end)
	if not Ran then
		ShutdownLoadingScreenNui()
		Ran = true
	end
end)
Citizen.CreateThread(function()
	SetNuiFocus(true, false)
end)
