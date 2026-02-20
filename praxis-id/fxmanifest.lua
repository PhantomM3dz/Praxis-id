fx_version 'cerulean'
game 'gta5'

name 'praxis-id'
description 'Praxis - ID/Ping Notifications (Multi-Provider)'
author 'Praxis'
version '1.0.2'

shared_scripts { 'config.lua' }

server_scripts { 'server.lua' }

client_scripts { 'client.lua' } -- only used if provider = ox_lib