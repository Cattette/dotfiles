#!/usr/bin/env bash
# do not execute me, see initiate.sh instead
file="$1"

if [ -e "$file.laptop" ];
then
    mv -v $file $file.pc
    mv -v $file.laptop $file
else
    mv -v $file $file.laptop
    mv -v $file.pc $file
fi