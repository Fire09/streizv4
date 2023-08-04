policeList = {
    [1] = {
        model = "npolblazer",
        name = "4 Wheel Bike",
        retail_price = 5000,
        first_free = false,
    },
    [2] = {
        model = "npolvic",
        name = "Ford Victoria",
        retail_price = 15000,
        first_free = true,
    },
    [3] = {
        model = "npolmm",
        name = "NAGASAKI",
        retail_price = 20000,
        first_free = false,
    },
    [4] = {
        model = "npolexp",
        name = "Ford Explorer",
        retail_price = 25000,
        first_free = false,
    },
    [5] = {
        model = "npolchar",
        name = "Dodge Charger",
        retail_price = 35000,
        first_free = false,
    },
    [6] = {
        model = "npolchal",
        name = "Dodge Challenger",
        retail_price = 45000,
        first_free = false,
    },
    [7] = {
        model = "npolvette",
        name = "Chevrolet Corvette",
        retail_price = 65000,
        first_free = false,
    },
    [8] = {
        model = "npolstang",
        name = "Ford Mustang",
        retail_price = 55000,
        first_free = false,
    },
    [9] = {
        model = "polas350",
        name = "Helicopter",
        retail_price = 55000,
        first_free = false,
    },
}

emsList = {
    [1] = {
        model = "emsnspeedo",
        name = "Ambulance",
        retail_price = 5000,
        first_free = false,
    },
    [2] = {
        model = "EMSV",
        name = "Ambulance 2",
        retail_price = 5000,
        first_free = false,
    },
    [3] = {
        model = "emsaw139",
        name = "Helicopter",
        retail_price = 5000,
        first_free = false,
    },
}

local zone = {}
local model = {}
local vehicles = {}
local data = {}

RegisterServerEvent("polcars:getPolcars")
AddEventHandler("polcars:getPolcars", function(z)
zone = z
end)

RegisterServerEvent("polcars:checkOwnedStatus")
AddEventHandler("polcars:checkOwnedStatus", function(z)
model = z
end)

RegisterServerEvent("polcars:purchasePolcar")
AddEventHandler("polcars:purchasePolcar", function(t,v)
vehicles = t
data = v
end)

RPC.register("polcars:getPolcars", function(src)
    if zone == "police" then
        return policeList
    else
        return emsList
    end
end)

RPC.register("polcars:checkOwnedStatus", function(src)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src) 
    local info = user:getCurrentCharacter()
    exports.oxmysql:execute("SELECT * FROM characters_cars WHERE cid = @cid", {["cid"] = info.id}, function(vehicles)
        for k,v in pairs(vehicles) do
            if vehicles[k].model == model then
                exports.oxmysql:execute("SELECT * FROM characters_cars WHERE id = @id", {["id"] = vehicles[k].id}, function(vehicles_metadata)
                    return metadata
                end)
            else
                return false
            end
        end
    end)
end)

RPC.register("polcars:purchasePolcar", function(src)
    local user = exports["rd-base"]:getModule("Player"):GetUser(src) 
    local info = user:getCurrentCharacter()

    if vehicles == "police" then
        for k,v in pairs(policeList) do 
            if policeList[k].model == data.key then
                if user:getBalance() >= policeList[k].retail_price then
                    local vehicleData = exports["rd-vehicles"]:GenerateVehicleInfo(src, info.id, data.model, "pd", "pd", nil, policeList[k].name)
                    local comment = "Bought " .. policeList[k].name .. " for " .. policeList[k].retail_price
                    TriggerEvent("rd:vehicles:InsertVehicleData", src, vehicleData)        

                    user:removeBank(policeList[k].retail_price)
                    s = true
                    if not s then 
                        return false, "Not enough money in your Bank Account!"
                    end

                    Citizen.Wait(500)

                    local changeGarage = MySQL.update.await([[
                        UPDATE characters_cars
                        SET garage = ?
                        WHERE vin = ?
                    ]],
                    { "pd_shared", vehicleData.vin })

                    return true , "You purchased " .. policeList[k].name .. " you may find in the PD Shared Garage"
                else
                    return false, "Not enough money in your Bank Account!"
                end
            end
        end
    else
        for k,v in pairs(emsList) do 
            if emsList[k].model == data.key then
                local bank = exports["rd-financials"]:getAccountBalance(12) 
                if bank > emsList[k].retail_price then
                    local vehicleData = exports["rd-vehicles"]:GenerateVehicleInfo(src, info.id, data.model, "pd", "pd", nil, emsList[k].name)
                    TriggerEvent("rd:vehicles:InsertVehicleData", src, vehicleData)        

                    if exports["isPed"]:isPed("mycash") >= 5000 then

                    Citizen.Wait(500)

                    local changeGarage = MySQL.update.await([[
                        UPDATE characters_cars
                        SET garage = ?
                        WHERE vin = ?
                    ]],
                    { "ems_shared", vehicleData.vin })

                    return true , "You purchased " .. emsList[k].name .. " you may find in the EMS Shared Garage"
                else
                    return false , "Not enough money in the Emergency Medical Services Bank account!"
                    end
                end
            end
        end
    end
end)