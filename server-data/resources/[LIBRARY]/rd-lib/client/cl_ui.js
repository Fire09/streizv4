const regged = [];

function RegisterUICallback(name, cb) {
    AddEventHandler(`_stx_uiReq:${name}`, cb);

    if (GetResourceState('rd-ui') === 'started') exports['rd-ui'].RegisterUIEvent(name);

    regged.push(name);
}

function SendUIMessage(data) {
    exports['rd-ui'].SendUIMessage(data);
}

function SetUIFocus(hasFocus, hasCursor) {
    exports['rd-ui'].SetUIFocus(hasFocus, hasCursor);
}

function GetUIFocus() {
    return exports['rd-ui'].GetUIFocus();
}

AddEventHandler('_stx_uiReady', () => {
    regged.forEach((eventName) => exports['rd-ui'].RegisterUIEvent(eventName));
});