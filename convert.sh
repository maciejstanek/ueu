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
	printf "\033[37;46;1m% 4d%%\033[0m \033[36m%s\033[0m\n" $(($fileCount*100/${#fileList[@]})) $f
	
	convert ./$dirIn/$f\
		-negate\
		./$dirOut/$f

	if [ $fileCount -eq 3 ]; then
		exit
	fi
done

