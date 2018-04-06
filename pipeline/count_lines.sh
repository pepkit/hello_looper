#!/bin/bash
linecount=`wc $1 -l | cut -f1 -d' '`
echo "Number of lines: $linecount"
