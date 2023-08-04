fx_version "cerulean"

games {"gta5"}

description "riddle Vehicle Sync"

shared_scripts {
	"shared/sh_*.lua",
}

server_scripts {
	"@rd-lib/server/sv_infinity.lua",
	"server/sv_*.lua",
}

client_scripts {
	"client/tools/cl_*.lua",
	"client/controllers/cl_*.lua",
	"client/cl_*.lua",
}