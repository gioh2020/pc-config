-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

-- PC de escritorio: Samsung Odyssey G93SC 49" (5120x1440, 32:9), sin escalado.
hl.env("GDK_SCALE", "1")

-- El monitor está conectado por HDMI y por DisplayPort; ambos a resolución nativa.
hl.monitor({ output = "HDMI-A-1", mode = "5120x1440@120", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-3", mode = "5120x1440@120", position = "0x0", scale = 1 })

-- Fallback para cualquier otro monitor.
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
