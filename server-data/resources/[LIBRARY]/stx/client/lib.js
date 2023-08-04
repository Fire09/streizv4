function createEvent(pEvent, ...pData) {
    switch (pEvent) {
        case "coord": {
            const [_0x125f1c, _0x39f37a, _0x594ded] = pData
            return AddBlipForCoord(_0x125f1c, _0x39f37a, _0x594ded)
        }

        case "area": {
            const [_0x522564, _0xc6840, _0x1ecb37, _0x1ccd23, _0x25f175] = pData
            return AddBlipForArea(
              _0x522564,
              _0xc6840,
              _0x1ecb37,
              _0x1ccd23,
              _0x25f175
            )
        }

        case "radius": {
            const [_0xf96b55, _0x39aff9, _0x4362ac, _0x2bc9f6] = pData
            return _AddBlipForRadius(
              _0xf96b55,
              _0x39aff9,
              _0x4362ac,
              _0x2bc9f6
            )
        }

        case "pickup": {
            const [_0x137b6c] = pData
            return AddBlipForPickup(_0x137b6c)
        }

        case "entity": {
            const [_0x121ea1] = pData
            return AddBlipForEntity(_0x121ea1)
        }

        default: {
            return console.error(new Error("Invalid Blip Type")), 0
        }
    }
}

function applyEvent(_0x1dad92, _0x22b014, spriteID, spriteColor, spriteAlpha, spriteScale, spriteRoute, spriteShort) {
    if (typeof spriteID === "number") {
          SetBlipSprite(_0x1dad92, spriteID)
    }

    if (typeof spriteColor === "number") {
        SetBlipColour(_0x1dad92, spriteColor)
    }

    if (typeof spriteAlpha === "number") {
        SetBlipAlpha(_0x1dad92, spriteAlpha)
    }

    if (typeof spriteScale === "number") {
        SetBlipScale(_0x1dad92, spriteScale)
    }

    if (typeof spriteRoute === "boolean") {
        SetBlipRoute(_0x1dad92, spriteRoute)
    }

    if (typeof spriteShort === "boolean") {
        SetBlipAsShortRange(_0x1dad92, spriteShort)
    }

    typeof spriteText === "string" &&
    (BeginTextCommandSetBlipName("STRING"),
    AddTextComponentString(spriteText),
    EndTextCommandSetBlipName(_0x1dad92))
}

var _0x210690 = {
    createBlip: createEvent,
    applyBlipSettings: applyEvent,
}
const Hud = _0x210690

function rangeEvent(_0x20a0dc, _0x1b0ec3, pArgs) {
    return (
        _0x1b0ec3[0] +
        ((pArgs - _0x20a0dc[0]) * (_0x1b0ec3[1] - _0x1b0ec3[0])) /
        (_0x20a0dc[1] - _0x20a0dc[0])
    )
}

function distanceEvent([_0x327246, _0xb6ecb9, _0x477feb], [_0x11063d, _0x5d3c11, _0x15415b]) {
    const [_0x3b6cb0, _0x2e9bf2, _0x3f6415] = [
        _0x327246 - _0x11063d,
        _0xb6ecb9 - _0x5d3c11,
        _0x477feb - _0x15415b,
    ]

    return Math.sqrt(
        _0x3b6cb0 * _0x3b6cb0 + _0x2e9bf2 * _0x2e9bf2 + _0x3f6415 * _0x3f6415
    )
}

function numberEvent(pMin, pMax) {
    return Math.floor(
        pMax
        ? Math.random() * (pMax - pMin) + pMin
        : Math.random() * pMin
    )
}

var _0x23d9c8 = {
    getMapRange: rangeEvent,
    getDistance: distanceEvent,
    getRandomNumber: numberEvent,
}
const _0x2b7ce6 = _0x23d9c8

function cacheEvent(_0x1fb26f, pData) {
    const _0x38fbb8 = cacheableMap((_0x4b4c8a, _0x4bc3ec, ..._0x55a68a) => {
        return _0x1fb26f(_0x4b4c8a, ..._0x55a68a)
    }, pData)
    var _0x5db78a = {
        get: function (...pAction) {
          return _0x38fbb8.get("_", ...pAction)
        },

        reset: function () {
          _0x38fbb8.reset("_")
        },
    }
    return _0x5db78a
}

function cacheableEvent(_0x34fb4f, pData) {
    const _0x4509f8 = pData.timeToLive || 60000,
    _0x1a94ce = { _0x41e168: _0x3cd882 }

    async function _0x15432d(_0x41e168, ..._0x430093) {
        let _0x3cd882 = _0x1a94ce[_0x41e168]
        if (!_0x3cd882) {
          _0x3cd882 = _0x313850
        }

        const _0x32ab93 = Date.now()

        if (
          _0x3cd882.lastUpdated === 0 ||
          _0x32ab93 - _0x3cd882.lastUpdated > _0x4509f8
        ) {
          const [_0x55be69, _0x30c9c2] = await _0x34fb4f(
            _0x3cd882,
            _0x41e168,
            ..._0x430093
          )
          return (
            _0x55be69 &&
              ((_0x3cd882.lastUpdated = _0x32ab93),
              (_0x3cd882.value = _0x30c9c2)),
            _0x30c9c2
          )
        }
        return await new Promise((_0x3989e5) =>
          setTimeout(() => _0x3989e5(_0x3cd882.value), 0)
        )
    }

    var _0x495d82 = {
        get: async function (_0x28ea20, ..._0x455d2a) {
          return await _0x15432d(_0x28ea20, ..._0x455d2a)
        },
        reset: function (_0x3729eb) {
          var _0x23227f = _0x1a94ce[_0x3729eb]
          if (_0x23227f) {
            _0x23227f.lastUpdated = 0
          }
        },
    }

    return _0x495d82
}

function stringEvent(_0x547289) {
    return _0x1313dd(_0x547289, _0x1313dd.URL)
}

function conditionEvent(_0x2e0ba4, _0x177667) {
    return new Promise((_0x5182eb, _0x459d00) => {
        const pDate = Date.now(),
          _0xe3fd16 = setTick(() => {
            const _0xd83ef1 = Date.now() - pDate > _0x177667
            if (_0x2e0ba4() || _0xd83ef1) {
              return clearTick(_0xe3fd16), _0x5182eb(_0xd83ef1)
            }
        })
    })
}

var _0x4649a1 = {
    cache: cacheEvent,
    cacheableMap: cacheableEvent,
    waitForCondition: conditionEvent,
    //getUUID: _0x172ef5,
    getStringHash: stringEvent,
}
const Utils = Object.assign(_0x4649a1, _0x2b7ce6)
const _0x41efe3 = new Set(),
_0x340733 = new Map()

on("rd-polyzone:enter", (pZone, pData) => {
    _0x41efe3.add(pZone)
    if (pData === null || pData === undefined ? undefined : pData.id) {
        _0x41efe3.add(pZone + "-" + pData.id)
    }
    const _0x530458 = _0x340733.get(pZone + "-enter")
    if (_0x530458 === undefined) {
        return
    }
    for (const _0x52b913 of _0x530458) {
        try {
          _0x52b913(pData)
        } catch (_0x1d0ad3) {
          console.log(_0x1d0ad3)
        }
    }
})

on("rd-polyzone:exit", (pZone, pData) => {
    _0x41efe3.delete(pZone)
    if (pData === null || pData === undefined ? undefined : pData.id) {
        _0x41efe3.delete(pZone + "-" + pData.id)
    }
    const _0x580228 = _0x340733.get(pZone + "-exit")
    if (_0x580228 === undefined) {
        return
    }
    for (const _0x8981a7 of _0x580228) {
        try {
          _0x8981a7(pData)
        } catch (_0x2c69c0) {
          console.log(_0x2c69c0)
        }
    }
})

function activeEvent(pEvent, pData) {
    return _0x41efe3.has(
        pData ? pEvent + "-" + pData : pEvent
    )
}

function enterEvent(pEvent, pData) {
    var _0xd6be4a
    const _0x5439bb = pEvent + "-enter",
    _0x46aa8d =
        (_0xd6be4a = _0x340733.get(_0x5439bb)) !== null &&
        _0xd6be4a !== undefined ? _0xd6be4a : []

    if (!_0x340733.has(_0x5439bb)) {
        _0x340733.set(_0x5439bb, _0x46aa8d)
    }

    _0x46aa8d.push(pData)
}

function exitEvent(pEvent, pData) {
    var _0x7813b2
    const _0x55006e = pEvent + "-exit",
    _0x4a3977 =
        (_0x7813b2 = _0x340733.get(_0x55006e)) !== null &&
        _0x7813b2 !== undefined ? _0x7813b2 : []
        
    if (!_0x340733.has(_0x55006e)) {
        _0x340733.set(_0x55006e, _0x4a3977)
    }

    _0x4a3977.push(pData)
}

function zoneEvent(pID, pName, pVector, pLength, pWidth, pOption, pData = {}) {
    var _0x2c66a1 = {
        data: pData !== null && pData !== undefined ? pData : {},
    }
    const _0x201574 = Object.assign(Object.assign({}, pOption), _0x2c66a1)
    _0x201574.data.id = pID

    exports["rd-polyzone"].AddBoxZone(
        pName,
        pVector,
        pLength,
        pWidth,
        _0x201574
    )
}

function targetEvent(pID, pName, pVector, pLength, pWidth, pOption, pData = {}) {
    var _0x4b8c9d = { data: pData }
    const _0x3f4b75 = Object.assign(Object.assign({}, pOption), _0x4b8c9d)
    _0x3f4b75.data.id = pID

    exports["rd-polytarget"].AddBoxZone(
        pName,
        pVector,
        pLength,
        pWidth,
        _0x3f4b75
    )
}

var _0x9b2a4e = {
    isActive: activeEvent,
    onEnter: enterEvent,
    onExit: exitEvent,
    addBoxZone: zoneEvent,
    addBoxTarget: targetEvent,
}
const Zones = _0x9b2a4e

function encodePayloadEvent(pString) {
    try {
      //return _0x40440c(JSON.stringify(pString), _0x5b9890)
      return JSON.stringify(pString)
    } catch (_0x30915c) {
      console.error("Failed to encode payload")
    }
}

function decodePayloadEvent(pString) {
    try {
      //return JSON.parse(_0x5ac448(pString, _0x8f0c0c))
      return JSON.parse(pString)
    } catch (_0x5dbdb7) {
      console.error("Failed to decode payload")
    }
}

var _0x26a7a1 = {
    //getEventHash: _0x357e57,
    encodePayload: encodePayloadEvent,
    decodePayload: decodePayloadEvent,
}
const _0x2b111f = _0x26a7a1

function onEvent(pEvent, pData) {
    return on(pEvent, pData)
}
      
function onNetEvent(pEvent, pData) {
    return onNet(pEvent, pData)
}

function removeEvent(pEvent, pData) {
    removeEventListener(pEvent, pData)
}

function emitEvent(pEvent, ...pData) {
    emit(pEvent, ...pData)
}

function emitNetEvent(pEvent, ...pData) {
    const _0x5f36fd = pEvent
    _0x29fc85 = msgpack_pack(pData)
    if (_0x29fc85.length < 16000) {
        TriggerServerEventInternal(
            _0x5f36fd,
            _0x29fc85,
            _0x29fc85.length
        )
    } else {
        TriggerLatentServerEventInternal(
            _0x5f36fd,
            _0x29fc85,
            _0x29fc85.length,
            128000
        )
    }
}

var _0x16e314 = {
    on: onEvent,
    onNet: onNetEvent,
    emit: emitEvent,
    emitNet: emitNetEvent,
    remove: removeEvent,
}
const Events = _0x16e314

async function modelEvent(pEntity) {
    const pModel = typeof pEntity === "number" ? pEntity : GetHashKey(pEntity)
    if (HasModelLoaded(pModel)) {
        return true
    }
    RequestModel(pModel)
    const waitCondition = await Utils.waitForCondition(
        () => HasModelLoaded(pModel),
        30000
    )
    return !waitCondition
}

async function animEvent(pAnim) {
    if (HasAnimDictLoaded(pAnim)) {
          return true
    }
    RequestAnimDict(pAnim)
    const waitCondition = await Utils.waitForCondition(
        () => HasAnimDictLoaded(pAnim),
        30000
    )
    return !waitCondition
}

async function clipEvent(pClip) {
    if (HasClipSetLoaded(pClip)) {
          return true
    }
    RequestClipSet(pClip)
    const waitCondition = await Utils.waitForCondition(
        () => HasClipSetLoaded(pClip),
        30000
    )
    return !waitCondition
}

async function textureEvent(pTexture) {
    if (HasStreamedTextureDictLoaded(pTexture)) {
        return true
    }
    RequestStreamedTextureDict(pTexture, true)
    const waitCondition = await Utils.waitForCondition(
        () => HasStreamedTextureDictLoaded(pTexture),
        30000
    )
    return !waitCondition
}

async function weaponEvent(pEntity, _0xa2c640, _0x1b25ee) {
    const _0x586dac = typeof pEntity === "number" ? pEntity : GetHashKey(pEntity)
    if (HasWeaponAssetLoaded(_0x586dac)) {
        return true
    }
    RequestWeaponAsset(_0x586dac, _0xa2c640, _0x1b25ee)
    const waitCondition = await Utils.waitForCondition(
        () => HasWeaponAssetLoaded(_0x586dac),
        30000
    )
    return !waitCondition
}

async function namedEvent(pAsset) {
    if (HasNamedPtfxAssetLoaded(_0x42ffa8)) {
        return true
    }
    RequestNamedPtfxAsset(pAsset)
    const waitCondition = await Utils.waitForCondition(
        () => HasNamedPtfxAssetLoaded(pAsset),
        30000
    )
    return !waitCondition
}

var _0x1bc43e = {
    loadModel: modelEvent,
    loadTexture: textureEvent,
    loadAnim: animEvent,
    loadClipSet: clipEvent,
    loadWeaponAsset: weaponEvent,
    loadNamedPtfxAsset: namedEvent,
}
const Streaming = _0x1bc43e

let _0x5d0b66 = new Date().getTime()
const _0x449db6 = GetCurrentResourceName(),
_0x404cc4 = new Map()

function registerEvent(pEvent, _0x5b3af5) {
    Events.onNet("__stx_req:" + pEvent, async (_0x251268, pArgs) => {
        let _0x48e6c6, _0x841894
        const pData = _0x2b111f.decodePayload(_0x251268)

        if (pData === undefined) {
            return console.log("[RPC] Received malformed packet:", _0x251268)
        }
        try {
            _0x48e6c6 = await _0x5b3af5(...pArgs)
            _0x841894 = true
        } catch (_0x1decda) {
            _0x48e6c6 = _0x1decda
            _0x841894 = false
        }
        if (pData.type === "remote") {
            Events.emitNet("__stx_res:" + pData.origin, pData.id, [
              _0x841894,
              _0x48e6c6,
            ])
        } else {
            pData.type === "local" &&
            Events.emit("__stx_res:" + pData.origin, pData.id, [
              _0x841894,
              _0x48e6c6,
            ])
        }
      }
    )
}

function executeEvent(pEvent, ...pData) {
    //_0x257c5f.id = ++_0x5d0b66
    //_0x257c5f.origin = _0x449db6
    var _0x257c5f = {
        id: ++_0x5d0b66,
        origin: _0x449db6
    }
    const _0x3de7e4 = _0x257c5f,

    _0x59a132 = new Promise((_0x1f6f27, _0x30092e) => {
        const timeout = +setTimeout(() =>
        _0x30092e(new Error("Remote call timed out | " + pEvent)),
          60000
        )
            
        var _0x394112 = {
            resolve: _0x1f6f27,
            reject: _0x30092e,
            timeout: timeout,
        }
            
        _0x404cc4.set(_0x3de7e4.id, _0x394112)
    })

    return (
        Events.emitNet("__stx_req:" + pEvent, _0x2b111f.encodePayload(_0x3de7e4), pData),
        _0x59a132.finally(() => _0x404cc4.delete(_0x3de7e4.id)),
        _0x59a132
    )
}

Events.onNet("__stx_res:" + _0x449db6, (pEvent, pData) => {
    const _0x4ceafc = _0x404cc4.get(pEvent)
    if (_0x4ceafc === undefined) {
        return
    }
    clearTimeout(_0x4ceafc.timeout)
    const [_0x965706, _0x22e9e3] = pData
      
    _0x965706 ? _0x4ceafc.resolve(_0x22e9e3) : _0x4ceafc.reject(new Error(_0x22e9e3))

    //if (_0x965706) {
      //_0x4ceafc.resolve(_0x22e9e3)
    //} else {
      //_0x4ceafc.reject(new Error(_0x22e9e3))
    //}
})

var _0x5eda59 = {
    register: registerEvent,
    execute: executeEvent,
}
const Procedures = _0x5eda59

function modelEvents(pModel, pData, pOption) {
    exports["rd-interact"].AddPeekEntryByModel(
        pModel,
        pData,
        pOption
    )
}

function targetEvents(pModel, pData, pOption) {
    exports["rd-interact"].AddPeekEntryByPolyTarget(
        pModel,
        pData,
        pOption
    )
}

function flagEvents(pModel, pData, pOption) {
    exports["rd-interact"].AddPeekEntryByFlag(
        pModel,
        pData,
        pOption
    )
}

function taskEvent(pLength, pTitle, _0x1568b1 = false,  _0x4a3532 = null) {
    return new Promise((_0x8450ad) => {
        exports["rd-taskbar"].taskBar(
            pLength,
            pTitle,
            _0x1568b1,
            true,
            null,
            false,
            _0x8450ad,
            _0x4a3532 === null || _0x4a3532 === undefined
              ? undefined
              : _0x4a3532.distance,
            _0x4a3532 === null || _0x4a3532 === undefined
              ? undefined
              : _0x4a3532.entity
        )
    })
}

function confirmationEvent(pTitle, pText, pIcon){
    return new Promise((_0x157869) => {
        exports["rd-phone"].DoPhoneConfirmation(
            pTitle,
            pText,
            pIcon,
            _0x157869
        )
    })
}

function notificationEvent(pTitle, _0x210cf9, _0x11dee1 = true, pApp = "home-screen") {
    _0x1b047a.target_app = pApp
    _0x1b047a.title = pTitle
    _0x1b047a.body = _0x210cf9
    _0x1b047a.show_even_if_app_active = _0x11dee1
    _0xb8d2be.data = _0x1b047a
    exports["rd-ui"].SendUIMessage(_0xb8d2be)
}

var _0x447a4e = {
    addPeekEntryByModel: modelEvents,
    addPeekEntryByTarget: targetEvents,
    addPeekEntryByFlag: flagEvents,
    taskBar: taskEvent,
    phoneConfirmation: confirmationEvent,
    phoneNotification: notificationEvent,
}
const Interface = _0x447a4e

var STX = {
    Events: Events,
    Procedures: Procedures,
    Zones: Zones,
    Streaming: Streaming,
    Utils: Utils,
    Interface: Interface,
    Hud: Hud,
}

setImmediate(() => {
    exports("GetLibrary", () => {
        if (
            GetInvokingResource() !== GetCurrentResourceName()
        ) {
            return
        }
    
        return STX
    })
})