fx_version 'cerulean'
games { 'gta5' }

dependencies {
  "mka-lasers"
}

client_scripts {
  '@rd-errorlog/client/cl_errorlog.lua',
  '@rd-sync/client/lib.lua',
  '@rd-lib/client/cl_rpcs.lua',
  '@rd-lib/client/cl_ui.lua',
  '@rd-lib/client/cl_animTask.lua',
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/ComboZone.lua',
  '@mka-lasers/client/client.lua',
  '@mka-grapple/client.lua',
  'client/cl_*.lua',
}

shared_script {
  '@rd-lib/shared/sh_util.lua',
  '@rd-lib/shared/sh_cacheable.lua',
  'shared/sh_*.*',
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  '@rd-lib/server/sv_rpcs.lua',
  '@rd-lib/server/sv_sql.lua',
  '@rd-lib/server/sv_sql.js',
  '@rd-lib/server/sv_asyncExports.js',
  '@rd-lib/server/sv_asyncExports.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}
