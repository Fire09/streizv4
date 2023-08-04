local InATCBoundary, Countdown = false, nil

Citizen.CreateThread(function ()
    exports['rd-interact']:AddPeekEntryByPolyTarget('rd-atc:radar', {
        {
            id = "rd-atc:enableRadar",
            event = "rd-atc:enableRadar",
            icon = "digital-tachograph",
            label = "Enable Flight Radar"
        }
    },
    {
        distance = { radius = 3.5 },
        isEnabled = function ()
            return not HasRadarEnabled
        end
    })

    exports['rd-interact']:AddPeekEntryByPolyTarget('rd-atc:radar', {
        {
            id = "rd-atc:airtrafficData",
            event = "rd-atc:showAirTraffic",
            icon = "plane-departure",
            label = "Show Air Traffic Data"
        },
        {
            id = "rd-atc:disableRadar",
            event = "rd-atc:disableRadar",
            icon = "digital-tachograph",
            label = "Disable Flight Radar"
        }
    },
    {
        distance = { radius = 3.5 },
        isEnabled = function ()
            return HasRadarEnabled
        end
    })

    -- MRPD ATC
    exports["rd-polyzone"]:AddBoxZone("rd-atc:boundary", vector3(444.89, -997.68, 34.97), 5.0, 11.0, {
        data = { id = "mrpd_atc" },
        heading = 0,
        minZ = 33.97,
        maxZ = 37.37,
    })

    --exports["rd-polyzone"]:AddBoxZone("rd-atc:boundary", vector3(1859.57, 3689.73, 38.23), 7.2, 5.6, {
    --    data = { id = "sandyso_atc" },
    --    heading=300,
    --    minZ=37.18,
    --    maxZ=40.38
    --})

    exports["rd-polytarget"]:AddBoxZone("rd-atc:radar", vector3(441.84, -999.63, 34.97), 1.2, 1.55, {
        data = { id = "mrpd_atc_2" },
        heading = 0,
        minZ = 34.67,
        maxZ = 35.27,
    })

    --exports["rd-polytarget"]:AddBoxZone("rd-atc:radar", vector3(1862.64, 3690.64, 38.22), 0.8, 1.8, {
    --    data = { id = "sandyso_atc" },
    --    heading=300,
    --    minZ=38.02,
    --    maxZ=38.82
    --})
end)

AddEventHandler('rd-polyzone:enter', function (pName)
    if pName ~= 'rd-atc:boundary' then return end

    InATCBoundary = true

    if Countdown then Countdown:resolve(false) end
end)

AddEventHandler('rd-polyzone:exit', function (pName)
    if pName ~= 'rd-atc:boundary' then return end

    Countdown = TimeOut(10 * 1000):next(function (continue)
        Countdown = nil

        if not continue then return end

        InATCBoundary = false

        if HasRadarEnabled then
            TriggerEvent('rd-atc:disableRadar')
        end
    end)
end)