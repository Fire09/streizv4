const registered = [];

export function RegisterUICallback(name, cb) {
    AddEventHandler(`_npx_uiReq:${name}`, cb);

    if (GetResourceState('rd-ui') === 'started') exports['rd-ui'].RegisterUIEvent(name);

    registered.push(name);
}

export function SendUIMessage(data) {
    exports['rd-ui'].SendUIMessage(data);
}

export function SetUIFocus(hasFocus, hasCursor) {
    exports['rd-ui'].SetUIFocus(hasFocus, hasCursor);
}

export function GetUIFocus() {
    return exports['rd-ui'].GetUIFocus();
}

AddEventHandler('_npx_uiReady', () => {
    registered.forEach((eventName) => exports['rd-ui'].RegisterUIEvent(eventName));
});