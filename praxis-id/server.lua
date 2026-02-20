local lastUseAt = {}

local function secondsRemaining(src)
    local cd = Config.CooldownSeconds or 10
    local last = lastUseAt[src]
    if not last then return 0 end
    local elapsed = os.time() - last
    local remaining = cd - elapsed
    if remaining < 0 then remaining = 0 end
    return remaining
end

local function buildMessage(src, mode)
    local ping = GetPlayerPing(src) or 0
    local id = src

    if mode == "id" then
        return ("ID: %d"):format(id)
    elseif mode == "ping" then
        return ("Ping: %d ms"):format(ping)
    else
        return ("ID: %d | Ping: %d ms"):format(id, ping)
    end
end

-- Provider functions (same as before, just reading new Config.Style)
local function notify_x_advanced(src, subtitle, message, style)
    if GetResourceState('X_HUD_AdvancedNotify') ~= 'started' then return false end
    exports['X_HUD_AdvancedNotify']:NotifyPlayerAdvanced(src, {
        title = Config.Server or "Server",
        subtitle = subtitle or "",
        message = message,
        type = style.type or "info",
        duration = style.duration or 5000,
        color = style.color
    })
    return true
end

local function notify_x_simple(src, message, style)
    if GetResourceState('X_HUD_Notify') ~= 'started' then return false end
    exports['X_HUD_Notify']:NotifyPlayer(
        src,
        message,
        style.type or "info",
        style.duration or 5000,
        style.icon,
        style.color
    )
    return true
end

local function notify_mythic(src, message, style)
    TriggerClientEvent('mythic_notify:client:SendAlert', src, {
        type = style.type or "inform",
        text = message,
        duration = style.duration,
        style = style.style
    })
    return true
end

local function notify_okok(src, message, style)
    TriggerClientEvent('okokNotify:Alert',
        src,
        style.title or (Config.Server or "Server"),
        message,
        style.time or 5000,
        style.type or "info",
        style.playSound or false
    )
    return true
end

local function notify_ox_lib(src, subtitle, message, style)
    TriggerClientEvent('praxis-id:oxNotify', src, {
        title = Config.Server or "Server",
        description = message,
        type = style.type or "inform",
        duration = style.duration or 5000,
        position = style.position or "top",
        style = style.style,
        icon = style.icon,
        iconColor = style.iconColor
    })
    return true
end

local function sendNotify(src, provider, subtitle, message, styleTable)
    if provider == "x_simple" then
        return notify_x_simple(src, message, styleTable)
    elseif provider == "mythic" then
        return notify_mythic(src, message, styleTable)
    elseif provider == "okok" then
        return notify_okok(src, message, styleTable)
    elseif provider == "ox_lib" then
        return notify_ox_lib(src, subtitle, message, styleTable)
    else
        return notify_x_advanced(src, subtitle, message, styleTable)
    end
end

local function getEnabledFlag(key)
    return Config[key] == true
end

local function runCommand(src, key)
    local cmd = Config.CommandSettings[key]
    if not cmd then return end

    local remaining = secondsRemaining(src)
    if remaining > 0 then
        local provider = Config.Cooldown.provider or Config.Notify
        local style = (Config.CooldownStyle and Config.CooldownStyle[provider]) or (Config.Style and Config.Style[provider]) or {}
        local msg = (Config.Cooldown.message or "Please wait %ds."):format(remaining)
        sendNotify(src, provider, Config.Cooldown.subtitle or "Cooldown", msg, style)
        return
    end

    lastUseAt[src] = os.time()

    local provider = cmd.provider or Config.Notify
    local style = (Config.Style and Config.Style[provider]) or {}
    local msg = buildMessage(src, cmd.mode or "id_ping")
    sendNotify(src, provider, cmd.subtitle or "", msg, style)
end

CreateThread(function()
    for key, cmd in pairs(Config.CommandSettings or {}) do
        if getEnabledFlag(key) and type(cmd.aliases) == "table" then
            for _, alias in ipairs(cmd.aliases) do
                RegisterCommand(alias, function(source)
                    runCommand(source, key)
                end, false)
            end
        end
    end
end)