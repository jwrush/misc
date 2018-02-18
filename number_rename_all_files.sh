#!/bin/bash
#
#renames files in a directory with given file extensions to numbers
#
#usage number_rename_all_files GREP_PATTERN OPTIONAL_PREFIX

#find all the files that match the given pattern
FILES=`ls | grep -e $1`

#find the total number of files
TOTAL_FILES=`echo "$FILES" | wc -l`

#we need the power of 10 lower than or equal to the total number of files
#because we need to tell printf how many leading zeroes we're going to need
FILE_COUNT_MAGNITUDE=`expr length "$TOTAL_FILES"`
PRINTF_PATTERN="%0${FILE_COUNT_MAGNITUDE}d"

let j=0

for FILE in $FILES
do
  FILE_EXT=`echo "$FILE" | sed 's/^.*\(\..*\)$/\1/'`
  NUMBER=`printf "$PRINTF_PATTERN" $j`
  echo -e "$FILE\t=>\t${2}${NUMBER}${FILE_EXT}"
  mv $FILE ${2}${NUMBER}${FILE_EXT}
  let j++
done
