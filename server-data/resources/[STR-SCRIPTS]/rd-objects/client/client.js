;(function () {
    'use strict'
    var _0x46657b = {
        678: function (_0x2783f9, _0x4f4e18) {
          Object.defineProperty(_0x4f4e18, '__esModule', { value: true })
          _0x4f4e18.Hud =
            _0x4f4e18.Interface =
            _0x4f4e18.Utils =
            _0x4f4e18.Streaming =
            _0x4f4e18.Zones =
            _0x4f4e18.Procedures =
            _0x4f4e18.Events =
              void 0
          _0x4f4e18.Events = {
            on: (_0x4f239c, _0x188b24) => {
              return STX.Events.on(_0x4f239c, _0x188b24)
            },
            onNet: (_0x1f2082, _0x561486) => {
              return STX.Events.onNet(_0x1f2082, _0x561486)
            },
            emit: (_0x3c6294, ..._0x4b36be) => {
              return STX.Events.emit(_0x3c6294, ..._0x4b36be)
            },
            emitNet: (_0x2a2b31, ..._0x222c54) => {
              return STX.Events.emitNet(_0x2a2b31, ..._0x222c54)
            },
            remove: (_0x50be3a, _0x52b798) => {
              return STX.Events.remove(_0x50be3a, _0x52b798)
            },
          }
          _0x4f4e18.Procedures = {
            register: (_0x5ded20, _0x28b3a3) => {
              return STX.Procedures.register(_0x5ded20, _0x28b3a3)
            },
            execute: (_0x41a21f, ..._0x2e3772) => {
              return (
                console.log('execute', _0x41a21f, _0x2e3772),
                STX.Procedures.execute(_0x41a21f, ..._0x2e3772)
              )
            },
          }
          _0x4f4e18.Zones = {
            isActive: (_0x4a4a63, _0x34bec2) => {
              return STX.Zones.isActive(_0x4a4a63, _0x34bec2)
            },
            onEnter: (_0x494fad, _0x323903) => {
              return STX.Zones.onEnter(_0x494fad, _0x323903)
            },
            onExit: (_0x541aec, _0x2ec5e1) => {
              return STX.Zones.onExit(_0x541aec, _0x2ec5e1)
            },
            addBoxZone: (
              _0xd67b49,
              _0x5dc9a6,
              _0x3bbcbc,
              _0x263cde,
              _0x121ac8,
              _0x3d6ce7,
              _0x1eae1d = {}
            ) => {
              return STX.Zones.addBoxZone(
                _0xd67b49,
                _0x5dc9a6,
                _0x3bbcbc,
                _0x263cde,
                _0x121ac8,
                _0x3d6ce7,
                _0x1eae1d
              )
            },
            addBoxTarget: (
              _0x3cbdd1,
              _0x323eaf,
              _0x575aee,
              _0xd03814,
              _0xb6ba1e,
              _0x1a8e31,
              _0x18a195 = {}
            ) => {
              return STX.Zones.addBoxTarget(
                _0x3cbdd1,
                _0x323eaf,
                _0x575aee,
                _0xd03814,
                _0xb6ba1e,
                _0x1a8e31,
                _0x18a195
              )
            },
          }
          _0x4f4e18.Streaming = {
            loadModel: (_0x175d5f) => {
              return STX.Streaming.loadModel(_0x175d5f)
            },
            loadTexture: (_0x558b6d) => {
              return STX.Streaming.loadTexture(_0x558b6d)
            },
            loadAnim: (_0x4b3aed) => {
              return STX.Streaming.loadAnim(_0x4b3aed)
            },
            loadClipSet: (_0x3ab1c5) => {
              return STX.Streaming.loadClipSet(_0x3ab1c5)
            },
            loadWeaponAsset: (_0x4cf4c9, _0x279398, _0x59e8c0) => {
              return STX.Streaming.loadWeaponAsset(_0x4cf4c9)
            },
            loadNamedPtfxAsset: (_0x43533b) => {
              return STX.Streaming.loadNamedPtfxAsset(_0x43533b)
            },
          }
          _0x4f4e18.Utils = {
            cache: (_0x3897c1, _0x4da209) => {
              return STX.Utils.cache(_0x3897c1, _0x4da209)
            },
            cacheableMap: (_0x230c78, _0x18cc83) => {
              return STX.Utils.cacheableMap(_0x230c78, _0x18cc83)
            },
            waitForCondition: (_0x315e22, _0x28f3fe) => {
              return STX.Utils.waitForCondition(_0x315e22, _0x28f3fe)
            },
            getMapRange: (_0xff253a, _0x3979bc, _0x4c0284) => {
              return STX.Utils.getMapRange(_0xff253a, _0x3979bc, _0x4c0284)
            },
            getDistance: (
              [_0x1e608f, _0x162771, _0x497e1a],
              [_0x540f5e, _0x3cd531, _0x17b643]
            ) => {
              return STX.Utils.getDistance(
                [_0x1e608f, _0x162771, _0x497e1a],
                [_0x540f5e, _0x3cd531, _0x17b643]
              )
            },
            getRandomNumber: (_0x55841f, _0x44bb75) => {
              return STX.Utils.getRandomNumber(_0x55841f, _0x44bb75)
            },
          }
          _0x4f4e18.Interface = {
            addPeekEntryByModel: (_0x78e684, _0xc8ee38, _0x237162) => {
              return STX.Interface.addPeekEntryByModel(
                _0x78e684,
                _0xc8ee38,
                _0x237162
              )
            },
            addPeekEntryByTarget: (_0x2eea22, _0x5e960d, _0x4ea8a0) => {
              return STX.Interface.addPeekEntryByTarget(
                _0x2eea22,
                _0x5e960d,
                _0x4ea8a0
              )
            },
            addPeekEntryByFlag: (_0x28c072, _0x52b60d, _0x2274c2) => {
              return STX.Interface.addPeekEntryByFlag(
                _0x28c072,
                _0x52b60d,
                _0x2274c2
              )
            },
            taskbar: (
              _0x25f34b,
              _0x44fcc6,
              _0x5a8f98 = false,
              _0x3c3787 = null
            ) => {
              return STX.Interface.taskbar(
                _0x25f34b,
                _0x44fcc6,
                _0x5a8f98,
                _0x3c3787
              )
            },
            phoneConfirmation: (_0x318877, _0x108705, _0x43fe2c) => {
              return STX.Interface.phoneConfirmation(
                _0x318877,
                _0x108705,
                _0x43fe2c
              )
            },
            phoneNotification: (
              _0x2ba57c,
              _0x4f62da,
              _0x2d2fa2,
              _0x3976df = true
            ) => {
              return STX.Interface.phoneNotification(
                _0x2ba57c,
                _0x4f62da,
                _0x2d2fa2,
                _0x3976df
              )
            },
          }
          _0x4f4e18.Hud = {
            createBlip: (_0x4f96dd, ..._0x40abf5) => {
              return STX.Hud.createBlip(_0x4f96dd, ..._0x40abf5)
            },
            applyBlipSettings: (
              _0x2cf4c7,
              _0x3f71e5,
              _0x68e810,
              _0x5b3cc5,
              _0x1128e1,
              _0xfd6b65,
              _0x526167,
              _0x40463b
            ) => {
              return STX.Hud.applyBlipSettings(
                _0x2cf4c7,
                _0x3f71e5,
                _0x68e810,
                _0x5b3cc5,
                _0x1128e1,
                _0xfd6b65,
                _0x526167,
                _0x40463b
              )
            },
          }
        },
        615: function (_0x293865, _0xd0e178) {
          Object.defineProperty(_0xd0e178, '__esModule', { value: true })
          _0xd0e178.mathClass = _0xd0e178.loadAnimDict = _0xd0e178.Delay = void 0
          let _0x1d5a62 = (_0x31cc1f) =>
            new Promise((_0x292590) => setTimeout(_0x292590, _0x31cc1f))
          _0xd0e178.Delay = _0x1d5a62
          async function _0x3cf421(_0x10a763) {
            while (!HasAnimDictLoaded(_0x10a763)) {
              RequestAnimDict(_0x10a763)
              await (0, _0xd0e178.Delay)(5)
            }
          }
          _0xd0e178.loadAnimDict = _0x3cf421
          class _0x2651c0 {
            constructor(_0x2b87b9 = 0, _0x27f5f9 = 0, _0x5a3376 = 0) {
              this.x = _0x2b87b9
              this.y = _0x27f5f9
              this.z = _0x5a3376
            }
            ['setFromArray'](_0x23b335) {
              return (
                (this.x = _0x23b335[0]),
                (this.y = _0x23b335[1]),
                (this.z = _0x23b335[2]),
                this
              )
            }
            ['getArray']() {
              return [this.x, this.y, this.z]
            }
            ['add'](_0x5f40ff) {
              return (
                (this.x += _0x5f40ff.x),
                (this.y += _0x5f40ff.y),
                (this.z += _0x5f40ff.z),
                this
              )
            }
            ['addScalar'](_0x2e777e) {
              return (
                (this.x += _0x2e777e),
                (this.y += _0x2e777e),
                (this.z += _0x2e777e),
                this
              )
            }
            ['sub'](_0x4343e2) {
              return (
                (this.x -= _0x4343e2.x),
                (this.y -= _0x4343e2.y),
                (this.z -= _0x4343e2.z),
                this
              )
            }
            ['equals'](_0x36700a) {
              return (
                this.x === _0x36700a.x &&
                this.y === _0x36700a.y &&
                this.z === _0x36700a.z
              )
            }
            ['subScalar'](_0x3b9604) {
              return (
                (this.x -= _0x3b9604),
                (this.y -= _0x3b9604),
                (this.z -= _0x3b9604),
                this
              )
            }
            ['multiply'](_0x16c4ed) {
              return (
                (this.x *= _0x16c4ed.x),
                (this.y *= _0x16c4ed.y),
                (this.z *= _0x16c4ed.z),
                this
              )
            }
            ['multiplyScalar'](_0x546a9d) {
              return (
                (this.x *= _0x546a9d),
                (this.y *= _0x546a9d),
                (this.z *= _0x546a9d),
                this
              )
            }
            ['round']() {
              return (
                (this.x = Math.round(this.x)),
                (this.y = Math.round(this.y)),
                (this.z = Math.round(this.z)),
                this
              )
            }
            ['floor']() {
              return (
                (this.x = Math.floor(this.x)),
                (this.y = Math.floor(this.y)),
                (this.z = Math.floor(this.z)),
                this
              )
            }
            ['ceil']() {
              return (
                (this.x = Math.ceil(this.x)),
                (this.y = Math.ceil(this.y)),
                (this.z = Math.ceil(this.z)),
                this
              )
            }
            ['magnitude']() {
              return Math.sqrt(
                this.x * this.x + this.y * this.y + this.z * this.z
              )
            }
            ['normalize']() {
              let _0x53346c = this.magnitude
              if (isNaN(_0x53346c)) {
                _0x53346c = 0
              }
              return this.multiplyScalar(1 / _0x53346c)
            }
            ['forward']() {
              const _0x5e4c59 = _0x2651c0
                .fromObject(this)
                .multiplyScalar(Math.PI / 180)
              return new _0x2651c0(
                -Math.sin(_0x5e4c59.z) * Math.abs(Math.cos(_0x5e4c59.x)),
                Math.cos(_0x5e4c59.z) * Math.abs(Math.cos(_0x5e4c59.x)),
                Math.sin(_0x5e4c59.x)
              )
            }
            ['getDistance'](_0x354a27) {
              const [_0x319dc9, _0x327f35, _0x4db30c] = [
                this.x - _0x354a27.x,
                this.y - _0x354a27.y,
                this.z - _0x354a27.z,
              ]
              return Math.sqrt(
                _0x319dc9 * _0x319dc9 +
                  _0x327f35 * _0x327f35 +
                  _0x4db30c * _0x4db30c
              )
            }
            ['getDistanceFromArray'](_0x12865d) {
              const [_0x60b8, _0x29a21c, _0x39b7b7] = [
                this.x - _0x12865d[0],
                this.y - _0x12865d[1],
                this.z - _0x12865d[2],
              ]
              return Math.sqrt(
                _0x60b8 * _0x60b8 + _0x29a21c * _0x29a21c + _0x39b7b7 * _0x39b7b7
              )
            }
            static ['fromArray'](_0x5ad084) {
              return new _0x2651c0(_0x5ad084[0], _0x5ad084[1], _0x5ad084[2])
            }
            static ['fromObject'](_0x54700a) {
              return new _0x2651c0(_0x54700a.x, _0x54700a.y, _0x54700a.z)
            }
          }
          _0xd0e178.mathClass = _0x2651c0
        },
      },
      _0x995b3e = {}
    function _0x2df2bb(_0x23e68c) {
      var _0x320f1e = _0x995b3e[_0x23e68c]
      if (_0x320f1e !== undefined) {
        return _0x320f1e.exports
      }
      var _0x50b858 = (_0x995b3e[_0x23e68c] = { exports: {} })
      return (
        _0x46657b[_0x23e68c](_0x50b858, _0x50b858.exports, _0x2df2bb),
        _0x50b858.exports
      )
    }
    !(function () {
      _0x2df2bb.g = (function () {
        if (typeof globalThis === 'object') {
          return globalThis
        }
        try {
          return this || new Function('return this')()
        } catch (_0x1fbfb4) {
          if (typeof window === 'object') {
            return window
          }
        }
      })()
    })()
    var _0x38b2af = {}
    !(function () {
      var _0x43e553 = {},
        _0x26ceba
      _0x26ceba = { value: true }
      _0x26ceba = void 0
      const _0x3ea73a = _0x2df2bb(678),
        _0x1bac61 = _0x2df2bb(615)
      let _0x36aece = [],
        _0x13afd6 = []
      setImmediate(async () => {
        await (0, _0x1bac61.Delay)(5000)
        Number(_0x36aece.length) === 0 && emitNet('rd-objects:requestObjects')
      })
      onNet('rd-objects:loadObjects', async (_0xe9ddb4) => {
        console.log('[rd-objects] Load Objects')
        let _0x4ab09a = _0xe9ddb4
        Object.entries(_0x4ab09a).forEach(([_0x12c7d5, _0x331d4d]) => {
          _0x491670(_0x331d4d)
        })
      })
      onNet('arp:objects:prepareNewObject', async (_0x29ed64) => {
        _0x491670(_0x29ed64)
      })
      on('rd-polyzone:enter', async (_0x46614c, _0x2b0f68) => {
        if (_0x46614c !== 'object_zone') {
          return
        }
        let _0x255255 = _0x36aece.findIndex(
          (_0x1a7dca) => _0x1a7dca.id.toString() === _0x2b0f68.id.toString()
        )
        if (!_0x36aece[_0x255255]) {
          return
        }
        if (_0x36aece[_0x255255].obj) {
          return
        }
        console.log('[rd-objects] Entered zone, load objects in distance.')
        let _0x59c70d = _0x36aece[_0x255255].coordinates
        _0x36aece[_0x255255].obj = await _0x57b449(
          _0x36aece[_0x255255].model,
          _0x59c70d.x,
          _0x59c70d.y,
          _0x59c70d.z,
          _0x59c70d.h
        )
        let _0x434fd7 = _0x13afd6.findIndex(
          (_0x26c558) => _0x26c558.id.toString() === _0x2b0f68.id.toString()
        )
        _0x13afd6[_0x434fd7] = {
          x: _0x59c70d.x,
          y: _0x59c70d.y,
          z: _0x59c70d.z,
        }
      })
      on('rd-polyzone:exit', (_0x329570, _0x2b3c55) => {
        if (_0x329570 !== 'object_zone') {
          return
        }
        let _0xeb43df = _0x36aece.findIndex(
          (_0x4d3e26) => _0x4d3e26.id.toString() === _0x2b3c55.id.toString()
        )
        if (!_0x36aece[_0xeb43df]) {
          return
        }
        if (!_0x36aece[_0xeb43df].obj) {
          return
        }
        console.log('[rd-objects] Left zone, unload objects in distance.')
        DeleteObject(_0x36aece[_0xeb43df].obj)
        _0x36aece[_0xeb43df].obj = 0
        let _0xc01015 = _0x13afd6.filter(
          (_0x4926c1) => Number(_0x4926c1.id) !== Number(_0x2b3c55.id)
        )
        _0x13afd6 = _0xc01015
      })
      onNet('rd-objects:clearObjects', (_0x469f66) => {
        Object.entries(_0x469f66).forEach(([_0x4b6899, _0x5614bf]) => {
          let _0x5fa75b = _0x13afd6.findIndex(
            (_0x104dbc) => _0x104dbc.id.toString() === _0x5614bf.toString()
          )
          if (_0x13afd6[_0x5fa75b]) {
            let _0xee06d8 = _0x13afd6.filter(
              (_0x23c4ed) => Number(_0x23c4ed.id) !== Number(_0x5614bf)
            )
            _0x13afd6 = _0xee06d8
          }
          let _0x22f962 = _0x36aece.findIndex(
            (_0x216a26) => _0x216a26.id.toString() === _0x5614bf.toString()
          )
          if (_0x36aece[_0x22f962]) {
            _0x36aece[_0x22f962].obj &&
              DeleteObject(Number(_0x36aece[_0x22f962].obj))
            let _0x179acd = _0x36aece.filter(
              (_0x4894ff) => Number(_0x4894ff.id) !== Number(_0x5614bf)
            )
            _0x36aece = _0x179acd
          }
        })
      })
      onNet('rd-objects:updateObjects', (_0xacd038) => {
        Object.entries(_0xacd038).forEach(([_0x24dcf9, _0x5e989a]) => {
          let _0x1bdcfe = _0x13afd6.findIndex(
            (_0x18ec50) => _0x18ec50.id.toString() === _0x5e989a.toString()
          )
          if (_0x13afd6[_0x1bdcfe]) {
            let _0x13f749 = _0x13afd6.filter(
              (_0xf0a494) => Number(_0xf0a494.id) !== Number(_0x5e989a)
            )
            _0x13afd6 = _0x13f749
          }
          let _0x114174 = _0x36aece.findIndex(
            (_0x168973) => _0x168973.id.toString() === _0x5e989a.toString()
          )
          if (_0x36aece[_0x114174]) {
            _0x36aece[_0x114174].obj && DeleteObject(_0x36aece[_0x114174].obj)
            let _0x260f1b = _0x36aece.filter(
              (_0x409534) => Number(_0x409534.id) !== Number(_0x5e989a)
            )
            _0x36aece = _0x260f1b
          }
        }),
          _0x491670(_0xacd038)
      })
      async function _0x491670(_0x2d06c6) {
        console.log('[rd-objects] Adding object: ', _0x2d06c6)
        let _0x1194f7 = {
          x: _0x2d06c6.coordinates.x,
          y: _0x2d06c6.coordinates.y,
          z: _0x2d06c6.coordinates.z,
        }
        PolyZone.addCircleZone(
          'object_zone',
          {
            x: _0x2d06c6.coordinates.x,
            y: _0x2d06c6.coordinates.y,
            z: _0x2d06c6.coordinates.z,
          },
          Math.max(75, 40),
          { data: { id: _0x2d06c6.id } }
        )
        let _0x37746e = undefined,
          _0x20deed = GetEntityCoords(PlayerPedId(), false),
          _0x363956 = GetDistanceBetweenCoords(
            _0x20deed[0],
            _0x20deed[1],
            _0x20deed[2],
            _0x1194f7.x,
            _0x1194f7.y,
            _0x1194f7.z,
            true
          )
        if (Number(_0x363956) < 25) {
          let _0x1dc8f3 = _0x2d06c6.coordinates.h
          if (_0x1dc8f3 === undefined) {
            _0x1dc8f3 = 0
          }
          _0x37746e = await _0x57b449(
            _0x2d06c6.model,
            _0x1194f7.x,
            _0x1194f7.y,
            _0x1194f7.z,
            _0x1dc8f3
          )
          _0x13afd6.push({
            id: _0x2d06c6.id,
            vector: _0x1194f7,
          })
        }
        _0x36aece.push({
          id: _0x2d06c6.id,
          model: _0x2d06c6.model,
          coordinates: _0x2d06c6.coordinates,
          metaData: _0x2d06c6.metaData,
          obj: _0x37746e,
        })
      }
      _0x26ceba = _0x491670
      async function _0x57b449(
        _0x23ee65,
        _0x4c62d1,
        _0x2c9216,
        _0x398b48,
        _0x7075cf
      ) {
        await _0x3ea73a.Streaming.loadModel(_0x23ee65)
        const _0x220409 = GetHashKey(_0x23ee65)
        let _0x4b237c = CreateObjectNoOffset(
          _0x220409,
          _0x4c62d1,
          _0x2c9216,
          _0x398b48,
          false,
          false,
          false
        )
        if (!_0x7075cf) {
          _0x7075cf = 0
        }
        if (typeof _0x7075cf === 'number') {
          SetEntityHeading(_0x4b237c, _0x7075cf + 0)
        } else {
          SetEntityRotation(
            _0x4b237c,
            _0x7075cf.x,
            _0x7075cf.y,
            _0x7075cf.z,
            2,
            true
          )
        }
        return FreezeEntityPosition(_0x4b237c, true), _0x4b237c
      }
      on('onResourceStop', (_0xac4bba) => {
        if (_0xac4bba !== 'rd-objects') {
          return
        }
        Object.entries(_0x36aece).forEach(([_0x4c9cbc, _0x58d4bf]) => {
          if (_0x58d4bf.obj) {
            DeleteObject(Number(_0x58d4bf.obj))
          }
        })
      })
      function _0x14414e(_0x1f9d74) {
        let _0x2a3055 = false
        return (
          Object.entries(_0x36aece).forEach(([_0x107522, _0xf23082]) => {
            if (Number(_0xf23082.obj) === Number(_0x1f9d74)) {
              let _0x1cf6a6 = _0x36aece.findIndex(
                (_0x294514) => Number(_0x294514.id) === Number(_0xf23082.id)
              )
              _0x36aece[_0x1cf6a6] && (_0x2a3055 = _0x36aece[_0x1cf6a6])
            }
          }),
          _0x2a3055
        )
      }
      _0x2df2bb.g.exports('GetObjectByEntity', _0x14414e)
      function _0x21c8af(_0x144364) {
        let _0x26f222 = false,
          _0x41f227 = _0x36aece.findIndex(
            (_0x249bdb) => _0x249bdb.id.toString() === _0x144364.toString()
          )
        return (
          _0x36aece[_0x41f227] && (_0x26f222 = _0x36aece[_0x41f227]), _0x26f222
        )
      }
      _0x2df2bb.g.exports('GetObject', _0x21c8af)
      function _0x3712a8(_0x4b77ba) {
        let _0x5f588f = RPC.execute('rd-objects:DeleteObject', _0x4b77ba)
        return _0x5f588f
      }
      _0x2df2bb.g.exports('DeleteObject', _0x3712a8)
      function _0x3fc7e3(_0x45e806, _0x4befc3) {
        RPC.execute('rd-objects:UpdateObject', _0x45e806, _0x4befc3)
      }
      _0x2df2bb.g.exports('UpdateObject', _0x3fc7e3)
      RegisterCommand(
        'getObject',
        (_0x37a992, _0x4114dc, _0x5d60b5) => {
          let _0x51028f = _0x4114dc[0],
            _0x51a571 = _0x14414e(_0x51028f)
          console.log('[rd-objects] getObject return: ', _0x51a571)
        },
        false
      )
      RegisterCommand(
        'objects:print',
        () => {
          console.log(_0x36aece)
        },
        false
      )
    })()
    !(function () {
      var _0x2dcc1b = _0x38b2af,
        _0x3cb0b3
      _0x3cb0b3 = { value: true }
      const _0x54d89c = _0x2df2bb(615)
      let _0x4f06bd = undefined,
        _0x2acedf = undefined,
        _0x538309 = false,
        _0x573470 = 0,
        _0x304a5c = undefined,
        _0x1e299c = undefined
      const _0x5c2611 = async (
        _0xbe56e,
        _0x4a5e9a = {},
        _0x72d15e,
        _0x46e724 = () => true,
        _0x5ea3c5 = 'objects',
        _0xba03fd
      ) => {
        const [_0x5447e5, _0x52f925] = await _0x254698(
          _0xbe56e,
          _0x72d15e,
          _0x46e724
        )
        if (!_0x5447e5) {
          return null
        }
        return await RPC.execute(
          'rd-objects:SaveObject',
          _0x5ea3c5,
          _0xbe56e,
          _0x52f925.coords,
          _0x52f925.rotation,
          _0x4a5e9a,
          _0xba03fd
        )
      }
      _0x2df2bb.g.exports('PlaceAndSaveObject', _0x5c2611)
      let _0x49ebb8 = false
      const _0x254698 = async (_0x1debe8, _0x1e1814, _0x65c686 = () => true) => {
        var _0x3deadd, _0x3e8019, _0x54e9e9, _0x1e7782
        if (_0x49ebb8) {
          return [false, null]
        }
        const _0x3c5547 =
          typeof _0x1debe8 === 'string' ? _0x1debe8.trim() : _0x1debe8
        if (!IsModelValid(_0x3c5547)) {
          return [false, null]
        }
        _0x49ebb8 = true
        await _0x14b230(_0x3c5547)
        const [_0x320bb1, _0xb5f359] = GetModelDimensions(_0x3c5547),
          _0x3853c6 = _0x54d89c.mathClass.fromArray(_0x320bb1),
          _0x265e80 = _0x54d89c.mathClass.fromArray(_0xb5f359),
          _0x1039de = _0x265e80.sub(_0x3853c6),
          _0x30bb06 = PlayerPedId()
        let _0x2ead42 =
            (_0x3deadd = _0x1e1814.groundSnap) !== null && _0x3deadd !== void 0
              ? _0x3deadd
              : _0x1e1814.forceGroundSnap,
          _0x9db7cb = GetEntityHeading(_0x30bb06),
          _0x46bb15 = _0x1e1814.useModelOffset,
          _0x16f365 = true,
          _0x137066 = true,
          _0x544df1 = true,
          _0xe78988 =
            (_0x3e8019 = _0x1e1814.zOffset) !== null && _0x3e8019 !== void 0
              ? _0x3e8019
              : 0,
          _0x5e482a = false
        const _0x184686 =
            (_0x54e9e9 = _0x1e1814.alignToSurface) !== null &&
            _0x54e9e9 !== void 0
              ? _0x54e9e9
              : false,
          _0x10b75f =
            (_0x1e7782 = _0x1e1814.surfaceOffset) !== null && _0x1e7782 !== void 0
              ? _0x1e7782
              : 0,
          _0x3485b5 = CreateObjectNoOffset(
            _0x3c5547,
            0,
            0,
            0,
            false,
            false,
            false
          )
        SetEntityAlpha(_0x3485b5, 200, false)
        SetEntityCollision(_0x3485b5, false, false)
        SetCanClimbOnEntity(_0x3485b5, false)
        SetEntityDrawOutlineColor(255, 0, 0, 128)
        const _0x3366e4 = setTick(() => {
            var _0x2b0b7e
            const [
              _0x3810f3,
              _0x588679,
              _0x2c7d82,
              _0xd5cab8,
              _0x2cd1d1,
              _0x32b274,
            ] = _0x39cbec(
              19,
              _0x3485b5,
              (_0x2b0b7e = _0x1e1814.distance) !== null && _0x2b0b7e !== void 0
                ? _0x2b0b7e
                : 10
            )
            if (_0x588679) {
              const _0x2ecb12 = _0x54d89c.mathClass.fromArray(_0x2c7d82)
              !_0x2ead42 && _0x46bb15 && (_0x2ecb12.z += _0x1039de.z / 2)
              let _0x47ac2e = [0, 0, 0]
              _0x184686
                ? ((_0x9db7cb =
                    -Math.atan2(_0xd5cab8[0], _0xd5cab8[1]) * 57.2958 + 180),
                  SetEntityHeading(_0x3485b5, _0x9db7cb),
                  (_0x47ac2e = GetEntityForwardVector(_0x3485b5).map(
                    (_0xcff0c3) => _0xcff0c3 * _0x10b75f
                  )))
                : SetEntityHeading(_0x3485b5, _0x9db7cb)
              SetEntityCoords(
                _0x3485b5,
                _0x2ecb12.x - _0x47ac2e[0],
                _0x2ecb12.y - _0x47ac2e[1],
                _0x2ecb12.z - _0x47ac2e[2],
                false,
                false,
                false,
                false
              )
              _0x2ead42 && PlaceObjectOnGroundProperly_2(_0x3485b5)
              if (_0xe78988 !== 0) {
                const _0x8162c1 = _0x54d89c.mathClass.fromArray(
                  GetEntityCoords(_0x3485b5, false)
                )
                _0x2ecb12.z += _0xe78988
                SetEntityCoords(
                  _0x3485b5,
                  _0x8162c1.x,
                  _0x8162c1.y,
                  _0x8162c1.z + _0xe78988,
                  false,
                  false,
                  false,
                  false
                )
              }
              const _0x49a684 = _0x2ead42
                  ? _0x54d89c.mathClass.fromArray(
                      GetEntityCoords(_0x3485b5, true)
                    )
                  : _0x2ecb12,
                _0x16a58d = _0x1e1814.collision
                  ? !_0x25eb10(
                      _0x3485b5,
                      _0x30bb06,
                      _0x1039de,
                      _0x49a684,
                      _0x1e1814.colZOffset
                    )
                  : true
              _0x544df1 =
                _0x16a58d &&
                true &&
                _0x65c686(_0x49a684, _0x2cd1d1, _0x3485b5, _0x32b274)
              if (_0x544df1) {
                SetEntityDrawOutline(_0x3485b5, false)
              } else {
                SetEntityDrawOutline(_0x3485b5, true)
              }
            } else {
              _0x544df1 = false
            }
            _0x1e1814.afterRender &&
              _0x1e1814.afterRender(_0x3485b5, !!_0x588679, _0x544df1)
          }),
          _0x174e0d = setTick(() => {
            DisableControlAction(0, 44, true)
            DisableControlAction(0, 46, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 20, true)
            DisableControlAction(0, 16, true)
            DisableControlAction(0, 17, true)
            DisableControlAction(0, 36, true)
            const _0x113d5d = IsDisabledControlPressed(0, 36)
            if (IsDisabledControlPressed(2, 17)) {
              if (_0x5e482a) {
                _0xe78988 += _0x113d5d ? 0.1 : 0.5
              } else {
                _0x9db7cb += _0x113d5d ? 1 : 5
                if (!_0x113d5d) {
                  _0x9db7cb = Math.round(_0x9db7cb)
                }
              }
            } else {
              if (IsDisabledControlPressed(2, 16)) {
                if (_0x5e482a) {
                  _0xe78988 -= _0x113d5d ? 0.1 : 0.5
                } else {
                  _0x9db7cb -= _0x113d5d ? 1 : 5
                  if (!_0x113d5d) {
                    _0x9db7cb = Math.round(_0x9db7cb)
                  }
                }
              }
            }
            if (_0x9db7cb > 360) {
              _0x9db7cb -= 360
            } else {
              _0x9db7cb < 0 && (_0x9db7cb += 360)
            }
            _0x1e1814.groundSnap &&
              !_0x1e1814.forceGroundSnap &&
              IsDisabledControlJustPressed(0, 44) &&
              (_0x2ead42 = !_0x2ead42)
            _0x1e1814.useModelOffset &&
              IsDisabledControlJustPressed(0, 140) &&
              (_0x46bb15 = !_0x46bb15)
            if (_0x1e1814.adjustZ && IsDisabledControlJustPressed(0, 20)) {
              _0x5e482a = !_0x5e482a
              SetEntityAlpha(_0x3485b5, _0x5e482a ? 255 : 200, false)
            }
            ;(IsDisabledControlJustPressed(0, 200) ||
              IsDisabledControlJustPressed(0, 177)) &&
              (_0x16f365 = false)
            if (_0x544df1 && IsDisabledControlJustPressed(0, 46)) {
              _0x137066 = false
              _0x16f365 = false
            }
          })
        while (_0x16f365) {
          await (0, _0x54d89c.Delay)(1)
        }
        clearTick(_0x3366e4)
        clearTick(_0x174e0d)
        const _0x24265a = _0x54d89c.mathClass.fromArray(
            GetEntityCoords(_0x3485b5, true)
          ),
          _0x389bbc = _0x54d89c.mathClass.fromArray(
            GetEntityRotation(_0x3485b5, 2)
          ),
          _0x4fd77b = GetEntityQuaternion(_0x3485b5)
        _0x1b7d24(_0x3485b5)
        _0x49ebb8 = false
        if (_0x137066) {
          return [false, null]
        }
        const _0xa47eb9 = {}
        return (
          (_0xa47eb9.coords = _0x24265a),
          (_0xa47eb9.rotation = _0x389bbc),
          (_0xa47eb9.quaternion = _0x4fd77b),
          [true, _0xa47eb9]
        )
      }
      _0x2df2bb.g.exports('PlaceObject', _0x254698)
      function _0x25eb10(_0x5574d5, _0x3fb1d4, _0x38236a, _0x35feb8, _0x598e5e) {
        const _0x2e96b9 = _0x54d89c.mathClass.fromArray(
            GetEntityRotation(_0x5574d5, 2)
          ),
          _0x2dfde1 = _0x54d89c.mathClass
            .fromObject(_0x38236a)
            .multiplyScalar(0.75),
          _0x2b915a = StartShapeTestBox(
            _0x35feb8.x,
            _0x35feb8.y,
            _0x35feb8.z +
              (_0x598e5e !== null && _0x598e5e !== void 0 ? _0x598e5e : 0),
            _0x2dfde1.x,
            _0x2dfde1.y,
            _0x2dfde1.z,
            _0x2e96b9.x,
            _0x2e96b9.y,
            _0x2e96b9.z,
            2,
            83,
            _0x3fb1d4,
            4
          ),
          [_0x2a362f, _0x705c34] = GetShapeTestResultIncludingMaterial(_0x2b915a)
        return _0x705c34
      }
      const _0x39cbec = (_0x36924d, _0x2fd1b4, _0x5a38ab = 5) => {
          const _0xb7f809 = GetGameplayCamCoord(),
            [_0xa67fc1, , _0x291295] = GetGameplayCamRot(0).map(
              (_0x57f2d5) => (Math.PI / 180) * _0x57f2d5
            ),
            _0x1fea0d = Math.abs(Math.cos(_0xa67fc1)),
            _0x5909ba = [
              -Math.sin(_0x291295) * _0x1fea0d,
              Math.cos(_0x291295) * _0x1fea0d,
              Math.sin(_0xa67fc1),
            ],
            _0x1b61b8 = _0x5909ba.map(
              (_0x37f1b5, _0x240f83) => _0xb7f809[_0x240f83] + _0x37f1b5
            ),
            _0x301e4a = _0x54d89c.mathClass
              .fromArray(GetEntityCoords(PlayerPedId(), false))
              .getDistanceFromArray(GetGameplayCamCoord()),
            _0x4f1617 = _0x5909ba.map(
              (_0x3d2695, _0x39094c) =>
                _0xb7f809[_0x39094c] + _0x3d2695 * (_0x5a38ab + _0x301e4a)
            ),
            _0xb721b8 = StartShapeTestSweptSphere(
              _0x1b61b8[0],
              _0x1b61b8[1],
              _0x1b61b8[2],
              _0x4f1617[0],
              _0x4f1617[1],
              _0x4f1617[2],
              0.2,
              _0x36924d,
              _0x2fd1b4,
              7
            )
          return GetShapeTestResultIncludingMaterial(_0xb721b8)
        },
        _0x1b7d24 = (_0x10b6dd) => {
          DoesEntityExist(_0x10b6dd) && DeleteObject(_0x10b6dd)
        }
      async function _0x14b230(_0x18fdec) {
        if (IsModelValid(_0x18fdec)) {
          RequestModel(_0x18fdec)
          let _0x40b0a2 = false
          setTimeout(() => (_0x40b0a2 = true), 3000)
          while (!HasModelLoaded(_0x18fdec) && !_0x40b0a2) {
            await (0, _0x54d89c.Delay)(10)
          }
          return !_0x40b0a2
        }
        return false
      }
      function _0x46659e(_0x3e1435, _0x192a18) {
        if (_0x304a5c === undefined) {
          return _0x5fb2b7()
        }
        let _0x22d8c1 = {
            x: _0x3e1435[0],
            y: _0x3e1435[1],
            z: _0x3e1435[2],
          },
          _0x5a2393 = GetEntityCoords(PlayerPedId(), false),
          _0x2ed623 = GetDistanceBetweenCoords(
            _0x5a2393[0],
            _0x5a2393[1],
            _0x5a2393[2],
            _0x22d8c1.x,
            _0x22d8c1.y,
            _0x22d8c1.z,
            true
          )
        if (Number(_0x2ed623) > 50) {
          emit('DoLongHudText', 'You cannot place the object this far away', 2)
          return
        }
        _0x538309 = true
        _0x4cef94(_0x22d8c1)
      }
      function _0x4cef94(_0x381b0f) {
        emitNet(
          'rd-objects:prepareObject',
          _0x4f06bd,
          _0x381b0f.x,
          _0x381b0f.y,
          _0x381b0f.z,
          _0x573470,
          _0x2acedf
        )
        _0x5fb2b7()
      }
      function _0x5fb2b7() {
        _0x573470 = 0
        _0x4f06bd = undefined
        _0x304a5c = undefined
        _0x538309 = false
      }
      function _0x4ad98d(_0x79df0, _0x3028f9) {
        let _0x312855 = GetGameplayCamCoord(),
          _0x44c736 = GetGameplayCamRot(0),
          _0x44e02e = (Math.PI / 180) * _0x44c736[0],
          _0x391522 = (Math.PI / 180) * _0x44c736[2],
          _0xb47ce0 = Math.abs(Math.cos(_0x44e02e)),
          _0x1c09af = -Math.sin(_0x391522) * _0xb47ce0,
          _0x488b3d = Math.cos(_0x391522) * _0xb47ce0,
          _0x831fd3 = Math.sin(_0x44e02e),
          _0x3bba15 = {
            x: _0x1c09af,
            y: _0x488b3d,
            z: _0x831fd3,
          },
          _0x5c938d = StartShapeTestSweptSphere(
            _0x312855[0] + _0x3bba15.x,
            _0x312855[1] + _0x3bba15.y,
            _0x312855[2] + _0x3bba15.z,
            _0x312855[0] + _0x3bba15.x * 200,
            _0x312855[1] + _0x3bba15.y * 200,
            _0x312855[2] + _0x3bba15.z * 200,
            0.2,
            _0x79df0,
            _0x3028f9,
            7
          )
        return GetShapeTestResult(_0x5c938d)
      }
      function _0x264aed() {
        const [_0x141562, _0x5dbe5f, _0x4e1d48, _0x1112a4, _0x4c46e3] = _0x4ad98d(
          1,
          0
        )
        Number(_0x5dbe5f) === 1 && (_0x304a5c = _0x4e1d48)
      }
      on('onResourceStop', (_0x4c6c42) => {
        if (_0x4c6c42 !== 'rd-objects') {
          return
        }
        false && DeleteObject(0)
      })
    })()
  })()
  