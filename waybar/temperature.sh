#!/bin/bash
# Laptop-only: hardcodes this machine's sensor chip names (k10temp CPU / amdgpu GPU).
# On other hardware (e.g. the desktop PC) these chip names differ, so this script
# will just report N/A there — adjust the chip names below or disable the module.

json=$(sensors -j 2>/dev/null)

cpu=$(jq -r '.["k10temp-pci-00c3"].Tctl.temp1_input // empty' <<<"$json")
gpu=$(jq -r '.["amdgpu-pci-6500"].edge.temp1_input // empty' <<<"$json")

cpu=${cpu%.*}
gpu=${gpu%.*}

text="󰻠 ${cpu:-N/A}°C  󰢮 ${gpu:-N/A}°C"

class="normal"
if [[ -n $cpu && $cpu -ge 85 ]] || [[ -n $gpu && $gpu -ge 85 ]]; then
  class="critical"
elif [[ -n $cpu && $cpu -ge 70 ]] || [[ -n $gpu && $gpu -ge 70 ]]; then
  class="warning"
fi

printf '{"text":"%s","class":"%s","tooltip":"CPU (Tctl): %s°C\\nGPU (edge): %s°C"}\n' "$text" "$class" "${cpu:-N/A}" "${gpu:-N/A}"
