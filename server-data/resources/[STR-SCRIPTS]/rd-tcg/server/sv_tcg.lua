activeLocation = nil

availableLocations = {
    [1] = vector3(1305.5650634766, 4250.578125, 33.908638000488),
    [2] = vector3(1582.2761230469, 3842.4379882812, 31.301727294922),
    [3] = vector3(-157.41506958008, 4268.2255859375, 31.940711975098),
    [4] = vector3(2079.0886230469, 4556.6293945312, 31.346710205078),
    [5] = vector3(1583.2722167969, 4444.96484375, 34.706634521484),
    [6] = vector3(714.02844238281, 4124.9301757812, 35.779186248779),
    [7] = vector3(-1846.2895507812, -1247.5093994141, 8.6157913208008),
    [8] = vector3(-1519.2618408203, -1497.9777832031, 6.2412505149841),
    [9] = vector3(-3425.4384765625, 967.85217285156, 8.3466806411743),
    [10] = vector3(-270.88171386719, 6631.236328125, 7.4785633087158),
    [11] = vector3(-999.20239257813, 6265.7578125, 2.1286859512329),
    [12] = vector3(55.172451019287, 7244.44140625, 2.3638601303101),
    [13] = vector3(1536.7352294922, 6641.857421875, 1.8513743877411),
    [14] = vector3(3371.3151855469, 5183.8310546875, 1.4602422714233),
    [15] = vector3(2841.6840820313, -623.72906494141, 1.4005224704742),
}

RegisterNetEvent("rd-tcg:buy", function(pType)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(src)
    
    local itemInfo = TCG.Items[pType]
    if not itemInfo then
        TriggerClientEvent("DoLongHudText", src, "itemInfo not found?", 2)
        return
    end

    local cid = exports["rd-base"]:getChar(src, "id")
    if not cid then
        TriggerClientEvent("DoLongHudText", src, "cid not found?", 2)
        return
    end

    if itemInfo.price > user:getCash() then
        TriggerClientEvent("DoLongHudText", src, "You dont have this much in your bank account", 2)
        return false
    end

    local success, message = user:removeMoney(itemInfo.price)
    if not success then
        TriggerClientEvent("player:receiveItem", src, pType, 1)
        return false
    end

end)

Citizen.CreateThread(function()
    if tsunami then
        updateNPCTCGLocation()
        TriggerClientEvent("rd-tcg:updateLocation", -1, activeLocation)
        print(activeLocation)
        tsunami = false
    end
    while true do
    Citizen.Wait(100)
    Citizen.Wait(3600000) -- 3600000
    print("upd loc")
    updateNPCTCGLocation()
    end
end)

function updateNPCTCGLocation()
    math.randomseed(os.time())
    activeLocation = availableLocations[math.random(1,15)]
    TriggerClientEvent("rd-tcg:updateLocation", -1, activeLocation)
    print("Updated TCG Spot: " .. activeLocation)
end

RPC.register("rd-tcg:getSellerLocation", function()
    local table = {
        coords = activeLocation
    }
    return table
end)