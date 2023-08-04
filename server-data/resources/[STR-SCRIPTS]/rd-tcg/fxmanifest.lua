fx_version "cerulean"
games { "gta5" }

ui_page "html/index.html"

files {
    "html/*.html",
    "html/*.js",
    "html/*.css",
}

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"

shared_script {
    '@rd-lib/shared/sh_util.lua',
    'shared/sh_*.*',
  }

server_scripts {
    '@rd-lib/server/sv_rpc.lua',
    '@rd-lib/server/sv_sql.lua',
    'server/sv_*.lua',
  }

  client_scripts {
    '@rd-lib/client/cl_rpc.lua',
    'client/cl_*.lua',
    "@PolyZone/client.lua",
  }