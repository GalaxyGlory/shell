#! /bin/bash

ar=(a b c xy z)
for i in "${!ar[@]}"
do
    echo "index $i: ${ar[$i]}"
done
