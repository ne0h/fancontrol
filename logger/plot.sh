#!/bin/sh

if [ $# -eq 0 ]; then
	echo "Input file needed as argument."
	exit 1
fi

# extract date from $1
VARDATE=${1:13:10}

# generate diagram
echo "set terminal svg
set datafile separator ','
set xdata time
set timefmt '%Y-%m-%d %H:%M:%S'
set xrange['"$VARDATE" 00:00:00':'"$VARDATE" 23:59:59']
set output 'temperatures_"$VARDATE".svg'
plot '$1' using 1:2" | gnuplot
