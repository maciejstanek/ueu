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
	name=${f%%.*}

	echo "gnuplot> set logscale x" >> ./$dirGpi/$name.gpi
	echo "gnuplot> set xlabel 'Czestotliwosc [Hz]'" >> ./$dirGpi/$name.gpi
	echo "gnuplot> set ylabel 'Wzmocnienie [dB]'" >> ./$dirGpi/$name.gpi
	echo "gnuplot> plot 'lo.dat' using 1:2 smooth csplines notitle, '' using 1:2 with points pointtype 7 notitle" >> ./$dirGpi/$name.gpi

	sleep 0.1
done

