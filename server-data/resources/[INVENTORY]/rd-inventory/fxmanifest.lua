fx_version "cerulean"
games { "gta5" }

ui_page "nui/ui.html"

files {
    "nui/ui.html",
    "nui/pricedown.ttf",
    "nui/default.png",
    "nui/background.png",
    "nui/weight-hanging-solid.png",
    "nui/hand-holding-solid.png",
    "nui/search-solid.png",
    "nui/invbg.png",
    "nui/styles.css",
    "nui/i18n.js",
    "nui/scripts.js",
    "nui/debounce.min.js",
    "nui/purify.min.js",
    "nui/loading.gif",
    "nui/loading.svg",
    "nui/icons/*"
  }

shared_scripts {
    "@rd-lib/shared/sh_util.lua",
    "@rd-lib/shared/sh_cacheable.js",
    "shared/sh_*.*",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "@rd-lib/server/sv_rpc.lua",
    "server/sv_clean.js",
    "server/sv_shops.js",
    "server/sv_main.js",
    "server/sv_*.*",
}

client_scripts {
    "@PolyZone/client.lua",
    "@rd-lib/client/cl_rpc.js",
    "@rd-lib/client/cl_rpc.lua",
    "@rd-lib/client/cl_ui.lua",
    "client/cl_main.js",
    "client/cl_*.*",
}

exports{
    'getFreeSpace',
    'hasEnoughOfItem',
    'getQuantity',
    'GetCurrentWeapons',
    'GetItemInfo',
    'GetInfoForFirstItemOfName',
    'getFullItemList',
  }