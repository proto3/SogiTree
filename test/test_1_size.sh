#! /bin/bash

source "test/test_common.sh"

EXE=$1
TREE_FILE=$2
WIDTH=$3

IFS=''
cat $TREE_FILE | $EXE |

while read LINE;
do
	LINE_WIDTH=$(echo -n "$LINE" | wc -c)

	if [ $LINE_WIDTH -ne $WIDTH ];
	then
		ERROR "Expecting line width to be $WIDTH and not $LINE_WIDTH with $TREE_FILE"
	fi

	#ALIENS=$(echo -n $LINE | sed -e 's/[ortTfF\- ]//g')
	ALIENS=$(echo -n $LINE | sed -e 's/[- rfFtTo]//g')

	if [ ! "$ALIENS" = "" ];
	then
		ERROR "Unknow chars :\"$ALIENS\" with $TREE_FILE"
	fi
done && echo -e "\033[32mOK\033[0m"
