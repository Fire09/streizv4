RPC.register("rd:garage:vehicleSpawn", function(pSource, pModel, pCoords, pPlate)
    local coords = pCoords.param
    local model = pModel.param
    local plate = pPlate.param
    plate = plate:gsub("%s+", "")
    plate = string.gsub(plate, "%s+", "")
    local car = CreateVehicle(model, coords.x, coords.y, coords.z, coords.h , true, true)
    local osTime = os.time()
    while not DoesEntityExist(car) do 
        Citizen.Wait(0) 
        if os.time() > osTime + 5 then break end
    end
    SetVehicleNumberPlateText(car, plate)
    print("set plate", plate)
    TriggerClientEvent("vehicle:keys:addNew", pSource, car, plate)
    local netId = NetworkGetNetworkIdFromEntity(car)

    return netId
end)