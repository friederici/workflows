#!/bin/bash -ue
filesize=`wc -c < infile`
halfsize=`expr ${filesize} / 2`
dd if=infile of=out1 bs=1 count=${halfsize}
dd if=infile of=out2 bs=1 skip=${halfsize}
