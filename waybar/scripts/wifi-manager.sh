#!/bin/bash

# Nombre único para identificar esta ventana flotante
APP_NAME="WI-FI manager"

# Si ya está abierto, lo cierra (efecto toggle). Si no, lo abre.
if pgrep  -f "${APP_NAME}" > /dev/null; then
    pkill -f "${APP_NAME}"
else 
    foot -T "${APP_NAME}" -e impala &
fi