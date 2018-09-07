#!bin/sh

#arguments: [nsp file]
if [ "$#" -ne 1 ]; then
	echo "usage: bash extract-nsp.sh [nsp file]"
fi

#output directory
mkdir "out"

#extract nsp archive
./hactool -t xci $1 --outdir out

#get biggest file
cd out/secure
biggest_file="out/secure/$(ls -S | head -1)"
cd ../..

./hactool -k keys.ini --exefsdir=out --romfs=out/RomFS.romfs $biggest_file

#cleanup
rm -r out/normal
rm -r out/secure
rm -r out/update