HasRadarEnabled = false

RegisterNetEvent('rd-atc:enableRadar', function ()
    if HasRadarEnabled then return end

    HasRadarEnabled = true

    TriggerEvent('rd-voice:atc:connect')

    TriggerEvent('DoLongHudText', 'Connected to ATC Network')

    STR.execute('rd-atc:setRadarStatus', HasRadarEnabled)
end)

RegisterNetEvent('rd-atc:disableRadar', function ()
    if not HasRadarEnabled then return end

    HasRadarEnabled = false

    DeleteBlipHandlers()

    TriggerEvent('rd-voice:atc:disconnect')

    TriggerEvent('DoLongHudText', 'Disconnected from ATC Network')

    STR.execute('rd-atc:setRadarStatus', HasRadarEnabled)
end)

RegisterNetEvent('rd-atc:setAirSpace', function (pAirspace)
    if not HasRadarEnabled then return end

    SetBlipHandlers(pAirspace)

    SetAirTraffic(pAirspace)
end)

RegisterNetEvent('rd-atc:addToAirSpace', function (pAircraft)
    if not HasRadarEnabled then return end

    AddBlipHandler(pAircraft.netId, pAircraft.type, pAircraft.callsign or pAircraft.plate, pAircraft.coords)

    AddAircraftToTraffic(pAircraft.netId, pAircraft)
end)

RegisterNetEvent('rd-atc:removeFromAirSpace', function (pNetId)
    if not HasRadarEnabled then return end

    RemoveBlipHandler(pNetId)

    RemoveAircraftFromTraffic(pNetId)
end)

RegisterNetEvent('rd-atc:updateAirSpace', function (pAirspace)
    if not HasRadarEnabled then return end

    UpdateBlipHandlers(pAirspace)

    UpdateAirTraffic(pAirspace)
end)

RegisterNetEvent('rd-atc:updateFlightData', function (pNetID, pData)
    print("RIDDLE TEST ATC")
    if not HasRadarEnabled then return end
    print("RIDDLE TEST ATC 2")
    UpdateFlightData(pNetID, pData)
    if not pData.callsign then return end

    UpdateBlipCallsign(pNetID, pData.callsign)
end)