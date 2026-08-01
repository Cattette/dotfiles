#!/bin/bash

colorspace="sRGB"
name="unamed"
monochrome=""
format="avif"
colorN="256"
resizeP="100"

while [[ $# -gt 0 ]]; do
    case "$1" in
        -bw)
            colorspace="gray"
            shift
            ;;
        -1b)
            monochrome="-monochrome"
            shift
            ;;
        -r)
            resizeP="$2"
            shift 2   # consume both "-R" and its value "50"
            ;;
        -c)
            colorN="$2"
            shift 2   # consume both "-R" and its value "50"
            ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            name="$1"
            shift
            ;;
    esac
done

wl-paste -t image/png | magick - -resize "$resizeP"% -colors $colorN -colorspace $colorspace $monochrome -format avif "./$name".avif

echo "done!"

exit 0

