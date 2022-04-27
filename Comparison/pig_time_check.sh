#!/bin/bash
rm -r /home/hdoop/PIG/sample/comparison/$2

START_TIME=$(date +"%s")

time pig -x local -f /home/hdoop/codebase/hadoop/Comparison/$1 -param outDir=$2

END_TIME=$(date +"%s") 
DIFF=$(($END_TIME-$START_TIME))
echo "$(($DIFF / 60)) minutes and $(($DIFF % 60)) seconds."
