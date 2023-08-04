RegisterNetEvent("rd-gov:police:showBadge")
AddEventHandler("rd-gov:police:showBadge", function(pSource, pInventoryData)
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    local isInCar = veh ~= 0 and veh ~= nil
    if GetPlayerServerId(PlayerId()) ~= pSource then
      Citizen.CreateThread(function()
        Citizen.Wait(isInCar and 1000 or 4500)
        exports["rd-ui"]:openApplication("badge", {
            show = true,
            name = pInventoryData.name,
            badge = pInventoryData.badge,
            rank = pInventoryData.rank,
            department = pInventoryData.department,
            image = pInventoryData.image,
            callsign = pInventoryData.callsign
        }, false)
      end)
    else
        if isInCar then return end

        TriggerEvent("attachItem", "police_badge")

        local animation = AnimationTask:new(PlayerPedId(), 'normal', nil, 9500, 'paper_1_rcm_alt1-7', 'player_one_dual-7', 63)

        local result = Citizen.Await(animation:start(function(self)
            local vehicle = GetVehiclePedIsIn(self.ped, false)

            if not IsDead and vehicle ~= 0 then
              TaskLeaveVehicle(self.ped, vehicle, 1)
            elseif IsDead and vehicle ~= 0 then
              ClearPedTasksImmediately(self.ped)
              self:abort()
            elseif IsDead or IsPedRagdoll(self.ped) then
              self:abort()
            end
        end))

        TriggerEvent("destroyProp")
    end
end)

AddEventHandler("rd-police:getbadge",function()
	local myJob = exports["isPed"]:isPed("myJob")
	if myJob == "police" or myJob == "state" or myJob == "sheriff" then
      RPC.execute("rd-gov:police:getBadge")
  end
end)