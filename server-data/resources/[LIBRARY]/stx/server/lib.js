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

    var getCachedValue = {
        get: function (...pAction) {
          return _0x38fbb8.get("_", ...pAction)
        },

        reset: function () {
          _0x38fbb8.reset("_")
        },
    }
    return getCachedValue
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

    var getCachedValue = {
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

    return getCachedValue
}

function stringEvent(_0x547289) {
    return _0x1313dd(_0x547289, _0x1313dd.URL)
}

function conditionEvent(_0x2e0ba4, _0x177667) {
    return new Promise((_0x5182eb, _0x459d00) => {
        const pDate = Date.now(),

          _0xe3fd16 = setTick(() => {
            const timedOut = Date.now() - pDate > _0x177667

            if (_0x2e0ba4() || timedOut) {
              return clearTick(_0xe3fd16), _0x5182eb(timedOut)
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

var STX = {
    Events: Events,
    Procedures: Procedures,
    Utils: Utils,
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
