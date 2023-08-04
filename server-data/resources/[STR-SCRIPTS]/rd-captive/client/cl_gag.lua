-- local isGagged = false
-- local sockObject = nil

-- local gagRanges = {
--   {
--     mode = 1,
--     range = 0.5,
--     priority = 2
--   },
--   {
--     mode = 2,
--     range = 0.75,
--     priority = 2
--   },
--   {
--     mode = 3,
--     range = 1.0,
--     priority = 2
--   }
-- }

-- RegisterNetEvent("gag:toggle")
-- AddEventHandler("gag:toggle", function(pArgs, pEntity)
--   local ped = PlayerPedId()
--   local tPed = pEntity

--   isGagged = exports["rd-flags"]:HasPedFlag(tPed, "isGagged")

--   local time, string = 10000, "Gagging target"

--   if isGagged then
--     time = 2000
--     string = "Removing gag"
--   end

--   RequestAnimDict("random@shop_robbery")
--   while not HasAnimDictLoaded("random@shop_robbery") do
--     Citizen.Wait(0)
--   end

--   ClearPedTasksImmediately(ped)
--   TaskPlayAnim(ped, "random@shop_robbery", "robbery_action_b", 8.0, -8, -1, 16, 0, 0, 0, 0)

--   local gagtask = exports["rd-taskbar"]:taskBar(time, string)

--   if gagtask == 100 then
--     if isGagged then
--       exports['rd-flags']:SetPedFlag(tPed, 'isGagged', false)
--     else
--       exports['rd-flags']:SetPedFlag(tPed, 'isGagged', true)
--     end
--   end
--   ClearPedSecondaryTask(ped)
-- end)

-- RegisterNetEvent("gag:apply")
-- AddEventHandler("gag:apply", function(pIsGagged)
--   isGagged = pIsGagged

--   if isGagged then
--     TriggerEvent('np:voice:proximity:override', "gag", gagRanges)
--     TriggerServerEvent("np:voice:transmission:state", -1, 'gag', true, 'gag')
--     attachSockObject()
--   else
--     TriggerEvent('np:voice:proximity:override', "gag", gagRanges, -1, -1)
--     TriggerServerEvent("np:voice:transmission:state", -1, 'gag', false, 'gag')
--     detachSockObject()
--   end
-- end)

-- function attachSockObject()

--   local ped = PlayerPedId()
--   local sockModel = `prop_rolled_sock_01`

--   if not IsModelValid(sockModel) then
--     print("INVALID PROP")
--     return
--   end
--   RequestModel(sockModel)

--   while not HasModelLoaded(sockModel) do
--     Wait(0)
--   end

--   local coords = GetEntityCoords(ped)

--   sockObject = CreateObjectNoOffset(sockModel, coords, true, false, false)

--   while not DoesEntityExist(sockObject) do
--     Wait(0)
--   end
--   SetModelAsNoLongerNeeded(sockModel)


--   AttachEntityToEntity(sockObject, ped, GetPedBoneIndex(ped, 47495), 0.07, 0.02, 0.01, -16.0, 5.0, 132.0, 0, 0, 0, 1, 0, 1)
-- end

-- function detachSockObject()
--   DeleteObject(sockObject)
-- end

-- AddEventHandler('onResourceStop', function (resource)
--   if resource == GetCurrentResourceName() then
--     detachSockObject()
--   end
-- end)