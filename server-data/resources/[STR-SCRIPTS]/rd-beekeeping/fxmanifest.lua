fx_version 'cerulean'
games { 'gta5' }

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-lib/client/cl_polyhooks.lua"
client_script "@rd-locales/client/lib.lua"

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  "@PolyZone/client.lua",
}

shared_script {
  '@rd-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_scripts {
  '@rd-lib/server/sv_rpc.lua',
  '@rd-lib/server/sv_sql.lua',
  '@rd-lib/server/sv_asyncExports.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}
