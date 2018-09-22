#!bin/sh

#arguments: [nsp file]
if [ "$#" -ne 1 ]; then
	echo "usage: bash extract-nsp.sh [nsp file]"
fi

#output directory
mkdir "out"

#extract nsp archive
./hactool -t pfs0 $1 --outdir out

#get biggest file
cd out
biggest_file="out/$(ls -S | head -1)"
cd ..

#extract nca file
mkdir "out/exefs"
mkdir "out/romfs"

#extract nca
./hactool -t nca -k keys.ini $1 --romfsdir out/romfs --exefsdir out/exefs