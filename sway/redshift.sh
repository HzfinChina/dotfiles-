if ! test -e /tmp/screentemplight.txt
then
    echo -e "BRIGHTNESS=1.0\nTEMP=6000" > /tmp/screentemplight.txt
fi

source /tmp/screentemplight.txt

case $1 in 
    c)
        if test $TEMP -lt 8000
        then
            TEMP=$(expr $TEMP + 500)
        fi
        ;;
    w)
        if test $TEMP -gt 1800
        then
            TEMP=$(expr $TEMP - 500)
        fi
        ;;
    b)
        if test $(echo "$BRIGHTNESS<0.92" | bc) -ne 0
        then
            BRIGHTNESS=$(echo "$BRIGHTNESS+0.08" | bc)
        fi
        ;;
    d)
        echo $BRIGHTNESS
        if test $(echo "$BRIGHTNESS>=0.2" | bc) -ne 0
        then
            BRIGHTNESS=$(echo "$BRIGHTNESS-0.08" | bc)
        fi
        ;;
esac

echo $BRIGHTNESS
echo $TEMP
echo -e "BRIGHTNESS=$BRIGHTNESS\nTEMP=$TEMP" > /tmp/screentemplight.txt
pkill gammastep
notify-send "Bright:$BRIGHTNESS" "Temp:$TEMP"
gammastep -l 0:0 -O $TEMP -b $BRIGHTNESS:$BRIGHTNESS
