fx_version "cerulean"

description "Void - Phone"
author "cool"
version '0.0.1'

lua54 'yes'

game "gta5"

ui_page 'web/build/index.html'

client_scripts {
  "@rd-lib/client/cl_rpc.lua",
  "@rd-lib/client/cl_ui.lua",
  "client/cl_*.lua"
}

server_scripts {
  "@rd-lib/server/sv_rpc.lua",
  "@rd-lib/server/sv_sql.lua",
  "server/sv_*.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*'
}