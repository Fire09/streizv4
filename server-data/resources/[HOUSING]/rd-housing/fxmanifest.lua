fx_version "cerulean"
games { "gta5" }

client_script "@rd-lib/client/cl_ui.lua"

shared_scripts {
	"@rd-lib/shared/sh_util.lua",
	"shared/*",
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"@rd-lib/server/sv_rpcs.lua",
    "server/*",
}

client_scripts {
	'@rd-lib/client/cl_ui.lua',
	"@rd-lib/client/cl_rpcs.lua",
	"client/*",
}

export "unlock"
export "lock"
export "setGps"
export "retriveHousingTable"
export "isNearProperty"
export "isInRobbery"
export "retrieveHousingTableMapped"
export "currentLocation"
export "buyProperty"
export "enterEdit"
export "exitEdit"
export "setInventory"
export "getCurrentPropertyID"