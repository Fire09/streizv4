fx_version "cerulean"
games { "gta5" }

lua54 'yes'

client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"

client_script "@rd-lib/client/cl_ui.lua"
client_scripts {
    "@rd-errorlog/client/cl_errorlog.lua",
    '@rd-sync/client/lib.lua',
    "@rd-lib/client/cl_rpc.lua",
    "@rd-locales/client/lib.lua",
    '@mka-lasers/client/client.lua',
    "client/cl_*.lua",
    "business/**/cl_*.lua",
}

shared_script {
    "@rd-lib/shared/sh_util.lua",
    "shared/sh_*.*",
    "business/**/sh_*.lua",
}

server_scripts {
    "config.lua",
    "@rd-lib/server/sv_asyncExports.lua",
    "@rd-lib/server/sv_rpc.lua",
    "@rd-lib/server/sv_sql.lua",
    "server/sv_*.lua",
    "business/**/sv_*.lua",
}

