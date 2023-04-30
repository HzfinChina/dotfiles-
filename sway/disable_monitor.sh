#!/bin/bash
if [ -n "$(swaymsg --type get_outputs | rg HDMI)" ];
then 
    swaymsg output eDP-1 disable 
fi

