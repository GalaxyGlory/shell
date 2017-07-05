#! /bin/bash

declare -i a - q s=0
a=${1:-255}
mask="128 64 32 16 8 4 2 1"
Bmap=

echo "1's bits 128 64   32   16    8    4    2    1"
for i in $mask
do
    q=$((a/i))
    ((s+=q))
    [ $q -gt 0 ] && Bmap=$Bmap"__1__"||Bmap=$Bmap"__0__"
    a=$((a-q*i))
done

echo "  $s  : $Bmap"
