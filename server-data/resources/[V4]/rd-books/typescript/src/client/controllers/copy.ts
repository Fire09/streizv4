

import { progressBar } from "../utils";
import { RegisterUICallback } from "../utils/ui";

export async function InitCopy(): Promise<void> {
    on("rd-books:copyBook", () => {
        const item = globalThis.exports["rd-inventory"].getItemsOfType("book", 20, true).reduce((a1, a2) => {
            const key = JSON.parse(a2.information);
            if (a1.find((values) => values.title === key["_name"])) {
                return a1;
            }

            const context = {
                title: key["_name"],
                action: "rd-ui:books:copyBook",
                key: key
            };

            return (
                a1.push(context),
                a1
            );
        }, []);

        if (item.length === 0) {
            emit("DoLongHudText", "You have no books.", 2);
            return;
        }
        
        globalThis.exports["rd-ui"].showContextMenu(item);
    });

    RegisterUICallback("rd-ui:books:copyBook", async (data, cb) => {
        cb({ data: [], meta: { ok: true, message: '' } });

        const info = data.key;
        const item = globalThis.exports["rd-inventory"].hasEnoughOfItem("paper", 1, false, true);
        if (!item) {
            emit("DoLongHudText", "You're missing Paper");
            return;
        }

        emit("animation:PlayAnimation", "notepad");
        
        const success = await progressBar(3000, "Copying a book...");

        emit("animation:PlayAnimation", "cancel");

        if (success !== 100) return;

        emit("invnetory:removeItem", "paper", 1);

        emit("player:receiveItem", "book", 1, false, info);
    });
}