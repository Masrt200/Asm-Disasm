#!/bin/bash


for i in {0..9}
do
for j in {0..9}
do
for k in {0..9}
do
for l in {0..9}
do

res=$(./punk77 $i $j $k $l)
if echo $res | grep -q 5
then
echo "$i$j$k$l"
fi
done
done
done
done
