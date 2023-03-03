#!/bin/bash
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
NORMAL=$(tput sgr0)


echo renaming files with shitty characters...
rename 's/[ \(\)\'"'"'\",]/_/g' ./*
echo done

echo cleaning up downloads...
echo found ${RED} $(find -maxdepth 1 -name '*webp' | wc -l) ${NORMAL} webp mOtHeRFuCkErZ...
find -maxdepth 1 -name '*webp' -exec gmic -input "{}" -output "{}.png" \; -exec rm {} \;
echo ... webp\'s have been converted to pngs

