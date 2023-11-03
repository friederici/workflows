#!/bin/bash -ue
filesize=`wc -c < infile`
stress-ng --vm-bytes ${filesize} --vm-keep -m 1 -t 10
halfsize=`expr ${filesize} / 2097152`
dd if=/dev/zero of=out1 bs=1M count=${halfsize}
dd if=/dev/zero of=out2 bs=1M count=${halfsize}
