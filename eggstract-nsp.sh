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

#get title key
tik_file="$(find . -name "*.tik")"
title_key="$(../extract-titlekey $tik_file)"
cd ..

#extract nca file
mkdir "out/exefs"
mkdir "out/romfs"

if [ -z "$tik_file" ]; then

	./hactool -t nca -k keys.ini --exefsdir=out/exefs --romfsdir=out/romfs $biggest_file

else

	./hactool -t nca -k keys.ini --titlekey=$title_key --exefsdir=out/exefs --romfsdir=out/romfs $biggest_file

fi

#cleanup
rm out/*.nca
rm out/*.cert
rm out/*.tik
rm out/*.xml