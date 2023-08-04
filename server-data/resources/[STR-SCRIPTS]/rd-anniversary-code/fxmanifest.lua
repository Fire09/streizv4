fx_version 'cerulean'

game 'gta5'

shared_script "@stx/shared/lib.lua"

server_scripts {
    "@stx/server/lib.js",
    "@rd-lib/server/sv_asyncExports.lua",
    "server/sv_*.lua"
}

client_scripts {
    "@stx/client/lib.js",
    "client/cl_*.lua"
}
