-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all
--
-- Equipo: ASUS ROG Zephyrus G14 GA403UV — específico de esta laptop.
-- Panel integrado: Samsung ATNA40CU05-0, 14" 2880x1800 OLED 120Hz (ver pc-config/specs/laptop-ga403uv.md)

-- GDK_SCALE solo acepta enteros; con escala fraccionaria se deja en 1
local omarchy_gdk_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))

-- Monitor externo Samsung Odyssey G9 (DP-1) como pantalla principal a la izquierda
hl.monitor({ output = "DP-1", mode = "5120x1440@120", position = "0x0", scale = 1 })

-- Pantalla de la laptop (eDP-2 / eDP-1)
-- bitdepth 10 = elimina banding en gradientes (el panel OLED lo soporta)
-- cm edid = usa la gama de color nativa del panel (DCI-P3) en vez de clamping a sRGB
-- vrr 2 = VRR solo en apps a pantalla completa (evita flicker de VRR en OLED en el escritorio)
-- scale 1.6 = espacio de 1800x1125 (~152 ppp aparentes). Escalas válidas para 2880x1800: 2, 1.8,
--   1.6667, 1.6, 1.5, 1.3333, 1.25, 1 (2880/s y 1800/s deben ser enteros)
hl.monitor({ output = "eDP-2", mode = "preferred", position = "auto", scale = 1.6, bitdepth = 10, cm = "edid", vrr = 2 })
hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1.6, bitdepth = 10, cm = "edid", vrr = 2 })

-- Fallback para cualquier otro monitor
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
