fx_version 'cerulean'
games { 'gta5' }

client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"

client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script '@rd-locales/client/lib.lua'
client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-lib/client/cl_rpc.lua"
server_script "@rd-lib/server/sv_rpc.lua"

client_scripts {
  'client/cl_*.lua',
}

shared_script {
  'sh_config.lua',
}

server_scripts {
  'server/sv_*.lua',
}
