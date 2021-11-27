#!/bin/bash

if [[ -z "$1" ]] ; then echo "USAGE: sort_images.sh IMAGENAME"; exit; fi

IMAGE=$1

declare -A TARGETS

TARGETS["downloads"]=$(echo ~/Downloads/)
TARGETS["home"]=$(echo ~)
TARGETS["zap"]=/home/rush/Downloads/zap/
TARGETS["art"]=/home/rush/Pictures/art/
TARGETS["cartoon_porn_inspo"]=/home/rush/Pictures/cartoon_porn_inspo/
TARGETS["wallpapers"]=/home/rush/Pictures/Wallpapers/
TARGETS["male_supremacy"]=/home/rush/Pictures/male_supremacy/
TARGETS["good_df"]=/home/rush/Pictures/art/good_df/
TARGETS["art_in"]="/home/rush/Pictures/art/in/"
TARGETS["drawing_advice"]=/home/rush/Pictures/art/drawing_advice/
TARGETS["experiments"]=/home/rush/Pictures/art/experiments/
TARGETS["textures"]=/home/rush/Pictures/art/experiments/
TARGETS["good"]=/home/rush/Pictures/art/good
TARGETS["png"]=/home/rush/Pictures/art/png
TARGETS["scraps"]=/home/rush/Pictures/art/rushworld
TARGETS["dev"]=/home/rush/Dev/

#add an entry for every person folder
while read name path
    do TARGETS[$name]=$path
done < <(ls -d ~/Pictures/People/*/ | sed -E -e 's/^.*\/(.*)\/$/\1 \0/')

RESULT=$(zenity --list --column "Move To" ${!TARGETS[*]})

if [[ -n $RESULT ]]
    then mv $IMAGE ${TARGETS[$RESULT]}
fi            

