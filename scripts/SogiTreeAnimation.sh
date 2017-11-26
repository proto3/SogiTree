#! /bin/bash

PROGRAM=$1
ORIGINAL_TREE=${2:-seed.tree}
IMAGE_NUMBER=${3:-40}

TMP_FILE=.${0#./}.tmp

TMP_BASE_NAME=${ORIGINAL_TREE}
CURRENT_NAME=${ORIGINAL_TREE}

for I in $(seq 1 $IMAGE_NUMBER);
do
	RESULT_NAME=${TMP_BASE_NAME}.tmp.$I
	cat $CURRENT_NAME | $1 > $RESULT_NAME
	./tree2ppm.sh $RESULT_NAME $RESULT_NAME.ppm
	convert -sample %800 $RESULT_NAME.ppm $RESULT_NAME.png

	CURRENT_NAME=$RESULT_NAME
done

ffmpeg -r 10 -i $TMP_BASE_NAME.tmp.%d.png -r 10 $TMP_BASE_NAME.mp4
rm -f $TMP_BASE_NAME.tmp.*
