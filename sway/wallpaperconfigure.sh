#!/bin/bash
wpdir="/home/hzf/Pictures/Wallpapers/"
wallpapers=$(ls $wpdir | sort -R)
swww init
while true
do 
    for file in $wallpapers
    do
        pkill swaybg
        echo $wpdir$file > /tmp/WallpaperNow.txt
        swww img -t random ${wpdir}${file} &
        sleep 1000
    done
done
