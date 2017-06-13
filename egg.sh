#!/bin/bash
function clear_tree () 
{
	for i in $(cat egg.txt|sort -r);
	do
		DIR=$i;
		if [ -d $DIR ];
		then
			echo "removing directory $DIR"; 
			rm -rf $DIR;
		fi;
	done;
}
 
function create_tree ()
{
	for i in $(cat egg.txt|sort);
	do
		DIR=$i;
		if [ ! -d $DIR ];
		then
			echo "creating directory $DIR"; 
			mkdir -p $DIR;
		fi;
	done;
}

STMT=$1

if [ "$STMT" = "--create" ];
then
	create_tree
	exit 0
fi

if [ "$STMT" = "--clear" ];
then
	clear_tree
	exit 0
fi

echo "Nothing to do"
exit 1;
