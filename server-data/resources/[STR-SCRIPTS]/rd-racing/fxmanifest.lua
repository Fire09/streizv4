fx_version 'bodacious'
game 'gta5'

resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_script "@rd-errorlog/client/cl_errorlog.lua"

ui_page 'html/ui.html'
files {
	'html/css/balloon.min.css',
	'html/css/all.min.css',
	'html/ui.html',
	'html/css/materialize.min.css',
	'html/css/*.css',
	'html/js/*.js',
	'html/images/*.png',
	'html/images/*.jpg',
	'html/images/*.svg',
	
	'html/wallpapers/*.png',
	'html/wallpapers/*.jpg',
	'html/wallpapers/*.svg',

	'html/images/cursor.png',
	'html/images/background.png',	
	'html/images/phone-shell.png',
	'html/images/phone-background.jpg',
	'html/images/gurgle.png',
	'html/images/pager.png',
	'html/webfonts/fa-brands-400.eot',
	'html/webfonts/fa-brands-400.svg',
	'html/webfonts/fa-brands-400.ttf',
	'html/webfonts/fa-brands-400.woff',
	'html/webfonts/fa-brands-400.woff2',
	'html/webfonts/fa-regular-400.eot',
	'html/webfonts/fa-regular-400.svg',
	'html/webfonts/fa-regular-400.ttf',
	'html/webfonts/fa-regular-400.woff',
	'html/webfonts/fa-regular-400.woff2',
	'html/webfonts/fa-solid-900.eot',
	'html/webfonts/fa-solid-900.svg',
	'html/webfonts/fa-solid-900.ttf',
	'html/webfonts/fa-solid-900.woff',
	'html/webfonts/fa-solid-900.woff2',
}

client_scripts {
	'@rd-lib/client/cl_rpc.lua',
	'client/main.lua',
	'extras/cl_*.lua',
}

server_script '@rd-lib/server/sv_rpc.lua'
server_script '@rd-lib/server/sv_sql.lua'
server_script "server/main.lua"