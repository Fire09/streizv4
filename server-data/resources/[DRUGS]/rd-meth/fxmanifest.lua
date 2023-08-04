fx_version 'cerulean'

games { 'gta5' }
shared_script {
  "@rd-lib/server/sv_rpc.lua",
  "@rd-lib/server/sv_sql.lua",
  "@rd-lib/server/sv_asyncExports.lua"
}

client_scripts {
  "@rd-sync/client/lib.lua",
  '@rd-lib/client/cl_ui.lua',
  "@rd-lib/client/cl_polyhooks.lua",
  "@rd-locales/client/lib.lua",
  "@rd-lib/client/cl_rpc.lua",
  'client/cl_*.lua',
  "@PolyZone/client.lua",
}

server_scripts {
  "@rd-lib/server/sv_rpc.lua",
  'server/sv_*.lua',
  'server/sv_*.js',
  'build-server/sv_*.js',
}
  