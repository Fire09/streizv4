fx_version "cerulean"

description "Byte Development | Sprays"
author "Aspect#2566"
version '0.0.1'

game "gta5"

client_script {
    '@rd-lib/client/cl_ui.js',
    '@rd-lib/client/cl_rpcs.js',
    'client/*.js',
    'client/*.lua'
}

server_script {
    '@rd-lib/server/sv_rpcs.js',
    '@rd-lib/server/sv_rpcs.lua',
    '@rd-lib/server/sv_sql.js',
    'server/*.js',
    'server/*.lua'
}