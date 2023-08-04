local ActiveBlips = {}

Citizen.CreateThread(function ()
    ActiveBlips[#ActiveBlips+1] = CreateBlip("UwU Cafe", vector3(-579.83, -1065.2, 22.35), 621, 61, true)
    ActiveBlips[#ActiveBlips+1] = CreateBlip("Maldinis", vector3(793.95, -758.19, 26.77), 78, 61, true)
    ActiveBlips[#ActiveBlips+1] = CreateBlip("Pawnhub", vector3(-727.18,-1116.61,10.84), 587, 81, true)
    ActiveBlips[#ActiveBlips+1] = CreateBlip("Spray Shop", vector3(-296.93,-1332.3,31.3), 72, 49, true)
end)

AddEventHandler('rd-island:hideBlips', function(pState)
    for _,blip in ipairs(ActiveBlips) do
        if pState then
            SetBlipAlpha(blip, 0)
        else
            SetBlipAlpha(blip, 255)
        end
    end
end)
