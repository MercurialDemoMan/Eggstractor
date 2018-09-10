#!bin/sh

#arguments: [nsp file]
if [ "$#" -ne 1 ]; then
	echo "usage: bash extract-nsp.sh [nsp file]"
fi

#output directory
mkdir "out"
mkdir "out/exefs"
mkdir "out/romfs"

#extract nsp archive
./hactool -t nca -k keys.ini $1 --romfsdir out/romfs --exefsdir out/exefs