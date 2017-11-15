#! /bin/bash

function ERROR
{
	MSG=$1
	echo -e "\033[31mERROR : $MSG\033[0m" >&2
	exit 42
}
