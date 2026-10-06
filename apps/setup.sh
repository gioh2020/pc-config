#!/bin/bash
# Tras instalar Omarchy (4+): instala mis apps (apps/lista.md) y quita las apps
# por defecto que no uso. Se puede correr más de una vez.
set -e
cd "$(dirname "$0")"

# Ghostty primero: Omarchy 4 usa Foot como terminal por defecto y lo vamos a quitar.
omarchy install terminal ghostty

# Mis apps
omarchy install browser chrome
# Chrome por defecto antes de quitar Chromium (atajos y web apps usan el navegador por defecto).
omarchy default browser chrome
omarchy install editor vscode
omarchy install gaming steam
omarchy pkg add typora github-cli
omarchy pkg aur add jdownloader2
omarchy webapp install "GitHub" "https://github.com/" "$PWD/icons/GitHub.png"

# Apps por defecto que no uso
omarchy pkg drop \
  obsidian xournalpp omawrite kdenlive moonlight-qt \
  obs-studio localsend aether cliamp foot alacritty \
  chromium signal-desktop

for app in Basecamp Discord "Google Contacts" "Google Maps" "Google Messages" \
  "Google Photos" HEY WhatsApp X YouTube Zoom; do
  OMARCHY_REMOVE_NOTIFY=false omarchy webapp remove "$app"
done

apps_dir=~/.local/share/applications
rm -f "$apps_dir/Disk Usage.desktop" "$apps_dir/foot.desktop" "$apps_dir/footclient.desktop" \
  "$apps_dir/foot-server.desktop" "$apps_dir/Alacritty.desktop"
rm -f ~/.local/share/nautilus-python/extensions/localsend.py

echo "Listo. Copia hypr/bindings.lua para desactivar los atajos de las apps quitadas."
