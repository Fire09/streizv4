RPC.register("rd-doors:elevators:fetch",function()
    return ELEVATOR_CONFIG
end)

RegisterServerEvent("rd-doors:change-elevator-state")
AddEventHandler("rd-doors:change-elevator-state",function(elevatorId, floorId, locked)
    if ELEVATOR_CONFIG[elevatorId] then
        ELEVATOR_CONFIG[elevatorId].floors[floorId].locked = locked
        TriggerClientEvent("rd-doors:elevators:updateState", -1, elevatorId,floorId,locked,ELEVATOR_CONFIG[elevatorId].floors[floorId].forceUnlocked)
    end
end)