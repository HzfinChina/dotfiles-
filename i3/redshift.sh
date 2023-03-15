if ! test -e /tmp/screentemplight.txt
then
    echo -e "BRIGHTNESS=1.0\nTEMP=5000" > /tmp/screentemplight.txt
fi

source /tmp/screentemplight.txt

case $1 in 
    c)
        if test $TEMP -lt 8000
        then
            echo TEMP:$TEMP
            TEMP=$(expr $TEMP + 100)
        fi
        ;;
    w)
        if test $TEMP -gt 1800
        then
            TEMP=$(expr $TEMP - 100)
        fi
        ;;
    b)
        if test $(echo "$BRIGHTNESS<1.0" | bc) -ne 0
        then
            BRIGHTNESS=$(echo "$BRIGHTNESS+0.01" | bc)
        fi
        ;;
    d)
        echo $BRIGHTNESS
        if test $(echo "$BRIGHTNESS>=0.2" | bc) -ne 0
        then
            BRIGHTNESS=$(echo "$BRIGHTNESS-0.01" | bc)
        fi
        ;;
esac

echo -e "BRIGHTNESS=$BRIGHTNESS\nTEMP=$TEMP" > /tmp/screentemplight.txt
redshift -P -O $TEMP -b $BRIGHTNESS
