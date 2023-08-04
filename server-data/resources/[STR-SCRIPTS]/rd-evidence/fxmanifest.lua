fx_version 'cerulean'

games {'gta5'}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/site.css',
	'html/css/materialize.min.css',
	'html/js/site.js',
	'html/js/materialize.min.js',
	'html/js/moment.min.js',
	'html/images/bag_texture.png',
	'html/images/cursor.png'
	--[[
	'html/ui.html',
	'html/pricedown.ttf',
	'html/cursor.png',
	'html/background.png',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js']]--
}



shared_script '@rd-lib/shared/sh_cacheable.lua'

server_script '@rd-lib/server/sv_rpc.lua'

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	'server/sv_*.lua',
	'client/**/svm_*.lua',
}

client_script '@rd-lib/client/cl_rpc.lua'
client_script "@rd-errorlog/client/cl_errorlog.lua"

client_scripts	{
	'client/**/cl_*.lua',
	'client/**/clm_*.lua',
}

