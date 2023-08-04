import {time, speed, aiService, aiSpeed} from './config';
import {getModelName , sendNotify} from './cl_func';
import {player} from './cl_var';

const Delay = (time: number) => new Promise(resolve => setTimeout(resolve, time));

let listenForTick = false

let autoActive = false;
let blipX = 0.0;
let blipY = 0.0;
let blipZ = 0.0;

onNet('autopilot:toggle', async (source: number) => {
    sendNotify('Sending GPS to tesla satellite please wait.');
    await Delay(11000);
    sendNotify('Thank you now enroute');
    listenForTick = true
    stopAuto();
    serverTick()
    console.log(listenForTick, "active");
    const vehicle = GetVehiclePedIsIn(player, false);
    SetDriverAbility(player, 1.0);
    let blip = GetFirstBlipInfoId(8);
    if (blip != null && blip != 0) {
        let coord = GetBlipCoords(blip);
        blipX = coord[0];
        blipY = coord[1];
        blipZ = coord[2];
        TaskVehicleDriveToCoordLongrange(player, vehicle, blipX, blipY, blipZ, speed, aiService, 2.0);
        autoActive = true;
    } else {
        emit('DoLongHudText', 'No Route Set, Please Set a Route or you need to be in a tesla vehicle', 2);
    }
});

async function serverTick() {
    while (listenForTick) {
        await Delay(time);
        if (autoActive) {
            let coords = GetEntityCoords(player, true);
            //var blip = GetFirstBlipInfoId(8);
            let dist = Vdist(coords[0], coords[1], coords[2], blipX, blipY, blipZ);
            if (dist <= 10) {
                let vehicle = GetVehiclePedIsIn(player, false);

                ClearPedTasks(player);
                let vehicleSpeed = speed;
                for (let i = 0; vehicleSpeed > 0; i++) {
                    SetVehicleForwardSpeed(vehicle, vehicleSpeed);
                    await Delay(time);
                    vehicleSpeed -= 5.0;
                }
                SetVehicleForwardSpeed(vehicle, 0.0);
                emit('DoLongHudText', 'You have arrived at your destination.', 1);
                listenForTick = false
                autoActive = false;
            }
        }
    }
}

async function stopAuto() {
    while (listenForTick) {
        await Delay(0);
        if (IsControlJustReleased(0, 8) && !IsEntityDead(player)) {
            if (autoActive) {
                emit('DoLongHudText', 'Tesla Satellite GPS Disconnected.', 2);
                if (listenForTick)
                {
                    listenForTick = false
                    console.log(listenForTick, "disconnected");
                };
                autoActive = false;
                ClearPedTasks(player);
            }
        }
    }
};

let parkingspots = [
    [859.13403, -29.3746, 78.764099, 60.306865],
    [872.24102, 8.8747901, 78.764137, 325.25552],
    [-357.44177246094, -775.76702880859, 33.542846679688, 83.98],
];

RegisterNuiCallbackType('lock');
on('__cfx_nui:lock', async (data: any, cb: any) => {
    if (GetVehicleClass(GetVehiclePedIsIn(player, true)) == 1) {
        let vehicle = GetVehiclePedIsIn(player, true);
        let lockCheck = false;
        if (lockCheck) {
            emit('keys:unlockDoor', vehicle, false);
            lockCheck = false;
        } else {
            emit('keys:unlockDoor', vehicle, true);
            lockCheck = true;
        }
        

        cb('ok');
    } else {
        sendNotify('You are not in a tesla vehicle');
    }
});

    

RegisterNuiCallbackType('recall');
on('__cfx_nui:recall', async (data: any, cb: any) => {
    if (GetVehicleClass(GetVehiclePedIsIn(player, true)) == 1) {
        RequestModel(GetHashKey('a_m_m_soucent_03'));
        while (!HasModelLoaded(GetHashKey('a_m_m_soucent_03'))) {
            await Delay(10);
        }
        let coords = GetEntityCoords(PlayerPedId(), true);
        let pPed = CreatePed(4, GetHashKey('a_m_m_soucent_03'), coords[0], coords[1], coords[2], 0.0, true, false);
        SetPedCanBeDraggedOut(pPed, false);
        let vehicle = GetVehiclePedIsIn(PlayerPedId(), true);
        SetPedIntoVehicle(pPed, vehicle, -1);
        SetEntityVisible(pPed, false, false);
        SetDriverAbility(pPed, 1.0)
        let vehName = getModelName(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
        vehicle = GetVehiclePedIsIn(pPed, false);
        await Delay(100);
        TaskVehicleDriveToCoordLongrange(pPed, vehicle, coords[0], coords[1], coords[2], aiSpeed, 1109408255, 5.0);
        emit('rd-phone:teslaNotify', `Your ${vehName} is Driving to your location. Please wait.`);
        while (true) {
            await Delay(0);
            let pedCoords = GetEntityCoords(pPed, true);
            let playerCoords = GetEntityCoords(PlayerPedId(), true);
            let dist = Vdist(pedCoords[0], pedCoords[1], pedCoords[2], playerCoords[0], playerCoords[1], playerCoords[2]);
            if (dist <= 5) {
                SetDriverAggressiveness(pPed, 0.0)
                ClearPedTasks(pPed);
                SetPedRelationshipGroupHash(pPed, GetHashKey('CIVMALE'));
                if (pPed != null) {
                    DeletePed(pPed);
                    console.log('Deleted');
                    emit('keys:unlockDoor', vehicle, false);
                }
            }
    cb('ok');
    }
    } else {
        sendNotify('You are not in a tesla vehicle');
    }

});

RegisterNuiCallbackType('parking');
on('__cfx_nui:parking', async (data: any, cb: any) => {
    if (GetVehicleClass(GetVehiclePedIsIn(player, true)) == 1) {
    RequestModel(GetHashKey('a_m_m_soucent_03'));
    while (!HasModelLoaded(GetHashKey('a_m_m_soucent_03'))) {
        await Delay(10);
    }
    var coords = GetEntityCoords(player, true);
    var pPed = CreatePed(4, GetHashKey('a_m_m_soucent_03'), coords[0], coords[1], coords[2], 0.0, true, false);
    SetPedCanBeDraggedOut(pPed, false);
    var vehicle = GetVehiclePedIsIn(player, true);
    SetPedIntoVehicle(pPed, vehicle, -1);
    SetEntityVisible(pPed, false, false);
    SetDriverAbility(pPed, 1.0);
    SetDriverAggressiveness(pPed, 0.0);
    SetDriveTaskDrivingStyle(pPed, 786861);

    var closest = 0;
    var dist = Vdist(coords[0], coords[1], coords[2], parkingspots[0][0], parkingspots[0][1], parkingspots[0][2]);
    for (var i = 1; i < parkingspots.length; i++) {
        var newDist = Vdist(coords[0], coords[1], coords[2], parkingspots[i][0], parkingspots[i][1], parkingspots[i][2]);
        if (newDist < dist) {
            closest = i;
            dist = newDist;
        }
    }
    emit('rd-phone:teslaNotify', `Tesla Sending Vehicle to parking spot ${closest + 1}.`);
    SetVehicleCheatPowerIncrease(vehicle, 0.01);
    TaskVehiclePark(pPed, vehicle, parkingspots[closest][0], parkingspots[closest][1], parkingspots[closest][2], parkingspots[closest][3], 1, 15.0, true);
    while (true) {
        await Delay(0);
        var pedCoords = GetEntityCoords(pPed, true);
        var spotCoords = parkingspots[closest];
        var dist = Vdist(pedCoords[0], pedCoords[1], pedCoords[2], spotCoords[0], spotCoords[1], spotCoords[2]);
        if (dist <= 3) {
            vehicle = GetVehiclePedIsIn(pPed, false);
            ClearPedTasks(pPed);
            SetVehicleOnGroundProperly(vehicle);
            SetVehicleEngineOn(vehicle, false, true, false);
            emit('keys:unlockDoor', vehicle, true);
            DeletePed(pPed);
            break;
        }
    }
    cb({ data: 'ok' });
    } else {
        sendNotify('You are not in a tesla vehicle');
    }
});