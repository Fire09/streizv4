








fx_version "cerulean"

games { "gta5" }

description "Sanyo Fiber"

version "0.1.0"

ui_page 'nui/index.html'

files {
    'nui/**/*',
}

server_scripts {
    "@rd-lib/server/sv_npx.js",
    "@rd-lib/server/sv_rpc.js",
    "@rd-lib/server/sv_sql.js",
    "@rd-lib/shared/sh_cacheable.js",
    "@rd-lib/server/sv_asyncExports.js",
    "server/*.js",
}

client_scripts {
    "@rd-lib/client/cl_rpc.js",
    "client/*.js",
}
