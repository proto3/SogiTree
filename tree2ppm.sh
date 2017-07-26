#! /bin/bash

IN=$1
OUT=$2

WIDTH=$(wc -L $IN | cut -d' ' -f 1)
HEIGHT=$(wc -l $IN | cut -d' ' -f 1)

GREEN="0 255 0 "
DARK_GREEN="0 128 0 "
BROWN="192 192 128 "
DARK_BROWN="128 128 64 "
BLUE="128 128 255 "
BLACK="0 0 0 "

echo P3 > $OUT
echo $WIDTH $HEIGHT >> $OUT
echo 255 >> $OUT

cat $IN |
sed -e "s/[^-orTtfT]/${BLUE}/g" |
sed -e "s/[fF]/${GREEN}/g" |
sed -e "s/[rtT]/${BROWN}/g" |
sed -e "s/[-orTtfT]/255 0 255 /g" >> $OUT
echo >> $OUT
