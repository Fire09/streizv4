fx_version 'cerulean'
games { 'gta5' }

dependencies {
  "PolyZone"
}

client_scripts {
  "@PolyZone/client.lua",
  "@PolyZone/BoxZone.lua",
  "@PolyZone/CircleZone.lua",
  "@PolyZone/ComboZone.lua",
  "@PolyZone/EntityZone.lua",
  'client/cl_*.lua'
}

shared_script {
  '@rd-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_scripts {
  '@rd-lib/server/sv_rpc.lua',
  '@rd-lib/server/sv_sql.lua',
  'server/sv_*.lua',
  'server/sv_*.js',
}

exports{
  'AddBoxZone'
}