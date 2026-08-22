# pc-config

Configuración personal del sistema (Omarchy / Hyprland).

## Contenido

### `hypr/`
Configuración de Hyprland (window manager) y atajos de teclado.

- **`bindings.conf`** — Atajos de teclado personalizados (aplicaciones: terminal, navegador, gestor de archivos, editor, etc).
- **`tiling_referencia_es.conf`** — Guía de referencia en español con los atajos del sistema de tiling (cerrar/mover/redimensionar ventanas, pantalla completa, workspaces, etc).

### `waybar/`
Configuración de Waybar (barra de estado).

- **`config.jsonc`** — Módulos y layout de la barra, configurada para mostrarse en la parte inferior de la pantalla (en vez de arriba, que es el default de Omarchy).
- **`style.css`** — Estilos visuales de la barra.

## Uso

Los archivos corresponden a `~/.config/hypr/` y `~/.config/waybar/` respectivamente. Para aplicarlos, copiarlos (o enlazarlos) a esas rutas y recargar Hyprland/Waybar.
