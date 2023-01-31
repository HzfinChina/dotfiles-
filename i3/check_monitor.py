#!/bin/python3
import os
output = os.popen('xrandr --listmonitors').read()
something = output[10]
if output[10] == '2':
    os.system('xrandr --output eDP-1 --off')
if output[10] == '1':
    os.system('xrandr --output eDP-1 --scale 0.7x0.7')
