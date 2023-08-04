fx_version "cerulean"

description "Striez - Vehicles"
author "Striez"
version '0.0.1'

game "gta5"

server_script {
    '@fyx/server/lib.js',
    '@rd-lib/server/sv_rpcs.js',
    '@rd-lib/server/sv_sql.js',
    '@rd-lib/server/sv_rpcs.lua',
    'dist/server/**/*.js',
    'server/sv_*.lua',
}

client_script {
    '@fyx/client/lib.js',
    '@rd-lib/client/cl_rpcs.js',
    '@rd-lib/client/cl_ui.js',
    '@rd-lib/client/cl_rpcs.lua',
    '@rd-lib/client/cl_ui.lua',
    'client/cl_*.lua',
    'dist/client/**/*.js',
}