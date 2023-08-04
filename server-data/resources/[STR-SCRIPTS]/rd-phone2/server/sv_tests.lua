RPC.register("changeWallpaper", function(pSource, pBackground)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local result = Await(SQL.execute("UPDATE characters SET wallpaper = @wallpaper WHERE id = @id", {
        ['@wallpaper'] = pBackground.param,
        ['@id'] = cid
    }))

    if not result then return false end

    return true
end)

RPC.register("changeShell", function(pSource, pShell)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local result = Await(SQL.execute("UPDATE characters SET shell = @shell WHERE id = @id", {
        ['@shell'] = pShell.param,
        ['@id'] = cid
    }))

    if not result then return false end

    return true
end)

RPC.register("fetchWallpaper", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local result = Await(SQL.execute("SELECT wallpaper FROM characters WHERE id = @id", {
        ['@id'] = cid
    }))

    if not result then return false end

    return result[1].wallpaper
end)

RPC.register("fetchShell", function(pSource)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local cid = user:getCurrentCharacter().id
    local result = Await(SQL.execute("SELECT shell FROM characters WHERE id = @id", {
        ['@id'] = cid
    }))

    if not result then return false end

    return result[1].shell
end)