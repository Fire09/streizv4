STX.Events = STX.Events or {}
STX.Events.Registered = STX.Events.Registered or {}

RegisterServerEvent("rd-events:listenEvent")
AddEventHandler("rd-events:listenEvent", function(id, name, args)
    local src = source

    if not STX.Events.Registered[name] then return end

    STX.Events.Registered[name].f(STX.Events.Registered[name].mod, args, src, function(data)
        TriggerClientEvent("rd-events:listenEvent", src, id, data)
    end)
end)

function STX.Events.AddEvent(self, module, func, name)
    STX.Events.Registered[name] = {
        mod = module,
        f = func
    }
end

SQL = function(query, parameters, cb)
    local res = nil
    local IsBusy = true
    exports.oxmysql:execute(query, parameters, function(result)
        if cb then
            cb(result)
        else
            res = result
            IsBusy = false
        end
    end)
    while IsBusy do
        Citizen.Wait(0)
    end
    return res
end

RegisterServerEvent("rd-base:CheckWeaponLicenese")
AddEventHandler("rd-base:CheckWeaponLicenese", function()
    local pSrc = source
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSrc)
    local char = user:getCurrentCharacter()
    local cid = char.id

    local result = SQL("SELECT status FROM user_licenses WHERE cid = @cid AND type = @type", {
        ["cid"] = cid,
        ["type"] = 'Weapon'
    })

    if result[1] ~= nil then
        TriggerClientEvent('rd-base:GetWeaponLicenses', pSrc, result[1].status)
    end
end)
