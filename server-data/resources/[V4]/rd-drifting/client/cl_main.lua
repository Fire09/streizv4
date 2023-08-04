local inDriftMode = false
local driftPoints = 0
local mult = 0.2
local tick
local previous = 0
local total = 0
local screenScore = 0
local driftTime = 0
local idleTime = 0
local shouldResetPoints = false

local function Angle(veh)
    if not veh then return false end
    local vx, vy, vz = table.unpack(GetEntityVelocity(veh))
    local modV = math.sqrt(vx * vx + vy * vy)

    local rx, ry, rz = table.unpack(GetEntityRotation(veh, 0))
    local sn, cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))

    if GetEntitySpeed(veh) * 3.6 < 30 or GetVehicleCurrentGear(veh) == 0 then return 0, modV end -- Speed over 30 km/h

    local cosX = (sn * vx + cs * vy) / modV
    if cosX > 0.966 or cosX < 0 then return 0, modV end
    return math.deg(math.acos(cosX)) * 0.5, modV
end

local function calculateBonus(previous)
    local points = previous
    points = math.floor(points)
    return points or 0
end

function math.percentage(a, b)
    return (a * 100) / b
end

local currentPosition = 1
local totalPositions = 1

RegisterNetEvent('triggerDriftMode')
AddEventHandler('triggerDriftMode', function()
    local hasDriftKit = exports["rd-inventory"]:hasEnoughOfItem("driftanglekit", 1, false)
    inDriftMode = not inDriftMode

    if inDriftMode then
        if hasDriftKit then
            TriggerEvent('DoLongHudText', "Drift Mode Activated", 1)
            exports["rd-ui"]:sendAppEvent("status-hud", {
                show = true,
                title = "Drift Trails",
                values = {
                    "Position: " .. currentPosition .. "/" .. totalPositions,
                    "Points: " .. driftPoints,
                    "Time: " .. displayDriftTime()
                }
            })
            driftTime = GetGameTimer()
        else
            TriggerEvent('DoLongHudText', "You don't have a drift controller.", 2)
        end
    else
        TriggerEvent('DoLongHudText', "Drift Mode Disabled", 2)
        exports["rd-ui"]:sendAppEvent("status-hud", {
            show = false,
            title = "",
            values = ""
        })
        driftTime = 0
    end
end)


function ResetPoints()
    shouldResetPoints = true
end

function displayDriftTime()
    if driftTime == 0 then
        return "00:00"
    else
        local currentTime = GetGameTimer() - driftTime
        local minutes = math.floor(currentTime / 60000)
        local seconds = math.floor((currentTime % 60000) / 1000)
        return string.format("%02d:%02d", minutes, seconds)
    end
end

Citizen.CreateThread(function()
    local Sleep
    while true do
        Sleep = 3000
        if inDriftMode then
            Sleep = 1
            tick = GetGameTimer()
            local ped = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(ped)
            local angle, velocity = Angle(vehicle)
            local tempBool = tick - (0) < 1850
            if angle then
                if shouldResetPoints then
                    shouldResetPoints = false
                    driftPoints = 0
                    driftTime = tick
                end
                previous = driftPoints
                previous = calculateBonus(previous)
                total = total + previous
                driftPoints = driftPoints + math.floor(angle * velocity) * mult
                screenScore = calculateBonus(driftPoints)

                idleTime = tick
                exports["rd-ui"]:sendAppEvent("status-hud", {
                    show = true,
                    title = "Drift Trails",
                    values = {
                        "Position: " .. currentPosition .. "/" .. totalPositions,
                        "Points: " .. screenScore,
                        "Time: " .. displayDriftTime()
                    }
                })
            end
        end
        Wait(Sleep)
    end
end)

RegisterCommand("resetpoints", function()
    ResetPoints()
end)

RegisterCommand("driftmode", function()
    TriggerEvent('triggerDriftMode')
end)