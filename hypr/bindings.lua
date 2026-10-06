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
