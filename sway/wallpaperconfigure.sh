#!/bin/bash
wpdir="/home/hzf/Pictures/Wallpapers/"
wallpapers=$(ls $wpdir | sort -R)
while true
do 
    for file in $wallpapers
    do
        pkill swaybg
        echo $wpdir$file > /tmp/WallpaperNow.txt
        swaybg -m fill -i ${wpdir}${file} &
        sleep 1000
    done
done
