fx_version 'cerulean'
game 'gta5'

version '1.0.0'

lua54 'yes'

shared_script "@np-lib/shared/sh_cacheable.lua"

client_script "@rd-lib/client/cl_ui.lua"
client_script "@rd-errorlog/client/cl_errorlog.lua"

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  '@rd-lib/client/cl_rpcs.lua',
  '@rd-lib/client/cl_animTask.lua',
  '@rd-sync/client/lib.lua',
  'client/cl_*.lua'
}

shared_scripts {
  '@np-lib/shared/sh_util.lua',
  'shared/sh_*.*'
}

server_script '@rd-lib/server/sv_infinity.lua'

server_scripts {
    '@rd-lib/server/sv_rpc.lua',
    '@rd-lib/server/sv_rpcs.lua',
    '@rd-lib/server/sv_sql.lua',
    "@oxmysql/lib/MySQL.lua",
    'server/sv_*.lua'
}