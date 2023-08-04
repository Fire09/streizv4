RPC.register("rd-usableprops:payParkingMeter",function(pSource,pPrice)
    local src = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource) 
    if user:getCash() >= pPrice.param then
        user:removeMoney(pPrice.param)
    else
     --   TriggerEvent("raid_clothes:get_character_current", src)
    end
    return true
end)