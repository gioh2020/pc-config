# pc-config

Configuración personal del sistema (Omarchy / Hyprland), compartida entre dos equipos:

| | Laptop | Escritorio |
|---|---|---|
| Equipo | ASUS ROG Zephyrus G14 GA403UV | PC de oficina |
| Pantalla | Panel integrado 2.8K OLED 120Hz + monitor externo Samsung Odyssey G9 (opcional, vía `DP-1`) | Monitor Samsung Odyssey G9 49" 5120x1440@120Hz (DisplayPort) |
| Specs completas | [`specs/laptop-ga403uv.md`](specs/laptop-ga403uv.md) | — (agregar `specs/desktop-*.md` si hace falta) |

**¿Cómo saber en qué equipo estás?** `hostnamectl` — el campo `Chassis` dice `laptop` o `desktop`. (El `Static hostname` no sirve para distinguir: Omarchy usa `omarchy` por defecto en ambos.)

## Qué es compartido y qué es específico de cada equipo

La mayoría de la config es igual en los dos equipos. Solo estos archivos cambian por equipo:

| Archivo | Aplica a | Notas |
|---|---|---|
| `hypr/monitors-laptop.conf` | Solo laptop | Copiar como `~/.config/hypr/monitors.conf` |
| `hypr/monitors-desktop.conf` | Solo escritorio | Copiar como `~/.config/hypr/monitors.conf` |
| `waybar/temperature.sh` | Compartido, pero solo útil en la laptop | Tiene hardcodeados los nombres de sensores (`k10temp-pci-*`, `amdgpu-pci-*`) de la laptop. En el escritorio el módulo de temperatura mostrará `N/A` porque esos chips no existen ahí — no rompe nada, simplemente no es útil en ese equipo. |
| `waybar/config.jsonc` (módulo `battery`) | Compartido | Comentario interno documenta un ajuste opcional (mostrar `{capacity}%` en vez de solo el ícono) pensado para la laptop, pero **actualmente no está aplicado** — el formato activo (solo ícono) es igual en ambos equipos a propósito. Descomentar esas dos líneas solo si quieres el `%` visible en la laptop. |

Todo lo demás (`hypr/bindings.conf`, `hypr/tiling_referencia_es.conf`, `waybar/style.css`, `elephant/clipboard.toml`) es **idéntico en ambos equipos**, sin ajustes por hardware.

## Contenido

### `hypr/`
Configuración de Hyprland (window manager) y atajos de teclado.

- **`bindings.conf`** *(compartido)* — Atajos de teclado personalizados (terminal, navegador, gestor de archivos, editor, clipboard manager, etc).
- **`tiling_referencia_es.conf`** *(compartido)* — Guía de referencia en español con los atajos del sistema de tiling (cerrar/mover/redimensionar ventanas, pantalla completa, workspaces, etc). Es solo documentación, no se aplica ni se sourcea.
- **`monitors-laptop.conf`** *(solo laptop)* — Panel integrado Samsung ATNA40CU05-0 2.8K OLED 120Hz + soporte para el monitor externo Samsung G9 vía `DP-1`.
- **`monitors-desktop.conf`** *(solo escritorio)* — Monitor Samsung Odyssey G93SC 49" 5120x1440@120Hz vía DisplayPort.

### `waybar/`
Configuración de Waybar (barra de estado), colocada abajo de la pantalla (no arriba, que es el default de Omarchy).

- **`config.jsonc`** *(compartido)* — Módulos y layout de la barra.
- **`style.css`** *(compartido)* — Estilos visuales.
- **`temperature.sh`** *(compartido, relevante solo en laptop)* — Script del módulo `custom/temperature`, lee CPU/GPU vía `sensors -j`.

### `elephant/`
Configuración de Elephant (backend de proveedores de datos de Walker, el launcher).

- **`clipboard.toml`** *(compartido)* — Config del historial de portapapeles. `command` está modificado para que, al seleccionar un elemento, además de copiarlo (`wl-copy`) se envíe automáticamente `Shift+Insert` a la ventana activa (pegado universal) — así queda pegado al instante, sin pegar manualmente (soluciona que `Ctrl+V` no pegue en terminales).

### `specs/`
Especificaciones de referencia de cada equipo (hardware, drivers, software instalado). Son solo documentación — no se aplican a ningún lado.

- **`laptop-ga403uv.md`** — CPU, GPU (dGPU + iGPU), RAM, almacenamiento, red, batería y stack de software de la laptop.
- **`monitor-samsung-g9.md`** — Referencia del monitor Samsung Odyssey G9 leída del propio OSD.

## Cómo aplicar esta config en un equipo (nuevo o existente)

1. Clonar el repo (si no existe ya):
   ```bash
   git clone git@github.com:gioh2020/pc-config.git ~/Projects/pc-config
   cd ~/Projects/pc-config
   ```

2. Identificar el equipo: `hostnamectl` → revisar `Chassis` (`laptop` o `desktop`).

3. Copiar los archivos **compartidos**:
   ```bash
   cp hypr/bindings.conf ~/.config/hypr/bindings.conf
   cp hypr/tiling_referencia_es.conf ~/.config/hypr/tiling_referencia_es.conf
   cp waybar/config.jsonc ~/.config/waybar/config.jsonc
   cp waybar/style.css ~/.config/waybar/style.css
   cp waybar/temperature.sh ~/.config/waybar/temperature.sh
   mkdir -p ~/.config/elephant && cp elephant/clipboard.toml ~/.config/elephant/clipboard.toml
   ```

4. Copiar el archivo de monitores **según el equipo**:
   ```bash
   # En la laptop:
   cp hypr/monitors-laptop.conf ~/.config/hypr/monitors.conf
   # En el escritorio:
   cp hypr/monitors-desktop.conf ~/.config/hypr/monitors.conf
   ```

5. Aplicar los cambios:
   ```bash
   hyprctl reload && hyprctl configerrors   # Hyprland (bindings, monitors)
   omarchy restart waybar                    # Waybar (config.jsonc, style.css, temperature.sh)
   systemctl --user restart elephant.service # Elephant (clipboard.toml)
   ```

## Cómo actualizar el repo tras cambiar la config en vivo

Estos archivos son **copias**, no symlinks: editar algo en `~/.config/...` no actualiza el repo solo. Después de confirmar que un cambio funciona:

```bash
cd ~/Projects/pc-config
cp ~/.config/hypr/bindings.conf hypr/bindings.conf   # (o el archivo que corresponda)
git add -A
git commit -m "Descripción del cambio"
git push
```
