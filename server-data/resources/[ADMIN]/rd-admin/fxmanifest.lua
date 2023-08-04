fx_version "cerulean"
games { "gta5" }

shared_script {
    "@rd-lib/shared/sh_util.lua",
    "@rd-lib/shared/sh_cacheable.js",
}

server_scripts {
    "@rd-lib/server/sv_npx.js",
    "@rd-lib/server/sv_rpcs.js",
    "@rd-lib/server/sv_rpcs.lua",
    "@rd-lib/server/sv_sql.js",
    "@rd-lib/server/sv_sql.lua",
    "@fyx/server/lib.js",
    "server/*",
}

client_scripts {
    "@fyx/client/lib.js",
    "@rd-lib/client/cl_rpcs.js",
    "client/*",
}
