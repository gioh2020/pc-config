# pc-config

Configuración personal del sistema (Omarchy / Hyprland).

## Contenido

### `hypr/`
Configuración de Hyprland (window manager) y atajos de teclado.

- **`bindings.conf`** — Atajos de teclado personalizados (aplicaciones: terminal, navegador, gestor de archivos, editor, etc).
- **`tiling_referencia_es.conf`** — Guía de referencia en español con los atajos del sistema de tiling (cerrar/mover/redimensionar ventanas, pantalla completa, workspaces, etc).
- **`monitors-desktop.conf`** — Configuración de pantalla **específica del PC de escritorio** (monitor Samsung Odyssey G93SC 49", 5120x1440@120Hz vía DisplayPort). **No aplicar en la laptop**, cuya configuración de pantalla es distinta (resolución/puerto propios del panel integrado). Para aplicarla, copiar como `~/.config/hypr/monitors.conf` solo en el equipo de escritorio.
- **`monitors-laptop.conf`** — Configuración de pantalla **específica de la laptop** (ASUS ROG Zephyrus G14 GA403UV, panel Samsung ATNA40CU05-0 2.8K OLED 120Hz). Incluye en el comentario las especificaciones completas del panel. **No aplicar en el PC de escritorio.**

### `waybar/`
Configuración de Waybar (barra de estado).

- **`config.jsonc`** — Módulos y layout de la barra, configurada para mostrarse en la parte inferior de la pantalla (en vez de arriba, que es el default de Omarchy).
- **`style.css`** — Estilos visuales de la barra.

### `specs/`
Especificaciones de referencia de cada equipo (hardware, drivers, software instalado).

- **`laptop-ga403uv.md`** — CPU, GPU (dGPU + iGPU), RAM, almacenamiento, red, batería y stack de software (kernel, Hyprland, drivers NVIDIA/AMD, etc) de la laptop ASUS ROG Zephyrus G14 GA403UV.

## Uso

Los archivos de `hypr/` y `waybar/` corresponden a `~/.config/hypr/` y `~/.config/waybar/` respectivamente. Para aplicarlos, copiarlos (o enlazarlos) a esas rutas y recargar Hyprland/Waybar — usando el archivo `monitors-*.conf` correspondiente al equipo (renombrado a `monitors.conf`).
