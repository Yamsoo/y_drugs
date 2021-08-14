fx_version 'adamant'
games { 'gta5' };

client_scripts {
    "RageUI/RMenu.lua",
    "RageUI/menu/RageUI.lua",
    "RageUI/menu/Menu.lua",
    "RageUI/menu/MenuController.lua",
    "RageUI/components/*.lua",
    "RageUI/menu/elements/*.lua",
    "RageUI/menu/items/*.lua",
    "RageUI/menu/panels/*.lua",
    "RageUI/menu/windows/*.lua",

}

client_scripts {
    '@es_extended/locale.lua',
    'client/farms/coke.lua',
    'client/farms/opium.lua',
    'client/farms/weed.lua',
    'client/farms/meth.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server/server.lua'
}

shared_script {
    "config.lua"
}