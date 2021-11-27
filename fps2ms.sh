#!/bin/bash
#
#frames per second to milliseconds per frame 

function usage()
{
    echo "usage ./fps2ms.sh FPS"
    exit -1
}

if [[ -z $1 ]]
then
    usage
fi

FPS=$1


bc -l << __EOF__
scale=3
spf=$FPS^-1
mspf=spf*1000.0
mspf
__EOF__
