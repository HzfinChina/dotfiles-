if [[ $(swaymsg -t get_outputs)=~HDMI-A-1 ]]
then 
    swaymsg output HDMI-A-1 pos 0 0
    swaymsg output eDP-1 pos 2560 0 transform 90 scale 2.4
    swaymsg output workspace 1 HDMI-A-1
    swaymsg output workspace 2 HDMI-A-1
    swaymsg output workspace 3 HDMI-A-1
    swaymsg output workspace 4 HDMI-A-1
    swaymsg output workspace 5 HDMI-A-1
    swaymsg output workspace 6 HDMI-A-1
    swaymsg output workspace 7 HDMI-A-1
    swaymsg output workspace 8 eDP-1
    swaymsg output workspace 9 eDP-1
fi
