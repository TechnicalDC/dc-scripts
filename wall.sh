#!/bin/bash

WALLPAPERS_DIR="$HOME/Pictures/wallpapers/"
CACHE_DIR="${HOME}/.cache/wally/wallpapers"
HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"
BLUR="50x30"
ROFI_THEME_WAL="$HOME/.config/rofi/themes/minimal/grid.rasi"

generate_cache () {
   # Create cache dir if not exists
   if [ ! -d "${CACHE_DIR}" ] ; then
      mkdir -p "${CACHE_DIR}"
   fi

   physical_monitor_size=24
   monitor_res=$(hyprctl monitors |grep -A2 Monitor |head -n 2 |awk '{print $1}' | grep -oE '^[0-9]+')
   dotsperinch=$(echo "scale=2; $monitor_res / $physical_monitor_size" | bc | xargs printf "%.0f")
   monitor_res=$(( $monitor_res * $physical_monitor_size / $dotsperinch ))

   rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"

   # Convert images in directory and save to cache dir
   for imagen in "$WALLPAPERS_DIR"/*.{jpg,jpeg,png,webp}; do
      if [ -f "$imagen" ]; then
         nombre_archivo=$(basename "$imagen")
         if [ ! -f "$CACHE_DIR/${nombre_archivo}" ] ; then
            # echo $imagen
            magick "$imagen" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "$CACHE_DIR/${nombre_archivo}"
         fi
      fi
   done
}

setwallpaper () {
   cp $1 ~/.cache/wal/wallpaper.jpg
   magick $1 -blur $BLUR $BLURRED_WALLPAPER
   magick $1 -strip -thumbnail 500x500^ -gravity center -extent 500x500 $ROFI_BACKGROUND
   # $WALLPAPER_CMD $2
   echo -e "preload = $1\nwallpaper = , $1" > $HYPRPAPER_CONF
   killall hyprpaper && hyprpaper &
}

sendnotification () {
   notify-send -a $1 $2 -t 1000 -i $3
}

generate_cache

WALLPAPER=$(find "${WALLPAPERS_DIR}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${CACHE_DIR}"/"$A\n" ; done | rofi -dmenu -theme $ROFI_THEME_WAL -p "wallpaper")
if [[ -n "$WALLPAPER" ]]; then
	setwallpaper $WALLPAPERS_DIR$WALLPAPER
	post_run
	sendnotification 'wall.sh' 'Wallpaper changed.' $WALLPAPERS_DIR/$WALLPAPER
fi
