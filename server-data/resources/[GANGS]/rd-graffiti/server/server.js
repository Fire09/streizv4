STR.register('rd-graffiti:spray', async (sprayModel, sprayCoordsx, sprayCoordsy, sprayCoordsz, sprayRotationx, sprayRotationy, sprayRotationz, rndId) => {
    // console.log(rndId)
    exports.oxmysql.execute(`INSERT INTO __objects SET 
    model='${sprayModel}',
    randomId = ${rndId},
    metaData = '{}',
    coordinates ='{"x":${sprayCoordsx},"y":${sprayCoordsy},"z":${sprayCoordsz},"h":{"x":${sprayRotationx},"y":${sprayRotationy},"z":${sprayRotationz}}}'`
    );
})