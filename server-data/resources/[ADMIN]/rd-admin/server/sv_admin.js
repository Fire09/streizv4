let playerList = {};
playerList["Disconnected"] = [];

STR.register("rd:admin:isAdmin", async() => {
    const src = source
    const userRank = exports["rd-lib"].getUserRank(src)
    if (typeof userRank !== "string") {
        return false
    }

    const defaultPower = exports["rd-admin"].getRank("user");
    const userPower = exports["rd-admin"].getRank(userRank);

    if (userPower > defaultPower) {
        return true
    }

    return false
});

STR.register("rd:admin:getCommandUI", async() => {
    const src = source
    return exports["rd-admin"].getCommandUI(src)
});

STR.register("rd:admin:getVehicleInfo", async(pVin) => {
    let data = SQL.execute("SELECT * FROM characters_cars WHERE vin = ?", pVin)
    if (data.vin) {
        return data
    } else {
        return
    }
});

STR.register("rd:admin:runCommandFromClient", function(pAction, pData) {
    const src = source
    exports["rd-admin"].runCommandFromClient(src, pAction, pData);
    return true
});

STR.register("rd-admin:getValidLicenses", async() => {
    return exports["rd-admin"].getValidLicenses()
});

STR.register("rd:admin:getPlayerList", async() => {
    playerList["CurrentPlayers"] = exports["rd-admin"].getCurrentPlayers();

    playerList["Banned"] = [
        {
            from: "01/01/2022",
            until: "12/12/2023",
            admin: "Admin Name",
            name: "Player Name",
            SteamID: "Player Steam ID",
            Reason: "Example Reason",
        }
    ];

    return playerList
});

STR.register("rd:admin:getDefinedNames", async(pDefinedNames) => {
    return exports["rd-admin"].getDefinedNames(pDefinedNames)
});

STR.register("rd:admin:getPlayerLogs", async(pData) => {
    return exports["rd-log"].getPlayerLogs(pData)
});

STR.register("rd:admin:triggerLogFromClient", async(pLog, pResponseData) => {
    
});

STR.register("rd:admin:getUserData", async() => {
    let pPlayerId = source
    if (pPlayerId > 0) {
        let user = exports["rd-lib"].getCharacter(pPlayerId)
        let steamId = exports["rd-lib"].getUserVar(pPlayerId)

        let data = {
            name:  user.first_name + " " + user.last_name,
            steamid: user.owner,
            cid: user.id,
            cash: user.cash,
        }
        return data
    }  
    return false
});

onNet("playerDropped", async () => {
    let src = source
    const user = exports["rd-lib"].getCharacter(src)
    let cid = user.id

    playerList["Disconnected"].push({
        name: GetPlayerName(src),
        serverID: src,
        SteamID: user.owner, 
        charID: cid,
        charName: user.first_name + " " + user.last_name || "No Character Name",
        queueType: "Regular",
    })
});

vehicleList = [
    {
    model: 'gt86',

        model2: 'npgem',

        model3: 'npolchar',

        model4: 'npolexp',


        model5: 'npolblazer',


        model6: 'npolvic',


        model7: 'npolmm',

        model8: 'npolvette',

        model9: 'npolchal',

        model10: 'npolstang',

        model11: 'npolcoach',

        model12: 'bcat',


        model13: 'polnspeedo',

        model14: 'emsnspeedo',

        model15: 'npolretinue',

        model16: 'ucwashington',

        model17: 'ucbanshee',

        model18: 'ucrancher',

        model19: 'ucprimo',

        model20: 'uccoquette',

        model21: 'ucbuffalo',

        model22: 'ucballer',

        model23: 'uccomet',

        model24: 'polfegway',

        model25: 'polas350',

        model26: 'EMSV',

        model27: 'deathbike2',

        model28: 'robin',

        model29: 'peanut',

        model30: 'potty',

        model31: 'volatus2',

        model32: 'banshee2fix',

        model33: 'hydra2',

        model34: 'penumbra3',

        model35: 'tractorc',

        model36: 'newsvan',

        model37: 'BIMX',

        model38: 'draftgpr',

        model39: 'a6',

        model40: 'gtam21',

        model41: 'zx10',

        model42: 'bmwr',

        model43: '69charger',

        model44: 'ellie6str',

        model45: 'gauntlet6str',

        model46: 'demon',

        model47: 'raid',

        model48: 'hellion6str',

        model49: 'hoabrawler',

        model50: 'lpi8004',

        model51: 'R33',

        model52: 'stratumc',

        model53: 'futo3',

        model54: 'primoard',
        // // name: 'primoard'

        model55: 'victor',
        // name: 'victor'

        model56: 'lc500',
        // name: 'lc500'

        model57: 'starone',
        // name: 'starone'

        model58: 'bt62r',
        // name: 'bt62r'

        model59: 'valkyrietp',
        // name: 'valkyrietp'

        model60: 'lp700',
        // name: 'lp700'

        model61: 'lfa',
        // name: 'lfa'

        model62: 'gt17',
        // name: 'gt17'

        model63: 'r32',
        // name: 'r32'

        model64: 'm4',
        // name: 'm4'

        model65: 'r8h',
        // name: 'r8h'

        model66: 'deluxo6str',
        // name: 'deluxo6str'

        model67: 'hustler6str',
        // name: 'hustler6str'

        model68: 'schwarzer2',
        // name: 'schwarzer2'

        model69: 'sentinel6str',
        // name: 'sentinel6str'

        model70: 'sentinel6str2',
        // name: 'sentinel6str2'

        model71: 'filthynsx',
        // name: 'filthynsx'

        model72: 'bdragon',
        // name: 'bdragon'

        model73: 'e36prb',
        // name: 'e36prb'

        model74: 'm3e46',
        // name: 'm3e46'

        model75: 'rudiharley',
        // name: 'rudiharley'

        model76: 'dc5',
        // name: 'dc5'

        model77: 'na1',
        // name: 'na1'

        model78: '500gtrlam',
        // name: '500gtrlam'

        model79: 'tempesta2',
        // name: 'tempesta2'

        model80: 'rcf',
        // name: 'rcf'

        model81: 'granlb',
        // name: 'granlb'

        model82: 'c63',
        // name: 'c63'

        model83: 'cp9a',
        // name: 'cp9a'

        model84: 'evo9',
        // name: 'evo9'

        model85: 'gtr',
        // name: 'gtr'

        model86: 'r35',
        // name: 'r35'

        model87: 'fnf4r34',
        // name: 'fnf4r34'

        model88: 's15rb',
        // name: 's15rb'

        model89: 'schwarzer',
        // name: 'schwarzer'

        model90: 'ruiner6str',
        // name: 'ruiner6str'

        model91: 'a80',
        // name: 'a80'

        model92: 'tsgr20',
        // name: 'tsgr20'

        model93: 'monroec',
        // name: 'monroec'

        model94: 'por930',
        // name: 'por930'

        model95: 'nebula',
        // name: 'nebula'

        model96: '675ltsp',
        // name: '675ltsp'

        model97: '720s',
        // name: '720s'

        model98: 'chimera',
        // name: 'chimera'

        model100: 'diablous2',
        // name: 'diablous2'

        model101: 'fcr2',
        // name: 'fcr2'

        model102: 'sanctus',
        // name: 'sanctus'

        model103: 'shotaro',
        // name: 'shotaro'

        model104: 'rumpo2',
        // name: 'rumpo2'

        model105: 'gtrc',
        // name: 'gtrc'

        model106: 'kanjo',
        // name: 'kanjo'

        model107: 'akuma',
        // name: 'akuma'

        model108: 'avarus',
        // name: 'avarus'

        model109: 'bagger',
        // name: 'bagger'

        model110: 'bati',
        // name: 'bati'

        model111: 'bf400',
        // name: 'bf400'

        model112: 'carbonrs',
        // name: 'carbonrs'

        model113: 'cliffhanger',
        // name: 'cliffhanger'

        model114: 'daemon',
        // name: 'daemon'

        model115: 'daemon2',
        // name: 'daemon2'

        model116: 'defiler',
        // name: 'defiler'

        model117: 'diablous',
        // name: 'diablous'

        model118: 'dinka',
        // name: 'dinka'

        model119: 'enduro',
        // name: 'enduro'

        model120: 'esskey',
        // name: 'esskey'

        model121: 'faggio',
        // name: 'faggio'

        model122: 'faggio2',
        // name: 'faggio2'

        model123: 'faggio3',
        // name: 'faggio3'

        model124: 'fcr',
        // name: 'fcr'

        model125: 'gargoyle',
        // name: 'gargoyle'

        model126: 'hakuchou',
        // name: 'hakuchou'

        model127: 'hexer',
        // name: 'hexer'

        model128: 'innovation',
        // name: 'innovation'

        model129: 'lectro',
        // name: 'lectro'

        model130: 'manchez',
        // name: 'manchez'

        model131: 'nemesis',
        // name: 'nemesis'

        model132: 'nightblade',
        // name: 'nightblade'

        model133: 'pcj',
        // name: 'pcj'

        model134: 'ruffian',
        // name: 'ruffian'

        model135: 'sanchez',
        // name: 'sanchez'

        model136: 'sovereign',
        // name: 'sovereign'

        model137: 'thrust',
        // name: 'thrust'

        model138: 'vader',
        // name: 'vader'

        model139: 'vindicator',
        // name: 'vindicator'

        model140: 'vortex',
        // name: 'vortex'

        model141: 'wolfsbane',
        // name: 'wolfsbane'

        model142: 'zombieb',
        // name: 'zombieb'

        model143: 'chimera',
        // name: 'chimera'

        model144: 'diablous2',
        // name: 'diablous2'

        model145: 'fcr2',
        // name: 'fcr2'

        model146: 'hakuchou2',
        // name: 'hakuchou2'

        model147: 'shotaro',
        // name: 'shotaro'

        model148: 'sanctus',
        // name: 'sanctus'

        model149: 'dominator',
        // name: 'dominator'

        model150: 'dominator3',
        // name: 'dominator3'

        model151: 'gauntlet',
        // name: 'gauntlet'

        model152: 'DIVO',
        // name: 'DIVO'

        model153: 'stafford',
        // name: 'stafford'

        model154: 'blade',
        // name: 'blade'

        model155: 'dukes',
        // name: 'dukes'

        model156: 'vamos',
        // name: 'vamos'

        model157: 'ellie',
        // name: 'ellie'

        model158: 'ruiner',
        // name: 'ruiner'

        model159: 'sabregt',
        // name: 'sabregt'

        model160: 'slamvan',
        // name: 'slamvan'

        model161: 'slamvan3',
        // name: 'slamvan3'

        model162: 'tampa',
        // name: 'tampa'

        model163: 'yosemite',
        // name: 'yosemite'

        model164: 'tornado6',
        // name: 'tornado6'

        model165: 'slamvan2',
        // name: 'slamvan2'

        model166: 'buccaneer',
        // name: 'buccaneer'

        model167: 'buccaneer2',
        // name: 'buccaneer2'

        model168: 'faction',
        // name: 'faction'

        model169: 'faction2',
        // name: 'faction2'

        model170: 'impaler',
        // name: 'impaler'

        model171: 'nightshade',
        // name: 'nightshade'

        model172: 'phoenix',
        // name: 'phoenix'

        model173: 'picador',
        // name: 'picador'

        model174: 'sabregt2',
        // name: 'sabregt2'

        model175: 'ratloader2',
        // name: 'ratloader2'

        model176: 'stalion',
        // name: 'stalion'

        model177: 'tulip',
        // name: 'tulip'

        model178: 'vigero',
        // name: 'vigero'

        model179: 'virgo',
        // name: 'virgo'

        model180: 'faction3',
        // name: 'faction3'

        model181: 'chino',
        // name: 'chino'

        model182: 'chino2',
        // name: 'chino2'

        model183: 'hotknife',
        // name: 'hotknife'

        model184: 'ratloader',
        // name: 'ratloader'

        model185: 'dominator7',
        // name: 'dominator7'

        model186: 'dominator8',
        // name: 'dominator8'

        model187: 'warrener2',
        // name: 'warrener2'

        model188: 'gauntlet3',
        // name: 'gauntlet3'

        model189: 'outlaw',
        // name: 'outlaw'

        model190: 'everon',
        // name: 'everon'

        model191: 'trophytruck',
        // name: 'trophytruck'

        model192: 'trophytruck2',
        // name: 'trophytruck2'

        model193: 'yosemite3',
        // name: 'yosemite3'

        model194: 'caracara2',
        // name: 'caracara2'

        model195: 'contender',
        // name: 'contender'

        model196: 'rumpo3',
        // name: 'rumpo3'

        model197: 'streiter',
        // name: 'streiter'

        model198: 'mesa',
        // name: 'mesa'

        model199: 'mesa3',
        // name: 'mesa3'

        model200: 'comet4',
        // name: 'comet4'

        model201: 'bifta',
        // name: 'bifta'

        model202: 'blazer4',
        // name: 'blazer4'

        model203: 'brawler',
        // name: 'brawler'

        model204: 'dubsta3',
        // name: 'dubsta3'

        model205: 'freecrawler',
        // name: 'freecrawler'

        model206: 'bfinjection',
        // name: 'bfinjection'

        model207: 'kamacho',
        // name: 'kamacho'

        model208: 'rebel2',
        // name: 'rebel2'

        model209: 'rebel',
        // name: 'rebel'

        model210: 'guardian',
        // name: 'guardian'

        model211: 'bison',
        // name: 'bison'

        model212: 'rancherxl',
        // name: 'rancherxl'

        model213: 'bobcatxl',
        // name: 'bobcatxl'

        model214: 'riata',
        // name: 'riata'

        model215: 'kalahari',
        // name: 'kalahari'

        model216: 'blazer',
        // name: 'blazer'

        model217: 'blazer2',
        // name: 'blazer2'

        model218: 'dloader',
        // name: 'dloader'

        model219: 'sandking',
        // name: 'sandking'

        model220: 'sandking2',
        // name: 'sandking2'

        model221: 'gb200',
        // name: 'gb200'

        model222: 'michelli',
        // name: 'michelli'

        model223: 'omnis',
        // name: 'omnis'

        model224: 'retinue',
        // name: 'retinue'

        model225: 'tropos',
        // name: 'tropos'

        model226: 'rebla',
        // name: 'rebla'

        model227: 'novak',
        // name: 'novak'

        model228: 'baller3',
        // name: 'baller3'

        model229: 'dubsta2',
        // name: 'dubsta2'

        model230: 'dubsta',
        // name: 'dubsta'

        model231: 'gresley',
        // name: 'gresley'

        model232: 'huntley',
        // name: 'huntley'

        model233: 'rocoto',
        // name: 'rocoto'

        model234: 'serrano',
        // name: 'serrano'

        model235: 'xls',
        // name: 'xls'

        model236: 'minivan2',
        // name: 'minivan2'

        model237: 'seminole2',
        // name: 'seminole2'

        model238: 'landstalker2',
        // name: 'landstalker2'

        model239: 'baller',
        // name: 'baller'

        model240: 'baller2',
        // name: 'baller2'

        model241: 'bjxl',
        // name: 'bjxl'

        model242: 'cavalcade',
        // name: 'cavalcade'

        model243: 'cavalcade2',
        // name: 'cavalcade2'

        model244: 'fq2',
        // name: 'fq2'

        model245: 'granger',
        // name: 'granger'

        model246: 'habanero',
        // name: 'habanero'

        model247: 'landstalker',
        // name: 'landstalker'

        model248: 'patriot',
        // name: 'patriot'

        model249: 'patriot2',
        // name: 'patriot2'

        model250: 'radi',
        // name: 'radi'

        model251: 'seminole',
        // name: 'seminole'

        model252: 'asea',
        // name: 'asea'

        model253: 'asea',
        // name: 'asea'

        model254: 'asterope',
        // name: 'asterope'

        model255: 'buffalo',
        // name: 'buffalo'

        model256: 'buffalo2',
        // name: 'buffalo2'

        model257: 'cheburek',
        // name: 'cheburek'

        model258: 'cognoscenti',
        // name: 'cognoscenti'

        model259: 'cog55',
        // name: 'cog55'

        model260: 'dilettante',
        // name: 'dilettante'

        model261: 'dilettante2',
        // name: 'dilettante2'

        model262: 'dilettante3',
        // name: 'dilettante3'

        model263: 'emperor',
        // name: 'emperor'

        model264: 'emperor2',
        // name: 'emperor2'

        model265: 'exemplar',
        // name: 'exemplar'

        model266: 'fagaloa',
        // name: 'fagaloa'

        model267: 'felon',
        // name: 'felon'

        model268: 'fugitive',
        // name: 'fugitive'

        model269: 'glendale',
        // name: 'glendale'

        model270: 'glendale2',
        // name: 'glendale2'

        model271: 'ingot',
        // name: 'ingot'

        model272: 'intruder',
        // name: 'intruder'

        model273: 'jackal',
        // name: 'jackal'

        model274: 'jugular',
        // name: 'jugular'

        model275: 'komoda',
        // name: 'komoda'

        model276: 'kuruma',
        // name: 'kuruma'

        model277: 'oracle',
        // name: 'oracle'

        model278: 'oracle2',
        // name: 'oracle2'

        model279: 'premier',
        // name: 'premier'

        model280: 'primo',
        // name: 'primo'

        model281: 'primo2',
        // name: 'primo2'

        model282: 'raiden',
        // name: 'raiden'

        model283: 'regina',
        // name: 'regina'

        model284: 'schafter2',
        // name: 'schafter2'

        model285: 'schafter4',
        // name: 'schafter4'

        model286: 'schafter3',
        // name: 'schafter3'

        model287: 'stanier',
        // name: 'stanier'

        model288: 'stratum',
        // name: 'stratum'

        model289: 'stretch',
        // name: 'stretch'

        model290: 'sugoi',
        // name: 'sugoi'

        model291: 'sultan2',
        // name: 'sultan2'

        model292: 'sultan',
        // name: 'sultan'

        model293: 'superd',
        // name: 'superd'

        model294: 'surge',
        // name: 'surge'

        model295: 'Tailgater',
        // name: 'Tailgater'

        model296: 'taxi',
        // name: 'taxi'

        model297: 'vstr',
        // name: 'vstr'

        model298: 'warrener',
        // name: 'warrener'

        model299: 'washington',
        // name: 'washington'

        model300: 'windsor2',
        // name: 'windsor2'

        model301: 'coquette4',
        // name: 'coquette4'

        model302: 'penumbra3',
        // name: 'penumbra3'

        model303: 'drafter',
        // name: 'drafter'

        model304: 'ninef',
        // name: 'ninef'

        model305: 'ninef2',
        // name: 'ninef2'

        model306: 'alpha',
        // name: 'alpha'

        model307: 'banshee',
        // name: 'banshee'

        model308: 'bestiagts',
        // name: 'bestiagts'

        model309: 'carbonizzare',
        // name: 'carbonizzare'

        model310: 'cogcabrio',
        // name: 'cogcabrio'

        model311: 'comet2',
        // name: 'comet2'

        model312: 'comet5',
        // name: 'comet5'

        model313: 'coquette',
        // name: 'coquette'

        model314: 'elegy2',
        // name: 'elegy2'

        model315: 'f620',
        // name: 'f620'

        model316: 'felon2',
        // name: 'felon2'

        model317: 'feltzer2',
        // name: 'feltzer2'

        model318: 'furoregt',
        // name: 'furoregt'

        model319: 'fusilade',
        // name: 'fusilade'

        model320: 'jester',
        // name: 'jester'

        model321: 'locust',
        // name: 'locust'

        model322: 'lynx',
        // name: 'lynx'

        model323: 'pariah',
        // name: 'pariah'

        model324: 'massacro',
        // name: 'massacro'

        model325: 'paragon',
        // name: 'paragon'

        model326: 'penumbra',
        // name: 'penumbra'

        model327: 'penumbra2',
        // name: 'penumbra2'

        model328: 'rapidgt',
        // name: 'rapidgt'

        model329: 'rapidgt2',
        // name: 'rapidgt2'

        model330: 'ruston',
        // name: 'ruston'

        model331: 'schwarzer',
        // name: 'schwarzer'

        model332: 'sentinel',
        // name: 'sentinel'

        model333: 'sentinelsg4',
        // name: 'sentinelsg4'

        model334: 'sentinel2',
        // name: 'sentinel2'

        model335: 'seven70',
        // name: 'seven70'

        model336: 'specter',
        // name: 'specter'

        model337: 'specter2',
        // name: 'specter2'

        model338: 'surano',
        // name: 'surano'

        model339: 'voltic',
        // name: 'voltic'

        model340: 'windsor',
        // name: 'windsor'

        model341: 'zion',
        // name: 'zion'

        model342: 'zion2',
        // name: 'zion2'

        model343: 'z190',
        // name: 'z190'

        model344: 'casco',
        // name: 'casco'

        model345: 'clique',
        // name: 'clique'

        model346: 'comet3',
        // name: 'comet3'

        model347: 'coquette3',
        // name: 'coquette3'

        model348: 'coquette2',
        // name: 'coquette2'

        model349: 'dynasty',
        // name: 'dynasty'

        model350: 'gt500',
        // name: 'gt500'

        model351: 'hermes',
        // name: 'hermes'

        model352: 'hustler',
        // name: 'hustler'

        model353: 'mamba',
        // name: 'mamba'

        model354: 'manana',
        // name: 'manana'

        model355: 'peyote',
        // name: 'peyote'

        model356: 'peyote3',
        // name: 'peyote3'

        model357: 'pigalle',
        // name: 'pigalle'

        model358: 'rapidgt3',
        // name: 'rapidgt3'

        model359: 'btype',
        // name: 'btype'

        model360: 'savestra',
        // name: 'savestra'

        model361: 'sentinel3',
        // name: 'sentinel3'

        model362: 'stafford',
        // name: 'stafford'

        model363: 'feltzer3',
        // name: 'feltzer3'

        model364: 'swinger',
        // name: 'swinger'

        model365: 'tornado',
        // name: 'tornado'

        model366: 'tornado3',
        // name: 'tornado3'

        model367: 'tornado2',
        // name: 'tornado2'

        model368: 'tornado5',
        // name: 'tornado5'

        model369: 'virgo2',
        // name: 'virgo2'

        model370: 'virgo3',
        // name: 'virgo3'

        model371: 'viseris',
        // name: 'viseris'

        model372: 'voodoo',
        // name: 'voodoo'

        model373: 'zion3',
        // name: 'zion3'

        model374: 'rumpo',
        // name: 'rumpo'

        model375: 'youga',
        // name: 'youga'

        model376: 'moonbeam',
        // name: 'moonbeam'

        model377: 'moonbeam2',
        // name: 'moonbeam2'

        model378: 'youga3',
        // name: 'youga3'

        model379: 'minivan',
        // name: 'minivan'

        model380: 'paradise',
        // name: 'paradise'

        model381: 'pony',
        // name: 'pony'

        model382: 'pony2',
        // name: 'pony2'

        model383: 'newsvan',
        // name: 'newsvan'

        model384: 'speedo',
        // name: 'speedo'

        model385: 'camper',
        // name: 'camper'

        model386: 'burrito3',
        // name: 'burrito3'

        model387: 'gburrito',
        // name: 'gburrito'

        model388: 'gburrito2',
        // name: 'gburrito2'

        model389: 'surfer',
        // name: 'surfer'

        model390: 'surfer2',
        // name: 'surfer2'

        model391: 'journey',
        // name: 'journey'

        model392: 'youga2',
        // name: 'youga2'

        model393: 'm3e30',
        // name: 'm3e30'

        model394: 'pgt322',
        // name: 'pgt322'

        model395: 'acrold',
        // name: 'acrold'

        model396: 'acr',
        // name: 'acr'

        model397: 'VULCAN',
        // name: 'VULCAN'

        model398: 'SRT8B',
        // name: 'SRT8B'

        model399: 'm2f22',
        // name: 'm2f22'

        model400: 'honody',
        // name: 'honody'

        model401: 'veln',
        // name: 'veln'

        model402: 'kiagt',
        // name: 'kiagt'

        model403: 'aamx',
        // name: 'aamx'

        model404: 'v877',
        // name: 'v877'

        model405: 'SENTINEL3',
        // name: 'SENTINEL3'

        model406: 'mfc',
        // name: 'mfc'

        model407: 'maj350z',
        // name: 'maj350z'

        model408: 's30',
        // name: 's30'

        model409: 's14',
        // name: 's14'

        model410: 's14boss',
        // name: 's14boss'

        model411: '22b',
        // name: '22b'

        model412: 'rx811',
        // name: 'rx811'

        model413: '22m5',
        // name: '22m5'

        model414: 'ffrs',
        // name: 'ffrs'

        model415: 'a45amg',
        // name: 'a45amg'

        model416: 'cgt',
        // name: 'cgt'

        model417: '68dart',
        // name: '68dart'

        model418: 'mbc63',
        // name: 'mbc63'

        model419: 'nis180',
        // name: 'nis180'

        model420: 'gt86',
        // name: 'gt86'

        model421: 'neo',
        // name: 'neo'

        model422: 'CALICO',
        // name: 'CALICO'

        model423: 'COMET6',
        // name: 'COMET6'

        model424: 'CYPHER',
        // name: 'CYPHER'

        model425: 'DOMINATOR7',
        // name: 'DOMINATOR7'

        model426: 'DOMINATOR8',
        // name: 'DOMINATOR8'

        model427: 'EUROS',
        // name: 'EUROS'

        model428: 'FUTO2',
        // name: 'FUTO2'

        model429: 'GROWLER',
        // name: 'GROWLER'

        model430: 'JESTER4',
        // name: 'JESTER4'

        model431: 'PREVION',
        // name: 'PREVION'

        model432: 'REMUS',
        // name: 'REMUS'

        model433: 'RT3000',
        // name: 'RT3000'

        model434: 'SULTAN3',
        // name: 'SULTAN3'

        model435: 'TAILGATER2',
        // name: 'TAILGATER2'

        model436: 'VECTRE',
        // name: 'VECTRE'

        model437: 'WARRENER2',
        // name: 'WARRENER2'

        model438: 'ZR350',
        // name: 'ZR350'

        model439: 'victor',
        // name: 'victor'

        model440: '675ltsp',
        // name: '675ltsp'

        model441: 'lc500',
        // name: 'lc500'

        model442: 'starone',
        // name: 'starone'

        model443: 'bt62r',
        // name: 'bt62r'

        model444: 'lp700',
        // name: 'lp700'

        model445: 'gt17',
        // name: 'gt17'

        model446: '488misha',
        // name: '488misha'

        model447: 'ITALIRSX',
        // name: 'ITALIRSX'

        model448: 'DELUXO6STR',
        // name: 'DELUXO6STR'

        model449: 'TSGR20',
        // name: 'TSGR20'

        model450: 'GAUNTLET5',
        // name: 'GAUNTLET5'

        model451: 'DUKES3',
        // name: 'DUKES3'

        model452: 'COQUETTE4',
        // name: 'COQUETTE4'

        model453: 'Tigon',
        // name: 'Tigon'

        model454: 'RUDIHARLEY',
        // name: 'RUDIHARLEY'

        model455: 'r8v10',
        // name: 'r8v10'

        model456: 'rmodmustang',
        // name: 'rmodmustang'

        model457: 'ellie6str',
        // name: 'ellie6str'

        model458: 'gauntlet6str',
        // name: 'gauntlet6str'

        model459: 'GAUNTLET3',
        // name: 'GAUNTLET3'

        model460: 'GAUNTLET4',
        // name: 'GAUNTLET4'

        model461: 'HUSTLER6STR',
        // name: 'HUSTLER6STR'

        model462: 'ladybird6str',
        // name: 'ladybird6str'

        model463: 'SCHWARZER2',
        // name: 'SCHWARZER2'

        model464: 'sentinel6str2',
        // name: 'sentinel6str2'

        model465: 'tempesta2',
        // name: 'tempesta2'

        model466: 'zr3806str',
        // name: 'zr3806str'

        model467: 'filthynsx',
        // name: 'filthynsx'

        model468: 'elegy',
        // name: 'elegy'

        model469: 'AUDIRS6TK',
        // name: 'AUDIRS6TK'

        model470: 'BANSHEE2',
        // name: 'BANSHEE2'

        model471: 'CONTSS18',
        // name: 'CONTSS18'

        model472: 'bdragon',
        // name: 'bdragon'

        model473: 'M5E60',
        // name: 'M5E60'

        model474: 'F10M5RC',
        // name: 'F10M5RC'

        model475: 'acs8',
        // name: 'acs8'

        model476: 'E36PRBUNNY',
        // name: 'E36PRBUNNY'

        model477: 'm3e46',
        // name: 'm3e46'

        model478: 'm4',
        // name: 'm4'

        model479: 'C7',
        // name: 'C7'

        model480: 'DEMON',
        // name: 'DEMON'

        model481: 'mustang19',
        // name: 'mustang19'

        model482: 'HOTRING',
        // name: 'HOTRING'

        model483: 'CHEETAH2',
        // name: 'CHEETAH2'

        model484: 'FURIA',
        // name: 'FURIA'

        model485: 'ITALIGTO',
        // name: 'ITALIGTO'

        model486: 'TURISMO2',
        // name: 'TURISMO2'

        model487: 'DELSOLEG',
        // name: 'DELSOLEG'

        model488: 'DC5',
        // name: 'DC5'

        model489: 'NA1',
        // name: 'NA1'

        model490: '500gtrlam',
        // name: '500gtrlam'

        model491: 'LP670',
        // name: 'LP670'

        model492: 'RCF',
        // name: 'RCF'

        model493: 'granlb',
        // name: 'granlb'

        model494: 'fnfrx7',
        // name: 'fnfrx7'

        model495: '720S',
        // name: '720S'

        model496: 'GTRC',
        // name: 'GTRC'

        model497: 'cp9a',
        // name: 'cp9a'

        model498: 'S15RB',
        // name: 'S15RB'

        model499: 'INFERNUS2',
        // name: 'INFERNUS2'

        model500: 'TORERO',
        // name: 'TORERO'

        model501: 'POR930',
        // name: 'POR930'

        model502: 'PA// nameRA17TURBO',
        // name: 'PA// nameRA17TURBO'

        model503: 'deviant',
        // name: 'deviant'

        model504: 'SULTANRS',
        // name: 'SULTANRS'

        model505: 'a80',
        // name: 'a80'

        model506: 'PEYOTE2',
        // name: 'PEYOTE2'

        model507: '66fastback',
        // name: '66fastback'

        model508: '69CHARGER',
        // name: '69CHARGER'

        model509: 'z2879',
        // name: 'z2879'

        model510: 'gs350',
        // name: 'gs350'

        model511: 'cliors',
        // name: 'cliors'

        model512: 'NPBFS',
        // name: 'NPBFS'

        model513: 'BTYPE2',
        // name: 'BTYPE2'

        model514: 'DRAFTGPR',
        // name: 'DRAFTGPR'

        model515: 'IMPERATOR',
        // name: 'IMPERATOR'

        model516: 'zentorno',
        // name: 'zentorno'

        model517: 'ADDER',
        // name: 'ADDER'

        model518: 'turismor',
        // name: 'turismor'

        model519: 'PENUMBRA2',
        // name: 'PENUMBRA2'

        model520: 'ap2',
        // name: 'ap2'

        model521: 'subwrx',
        // name: 'subwrx'

        model522: 'bluecunt',
        // name: 'bluecunt'

        model523: 'FELTZER',
        // name: 'FELTZER'

        model524: 'FUROREGT',
        // name: 'FUROREGT'

        model525: 'jester',
        // name: 'jester'

        model526: 'PENUMBRA',
        // name: 'PENUMBRA'

        model527: 'KANJO',
        // name: 'KANJO'

        model528: 'ELEGY2',
        // name: 'ELEGY2'

        model529: 'z190',
        // name: 'z190'

        model530: 'banshee',
        // name: 'banshee'

        model531: 'sentinelsg4',
        // name: 'sentinelsg4'

        model532: 'ninef',
        // name: 'ninef'

        model533: 'DRAFTER',
        // name: 'DRAFTER'

        model534: 'alpha',
        // name: 'alpha'

        model535: 'BESTIAGTS',
        // name: 'BESTIAGTS'

        model536: 'CARBONIZ',
        // name: 'CARBONIZ'

        model537: 'COMET',
        // name: 'COMET'

        model538: 'COMET3',
        // name: 'COMET3'

        model539: 'COMET5',
        // name: 'COMET5'

        model540: 'COQUETTE',
        // name: 'COQUETTE'

        model541: 'PARIAH',
        // name: 'PARIAH'

        model542: 'RAPIDGT',
        // name: 'RAPIDGT'

        model543: 'SCHWARZE',
        // name: 'SCHWARZE'

        model544: 'SURANO',
        // name: 'SURANO'

        model545: 'COGCABRIO',
        // name: 'COGCABRIO'

        model546: 'F620',
        // name: 'F620'

        model547: 'FELON2',
        // name: 'FELON2'

        model548: 'ZION',
        // name: 'ZION'

        model549: 'PARAGON',
        // name: 'PARAGON'

        model550: 'WINDSOR',
        // name: 'WINDSOR'

        model551: 'BRIOSO',
        // name: 'BRIOSO'

        model552: 'TOROS',
        // name: 'TOROS'

        model553: 'PRIMOARD',
        // name: 'PRIMOARD'

        model554: 'VOLTIC',
        // name: 'VOLTIC'

        model555: 'DOMINATOR',
        // name: 'DOMINATOR'

        model556: 'GAUNTLET',
        // name: 'GAUNTLET'

        model557: 'DOMINATOR3',
        // name: 'DOMINATOR3'

        model558: 'JESTER3',
        // name: 'JESTER3'

        model559: 'SPECTER',
        // name: 'SPECTER'

        model560: 'SPECTER2',
        // name: 'SPECTER2'

        model561: 'RUSTON',
        // name: 'RUSTON'

        model562: 'JUGULAR',
        // name: 'JUGULAR'

        model563: 'LYNX',
        // name: 'LYNX'

        model564: 'LOCUST',
        // name: 'LOCUST'

        model565: 'massacro',
        // name: 'massacro'

        model566: 'SEVEN70',
        // name: 'SEVEN70'

        model567: 'STAFFORD',
        // name: 'STAFFORD'

        model568: 'SLAMVAN',
        // name: 'SLAMVAN'

        model569: 'YOSEMITE',
        // name: 'YOSEMITE'

        model570: 'VAMOS',
        // name: 'VAMOS'

        model571: 'DUKES',
        // name: 'DUKES'

        model572: 'blade',
        // name: 'blade'

        model573: 'TAMPA',
        // name: 'TAMPA'

        model574: 'TORNADO6',
        // name: 'TORNADO6'

        model575: 'RUINER',
        // name: 'RUINER'

        model576: 'RUINER2',
        // name: 'RUINER2'

        model577: 'SABREGT',
        // name: 'SABREGT'

        model578: 'SLAMVAN3',
        // name: 'SLAMVAN3'

        model579: 'ELLIE',
        // name: 'ELLIE'

        model580: 'na6',
        // name: 'na6'

        model581: 'FK8',
        // name: 'FK8'

        model582: 'NEBULA',
        // name: 'NEBULA'

        model583: 'RR14',
        // name: 'RR14'

        model584: 'LC100',
        // name: 'LC100'

        model585: '22G63',
        // name: '22G63'

        model586: 'npolmm',
        // name: 'npolmm'

        model587: 'DEATHBIKE',

        model588: 'diablous2',
        // name: 'diablous2'

        model589: 'fcr2',
        // name: 'fcr2'

        model590: 'hakuchou2',
        // name: 'hakuchou2'

        model591: 'zx10',
        // name: 'zx10'

        model592: 'bmwr',
        // name: 'bmwr'

        model593: 'R1',
        // name: 'R1'

        model594: 'double',
        // name: 'double'

        model595: 'akuma',
        // name: 'akuma'

        model596: 'hakuchou',
        // name: 'hakuchou'

        model597: 'lectro',
        // name: 'lectro'

        model598: 'thrust',
        // name: 'thrust'

        model599: 'vindicator',
        // name: 'vindicator'

        model600: 'vortex',
        // name: 'vortex'

        model601: 'defiler',
        // name: 'defiler'

        model602: 'carbonrs',
        // name: 'carbonrs'

        model603: 'bati',
        // name: 'bati'

        model604: 'ruffian',
        // name: 'ruffian'

        model605: 'vader',
        // name: 'vader'

        model606: 'diablous',
        // name: 'diablous'

        model607: 'bf400',
        // name: 'bf400'

        model608: 'pcj',
        // name: 'pcj'

        model609: 'fcr',
        // name: 'fcr'

        model610: 'MANCHEZ2',
        // name: 'MANCHEZ2'

        model611: 'LURCHER',
        // name: 'LURCHER'

        model612: 'CLUB',
        // name: 'CLUB'

        model613: 'KOMODA',
        // name: 'KOMODA'

        model614: 'SAVANNA',
        // name: 'SAVANNA'

        model615: 'VSTR',
        // name: 'VSTR'

        model616: 'BLISTA',
        // name: 'BLISTA'

        model617: 'SUGOI',
        // name: 'SUGOI'

        model618: 'PRAIRIE',
        // name: 'PRAIRIE'

        model619: 'SENTINEL',
        // name: 'SENTINEL'

        model620: 'ZION3',
        // name: 'ZION3'

        model621: 'BUFFALO',
        // name: 'BUFFALO'

        model622: 'FUSILADE',
        // name: 'FUSILADE'

        model623: 'FUTO',
        // name: 'FUTO'

        model624: 'KURUMA',
        // name: 'KURUMA'

        model625: 'SCHAFTER2',
        // name: 'SCHAFTER2'

        model626: 'FELON',
        // name: 'FELON'

        model627: 'SENTINEL3',
        // name: 'SENTINEL3'

        model628: 'COGNOSC',
        // name: 'COGNOSC'

        model629: 'COG55',
        // name: 'COG55'

        model630: 'SAVESTRA',
        // name: 'SAVESTRA'

        model631: 'REVOLTER',
        // name: 'REVOLTER'

        model632: 'RAIDEN',
        // name: 'RAIDEN'

        model633: 'NEON',
        // name: 'NEON'

        model634: 'JACKAL',
        // name: 'JACKAL'

        model635: 'SULTAN',
        // name: 'SULTAN'

        model635: 'SULTAN2',
        // name: 'SULTAN2'

        model636: 'SCHAFTER3',
        // name: 'SCHAFTER3'

        model637: 'SCHAFTER4',
        // name: 'SCHAFTER4'

        model638: 'BUFFALO2',
        // name: 'BUFFALO2'

        model639: 'FUGITIVE',
        // name: 'FUGITIVE'

        model640: 'PREMIER',
        // name: 'PREMIER'

        model641: 'STRATUM',
        // name: 'STRATUM'

        model642: 'superd',
        // name: 'superd'

        model643: 'TAILGATE',
        // name: 'TAILGATE'

        model644: 'ORACLE',
        // name: 'ORACLE'

        model645: 'ORACLE2',
        // name: 'ORACLE2'

        model646: 'EXEMPLAR',
        // name: 'EXEMPLAR'

        model647: 'REBLA',
        // name: 'REBLA'

        model648: 'NOVAK',
        // name: 'NOVAK'

        model649: 'BALLER3',
        // name: 'BALLER3'

        model650: 'XLS',
        // name: 'XLS'

        model651: 'MINIVAN2',
        // name: 'MINIVAN2'

        model652: 'WINDSOR2',
        // name: 'WINDSOR2'

        model653: 'huntley',
        // name: 'huntley'

        model654: 'SURGE',
        // name: 'SURGE'

        model655: 'DUBSTA',
        // name: 'DUBSTA'

        model656: 'MWGRANGER',
        // name: 'MWGRANGER'

        model657: 'GRESLEY',
        // name: 'GRESLEY'

        model658: 'ROCOTO',
        // name: 'ROCOTO'

        model659: 'SERRANO',
        // name: 'SERRANO'

        model660: 'INTRUDER',
        // name: 'INTRUDER'

        model661: 'STINGER',
        // name: 'STINGER'

        model662: 'STINGERGT',
        // name: 'STINGERGT'

        model663: 'VIGERO',
        // name: 'VIGERO'

        model664: 'PICADOR',
        // name: 'PICADOR'

        model665: 'PHOENIX',
        // name: 'PHOENIX'

        model666: 'BUCCANEE',
        // name: 'BUCCANEE'

        model667: 'STALION',
        // name: 'STALION'

        model668: 'STALION2',
        // name: 'STALION2'

        model669: 'RAPIDGT3',
        // name: 'RAPIDGT3'

        model670: 'VIRGO',
        // name: 'VIRGO'

        model671: 'FELTZER3',
        // name: 'FELTZER3'

        model672: 'SABREGT2',
        // name: 'SABREGT2'

        model673: 'FACTION',
        // name: 'FACTION'

        model674: 'BUCCANEE2',
        // name: 'BUCCANEE2'

        model675: 'SLAMVAN2',
        // name: 'SLAMVAN2'

        model676: 'CASCO',
        // name: 'CASCO'

        model677: 'TULIP',
        // name: 'TULIP'

        model678: 'IMPALER',
        // name: 'IMPALER'

        model679: 'CLIQUE',
        // name: 'CLIQUE'

        model680: 'RLOADER2',
        // name: 'RLOADER2'

        model681: 'SWINGER',
        // name: 'SWINGER'

        model682: 'CHEBUREK',
        // name: 'CHEBUREK'

        model683: 'VISERIS',
        // name: 'VISERIS'

        model684: 'COQUETTE2',
        // name: 'COQUETTE2'

        model685: 'COQUETTE3',
        // name: 'COQUETTE3'

        model686: 'GT500',
        // name: 'GT500'

        model687: 'MAMBA',
        // name: 'MAMBA'

        model688: 'NITESHAD',
        // name: 'NITESHAD'

        model689: 'esv',
        // name: 'esv'

        model690: 'SQUADDIE',
        // name: 'SQUADDIE'

        model691: 'OUTLAW',
        // name: 'OUTLAW'

        model692: 'VAGRANT',
        // name: 'VAGRANT'

        model693: 'EVERON',
        // name: 'EVERON'

        model694: 'raid',
        // name: 'raid'

        model695: 'TROPHY',
        // name: 'TROPHY'

        model696: 'TROPHY2',
        // name: 'TROPHY2'

        model697: 'hellion6str',
        // name: 'hellion6str'

        model698: 'f150',
        // name: 'f150'

        model699: 'TROPOS',
        // name: 'TROPOS'

        model700: 'OMNIS',
        // name: 'OMNIS'

        model701: 'RETINUE',
        // name: 'RETINUE'

        model702: 'MICHELLI',
        // name: 'MICHELLI'

        model703: 'GB200',
        // name: 'GB200'

        model704: 'RETINUE2',
        // name: 'RETINUE2'

        model705: 'FLASHGT',
        // name: 'FLASHGT'

        model706: 'WEEVIL',
        // name: 'WEEVIL'

        model707: 'WINKY',
        // name: 'WINKY'

        model708: 'BRIOSO2',
        // name: 'BRIOSO2'

        model709: 'DELUXO2',
        // name: 'DELUXO2'

        model710: 'YOSEMITE3',
        // name: 'YOSEMITE3'

        model711: 'SEMINOLE2',
        // name: 'SEMINOLE2'

        model712: 'GLENDALE2',
        // name: 'GLENDALE2'

        model713: 'LANDSTLKR2',
        // name: 'LANDSTLKR2'

        model714: 'BLISTA2',
        // name: 'BLISTA2'

        model715: 'ASBO',
        // name: 'ASBO'

        model716: 'PATRIOT2',
        // name: 'PATRIOT2'

        model717: 'PRIMO',
        // name: 'PRIMO'

        model718: 'PRIMO2',
        // name: 'PRIMO2'

        model719: 'RHAPSODY1',
        // name: 'RHAPSODY1'

        model720: 'warrener',
        // name: 'warrener'

        model721: 'PANTO',
        // name: 'PANTO'

        model722: 'INGOT',
        // name: 'INGOT'

        model723: 'ASTEROPE',
        // name: 'ASTEROPE'

        model724: 'STANIER',
        // name: 'STANIER'

        model725: 'TAXI2',
        // name: 'TAXI2'

        model726: 'STRETCH',
        // name: 'STRETCH'

        model727: 'WASHINGTON',
        // name: 'WASHINGTON'

        model728: 'ISSI7',
        // name: 'ISSI7'

        model729: 'ISSI',
        // name: 'ISSI'

        model730: 'BALLER',
        // name: 'BALLER'

        model731: 'BALLER2',
        // name: 'BALLER2'

        model732: 'BJXL',
        // name: 'BJXL'

        model733: 'CAVCADE',
        // name: 'CAVCADE'

        model734: 'FQ2',
        // name: 'FQ2'

        model735: 'LGUARD',
        // name: 'LGUARD'

        model736: 'HABANERO',
        // name: 'HABANERO'

        model737: 'LANDSTALKER',
        // name: 'LANDSTALKER'

        model738: 'PATRIOT',
        // name: 'PATRIOT'

        model739: 'RADI',
        // name: 'RADI'

        model740: 'SEMINOLE',
        // name: 'SEMINOLE'

        model741: 'YOUGA',
        // name: 'YOUGA'

        model742: 'RLOADER',
        // name: 'RLOADER'

        model743: 'ztype',
        // name: 'ztype'

        model744: 'HOTKNIFE',
        // name: 'HOTKNIFE'

        model745: 'GLENDALE',
        // name: 'GLENDALE'

        model746: 'ROOSEVELT',
        // name: 'ROOSEVELT'

        model747: 'ROOSEVELT2',
        // name: 'ROOSEVELT2'

        model748: 'CHINO',
        // name: 'CHINO'

        model749: 'MOONBEAM',
        // name: 'MOONBEAM'

        model750: 'FACTION3',
        // name: 'FACTION3'

        model751: 'CHINO2',
        // name: 'CHINO2'

        model752: 'ISSI3',
        // name: 'ISSI3'

        model753: 'FAGALOA',
        // name: 'FAGALOA'

        model754: 'CARACARA2',
        // name: 'CARACARA2'

        model755: 'BOBCATXL',
        // name: 'BOBCATXL'

        model756: 'BFINJECT',
        // name: 'BFINJECT'

        model757: 'REBEL',
        // name: 'REBEL'

        model758: 'BISON',
        // name: 'BISON'

        model759: 'DUNE',
        // name: 'DUNE'

        model760: 'DUNE2',
        // name: 'DUNE2'

        model761: 'BLAZER4',
        // name: 'BLAZER4'

        model762: 'VERUS',
        // name: 'VERUS'

        model763: 'DUBSTA3',
        // name: 'DUBSTA3'

        model764: 'bifta',
        // name: 'bifta'

        model765: 'CONTENDER',
        // name: 'CONTENDER'

        model766: 'BRAWLER',
        // name: 'BRAWLER'

        model767: 'GUARDIAN',
        // name: 'GUARDIAN'

        model768: 'RUMPO3',
        // name: 'RUMPO3'

        model769: 'FREECRAWLER',
        // name: 'FREECRAWLER'

        model770: 'STREITER',
        // name: 'STREITER'

        model771: 'RIATA',
        // name: 'RIATA'

        model772: 'KAMACHO',
        // name: 'KAMACHO'

        model773: 'MESA',
        // name: 'MESA'

        model774: 'COMET4',
        // name: 'COMET4'

        model775: 'RALLYTRUCK',
        // name: 'RALLYTRUCK'

        model776: 'SLAMTRUCK',
        // name: 'SLAMTRUCK'

        model777: 'YOUGA3',
        // name: 'YOUGA3'

        model778: 'MANANA2',
        // name: 'MANANA2'

        model779: 'PEYOTE3',
        // name: 'PEYOTE3'

        model780: 'KART',
        // name: 'KART'

        model781: 'SKART',
        // name: 'SKART'

        model782: 'CHILLYBIN',
        // name: 'CHILLYBIN'

        model783: 'VETO',
        // name: 'VETO'

        model784: 'VETO2',
        // name: 'VETO2'

        model785: 'GBURRITO2',
        // name: 'GBURRITO2'

        model786: 'paradise',
        // name: 'paradise'

        model787: 'ASEA',
        // name: 'ASEA'

        model788: 'EMPEROR',
        // name: 'EMPEROR'

        model789: 'REGINA',
        // name: 'REGINA'

        model790: 'ROMERO',
        // name: 'ROMERO'

        model791: 'MINIVAN',
        // name: 'MINIVAN'

        model792: 'PONY',
        // name: 'PONY'

        model793: 'RUMPO',
        // name: 'RUMPO'

        model794: 'NEWSVAN',
        // name: 'NEWSVAN'

        model795: 'speedo',
        // name: 'speedo'

        model796: 'TACO',
        // name: 'TACO'

        model797: 'MRTASTY',
        // name: 'MRTASTY'

        model798: 'CAMPER',
        // name: 'CAMPER'

        model799: 'DILETTANTE',
        // name: 'DILETTANTE'

        model800: 'BURRITO',
        // name: 'BURRITO'

        model801: 'GBURRITO',
        // name: 'GBURRITO'

        model802: 'JOURNEY',
        // name: 'JOURNEY'

        model803: 'DYNASTY',
        // name: 'DYNASTY'

        model804: 'SURFER',
        // name: 'SURFER'

        model805: 'MANANA',
        // name: 'MANANA'

        model806: 'PEYOTE',
        // name: 'PEYOTE'

        model807: 'TORNADO',
        // name: 'TORNADO'

        model808: 'PIGALLE',
        // name: 'PIGALLE'

        model809: 'VIRGO2',
        // name: 'VIRGO2'

        model810: 'VIRGO3',
        // name: 'VIRGO3'

        model811: 'TORNADO5',
        // name: 'TORNADO5'

        model812: 'VOODOO2',
        // name: 'VOODOO2'

        model813: 'VOODOO',
        // name: 'VOODOO'

        model814: 'YOUGA2',
        // name: 'YOUGA2'

        model815: 'HERMES',
        // name: 'HERMES'

        model816: 'HUSTLER',
        // name: 'HUSTLER'

        model817: 'BLAZER',
        // name: 'BLAZER'

        model818: 'BLAZER2',
        // name: 'BLAZER2'

        model819: 'RANCHERXL',
        // name: 'RANCHERXL'

        model820: 'SADLER',
        // name: 'SADLER'

        model821: 'DLOADER',
        // name: 'DLOADER'

        model822: 'SANDKING',
        // name: 'SANDKING'

        model823: 'kalahari',
        // name: 'kalahari'

        model824: 'VETIR',
        // name: 'VETIR'

        model825: 'COACH',
        // name: 'COACH'

        model826: 'FLATBED',
        // name: 'FLATBED'

        model827: 'MIXER',
        // name: 'MIXER'

        model828: 'MIXER2',
        // name: 'MIXER2'

        model829: 'RUBBLE',
        // name: 'RUBBLE'

        model830: 'TIPTRUCK',
        // name: 'TIPTRUCK'

        model831: 'TIPTRUCK2',
        // name: 'TIPTRUCK2'

        model832: 'BUS',
        // name: 'BUS'

        model833: 'TOURBUS',
        // name: 'TOURBUS'

        model834: 'trash',
        // name: 'trash'

        model835: 'TRASH2',
        // name: 'TRASH2'

        model836: 'AIRTUG',
        // name: 'AIRTUG'

        model837: 'caddy',
        // name: 'caddy'

        model838: 'CADDY2',
        // name: 'CADDY2'

        model839: 'DOCKTUG',
        // name: 'DOCKTUG'

        model840: 'forklift',
        // name: 'forklift'

        model841: 'MOWER',
        // name: 'MOWER'

        model842: 'RIPLEY',
        // name: 'RIPLEY'

        model843: 'SCRAP',
        // name: 'SCRAP'

        model844: 'TRACTOR2',
        // name: 'TRACTOR2'

        model845: 'UTILTRUC',
        // name: 'UTILTRUC'

        model846: 'UTILTRUC2',
        // name: 'UTILTRUC2'

        model847: 'UTILTRUC3',
        // name: 'UTILTRUC3'

        model848: 'BOXVILLE',
        // name: 'BOXVILLE'

        model849: 'PBUS2',
        // name: 'PBUS2'

        model850: 'WASTELANDER',
        // name: 'WASTELANDER'

        model851: '126P',
        // name: '126P'

        model852: 'ROBIN',
        // name: 'ROBIN'

        model853: 'PEANUT',
        // name: 'PEANUT'

        model854: 'APC',
        // name: 'APC'

        model855: 'POTTY',
        // name: 'POTTY'

        model856: 'ajnatrio1',
        // name: 'ajnatrio1'

        model857: 'ajnatrio2',
        // name: 'ajnatrio2'

        model858: 'LONGFIN',
        // name: 'LONGFIN'

        model859: 'ALKONOST',
        // name: 'ALKONOST'

        model860: 'ANNIHLATOR2',
        // name: 'ANNIHLATOR2'

        model861: 'AVISA',
        // name: 'AVISA'

        model862: 'TOREADOR',
        // name: 'TOREADOR'

        model863: 'MONSTER',
        // name: 'MONSTER'

        model864: 'MONSTER3',
        // name: 'MONSTER3'

        model865: 'MARSHALL',
        // name: 'MARSHALL'

        model866: 'KURUMA2',
        // name: 'KURUMA2'

        model867: 'COG552',
        // name: 'COG552'

        model868: 'BALLER5',
        // name: 'BALLER5'

        model869: 'SCHAFTER5',
        // name: 'SCHAFTER5'

        model870: 'XLS2',
        // name: 'XLS2'

        model871: 'DUKES2',
        // name: 'DUKES2'

        model872: 'npdrone',
        // name: 'npdrone'

        model873: 'TRACTORC',
        // name: 'TRACTORC'

        model874: 'predator',
        // name: 'predator'

        model875: 'HYDRA2',
        // name: 'HYDRA2'

        model876: 'police2',
        // name: 'police2'

        model877: 'an225',
        // name: 'an225'

        model878: 'dinghy',
        // name: 'Dinghy'

        model879: 'Dinghy2',
        // name: 'Dinghy II'

        model880: 'Dinghy3',
        // name: 'Dinghy III'

        model881: 'Dinghy4',
        // name: 'Dinghy IV'

        model882: 'Jetmax',
        // name: 'Jetmax'

        model883: 'Marquis',
        // name: 'Marquis'

        model884: 'Seashark',
        // name: 'Seashark'

        model885: 'Seashark2',
        // name: 'Seashark II'

        model886: 'Seashark3',
        // name: 'Seashark III'

        model887: 'Speeder',
        // name: 'Speeder'

        model888: 'Speeder2',
        // name: 'Speeder II'

        model889: 'Squalo',
        // name: 'Squalo'

        model890: 'Submersible',
        // name: 'Submersible'

        model891: 'Submersible2',
        // name: 'Submersible II'

        model892: 'Suntrap',
        // name: 'Suntrap'

        model893: 'Toro',
        // name: 'Toro'

        model894: 'Toro2',
        // name: 'Toro II'

        model895: 'Tropic',
        // name: 'Tropic'

        model896: 'Tropic2',
        // name: 'Tropic II'

        model897: 'Tug',
        // name: 'Tug'

        model898: 'Benson',
        // name: 'Benson'

        model899: 'Biff',
        // name: 'Biff'

        model900: 'Hauler',
        // name: 'Hauler'

        model901: 'Hauler2',
        // name: 'Hauler II'

        model902: 'Mule',
        // name: 'Mule'

        model903: 'Mule2',
        // name: 'Mule II'

        model904: 'Mule3',
        // name: 'Mule III'

        model905: 'Packer',
        // name: 'Packer'

        model906: 'Phantom',
        // name: 'Phantom'

        model907: 'Phantom2',
        // name: 'Phantom II'

        model908: 'Phantom3',
        // name: 'Phantom III'

        model909: 'Pounder',
        // name: 'Pounder'

        model910: 'Stockade',
        // name: 'Stockade'

        model911: 'Stockade3',
        // name: 'Stockade III'

        model912: 'Blista',
        // name: 'Blista'

        model913: 'Blista2',
        // name: 'Blista II'

        model914: 'Blista3',
        // name: 'Blista III'

        model915: 'Brioso',
        // name: 'Brioso'

        model916: 'Dilettante',
        // name: 'Dilettante'

        model917: 'Dilettante2',
        // name: 'Dilettante II'

        model918: 'Issi2',
        // name: 'Issi II'

        model919: 'Panto',
        // name: 'Panto'

        model920: 'Prairie',
        // name: 'Prairie'

        model921: 'Rhapsody',
        // name: 'Rhapsody'

        model922: 'CogCabrio',
        // name: 'Cog Cabrio'

        model923: 'Exemplar',
        // name: 'Exemplar'

        model924: 'F620',
        // name: 'F620'

        model925: 'Felon',
        // name: 'Felon'

        model926: 'Felon2',
        // name: 'Felon II'

        model927: 'Oracle',
        // name: 'Oracle'

        model928: 'Oracle2',
        // name: 'Oracle II'

        model929: 'Sentinel',
        // name: 'Sentinel'

        model930: 'Sentinel2',
        // name: 'Sentinel II'

        model931: 'Windsor',
        // name: 'Windsor'

        model932: 'Windsor2',
        // name: 'Windsor II'

        model933: 'Zion',
        // name: 'Zion'

        model934: 'Zion2',
        // name: 'Zion II'

        model935: 'Bmx',
        // name: 'BMX'

        model936: 'Cruiser',
        // name: 'Cruiser'

        model937: 'Fixter',
        // name: 'Fixter'

        model938: 'Scorcher',
        // name: 'Scorcher'

        model939: 'TriBike',
        // name: 'Tri-Bike'

        model940: 'TriBike2',
        // name: 'Tri-Bike II'

        model941: 'TriBike3',
        // name: 'Tri-Bike III'

        model942: 'Ambulance',
        // name: 'Ambulance'

        model943: 'FBI',
        // name: 'FBI Car'

        model944: 'FBI2',
        // name: 'FBI Car II'

        model945: 'PBus',
        // name: 'Prison Bus'

        model946: 'Police',
        // name: 'Police Car'

        model947: 'Police2',
        // name: 'Police Car II'

        model948: 'Police3',
        // name: 'Police Car III'

        model949: 'Police4',
        // name: 'Police Car IV'

        model950: 'PoliceOld1',
        // name: 'Police Car Old'

        model951: 'PoliceOld2',
        // name: 'Police Car Old II'

        model952: 'PoliceT',
        // name: 'Swat Van'

        model953: 'Policeb',
        // name: 'Police Car B'

        model954: 'Polmav',
        // name: 'Police Maverick'

        model955: 'Pranger',
        // name: 'Police Ranger'

        model956: 'Predator',
        // name: 'Predator'

        model957: 'Riot',
        // name: 'Riot Car'

        model958: 'Sheriff',
        // name: 'Sheriff Car'

        model959: 'Sheriff2',
        // name: 'Sheriff Car II'

        model960: 'Annihilator',
        // name: 'Annihilator'

        model961: 'Buzzard',
        // name: 'Buzzard'

        model962: 'Buzzard2',
        // name: 'Buzzard II'

        model963: 'Cargobob',
        // name: 'Cargobob'

        model964: 'Cargobob2',
        // name: 'Cargobob II'

        model965: 'Cargobob3',
        // name: 'Cargobob III'

        model966: 'Cargobob4',
        // name: 'Cargobob IV'

        model967: 'Frogger',
        // name: 'Frogger'

        model968: 'Frogger2',
        // name: 'Frogger II'

        model969: 'Maverick',
        // name: 'Maverick'

        model970: 'Savage',
        // name: 'Savage'

        model972: 'Skylift',
        // name: 'Skylift'

        model973: 'Supervolito',
        // name: 'Supervolito'

        model974: 'Supervolito2',
        // name: 'Supervolito II'

        model975: 'Swift',
        // name: 'Swift'

        model976: 'Swift2',
        // name: 'Swift II'

        model977: 'Valkyrie',
        // name: 'Valkyrie'

        model978: 'Valkyrie2',
        // name: 'Valkyrie II'

        model979: 'Volatus',
        // name: 'Volatus'

        model980: 'Bulldozer',
        // name: 'Bulldozer'

        model981: 'Cutter',
        // name: 'Cutter'

        model982: 'Dump',
        // name: 'Dump'

        model983: 'Flatbed',
        // name: 'Flatbed'

        model984: 'Guardian',
        // name: 'Guardian'

        model985: 'Handler',
        // name: 'Handler'

        model986: 'Mixer',
        // name: 'Mixer'

        model987: 'Mixer2',
        // name: 'Mixer II'

        model988: 'Rubble',
        // name: 'Rubble'

        model989: 'TipTruck',
        // name: 'TipTruck'

        model990: 'TipTruck2',
        // name: 'TipTruck2'

        model991: 'APC',
        // name: 'APC'

        model992: 'Barracks',
        // name: 'Barracks'

        model993: 'Barracks2',
        // name: 'Barracks II'

        model994: 'Barracks3',
        // name: 'Barracks III'

        model995: 'Crusader',
        // name: 'Crusader'

        model996: 'Halftrack',
        // name: 'Halftrack'

        model997: 'Rhino',
        // name: 'Rhino'

        model998: 'Trailersmall2',
        // name: 'Small Trailer II'

        model999: 'Akuma',
        // name: 'Akuma'

        model1000: 'Avarus',
        // name: 'Avarus'

        model1001: 'Bagger',
        // name: 'Bagger'

        model1002: 'Bati2',
        // name: 'Bati II'

        model1003: 'Bati',
        // name: 'Bati'

        model1004: 'BF400',
        // name: 'BF400'

        model1005: 'Blazer4',
        // name: 'Blazer IV'

        model1006: 'CarbonRS',
        // name: 'Carbon RS'

        model1007: 'Chimera',
        // name: 'Chimera'

        model1008: 'Cliffhanger',
        // name: 'Cliffhanger'

        model1009: 'Daemon2',
        // name: 'Daemon II'
 
        model1010: 'Daemon',
        // name: 'Daemon'

        model1011: 'Defiler',
        // name: 'Defiler'

        model1012: 'Double',
        // name: 'Double'

        model1013: 'Enduro',
        // name: 'Enduro'

        model1014: 'Esskey',
        // name: 'Esskey'

        model1015: 'Faggio',
        // name: 'Faggio'

        model1016: 'Faggio2',
        // name: 'Faggio II'

        model1017: 'Faggio3',
        // name: 'Faggio III'

        model1018: 'Fcr2',
        // name: 'FCR II'

        model1019: 'Gargoyle',
        // name: 'Gargoyle'

        model1020: 'Hakuchou2',
        // name: 'Hakuchou II'

        model1021: 'Hakuchou',
        // name: 'Hakuchou'

        model1022: 'Hexer',
        // name: 'Hexer'

        model1023: 'Innovation',
        // name: 'Innovation'

        model1024: 'Lectro',
        // name: 'Lectro'

        model1025: 'Manchez',
        // name: 'Manchez'

        model1026: 'Nemesis',
        // name: 'Nemesis'

        model1027: 'Nightblade',
        // name: 'Nightblade'

        model1028: 'Oppressor',
        // name: 'Oppressor'

        model1029: 'Oppressor2',
        // name: 'Oppressor II'

        model1030: 'PCJ',
        // name: 'PCJ'

        model1031: 'Ratbike',
        // name: 'Ratbike'

        model1032: 'Ruffian',
        // name: 'Ruffian'

        model1033: 'Sanchez2',
        // name: 'Sanchez2'

        model1034: 'Sanchez',
        // name: 'Sanchez'

        model1035: 'Sanctus',
        // name: 'Sanctus'

        model1036: 'Shotaro',
        // name: 'Shotaro'

        model1037: 'Sovereign',
        // name: 'Sovereign'

        model1038: 'Thrust',
        // name: 'Thrust'

        model1039: 'Vader',
        // name: 'Vader'

        model1040: 'Vindicator',
        // name: 'Vindicator'

        model1041: 'Vortex',
        // name: 'Vortex'

        model1042: 'Wolfsbane',
        // name: 'Wolfsbane'

        model1043: 'Zombiea',
        // name: 'Zombie A'

        model1044: 'Zombieb',
        // name: 'Zombie B'

        model1045: 'Blade',
        // name: 'Blade'

        model1046: 'Buccaneer',
        // name: 'Buccaneer'

        model1047: 'Buccaneer2',
        // name: 'Buccaneer II'

        model1048: 'Chino',
        // name: 'Chino'

        model1049: 'Chino2',
        // name: 'Chino II'

        model1050: 'Dominator',
        // name: 'Dominator'

        model1051: 'Dominator2',
        // name: 'Dominator II'

        model1052: 'Dukes',
        // name: 'Dukes'

        model1053: 'Dukes2',
        // name: 'Dukes II'

        model1054: 'Faction',
        // name: 'Faction'

        model1055: 'Faction2',
        // name: 'Faction II'

        model1056: 'Faction3',
        // name: 'Faction III'

        model1057: 'Gauntlet',
        // name: 'Gauntlet'

        model1058: 'Gauntlet2',
        // name: 'Gauntlet II'

        model1059: 'Hotknife',
        // name: 'Hotknife'

        model1060: 'Moonbeam',
        // name: 'Moonbeam'

        model1061: 'Moonbeam2',
        // name: 'Moonbeam II'

        model1062: 'Nightshade',
        // name: 'Nightshade'

        model1063: 'Phoenix',
        // name: 'Phoenix'

        model1064: 'Picador',
        // name: 'Picador'

        model1065: 'RatLoader',
        // name: 'Rat Loader'

        model1066: 'RatLoader2',
        // name: 'Rat Loader II'

        model1067: 'Ruiner',
        // name: 'Ruiner'

        model1068: 'Ruiner2',
        // name: 'Ruiner II'

        model1069: 'SabreGT',
        // name: 'Sabre GT'

        model1070: 'SabreGT2',
        // name: 'Sabre GT II'

        model1071: 'Sadler2',
        // name: 'Sadler II'

        model1072: 'SlamVan',
        // name: 'Slam Van'

        model1073: 'SlamVan2',
        // name: 'Slam Van II'

        model1074: 'SlamVan3',
        // name: 'Slam Van III'

        model1075: 'Stalion',
        // name: 'Stalion'

        model1076: 'Stalion2',
        // name: 'Stalion II'

        model1077: 'Tampa',
        // name: 'Tampa'

        model1078: 'Tampa3',
        // name: 'Tampa III'

        model1079: 'Vigero',
        // name: 'Vigero'

        model1080: 'Virgo',
        // name: 'Virgo'

        model1081: 'Virgo2',
        // name: 'Virgo II'

        model1082: 'Virgo3',
        // name: 'Virgo III'

        model1083: 'Voodoo',
        // name: 'Voodoo'

        model1084: 'Voodoo2',
        // name: 'Voodoo II'

        model1085: 'BfInjection',
        // name: 'Bf Injection'

        model1086: 'Bifta',
        // name: 'Bifta'

        model1087: 'Blazer',
        // name: 'Blazer'

        model1088: 'Blazer2',
        // name: 'Blazer II'

        model1089: 'Blazer3',
        // name: 'Blazer III'

        model1090: 'Blazer5',
        // name: 'Blazer V'

        model1091: 'Bodhi2',
        // name: 'Bodhi'

        model1092: 'Brawler',
        // name: 'Brawler'

        model1093: 'DLoader',
        // name: 'D Loader'

        model1094: 'Dune',
        // name: 'Dune'

        model1095: 'Dune2',
        // name: 'Dune II'

        model1096: 'Dune3',
        // name: 'Dune III'

        model1097: 'Dune4',
        // name: 'Dune IV'

        model1098: 'Dune5',
        // name: 'Dune V'

        model1099: 'Insurgent',
        // name: 'Insurgent'

        model1100: 'Insurgent2',
        // name: 'Insurgent II'

        model1101: 'Insurgent3',
        // name: 'Insurgent III'

        model1102: 'Kalahari',
        // name: 'Kalahari'

        model1103: 'Lguard',
        // name: 'L Guard'

        model1104: 'Marshall',
        // name: 'Marshall'

        model1105: 'Mesa',
        // name: 'Mesa'

        model1106: 'Mesa2',
        // name: 'Mesa II'

        model1107: 'Mesa3',
        // name: 'Mesa III'

        model1108: 'Monster',
        // name: 'Monster'

        model1109: 'Nightshark',
        // name: 'Nightshark'

        model1110: 'RancherXL',
        // name: 'Rancher XL'

        model1111: 'RancherXL2',
        // name: 'Rancher XL II'

        model1112: 'Rebel',
        // name: 'Rebel'

        model1113: 'Rebel2',
        // name: 'Rebel II'

        model1114: 'Sandking',
        // name: 'Sandking'

        model1115: 'Sandking2',
        // name: 'Sandking II'

        model1116: 'Technical',
        // name: 'Technical'

        model1117: 'Technical2',
        // name: 'Technical II'

        model1118: 'Technical3',
        // name: 'Technical III'

        model1119: 'TrophyTruck',
        // name: 'Trophy Truck'

        model1120: 'TrophyTruck2',
        // name: 'Trophy Truck II'

        model1121: 'Besra',
        // name: 'Besra'

        model1122: 'Blimp',
        // name: 'Blimp'

        model1123: 'Blimp2',
        // name: 'Blimp II'

        model1124: 'CargoPlane',
        // name: 'Cargo Plane'

        model1125: 'Cuban800',
        // name: 'Cuban 800'

        model1126: 'Dodo',
        // name: 'Dodo'

        model1127: 'Duster',
        // name: 'Duster'

        model1128: 'Hydra',
        // name: 'Hydra'

        model1129: 'Jet',
        // name: 'Jet'

        model1130: 'Lazer',
        // name: 'Lazer'

        model1131: 'Luxor',
        // name: 'Luxor'

        model1132: 'Luxor2',
        // name: 'Luxor II'

        model1133: 'Mammatus',
        // name: 'Mammatus'

        model1134: 'Miljet',
        // name: 'Military jet'

        model1135: 'Nimbus',
        // name: 'Nimbus'

        model1136: 'Shamal',
        // name: 'Shamal'

        model1137: 'Stunt',
        // name: 'Stunt Plane'

        model1138: 'Titan',
        // name: 'Titan'

        model1139: 'Velum',
        // name: 'Velum'

        model1140: 'Velum2',
        // name: 'Velum II'

        model1141: 'Velum2',
        // name: 'Velum II'

        model1142: 'Vestra',
        // name: 'Vestra'

        model1143: 'BJXL',
        // name: 'BJ XL'

        model1144: 'Baller',
        // name: 'Baller'

        model1145: 'Baller2',
        // name: 'Baller II'

        model1146: 'Baller3',
        // name: 'Baller III'

        model1147: 'Baller4',
        // name: 'Baller IV'

        model1148: 'Baller5',
        // name: 'Baller V'

        model1149: 'Baller6',
        // name: 'Baller VI'

        model1150: 'Cavalcade',
        // name: 'Cavalcade'

        model1151: 'Cavalcade2',
        // name: 'Cavalcade II'

        model1152: 'Contender',
        // name: 'Contender'

        model1153: 'Dubsta',
        // name: 'Dubsta'

        model1154: 'Dubsta2',
        // name: 'Dubsta II'

        model1155: 'Dubsta3',
        // name: 'Dubsta III'

        model1156: 'FQ2',
        // name: 'FQ II'

        model1157: 'Granger',
        // name: 'Granger'

        model1158: 'Gresley',
        // name: 'Gresley'

        model1159: 'Habanero',
        // name: 'Habanero'

        model1160: 'Huntley',
        // name: 'Huntley'

        model1161: 'Landstalker',
        // name: 'Landstalker'

        model1162: 'Patriot',
        // name: 'Patriot'

        model1163: 'Radi',
        // name: 'Radi'

        model1164: 'Rocoto',
        // name: 'Rocoto'

        model1165: 'Seminole',
        // name: 'Seminole'

        model1166: 'Serrano',
        // name: 'Serrano'

        model1167: 'XLS',
        // name: 'XLS'

        model1168: 'XLS2',
        // name: 'XLS II'

        model1169: 'Asea',
        // name: 'Asea'

        model1170: 'Asea2',
        // name: 'Asea II'

        model1171: 'Asterope',
        // name: 'Asterope'

        model1172: 'Cog55',
        // name: 'Cog55'

        model1173: 'Cog552',
        // name: 'Cog55 II'

        model1174: 'Cognoscenti',
        // name: 'Cognoscenti'

        model1175: 'Cognoscenti2',
        // name: 'Cognoscenti II'

        model1176: 'Emperor',
        // name: 'Emperor'

        model1177: 'Emperor2',
        // name: 'Emperor II'

        model1178: 'Emperor3',
        // name: 'Emperor III'

        model1179: 'Fugitive',
        // name: 'Fugitive'

        model1180: 'Glendale',
        // name: 'Glendale'

        model1181: 'Ingot',
        // name: 'Ingot'

        model1182: 'Intruder',
        // name: 'Intruder'

        model1183: 'Limo2',
        // name: 'Limo II'

        model1184: 'Premier',
        // name: 'Premier'

        model1185: 'Primo',
        // name: 'Primo'

        model1186: 'Primo2',
        // name: 'Primo II'

        model1187: 'Regina',
        // name: 'Regina'

        model1188: 'Romero',
        // name: 'Romero'

        model1189: 'Stanier',
        // name: 'Stanier'

        model1190: 'Stratum',
        // name: 'Stratum'

        model1191: 'Stretch',
        // name: 'Stretch'

        model1192: 'Surge',
        // name: 'Surge'

        model1193: 'Tailgater',
        // name: 'Tailgater'

        model1194: 'Warrener',
        // name: 'Warrener'

        model1195: 'Washington',
        // name: 'Washington'

        model1196: 'Airbus',
        // name: 'Airbus'

        model1197: 'Brickade',
        // name: 'Brickade'

        model1198: 'Bus',
        // name: 'Bus'

        model1199: 'Coach',
        // name: 'Coach'

        model1200: 'Rallytruck',
        // name: 'Rallytruck'

        model1201: 'RentalBus',
        // name: 'Rental Bus'

        model1203: 'Taxi',
        // name: 'Taxi'

        model1204: 'Tourbus',
        // name: 'Tourbus'

        model1205: 'Trash',
        // name: 'Trash'

        model1206: 'Trash2',
        // name: 'Trash II'

        model1207: 'Alpha',
        // name: 'Alpha'

        model1208: 'Banshee',
        // name: 'Banshee'

        model1209: 'Banshee2',
        // name: 'Banshee II'

        model1210: 'BestiaGTS',
        // name: 'Bestia GTS'

        model1211: 'Buffalo',
        // name: 'Buffalo'

        model1212: 'Buffalo2',
        // name: 'Buffalo II'

        model1213: 'Buffalo3',
        // name: 'Buffalo III'

        model1214: 'Carbonizzare',
        // name: 'Carbonizzare'

        model1215: 'Comet2',
        // name: 'Comet II'

        model1216: 'Comet3',
        // name: 'Comet3'

        model1217: 'Coquette',
        // name: 'Coquette'

        model1218: 'Elegy',
        // name: 'Elegy'

        model1219: 'Elegy2',
        // name: 'Elegy II'

        model1220: 'Feltzer2',
        // name: 'Feltzer II'

        model1221: 'Feltzer3',
        // name: 'Feltzer III'

        model1222: 'Furoregt',
        // name: 'Furore GT'

        model1223: 'Fusilade',
        // name: 'Fusilade'

        model1224: 'Futo',
        // name: 'Futo'

        model1225: 'Infernus2',
        // name: 'Infernus II'

        model1226: 'Jester',
        // name: 'Jester'

        model1227: 'Jester2',
        // name: 'Jester II'

        model1228: 'Khamelion',
        // name: 'Khamelion'

        model1229: 'Kuruma',
        // name: 'Kuruma'

        model1230: 'Kuruma2',
        // name: 'Kuruma II'

        model1231: 'Lynx',
        // name: 'Lynx'

        model1232: 'Massacro',
        // name: 'Massacro'

        model1234: 'Massacro2',
        // name: 'Massacro II'

        model1235: 'Ninef',
        // name: 'Nine F'

        model1236: 'Ninef2',
        // name: 'Nine F II'

        model1337: 'Omnis',
        // name: 'Omnis'

        model1238: 'Penumbra',
        // name: 'Penumbra'

        model1239: 'RapidGT',
        // name: 'Rapid GT'

        model1240: 'RapidGT2',
        // name: 'Rapid GT II'

        model1241: 'Raptor',
        // name: 'Raptor'

        model1242: 'Ruston',
        // name: 'Ruston'

        model1243: 'Schafter2',
        // name: 'Schafter II'

        model1244: 'Schafter3',
        // name: 'Schafter III'

        model1245: 'Schafter4',
        // name: 'Schafter IV'

        model1246: 'Schafter5',
        // name: 'Schafter V'

        model1247: 'Schafter6',
        // name: 'Schafter VI'

        model1248: 'Schwarzer',
        // name: 'Schwarzer'

        model1249: 'Seven70',
        // name: 'Seven 70'

        model1250: 'Specter',
        // name: 'Specter'

        model1251: 'Specter2',
        // name: 'Specter II'

        model1252: 'Sultan',
        // name: 'Sultan'

        model1253: 'Surano',
        // name: 'Surano'

        model1254: 'Tampa2',
        // name: 'Tampa II'

        model1255: 'Tropos',
        // name: 'Tropos'

        model1256: 'Verlierer2',
        // name: 'Verlierer II'

        model1257: 'Ardent',
        // name: 'Ardent'

        model1258: 'BType',
        // name: 'BType'

        model1259: 'BType2',
        // name: 'BType II'

        model1260: 'BType3',
        // name: 'BType III'

        model1261: 'Casco',
        // name: 'Casco'

        model1262: 'Cheetah2',
        // name: 'Cheetah II'

        model1263: 'Coquette2',
        // name: 'Coquette II'

        model1264: 'Coquette3',
        // name: 'Coquette III'

        model1265: 'JB700',
        // name: 'JB-700'

        model1266: 'Manana',
        // name: 'Manana'

        model1267: 'Monroe',
        // name: 'Monroe'

        model1268: 'Peyote',
        // name: 'Peyote'

        model1269: 'Pigalle',
        // name: 'Pigalle'

        model1270: 'Stinger',
        // name: 'Stinger'

        model1271: 'StingerGT',
        // name: 'Stinger GT'

        model1272: 'Torero',
        // name: 'Torero'

        model1273: 'Tornado',
        // name: 'Tornado'

        model1274: 'Tornado2',
        // name: 'Tornado II'

        model1275: 'Tornado3',
        // name: 'Tornado III'

        model1276: 'Tornado4',
        // name: 'Tornado IV'

        model1277: 'Tornado5',
        // name: 'Tornado V'

        model1278: 'Tornado6',
        // name: 'Tornado VI'

        model1279: 'ZType',
        // name: 'ZType'

        model1280: 'Adder',
        // name: 'Adder'

        model1281: 'Bullet',
        // name: 'Bullet'

        model1282: 'Cheetah',
        // name: 'Cheetah'

        model1283: 'EntityXF',
        // name: 'EntityXF'

        model1284: 'FMJ',
        // name: 'FMJ'

        model1285: 'GP1',
        // name: 'GP1'

        model1286: 'Infernus',
        // name: 'Infernus'

        model1287: 'Nero',
        // name: 'Nero'

        model1288: 'Nero2',
        // name: 'Nero II'

        model1289: 'Osiris',
        // name: 'Osiris'

        model1290: 'Penetrator',
        // name: 'Penetrator'

        model1291: 'Pfister811',
        // name: 'Pfister 811'

        model1292: 'Prototipo',
        // name: 'Prototipo'

        model1293: 'Reaper',
        // name: 'Reaper'

        model1294: 'Sheava',
        // name: 'Sheava'

        model1295: 'SultanRS',
        // name: 'Sultan RS'

        model1296: 'Superd',
        // name: 'Superd'

        model1297: 'T20',
        // name: 'T20'

        model1298: 'Tempesta',
        // name: 'Tempesta'

        model1299: 'Turismo2',
        // name: 'Turismo II'

        model1300: 'Turismor',
        // name: 'Turismo R'

        model1301: 'Tyrus',
        // name: 'Tyrus'

        model1302: 'Vacca',
        // name: 'Vacca'

        model1303: 'Vagner',
        // name: 'Vagner'

        model1304: 'Voltic',
        // name: 'Voltic'

        model1305: 'Voltic2',
        // name: 'Voltic II'

        model1306: 'Zentorno',
        // name: 'Zentorno'

        model1307: 'Italigtb',
        // name: 'Itali GTB'

        model1308: 'Italigtb2',
        // name: 'Itali GTB 2'

        model1309: 'XA21',
        // name: 'XA21'

        model1310: 'ArmyTanker',
        // name: 'Army Tanker'

        model1311: 'ArmyTrailer',
        // name: 'Army Trailer'

        model1312: 'ArmyTrailer2',
        // name: 'Army Trailer II'

        model1313: 'BaleTrailer',
        // name: 'Bale Trailer'

        mode1314: 'BoatTrailer',
        // name: 'Boat Trailer'

        model1315: 'CableCar',
        // name: 'Cable Car'

        model1316: 'DockTrailer',
        // name: 'Dock Trailer'

        model1317: 'GrainTrailer',
        // name: 'Grain Trailer'

        model1318: 'PropTrailer',
        // name: 'Prop Trailer'

        model1319: 'RakeTrailer',
        // name: 'Rake Trailer'

        model1320: 'TR2',
        // name: 'Trailer Empty'

        model1321: 'TR3',
        // name: 'Boat Trailer Boat Attached'

        model1322: 'TR4',
        // name: 'Car Trailer Full'

        model1323: 'TRFlat',
        // name: 'Flat Trailer'

        model1324: 'TVTrailer',
        // name: 'TV Trailer'

        model1325: 'Tanker',
        // name: 'Tanker'

        model1326: 'Tanker2',
        // name: 'Tanker II'

        model1327: 'TrailerLogs',
        // name: 'TrailerLogs'

        model1328: 'TrailerSmall',
        // name: 'TrailerSmall'

        model1329: 'Trailers',
        // name: 'Trailers'

        model1330: 'Trailers2',
        // name: 'Trailers2'

        model1331: 'Trailers3',
        // name: 'Trailers3'

        model1332: 'Freight',
        // name: 'Freight'

        model1334: 'FreightCar',
        // name: 'FreightCar'

        model1335: 'FreightCont1',
        // name: 'FreightCont1'

        model1336: 'FreightCont2',
        // name: 'FreightCont2'

        model1337: 'FreightGrain',
        // name: 'FreightGrain'

        model1338: 'FreightTrailer',
        // name: 'FreightTrailer'

        model1339: 'TankerCar',
        // name: 'TankerCar'

        model1340: 'Caddy',
        // name: 'Caddy'

        model1341: 'Caddy2',
        // name: 'Caddy2'

        model1342: 'Caddy3',
        // name: 'Caddy3'

        model1343: 'Docktug',
        // name: 'Docktug'

        model1344: 'Forklift',
        // name: 'Forklift'

        model1345: 'Mower',
        // name: 'Mower'

        model1346: 'Ripley',
        // name: 'Ripley'

        model1347: 'Sadler',
        // name: 'Sadler'

        model1348: 'Scrap',
        // name: 'Scrap'

        model1349: 'TowTruck',
        // name: 'TowTruck'

        model1350: 'TowTruck2',
        // name: 'TowTruck2'

        model1351: 'Tractor',
        // name: 'Tractor'

        model1352: 'Tractor2',
        // name: 'Tractor2'

        model1353: 'Tractor3',
        // name: 'Tractor3'

        model1354: 'TrailerLarge',
        // name: 'TrailerLarge'

        model1355: 'TrailerS4',
        // name: 'TrailerS4'

        model1356: 'UtilliTruck',
        // name: 'UtilliTruck'

        model1357: 'UtilliTruck3',
        // name: 'UtilliTruck3'

        model1358: 'UtilliTruck2',
        // name: 'UtilliTruck2'

        model1359: 'Bison',
        // name: 'Bison'

        model1360: 'Bison2',
        // name: 'Bison2'

        model1361: 'Bison3',
        // name: 'Bison3'

        model1362: 'BobcatXL',
        // name: 'BobcatXL'

        model1363: 'Boxville',
        // name: 'Boxville'

        model1364: 'Boxville2',
        // name: 'Boxville2'

        model1365: 'Boxville3',
        // name: 'Boxville3'

        model1366: 'Boxville4',
        // name: 'Boxville4'

        model1367: 'Boxville5',
        // name: 'Boxville5'

        model1368: 'Burrito',
        // name: 'Burrito'

        model1369: 'Burrito2',
        // name: 'Burrito2'

        model1370: 'Burrito3',
        // name: 'Burrito3'

        model1371: 'Burrito4',
        // name: 'Burrito4'

        model1372: 'Burrito5',
        // name: 'Burrito5'

        model1373: 'Camper',
        // name: 'Camper'

        model1374: 'GBurrito',
        // name: 'GBurrito'

        model1375: 'GBurrito2',
        // name: 'GBurrito2'

        model1376: 'Journey',
        // name: 'Journey'

        model1377: 'Minivan',
        // name: 'Minivan'

        model1378: 'Minivan2',
        // name: 'Minivan2'

        model1379: 'Paradise',
        // name: 'Paradise'

        model1380: 'Pony',
        // name: 'Pony'

        model1381: 'Pony2',
        // name: 'Pony2'

        model1382: 'Rumpo',
        // name: 'Rumpo'

        model1383: 'Rumpo2',
        // name: 'Rumpo2'

        model1384: 'Rumpo3',
        // name: 'Rumpo3'

        model1385: 'Speedo',
        // name: 'Speedo'

        model1386: 'Speedo2',
        // name: 'Speedo2'

        model1387: 'Surfer',
        // name: 'Surfer'

        model1388: 'Surfer2',
        // name: 'Surfer2'

        model1389: 'Taco',
        // name: 'Taco'

        model1390: 'Youga',
        // name: 'Youga'

        model1391: 'Youga2',
        
        model1392: 'exor',
        // name: 'Youga2'
    },
]

STR.register("showroom:getCarConfig", async(pData) => {
    return vehicleList
});

STR.register("rd:admin:cloak", async(pCloak) => {
    const src = source
    emitNet('rd-admin:cloakList', src, pCloak)
    return
});

