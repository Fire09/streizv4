lua54 'yes'
fx_version "cerulean"
games { 'gta5' }

author 'G&N_s Studio'
description 'Medic_Center'
version '1.1.3'

dependencies {
    '/server:4960',
    '/gameBuild:2189',
    'cfx_gn_collection',
    'cfx_gn_medical_assets',
    'cfx_gn_ambulance_garage'
}

client_script {
    "main.lua"
}
this_is_a_map 'yes'

escrow_ignore {
    'stream/ytd/*.ytd',
    'stream/cls/*.ydr',
    'stream/cls/*.ymap',
    'stream/pillbox/*.ydr',
    'stream/pillbox/*.ymap'
}
dependency '/assetpacks'