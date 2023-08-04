fx_version "cerulean"
games { "gta5" }

shared_scripts {
    "shared/*",
}

server_scripts {
    "@rd-lib/server/sv_rpc.lua",
    "server/*",
}

client_scripts {
    "@rd-lib/client/cl_rpc.lua",
    '@rd-lib/client/cl_ui.lua',
    '@rd-errorlog/client/cl_errorlog.lua',
    '@rd-lib/client/cl_ui.lua',
    "client/*",
}