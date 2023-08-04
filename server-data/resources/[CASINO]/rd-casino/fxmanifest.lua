fx_version "cerulean"
games { "gta5" }


client_scripts {
    "@rd-sync/client/lib.lua",
    '@rd-lib/client/cl_ui.lua',
    '@rd-lib/client/cl_ui.lua',
    "@rd-lib/client/cl_polyhooks.lua",
    "@rd-locales/client/lib.lua",
    "@rd-lib/client/cl_rpc.lua",
    "client/*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua", 
    "@rd-lib/server/sv_rpc.lua",
    "server/*",
}


shared_scripts {
    "shared/*",
} 
