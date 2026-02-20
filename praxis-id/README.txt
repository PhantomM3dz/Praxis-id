============================================================
Praxis ID & Ping Notify (Standalone)
============================================================

Lightweight standalone ID & ping command system with
multi-notify support, per-command toggles, and full config.

Built for modern FiveM servers.

------------------------------------------------------------
FEATURES
------------------------------------------------------------

- Standalone (no framework required)
- Per-command enable / disable
- Multiple command aliases
- Global cooldown system
- Server-side execution
- Multi-notify support:

  • X_HUD Advanced Notify
  • X_HUD Notify
  • Mythic Notify
  • okokNotify
  • ox_lib notify

- Per-command notify override (optional)
- Fully configurable styling
- Server branding support

------------------------------------------------------------
DEFAULT COMMANDS
------------------------------------------------------------

/luckynumber  → ID + ping
/magicnumber  → ID + ping
/magic        → ID + ping
/ping         → Ping only
/id           → Optional (disabled by default)

All commands can be turned on/off in config.lua.

------------------------------------------------------------
COOLDOWN
------------------------------------------------------------

Config.CooldownSeconds = 10

Prevents command spam.
Custom cooldown message supported.

------------------------------------------------------------
SERVER BRANDING
------------------------------------------------------------

Config.Server = "Your Server Name"

Used automatically in notification titles.

------------------------------------------------------------
NOTIFY SYSTEM
------------------------------------------------------------

Set your notify in config.lua:

Config.Notify = "x_advanced"

Available:

x_advanced
x_simple
mythic
okok
ox_lib

------------------------------------------------------------
INSTALLATION
------------------------------------------------------------

1. Place the resource in your resources folder
2. Add to server.cfg:

   ensure praxis-id

3. Configure config.lua
4. Restart your server

------------------------------------------------------------
PERFORMANCE
------------------------------------------------------------

- No loops
- Server-side handling
- Low memory usage

------------------------------------------------------------
COMPATIBILITY
------------------------------------------------------------

Works with any:

- Framework
- Standalone server
- HUD

------------------------------------------------------------
SUPPORT
------------------------------------------------------------

For support & updates:

Discord: ADD YOUR LINK HERE

------------------------------------------------------------
PRAXIS ROLEPLAY
------------------------------------------------------------

Developed for Praxis Roleplay — a structured,
immersive, story-driven FiveM experience focused on:

- Organized departments
- Active development
- Clean UI
- High performance

Join the city. Build your story.
https://discord.gg/X8yzjSVjax

------------------------------------------------------------
LICENSE
------------------------------------------------------------

Do not re-upload or claim as your own.
You may modify for your server.

------------------------------------------------------------
FUTURE UPDATES
------------------------------------------------------------

- Keybind support
- ID sharing to nearby players
- Player name toggle
- Location display option
- UI card version

============================================================