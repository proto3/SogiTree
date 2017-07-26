#! /bin/bash

IN=$1
OUT=$2

WIDTH=$(wc -L $IN | cut -d' ' -f 1)
HEIGHT=$(wc -l $IN | cut -d' ' -f 1)

GREEN="0 179 0 "
DARK_GREEN="0 77 0 "
BROWN="153 77 0 "
DARK_BROWN="77 38 0 "
BLUE="204 255 204 "
GREY="51 26 0 "
DARK_GREY="61 61 42 "

echo P3 > $OUT
echo $WIDTH $HEIGHT >> $OUT
echo 255 >> $OUT

cat $IN |
sed -e "s/[^-orTtfFT]/${BLUE}/g" |
sed -e "s/f/${GREEN}/g" |
sed -e "s/F/${DARK_GREEN}/g" |
sed -e "s/t/${BROWN}/g" |
sed -e "s/[rT]/${DARK_BROWN}/g" |
sed -e "s/-/${GREY}/g" |
sed -e "s/o/${DARK_GREY}/g" >> $OUT
echo >> $OUT
