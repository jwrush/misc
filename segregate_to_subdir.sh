#!/bin/bash
#
#move a set of files to a subdirectory of the current directory
#
#usage segregate_to_subdir.sh [-n SUBDIRNAME] FILES
verbose='false'
SUBDIRNAME="$(date -Iseconds)" #default value is a timestamp, can be overridden with -n

OPTIND=1

while getopts 'n:' flag; do
  case "${flag}" in
    n) SUBDIRNAME="${OPTARG}"
       ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

shift $((OPTIND-1))

if mkdir ./$SUBDIRNAME
 then
      mv "$@" ./$SUBDIRNAME/
 else
      exit 1
fi
