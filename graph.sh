#!/bin/bash

dirIn=dat
dirGpi=gpi
dirOut=graph

if [ ! -d ./$dirIn ]; then
	echo "Directory ./$dirIn does not exist. Aborting"
	exit
fi

mkdir -p ./$dirGpi
mkdir -p ./$dirOut
rm -rf ./$dirGpi/*
rm -rf ./$dirOut/*

fileList=(`ls -1 ./$dirIn`)
for f in "${fileList[@]}" ; do
	printf "\033[36m%s\033[0m\n" $f
	sleep 0.5
done

