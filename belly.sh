#!/bin/sh
# $1 is start
# $2 is length
# $3 is file

start=$1
end=$(( $1 + $2 ))
sed -n "${start}, ${end}p" < $3 
