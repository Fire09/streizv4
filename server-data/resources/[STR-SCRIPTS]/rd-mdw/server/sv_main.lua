Citizen.CreateThread(function()
    print("[MDW] - Initiate MDW")
    print("[MDW] - Check expired warrants")
    local warrants = Await(SQL.execute("SELECT * FROM mdw_warrants", {}))
    local curUnix = os.time()
    for k,v in pairs(warrants) do
        if tonumber(curUnix) > tonumber(v.expiry) then
            -- if cur unix is more than expiry
            -- it means that the warrant has expired
            local msg = "[MDW] - Warrant Expired | ID: " .. v.id .. " | CID: " .. v.cid .. " | Incident ID: " .. v.incidentid .. " | Expiry: " .. v.expiry
            print(msg)
            local delete = Await(SQL.execute("DELETE FROM mdw_warrants WHERE id = @id", {
                ["id"] = v.id
            }))
            print("[MDW] - Warrant deleted from database")
        end
    end
end)

RPC.register("searchProfiles", function(pSource, pValue)
    local search = Await(SQL.execute("SELECT * FROM characters WHERE first_name LIKE @query OR last_name LIKE @query OR id LIKE @query",{
        ['query'] = string.lower('%'.. pValue.param ..'%')
    }))

    return search
end)

RPC.register("searchVehicles", function(pSource, pValue)
    local search = Await(SQL.execute("SELECT * FROM characters_cars WHERE plate LIKE @query OR cid LIKE @query OR model LIKE @query",{
        ['query'] = string.lower('%'.. pValue.param ..'%')
    }))

    return search
end)

RPC.register("loadProfile", function(pSource, pValue)
    local profiledata = Await(SQL.execute("SELECT * FROM characters WHERE id = @cid",{
        ["cid"] = pValue.param
    }))

    local licensedata = Await(SQL.execute("SELECT * FROM user_licenses WHERE cid = @cid",{
        ["cid"] = pValue.param
    }))

    local vehicledata = Await(SQL.execute("SELECT * FROM characters_cars WHERE cid = @cid",{
        ["cid"] = pValue.param
    }))

    local propertydata = Await(SQL.execute("SELECT * FROM housing WHERE cid = @cid",{ --AND propertycategory = @propertycategory
        ["cid"] = pValue.param,
        --["propertycategory"] = "housing"
    }))

--[[     local storagedata = Await(SQL.execute("SELECT * FROM business_storage WHERE storage_tenants = @storage_tenants",{
    ["storage_tenants"] = pValue.param
    })) ]]

    local priordata = Await(SQL.execute("SELECT * FROM user_priors WHERE cid = @cid",{
        ["cid"] = pValue.param
    }))

    licenses = {}
    for i = 1, #licensedata do
        if tonumber(licensedata[tonumber(i)].status) == 1 then
        licenses[#licenses + 1] = {
            ["id"] = licensedata[tonumber(i)].id,
            ["type"] = licensedata[tonumber(i)].type,
        }
        end
    end

    vehicles = {}
    for i = 1, #vehicledata do
        vehicles[#vehicles + 1] = {
          ["id"] = vehicledata[tonumber(i)].id,
          ["model"] = vehicledata[tonumber(i)].model,
          ["name"] = vehicledata[tonumber(i)].name,
          ["plate"] = vehicledata[tonumber(i)].plate
    }
    end

    properties = {}
    for i = 1, #propertydata do
        properties[#properties + 1] = {
          ["property_id"] = propertydata[tonumber(i)].id,
          ["property_name"] = propertydata[tonumber(i)].housingName,
          ["property_category"] = propertydata[tonumber(i)].hid,
    }
    end

    storages = {}
    --[[for i = 1, #storagedata do
        storages[#storages + 1] = {
          ["id"] = storagedata[tonumber(i)].id,
          ["storage_id"] = storagedata[tonumber(i)].storage_id,
          ["storage_size"] = storagedata[tonumber(i)].storage_size
    }
    end ]]

    priors = {}
    for i = 1, #priordata do
        priors[#priors + 1] = {
          ["id"] = priordata[tonumber(i)].id,
          ["charge"] = priordata[tonumber(i)].charge,
          ["times"] = priordata[tonumber(i)].times
    }
    end

    local data = Await(SQL.execute("SELECT * FROM businesses", {}))
    local employment = {}
    for k,v in pairs(data) do
    local employees = json.decode(data[k].employees) or {}
    for i,u in pairs(employees) do
    if tonumber(u.cid) == tonumber(pValue.param) then
        local business_id = data[k].business_id
        local business_name = data[k].business_name

        local bankAccess
        local roles = json.decode(data[k].roles) or {}
        for l,p in pairs(roles) do
            if tostring(p.name) == tostring(u.role) then
                bankAccess = p.bank_access
            end
        end

        employment[#employment + 1] = {
            id = tonumber(i),
            business_id = business_id,
            business_name = business_name,
            business_role = u.role,
            businessicon = "fa-business-time",
            bankAccess = bankAccess,
            rank = u.rank
        }
    end
    end
    end

    return profiledata[1], licenses, vehicles, properties, storages, employment, priors
end)

RPC.register("loadVehicle", function(pSource, pValue)
    local vehicledata = Await(SQL.execute("SELECT * FROM characters_cars WHERE id = @id",{
        ["id"] = pValue.param
    }))

    return vehicledata[1]
end)

RPC.register("editProfile", function(pSource, pId, pName, pImage, pInfo)
    local update = Await(SQL.execute("UPDATE characters SET profilepic = @profilepic, information = @information WHERE id = @id",{
        ["profilepic"] = pImage.param,
        ["information"] = pInfo.param,
        ["id"] = pId.param
    }))

    return true, ""
end)

RPC.register("editVehicle", function(pSource, pId, pImage, pInfo)
    local update = Await(SQL.execute("UPDATE characters_cars SET vehiclepic = @vehiclepic, information = @information WHERE id = @id",{
        ["vehiclepic"] = pImage.param,
        ["information"] = pInfo.param,
        ["id"] = pId.param
    }))

    return true, ""
end)

RPC.register("fetchBusinesses", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM businesses ORDER BY id DESC",{}))

    return data
end)

RPC.register("loadBusiness", function(pSource, pValue)
    local data = Await(SQL.execute("SELECT * FROM businesses WHERE business_id = @id", {
        ["id"] = pValue.param
    }))

    if not data then return {} end

    local employees = json.decode(data[1].employees) or {}

    local employment = {}

    local count = 0

    for k,v in pairs(employees) do

        count = count + 1

        local userInfo = Await(SQL.execute("SELECT first_name, last_name FROM characters WHERE id = @id", {
            ["id"] = v.cid
        }))

        local name

        if userInfo[1] ~= nil then 
            name = userInfo[1].first_name .. " " .. userInfo[1].last_name 
        else
            name = "Invalid Employee"
        end

        employment[#employment + 1] = {
          ["employee_cid"] = v.cid,
          ["employee_name"] = name,
          ["employee_role"] = v.role,
          ["rank"] = v.rank
        }
    end

    return employment, count
end)

RPC.register("fetchProperties", function(pSource)
    local prop = {}
    local count = 0
    local data = Await(SQL.execute("SELECT * FROM housing_price ORDER BY id ASC",{}))


    --print(json.encode(prop))

    return data
end)

RPC.register("fetchCharges", function(pSource)
    local chargedata = Await(SQL.execute("SELECT * FROM mdw_charges", {}))

    charges = {}
    for i = 1, #chargedata do
        charges[#charges + 1] = {
            id = chargedata[tonumber(i)].id,
            category = chargedata[tonumber(i)].category,
            color = chargedata[tonumber(i)].color,
            charges = json.decode(chargedata[tonumber(i)].charges)
        }
    end

    return charges
end)

RPC.register("fetchOfficers", function(pSource)
    local officerdata = Await(SQL.execute("SELECT * FROM jobs_whitelist WHERE job = @job OR job = @job1", {
        ["job"] = "police",
        ["job1"] = "state"
    }))

    officers = {}
    for i = 1, #officerdata do
        local userInfo = Await(SQL.execute("SELECT first_name, last_name FROM characters WHERE id = @id", {
            ["id"] = officerdata[tonumber(i)].cid
        }))

        local name = ""
        if userInfo[1] ~= nil then
            name = userInfo[1].first_name .. " " .. userInfo[1].last_name
        else
            name = "Unknown Officer"
        end

        officers[#officers + 1] = {
            cid = officerdata[tonumber(i)].cid,
            name = name,
            callsign = officerdata[tonumber(i)].callsign
        }
    end

    return officers
end)

RPC.register("fetchStaff", function(pSource)
    local staffdata = Await(SQL.execute("SELECT * FROM jobs_whitelist WHERE job = @job", {
        ["job"] = "police"
    }))

    staff = {}
    for i = 1, #staffdata do
        local userInfo = Await(SQL.execute("SELECT first_name, last_name FROM characters WHERE id = @id", {
            ["id"] = staffdata[tonumber(i)].cid
        }))

        local name = ""
        if userInfo[1] ~= nil then
            name = userInfo[1].first_name .. " " .. userInfo[1].last_name
        else
            name = "Unknown Officer"
        end

        staff[#staff + 1] = {
            id = i,
            cid = staffdata[tonumber(i)].cid,
            name = name,
            callsign = staffdata[tonumber(i)].callsign
        }
    end

    return staff
end)

RPC.register("fetchEms", function(pSource)
    local emsdata = Await(SQL.execute("SELECT * FROM jobs_whitelist WHERE job = @job", {
        ["job"] = "ems"
    }))

    ems = {}
    for i = 1, #emsdata do
        local userInfo = Await(SQL.execute("SELECT first_name, last_name FROM characters WHERE id = @id", {
            ["id"] = emsdata[tonumber(i)].cid
        }))

        local name = ""
        if userInfo[1] ~= nil then
            name = userInfo[1].first_name .. " " .. userInfo[1].last_name
        else
            name = "Unknown EMS"
        end

        ems[#ems + 1] = {
            cid = emsdata[tonumber(i)].cid,
            name = name,
            callsign = emsdata[tonumber(i)].callsign
        }
    end

    return ems
end)

RPC.register("fetchIncidents", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM mdw_incidents ORDER BY id DESC", {}))
    return data
end)

RPC.register("fetchIncidentsEms", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM mdw_incidents_ems ORDER BY id DESC", {}))
    return data
end)

RPC.register("fetchEvidence", function(pSource)
    local data = Await(SQL.execute("SELECT * FROM mdw_evidence ORDER BY id DESC", {}))
    return data
end)

RPC.register("fetchIncident", function(pSource, pId)
    local data = Await(SQL.execute("SELECT * FROM mdw_incidents WHERE id = @id", {
        ["id"] = pId.param
    }))

    return data, data[1].id, data[1].title, data[1].info, json.decode(data[1].evidence), json.decode(data[1].officers), json.decode(data[1].persons), json.decode(data[1].criminals)
end)

RPC.register("fetchIncidentEms", function(pSource, pId)
    local data = Await(SQL.execute("SELECT * FROM mdw_incidents_ems WHERE id = @id", {
        ["id"] = pId.param
    }))

    return data, data[1].id, data[1].title, data[1].info, json.decode(data[1].ems), json.decode(data[1].persons)
end)

RPC.register("fetchEvidenceByID", function(pSource, pId)
    local data = Await(SQL.execute("SELECT * FROM mdw_evidence WHERE id = @id", {
        ["id"] = pId.param
    }))

    return data, data[1].id, data[1].type, data[1].identifier, data[1].description, data[1].cid, data[1].incidentId, data[1].tags
end)

RPC.register("fetchWarrants", function(pSource)
    local warrantsdata = Await(SQL.execute("SELECT * FROM mdw_warrants", {}))

    if not warrantsdata then return {} end

    warrants = {}
    for i = 1, #warrantsdata do

        local fetchName =  Await(SQL.execute("SELECT first_name, last_name, profilepic FROM characters WHERE id = @id", {
            ["id"] = warrantsdata[tonumber(i)].cid
        }))

        local fetchIncident =  Await(SQL.execute("SELECT title FROM mdw_incidents WHERE id = @id", {
            ["id"] = warrantsdata[tonumber(i)].incidentid
        }))

        local name = "Profile Not Found"
        local image = "https://i.imgur.com/wxNT3y2.jpg"
        if fetchName[1] ~= nil then
            name = fetchName[1].first_name .. " " .. fetchName[1].last_name  
            if fetchName[1].profilepic ~= nil then
                image = fetchName[1].profilepic
            end
        end

        local incident = "Incident Not Found"
        if fetchIncident[1] ~= nil then
            incident = fetchIncident[1].title  
        end
        
        warrants[#warrants + 1] = {
            id = warrantsdata[tonumber(i)].id,
            name = name,
            image = image,
            incident = incident,
            expiry = warrantsdata[tonumber(i)].expiry,
        }
    end

    return warrants
end)

RPC.register("updateIncident", function(pSource, pId, pType, pData, pData2, pAdd)
    local type = pType.param
    local id = pId.param

    if tostring(type) == "evidence" then
        local data = Await(SQL.execute("UPDATE mdw_incidents SET evidence = @evidence WHERE id = @id", {
            ["evidence"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        if pAdd.param == true then

        local evidenceData = pData2.param

        local data2 = Await(SQL.execute("INSERT INTO mdw_evidence (type, identifier, description, cid, incidentId) VALUES (@type, @identifier, @description, @cid, @incidentId)", {
            ["type"] = evidenceData.type,
            ["identifier"] = evidenceData.identifier,
            ["description"] = evidenceData.description,
            ["cid"] = evidenceData.cid,
            ["incidentId"] = pId.param,
            ["id"] = pId.param
        }))

        end

        return true
    elseif tostring(type) == "officers" then
        local data = Await(SQL.execute("UPDATE mdw_incidents SET officers = @officers WHERE id = @id", {
            ["officers"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        return true
    elseif tostring(type) == "persons" then
        local data = Await(SQL.execute("UPDATE mdw_incidents SET persons = @persons WHERE id = @id", {
            ["persons"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        return true
    elseif tostring(type) == "criminals" then
        local data = Await(SQL.execute("UPDATE mdw_incidents SET criminals = @criminals WHERE id = @id", {
            ["criminals"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        -- loop thru criminals, check if proocessed is ticked and if it is add charges
        -- somehow keep track of if charges has been added from the incident?
        --wtf am i saying

        return true
    end
end)

RPC.register("updateIncidentEms", function(pSource, pId, pType, pData, pData2, pAdd)
    local type = pType.param
    local id = pId.param

    if tostring(type) == "ems" then
        local data = Await(SQL.execute("UPDATE mdw_incidents_ems SET ems = @ems WHERE id = @id", {
            ["ems"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        return true
    elseif tostring(type) == "persons" then
        local data = Await(SQL.execute("UPDATE mdw_incidents_ems SET persons = @persons WHERE id = @id", {
            ["persons"] = json.encode(pData.param),
            ["id"] = pId.param
        }))

        return true
    end
end)

RPC.register("saveIncident", function(pSource, pId, pCreate, pTitle, pInfo, pEvidence, pOfficers, pPersons)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local id = pId.param
    local shouldCreate = pCreate.param
    if shouldCreate then
        local name = user:getCurrentCharacter().first_name .. " " .. user:getCurrentCharacter().last_name
        local unix = os.time()
        local insert = Await(SQL.execute("INSERT INTO mdw_incidents (title, author, unix, info, officers) VALUES (@title, @author, @unix, @info, @officers)", {
            ["title"] = pTitle.param,
            ["author"] = name,
            ["unix"] = unix,
            ["info"] = pInfo.param,
            ["officers"] = json.encode(pOfficers.param)
        }))

        local getInsertId = Await(SQL.execute("SELECT id FROM mdw_incidents WHERE title = @title AND author = @author AND unix = @unix", {
            ["title"] = pTitle.param,
            ["author"] = name,
            ["unix"] = unix
        }))

        return getInsertId[1].id or 0
    else
        local update = Await(SQL.execute("UPDATE mdw_incidents SET title = @title, info = @info, evidence = @evidence, officers = @officers, persons = @persons WHERE id = @id", {
            ["title"] = pTitle.param,
            ["info"] = pInfo.param,
            ["evidence"] = json.encode(pEvidence.param),
            ["officers"] = json.encode(pOfficers.param),
            ["persons"] = json.encode(pPersons.param),
            ["id"] = id
        }))

        return id
    end
end)

RPC.register("saveIncidentEms", function(pSource, pId, pCreate, pTitle, pInfo, pEms, pPersons)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local id = pId.param
    local shouldCreate = pCreate.param
    if shouldCreate then
        local name = user:getCurrentCharacter().first_name .. " " .. user:getCurrentCharacter().last_name
        local unix = os.time()
        local insert = Await(SQL.execute("INSERT INTO mdw_incidents_ems (title, author, unix, info, ems) VALUES (@title, @author, @unix, @info, @ems)", {
            ["title"] = pTitle.param,
            ["author"] = name,
            ["unix"] = unix,
            ["info"] = pInfo.param,
            ["ems"] = json.encode(pEms.param)
        }))

        local getInsertId = Await(SQL.execute("SELECT id FROM mdw_incidents_ems WHERE title = @title AND author = @author AND unix = @unix", {
            ["title"] = pTitle.param,
            ["author"] = name,
            ["unix"] = unix
        }))

        return getInsertId[1].id or 0
    else
        local update = Await(SQL.execute("UPDATE mdw_incidents_ems SET title = @title, info = @info, ems = @ems, persons = @persons WHERE id = @id", {
            ["title"] = pTitle.param,
            ["info"] = pInfo.param,
            ["ems"] = json.encode(pEms.param),
            ["persons"] = json.encode(pPersons.param),
            ["id"] = id
        }))

        return id
    end
end)

RPC.register("saveCriminal", function(pSource, pId, pCid, pValue)
    -- update incident with new criminals array
    -- then check if they have warrant and add warrant
    -- make sure they dont have one
    -- then add charges if processed is ticked
    -- and matches cid provided
    for k,v in pairs(pValue.param) do
        if tonumber(pCid.param) == tonumber(v.cid) then
        if v.warrant == true then
            local hasWarrant = Await(SQL.execute("SELECT COUNT(*) AS total FROM mdw_warrants WHERE cid = @cid", {
                ["cid"] = pCid.param
            }))

            if tonumber(hasWarrant[1].total) == 0 then                
                local insert = Await(SQL.execute("INSERT INTO mdw_warrants (cid, incidentid, expiry) VALUES (@cid, @incidentid, @expiry)", {
                    ["cid"] = pCid.param,
                    ["incidentid"] = pId.param,
                    ["expiry"] = v.warrantdate
                }))
            end
        end

        if v.processed == true then
            local c = v.charges

            for _, p in pairs(c) do
                local count = Await(SQL.execute("SELECT COUNT(*) AS total FROM user_priors WHERE cid = @cid AND charge = @charge",{
                    ["cid"] = pCid.param,
                    ["charge"] = p.title
                }))

                if count[1].total > 0 then
                    -- had charge, increase times
                    local update = Await(SQL.execute("UPDATE user_priors SET times = times + @amount WHERE cid = @cid AND charge = @charge",{
                        ["amount"] = 1,
                        ["cid"] = pCid.param,
                        ["charge"] = p.title
                    }))
                else
                    -- never had charge insert it
                    local insert = Await(SQL.execute("INSERT INTO user_priors (cid, charge, times) VALUES (@cid, @charge, @times)",{
                        ["cid"] = pCid.param,
                        ["charge"] = p.title,
                        ["times"] = 1
                    }))
                end
            end
        end
        end
    end

    local update = Await(SQL.execute("UPDATE mdw_incidents SET criminals = @criminals WHERE id = @id", {
        ["criminals"] = json.encode(pValue.param),
        ["id"] = pId.param
    }))

    return true
end)

RPC.register("fetchMdwInfo", function(pSource, pJob)
    local user = exports["rd-base"]:getModule("Player"):GetUser(pSource)
    local data = Await(SQL.execute("SELECT rank, callsign FROM jobs_whitelist WHERE job = @job AND cid = @cid", {
        ["job"] = pJob.param,
        ["cid"] = user:getCurrentCharacter().id
    }))

    if not data then return 0 end
    
    local label = ""

    if pJob.param == "police" or pJob.param == "sheriff" then
    joblabel = {}
    joblabel[1] = "Cadet"
    joblabel[2] = "Officer"
    joblabel[3] = "Senior Officer"
    joblabel[4] = "Corporal"
    joblabel[5] = "Sergeant"
    joblabel[6] = "Lieutenant"
    joblabel[7] = "Captain"
    joblabel[8] = "Deputy Chief Of Police"
    joblabel[9] = "Chief Of Police"
    label = joblabel[data[1].rank]
    end

    if pJob.param == "state" then
        joblabel = {}
        joblabel[1] = "Trooper"
        joblabel[2] = "Senior Trooper"
        joblabel[3] = "Assistant Major"
        joblabel[4] = "Major"
        label = joblabel[data[1].rank]
    end
	
	if pJob.param == "ranger" then
        joblabel = {}
        joblabel[1] = "Ranger"
        joblabel[2] = "Senior Ranger"
        joblabel[3] = "Sergeant"
        joblabel[4] = "Lieutenant"
        joblabel[5] = "Captain"
        joblabel[6] = "Head Ranger"
        label = joblabel[data[1].rank]
    end

    if pJob.param == "judge" then
        label = "Judge"
    end

    if pJob.param == "ems" then
        joblabel = {}
        joblabel[1] = "Trainee"
        joblabel[2] = "Emergency Medical Technician"
        joblabel[3] = "Paramedic"
        joblabel[4] = "Advanced Paramedic"
        joblabel[5] = "FTO"
        joblabel[6] = "Head FTO"
        joblabel[7] = "Lieutenant"
        joblabel[8] = "Captain"
        joblabel[9] = "Assistant Chief"
        joblabel[10] = "Chief of EMS"
        label = joblabel[data[1].rank]
    end
    
    return user:getCurrentCharacter().first_name, user:getCurrentCharacter().last_name, data[1].rank, label, data[1].callsign
end)

RPC.register("assignLicense", function(pSource, pCid, pType)
    local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
        ["status"] = 1,
        ["type"] = pType.param,
        ["cid"] = pCid.param
    }))

    if not update then return false end

    return true
end)

RPC.register("removeLicense", function(pSource, pCid, pType)
    local update = Await(SQL.execute("UPDATE user_licenses SET status = @status WHERE type = @type AND cid = @cid", {
        ["status"] = 0,
        ["type"] = pType.param,
        ["cid"] = pCid.param
    }))

    if not update then return false end

    return true
end)

RPC.register("createWarrant", function(pSource, pCid, pIncidentId, pExpiry)
    -- maybe a check for if they have a warrant already bozo
    local insert = Await(SQL.execute("INSERT INTO mdw_warrants (cid, incidentid, expiry) VALUES (@cid, @incidentid, @expiry)", {
        ["cid"] = pCid.param,
        ["incidentid"] = pIncidentId.param,
        ["expiry"] = pExpiry.param
    }))

    if not insert then return false end

    return true
end)

RPC.register("deleteWarrant", function(pSource, pId)
    local delete = Await(SQL.execute("DELETE FROM mdw_warrants WHERE id = @id", {
        ["id"] = pId.param
    }))

    if not delete then return false end

    return true
end)

-- RegisterCommand("addcharge", function(source, args, raw)
--     local user = exports["rd-base"]:getModule("Player"):GetUser(source)
--     local rank = user:getRank()
--     if rank ~= "dev" then return end
--     if not args then return end

--     -- args 1
--     -- category
--     -- args 2
--     -- title
--     -- args 3 
--     -- months
--     -- args 4
--     -- fine
--     -- args 5
--     -- points

--     local charges = {}

--     local fetch = Await(SQL.execute("SELECT charges FROM mdw_charges WHERE category = @category", {
--         ["category"] = args[1]
--     }))

--     if fetch[1] ~= nil then
--         if fetch[1].charges ~= nil then
--             charges = json.decode(fetch[1].charges)
--         end
--     end

--     tbl = {
--         title = args[2],
--         months = args[3],
--         fine = args[4],
--         points = args[5]
--     }

--     table.insert(charges, tbl)

--     local data = Await(SQL.execute("UPDATE mdw_charges SET charges = @charges WHERE category = @category", {
--         ["charges"] = json.encode(charges),
--         ["category"] = args[1]
--     }))

-- end)