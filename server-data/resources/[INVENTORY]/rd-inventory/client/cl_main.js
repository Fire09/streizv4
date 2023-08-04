/*

    Variables

*/

let usedSlots = [];
let boundItems = {};
let boundItemsInfo = {};
let boundItemsAmmo = {};
let canOpen = true;
let dropName = 'none';
let DroppedInventories = [];
let NearInventories = [];
let DrawInventories = [];
let MyInventory = [];
let MyItemCount = 0;
let cash = 0;
let openedInv = false;
let cid = 0;
let personalWeight = 0;
let hadBrought = [];
let enableBlur = true;

let objectDumps = [
    { objectID: 666561306, Description: 'Blue Dumpster' },
    { objectID: 218085040, Description: 'Light Blue Dumpster' },
    { objectID: -58485588, Description: 'Gray Dumpster' },
    { objectID: 682791951, Description: 'Big Blue Dumpster' },
    { objectID: -206690185, Description: 'Big Green Dumpster' },
    { objectID: 364445978, Description: 'Big Green Skip Bin' },
    { objectID: 143369, Description: 'Small Bin' },
];

let objectPermDumps = [
    { objectID: 344662182, Description: 'Jail Yellow Bin' },
    { objectID: 1923262137, Description: 'Jail Electrical Box' },
    { objectID: -686494084, Description: 'Jail Electrical Box 2' },
    { objectID: 1419852836, Description: 'Jail Electrical Box 3' },
    { objectID: -1149940374, Description: 'Small Bin Food Room' },
    { objectID: -41273338, Description: 'Small Bin Food Room' },
    { objectID: -686494084, Description: 'Small Bin Food Room' },
];

let HasNuiFocus = false;
let EndingFocus = false;
let ControlThread;
let slotsAvailable = [...Array(41).keys()].slice(1);
let isCuffed = false;
let hasIncorrectItems = false;
let recentused = [];
let debug = true;
let timer = 0;
let timeFunction = false;
let TrapOwner = false;

let storageNames = ['storage','stash','office','housing','warehouse','hidden','paynless','hotel','craft'];
let inStashOrStorage = false;
let watch = [];
let maxPlayerWeight = 250;

/*

    Functions

*/

//like Citizen.Wait, usage: await Delay(<amount>);
const Delay = (ms) => new Promise((res) => setTimeout(res, ms));

function SetCustomNuiFocus(hasKeyboard, hasMouse) {
    // HasNuiFocus = hasKeyboard || hasMouse;

    SetNuiFocus(hasKeyboard, hasMouse);
    // SetNuiFocusKeepInput(HasNuiFocus);

    //   if (HasNuiFocus === true) {
    //   	emit("rd-voice:focus:set", HasNuiFocus, hasKeyboard, hasMouse);
    //   } else {
    // 	  setTimeout(() => {if (HasNuiFocus !== true) emit("rd-voice:focus:set", false, false, false);}, 1000)
    //   }
}

let itemListWithTax = async () => {
    const [fetchTax] = await RPC.execute("GetTaxLevel", "Goods");
    const tax = fetchTax["param"];

    for (const key in itemList) {
        let value = itemList[key];
        value.tax = Math.ceil((value.price / 100) * tax);
        value.priceWithTax = value.price + value.tax;
    }

    return itemList;
};

const getItemListWithTax = Cacheable(async () => [true, await itemListWithTax()], { timeToLive: 1000 * 60 * 120 });

function UpdateSettings() {
    let holdInt = GetResourceKvpInt('inventorySettings-HoldToDrag');
    let closeInt = GetResourceKvpInt('inventorySettings-CloseOnClick');
    let ctrlInt = GetResourceKvpInt('inventorySettings-CtrlMovesHalf');
    let tooltipsInt = GetResourceKvpInt('inventorySettings-ShowTooltips');
    let blurInt = GetResourceKvpInt('inventorySettings-EnableBlur');
    let holdToDrag = holdInt === 1 ? false : true; //default true
    let closeOnClick = closeInt === 1 ? false : true;
    let ctrlMovesHalf = ctrlInt === 1 ? false : true; //default false
    let showTooltips = tooltipsInt === 1 ? false : true;
    enableBlur = blurInt === 1 ? false : true;
    SendNuiMessage(
        JSON.stringify({
            response: 'UpdateSettings',
            holdToDrag: holdToDrag,
            closeOnClick: closeOnClick,
            ctrlMovesHalf: ctrlMovesHalf,
            showTooltips: showTooltips,
            enableBlur: enableBlur,
        }),
    );
}

function BuildInventory(Inventory) {
    let buildInv = Inventory;
    let invArray = {};
    let weight = 0.0;
    itemCount = 0;
    for (let i = 0; i < buildInv.length; i++) {
        if (itemList[buildInv[i].item_id] !== undefined) {
            let quality = ConvertQuality(buildInv[i].item_id, buildInv[i].creationDate);
            weight = weight + itemList[buildInv[i].item_id].weight * buildInv[i].amount;
            invArray[itemCount] = {
                quality: quality,
                creationDate: buildInv[i].creationDate,
                amount: buildInv[i].amount,
                item_id: buildInv[i].item_id,
                id: buildInv[i].id,
                name: buildInv[i].name,
                information: buildInv[i].information,
                slot: buildInv[i].slot,
            };
            itemCount = itemCount + 1;
        }
    }
    personalWeight = weight;
    return [JSON.stringify(invArray), itemCount];
}

function ConvertQuality(itemID, creationDate) {
    let StartDate = new Date(creationDate).getTime();
    let DecayRate = itemList[itemID].decayrate;
    let TimeExtra = TimeAllowed * DecayRate;
    let percentDone = 100 - Math.ceil(((Date.now() - StartDate) / TimeExtra) * 100);

    if (DecayRate == 0.0) {
        percentDone = 100;
    }
    if (percentDone < 0) {
        percentDone = 0;
    }
    return percentDone;
}

function ResetCache(fullReset) {
    CacheBinds(JSON.parse(MyInventory));

    slotsAvailable = [...Array(41).keys()].slice(1);
    if (fullReset) {
        usedSlots = [];
    }
}

function CacheBinds(sqlInventory) {
    boundItems = {};
    boundItemsInfo = {};

    for (let i = 0; i < itemCount; i++) {
        let slot = sqlInventory[i].slot;
        if (slot < 5) {
            boundItems[slot] = sqlInventory[i].item_id;
            boundItemsInfo[slot] = sqlInventory[i].information;
            if (!isNaN(boundItems[slot])) {
                let metadata = JSON.parse(boundItemsInfo[slot])

                if (metadata.ammo !== undefined) {
                    boundItemsAmmo[slot] = metadata.ammo;
                } else {
                    boundItemsAmmo[slot] = 0;
                }
            } else {
                boundItemsAmmo[slot] = undefined;
            }
        }
    }
}

function PopulateGuiSingle(playerinventory, itemCount, invName) {
    SendNuiMessage(
        JSON.stringify({
            response: 'PopulateSingle',
            playerinventory: playerinventory,
            itemCount: itemCount,
            invName: invName
        }),
    );
}

function PopulateGui(playerinventory, itemCount, invName, targetinventory, targetitemCount, targetinvName, cash, targetInvWeight, targetInvSlots, shopId) {
    let cid = exports.isPed.isPed("cid");
    let StoreOwner = false;

    if (targetinvName.indexOf('PlayerStore') > -1) {
        if (targetinvName.indexOf('TrapHouse') > -1) {
            SendNuiMessage(
                JSON.stringify({
                    response: 'Populate',
                    playerinventory: playerinventory,
                    itemCount: itemCount,
                    invName: invName,
                    targetinventory: targetinventory,
                    targetitemCount: targetitemCount,
                    targetinvName: targetinvName,
                    cash: cash,
                    StoreOwner: TrapOwner,
                    targetInvWeight: targetInvWeight,
                    targetInvSlots: targetInvSlots,
                    shopId: shopId,
                }),
            );
        } else {
            let targetCid = targetinvName.split('|');
            targetCid = targetCid[0].split('-');

            if (targetCid[1] == cid) {
                StoreOwner = true;
            }
            setTimeout(() => {
                SendNuiMessage(
                    JSON.stringify({
                        response: 'Populate',
                        playerinventory: playerinventory,
                        itemCount: itemCount,
                        invName: invName,
                        targetinventory: targetinventory,
                        targetitemCount: targetitemCount,
                        targetinvName: targetinvName,
                        cash: cash,
                        StoreOwner: StoreOwner,
                        targetInvWeight: targetInvWeight,
                        targetInvSlots: targetInvSlots,
                        shopId: shopId,
                    }),
                );
            }, 250);
        }
    } else {
        SendNuiMessage(
            JSON.stringify({
                response: 'Populate',
                playerinventory: playerinventory,
                itemCount: itemCount,
                invName: invName,
                targetinventory: targetinventory,
                targetitemCount: targetitemCount,
                targetinvName: targetinvName,
                cash: cash,
                StoreOwner: StoreOwner,
                targetInvWeight: targetInvWeight,
                targetInvSlots: targetInvSlots,
                shopId: shopId,
            }),
        );
    }
}

function ScanContainers() {
    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.1, 0);
    let endPosition = GetOffsetFromEntityInWorldCoords(player, 0, 1.8, -0.4);

    let rayhandle = StartShapeTestRay(
        startPosition[0],
        startPosition[1],
        startPosition[2],
        endPosition[0],
        endPosition[1],
        endPosition[2],
        16,
        player,
        0,
    );

    let vehicleInfo = GetShapeTestResult(rayhandle);

    let hitData = vehicleInfo[4];

    let model = 0;
    let entity = 0;
    if (hitData) {
        model = GetEntityModel(hitData);
    }
    if (model !== 0) {
        for (let x in objectDumps) {
            if (x) {
                if (objectDumps[x].objectID == model) {
                    return GetEntityCoords(hitData);
                }
            }
        }
    }
}

function ScanJailContainers() {
    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.1, 0);
    let endPosition = GetOffsetFromEntityInWorldCoords(player, 0, 1.8, -0.4);

    let rayhandle = StartShapeTestRay(
        startPosition[0],
        startPosition[1],
        startPosition[2],
        endPosition[0],
        endPosition[1],
        endPosition[2],
        16,
        player,
        0,
    );

    let vehicleInfo = GetShapeTestResult(rayhandle);

    let hitData = vehicleInfo[4];

    let model = 0;
    let entity = 0;
    if (hitData) {
        model = GetEntityModel(hitData);
    }
    if (model !== 0) {
        for (let x in objectPermDumps) {
            if (x) {
                if (objectPermDumps[x].objectID == model) {
                    return GetEntityCoords(hitData);
                }
            }
        }
    }
}

async function OpenGui() {
    openedInv = true;
    SendNuiMessage(JSON.stringify({ response: 'openGui' }));
    SetCustomNuiFocus(true, true);

    //Background blur
    if (enableBlur) TriggerScreenblurFadeIn(400);

    //Center cursor
    SetCursorLocation(0.5, 0.5);
}

async function CloseGui(pIsItemUsed = false) {
    if (watch[0] !== undefined) {
        emitNet("inventory-update-other",watch)
        watch = []
    }

    if (!pIsItemUsed) {
        emit('randPickupAnim');
    }

    SendNuiMessage(JSON.stringify({ response: 'closeGui' }));
    SetCustomNuiFocus(false, false);

    openedInv = false;
    recentused = [];

    if (IsScreenblurFadeRunning()) {
        await Delay(500);
    }
    //Remove blur
    TriggerScreenblurFadeOut(400);

    if (inStashOrStorage) {
        ClearPedTasks(PlayerPedId());
        inStashOrStorage = false
    }

    setTimeout(() => {
        emit('inventory:wepDropCheck')
    }, 1000);
}

function GroundInventoryScan() {
    let row = DroppedInventories.find(ScanClose);
    if (row) {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '1', row.name);
    } else {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '3', 'create');
    }
}

function ScanClose(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distancec = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);
    return distancec < 1.5;
}

function GetEnginePosition(pVehicle) {
    const [minDim, maxDim] = GetModelDimensions(GetEntityModel(pVehicle));

    const frontCoords = GetOffsetFromEntityInWorldCoords(pVehicle, maxDim[0] / 2, maxDim[1], 0.0);
    const engineCoords = GetWorldPositionOfEntityBone(pVehicle, GetEntityBoneIndexByName(pVehicle, 'engine'));
    const overheatCoords = GetWorldPositionOfEntityBone(pVehicle, GetEntityBoneIndexByName(pVehicle, 'overheat'));

    const frontDist = distanceBetweenCoords(frontCoords, engineCoords);
    const overHeatDist = distanceBetweenCoords(frontCoords, overheatCoords);

    const halfCar = Math.abs(maxDim[1] - minDim[1]) / 2;
    if (frontDist <= halfCar || overHeatDist <= halfCar) {
        return [GetOffsetFromEntityInWorldCoords(pVehicle, 0.0, minDim[1] - 0.5, 0.0), false];
    }

    return [GetOffsetFromEntityInWorldCoords(pVehicle, 0.0, maxDim[1] + 0.5, 0.0), true];
}

function distanceBetweenCoords(coords1, coords2) {
    return Math.sqrt(Math.pow(coords1[0] - coords2[0], 2) + Math.pow(coords1[1] - coords2[1], 2) + Math.pow(coords1[2] - coords2[2], 2));
}

function ClearCache(sentIndexName) {
    let foundIndex = -1;
    let i = 0;
    for (let Row in DroppedInventories) {
        if (DroppedInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }
    if (foundIndex > -1) {
        DroppedInventories.splice(foundIndex, 1);
    }

    foundIndex = -1;
    i = 0;
    for (let Row in DrawInventories) {
        if (DrawInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }
    if (foundIndex > -1) {
        DrawInventories.splice(foundIndex, 1);
    }

    foundIndex = -1;
    i = 0;
    for (let Row in NearInventories) {
        if (NearInventories[Row].name == sentIndexName) {
            foundIndex = i;
            break;
        }
        i++;
    }

    if (foundIndex > -1) {
        NearInventories.splice(foundIndex, 1);
    }
}

function Rebind(slot, itemid, metadata) {
    boundItems[slot] = itemid;
    if (!isNaN(boundItems[slot])) {
        metadata = JSON.parse(metadata)

        if (metadata.ammo !== undefined) {
            boundItemsAmmo[slot] = metadata.ammo;
        } else {
            boundItemsAmmo[slot] = 0;
        }
    } else {
        boundItemsAmmo[slot] = undefined;
    }
}

function GiveItem(itemid, amount, generateInformation, nonStacking, itemdata, returnData = '{}') {
    let slot = findSlot(itemid, amount, nonStacking);
    if (!isNaN(itemid)) {
        generateInformation = true;
    }
    if (slot != 0) {
        cid = exports.isPed.isPed("cid");
        emitNet(
            'server-inventory-give',
            cid,
            itemid,
            slot,
            amount,
            generateInformation,
            Object.assign({}, itemdata),
            openedInv,
            returnData,
        );
        SendNuiMessage(JSON.stringify({
            response: 'DisableMouse'
        }));
    }
}

function openDumpster(pEntity) {
    const coords = GetEntityCoords(pEntity);
    const player = PlayerPedId();
    const startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.5, 0);
    let x = parseInt(coords[0]);
    let y = parseInt(coords[1]);
    let serverCode = exports["rd-config"].GetServerCode();
    let container = 'hidden-container|' + x + '|' + y + '|' + serverCode;
    emitNet('server-inventory-open', startPosition, cid, '1', container);
}

function openTrunk(pEntity) {
    const [trunkCoords, front] = GetEnginePosition(pEntity);
    const player = PlayerPedId();
    const startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.5, 0);
    const vehModel = GetEntityModel(pEntity);
    const licensePlate = GetVehicleNumberPlateText(pEntity);
    const distanceRear = GetDistanceBetweenCoords(
        startPosition[0],
        startPosition[1],
        startPosition[2],
        trunkCoords[0],
        trunkCoords[1],
        trunkCoords[2],
    );

    if (distanceRear > 1.5) {
        return false;
    }

    const lockStatus = GetVehicleDoorLockStatus(pEntity)
    if (lockStatus != 1 && lockStatus != 0 && lockStatus != 4 && distanceRear < 1.5) {
        TriggerEvent('DoLongHudText', 'The vehicle is locked.', 2);
        CloseGui();
        return false;
    }

    if (!licensePlate) return false;
    if (vehModel === GetHashKey('npwheelchair')) {
        TriggerEvent('DoLongHudText', 'This is a wheelchair, dummy.', 2);
        return false;
    }
    if (IsThisModelABicycle(vehModel) || vehModel === GetHashKey('trash2')) {
        return false;
    }
    const vehId = exports['rd-vehicles'].GetVehicleIdentifier(pEntity)
    if (!vehId) {
        CloseGui();
        TriggerEvent('DoLongHudText', 'The trunk is locked.', 2);
        return false;
    }
    const carInvName = "Trunk-" + vehId

    const vehClass = GetVehicleClass(pEntity);

    //Vehicle weight calculations
    const [[minX, minY, minZ], [maxX, maxY, maxZ]] = GetModelDimensions(vehModel);
    const vehVolume = (maxX - minX) * (maxY - minY) * (maxZ - minZ);

    const seats = GetVehicleModelNumberOfSeats(vehModel);

    const classModifier = VehicleWeightModifiers[vehClass][0];
    const classBaseWeight = VehicleWeightModifiers[vehClass][1];
    const classMaxWeight = VehicleWeightModifiers[vehClass][2];

    if (classBaseWeight === 0) {
        //do something
        return;
    }

    //Calculate seats / 3 (2 seats = 66% of base weight, 4 seats = 133% base weight)
    let vehSeatMod = (classBaseWeight * seats) / 3;

    //Calculate based on volume, then add the seat modifier
    let vehWeightCalc = vehVolume * classModifier + vehSeatMod;

    //Round to nearest 50
    vehWeightCalc = Math.round(vehWeightCalc / 50) * 50;

    //console.log("veh weight calc: " + vehWeightCalc);

    if (vehWeightCalc > classMaxWeight) {
        //Max weight
        vehWeightCalc = classMaxWeight;
    }

    Object.keys(VehicleWeightOverrides).forEach((modelName) => {
        if (vehModel === GetHashKey(modelName)) {
            vehWeightCalc = VehicleWeightOverrides[modelName];
        }
    });

    emitNet('server-inventory-open', startPosition, cid, '1', carInvName, [], null, vehWeightCalc);
    SetVehicleDoorOpen(pEntity, front ? 4 : 5, 0, 0);
    TaskTurnPedToFaceEntity(player, pEntity, 1.0);
    emit('toggle-animation', true);
    return true;
}

on('rd-inventory:openDumpster', (pParams, pEntity, pContext) => {
    openDumpster(pEntity);
});

on('rd-inventory:openTrunk', (pParams, pEntity, pContext) => {
    openTrunk(pEntity);
});


function findSlot(ItemIdToCheck, amount, nonStacking) {
    let sqlInventory = JSON.parse(MyInventory);

    let itemCount = parseInt(MyItemCount);
    let foundslot = 0;

    for (let i = 0; i < itemCount; i++) {
        if (sqlInventory[i].item_id == ItemIdToCheck && nonStacking == false) {
            if (doubleCheck(sqlInventory[i].slot)) {
                foundslot = sqlInventory[i].slot;
            }
        }
    }

    if (usedSlots[ItemIdToCheck] && nonStacking == false) {
        foundslot = usedSlots[ItemIdToCheck];
        slotsAvailable = slotsAvailable.filter((x) => x != foundslot);
    }

    for (let i = 0; i < itemCount; i++) {
        slotsAvailable = slotsAvailable.filter((x) => x != sqlInventory[i].slot);
    }

    if (foundslot == 0 && slotsAvailable[0] != undefined && slotsAvailable.length > 0) {
        foundslot = slotsAvailable[0];
        usedSlots[ItemIdToCheck] = foundslot;
        slotsAvailable = slotsAvailable.filter((x) => x != foundslot);
    }

    if (foundslot == 0) {
        emit('DoLongHudText', 'Failed to give ' + ItemIdToCheck + ' because you were full!', 2);
    }

    return foundslot;
}

function doubleCheck(slotcheck) {
    let foundshit = recentused.find((x) => x == slotcheck);
    if (foundshit) {
        return false;
    } else {
        return true;
    }
}

function RemoveItem(id, amount) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-remove-item', cid, id, amount, openedInv);
}

function RemoveItemKV(id, amount, metaKey, metaValue) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-remove-item-kv', cid, id, amount, metaKey, metaValue);
}

function UpdateItem(id, slot, data) {
    cid = exports.isPed.isPed("cid");
    emitNet('server-update-item', cid, id, slot, JSON.parse(data));
}

function CreateCraftOption(id, add, craft) {
    let itemArray = [{
        itemid: id,
        amount: add
    }];
    if (craft === true) {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '7', 'Craft', JSON.stringify(itemArray));
    } else {
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '7', 'Shop', JSON.stringify(itemArray));
    }
}


/*

    Exports

*/

exports('getCurrentWeight', () => {
    return parseFloat(personalWeight);
});

exports('setPlayerWeight', (cid, weight) => {
    maxPlayerWeight = weight;
    emitNet('rd-inventory:server:weightChange', cid, weight);
    SendNuiMessage(JSON.stringify({
        response: 'playerWeight',
        personalMaxWeight: weight
    }));
})

exports('getPlayerMaxWeight', () => {
    return maxPlayerWeight
});

exports('itemListInfo', (item_id) => {
    return JSON.stringify(itemList[item_id]);
});

exports('getItemListNames', () => {
    let itemListSend = []
    for (const key in itemList) {
        const item = itemList[key];
        itemListSend.push({
            id: key,
            name: item.displayname
        })
    }

    return itemListSend
})

exports('getFullItemList', () => {
    return itemList;
});

/*

    Events

*/

RegisterNetEvent('rd-inventory:request:client:update');
on('rd-inventory:request:client:update', async () => {
    cid = exports.isPed.isPed("cid");
    emitNet('server-request-update', cid);
    SendNuiMessage(JSON.stringify({
        response: 'SendItemList',
        list: await itemListWithTax()
    }));
    UpdateSettings();
});

RegisterNetEvent('requested-dropped-items');
on('requested-dropped-items', (object) => {
    DroppedInventories = [];
    object2 = JSON.parse(object);
    for (let key in object2) {
        DroppedInventories.push(object2[key]);
    }

    //DroppedInventories = object;
    //no idea why no work

    // i am tired and retarded
});

RegisterNetEvent('inventory-update-player');
on('inventory-update-player', (information) => {
    let returnInv = BuildInventory(information[0]);
    let playerinventory = returnInv[0];
    let itemCount = returnInv[1];
    let invName = information[2];

    MyInventory = playerinventory;
    MyItemCount = itemCount;

    ResetCache(false);
    PopulateGuiSingle(playerinventory, itemCount, invName);
    if (openedInv) {
        SendNuiMessage(JSON.stringify({ response: 'EnableMouse' }));
    }
    emit('current-items', JSON.parse(MyInventory));
    //misc.UpdateInventory(playerinventory, itemCount, "inv update player");
});

RegisterNetEvent('server-inventory-open');
on('server-inventory-open', (target, name, targetWeight, targetSlots) => {
    cid = exports.isPed.isPed("cid");
    emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, target, name, null, null, targetWeight, targetSlots);
});

RegisterNuiCallbackType('openJewelry');
on('__cfx_nui:openJewelry', async (data, cb) => {
    await CloseGui(false);
    OpenJewelryInventory();
    cb({});
});

function OpenJewelryInventory() {
    const cid = exports.isPed.isPed("cid");
    const inventory = `container-jewelry:${cid}-Jewelry-jewelry`;
    emit("inventory-open-container", inventory, 5, 30.0);
}

RegisterNuiCallbackType('openProtectedInventory');
on('__cfx_nui:openProtectedInventory', async (data, cb) => {
    await CloseGui(false);
    OpenProtectedInventory();
    cb({});
});

function OpenProtectedInventory() {
    const cid = exports.isPed.isPed("cid");
    const inventory = `container-protected:${cid}-Protected-protected`;
    emit("inventory-open-container", inventory, 5, 70.0);
}

RegisterNetEvent('inventory-open-request');
on('inventory-open-request', async () => {
    if (isCuffed) {
        return;
    }

    setImmediate(async () => {
        SendNuiMessage(JSON.stringify({ response: 'SendItemList', list: await getItemListWithTax() }));
    });

    let player = PlayerPedId();
    let startPosition = GetOffsetFromEntityInWorldCoords(player, 0, 0.5, 0);

    let BinFound = ScanContainers();
    let JailBinFound = ScanJailContainers();
    const apartmentFloor = exports["rd-apartments"].getModule("func").getApartment()
    cid = exports.isPed.isPed("cid");

    OpenGui();

    emit('randPickupAnim');

    const currentTarget = exports['rd-target'].GetCurrentEntity()

    let vehicleFound = IsModelAVehicle(GetEntityModel(currentTarget)) ? currentTarget : 0

    let jailDst = GetDistanceBetweenCoords(startPosition[0], startPosition[1], startPosition[2], 1700.2, 2536.8, 45.5);

    let isInVehicle = IsPedInAnyVehicle(PlayerPedId(), false);
    if (isInVehicle) {
        vehicleFound = GetVehiclePedIsIn(PlayerPedId(), false);
        let vehicleModel = GetEntityModel(vehicleFound);
        if (!IsThisModelABicycle(vehicleModel) && !IsThisModelABike(vehicleModel)) {
            let licensePlate = GetVehicleNumberPlateText(vehicleFound);
            let gloveboxName = 'Glovebox-' + licensePlate;
            const vehId = exports['rd-vehicles'].GetVehicleIdentifier(vehicleFound)
            if (vehId) {
                gloveboxName = "Glovebox-" + vehId
            }
            emitNet('server-inventory-open', startPosition, cid, '1', gloveboxName);
        } else {
            GroundInventoryScan();
        }
    } else if (JailBinFound && jailDst < 80.0) {
        let x = parseInt(JailBinFound[0]);
        let y = parseInt(JailBinFound[1]);
        let container = 'jail-container|' + x + '|' + y;
        emit('inventory-jail', startPosition, cid, container);
    } else if (BinFound) {
        let x = parseInt(BinFound[0]);
        let y = parseInt(BinFound[1]);
        let container = 'hidden-container|' + x + '|' + y;
        emitNet('server-inventory-open', startPosition, cid, '1', container);
    } else if (apartmentFloor != null) {
        let room = apartmentFloor.roomType;
        let type = apartmentFloor.roomNumber;
        let container = 'hidden-container|' + room + '|' + type + '|Apartments';
        emitNet('server-inventory-open', startPosition, cid, '1', container);
    } else if (vehicleFound != 0) {
        let vehModel = GetEntityModel(vehicleFound);
        let [trunkCoords, front] = GetEnginePosition(vehicleFound);
        let distanceRear = GetDistanceBetweenCoords(
            startPosition[0],
            startPosition[1],
            startPosition[2],
            trunkCoords[0],
            trunkCoords[1],
            trunkCoords[2],
        );

        let lockStatus = GetVehicleDoorLockStatus(vehicleFound)
        if (lockStatus != 1 && lockStatus != 0 && lockStatus != 4 && distanceRear < 1.5) {
            TriggerEvent('DoLongHudText', 'The vehicle is locked.', 2);
            CloseGui();
        } else {
            if (distanceRear > 1.5) {
                GroundInventoryScan();
            } else {
                let licensePlate = GetVehicleNumberPlateText(vehicleFound);
                if (licensePlate != null) {
                    if (vehModel === GetHashKey('npwheelchair')) {
                        TriggerEvent('DoLongHudText', 'This is a wheelchair, dummy.', 2);
                    } else {
                        if (!IsThisModelABicycle(vehModel) && vehModel !== GetHashKey('trash2')) {
                            let carInvName = 'Trunk-' + licensePlate;
                            const vehId = exports['rd-vehicles'].GetVehicleIdentifier(vehicleFound)
                            if (vehId) {
                                carInvName = "Trunk-" + vehId
                            }

                            const vehClass = GetVehicleClass(vehicleFound);

                            //Vehicle weight calculations
                            const [[minX, minY, minZ], [maxX, maxY, maxZ]] = GetModelDimensions(vehModel);
                            const vehVolume = (maxX - minX) * (maxY - minY) * (maxZ - minZ);

                            const seats = GetVehicleModelNumberOfSeats(vehModel);

                            const classModifier = VehicleWeightModifiers[vehClass][0];
                            const classBaseWeight = VehicleWeightModifiers[vehClass][1];
                            const classMaxWeight = VehicleWeightModifiers[vehClass][2];

                            if (classBaseWeight === 0) {
                                //do something
                                return;
                            }

                            //Calculate seats / 3 (2 seats = 66% of base weight, 4 seats = 133% base weight)
                            let vehSeatMod = (classBaseWeight * seats) / 3;

                            //Calculate based on volume, then add the seat modifier
                            let vehWeightCalc = vehVolume * classModifier + vehSeatMod;

                            //Round to nearest 50
                            vehWeightCalc = Math.round(vehWeightCalc / 50) * 50;

                            //console.log("veh weight calc: " + vehWeightCalc);

                            if (vehWeightCalc > classMaxWeight) {
                                //Max weight
                                vehWeightCalc = classMaxWeight;
                            }

                            Object.keys(VehicleWeightOverrides).forEach((modelName) => {
                                if (vehModel === GetHashKey(modelName)) {
                                    vehWeightCalc = VehicleWeightOverrides[modelName];
                                }
                            });

                            emitNet('server-inventory-open', startPosition, cid, '1', carInvName, [], null, vehWeightCalc);
                            SetVehicleDoorOpen(vehicleFound, front ? 4 : 5, 0, 0);
                            TaskTurnPedToFaceEntity(player, vehicleFound, 1.0);
                            emit('toggle-animation', true);
                        }else {
                            GroundInventoryScan();
                        }
                    }
                }
            }
        }
    } else {
        GroundInventoryScan();
    }
});

RegisterNetEvent('inventory-open-target');
on('inventory-open-target', async (information) => {
    let returnInv = BuildInventory(information[0]);

    let playerinventory = returnInv[0];

    let invName = information[2];
    let targetinventory;
    let targetitemCount;

    if (information[7] == true) {
        let returnInv2 = BuildInventory(information[3]);
        targetinventory = returnInv2[0];
        targetitemCount = returnInv2[1];
    } else {
        targetinventory = information[3];
        targetitemCount = information[4];
    }
    let targetinvName = information[5];

    emitNet('rd-base:CheckWeaponLicenese') 

    if (canOpen === true) {
        MyInventory = playerinventory;
        MyItemCount = information[0].length;
        if (!openedInv) OpenGui();
        if(targetinvName.indexOf("Shop") > -1) {
            const [fetchCash] = await RPC.execute("GetCurrentCash");
            cash = fetchCash["param"];
            setImmediate(async () => {
                let WeaponsLicense = exports["rd-base"].WeaponLicense()

                let brought = hadBrought[cid];
                let cop = false;
                if (exports.isPed.isPed('myjob') == 'police' || exports.isPed.isPed('myjob') == 'doc') {
                    cop = true;
                }

                await Delay(250);

                SendNuiMessage(JSON.stringify({ response: 'cashUpdate', amount: cash, weaponlicence: WeaponsLicense, brought: brought, cop: cop }));
            })
        }

        let targetInvWeight = information[8];
        if (!targetInvWeight) targetInvWeight = 0;
        let targetInvSlots = information[9];
        if (!targetInvSlots) targetInvSlots = 40;

        let shopId = information[10];
        if (!shopId) shopId = "0";

        if (storageNames.some(v => targetinvName.toLowerCase().includes(v)) && !IsPedInAnyVehicle(PlayerPedId(), false) && !targetinvName.toLowerCase().includes('apartments') && !targetinvName.toLowerCase().includes('traphouse-storage')) {
            inStashOrStorage = true;
            TaskStartScenarioInPlace(PlayerPedId(), 'PROP_HUMAN_BUM_BIN', 0, true)
        }

        PopulateGui(playerinventory, returnInv[1], invName, targetinventory, targetitemCount, targetinvName, cash, targetInvWeight, targetInvSlots);
        SendNuiMessage(JSON.stringify({ response: 'EnableMouse' }));
        ResetCache(true);
    }
});

RegisterNetEvent('inventory-open-container');
on('inventory-open-container', async (inventoryId, slots, weight) => {
    const playerPos = GetEntityCoords(PlayerPedId());
    const cid = exports.isPed.isPed("cid");
    emitNet('server-inventory-open', playerPos, cid, '1', inventoryId, [], null, weight, slots);
});

RegisterNetEvent('inventory:qualityUpdate');
on('inventory:qualityUpdate', (originSlot, originInventory, creationDate) => {
    SendNuiMessage(JSON.stringify({
        response: 'updateQuality',
        slot: originSlot,
        inventory: originInventory,
        creationDate: creationDate
    }));
});

RegisterNetEvent('Inventory-Dropped-Addition');
on('Inventory-Dropped-Addition', (object) => {
    DroppedInventories.push(object);
    NearInventories.push(object);
    DrawInventories.push(object);
});

RegisterNetEvent('Inventory-Dropped-Remove');
on('Inventory-Dropped-Remove', (sentIndexName) => {
    ClearCache(sentIndexName);
});

RegisterNetEvent('hud-display-item');
on('hud-display-item', (itemid, text, amount) => {
    if (openedInv) {
        return;
    }
    SendNuiMessage(JSON.stringify({
        response: 'UseBar',
        itemid: itemid,
        text: text,
        amount: amount
    }));
});

RegisterNetEvent('inventory-bar');
on('inventory-bar', (toggle) => {
    SendNuiMessage(JSON.stringify({
        response: 'DisplayBar',
        toggle: toggle,
        boundItems: boundItems,
        boundItemsAmmo: boundItemsAmmo
    }));
});

RegisterNetEvent('inventory-bind');
on('inventory-bind', (slot) => {
    if (exports.isPed.isPed('dead')) {
        return;
    }
    let cid = exports.isPed.isPed("cid");
    let inventoryUsedName = 'ply-' + cid;
    let itemid = boundItems[slot];
    let isWeapon = true;
    if (isNaN(itemid)) {
        isWeapon = false;
    }
    emit('RunUseItem', itemid, slot, inventoryUsedName, isWeapon, boundItemsInfo[slot]);
});

RegisterNetEvent('player:receiveItem');
on('player:receiveItem', async (id, amount, generateInformation, itemdata, returnData = '{}', devItem = false) => {
    if (!(id in itemList)) {
        //Try to hash the ID
        let hashed = GetHashKey(id);
        if (hashed in itemList) {
            id = hashed;
        } else {
            //If item is still not found, try to find by name
            Object.keys(itemList).forEach(function (key) {
                if (itemList[key].displayname.toLowerCase().trim().replace(' ', '') === id.toLowerCase().trim().replace(' ', '')) {
                    id = key;
                    return;
                }
            });
        }
    }

    let combined = parseFloat(itemList[id].weight) * parseFloat(amount);
    if ((parseFloat(personalWeight) > maxPlayerWeight || parseFloat(personalWeight) + combined > maxPlayerWeight) && !devItem) {
        emit('DoLongHudText', itemList[id].displayname + ' fell on the ground because you are overweight', 2);
        let droppedItem = {
            slot: 3,
            itemid: id,
            amount: amount,
            generateInformation: generateInformation,
            data: Object.assign({}, itemdata),
            returnData: returnData
        };
        cid = exports.isPed.isPed("cid");
        emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '42069', "Drop-Overweight", droppedItem);
        return;
    }
    SendNuiMessage(
        JSON.stringify({
            response: 'GiveItemChecks',
            id: id,
            amount: amount,
            generateInformation: generateInformation,
            data: Object.assign({}, itemdata),
            returnData: returnData,
        }),
    );
});

RegisterNetEvent('inventory:removeItem');
on('inventory:removeItem', (id, amount) => {
    RemoveItem(id, amount);
    emit('hud-display-item', id, 'Removed', amount);
});

RegisterNetEvent('client-inventory-remove-any');
on('client-inventory-remove-any', (itemidsent, amount) => {
    emitNet('server-inventory-remove-any', itemidsent, amount);
});

RegisterNetEvent('client-inventory-remove-slot');
on('client-inventory-remove-slot', (itemidsent, amount, slot) => {
    emitNet('server-inventory-remove-slot', itemidsent, amount, slot);
});

RegisterNetEvent('inventory:removeItemByMetaKV');
on('inventory:removeItemByMetaKV', (id, amount, metaKey, metaValue) => {
    RemoveItemKV(id, amount, metaKey, metaValue);
    emit('hud-display-item', id, 'Removed', amount);
});

RegisterNetEvent('inventory:updateItem');
on('inventory:updateItem', (id, slot, data) => {
    UpdateItem(id, slot, data);
});

RegisterNetEvent('CreateCraftOption');
on('CreateCraftOption', (id, add, craft) => {
    CreateCraftOption(id, add, craft);
});

RegisterNetEvent('toggle-animation');
on('toggle-animation', (toggleAnimation) => {
    let lPed = PlayerPedId();
    if (toggleAnimation) {
        TriggerEvent('animation:load');
        if (!IsEntityPlayingAnim(lPed, 'mini@repair', 'fixing_a_player', 3))
            TaskPlayAnim(lPed, 'mini@repair', 'fixing_a_player', 8.0, -8, -1, 16, 0, 0, 0, 0);
    } else {
        StopAnimTask(lPed, 'mini@repair', 'fixing_a_player', -4.0);
    }
});

RegisterNetEvent('nui-toggle');
on('nui-toggle', (toggle) => {
    SetCustomNuiFocus(toggle, toggle);
});

RegisterNetEvent('police:currentHandCuffedState');
on('police:currentHandCuffedState', (pIsHandcuffed) => {
    isCuffed = pIsHandcuffed;
});

RegisterNetEvent('inventory-open-trap');
on('inventory-open-trap', (Owner) => {
    TrapOwner = Owner;
});

RegisterNetEvent('closeInventoryGui');
on('closeInventoryGui', () => {
    CloseGui();
});

RegisterNetEvent('watch-inventory');
on('watch-inventory', (src,cash,name) => {
    watch = [src,name]
    emit('chatMessage', 'SEARCH ', 2, "Player had cash in the amount of: " + cash, 5000);
});

RegisterNetEvent('rd-inventory:log');
on('rd-inventory:log', (pLog) => {
    SendNuiMessage(
        JSON.stringify({
            response: 'log',
            log: pLog,
        }),
    );
});

/*

    NUI

*/

RegisterNuiCallbackType('Weight');
on('__cfx_nui:Weight', (data, cb) => {
    personalWeight = data.weight;
    cb({});
});

RegisterNuiCallbackType('UpdateSettings');
on('__cfx_nui:UpdateSettings', (data, cb) => {
    let holdToDrag = data.holdToDrag;
    let closeOnClick = data.closeOnClick;
    let ctrlMovesHalf = data.ctrlMovesHalf;
    let showTooltips = data.showTooltips;
    enableBlur = data.enableBlur;
    SetResourceKvpInt('inventorySettings-HoldToDrag', holdToDrag ? 0 : 1);
    SetResourceKvpInt('inventorySettings-CloseOnClick', closeOnClick ? 0 : 1);
    SetResourceKvpInt('inventorySettings-CtrlMovesHalf', ctrlMovesHalf ? 0 : 1);
    SetResourceKvpInt('inventorySettings-ShowTooltips', showTooltips ? 0 : 1);
    SetResourceKvpInt('inventorySettings-EnableBlur', enableBlur ? 0 : 1);
    cb({});
});

RegisterNuiCallbackType('move');
on('__cfx_nui:move', (data, cb) => {
    emitNet('server-inventory-move', cid, data, GetEntityCoords(PlayerPedId()));
    cb({});
});

RegisterNuiCallbackType('stack');
on('__cfx_nui:stack', (data, cb) => {
    emitNet('server-inventory-stack', cid, data, GetEntityCoords(PlayerPedId()));
    cb({});
});

RegisterNuiCallbackType('swap');
on('__cfx_nui:swap', (data, cb) => {
    emitNet('server-inventory-swap', cid, data, GetEntityCoords(PlayerPedId()));
    cb({});
});

RegisterNuiCallbackType('invuse');
on('__cfx_nui:invuse', (data, cb) => {
    let inventoryUsedName = data[0];
    let itemid = data[1];
    let slotusing = data[2];
    let isWeapon = data[3];
    let iteminfo = data[4];

    emit('RunUseItem', itemid, slotusing, inventoryUsedName, isWeapon, iteminfo);
    cb({});
});

RegisterNuiCallbackType('SlotJustUsed');
on('__cfx_nui:SlotJustUsed', (data, cb) => {
    let target = data.targetslot;
    if (target < 5 && data.MyInvMove) {
        Rebind(target, data.itemid, data.metadata);
    }
    if (data.move) {
        boundItems[data.origin] = undefined;
    }
    recentused.push(data.origin);
    recentused.push(data.targetslot);
    usedSlots = [];
    cb({});
});

RegisterNuiCallbackType('Close');
on('__cfx_nui:Close', (data, cb) => {
    CloseGui(data.isItemUsed);
    cb({});
});

RegisterNuiCallbackType('ServerCloseInventory');
on('__cfx_nui:ServerCloseInventory', (data, cb) => {
    let cid = exports.isPed.isPed("cid");
    if (data.name != 'none') {
        emitNet('server-inventory-close', cid, data.name);
        emit('rd-inventory:closed', data.name);
    }
    cb({});
});

RegisterNetEvent('Inventory-brought-update');
on('Inventory-brought-update', (broughtData) => {
    hadBrought = JSON.parse(broughtData);
});

RegisterNuiCallbackType('removeCraftItems');
on('__cfx_nui:removeCraftItems', (data, cb) => {
    let requirements = data[0];
    let amountCrafted = data[1];

    for (let xx = 0; xx < requirements.length; xx++) {
        RemoveItem(requirements[xx].itemid, Math.ceil(requirements[xx].amount * amountCrafted));
    }
    //emitNet("server-inventory-removeCraftItems", cid, data, GetEntityCoords(PlayerPedId()),openedInv)
    cb({});
});

RegisterNuiCallbackType('dropIncorrectItems');
on('__cfx_nui:dropIncorrectItems', (data, cb) => {
    hasIncorrectItems = true;
    if (!canOpen) {
        return;
    }
    canOpen = false;
    emitNet('server-inventory-open', GetEntityCoords(PlayerPedId()), cid, '13', 'Drop', data.slots);
    setTimeout(() => {
        canOpen = true;
    }, 2000);
    cb({});
});

RegisterNuiCallbackType('GiveItem');
on('__cfx_nui:GiveItem', (data, cb) => {
    if (!data[3]) {
        return;
    }

    let id = data[0];
    let amount = data[1];
    let generateInformation = data[2];
    let nonStacking = data[4];
    let itemdata = data[5];

    emit('hud-display-item', id, 'Received', amount);
    GiveItem(id, amount, generateInformation, nonStacking, itemdata, data[6]);
    cb({});
});

RegisterNuiCallbackType('craftProgression');
on('__cfx_nui:craftProgression', (data, cb) => {
    cb("ok");
    emit("rd-inventory:craftProgression", data);
    emitNet("rd-inventory:craftProgression", data);
});

RegisterNuiCallbackType('insert-item')
on('__cfx_nui:insert-item', (data, cb) => {
    const {
        originInventory, targetInventory,
        originSlot, targetSlot,
        originItemId, targetItemId,
        originItemInfo, targetItemInfo,
    } = data
    if (
        (itemList[originItemId].insertTo && itemList[originItemId].insertTo.includes(targetItemId))
        ||
        (itemList[targetItemId].insertFrom && itemList[targetItemId].insertFrom.includes(originItemId))
    ) {
        emit(`${targetItemId}:insert`, originInventory, targetInventory, originSlot, targetSlot, originItemId, targetItemId, originItemInfo, targetItemInfo)
    }
    cb({});
});


/*

    Loops

*/

function drawMarkersUI() {
    for (let Row in DrawInventories) {
        DrawMarker(
            20,
            DrawInventories[Row].position.x,
            DrawInventories[Row].position.y,
            DrawInventories[Row].position.z - 0.8,
            0,
            0,
            0,
            0,
            0,
            0,
            0.35,
            0.5,
            0.15,
            252,
            255,
            255,
            91,
            0,
            0,
            0,
            0,
        );
    }
}

setTick(drawMarkersUI);

function CacheInventories() {
    DrawInventories = NearInventories.filter(DrawMarkers);
}

setInterval(CacheInventories, 1000);

function GetCloseInventories() {
    NearInventories = DroppedInventories.filter(Scan);
}

setInterval(GetCloseInventories, 15000);

function DrawMarkers(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distanceb = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);
    let checkDistance = 12;
    if (IsPedInAnyVehicle(PlayerPedId(), false)) {
        checkDistance = 25;
    }

    return distanceb < checkDistance;
}

function Scan(row) {
    let playerPos = GetEntityCoords(PlayerPedId());
    let targetPos = row.position;
    let distancea = GetDistanceBetweenCoords(playerPos[0], playerPos[1], playerPos[2], targetPos.x, targetPos.y, targetPos.z);

    let checkDistance = 300;
    if (IsPedInAnyVehicle(PlayerPedId(), false)) {
        checkDistance = 700;
    }

    return distancea < checkDistance;
}

/* Jewelry & Protected pocket */
RegisterNuiCallbackType('openJewelry');
on('__cfx_nui:openJewelry', async (data, cb) => {
    await CloseGui(false);
    OpenJewelryInventory();
    cb({});
});

function OpenJewelryInventory() {
    const cid = exports.isPed.isPed("cid");
    const inventory = `container-jewelry:${cid}-Jewelry-jewelry`;
    emit("inventory-open-container", inventory, 5, 30.0);
}

RegisterNuiCallbackType('openProtectedInventory');
on('__cfx_nui:openProtectedInventory', async (data, cb) => {
    await CloseGui(false);
    OpenProtectedInventory();
    cb({});
});

function OpenProtectedInventory() {
    const cid = exports.isPed.isPed("cid");
    const inventory = `container-protected:${cid}-Protected-protected`;
    emit("inventory-open-container", inventory, 5, 70.0);
}

/* Material Containers */
const matsToTrade = [
    'aluminium',
    'copper',
    'glass',
    'plastic',
    'rubber',
    'scrapmetal',
    'steel',
    'electronics',
];
setTimeout(() => {
    for (const key of Object.keys(itemList)) {
        const item = itemList[key];
        if (!item.craft || !item.craft[0] || !item.craft[0][0]) {
            continue;
        }

        item.craft.forEach((c) => {
            const newCraft = [];
            const newCraft2 = [];
            let shouldPush = false;
            c.forEach((mat) => {
                const idx = matsToTrade.indexOf(mat.itemid);
                if (idx === -1 || mat.itemid === 'electronics') {
                    newCraft.push({
                        itemid: mat.itemid,
                        amount: mat.amount,
                    });
                    newCraft2.push({
                        itemid: mat.itemid,
                        amount: mat.amount,
                    });
                    return;
                }
                shouldPush = true;
                newCraft.push({
                    itemid: `refined${mat.itemid}a`,
                    amount: Math.max(Math.floor(mat.amount / 5.5), 1),
                });
                newCraft2.push({
                    itemid: `refined${mat.itemid}s`,
                    amount: Math.max(Math.floor(mat.amount / 18.75), 1),
                });
            });
            if (!shouldPush) {
                return;
            }
            item.craft.push(newCraft);
            item.craft.push(newCraft2);
        });
    }
}, 5000);

const extraMaterialsForBag = [
    'genericelectronicpart',
    'mgenericmechanicpart',
    'golddust',
];

let promptOpen = false;
on('rd-inventory:itemUsed', async (pItem, pInfo, pInv, pSlot) => { 
    if (pItem !== 'materialcontainer') {
        return;
    }
    if (promptOpen) {
        promptOpen = false;
        emit('DoLongHudText', 'Hmm, the lock jammed, Try again!');
        return;
        
    }
    promptOpen = true;
    const promptOptions = [
        { id: 'add', name: 'Add Materials' },
        /* { id: 'change_image', name: 'Change Image' }, */
    ];
    const validKeys = [
        ...matsToTrade,
        ...matsToTrade.map((mat) => `refined${mat}a`),
        ...matsToTrade.map((mat) => `refined${mat}s`),
        ...extraMaterialsForBag,
    ];
    let meta = JSON.parse(pInfo || '{}') || {};
    if (!meta.id) {
        meta.id = Math.floor(Math.random() * 1000000) + 1000000;
    } else {
        console.log("getting data") 

        getStuff = await exports['rd-inventory'].getItemInformation(pSlot);  
        console.log(getStuff)
        meta = JSON.parse(getStuff)
    }
    for (const key of Object.keys(meta)) {
        if (validKeys.indexOf(key) === -1) {
            continue;
        }
        promptOptions.push({
            id: `withdraw:${key}`,
            name: `Withdraw: ${itemList[key].displayname} - ${meta[key]}`,
        });
    }
    const prompt = await exports['rd-ui'].OpenInputMenu( 
        [ 
            {
                label: 'Action',
                name: 'action',
                _type: 'select',
                options: promptOptions,
            },
            /* {
                label: 'Value',
                name: 'value',
            }, */
        ],
        (values) => values && values.action,
    );
    setTimeout(() => promptOpen = false, 2500);
    if (!prompt) {
        console.log("no prompt");
        return;
    }
    if (prompt.action === 'add') {
        for (const key of validKeys) {
            const qty = Math.min(exports['rd-inventory'].getQuantity(key, true), 50000); 
            if (!qty) {
                continue;
            }
            if (!meta[key]) {
                meta[key] = 0;
            }
            meta[key] += qty;
            if (!meta._hideKeys) {
                meta._hideKeys = [];
            }
            if (meta._hideKeys.indexOf(key) === -1) {
                meta._hideKeys.push(key);
            }
            meta[itemList[key].displayname] = meta[key];
            TriggerEvent('inventory:removeItem', key, qty);
        }
        emit('DoLongHudText', 'Materials added!');
        UpdateItem(pItem, pSlot, JSON.stringify(meta));
        /* TriggerServerEvent('rd-inventory:matBagUpdate', meta.id, meta); */
        return;
    }
    if (prompt.action.indexOf('withdraw:') === 0) {
        const key = prompt.action.split(':')[1];
        let qty = Number(prompt.value);
        if (isNaN(qty)) {
            qty = meta[key];
        }
        if (isNaN(qty) || !qty) {
            qty = 0;
        }
        qty = Math.min(qty, 50000);
        if (qty < 1 || qty > meta[key]) {
            return;
        }
        meta[key] -= qty;
        meta[itemList[key].displayname] -= qty;
        if (meta[key] < 1) {
            delete meta[key];
            delete meta[itemList[key].displayname];
        }
        UpdateItem(pItem, pSlot, JSON.stringify(meta)); 
        TriggerEvent('player:receiveItem', key, qty);
        console.log(meta.id);
        console.log(meta);
        /* TriggerServerEvent('rd-inventory:matBagUpdate', meta.id, meta); */
        return;
    }
    if (prompt.action === 'change_image') {
        if (!meta._hideKeys) {
            meta._hideKeys = [];
        }
        if (meta._hideKeys.indexOf('_image_url') === -1) {
            meta._hideKeys.push('_image_url');
        }
        meta._image_url = prompt.value;
        UpdateItem(pItem, pSlot, JSON.stringify(meta));
        return;
    }
});

tradingIn = false;
on('rd-cia:depositMaterials', async () => {
    if (tradingIn) return;
    tradingIn = true;
    emit('doAnim', 'cokecut');
    const finished = await new Promise((r) => exports['rd-taskbar'].taskBar(10000, 'Gathering materials...', true, true, null, false, r));
    ClearPedTasks(PlayerPedId());
    tradingIn = false;
    if (finished !== 100) return;
    const qty = Math.min(exports['rd-inventory'].getQuantity('cia_weapon_material', true), 50000);
    if (qty < 1) return;
    emit('inventory:removeItem', 'cia_weapon_material', qty);
    TriggerServerEvent('rd-inventory:depositCiaMaterials', qty);
});

on('rd-cia:checkMaterials', async () => {
    if (tradingIn) return;
    TriggerServerEvent('rd-inventory:checkCiaMaterials');
});

console.log("APTAL ALPEREN", usedSlots)