#!/bin/bash

# Carpeta de imágenes
WALLPAPER_DIR="$HOME/Imagenes/Wallpapers"

if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "El directorio $WALLPAPER_DIR no existe."
    exit 1
fi

# Seleccionar aleatoriamente ()
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    echo "No se encontraron imagenes."
    exit 1
fi

# Obtener los nombres de los monitores conectados
MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Precargar la imagen en hyprpaper
hyprctl hyprpaper preload "$WALLPAPER"

# Asignar la imagen a cada monitor activo (por si las moscas...)
for MONITOR in $MONITORS; do
    hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
done

# Descargar de la memoria las imágenes que no esten en uso
hyprctl hyprpaper unload unused