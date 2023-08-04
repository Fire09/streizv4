local EmployedAt, UpdatedAt = {}, 0
local PermissionCache = {}

function RefreshEmploymentList()
    local characterId = exports['isPed']:isPed('cid')
    local employment = RPC.execute("GetEmploymentInformation", characterId)
    EmployedAt, UpdatedAt = {}, GetGameTimer()
    for _, business in ipairs(employment) do
        print(business.business_id)
        if business.business_id then
            EmployedAt[business.business_id] = true
        end
    end
end

exports('RefreshEmploymentList', RefreshEmploymentList)

function IsEmployedAt(pBusiness)
    if (GetGameTimer() - UpdatedAt) > 15 * 60000 then RefreshEmploymentList() end

    return EmployedAt[pBusiness] == true
end

exports('IsEmployedAt', IsEmployedAt)

function HasPermission(pBusiness, pPermission)
    if not PermissionCache[pBusiness] then
        PermissionCache[pBusiness] = {}
    end
    if not PermissionCache[pBusiness][pPermission] or (GetGameTimer() - PermissionCache[pBusiness][pPermission].UpdatedAt) > 15 * 60000 then
        local cid = exports["isPed"]:isPed("cid")
        local success = RPC.execute("rd-business:hasPermission", pBusiness, pPermission, cid)
        PermissionCache[pBusiness][pPermission] = {
            UpdatedAt = GetGameTimer(),
            hasPermission = success
        }
    end
    return PermissionCache[pBusiness][pPermission].hasPermission
end

exports('HasPermission', HasPermission)

RegisterNetEvent('rd-spawn:characterSpawned')
AddEventHandler('rd-spawn:characterSpawned', function()
    RefreshEmploymentList()
end)

RegisterCommand("hotreload", function()
    RefreshEmploymentList()
end)

-- this event gets triggered whenever you get fired from a job. and your in the city
RegisterNetEvent('rd-business:employmentStatus')
AddEventHandler('rd-business:employmentStatus', function(pBusiness, pEmployed)
    EmployedAt[pBusiness] = pEmployed
end)

AddEventHandler("rd-npcs:ped:openDigitalDenShop", function()
    TriggerEvent("server-inventory-open", "42073", "Shop")
end)

RegisterNetEvent('rd-admin:createBusiness')
AddEventHandler('rd-admin:createBusiness', function(pOwner, pId, pName)
    TriggerServerEvent("rd-admin:createBusiness", pOwner, pId, pName)
end)
