#!/bin/bash

EGG=" app app/business app/controllers app/models app/rest app/scripts app/templates app/views app/webservices cache cert config css data docker fonts logs media media/images runtime runtime/js themes tmp tools web web/css web/css/images web/fonts web/js web/js/runtime web/media web/media/images "

function clear_tree () 
{
	for i in $(echo $EGG_TREE|sort);
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
	for i in $(echo $EGG_TREE|sort -r);
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
