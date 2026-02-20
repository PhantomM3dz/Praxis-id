RegisterNetEvent('praxis-id:oxNotify', function(data)
    if not lib or not lib.notify then
        print('[praxis-id] ox_lib not found (lib.notify missing).')
        return
    end

    lib.notify({
        id = data.id,
        title = data.title,
        description = data.description,
        type = data.type,
        duration = data.duration,
        position = data.position,
        showDuration = data.showDuration,
        style = data.style,
        icon = data.icon,
        iconColor = data.iconColor
    })
end)