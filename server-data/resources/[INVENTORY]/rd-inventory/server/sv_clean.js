/*

    Variables

*/

let DroppedInventories = [];
let InUseInventories = [];
let savelist = [];

const DROPPED_ITEM_KEEP_ALIVE = 1000 * 60 * 15; // 15 Minutes

/*

    Functions

*/

function clean() {
    for (let Row in DroppedInventories) {
        if (new Date(DroppedInventories[Row].lastUpdated + DROPPED_ITEM_KEEP_ALIVE).getTime() < Date.now() && DroppedInventories[Row].used && !InUseInventories[DroppedInventories[Row].name]) {
            emitNet("Inventory-Dropped-Remove", -1, [DroppedInventories[Row].name])
            delete DroppedInventories[Row];
        }
    }
}

function DeleteOld() {
    let dateNow = Date.now()
    for (let i = savelist.lengh - 1; i >= 0; i++) {
        let ItemID = savelist[i]
        let TimeExtra = (TimeAllowed * ItemList[ItemID].decayrate)
        let DeleteTime = dateNow - TimeExtra
        if (itemList[itemID].fullyDegrades) {
            db(`DELETE FROM inventory WHERE item_id = "${ItemID}" AND ${DeleteTime} > creationDate`);
        }
    }
}

/*
    Events
*/

onNet("onResourceStart", (resource) => {
    if (resource == GetCurrentResourceName()) {
        setTimeout(() => {
            exports.oxmysql.query(`DELETE FROM inventory WHERE name like '%Drop%' OR name like '%trash%'`);
            exports.oxmysql.query(`DELETE FROM inventory WHERE dropped = "1"`);

            DeleteOld();
        }, 20000);
    }
})

/*

    Loops

*/

setInterval(clean, 20000)