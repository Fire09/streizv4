fx_version 'cerulean'
game 'gta5'

author 'np'
description 'rd-camera'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css',
}


client_scripts {
    "@rd-lib/client/cl_rpc.lua",
	'client.lua',
} 
server_scripts {
    "@rd-lib/server/sv_rpc.lua",
	'server.lua',
}

lua54 'yes'