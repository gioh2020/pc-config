#!/bin/bash
# Solo PC de escritorio (Samsung Odyssey G9 49" 5120x1440 a escala 1):
# agranda la letra sin cambiar la escala del monitor.
#   - Ghostty (única terminal instalada): tamaño 10 (default Omarchy: 9)
#   - Apps GTK: text-scaling-factor 1.1
#   - Barra/menús de Omarchy: copia omarchy/shell-desktop.toml (base-size 13, default 12)
set -e
cd "$(dirname "$0")/.."

sed -i -E 's/^font-size = [0-9.]+$/font-size = 10/' ~/.config/ghostty/config

gsettings set org.gnome.desktop.interface text-scaling-factor 1.1

cp omarchy/shell-desktop.toml ~/.config/omarchy/shell.toml

omarchy restart terminal
