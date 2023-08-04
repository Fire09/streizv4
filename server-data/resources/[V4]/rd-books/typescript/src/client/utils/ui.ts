

export const registered = [];

export function RegisterUICallback(name, cb) {
    AddEventHandler(`_npx_uiReq:${name}`, cb);

    if (GetResourceState('rd-ui') === 'started') globalThis.exports['rd-ui'].RegisterUIEvent(name);

    registered.push(name);
}

export function SendUIMessage(data) {
    globalThis.exports['rd-ui'].SendUIMessage(data);
}

export function SetUIFocus(hasFocus, hasCursor) {
    globalThis.exports['rd-ui'].SetUIFocus(hasFocus, hasCursor);
}

export function GetUIFocus() {
    return globalThis.exports['rd-ui'].GetUIFocus();
}

AddEventHandler('_npx_uiReady', () => {
    registered.forEach((eventName) => globalThis.exports['rd-ui'].RegisterUIEvent(eventName));
});