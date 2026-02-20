Config = {}

--=============================
-- Branding (for release)
--=============================
Config.Server = "Praxis Roleplay"   -- your server name / brand (used in titles)

--=============================
-- Notify Provider (global default)
--=============================
-- Pick ONE:
--   "x_advanced"  -> exports['X_HUD_AdvancedNotify']:NotifyPlayerAdvanced(...)
--   "x_simple"    -> exports['X_HUD_Notify']:NotifyPlayer(...)
--   "mythic"      -> TriggerClientEvent('mythic_notify:client:SendAlert', ...)
--   "okok"        -> TriggerClientEvent('okokNotify:Alert', ...)
--   "ox_lib"      -> client event -> lib.notify(...)
Config.Notify = "x_advanced"

--=============================
-- Cooldown
--=============================
Config.CooldownSeconds = 10

--=============================
-- Commands (simple booleans)
--=============================
Config.luckynumber  = true
Config.magicnumber  = true
Config.magic        = true
Config.id           = false  -- /id often conflicts with other scripts
Config.ping         = true

--=============================
-- Command Aliases / Behavior
--=============================
-- mode: "id" | "ping" | "id_ping"
Config.CommandSettings = {
    luckynumber = {
        aliases  = { "luckynumber", "lucky", "mylucky" },
        mode     = "id_ping",
        subtitle = "Lucky Number",
        provider = nil, -- nil = use Config.Notify, or set per-command provider string here
    },

    magicnumber = {
        aliases  = { "magicnumber", "mymagicnumber" },
        mode     = "id_ping",
        subtitle = "Magic Number",
        provider = nil,
    },

    magic = {
        aliases  = { "magic", "mymagic" },
        mode     = "id_ping",
        subtitle = "Magic Number",
        provider = nil,
    },

    id = {
        aliases  = { "id", "myid" },
        mode     = "id_ping",
        subtitle = "Your Info",
        provider = nil,
    },

    ping = {
        aliases  = { "ping", "myping" },
        mode     = "ping",
        subtitle = "Your Ping",
        provider = nil,
    },
}

--=============================
-- Notify Styles (per provider)
--=============================
Config.Style = {}

-- X_HUD Advanced
Config.Style.x_advanced = {
    type     = "info",
    duration = 5000,
    color    = "#3A86FF",
}

-- X_HUD Simple (server-side NotifyPlayer)
Config.Style.x_simple = {
    type     = "info",
    duration = 5000,
    icon     = nil,      -- optional
    color    = nil,      -- optional
}

-- Mythic Notify
Config.Style.mythic = {
    type     = "inform",
    duration = 2500,
    style    = { ['background-color'] = '#141517', ['color'] = '#C1C2C5' } -- optional
}

-- okokNotify
Config.Style.okok = {
    title     = nil,     -- nil = use Config.Server
    type      = "info",
    time      = 5000,
    playSound = false
}

-- ox_lib notify (runs on client)
Config.Style.ox_lib = {
    type     = "inform",
    duration = 5000,
    position = "top",
    style = {
        backgroundColor = '#141517',
        color = '#C1C2C5',
        ['.description'] = { color = '#909296' }
    },
    icon      = nil,
    iconColor = nil
}

--=============================
-- Cooldown Notify (message + styling)
--=============================
Config.Cooldown = {
    subtitle = "Cooldown",
    message  = "Please wait %ds.",
    provider = nil, -- nil = use Config.Notify
}

-- Optional: if you want cooldown to look different
Config.CooldownStyle = {
    x_advanced = { type = "warning", duration = 2500, color = "#FFD700" },
    x_simple   = { type = "warning", duration = 2500, icon = nil, color = nil },
    mythic     = { type = "inform",  duration = 2500, style = { ['background-color']='#FFD700', ['color']='#000000' } },
    okok       = { type = "warning", time = 2500, playSound = false, title = nil },
    ox_lib     = { type = "warning", duration = 2500, position = "top" },
}