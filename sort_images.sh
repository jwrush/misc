#!/bin/bash

if [[ -z "$1" ]] ; then echo "USAGE: sort_images.sh IMAGENAME"; exit; fi

IMAGE=$1

declare -A TARGETS

TARGETS["downloads"]=$(echo ~/Downloads/)
TARGETS["home"]=$(echo ~)
TARGETS["zap"]=/home/rush/Downloads/zap/


#add an entry for every person folder
while read name path
    do TARGETS[$name]=$path
done < <(ls -d ~/Pictures/People/*/ | sed -E -e 's/^.*\/(.*)\/$/\1 \0/')

RESULT=$(zenity --list --column "Move To" ${!TARGETS[*]})

if [[ -n $RESULT ]]
    then mv $IMAGE ${TARGETS[$RESULT]}
fi            

