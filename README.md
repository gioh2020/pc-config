# pc-config

Configuración personal del sistema (Omarchy / Hyprland), compartida entre dos equipos:

| | Laptop | Escritorio |
|---|---|---|
| Equipo | ASUS ROG Zephyrus G14 GA403UV | PC de oficina |
| Pantalla | Panel integrado 2.8K OLED 120Hz + monitor externo Samsung Odyssey G9 (opcional, vía `DP-1`) | Monitor Samsung Odyssey G9 49" 5120x1440@120Hz (HDMI-A-1, también DP-3) |
| Specs completas | [`specs/laptop-ga403uv.md`](specs/laptop-ga403uv.md) | — (agregar `specs/desktop-*.md` si hace falta) |

**¿Cómo saber en qué equipo estás?** `hostnamectl` — el campo `Chassis` dice `laptop` o `desktop`. (El `Static hostname` no sirve para distinguir: Omarchy usa `omarchy` por defecto en ambos.)

## Omarchy 4 (quattro) vs Omarchy 3

Desde Omarchy 4 Hyprland se configura en **Lua** (`~/.config/hypr/*.lua`), la barra es el shell de Omarchy (Quickshell, `~/.config/omarchy/shell.json`) y Waybar/Walker/Elephant ya no existen. Por eso:

- **Omarchy 4+** → usar `hypr/bindings.lua` y `hypr/monitors-laptop.lua` / `hypr/monitors-desktop.lua`. Lo de `waybar/` y `elephant/` no aplica: la barra se pone abajo con `"position": "bottom"` en `shell.json`, y el gestor de portapapeles nativo (`omarchy.clipboard`) ya pega automáticamente con Shift+Insert al seleccionar.
- **Omarchy 3** → los archivos `.conf`, `waybar/` y `elephant/` (legado).

**Terminal:** solo Ghostty. Omarchy 4 deja Foot por defecto; para volver a Ghostty y quitar las demás:
```bash
omarchy default terminal ghostty
sudo pacman -Rns foot alacritty
```

Los atajos de apps de `bindings.conf` (terminal, navegador, Nautilus, editor) ya son los defaults de Omarchy 4; `bindings.lua` solo contiene lo que difiere (Super+V → clipboard manager, Super+Alt+W → cerrar pestaña de Chrome, Super+Space → apps y Super+Alt+Space → menú Omarchy como en Omarchy 3).

## Qué es compartido y qué es específico de cada equipo

La mayoría de la config es igual en los dos equipos. Solo estos archivos cambian por equipo:

| Archivo | Aplica a | Notas |
|---|---|---|
| `hypr/monitors-laptop.conf` | Solo laptop (Omarchy 3) | Copiar como `~/.config/hypr/monitors.conf` |
| `hypr/monitors-laptop.lua` | Solo laptop (Omarchy 4+) | Copiar como `~/.config/hypr/monitors.lua` |
| `hypr/monitors-desktop.conf` | Solo escritorio (Omarchy 3) | Copiar como `~/.config/hypr/monitors.conf` |
| `hypr/monitors-desktop.lua` | Solo escritorio (Omarchy 4+) | Copiar como `~/.config/hypr/monitors.lua` |
| `desktop/fonts.sh` + `omarchy/shell-desktop.toml` | Solo escritorio (Omarchy 4+) | Letra más grande a escala 1: Ghostty 10, barra 13, GTK ×1.1. Ejecutar `desktop/fonts.sh` |
| `waybar/temperature.sh` | Compartido, pero solo útil en la laptop | Tiene hardcodeados los nombres de sensores (`k10temp-pci-*`, `amdgpu-pci-*`) de la laptop. En el escritorio el módulo de temperatura mostrará `N/A` porque esos chips no existen ahí — no rompe nada, simplemente no es útil en ese equipo. |
| `waybar/config.jsonc` (módulo `battery`) | Compartido | Comentario interno documenta un ajuste opcional (mostrar `{capacity}%` en vez de solo el ícono) pensado para la laptop, pero **actualmente no está aplicado** — el formato activo (solo ícono) es igual en ambos equipos a propósito. Descomentar esas dos líneas solo si quieres el `%` visible en la laptop. |

Todo lo demás (`hypr/bindings.conf`, `hypr/tiling_referencia_es.conf`, `waybar/style.css`, `elephant/clipboard.toml`) es **idéntico en ambos equipos**, sin ajustes por hardware.

## Contenido

### `hypr/`
Configuración de Hyprland (window manager) y atajos de teclado.

- **`bindings.conf`** *(compartido)* — Atajos de teclado personalizados (terminal, navegador, gestor de archivos, editor, clipboard manager, etc).
- **`tiling_referencia_es.conf`** *(compartido)* — Guía de referencia en español con los atajos del sistema de tiling (cerrar/mover/redimensionar ventanas, pantalla completa, workspaces, etc). Es solo documentación, no se aplica ni se sourcea.
- **`monitors-laptop.conf`** / **`monitors-laptop.lua`** *(solo laptop)* — Panel integrado Samsung ATNA40CU05-0 2.8K OLED 120Hz (10 bits, `cm = edid`, VRR solo en pantalla completa) + monitor externo Samsung G9 vía `DP-1` a la izquierda. Escala: `.lua` (Omarchy 4) 1.6 con `GDK_SCALE=1`; `.conf` (Omarchy 3) 2 con `GDK_SCALE=2`.
- **`bindings.lua`** *(compartido, Omarchy 4+)* — Overrides de atajos en Lua.
- **`monitors-desktop.conf`** / **`monitors-desktop.lua`** *(solo escritorio)* — Monitor Samsung Odyssey G93SC 49" a 5120x1440@120Hz nativo tanto por HDMI (`HDMI-A-1`) como por DisplayPort (`DP-3`). `GDK_SCALE=1`.

### `waybar/`
Configuración de Waybar (barra de estado), colocada abajo de la pantalla (no arriba, que es el default de Omarchy).

- **`config.jsonc`** *(compartido)* — Módulos y layout de la barra.
- **`style.css`** *(compartido)* — Estilos visuales.
- **`temperature.sh`** *(compartido, relevante solo en laptop)* — Script del módulo `custom/temperature`, lee CPU/GPU vía `sensors -j`.

### `desktop/` *(solo escritorio)*

- **`fonts.sh`** — En el G9 a 5120x1440 con escala 1 la letra se ve pequeña. En vez de usar escala fraccional (con 5120x1440 las únicas válidas son 1.0667, 1.25 y 1.333, que achican el espacio de trabajo), agranda solo las fuentes: Ghostty de 9 → 10, `text-scaling-factor` de GTK 1.1, y copia `omarchy/shell-desktop.toml` a `~/.config/omarchy/shell.toml` (barra/menús `base-size` 12 → 13).

### `apps/`

- **`lista.md`** — Las apps que conservo después de instalar Omarchy (sin juegos de Steam) y las apps por defecto que quito.
- **`setup.sh`** — En una instalación nueva de Omarchy 4+: instala mis apps (Chrome, Ghostty, VS Code, Steam, JDownloader, Typora, GitHub CLI) y quita las apps por defecto que no uso. Junto con `hypr/bindings.lua`, que desactiva sus atajos.

### `elephant/`
Configuración de Elephant (backend de proveedores de datos de Walker, el launcher).

- **`clipboard.toml`** *(compartido)* — Config del historial de portapapeles. `command` está modificado para que, al seleccionar un elemento, además de copiarlo (`wl-copy`) se envíe automáticamente `Shift+Insert` a la ventana activa (pegado universal) — así queda pegado al instante, sin pegar manualmente (soluciona que `Ctrl+V` no pegue en terminales).

### `omarchy/hooks/`
Hooks de Omarchy (se ejecutan automáticamente en ciertos eventos, ver [`~/.config/omarchy/hooks/`](https://learn.omarchy.org)).

- **`theme-set.d/remove-chromium-browser-policy`** *(compartido)* — Al cambiar de tema, Omarchy fuerza el color del tema de Chromium/Chrome/Edge/Brave escribiendo una política "managed" (`BrowserThemeColor`/`BrowserColorScheme`) en `/etc/*/policies/managed/color.json` (ver `omarchy-theme-set-browser`). Esa política bloquea el selector de tema nativo del navegador con "Set by your Organization". Este hook borra esos archivos justo después de cada cambio de tema para poder elegir el tema del navegador manualmente. En Omarchy 3 no necesitaba `sudo` porque esos directorios `policies/managed/` eran world-writable (0777, root:root).

  **Omarchy 4+:** los directorios pasaron a 0755 root:root (endurecimiento de seguridad intencional; no volver a 0777), así que el hook borra con `sudo -n`. Requiere instalar la regla [`omarchy/sudoers/pc-config-browser-policy`](omarchy/sudoers/pc-config-browser-policy), que permite sin contraseña solo ese `rm` exacto. Sin la regla, el hook falla sin pedir contraseña y el bloqueo de tema vuelve.

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
   omarchy hook install theme-set omarchy/hooks/theme-set.d/remove-chromium-browser-policy
   ```

   En **Omarchy 4+**, en vez de lo anterior:
   ```bash
   apps/setup.sh      # mis apps; quita las apps por defecto que no uso
   cp hypr/bindings.lua ~/.config/hypr/bindings.lua
   cp hypr/tiling_referencia_es.conf ~/.config/hypr/tiling_referencia_es.conf
   omarchy hook install theme-set omarchy/hooks/theme-set.d/remove-chromium-browser-policy
   sudo install -m 0440 -o root -g root omarchy/sudoers/pc-config-browser-policy /etc/sudoers.d/ && sudo visudo -c
   # Laptop:
   cp hypr/monitors-laptop.lua ~/.config/hypr/monitors.lua
   # Escritorio:
   cp hypr/monitors-desktop.lua ~/.config/hypr/monitors.lua
   desktop/fonts.sh   # letra más grande (solo escritorio)
   hyprctl reload && hyprctl configerrors
   ```

4. (Omarchy 3) Copiar el archivo de monitores **según el equipo**:
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
   omarchy-theme-set-browser && omarchy-hook theme-set "$(omarchy theme current)" # Hook remove-chromium-browser-policy: limpia el bloqueo ya presente sin esperar al próximo cambio de tema
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
