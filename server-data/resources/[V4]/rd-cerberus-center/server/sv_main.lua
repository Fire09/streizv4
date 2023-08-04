striezOffice = {}
striezType = {}

striezPid = {}
striezpName = {}

striezCbcId = {}

striezAction = {}
striezOffices = {}
striezCid = {}
striezCurrentJob = {}

RegisterServerEvent("rd-cbc:StriezOfficeInformation")
AddEventHandler("rd-cbc:StriezOfficeInformation", function(strData)
    striezOffice = strData.office
    striezType = strData.type
end)

RPC.register("rd-cbc:doElevatorAction", function(src, pKey)
    TriggerClientEvent("rd-cbc:office", src, striezOffice, striezType)
    print(striezOffice, striezType)
end)

RegisterServerEvent("rd-cbc:addBusinessToCenterStriez")
AddEventHandler("rd-cbc:addBusinessToCenterStriez", function(strDataTwo)
    striezPid =  strDataTwo.office_type
    striezpName = strDataTwo.business_id
end)

RegisterServerEvent("rd-cbc:deleteBusinessFromCenter")
AddEventHandler("rd-cbc:deleteBusinessFromCenter", function(strDataThree)
    striezCbcId =  strDataThree
end)

RPC.register("rd-cbc:addBusinessToCenter", function(pSource)
    local data = Await(SQL.execute("INSERT INTO cerberus_center (offices_business_id, offices_business_name) VALUES (@offices_business_id, @offices_business_name)", {
        ["offices_business_id"] = striezPid,
        ["offices_business_name"] = striezpName
    }))
end)

RPC.register("rd-cbc:getCreatedOffices", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM cerberus_center", {}))
    if not data then return false, {} end
    return data
end)

RPC.register("rd-cbc:deleteBusinessFromCenter", function(pId)
    local delete = Await(SQL.execute("DELETE FROM cerberus_center WHERE offices_business_id = @offices_business_id", {
        ["offices_business_id"] = striezCbcId
    }))

    if not delete then return false end

    return true
end)

RegisterServerEvent("rd-cbc:actionOfficeInfo")
AddEventHandler("rd-cbc:actionOfficeInfo", function(action, office, cid, currentJob)
    striezAction = action
    striezOffices = office
    striezCid = cid
    striezCurrentJob = currentJob
end)

RPC.register("rd-cbc:actionOffice", function(src, action, office, cid, currentJob)
    local officeType = "preview"
    if striezAction == "visit" then
        TriggerClientEvent("rd-cbc:office", src, striezOffices, officeType)
    else
     print(striezAction, striezOffices, striezCid, striezCurrentJob)
    end
end)