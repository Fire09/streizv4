fx_version 'cerulean'
game 'common'

name 'oxmysql'
description 'Database wrapper for FXServer utilising node-mysql2 offering improved performance and security.'
version '2.5.1'
url 'https://github.com/overextended/oxmysql'
author 'overextended'

dependencies {
	'/server:5104',
}

client_script 'ui.lua'
server_script 'dist/build.js'

files {
	'ui/build/index.html',
	'ui/build/**/*'
}

ui_page 'ui/build/index.html'

provide 'mysql-async'
provide 'oxmysql'

convar_category 'oxmysql' {
	'Configuration',
	{
		{ 'Connection string', 'mysql_connection_string', 'CV_STRING', 'mysql://root:@127.0.0.1/riddlev' },
		{ 'Debug', 'mysql_debug', 'CV_BOOL', 'false' }
	}
}
