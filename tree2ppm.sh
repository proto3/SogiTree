#! /bin/bash

IN=$1
OUT=$2

WIDTH=$(wc -L sample.tree | cut -d' ' -f 1)
HEIGHT=$(wc -l sample.tree | cut -d' ' -f 1)

echo P3 > $OUT
echo $WIDTH $HEIGHT >> $OUT
echo 255 >> $OUT

cat $IN |
sed -e 's/[^-orTtfT]/255 255 255 /g' |
sed -e 's/[-orTtfT]/0   0   0 /g' >> $OUT
echo >> $OUT
