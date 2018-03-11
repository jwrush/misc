#!/bin/bash
#JMW:
#i wrote this and forgot about it, but I may have actually wanted to save it, so
#i'm saving it.  I think I was just trying to learn out to read positonal command
#line options from bash, but there wasn't any consensus.  there's a pure bash version
#and then other versions that depend on non-standard standard c library stuff.  becasue
#it's based on a standard c library call, I think.
#not even running it now, just leaving a note in case I ever come back to it, so I don't
#even know if it works.

verbose='false'
aflag=''
bflag=''
files=''

OPTIND=1

while getopts 'abf:v' flag; do
  case "${flag}" in
    a) aflag='true'
       ;;
    b) bflag='true'
       ;;
    f) files="${OPTARG}"
       ;;
    v) verbose='true'
       ;;
    *) error "Unexpected option ${flag}" ;;
  esac
done

shift $((OPTIND-1))

echo "aflag=$aflag, bflag=$bflag"
echo "verbose=$verbose, output_file='$files', Leftovers: $@"

# End of file
