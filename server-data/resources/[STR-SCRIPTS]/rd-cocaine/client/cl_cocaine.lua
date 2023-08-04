local enabled = true
local callStatus = 0
local eventStarted = false
local vehicle = 0
local dinghy = 0
local blip = 0
local dropCoords = {}
local jobStarted = false

RegisterNetEvent("cocaine-search", function()
	local ped = PlayerPedId()
    ExecuteCommand('e search')
    FreezeEntityPosition(ped,true)
    local finished = exports["rd-taskbar"]:taskBar(3000,"Searching Vehicle")
    if finished == 100 then
        TriggerEvent('player:receiveItem', "cocainebrick" , 1)
        TriggerEvent('DoLongHudText', 'You found it .. onto the next location!')
        FreezeEntityPosition(ped,false)
    else
        FreezeEntityPosition(ped,false)
    end
end)

 RegisterCommand('cocaine', function()
     TriggerEvent("heists:cocaine_payment")
     eventStarted = true
     EventLocation(129.2166,244.865,107.45)
 end)

RegisterNetEvent("heists:cocaine_payment")
AddEventHandler("heists:cocaine_payment", function ()
    if not enabled or eventStarted then
        TriggerEvent("DoLongHudText", "The man says - 'Get outta here!' and looks at you up and down.")
        return
    end
    -- make them pay 50k then call this event for 100k of drug drop off, if successful with numbers
    eventStarted = RPC.execute("heists:cocaine_paynow")
    if eventStarted then
        callStatus = 1
        TriggerEvent("DoLongHudText", "The man says 'Thanks' and hands you a list of phone numbers.")
        TriggerEvent("heists:cocaine_payment_accepted")
    else
        TriggerEvent("DoLongHudText", "The man says 'Not enough money' and motions you to move on.")
    end
end)

RegisterNetEvent("heists:cocaine_payment_accepted")
AddEventHandler("heists:cocaine_payment_accepted", function ()
    eventStarted = true
    EventLocation(129.2166,244.865,107.45)
end)

RegisterNetEvent("rd-heists:cocaine:failure")
AddEventHandler("rd-heists:cocaine:failure", function ()

    RemoveBlip(blip)
    TriggerEvent('InteractSound_CL:PlayOnOne','payphoneend', 1.0)
    TriggerEvent('DoLongHudText', 'Wrong Number!', 2)
    callStatus = 0
    eventStarted = false
    vehicle = 0
    dinghy = 0
    blip = 0
    dropCoords = {}
end)

RegisterNetEvent("rd-heists:cocaine:begin_start")
AddEventHandler("rd-heists:cocaine:begin_start", function ()
    print('Here 3')
    if not enabled or not eventStarted then
        return
    end
    callStatus = 2
    TriggerEvent('InteractSound_CL:PlayOnOne','payphoneend', 1.0)
    EventLocation(187.6109,-1043.832,29.33)   
end)

RegisterNetEvent("rd-heists:cocaine:success:2")
AddEventHandler("rd-heists:cocaine:success:2", function ()
    if not enabled or not eventStarted then
        return
    end
    callStatus = 3
    EventLocation(-523.91,-299.72,35.24)
    TriggerEvent('InteractSound_CL:PlayOnOne','payphoneend', 1.0)
end)

RegisterNetEvent("rd-heists:cocaine:success:3")
AddEventHandler("rd-heists:cocaine:success:3", function ()
    if not enabled or not eventStarted then
        return
    end
    callStatus = 4
    
    EventLocation(-618.7536, -209.0591, 37.353256)
    TriggerEvent('InteractSound_CL:PlayOnOne','payphoneend', 1.0)
end)

RegisterNetEvent("rd-heists:cocaine:success:4")
AddEventHandler("rd-heists:cocaine:success:4", function ()
    jobStarted = true
    callStatus = 0
    TriggerEvent('InteractSound_CL:PlayOnOne','payphoneend', 1.0)  
    StartEvent()
    CreateDropCoords()
    MainEvents(1)
    MainEvents(2)
    MainEvents(3)
    MainEvents(4)
end)

RegisterNetEvent("fx:do:Effect", function(x,y,z ,pTime)
    local ptfx
    RequestNamedPtfxAsset("scr_xm_ht")
    while not HasNamedPtfxAssetLoaded("scr_xm_ht") do
        Citizen.Wait(1)
    end
    ptfx = vector3(x,y,z)
    SetPtfxAssetNextCall("scr_xm_ht")
    local effect = StartParticleFxLoopedAtCoord("scr_xm_ht_package_flare", ptfx, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Citizen.Wait(pTime)
    StopParticleFxLooped(effect, 0)
end)

function CreatePhoneNumber(number,wanted)
    local length = 7
    local phoneNumber = "696-"
    local wantedFlag = false
    while length > 0 do
        Wait(1)
        local nGen = math.random(0,9)
        if not wanted then
            if nGen ~= number then
                if length == 3 then
                    phoneNumber = phoneNumber .. "-"
                end
                phoneNumber = phoneNumber .. nGen
                length = length - 1
            end
        end

        if wanted then
            if nGen == number then
                wantedFlag = true
            end
            if length == 3 then
                phoneNumber = phoneNumber .. "-"
            end
            phoneNumber = phoneNumber .. nGen
            length = length - 1
            if length == 2 and not wantedFlag then
                phoneNumber = phoneNumber .. "" .. number
                length = length - 1
            end
        end
    end
    return phoneNumber
end

function CreateDropCoords()
    local rand = 0
    for i=1, 4 do
        dropCoords[i] = { ["x"] = -3374.06, ["y"] = math.random(1,2184) + 1.00, ["z"] = -1.0 }
    end
end

function BlipEvent(x,y,z)
    RemoveBlip(blip)
    blip = AddBlipForCoord(x,y,z)
    SetBlipSprite(blip, 306)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 3)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Current Task")
    EndTextCommandSetBlipName(blip)
    SetNewWaypoint(x, y)
end

function EventLocation(x,y,z)
	BlipEvent(x,y,z)
    local timeout = 1200
    local success = false
    while timeout > 0 do
        timeout = timeout - 1
        Wait(1000)
        if ( GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),x,y,z) < 350.0 ) then
            success = true
            timeout = 0
        end 
    end
    return success
end

function StartEvent()
    TriggerEvent("DoLongHudText","Check the map!")
    EventLocation(1997.296, 4008.251, 31.3)
    vehicle = RPC.execute("heists:cocaine_start_vehicle")
end

function MainEvents(n)
    local timer = 300000
    TriggerEvent("DoLongHudText","GPS updated.")
    
    TriggerServerEvent("fx:spell:target",dropCoords[n]["x"],dropCoords[n]["y"],dropCoords[n]["z"] ,0)
    Wait(1000)

    local success = EventLocation(dropCoords[n]["x"],dropCoords[n]["y"],dropCoords[n]["z"])
    if success then
        local vector = vector3(dropCoords[n]["x"],dropCoords[n]["y"],dropCoords[n]["z"])
        TriggerServerEvent("fx:spell:target",dropCoords[n]["x"],dropCoords[n]["y"],dropCoords[n]["z"] ,timer)
        dinghy = RPC.execute("heists:cocaine_dump_vehicle", dropCoords[n]["x"],dropCoords[n]["y"],dropCoords[n]["z"])
    end
end


Citizen.CreateThread(function()
    local function statusCheck(result)
        if eventStarted and callStatus == 1 and result == 1 then
            return true
        elseif result == callStatus then
            return true
        end
        return false
    end
    -- START EVENT
    exports["rd-polytarget"]:AddBoxZone(
        "heist_cocaine_phonecall",
        vector3(129.38, 245.3, 107.45), 0.6, 1,
        {
            minZ=104.25,
            maxZ=108.25
        }
    );

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_begin_1",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(1)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_begin_2",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(1)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall', {{
        event = "rd-heists:cocaine:begin_start",
        id = "heist_cocaine_begin_3",
        icon = "phone",
        label = CreatePhoneNumber(0,false),
        parameters = {},
    }}, {
        distance = { radius = 6.0 },
        isEnabled = function()
            local status = statusCheck(1)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_begin_4",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(1)
            return status
        end,
    });


    -- SECOND EVENT

    exports["rd-polytarget"]:AddBoxZone(
        "heist_cocaine_phonecall_second",
        vector3(187.6109,-1043.832,29.33), 1.2, 1.0,
        {
          minZ = 28.64,
          maxZ = 30.44
        }
    );

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_second', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_second_1",
        icon = "phone",
        label = CreatePhoneNumber(7,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(2)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_second', {{
        event = "rd-heists:cocaine:success:2",
        id = "heist_cocaine_phonecall_second_2",
        icon = "phone",
        label = CreatePhoneNumber(7,false),
        parameters = {},
    }}, {
        distance = { radius = 6.0 },
        isEnabled = function()
            local status = statusCheck(2)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_second', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_second_3",
        icon = "phone",
        label = CreatePhoneNumber(7,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(2)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_second', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_second_4",
        icon = "phone",
        label = CreatePhoneNumber(7,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(2)
            return status
        end,
    });



    -- third event


    exports["rd-polytarget"]:AddBoxZone(
        "heist_cocaine_phonecall_third",
        vector3(-523.91,-299.72,35.24), 1.2, 1.0,
        {
          minZ = 34.64,
          maxZ = 36.04
        }
    );

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_third', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_third_1",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(3)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_third', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_third_2",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(3)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_third', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_third_3",
        icon = "phone",
        label = CreatePhoneNumber(0,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(3)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_third', {{
        event = "rd-heists:cocaine:success:3",
        id = "heist_cocaine_phonecall_third_4",
        icon = "phone",
        label = CreatePhoneNumber(0,false),
        parameters = {},
    }}, {
        distance = { radius = 6.0 },
        isEnabled = function()
            local status = statusCheck(3)
            return status
        end,
    });    




    -- fourth event

    exports["rd-polytarget"]:AddBoxZone(
        "heist_cocaine_phonecall_four",
        vector3(-618.94, -208.58, 37.3), 0.8, 0.8,
        {
        minZ=33.3,
        maxZ=38.3
        }
    );

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_four', {{
        event = "rd-heists:cocaine:success:4",
        id = "heist_cocaine_phonecall_four_1",
        icon = "phone",
        label = CreatePhoneNumber(9,false),
        parameters = {},
    }}, {
        distance = { radius = 6.0 },
        isEnabled = function()
            local status = statusCheck(4)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_four', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_four_2",
        icon = "phone",
        label = CreatePhoneNumber(9,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(4)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_four', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_four_3",
        icon = "phone",
        label = CreatePhoneNumber(9,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(4)
            return status
        end,
    });

    exports["rd-interact"]:AddPeekEntryByPolyTarget('heist_cocaine_phonecall_four', {{
        event = "rd-heists:cocaine:failure",
        id = "heist_cocaine_phonecall_four_4",
        icon = "phone",
        label = CreatePhoneNumber(9,true),
        parameters = {},
    }}, {
        distance = { radius = 1.0 },
        isEnabled = function()
            local status = statusCheck(4)
            return status
        end,
    });    


end)

RegisterNetEvent("rd-heists:doVehicle", function(pVehicle, x,y,z)
    local model = pVehicle
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
    SetModelAsNoLongerNeeded(model)
    local cocaineVehicle = CreateVehicle(model, vector3(x,y,z), true, false)
    Citizen.Wait(100)
    SetEntityAsMissionEntity(cocaineVehicle, true, true)
    SetModelAsNoLongerNeeded(model)
    SetVehicleNumberPlateText(cocaineVehicle, "XCJKX"..tostring(math.random(1000, 9999)))
    local plateText = GetVehicleNumberPlateText(cocaineVehicle)
    TriggerEvent("vehicle:keys:addNew",cocaineVehicle, plateText)
    TriggerServerEvent("rd-cocaine:create_coke_riddle", plateText)
    RPC.execute("rd-cocaine:create_coke")
end)

exports('isonMission' ,function ()
return jobStarted end)

-- RegisterCommand('cocaine', function()
--     TriggerEvent('heists:cocaine_payment')
--     jobStarted = true -- turn to false
--     Wait(5500)
--     TriggerEvent('rd-heists:cocaine:success:4')
-- end)