fx_version 'cerulean'

games { 'gta5' }

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  'client/cl_*.lua',
}

server_scripts {
  '@rd-lib/server/sv_sql.lua',
  'server/sv_*.lua',
}

