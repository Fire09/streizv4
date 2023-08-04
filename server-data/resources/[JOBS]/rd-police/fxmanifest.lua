fx_version 'cerulean'
games {'gta5'}

client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"
client_script '@rd-sync/client/lib.lua'

client_script "@rd-lib/client/cl_polyhooks.lua"
--[[ dependencies {
  'rd-lib'
} ]]--

-- General


shared_script {
    "@rd-lib/shared/sh_util.lua",
    "shared/*",
}

server_scripts {
    "@rd-lib/server/sv_rpc.lua",
    "@oxmysql/lib/MySQL.lua",
    "server/*",
}

client_scripts {
    "@rd-sync/client/cl_lib.lua",
    "@rd-lib/client/cl_rpc.lua",
    "@rd-lib/client/cl_state.lua",
    '@rd-lib/client/cl_ui.lua',
    "client/*",
}

-- Manifest


