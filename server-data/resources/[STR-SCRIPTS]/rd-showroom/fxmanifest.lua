fx_version 'cerulean'
games { 'gta5' }


ui_page 'html/ui.html'


files {
	'html/ui.html',
  'html/main.0355962e.chunk.css',
  'html/fonts/*.ttf',
	'html/*.js'
}

client_scripts {
  '@rd-lib/client/cl_rpc.lua',
  '@rd-lib/client/cl_ui.lua',
  'client/cl_*.lua',
  "@PolyZone/client.lua",
  "@PolyZone/ComboZone.lua",
}

shared_script {
  'shared/sh_*.*',
}

server_scripts {
  '@rd-lib/server/sv_rpc.lua',
  'server/sv_*.lua',
}
