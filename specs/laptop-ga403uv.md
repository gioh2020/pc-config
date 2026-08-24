# ASUS ROG Zephyrus G14 GA403UV — Especificaciones del equipo

Levantado directamente del sistema (Arch Linux / Omarchy) el 2026-08-24. Sirve como referencia
de hardware, drivers y software instalados en esta laptop.

## Equipo

| | |
|---|---|
| Modelo | ROG Zephyrus G14 GA403UV_GA403UV |
| Board | GA403UV |
| Versión de BIOS | GA403UV.311 |

## CPU

- AMD Ryzen 9 8945HS (codename Hawk Point) — 8 núcleos / 16 hilos
- iGPU integrada: AMD Radeon 780M (RDNA3)
- NPU: AMD XDNA, hasta 16 TOPS

## GPU

- **Dedicada:** NVIDIA GeForce RTX 4060 Laptop GPU (AD107M), 8GB GDDR6
  - Driver: `nvidia-open-dkms` / `nvidia-utils` 610.43.03
  - VBIOS: 95.07.41.00.B4
- **Integrada:** AMD Radeon 780M (Hawk Point) — driver `amdgpu` (en el kernel)
- Modo gráfico: Optimus/híbrido (`gpu_mux_mode = 1`). La laptop tiene MUX switch físico
  (soporta modo dGPU exclusivo, `gpu_mux_mode = 0`, requiere reinicio) pero por defecto
  corre en híbrido para mejor autonomía. El panel interno lo maneja la iGPU AMD; la NVIDIA
  se usa por PRIME render offload.

## Memoria RAM

- Detectada: ~14.9 GB usables (16 GB físicos, LPDDR5X soldada; el resto reservado para
  firmware/framebuffer de la iGPU)
- Nota: ASUS ofrece este modelo también en 32GB LPDDR5X-6400 — este equipo específico
  trae la variante de 16GB.

## Almacenamiento

- WD PC SN5000S 1TB NVMe (PCIe 4.0)

## Pantalla

Ver especificaciones completas de la pantalla en el comentario de
[`hypr/monitors-laptop.conf`](../hypr/monitors-laptop.conf) (panel Samsung ATNA40CU05-0,
2.8K OLED 120Hz, 100% DCI-P3).

## Red / Conectividad

- Wi-Fi: MediaTek MT7922 802.11ax (PCIe)
- Audio: AMD Ryzen HD Audio Controller + NVIDIA HD Audio (sobre HDMI/DP)

## Batería

- Fabricante: ASUS (modelo A32-K55)
- Capacidad de diseño: 73.0 Wh
- Capacidad actual (full-charge): ~64.0 Wh (~87.6% de salud)

## Software / Stack del sistema

| Componente | Versión |
|---|---|
| Distro | Arch Linux (Omarchy) |
| Kernel | Linux 7.1.4-arch1-1 |
| Compositor | Hyprland 0.56.0 |
| Sesión | Wayland |
| Barra de estado | Waybar 0.15.0 |
| Mesa | 26.1.5 |
| Wayland (libwayland) | 1.25.0 |
| Session manager | uwsm 0.26.6 |
| Control ASUS (fan/perfiles/RGB) | asusctl 6.3.8 |
| Gestión de energía | power-profiles-daemon 0.30 |
| libdisplay-info | 0.3.0 (limita detección de metadatos HDR del panel, ver nota en `monitors-laptop.conf`) |

## Notas relevantes

- `nvidia_drm modeset=1` configurado en `/etc/modprobe.d/nvidia.conf` (necesario para
  PRIME render offload correcto bajo Wayland).
- El backlight real del panel se controla vía `amdgpu_bl2` (no `nvidia_0`, que es un
  dispositivo dummy expuesto por el driver NVIDIA ya que esta GPU no maneja el panel interno).
