#!/bin/bash
# Author: wuseman
# Desc: Run this script and you will download all database files from any android device..
# When you got the .db files have fun and don't do something illegal ;)

# Remount / to rw.
adb shell 'su -c mount -o remount,rw /'
### Let us download all database files from the device... b
for i in `adb shell "su -c find /data -name '*.db'"`; do
    mkdir -p ".`dirname $i`"
    adb shell "su -c cat $i" > ".$i" 
done
#
