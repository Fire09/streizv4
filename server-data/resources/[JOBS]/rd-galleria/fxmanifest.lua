fx_version 'cerulean'
games { 'gta5' }

client_script "@rd-lib/client/cl_ui.lua"
client_script "@stx/client/lib.js"
server_script "@stx/server/lib.js"
shared_script '@stx/shared/lib.lua'

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
}

server_scripts {
  '@rd-lib/server/sv_sql.lua',
  "@rd-lib/server/sv_asyncExports.lua",
  'server/sv_*.lua',
  'server/sv_*.js',
}
