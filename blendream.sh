#/bin/bash

usage()
{
    echo "usage: ./[WHATEVER].sh input output maskdir [ -a | --auto ]
                                                      [ -r | --redo ]"
    exit -1
}

execute_dp()
{
    ./dreampower run -i "$INPUT" --ignore-size --experimental-artifacts-inpaint -o "$OUTPUT" -a "$MASKDIR" -s $1
}

if [[ $# < 3 ]]
then
    usage
fi

INPUT=$1
OUTPUT=$2
MASKDIR=$3

shift 3

FLAGS=$(getopt -o ar --long auto,redo -- "$@")

if [[ $? != 0 ]]
then
     usage
fi

for f in $FLAGS
do
        case "$f" in
                -a | --auto ) AUTO=1 ;;
                -r | --redo ) REDO=1 ;;
                        -- ) break ;;
        esac
done        

if [[ $AUTO == 1 ]]
then
    execute_dp "0:5"
else
    if [[ $REDO != 1 ]]
    then            
        execute_dp "0:1"
        printf "You may edit the files now. Press enter to finish them."
        read
    fi
    
    PREFIX=$(basename $INPUT | sed -E -e 's/(.+)\.[^.]+$/\1/')
    REAL_MASKDIR=$(ls -F $MASKDIR | grep -E -e $PREFIX)

    for mask in MaskdetToMaskfin MaskrefToMaskdet MaskToMaskref
    do echo MASKDIR: $MASKDIR
            echo REAL_MASDIR: $REAL_MASKDIR
            echo $mask.png
            cp /tmp/$mask/Image0001.png $MASKDIR/$REAL_MASKDIR/$mask.png
    done

    execute_dp "5:5"
fi
