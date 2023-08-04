!(function () {
    'use strict'
    onNet('rd-objects:requestObjects', async () => {
      let _0x3f784e = source,
        _0x5793b5 = await SQL.execute('SELECT * FROM __objects', {}),
        _0x2e66af = []
      for (let _0x423993 = 0; _0x423993 < _0x5793b5.length; _0x423993++) {
        let _0x245ce4 = JSON.parse(_0x5793b5[Number(_0x423993)].coordinates),
          _0x3164bd = {
            x: _0x245ce4.x,
            y: _0x245ce4.y,
            z: _0x245ce4.z,
            h: _0x245ce4.h,
          }
        _0x2e66af.push({
          id: _0x5793b5[Number(_0x423993)].id,
          model: _0x5793b5[Number(_0x423993)].model,
          coordinates: _0x3164bd,
          metaData: JSON.parse(_0x5793b5[Number(_0x423993)].metaData),
        })
      }
      emitNet('rd-objects:loadObjects', _0x3f784e, _0x2e66af)
    })
    onNet(
      'rd-objects:prepareObject',
      async (
        _0x5a1c03,
        _0xec222f,
        _0x4e2296,
        _0xbc1a44,
        _0x3c3d9a,
        _0x567a76
      ) => {
        let _0x40235e = {
            x: _0xec222f,
            y: _0x4e2296,
            z: _0xbc1a44,
            h: _0x3c3d9a,
          },
          _0x17e7da =
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString()
        if (
          !(await SQL.execute(
            'INSERT INTO __objects (model, coordinates, metaData, randomId) VALUES (@model, @coordinates, @metaData, @randomId)',
            {
              model: _0x5a1c03,
              coordinates: JSON.stringify(_0x40235e),
              metaData: JSON.stringify(_0x567a76),
              randomId: _0x17e7da,
            }
          ))
        ) {
          return
        }
        let _0x5a6cdc = await SQL.execute(
          'SELECT * FROM __objects WHERE randomId = @randomId',
          { randomId: _0x17e7da }
        )
        if (!_0x5a6cdc[0]) {
          return
        }
        let _0x5aa71c = {
          id: _0x5a6cdc[0].id,
          model: _0x5a1c03,
          coordinates: _0x40235e,
          metaData: _0x567a76,
        }
        emitNet('arp:objects:prepareNewObject', -1, _0x5aa71c)
      }
    )
    RPC.register(
      'rd-objects:SaveObject',
      async (
        _0x635b18,
        _0x268562,
        _0x263027,
        _0xb95bd7,
        _0x5912b0,
        _0x44daa9
      ) => {
        let _0x235619 = {
            x: _0xb95bd7.x,
            y: _0xb95bd7.y,
            z: _0xb95bd7.z,
            h: _0x5912b0,
          },
          _0x40e0d2 =
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString() +
            Math.floor(10 * Math.random()).toString()
        if (
          !(await SQL.execute(
            'INSERT INTO __objects (model, coordinates, metaData, randomId) VALUES (@model, @coordinates, @metaData, @randomId)',
            {
              model: _0x263027,
              coordinates: JSON.stringify(_0x235619),
              metaData: JSON.stringify(_0x44daa9),
              randomId: _0x40e0d2,
            }
          ))
        ) {
          return false
        }
        let _0x20083f = await SQL.execute(
          'SELECT * FROM __objects WHERE randomId = @randomId',
          { randomId: _0x40e0d2 }
        )
        if (!_0x20083f[0]) {
          return false
        }
        let _0x588249 = {
          id: _0x20083f[0].id,
          model: _0x263027,
          coordinates: _0x235619,
          metaData: _0x44daa9,
        }
        return emitNet('arp:objects:prepareNewObject', -1, _0x588249), true
      }
    )
    RPC.register('rd-objects:DeleteObject', async (_0x1d3045, _0x2078ee) => {
      let _0x5581c6 = await SQL.execute(
        'SELECT * FROM __objects WHERE id = @id',
        { id: _0x2078ee }
      )
      if (!_0x5581c6[0]) {
        return false
      }
      let _0x1edca6 = {
        id: _0x5581c6[0].id,
        model: _0x5581c6[0].model,
        coordinates: JSON.parse(_0x5581c6[0].coordinates),
        metaData: JSON.parse(_0x5581c6[0].metaData),
        randomId: _0x5581c6[0].randomId,
      }
      return (
        !!(await SQL.execute('DELETE FROM __objects WHERE id = @id', {
          id: _0x2078ee,
        })) && (emitNet('rd-objects:clearObjects', -1, _0x1edca6), true)
      )
    })
    RPC.register(
      'rd-objects:UpdateObject',
      async (_0x2f99f7, _0x49819b, _0x25e634) => {
        if (
          !(await SQL.execute(
            'UPDATE __objects SET model = @model WHERE id = @id',
            {
              model: _0x25e634,
              id: _0x49819b,
            }
          ))
        ) {
          return false
        }
        let _0x366af8 = await SQL.execute(
          'SELECT * FROM __objects WHERE id = @id',
          { id: _0x49819b }
        )
        if (!_0x366af8[0]) {
          return false
        }
        let _0x201f32 = {
          id: _0x366af8[0].id,
          model: _0x366af8[0].model,
          coordinates: JSON.parse(_0x366af8[0].coordinates),
          metaData: JSON.parse(_0x366af8[0].metaData),
          randomId: _0x366af8[0].randomId,
        }
        return emitNet('rd-objects:updateObjects', -1, _0x201f32), true
      }
    )
  })()
  