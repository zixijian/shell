#!/bin/bash
#by zixjian
#example: "bash c.sh 4.9" (version
ln -sf /usr/bin/gcc-$1 /usr/bin/aarch64-linux-gnu-gcc
ln -sf /usr/bin/g++-$1 /usr/bin/aarch64-linux-gnu-g++
ln -sf /usr/bin/gcc-$1 /usr/bin/gcc
ln -sf /usr/bin/g++-$1 /usr/bin/g++

