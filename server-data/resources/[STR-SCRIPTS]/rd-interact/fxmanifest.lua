fx_version "cerulean"

games {"gta5"}

description "riddle Peek Interactions"


client_script "@fyx/client/lib.js"
server_script "@fyx/server/lib.js"
shared_script "@fyx/shared/lib.lua"

shared_scripts {
	"shared/sh_*.lua",
}

server_scripts {
	"server/sv_*.lua",
}
client_script "@rd-locales/client/lib.lua"
client_script "@mka-array/Array.lua"
client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
	"client/cl_*.lua",
	'@rd-lib/client/cl_rpc.lua',
	"client/entries/cl_*.lua",
}
