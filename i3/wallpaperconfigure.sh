#!/bin/bash
wallpapers=$(ls ~/Pictures/Wallpaper | sort -R)
wpdir="/home/hzf/Pictures/Wallpaper"
sleep 2
while true
do 
    for file in $wallpapers
    do
        echo $wpdir/$file > /tmp/WallpaperNow.txt
        feh --bg-fill ${wpdir}/${file}
        sleep 1000
    done
done
        
#feh --bg-max "/home/hzf/Pictures/Wallpaper/wallhaven-dpw6wg.jpg"
