local inmate = 0

relogging = false
cellcoords = { 
    [1] = { ['x'] = 1767.7978515625, ['y'] = 2500.5495605469, ['z'] = 45.725219726562, ['h'] = 209.76377868652, ['info'] = ' cell1' },
    [2] = { ['x'] = 1764.6988525391, ['y'] = 2498.8220214844, ['z'] = 45.725219726562, ['h'] = 209.76377868652, ['info'] = ' cell2' },
    [3] = { ['x'] = 1761.3231201172, ['y'] = 2497.1604003906, ['z'] = 45.725219726562, ['h'] = 206.92913818359, ['info'] = ' cell3' },
    [4] = { ['x'] = 1755.5208740234, ['y'] = 2493.3889160156, ['z'] = 45.725219726562, ['h'] = 206.92913818359, ['info'] = ' cell4' },
    [5] = { ['x'] = 1751.6571044922, ['y'] = 2492.2153320312, ['z'] = 45.725219726562, ['h'] = 209.76377868652, ['info'] = ' cell5' },
    [6] = { ['x'] = 1748.8879394531, ['y'] = 2489.3273925781, ['z'] = 45.725219726562, ['h'] = 209.76377868652, ['info'] = ' cell6' },
    [7] =  { ['x'] = 1767.4154052734, ['y'] = 2500.9714355469, ['z'] = 49.684936523438, ['h'] = 218.2677154541, ['info'] = ' cell7' },
    [8] =  { ['x'] = 1764.6329345703, ['y'] = 2498.9802246094, ['z'] = 49.684936523438, ['h'] = 206.92913818359, ['info'] = ' cell8' },
    [9] =  { ['x'] = 1761.5340576172, ['y'] = 2497.3317871094, ['z'] = 49.684936523438, ['h'] = 204.09449768066, ['info'] = ' cell9' },
    [10] = { ['x'] = 1758.2241210938, ['y'] = 2495.4196777344, ['z'] = 49.684936523438, ['h'] = 206.92913818359, ['info'] = ' cell10' },
    [11] = { ['x'] = 1755.0461425781, ['y'] = 2493.4943847656, ['z'] = 49.684936523438, ['h'] = 206.92913818359, ['info'] = ' cell11' },
    [12] = { ['x'] = 1774.2857666016, ['y'] = 2481.1779785156, ['z'] = 49.684936523438, ['h'] = 25.511810302734, ['info'] = ' cell12' },
    [13] = { ['x'] = 1777.3450927734, ['y'] = 2483.4990234375, ['z'] = 49.684936523438, ['h'] = 28.346454620361,['info'] = ' cell13' },
    [14] = { ['x'] = 1776.9099121094, ['y'] = 2483.841796875, ['z'] = 45.725219726562, ['h'] = 31.181098937988, ['info'] = ' cell14' },
    [15] = { ['x'] = 1773.9956054688, ['y'] = 2481.5209960938, ['z'] = 45.725219726562, ['h'] = 28.346454620361, ['info'] = ' cell15' },
    [16] = { ['x'] = 1770.7780761719, ['y'] = 2479.8989257812, ['z'] = 45.725219726562, ['h'] = 31.181098937988, ['info'] = ' cell16' },
    [17] = { ['x'] = 1767.82421875, ['y'] = 2477.6176757812, ['z'] = 45.725219726562, ['h'] = 31.181098937988, ['info'] = ' cell17' },
    [18] = { ['x'] = 1764.3033447266, ['y'] = 2476.6286621094, ['z'] = 45.725219726562, ['h'] = 34.015747070312, ['info'] = ' cell18' },
    [19] = { ['x'] = 1761.7054443359, ['y'] = 2474.5187988281, ['z'] = 45.725219726562, ['h'] = 51.023620605469, ['info'] = ' cell19' },
    [20] = { ['x'] = 1758.2769775391, ['y'] = 2472.8967285156, ['z'] = 45.725219726562, ['h'] = 31.181098937988, ['info'] = ' cell20' },
}


eatenRecently = false
cleanedRecently = false
repairedRecently = false
local mycell = 1

imjailed = false
curTaskType = "None"
jobProcess = false
lockdown = false

secondOfDay = 19801
RegisterNetEvent('kTimeSync')
AddEventHandler("kTimeSync", function( data )
    secondOfDay = data
end)

RegisterNetEvent('jailbreak:reclaimitems')
AddEventHandler('jailbreak:reclaimitems', function(table)
    local sexcid = exports["isPed"]:isPed("cid")
    TriggerServerEvent("server-jail-item", 'ply-'..sexcid, false)
    TriggerEvent("DoLongHudText", "You have re-claimed your possessions.")
end)

Citizen.CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(PlayerPedId())
        Citizen.Wait(1000)
    end
end)

function endanimation()
    ClearPedSecondaryTask(PlayerPedId())
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


Controlkey = {["generalUse"] = {38,"E"},["generalUseThird"] = {47,"G"} ,["housingMain"] = {74,"H"}} 
RegisterNetEvent('event:control:update')
AddEventHandler('event:control:update', function(table)
    Controlkey["generalUse"] = table["generalUse"]
    Controlkey["generalUseThird"] = table["generalUseThird"]
    Controlkey["housingMain"] = table["housingMain"]
end)

RegisterNetEvent('beginJail2')
AddEventHandler('beginJail2', function(time,skipintake)
    TriggerEvent("beginJail",skipintake,tonumber(time))
end)

function JailIntro(name,years,cid,date)
    if tonumber(years) > 40 then
        local cid = exports["isPed"]:isPed("cid")
        TriggerServerEvent("shops:jail:remove",cid)
    end
    DoScreenFadeOut(10)
    FreezeEntityPosition(PlayerPedId(), true)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'handcuff', 1.0)

    
    TriggerEvent("police:remmaskAccepted")
    TriggerServerEvent("request:vinewooddel")
    Citizen.Wait(1000)

    local timer = 0
    while timer ~= -1 do
        timer = timer + 1
        Citizen.Wait(1)

        SetEntityCoords(PlayerPedId(),472.7355, -1011.272, 25.27331)
        if IsInteriorReady(GetInteriorAtCoords(472.7355, -1011.272, 25.27331)) or timer > 1000 then
            timer = -1
        end
    end



    SetEntityCoords(PlayerPedId(),472.7355, -1011.272, 25.27331)
    SetEntityHeading(PlayerPedId(),178.9855)
    Citizen.Wait(1500) 
    DoScreenFadeIn(500)
    TriggerEvent("attachItemCONLOL","con1",name,years,cid,date)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)     
    SetEntityHeading(PlayerPedId(),269.3963) 

    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)  
    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)         
    SetEntityHeading(PlayerPedId(),89.3215) 

    TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000) 
     TriggerEvent('InteractSound_CL:PlayOnOne', 'photo', 0.4)
    Citizen.Wait(3000)       

    SetEntityHeading(PlayerPedId(),178.9855)

    Citizen.Wait(2000)
    DoScreenFadeOut(1100)   
    Citizen.Wait(2000)
    TriggerEvent('InteractSound_CL:PlayOnOne', 'jaildoor', 1.0)

end

DoScreenFadeIn(1500)
SwappingCharacters = false
outofrange = false
minutes = 0

function RoleplayStats()

    local totalroleplay = 0

    if exports["rd-inventory"]:hasEnoughOfItem("shitlockpick",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if exports["rd-inventory"]:hasEnoughOfItem("jailfood",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if exports["rd-inventory"]:hasEnoughOfItem("methbag",1,false) then
        totalroleplay = totalroleplay + 15
    end

    if exports["rd-inventory"]:hasEnoughOfItem("assphone",1,false) then
        totalroleplay = totalroleplay + 15
        if math.random(10) < 3 then
             TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'pager', 0.4)
        end
    end

    if exports["rd-inventory"]:hasEnoughOfItem("slushy",1,false) then
        totalroleplay = totalroleplay + 10
    end

    if math.random(70) < totalroleplay then
        TriggerEvent("DoLongHudText","All that roleplay adds up!")
        Wait(1000)
        TriggerServerEvent("jail:cuttime")
    end

end

function InmateAnim()
    if ( DoesEntityExist( inmate ) and not IsEntityDead( inmate ) ) then 
        loadAnimDict( "random@mugging4" )
        TaskPlayAnim( inmate, "random@mugging4", "agitated_loop_a", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    end
end

function InmateDelete()
    if DoesEntityExist(inmate) then 
        SetPedAsNoLongerNeeded(inmate)
        DeletePed(inmate)
    end
end

function InmateCreate()
    local hashKey = -1313105063
    local pedType = 5
    RequestModel(hashKey)
    while not HasModelLoaded(hashKey) do
        RequestModel(hashKey)
        Citizen.Wait(100)
    end
    inmate = CreatePed(pedType, hashKey, 1642.08, 2522.16, 45.57, 43.62, false, false)
    DecorSetBool(inmate, 'ScriptedPed', true)
end

function InmatePedSettings()
    DecorSetBool(inmate, 'ScriptedPed', true)
    SetEntityInvincible(inmate,true)
    ClearPedTasks(inmate)
    ClearPedSecondaryTask(inmate)
    TaskSetBlockingOfNonTemporaryEvents(inmate, true)
    SetPedFleeAttributes(inmate, 0, 0)
    SetPedCombatAttributes(inmate, 17, 1)
    SetPedSeeingRange(inmate, 0.0)
    SetPedHearingRange(inmate, 0.0)
    SetPedAlertness(inmate, 0)
    SetPedKeepTask(inmate, true)
end

RegisterNetEvent('beginJail')
AddEventHandler('beginJail', function(skipintake,time,name,cid,date)

    TriggerServerEvent("TacoShop:reputationChange",-20)

    imjailed = false
    local playerPed = PlayerPedId()
    local mycid = exports["isPed"]:isPed("cid")

    local gang = exports["isPed"]:isPed("gang")
    if gang == 4 then
        TriggerServerEvent("wipeweed")
    end    

    TriggerEvent("DensityModifierEnable",false)
    mycell = math.random(1,20)
    minutes = tonumber(time)


    if not skipintake then
        JailIntro(name,time,cid,date)
    end
    FreezeEntityPosition(playerPed, false)
    
    
    TriggerEvent("shop:createMeth")

    minCalc = 15000

    DoScreenFadeOut(1)
    TriggerServerEvent('server-jail-item', 'ply-'..mycid, true)
    if mycell == nil then
        mycell = 1
    end
    
    SetEntityCoords(playerPed, cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z ) 

    TriggerServerEvent("updateJailTime",minutes)
 
    InmateDelete()
    InmateCreate()
    InmatePedSettings()
    InmateAnim()
    local jailluck = math.random(100)
    if minutes > 60 then
        jailluck = jailluck - math.ceil(minutes/10)
    end


    Citizen.Wait(500)
    TriggerEvent("doors:resetTimer")
    FreezeEntityPosition(playerPed, false)
    DoScreenFadeIn(1500)
    TriggerEvent("falseCuffs")  

    
    imjailed = true
    RemoveAllPedWeapons(playerPed)
    TriggerEvent("attachWeapons")
    TriggerEvent("DoLongHudText", "You have been jailed. You can pick up your shit when you leave.")
    TriggerEvent("inhotel",false)
    while imjailed do
        Citizen.Wait(1)

        if minCalc == 0 then
            playerPed = PlayerPedId()
            minCalc = 15000
            RoleplayStats()
            TriggerServerEvent("checkJailTime",false)
        end


        if (#(GetEntityCoords(playerPed, 0) - vector3(1642.08, 2522.16, 45.57)) < 1.0) then
            drawTxt(0.90, 1.40, 1.0,1.0,0.25, "Inmates looking like he wants something..?", 255, 255, 255, 255)
            if IsControlJustPressed(1, Controlkey["generalUse"][1]) then
                TriggerEvent("server-inventory-open", "0011", "Craft")                
                Citizen.Wait(5000)
            end
        end


        if (#(GetEntityCoords(playerPed) - vector3(cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z)) > 340) then
            SetEntityCoords(playerPed, cellcoords[mycell].x,cellcoords[mycell].y,cellcoords[mycell].z) 
        end

        minCalc = minCalc - 1
    end
    if relogging then
        return
    end
    
    RemoveBlip(Blip)
    TriggerEvent("DensityModifierEnable",true)
end)

RegisterNetEvent('rd-jail:checkTime')
AddEventHandler('rd-jail:checkTime', function()
    TriggerServerEvent("checkJailTime",true)
end)

RegisterNetEvent('swappingCharsLoop')
AddEventHandler('swappingCharsLoop', function()
    TransitionToBlurred(500)
    DoScreenFadeOut(500)
    Citizen.Wait(1000)
    TriggerEvent("rd-base:clearStates")
    exports["rd-base"]:getModule("SpawnManager"):Initialize()
    relogging = true
    imjailed = false
    -- trigger character swap
    Wait(4000)
    relogging = false
end)

RegisterNetEvent('noinstancezone')
AddEventHandler('noinstancezone', function()
    TriggerEvent('apartments:leave')
    TransitionToBlurred(500)
    DoScreenFadeOut(500)
    Citizen.Wait(1000)
    TriggerEvent("rd-base:clearStates")
    exports["rd-base"]:getModule("SpawnManager"):Initialize()
    relogging = true
    imjailed = false
    -- trigger character swap
    Wait(4000)
    relogging = false
end)

RegisterNetEvent('TimeRemaining')
AddEventHandler('TimeRemaining', function(TimeRemaining, release)

    local playerPed = GetPlayerPed(-1)

    local TimeR = TimeRemaining

    if TimeR <= 0 and release then 
       imjailed = false
        TriggerEvent("DoLongHudText", "You are free!.",1)
        TriggerEvent("givePhone")
        SetEntityCoords(playerPed, 1837.1076660156,2589.7319335938,46.01171875)
        SetEntityHeading(playerPed, 204.09449768066)
       
    else

    local minutes = TimeR
    TriggerEvent("chatMessage", "DOC | " , 2, "You have " .. minutes .. " month(s) remaining")
    end
end)

RegisterNetEvent('endJailTime')
AddEventHandler('endJailTime', function()
    imjailed = false
end)

RegisterNetEvent('beginJail3')
AddEventHandler('beginJail3', function(time)
    TriggerEvent("beginJailMobster",tonumber(time))
end)

RegisterNetEvent('beginJailMobster')
AddEventHandler('beginJailMobster', function(time)
    imjailedmobster = true
    minutes = tonumber(time)
    TriggerEvent("DensityModifierEnable",false)
    minutes = tonumber(minutes) >= 120 and 120 or tonumber(minutes)
    TriggerEvent("DoLongHudText", "You were dumped here.. weird.",1)
    minCalc = 60
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), 143.79208374023,-2201.6572265625,4.6880202293396) 
    TriggerServerEvent("updateJailTimeMobster",minutes)
    TriggerEvent("falseCuffs")  


        while imjailedmobster do
            Citizen.Wait(1000)
            RemoveAllPedWeapons(PlayerPedId())
            TriggerEvent("attachWeapons")
            if minCalc < 1 then
                
                minCalc = 60
                minutes = minutes - 1
                TriggerEvent("DoLongHudText", "You have " .. minutes .. " minutes remaining",1)
                TriggerServerEvent("updateJailTimeMobster",minutes)
            end

            if (#(GetEntityCoords(PlayerPedId(), 0) - vector3(143.79208374023,-2201.6572265625,4.6880202293396)) > 5) then
                SetEntityCoords(PlayerPedId(), 143.79208374023,-2201.6572265625,4.6880202293396) 
            end

            if minutes < 2 then
                imjailedmobster = false
            end

            minCalc = minCalc - 1
        end

        TriggerServerEvent("updateJailTimeMobster",0)
        TriggerEvent("DoLongHudText", "You were dumped here.. weird.",1)
        SetEntityCoords(PlayerPedId(), 164.2027130127,-1721.9739990234,29.291980743408)

        TriggerEvent("DensityModifierEnable",true)
end)

-- Electrical Job Jail --

local ElectricalJobInProgress = false
local ElectricalJob1 = false
local ElectricalJob2 = false
local ElectricalJob3 = false
local ElectricalJob4 = false
local ElectricalJob5 = false
local ElectricalJob6 = false
local ElectricalJob7 = false
local ElectricalJob8 = false

-- Job 1

    -- Electrical Job 1 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_1", vector3(1695.93,2536.057,45.55283), 1, 1.8, {
        heading=270,
        minZ=41.77,
        maxZ=45.77
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_1", {
    {
        event = "rd-jail:work-box-1",
        id = "void_electrical_job_1",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob1
        end,
    });

    RegisterNetEvent('rd-jail:work-box-1')
    AddEventHandler('rd-jail:work-box-1', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob1 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip1)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 2 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_2", vector3(1652.62, 2565.13, 45.56), 2, 3.4, {
        heading=0,
        minZ=42.96,
        maxZ=46.96
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_2", {
    {
        event = "rd-jail:work-box-2",
        id = "void_electrical_job_2",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob2
        end,
    });

    RegisterNetEvent('rd-jail:work-box-2')
    AddEventHandler('rd-jail:work-box-2', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob2 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip2)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 3 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_3", vector3(1630.0, 2565.25, 45.56), 2, 3.8, {
        heading=0,
        minZ=43.16,
        maxZ=47.16
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_3", {
    {
        event = "rd-jail:work-box-3",
        id = "void_electrical_job_3",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob3
        end,
    });

    RegisterNetEvent('rd-jail:work-box-3')
    AddEventHandler('rd-jail:work-box-3', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob3 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip3)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 4 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_4", vector3(1617.3387, 2578.6164, 45.552791), 2, 2.2, {  
        heading=270,
        minZ=43.36,
        maxZ=47.36
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_4", {
    {
        event = "rd-jail:work-box-4",
        id = "void_electrical_job_4",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob4
        end,
    });

    RegisterNetEvent('rd-jail:work-box-4')
    AddEventHandler('rd-jail:work-box-4', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob4 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip4)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 5 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_5", vector3(1630.5155, 2527.2539, 45.552795), 1, 1, {
        heading=315,
        minZ=42.77,
        maxZ=46.77
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_5", {
    {
        event = "rd-jail:work-box-5",
        id = "void_electrical_job_5",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob5
        end,
    });

    RegisterNetEvent('rd-jail:work-box-5')
    AddEventHandler('rd-jail:work-box-5', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob5 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip5)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 6 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_6", vector3(1655.8526, 2489.7385, 45.552795), 1, 1, {
        heading=315,
        minZ=42.77,
        maxZ=46.77
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_6", {
    {
        event = "rd-jail:work-box-6",
        id = "void_electrical_job_6",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob6
        end,
    });

    RegisterNetEvent('rd-jail:work-box-6')
    AddEventHandler('rd-jail:work-box-6', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob6 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip6)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 7 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_7", vector3(1657.6341, 2489.0827, 45.552795), 1, 1, {
        heading=315,
        minZ=42.76,
        maxZ=46.76
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_7", {
    {
        event = "rd-jail:work-box-7",
        id = "void_electrical_job_7",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob7
        end,
    });

    RegisterNetEvent('rd-jail:work-box-7')
    AddEventHandler('rd-jail:work-box-7', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob7 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip7)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    -- Electrical Job 8 
    exports["rd-polytarget"]:AddBoxZone("void_electrical_job_8", vector3(1666.4895, 2487.8957, 45.552833), 2, 2.2, {
        heading=275,
        minZ=43.36,
        maxZ=47.36
    })

    exports["rd-interact"]:AddPeekEntryByPolyTarget("void_electrical_job_8", {
    {
        event = "rd-jail:work-box-8",
        id = "void_electrical_job_8",
        icon = "circle",
        label = "Fix Electrical",
        parameters = {},
    }
    }, {
        distance = { radius = 1.5 },
        isEnabled = function()
            return ElectricalJob8
        end,
    });

    RegisterNetEvent('rd-jail:work-box-8')
    AddEventHandler('rd-jail:work-box-8', function()
        TriggerEvent("animation:PlayAnimation","welding")
        FreezeEntityPosition(PlayerPedId(), true)
        ElectricalJob8 = false
        local finished = exports['rd-taskbar']:taskBar(7500, 'Repairing Electrical Box')
        if finished == 100 then
            ElectricalJobInProgress = false
            FreezeEntityPosition(PlayerPedId(), false)
            TriggerServerEvent('rd-jail:remove-time-electrical')
            RemoveBlip(ElectricalJobBlip8)
            TriggerServerEvent("checkJailTime",true)
        end
    end)

    ----------------------------------------------------------------------------------------

    RegisterNetEvent('rd-jail:electrical-get-job')
    AddEventHandler('rd-jail:electrical-get-job', function()
        local roll = math.random(1, 8)
        if roll == 1 and not ElectricalJobInProgress then
            print('1')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob1 = true
            ElectricalJobBlip1 = AddBlipForCoord(1695.93,2536.057,45.55283)
            SetBlipSprite(ElectricalJobBlip1, 1)
            SetBlipSprite(ElectricalJobBlip1, 466)
            SetBlipScale(ElectricalJobBlip1, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip1)
        elseif roll == 2 and not ElectricalJobInProgress then
            print('2')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob2 = true
            ElectricalJobBlip2 = AddBlipForCoord(1652.62, 2565.13, 45.56)
            SetBlipSprite(ElectricalJobBlip2, 1)
            SetBlipSprite(ElectricalJobBlip2, 466)
            SetBlipScale(ElectricalJobBlip2, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip2)
        elseif roll == 3 and not ElectricalJobInProgress then
            print('3')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob3 = true
            ElectricalJobBlip3 = AddBlipForCoord(1630.0, 2565.25, 45.56)
            SetBlipSprite(ElectricalJobBlip3, 1)
            SetBlipSprite(ElectricalJobBlip3, 466)
            SetBlipScale(ElectricalJobBlip3, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip3)
        elseif roll == 4 and not ElectricalJobInProgress then
            print('4')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob4 = true
            ElectricalJobBlip4 = AddBlipForCoord(1617.3387, 2578.6164, 45.552791)
            SetBlipSprite(ElectricalJobBlip4, 1)
            SetBlipSprite(ElectricalJobBlip4, 466)
            SetBlipScale(ElectricalJobBlip4, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip4)
        elseif roll == 5 and not ElectricalJobInProgress then
            print('5')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob5 = true
            ElectricalJobBlip5 = AddBlipForCoord(1630.5155, 2527.2539, 45.552795)
            SetBlipSprite(ElectricalJobBlip5, 1)
            SetBlipSprite(ElectricalJobBlip5, 466)
            SetBlipScale(ElectricalJobBlip5, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip5)
        elseif roll == 6 and not ElectricalJobInProgress then
            print('6')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob6 = true
            ElectricalJobBlip6 = AddBlipForCoord(1655.8526, 2489.7385, 45.552795)
            SetBlipSprite(ElectricalJobBlip6, 1)
            SetBlipSprite(ElectricalJobBlip6, 466)
            SetBlipScale(ElectricalJobBlip6, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip6)
        elseif roll == 7 and not ElectricalJobInProgress then
            print('7')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob7 = true
            ElectricalJobBlip7 = AddBlipForCoord(1657.6341, 2489.0827, 45.552795)
            SetBlipSprite(ElectricalJobBlip7, 1)
            SetBlipSprite(ElectricalJobBlip7, 466)
            SetBlipScale(ElectricalJobBlip7, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip7)
        elseif roll == 8 and not ElectricalJobInProgress then
            print('8')
            ElectricalJobInProgress = true
            TriggerEvent('DoLongHudText', 'Jail Job On GPS', 1)
            ElectricalJob8 = true
            ElectricalJobBlip8 = AddBlipForCoord(1666.4895, 2487.8957, 45.552833)
            SetBlipSprite(ElectricalJobBlip8, 1)
            SetBlipSprite(ElectricalJobBlip8, 466)
            SetBlipScale(ElectricalJobBlip8, 1.2)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Electrical Job")
            EndTextCommandSetBlipName(ElectricalJobBlip8)
        end
    end)

    -- START OF BIKE RENTAL

RegisterNetEvent('rd-rentals:bmx')
AddEventHandler('rd-rentals:bmx', function()
    local pBMXShit = {
        {
            title = "Rent Vehicle",
            description = "BMX | $50",
            key = "BMX",
            action = 'rd-jail:spawn_bmx',
        },
    }
    exports["rd-ui"]:showContextMenu(pBMXShit)
end)

RegisterUICallback('rd-jail:spawn_bmx', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-rentals:attemptvehiclespawn1', 'bmx')
end)


local vehicleList = {
    { name = "BMX", model = "bmx", price = 50 },
}

RegisterNetEvent("rd-rentals:attemptvehiclespawn1")
AddEventHandler("rd-rentals:attemptvehiclespawn1", function(pChoice)
  local vehicle = pChoice
  if IsAnyVehicleNearPoint(117.84, -1079.95, 29.23, 3.0) then
    TriggerEvent("DoLongHudText", "There's a vehicle in the way!", 2)
    return
  else
    TriggerServerEvent("rd-rentals:attemptPurchase1",vehicle)
  end 
end)

RegisterNetEvent("rd-rentals:attemptvehiclespawnfail1")
AddEventHandler("rd-rentals:attemptvehiclespawnfail", function()
    TriggerEvent("DoLongHudText", "Not enough money!", 2)
end)

RegisterNetEvent("rd-rentals:vehiclespawn1")
AddEventHandler("rd-rentals:vehiclespawn1", function(data, cb)

  print(data)

  local model = data

  RequestModel(model)
  while not HasModelLoaded(model) do
      Citizen.Wait(0)
  end
  SetModelAsNoLongerNeeded(model)

  local rentalVehiclenp = CreateVehicle(model, vector4(1626.8624, 2589.4233, 45.55281, 329.5769), true, false)

  Citizen.Wait(100)

  SetEntityAsMissionEntity(rentalVehiclenp, true, true)
  SetModelAsNoLongerNeeded(model)
  SetVehicleOnGroundProperly(rentalVehiclenp)

  TaskWarpPedIntoVehicle(PlayerPedId(), rentalVehiclenp, -1)
  SetVehicleNumberPlateText(rentalVehiclenp, "Rental"..tostring(math.random(1000, 9999)))
  TriggerEvent("vehicle:keys:addNew",rentalVehiclenp,plate)

  local plateText = GetVehicleNumberPlateText(rentalVehiclenp)
  local player = exports["rd-base"]:getModule("LocalPlayer")
  
  local information = {
    ["Plate"] = plateText,
    ["Vehicle"] = data,
    ["Rentee"] = ""..player.character.first_name.." "..player.character.last_name,
  }
  


  local timeout = 10
  while not NetworkDoesEntityExistWithNetworkId(rentalVehiclenp) and timeout > 0 do
      timeout = timeout - 1
      Wait(1000)
  end

end)

-- END OF BIKE RENTAL


RegisterNetEvent('nicx-jail:shop')
AddEventHandler('nicx-jail:shop', function()
    TriggerEvent('server-inventory-open', '606', 'Craft')
end)



-- start of clean job


RegisterNetEvent("Trash:prison")
AddEventHandler("Trash:prison", function()
    local bitch = exports['rd-inventory']:getQuantity("trashbag")
    if bitch >= 1 then        
        currentlySmelting = true
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
            
        FreezeEntityPosition(playerPed, true)
        SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'))
        Citizen.Wait(200)
        TriggerEvent('animation:PlayAnimation', 'mechanic')
        local finished = exports["rd-taskbar"]:taskBar(10000,"Picking up trash")
        if finished == 100 then

                
            local itemLimit1 = exports['rd-inventory']:getQuantity("cigarette")
            local itemLimit2 = exports['rd-inventory']:getQuantity("asslockpick")
            local itemLimit3 = exports['rd-inventory']:getQuantity("aluminium")
            local itemLimit4 = exports['rd-inventory']:getQuantity("copper")
            local itemLimit5 = exports['rd-inventory']:getQuantity("copperbar")
            local itemLimit6 = exports['rd-inventory']:getQuantity("ironbar")
            
            local rewardChance = math.random(1,10)

            if rewardChance == 1 then
                if itemLimit1 < 10000 then
                    TriggerEvent('player:receiveItem', "cigarette", math.random(1,7))
                    TriggerEvent('DoLongHudText', 'You received a cigarettes!')
                end
            elseif rewardChance == 2 then
                if itemLimit2 < 10000 then
                    TriggerEvent('player:receiveItem', "asslockpick", math.random(1,1))
                    TriggerEvent('DoLongHudText', 'You received a asslockpick!')
                end
            elseif rewardChance == 3 or rewardChance == 4 or rewardChance == 5 then
                local firstChance = math.random(1,2)
                if firstChance == 1 then
                    if itemLimit3 < 10000 then
                        TriggerEvent('player:receiveItem', "cigarette", math.random(1,7))
                        TriggerEvent('DoLongHudText', 'You received a cigarette!')
                    end
                else
                    if itemLimit4 < 10000 then
                        TriggerEvent('player:receiveItem', "aluminium", math.random(1,8))
                        TriggerEvent('DoLongHudText', 'You received a aluminium!')
                    end
                end
            elseif rewardChance == 6 or rewardChance == 7 or rewardChance == 8 or rewardChance == 9 or rewardChance == 10 then
                local secondChance = math.random(1,2)
                if secondChance == 1 then
                    if itemLimit5 < 10000 then
                        TriggerEvent('player:receiveItem', "copper", math.random(1,8))
                        TriggerEvent('DoLongHudText', 'You received a Copper!')
                    end
                else
                    if itemLimit6 < 10000 then
                        TriggerEvent('player:receiveItem', "cigarette", math.random(1, 25))
                        TriggerEvent('DoLongHudText', 'You received a cigarette!')
                    end
                end
            end
            
            FreezeEntityPosition(playerPed, false)
            currentlySmelting = false
            keyPressed = false
        end
    else
        TriggerEvent('DoLongHudText', 'You need a trash bag!', 2)
        keyPressed = false
    end
end)

RegisterNetEvent('nicx-jail:trashbag')
AddEventHandler('nicx-jail:trashbag', function()
    TriggerEvent('player:receiveItem', "trashbag", math.random(1,1))
end)

-- end of cleaning job

    -- Jail jobs context menu

RegisterNetEvent('rd-jobs:jail-jobs:menu')
AddEventHandler('rd-jobs:jail-jobs:menu', function()
    if imjailed then
        local JailJobs = {
            {
                title = "Jail Jobs",
                key = "EVENTS.JAIL",
                children = {
                    { title = "Grab a Trash Bag", action = "rd-jail:trash_bag", key = "EVENTS.JAIL" },
                    { title = "Start Electrical Job", action = "rd-jail:electrical", key = "EVENTS.JAIL" },
                },
            },
        }
        exports["rd-ui"]:showContextMenu(JailJobs)
    end
end)

RegisterUICallback('rd-jail:trash_bag', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('nicx-jail:trashbag')
end)

RegisterUICallback('rd-jail:electrical', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jail:electrical-get-job')
end)

RegisterNetEvent('rd-jailmenu')
AddEventHandler('rd-jailmenu', function()

	local Jailmenu = {
		{
            title = "List Lawyers",
            description = "Check how many lawyers are in the city!",
            action = "rd-jail:lawyerspog",
        },
        {
            title = "Jail Time",
            description = "Check your jail time",
            action = "rd-jail:checktime2",
        },
        {
            title = "Swap Characters",
            children = {
				{
                    title = "Yes",
                    action = "rd-jail:swapchar",
                },
				{
                    title = "No",
                    action = "rd-jail:swap_char_no",
                },
            },
        },
    }
    exports["rd-ui"]:showContextMenu(Jailmenu)
end)

RegisterUICallback('rd-jail:swap_char_no', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
end)

RegisterUICallback('rd-jail:swapchar', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('swappingCharsLoop')
end)

RegisterUICallback('rd-jail:checktime2', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('rd-jail:checkTime')
end)

RegisterUICallback('rd-jail:lawyerspog', function(data, cb)
	cb({ data = {}, meta = { ok = true, message = '' } })
    TriggerEvent('yellowPages:retrieveLawyersOnline')
end)

local pGender = nil

RegisterNetEvent('getIdCard')
AddEventHandler('getIdCard', function()
    local player = exports["rd-base"]:getModule("LocalPlayer")

    if player.character.gender == 0 then
        pGender = "Male"
      else
        pGender = "Female"
    end

    local pIDInfo = {
        ["identifier"] = ""..player.character.id,
        ["Name"] = ""..player.character.first_name,
        ["Surname"] = ""..player.character.last_name,
        ["Sex"] = ""..pGender,
        ["DOB"] = ""..player.character.dob,
    }
    TriggerEvent("player:receiveItem", "idcard", 1, true, pIDInfo)
end)

RegisterNetEvent('rd-jail:id')
AddEventHandler('rd-jail:id', function()
    TriggerServerEvent('srvIDCard')
end)