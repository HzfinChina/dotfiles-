#!/bin/bash 
eth=`nmcli device status | grep ethernet | grep '\ connected'`
if [ -n "$eth" ] ;
then
    `nmcli device disconnect wlp43s0`
fi

