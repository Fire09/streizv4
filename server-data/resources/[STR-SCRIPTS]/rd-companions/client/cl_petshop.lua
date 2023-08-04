local isCop = false

RegisterNetEvent("rd-jobmanager:playerBecameJob")
AddEventHandler("rd-jobmanager:playerBecameJob", function(job, name, notify)
	if isMedic and job ~= "ems" then isMedic = false isInService = false end
	if isCop and job ~= "police" or job ~= "doc" then isCop = false isInService = false end
	if isNews and job ~= "news" then isNews = false isInService = false end
	if job == "police" then isCop = true TriggerServerEvent('police:getRank',"police") isInService = true end
	if job == "doc" then isCop = true TriggerServerEvent('police:getRank',"doc") isInService = true end
	if job == "ems" then isMedic = true TriggerServerEvent('police:getRank',"ems") isInService = true end
	if job == "doctor" then isDoctor = true TriggerServerEvent('police:getRank',"doctor") isInService = true end
	if job == "driving instructor" then isDriver = true TriggerServerEvent('police:getRank',"driving instructor") end
	if job == "news" then isNews = true isInService = false end
  currentUIJob = job
end)

AddEventHandler("rd-companions:showPetshop", function(pArgs, pEntity, pContext)
    local data = {}

    for _, pet in ipairs(pArgs["Pets"]) do
        pet.type = pArgs["Type"]
        pet.department = pArgs["Department"]

        table.insert(data, {
            title = pet.name,
            description = "$" .. pet.price,
            children = {
                { title = "Confirm Purchase", action = "rd-pets:purchasePet", params = pet },
            },
        })
    end

    exports["rd-context"]:showContext(data)
end)

AddEventHandler("rd-pets:purchasePet", function(params)
    local input = exports["rd-input"]:showInput({
        {
            icon = "paw",
            label = "Animal name",
            name = "name",
        }
    })

    if input["name"] then
        TriggerServerEvent("rd-pets:purchasePet", params, input["name"])
    end
end)

--[[

    Threads

]]

Citizen.CreateThread(function()
    Citizen.Wait(1000)

    for i, v in ipairs(PetshopConfig) do
        --exports["rd-npcs"]:RegisterNPC(v["NPC"])

        local group = { "isPetshopSeller" }

        local data = {
            {
                id = "petshop_" .. i,
                label = v["Label"],
                icon = "paw",
                event = "rd-companions:showPetshop",
                parameters = v,
            }
        }

        local options = {
            distance = { radius = 2.5 },
            isEnabled = function()
                return isCop
            end
        }

        exports['rd-interact']:AddPeekEntryByFlag(group, data, options)
    end
end)