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
	
	# Gain characteristics
	echo "set logscale x" >> ./$dirGpi/${name}_gain.gpi
	echo "set xlabel 'Czestotliwosc [Hz]'" >> ./$dirGpi/${name}_gain.gpi
	echo "set ylabel 'Wzmocnienie [dB]'" >> ./$dirGpi/${name}_gain.gpi
	echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0" >> ./$dirGpi/${name}_gain.gpi
	echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0" >> ./$dirGpi/${name}_gain.gpi
	echo "set terminal png size 1000,500" >> ./$dirGpi/${name}_gain.gpi
	echo "set output './$dirOut/${name}_gain.png'" >> ./$dirGpi/${name}_gain.gpi
	echo "plot './$dirIn/${name}.dat' using 1:2 smooth csplines notitle, '' using 1:2 with points pointtype 7 notitle" >> ./$dirGpi/${name}_gain.gpi
	gnuplot ./$dirGpi/${name}_gain.gpi

	# Phase characteristics
	echo "set logscale x" >> ./$dirGpi/${name}_phase.gpi
	echo "set xlabel 'Czestotliwosc [Hz]'" >> ./$dirGpi/${name}_phase.gpi
	echo "set ylabel 'Faza [stopnie]'" >> ./$dirGpi/${name}_phase.gpi
	echo "set grid ytics lc rgb '#bbbbbb' lw 1 lt 0" >> ./$dirGpi/${name}_phase.gpi
	echo "set grid xtics lc rgb '#bbbbbb' lw 1 lt 0" >> ./$dirGpi/${name}_phase.gpi
	echo "set terminal png size 1000,500" >> ./$dirGpi/${name}_phase.gpi
	echo "set output './$dirOut/${name}_phase.png'" >> ./$dirGpi/${name}_phase.gpi
	echo "plot './$dirIn/${name}.dat' using 1:3 smooth csplines notitle, '' using 1:3 with points pointtype 7 notitle" >> ./$dirGpi/${name}_phase.gpi
	gnuplot ./$dirGpi/${name}_phase.gpi

done

