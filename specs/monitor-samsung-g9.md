# Monitor Samsung Odyssey G9 — Referencia

Datos leídos directamente del menú "Información" del propio monitor (OSD).

## Identificación

| | |
|---|---|
| Código del modelo | LS49CG930SNXZA |
| Versión de software | M-C9349GGAA-1011.0 |
| Versión de T-Con | 49A2ODYOCC100222060 / 49A2ODYOCSUBC10022206F |
| Número de serie | 0RMYHNTX700004F |

## Estado

- HDR: Desactivado
- FreeSync Premium: Activado

## Conexión / resolución

Resolución nativa: **5120x1440 @ 120Hz** vía **DisplayPort** (ver
[`hypr/monitors-desktop.conf`](../hypr/monitors-desktop.conf), que corrige el default
incorrecto de 3840x1080@120Hz por HDMI documentado en ese mismo commit).

Este monitor se usa principalmente con el PC de escritorio (oficina). La laptop (ver
[`hypr/monitors-laptop.conf`](../hypr/monitors-laptop.conf)) tiene una línea `DP-1,
5120x1440@120` preconfigurada por si se conecta a este mismo monitor, pero no está
conectada actualmente.
