#!/bin/bash
#this script is to be placed inside svf:llvm50 docker image
/home/ysui/llvm-5.0.0/llvm-5.0.0.obj/bin/opt -mem2reg $1 -o "$1".opt && \
/usr/bin/time --verbose /SVF-master/Release-build/bin/wpa -"$2" "$1".opt 2>"$1"."$2".log 1>"$1"."$2".stat
