local IsSweating = false

local function StartSweating()
    if IsSweating then return end

    IsSweating = true

    Citizen.CreateThread(function ()
        while IsSweating do
            SetPedSweat(PlayerPedId(), 100.0)
            Citizen.Wait(5000)
        end
    end)
end

RegisterCommand("toggleSweat", function ()
    if IsSweating then
        IsSweating = false
    else
        StartSweating()
    end
end)

RegisterCommand("clearSweat", function ()
    if IsSweating then
        IsSweating = false
    end

    SetPedSweat(PlayerPedId(), 0.0)
end)