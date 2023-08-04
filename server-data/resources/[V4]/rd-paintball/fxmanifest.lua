fx_version 'cerulean'
games { 'gta5' }

--[[ dependencies {
  "rd-polyzone",
  "rd-lib",
  "rd-ui"
} ]]--

ui_page "ui/index.html"

client_script "@rd-sync/client/lib.lua"
client_script "@rd-lib/client/cl_ui.lua"

client_script "@fyx/client/lib.js"
server_script "@fyx/server/lib.js"
shared_script "@fyx/shared/lib.lua"

files({
    "ui/index.html",
    "ui/js/*.js",
    "ui/css/*.css",
})

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  'client/cl_*.lua',
  'client/cl_*.js',
  "@PolyZone/client.lua",
  "@PolyZone/ComboZone.lua",
}

shared_script {
  '@rd-lib/shared/sh_util.lua',
  'shared/sh_*.*',
}

server_script "@rd-lib/server/sv_npx.js"
server_scripts {
  '@rd-lib/server/sv_asyncExports.lua',
  '@rd-lib/server/sv_rpc.lua',
  '@rd-lib/server/sv_rpc.js',
  '@rd-lib/server/sv_sql.lua',
  '@rd-lib/server/sv_sql.js',
  'server/sv_*.lua',
  'server/sv_*.js',
}
