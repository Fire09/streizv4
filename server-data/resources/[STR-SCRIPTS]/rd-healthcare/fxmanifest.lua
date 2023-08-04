fx_version 'cerulean'

games {
  'gta5',
  'rdr3'
}

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  '@rd-locales/client/lib.lua',
  '@rd-lib/client/cl_rpcs.lua',
  '@rd-lib/client/cl_animTask.lua',
  'client/cl_*.lua'
}

shared_scripts {
  '@rd-lib/shared/sh_util.lua',
  "shared/sh_*.lua"
}

server_scripts {
  '@rd-lib/server/sv_asyncExports.lua',
  '@rd-lib/server/sv_rpcs.lua',
  '@rd-lib/server/sv_sql.lua',
  'server/sv_*.lua'
}