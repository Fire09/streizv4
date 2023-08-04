/*

    Variables

*/

let DataEntries = 0;

/*

    Functions

*/

function makeid(length) {
    var result = '';
    var characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghikjlmnopqrstuvwxyz'; //abcdef
    var charactersLength = characters.length;
    for (var i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
};


function removecash(pSrc, amount) {
    emit('cash:remove', pSrc, amount)
}

async function GenerateInformation(pSource, pCid, pItemID, pItemData) {
    return new Promise((resolve, reject) => {
        if (pItemID == "") return resolve("{}");

        let returnInfo = "{}"

        if (!isNaN(pItemID)) {
            returnInfo = JSON.stringify({
                serial: makeid(3) + "-" + Math.floor((Math.random() * 999) + 1),
                ammo: 0,
            })

            return resolve(returnInfo);
        } else if (Object.prototype.toString.call(pItemID) === '[object String]') {
            switch (pItemID.toLowerCase()) {
                case "idcard":
                    if (pItemData.fake) {
                        returnInfo = JSON.stringify(pItemData)

                        return resolve(returnInfo);
                    } else {
                        let gender = "Male"
                        if (exports["rd-base"].getChar(pSource, "gender") === 1) {
                            gender = "Female"
                        }

                        returnInfo = JSON.stringify({
                            ["Identifier"]: pCid,
                            ["Name"]: exports["rd-base"].getChar(pSource, "first_name").replace(/[^\w\s]/gi, ''),
                            ["Surname"]: exports["rd-base"].getChar(pSource, "last_name").replace(/[^\w\s]/gi, ''),
                            ["Sex"]: gender,
                            ["DOB"]: exports["rd-base"].getChar(pSource, "dob")
                        })

                        return resolve(returnInfo);
                    }

                default:
                    if (pItemData === undefined) {
                        pItemData = {}
                    }

                    returnInfo = JSON.stringify(pItemData);

                    return resolve(returnInfo);
            }
        } else {
            return resolve(returnInfo);
        }
    });
};

/*

    Events

*/

onNet("onResourceStart", (resource) => {
    if (resource == GetCurrentResourceName()) {
        setTimeout(() => {
            emit("rd-inventory:luaItemList", itemList)
        }, 5000);
    }
})

onNet("riddle-ready-inventory", async () => {
    let src = source;

    emitNet("requested-dropped-items", src, JSON.stringify(Object.assign({}, DroppedInventories)));
});

onNet("server-request-update", async (pCid) => {
    let src = source
    let playerInventoryName = "ply-" + pCid

    let inventoryPlayer = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerInventoryName}' group by slot`);

    if (inventoryPlayer) {
        emitNet("inventory-update-player", src, [inventoryPlayer, 0, playerInventoryName]);
    }
});

onNet("server-request-update-src", async (pCid, pSource) => {
    let playerInventoryName = "ply-" + pCid

    let inventoryPlayer = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerInventoryName}' group by slot`);

    if (inventoryPlayer) {
        emitNet("inventory-update-player", pSource, [inventoryPlayer, 0, playerInventoryName]);
    }
});

onNet("server-inventory-open", async (pCoords, pCid, pSecondInventory, pTargetName, pItemToDropArray, pSource, pWeight, pSlots) => {
    let src = source

    if (!src) {
        src = pSource
    }

    let playerInventoryName = "ply-" + pCid

    if (InUseInventories[pTargetName] || InUseInventories[playerInventoryName]) {
        if (InUseInventories[playerInventoryName]) {
            if ((InUseInventories[playerInventoryName] != pCid)) {
                return
            }
        }
        if (InUseInventories[pTargetName]) {
            if (InUseInventories[pTargetName] != pCid) {
                pSecondInventory = "69"
            }
        }
    }

    let inventoryPlayer = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerInventoryName}' group by slot`);

    if (inventoryPlayer) {
        InUseInventories[playerInventoryName] = pCid;

        if (pSecondInventory == "1") {
            let inventoryTarget = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory WHERE name = '${pTargetName}' group by slot`)

            if (inventoryTarget) {
                emitNet("inventory-open-target", src, [inventoryPlayer, 0, playerInventoryName, inventoryTarget, 0, pTargetName, 500, true, pWeight, pSlots]);
                InUseInventories[pTargetName] = pCid
            }
        } else if (pSecondInventory == "3") {
            let NewDroppedName = "Drop-" + DataEntries.toString();

            DataEntries = DataEntries + 1;

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: pCoords[0],
                    y: pCoords[1],
                    z: pCoords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }

            InUseInventories[NewDroppedName] = pCid;

            emitNet("inventory-open-target", src, [inventoryPlayer, 0, playerInventoryName, "{}", 0, NewDroppedName, 500, false]);
        } else if (pSecondInventory == "13") {
            let NewDroppedName = "Drop-" + DataEntries.toString();

            DataEntries = DataEntries + 1;

            for (let Key in pItemToDropArray) {
                for (let i = 0; i < pItemToDropArray[Key].length; i++) {
                    let objectToDrop = pItemToDropArray[Key][i];
                    exports.oxmysql.query(`UPDATE inventory SET slot='${i+1}', name='${NewDroppedName}', dropped='1' WHERE name='${Key}' and slot='${objectToDrop.faultySlot}' and item_id='${objectToDrop.faultyItem}'`);
                }
            }

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: pCoords[0],
                    y: pCoords[1],
                    z: pCoords[2]
                },
                name: NewDroppedName,
                used: false,
                lastUpdated: Date.now()
            }

            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])
        } else if (pSecondInventory == "42069") {
            let NewDroppedName = "Drop-" + DataEntries.toString();

            DataEntries = DataEntries + 1;

            DroppedInventories[NewDroppedName] = {
                position: {
                    x: pCoords[0],
                    y: pCoords[1],
                    z: pCoords[2]
                },
                name: NewDroppedName,
                used: true,
                lastUpdated: Date.now()
            }

            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[NewDroppedName])

            let creationDate = Date.now()
            let information = "{}";

            if (pItemToDropArray.generateInformation || pItemToDropArray.data) {
                information = await GenerateInformation(src, pCid, pItemToDropArray.itemid, pItemToDropArray.data);
            }

            exports.oxmysql.insert(`INSERT INTO inventory (item_id, name, information, slot, dropped, creationDate) VALUES ('${pItemToDropArray.itemid}','${NewDroppedName}','${information}','${pItemToDropArray.slot}', '1', '${creationDate}' );`);
        } else if (shopList[pSecondInventory]) {
            var shopArray = shopList[pSecondInventory];
            var shopAmount = shopArray.length;

            shopArray.forEach(function(item, index) {
                item["id"] = 0;
                item["name"] = pTargetName;
                item["information"] = "{}";
                item["slot"] = index + 1;
            });

            emitNet("inventory-open-target", src, [inventoryPlayer, 0, playerInventoryName, JSON.stringify(shopArray), shopAmount, pTargetName, 500, false, false, false, pSecondInventory]);
        } else if (pSecondInventory == "7") {
            pItemToDropArray = JSON.parse(pItemToDropArray)

            let shopArray = [];

            shopArray[0] = {
                item_id: pItemToDropArray[0].itemid,
                id: 0,
                name: "shop",
                information: "{}",
                slot: 1,
                amount: pItemToDropArray[0].amount
            };

            shopArray = JSON.stringify(shopArray);

            var shopAmount = pItemToDropArray.length;

            emitNet("inventory-open-target", src, [inventoryPlayer, 0, playerInventoryName, shopArray, shopAmount, pTargetName, 500, false]);
        } else {
            emitNet("inventory-update-player", src, [inventoryPlayer, 0, playerInventoryName]);
        }
    };
});

onNet("server-inventory-refresh", async (pCid, pSource) => {
    let src = source

    if (!src) {
        src = pSource
    }

    let playerInventoryName = "ply-" + pCid

    let inventoryPlayer = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, id, name, item_id, information, slot, dropped, creationDate FROM inventory where name= '${playerInventoryName}' group by slot`);

    if (inventoryPlayer) {
        emitNet("inventory-update-player", src, [inventoryPlayer, 0, playerInventoryName]);
        emitNet("current-items", src, inventoryPlayer)
    }
});

onNet("server-inventory-close", async (pCid, pTargetInventoryName) => {
    let src = source

    if (pTargetInventoryName.startsWith("Trunk")) {
        emitNet("toggle-animation", src, false);
    }

    InUseInventories = InUseInventories.filter(item => item != pCid);

    if (pTargetInventoryName.indexOf("Drop") > -1 && DroppedInventories[pTargetInventoryName]) {
        if (DroppedInventories[pTargetInventoryName].used === false) {
            delete DroppedInventories[pTargetInventoryName];
        } else {
            let inventoryTarget = await exports.oxmysql.query_async(`SELECT count(item_id) as amount, item_id, name, information, slot, dropped FROM inventory WHERE name='${pTargetInventoryName}' group by item_id `);

            if (inventoryTarget && inventoryTarget.length == 0 && DroppedInventories[pTargetInventoryName]) {
                delete DroppedInventories[pTargetInventoryName];
                emitNet("Inventory-Dropped-Remove", -1, [pTargetInventoryName])
            }
        }
    }

    emit("server-request-update-src", pCid, src)
});

onNet("server-inventory-move", async (pCid, pData, pCoords) => {
    let src = source

    let targetslot = pData[0]
    let startslot = pData[1]
    let targetName = pData[2].replace(/"/g, "");
    let startname = pData[3].replace(/"/g, "");
    let purchase = pData[4]
    let itemCosts = pData[5]
    let itemidsent = pData[6]
    let itemmeta = pData[7]
    let amount = pData[8]
    let crafting = pData[9]
    let isWeapon = pData[10]
    let PlayerStore = pData[11]
    let shopId = pData[12]
    let creationDate = Date.now()

    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {
        if (DroppedInventories[targetName].used === false) {
            DroppedInventories[targetName] = {
                position: {
                    x: pCoords[0],
                    y: pCoords[1],
                    z: pCoords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }

            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"

    if (purchase) {
        info = await GenerateInformation(src, pCid, itemidsent)

        removecash(src, itemCosts)

        let baseprice = itemList[itemidsent].price
        //exports["rd-banking"].addTaxFromValue("Goods", baseprice)

        if (PlayerStore) {
            exports.oxmysql.query(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='0' WHERE slot='${startslot}' and name='${startname}'`);
        } else if (crafting) {
            for (let i = 0; i < parseInt(amount); i++) {
                info - await GenerateInformation(src, pCid, itemidsent)
                exports.oxmysql.query(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}');`);
            }
        } else {
            for (let i = 0; i < parseInt(amount); i++) {
                info - await GenerateInformation(src, pCid, itemidsent)
                exports.oxmysql.query(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}');`);
            }
        }
    } else if (crafting == true) {
        for (let i = 0; i < parseInt(amount); i++) {
            info - await GenerateInformation(src, pCid, itemidsent)
            exports.oxmysql.query(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}');`);
        }
    } else {
        let dropped = 0;
        if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {
            dropped = 1;
        };

        exports.oxmysql.query(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='${dropped}' WHERE slot='${startslot}' and name='${startname}'`);
    }
});

onNet("server-inventory-stack", async (pCid, pData, pCoords) => {
    let src = source

    let targetslot = pData[0]
    let moveAmount = pData[1]
    let targetName = pData[2].replace(/"/g, "");
    let originSlot = pData[3]
    let originInventory = pData[4].replace(/"/g, "");
    let purchase = pData[5]
    let itemCosts = pData[6]
    let itemidsent = pData[7]
    let itemmeta = pData[8]
    let amount = pData[9]
    let crafting = pData[10]
    let isWeapon = pData[11]
    let PlayerStore = pData[12]
    let amountRemaining = pData[13]
    let shopId = pData[14]
    let creationDate = Date.now()

    if ((targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) && DroppedInventories[targetName]) {
        if (DroppedInventories[targetName].used === false) {
            DroppedInventories[targetName] = {
                position: {
                    x: pCoords[0],
                    y: pCoords[1],
                    z: pCoords[2]
                },
                name: targetName,
                used: true,
                lastUpdated: Date.now()
            }

            emitNet("Inventory-Dropped-Addition", -1, DroppedInventories[targetName])
        }
    }

    let info = "{}"

    if (purchase) {
        info = await GenerateInformation(src, pCid, itemidsent)

        let cid = parseInt(targetName.replace("ply-", ""))
      //  let accountId = shopAccounts[shopId]
        let baseprice = itemList[itemidsent].price
        let itemname = itemList[itemidsent].displayname
       // let comment = "Brought " + amount + " " + itemname

        removecash(src, itemCosts)
        //exports["rd-banking"].transaction(accountId, accountId, baseprice, comment, cid, 7)
        //exports["rd-banking"].addTaxFromValue("Goods", baseprice)

        if (PlayerStore) {
            payStore(startname, itemCosts, itemidsent)

            exports.oxmysql.query(`UPDATE inventory SET slot='${targetslot}', name='${targetname}', dropped = '0' WHERE slot='${startslot}' AND name='${startname}'`);
        } else {
            for (let i = 0; i < parseInt(amount); i++) {
                info = await GenerateInformation(src, pCid, itemidsent);
                exports.oxmysql.query(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}');`);
            }
        }
    } else if (crafting) {
        for (let i = 0; i < parseInt(amount); i++) {
            info = await GenerateInformation(src, pCid, itemidsent)
            exports.oxmysql.query(`INSERT INTO inventory (item_id, name, information, slot, creationDate) VALUES ('${itemidsent}','${targetName}','${info}','${targetslot}','${creationDate}');`);
        }
    } else {
        if (amountRemaining > 0) {
            moveAmount = moveAmount + 1
        };

        let inventory = await exports.oxmysql.query_async(`SELECT id, item_id, creationDate FROM inventory WHERE slot='${originSlot}' and name='${originInventory}' LIMIT ${moveAmount}`);

        if (inventory) {
            let toupdate = 0;
            let itemids = "0";

            inventory.forEach(function(item, index) {
                if ((amountRemaining > 0) && (index == (inventory.length - 1))) {
                    toupdate = item.creationDate
                } else {
                    itemids = itemids + "," + item.id
                }
            });

            let dropped = 0;
            if (targetName.indexOf("Drop") > -1 || targetName.indexOf("hidden") > -1) {
                dropped = 1;
            };

            let affectedRows = await exports.oxmysql.update_async(`UPDATE inventory SET slot='${targetslot}', name='${targetName}', dropped='${dropped}' WHERE id IN (${itemids})`);

            if (toupdate != 0) {
                emitNet("inventory:qualityUpdate", src, originSlot, originInventory, toupdate);
            };
        }
    }
});

onNet("server-inventory-swap", async (pCid, pData, pCoords) => {
    let targetslot = pData[0]
    let targetname = pData[1].replace(/"/g, "");
    let startslot = pData[2]
    let startname = pData[3].replace(/"/g, "");

    let inventoryTarget = await exports.oxmysql.query_async(`SELECT id FROM inventory WHERE slot='${targetslot}' AND name='${targetname}'`);

    if (inventoryTarget) {
        var itemids = "0"
        for (let i = 0; i < inventoryTarget.length; i++) {
            itemids = itemids + "," + inventoryTarget[i].id
        }

        let string = "";
        if (targetname.indexOf("Drop") > -1 || targetname.indexOf("hidden") > -1) {
            string = `UPDATE inventory SET slot='${targetslot}', name ='${targetname}', dropped='1' WHERE slot='${startslot}' AND name='${startname}'`;
        } else {
            string = `UPDATE inventory SET slot='${targetslot}', name ='${targetname}', dropped='0' WHERE slot='${startslot}' AND name='${startname}'`;
        }

        let affectedRows = await exports.oxmysql.update_async(string);

        if (affectedRows && affectedRows > 0) {
            if (startname.indexOf("Drop") > -1 || startname.indexOf("hidden") > -1) {
                exports.oxmysql.update(`UPDATE inventory SET slot='${startslot}', name='${startname}', dropped='1' WHERE id IN (${itemids})`);
            } else {
                exports.oxmysql.update(`UPDATE inventory SET slot='${startslot}', name='${startname}', dropped='0' WHERE id IN (${itemids})`);
            }
        }
    }
});

onNet("server-update-item", async (pCid, pItemID, pSlot, pData) => {
    let src = source

    let playerInventoryName = "ply-" + pCid

    let affectedRows = await exports.oxmysql.update_async(`UPDATE inventory SET information='${JSON.stringify(pData)}' WHERE item_id='${pItemID}' and name='${playerInventoryName}' and slot='${pSlot}'`);

    if (affectedRows && affectedRows > 0) {
        emit("server-request-update-src", pCid, src)
    }
});

onNet("server-update-item-id", async (pCid, pId, pData) => {
    let src = source

    let playerInventoryName = "ply-" + pCid

    let affectedRows = await exports.oxmysql.update_async( `UPDATE inventory SET information='${JSON.stringify(pData)}' WHERE id='${pId}' and name='${playerInventoryName}'`);

    if (affectedRows && affectedRows > 0) {
        emit("server-request-update-src", pCid, src)
    }
});

onNet("server-inventory-give", async (pCid, pItemID, pSlot, pAmount, pGenerateInfo, pItemData, pOpenedInv) => {
    let src = source

    let playerInventoryName = "ply-" + pCid
    let information = "{}"
    let creationDate = Date.now()

    if (pGenerateInfo || pItemData) {
        information = await GenerateInformation(src, pCid, pItemID, pItemData)
    }

    let values = `('${playerInventoryName}','${pItemID}','${information}','${pSlot}','${creationDate}')`
    if (pAmount > 1) {
        for (let i = 2; i <= pAmount; i++) {
            values = values + `,('${playerInventoryName}','${pItemID}','${information}','${pSlot}','${creationDate}')`
        }
    }

    let insertId = await exports.oxmysql.insert_async(`INSERT INTO inventory (name,item_id,information,slot,creationDate) VALUES ${values};`);

    if (insertId && insertId > 0) {
        emit("server-request-update-src", pCid, src)
    }
});

onNet("server-remove-item", async (pCid, pItemID, pAmount, pOpenedInv) => {
    let src = exports["rd-base"].getSidWithCid(pCid)

    let playerInventoryName = "ply-" + pCid

    exports.oxmysql.query(`DELETE FROM inventory WHERE name='${playerInventoryName}' and item_id='${pItemID}' LIMIT ${pAmount}`, {}, function () {
        if (src != 0) {
            emit("server-request-update-src", pCid, src)
        }
    });
});

onNet("server-inventory-remove-slot", async (pCid, pItemID, pAmount, pSlot) => {
    let src = exports["rd-base"].getSidWithCid(pCid)

    let playerInventoryName = "ply-" + pCid

    exports.oxmysql.query(`DELETE FROM inventory WHERE name='${playerInventoryName}' and item_id='${pItemID}' and slot='${pSlot}' LIMIT ${pAmount}`, {}, function () {
        if (src != 0) {
            emit("server-request-update-src", pCid, src)
        }
    });
});

onNet("server-remove-item-kv", async (pCid, pItemID, pAmount, pMetaKey, pMetaValue) => {
    let src = exports["rd-base"].getSidWithCid(pCid)

    let playerInventoryName = "ply-" + pCid

    let inventory = await exports.oxmysql.query_async(`SELECT id, information FROM inventory WHERE item_id='${pItemID}' AND name='${playerInventoryName}'`);

    if (inventory) {
        let itemids = "0"

        for (let i = 0; i < inventory.length; i++) {
            let meta = JSON.parse(inventory[i].information)

            if (meta[pMetaKey] == pMetaValue) {
                itemids = itemids + "," + inventory[i].id
            }
        }

        exports.oxmysql.query(`DELETE FROM inventory WHERE id IN (${itemids}) LIMIT ${pAmount}`, {}, function () {
            if (src != 0) {
                emit("server-request-update-src", pCid, src)
            }
        });
    }
});

onNet("inventory:degItem", async (pItemId, pPercent, pItemClass, pCid) => {
    if (itemList[pItemClass.toString()] == null || itemList[pItemClass.toString()].decayrate <= 0.0) {
        return
    }

    let percent = Math.round(((TimeAllowed * itemList[pItemClass.toString()].decayrate) / 100) * pPercent)

    exports.oxmysql.query(`UPDATE inventory set creationDate = creationDate - ${percent} WHERE id = ${pItemId}`);
});

onNet("rd-inventory:clear", async (pSource, pName) => {
    let src = source

    if (pSource) {
        src = pSource
    }

    let cid = 0
    let name = ""
    if (!pName) {
        cid = exports["rd-base"].getChar(src, "id")
        if (!cid) {
            return
        }

        name = "ply-" + cid
    } else {
        name = pName
    }

    exports.oxmysql.query(`DELETE FROM inventory WHERE name='${name}'`, {}, function () {
        if (cid > 0) {
            emit("server-request-update-src", cid, src)

            exports.oxmysql.scalar(`SELECT cash FROM characters WHERE id = '${cid}'`, {}, function(cash){
                if (cash && cash > 0) {
                    removecash(pSource, cash)
                }
            })
        }
    });
});
