fx_version 'adamant'
game 'common'

name 'rd-db'
description 'Striez Database Script'
author 'Striez'
version '0.0.1'
url ''

client_script {
  'client/client.js',
  'client/client.lua',
}

server_scripts {
  'server/server.js',
  'server/server.lua',
}

files {
  'nui/index.html',
  'nui/js/app.js',
  'nui/css/app.css',
  'nui/fonts/*.woff',
  'nui/fonts/*.woff2',
  'nui/fonts/*.eot',
  'nui/fonts/*.ttf',
}

ui_page 'nui/index.html'
