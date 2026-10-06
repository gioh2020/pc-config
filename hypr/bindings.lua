-- Personal keybinding overrides (Omarchy 4+ / Hyprland Lua). Copy to ~/.config/hypr/bindings.lua
-- (or append below the default comments). Shared by laptop and desktop.

-- Clipboard manager on Super + V (was: Universal paste; Super+Ctrl+V was the clipboard manager)
hl.unbind("SUPER + V")
hl.unbind("SUPER + CTRL + V")
o.bind("SUPER + V", "Clipboard manager", "omarchy-shell shell toggle omarchy.clipboard")

-- Close the current Chrome tab from anywhere
o.bind("SUPER + ALT + W", "Close browser tab", hl.dsp.send_shortcut({ mods = "CTRL", key = "W", window = "class:^(google-chrome)$" }))

-- Restore pre-Omarchy 4 launcher keys (Omarchy 4 swapped them):
-- Super+Space was "Omarchy menu", Super+Alt+Space was "Apps menu"
hl.unbind("SUPER + SPACE")
hl.unbind("SUPER + ALT + SPACE")
o.bind("SUPER + SPACE", "Apps menu", "omarchy-menu toggle apps")
o.bind("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu toggle")

-- Apps removed by apps/setup.sh: drop their default keys
hl.unbind("SUPER + SHIFT + A")        -- ChatGPT
hl.unbind("SUPER + SHIFT + C")        -- HEY Calendar
hl.unbind("SUPER + SHIFT + E")        -- HEY Email
hl.unbind("SUPER + SHIFT + ALT + E")  -- HEY New email
hl.unbind("SUPER + SHIFT + ALT + G")  -- WhatsApp
hl.unbind("SUPER + SHIFT + CTRL + G") -- Google Messages
hl.unbind("SUPER + SHIFT + P")        -- Google Photos
hl.unbind("SUPER + SHIFT + S")        -- Google Maps
hl.unbind("SUPER + SHIFT + X")        -- X
hl.unbind("SUPER + SHIFT + ALT + X")  -- X Post
hl.unbind("SUPER + SHIFT + Y")        -- YouTube
hl.unbind("SUPER + SHIFT + O")        -- Obsidian
hl.unbind("SUPER + SHIFT + W")        -- Omawrite
hl.unbind("SUPER + SHIFT + ALT + M")  -- Music TUI (cliamp)
hl.unbind("SUPER + CTRL + Q")         -- Calculator (omacalc)
hl.unbind("XF86Calculator")           -- Calculator (omacalc)
