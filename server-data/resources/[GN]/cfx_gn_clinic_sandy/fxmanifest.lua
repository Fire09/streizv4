lua54 'yes'
fx_version "cerulean"
games { 'gta5' }

author 'G&N_s Studio'
description 'Sandy Shore Clinic Center'
version '1.2.3'

dependencies {
    '/server:4960',
    '/gameBuild:2189',
    'cfx_gn_collection',
    'cfx_gn_medical_assets',
    'cfx_gn_medical_accessories',
    "cfx_gn_int_clinic" ,
    'cfx_gn_ambulance_garage'
}

this_is_a_map 'yes'

escrow_ignore {
    'stream/interior/*.ytd',
    'stream/meta/*.ymap'
}
dependency '/assetpacks'