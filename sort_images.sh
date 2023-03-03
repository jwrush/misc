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


TARGETS["blackwidow"]=/home/rush/Pictures/comics/blackwidow
TARGETS["captain_marvel"]=/home/rush/Pictures/comics/captain_marvel
TARGETS["emma_frost"]=/home/rush/Pictures/comics/emma_frost
TARGETS["gwenpool"]=/home/rush/Pictures/comics/gwenpool
TARGETS["harley"]=/home/rush/Pictures/comics/harley
TARGETS["JEAN"]=/home/rush/Pictures/comics/JEAN
TARGETS["jubilee"]=/home/rush/Pictures/comics/jubilee
TARGETS["kitty"]=/home/rush/Pictures/comics/kitty
TARGETS["lois_lane"]=/home/rush/Pictures/comics/lois_lane
TARGETS["maryjane"]=/home/rush/Pictures/comics/maryjane
TARGETS["mary_marvel"]=/home/rush/Pictures/comics/mary_marvel
TARGETS["models_for_misc_chars"]=/home/rush/Pictures/comics/models_for_misc_chars
TARGETS["rogue"]=/home/rush/Pictures/comics/rogue
TARGETS["SCANS"]=/home/rush/Pictures/comics/SCANS
TARGETS["spidergwen"]=/home/rush/Pictures/comics/spidergwen
TARGETS["squirrelgirl"]=/home/rush/Pictures/comics/squirrelgirl
TARGETS["sue"]=/home/rush/Pictures/comics/sue
TARGETS["supergirl"]=/home/rush/Pictures/comics/supergirl
TARGETS["wanda"]=/home/rush/Pictures/comics/wanda
TARGETS["Wonder_woman"]=/home/rush/Pictures/comics/Wonder_woman
TARGETS["zatanna"]=/home/rush/Pictures/comics/zatanna


#add an entry for every person folder
while read name path
    do TARGETS[$name]=$path
done < <(ls -d ~/Pictures/People/*/ | sed -E -e 's/^.*\/(.*)\/$/\1 \0/')

#add an entry for every person folder
while read name path
    do TARGETS[$name]=$path
done < <(ls -d ~/Pictures/People/*/ | sed -E -e 's/^.*\/(.*)\/$/\1 \0/')

RESULT=$(zenity --list --column "Move To" ${!TARGETS[*]})

if [[ -n $RESULT ]]
    then mv $IMAGE ${TARGETS[$RESULT]}
fi            

