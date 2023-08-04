fx_version "cerulean"
games { "gta5" }

--[[ dependencies {
  "rd-lib",
  "PolyZone",
  "rd-ui"
} ]]--

client_script "@rd-lib/client/cl_ui.lua"

client_scripts {
  "@rd-locales/client/lib.lua",
  "@rd-lib/client/cl_rpcs.lua",
  "client/cl_*.lua",
  "@PolyZone/client.lua",
  "@PolyZone/ComboZone.lua",
}

shared_script {
  "@rd-lib/shared/sh_util.lua",
  "shared/sh_*.*",
}

server_scripts {
  "@rd-lib/server/sv_asyncExports.lua",
  "@rd-lib/server/sv_rpcs.lua",
  "@rd-lib/server/sv_sql.lua",
  "server/sv_*.lua",
  "server/sv_*.js",
}
