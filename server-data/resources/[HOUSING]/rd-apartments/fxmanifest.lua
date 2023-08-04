fx_version 'cerulean'
games { 'gta5' }

dependencies {
  "PolyZone"
}

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  "@PolyZone/client.lua",
  "@PolyZone/BoxZone.lua",
  "@PolyZone/CircleZone.lua",
  "@PolyZone/ComboZone.lua",
  "@PolyZone/EntityZone.lua",
  '@rd-errorlog/client/cl_errorlog.lua',
  '@rd-lib/client/cl_rpc.lua',
  "@rd-locales/client/lib.lua",
  "config.lua",
  'client/cl_*.lua'
}


shared_script 'shared/sh_*.*'

server_scripts {
    '@rd-lib/server/sv_rpc.lua',
    '@rd-lib/server/sv_sql.lua',
    'server/sv_*.lua',
}

export "getModule"