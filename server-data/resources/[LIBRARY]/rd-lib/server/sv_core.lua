exports('getCharacter', function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(tonumber(pSource))
    if not user then
        return false
    end
    return user:getCurrentCharacter()
end)