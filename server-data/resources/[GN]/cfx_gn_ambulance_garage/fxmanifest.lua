lua54 'yes'
fx_version "cerulean"
games { 'gta5' }

author 'G&N_s Studio'
description 'Ambulance Garage'
version '1.2.1'

dependencies {
    '/server:4960',
    '/gameBuild:2189',
    'cfx_gn_collection'
}

this_is_a_map 'yes'

client_script {
    'gn_amb_gar_entityset.lua',
}

escrow_ignore {
    'stream/interior/*.ytd',
    'gn_amb_gar_entityset.lua',
}
dependency '/assetpacks'