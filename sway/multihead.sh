if [[ $(swaymsg -t get_outputs)=~HDMI-A-1 ]]
then
    swaymsg output HDMI-A-1 pos 0 0
    swaymsg output eDP-1 pos 2560 0 transform 90 scale 2.4
    swaymsg workspace 1 output HDMI-A-1
    swaymsg workspace 2 output HDMI-A-1
    swaymsg workspace 3 output HDMI-A-1
    swaymsg workspace 4 output HDMI-A-1
    swaymsg workspace 5 output HDMI-A-1
    swaymsg workspace 6 output HDMI-A-1
    swaymsg workspace 7 output HDMI-A-1
    swaymsg workspace 8 output eDP-1
    swaymsg workspace 9 output eDP-1
fi
