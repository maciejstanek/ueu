#!/bin/bash

dirIn=img
dirOut=img_converted

if [ ! -d ./$dirIn ]; then
	echo "Directory ./$dirIn does not exist. Aborting"
	exit
fi

mkdir -p ./$dirOut
rm -rf ./$dirOut/*

fileList=(`ls -1 ./$dirIn`)
fileCount=0
for f in "${fileList[@]}" ; do
	((fileCount++))
	printf "% 4d%% %s\n" $(($fileCount*100/${#fileList[@]})) $f
done

