#!/bin/bash
#
#milliseconds per frame to frames per second

function usage()
{
    echo "usage ./ms2fps.sh MS"
    exit -1
}

if [[ -z $1 ]]
then
    usage
fi

MS_PER_FRAME=$1


bc -l << __EOF__
scale=3
spf=$MS_PER_FRAME/1000.0
fps=spf^-1
fps
__EOF__
