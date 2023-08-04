fx_version 'cerulean'
games {'gta5'}

client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script "@stx/shared/lib.lua"

client_script "@rd-errorlog/client/cl_errorlog.lua"
client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"

server_script "@rd-lib/server/sv_asyncExports.lua"

shared_script "@rd-lib/shared/sh_util.lua"

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  'client/cl_*.lua'
}

server_scripts {
  '@rd-lib/server/sv_sql.lua',
  '@rd-lib/server/sv_rpc.lua',
  'server/sv_*.lua'
}
