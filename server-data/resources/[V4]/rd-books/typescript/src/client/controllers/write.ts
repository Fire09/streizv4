import { progressBar } from "../utils";
import { RegisterUICallback } from "../utils/ui";



export async function InitWrite(): Promise<void> {
    on("rd-books:ui:createBook", (ignore: boolean = false) => {
        const uiData = {
            id: "rd-books:ui:createBook",
            ignorePaperRequirement: ignore
        };

        const title = {
            icon: "user-edit",
            label: "Book title",
            name: "title"
        };

        const icon = {
            icon: "image",
            label: "Icon (imgur image link)",
            name: "icon",
        };

        const pages = {
            icon: 'edit',
            label: 'Pages (imgur album link)',
            name: 'pagesUrl',
        }

        const ui = {
            callbackUrl: 'rd-books:ui:createBook',
            key: uiData,
            items: [title, icon, pages],
            show: true,
        }

        globalThis.exports['rd-ui'].openApplication('textbox', uiData)
    });

    onNet("rd-books:bookCreated", (req, name, image) => {
        if (req.success === false) {
            emit('DoLongHudText', req.message, 2)
            return
        }
        const {
            pages: pages,
            width: width,
            height: height,
        } = req,
        
        ui = {
            pages: pages,
            width: width,
            height: height,
        }

        globalThis.exports['rd-ui'].openApplication('book', ui)
        
        emit('inventory:removeItem', 'paper', 1)
        
        const uiData = {
            pages: pages,
            width: width,
            height: height,
        }
        
        uiData['_name'] = name
        uiData['_image_url'] = image
        uiData['_hideKeys'] = [
        '_image_url',
        '_name',
        'pages',
        'width',
        'height',
        ]
        
        emit('player:receiveItem', 'book', 1, false, uiData)
    });

    RegisterUICallback("rd-books:ui:createBook", async (data, cb) => {
        cb({ data: [], meta: { ok: true, message: '' } });

        globalThis.exports["rd-ui"].closeApplication("textbox");

        if (!data.key.ignorePaperRequirement) {
            const item = exports["rd-inventory"].hasEnoughOfItem("paper", 1, false, true);

            if (!item) emit("DoLongHudText", "You're missing paper"); return;
        }

        emit("animation:PlayAnimation", "notepad");

        const success = await progressBar(20000, "Writing a book...", true);

        emit('animation:PlayAnimation', "cancel");

        if (success !== 100) return;

        const {
            values: { title: title, pagesUrl: pages, icon: icon },
        } = data
        
        emitNet("rd-books:createBook", title, pages, icon);
    });
};