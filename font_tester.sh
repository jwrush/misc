#!/bin/bash

echo 'warning: this script is not in shape to run except while editting it'

for font in $(convert -list Font | grep -E -e '^\W*Font.*and' | awk '{print $2}'):
do convert -size 1020x100 xc:white -font $font -density 96 -pointsize 30 -annotate +2+50 $font ~/Downloads/$font.png
done
