fx_version "cerulean"

description "riddle - Hud"
author "riddle"
version '0.0.1'

lua54 'yes'

game "gta5"

ui_page 'web/build/index.html'

client_scripts {
  "@rd-lib/client/cl_rpc.lua",
  "client/cl_exports.lua",
  "client/cl_main.lua",
  "client/cl_utils.lua",
  "client/model/cl_*.lua"
}

server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "@rd-lib/server/sv_rpc.lua",
  "@rd-lib/server/sv_sql.lua",
  "server/sv_*.lua"
}

files {
  'web/build/index.html',
  'web/build/**/*'
}

exports {
	'BuffIntel',
	'BuffStress',
	'BuffLuck',
	'BuffHunger',
  'BuffThirst',
	'BuffAlert',
}