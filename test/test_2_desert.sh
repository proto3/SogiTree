#! /bin/bash

source "test/test_common.sh"

EXE=$1
TREE_FILE=$2

cat $TREE_FILE | grep -q -E '[fFtTr]';
IS_SOURCE_DESERT=$?

cat $TREE_FILE | $EXE | grep -q -E '[fFtTr]';
IS_RESULT_DESERT=$?

echo $IS_SOURCE_DESERT $IS_RESULT_DESERT

if [ $IS_SOURCE_DESERT -eq 1 -a $IS_RESULT_DESERT -eq 0 ];
then
	ERROR "You cant have a tree from a desert like $TREE_FILE"
fi
echo -e "\033[32mOK\033[0m"
