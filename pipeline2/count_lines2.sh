#!/bin/sh
### USAGE: ./count_lines2.sh <file_path>
# This is currently not being used any tool. It will be handy in the future,
# to design a pipeline that produces a standardized set outputs, that is yet to be defined.
sleeptime="$(((RANDOM%10)+1))"
start_time="$(date -u +%s)"
project_name="count_lines"
cwd=$(pwd)
python3 -c "from peppy import Project; import sys; p=Project('$cwd/project2/project_config.yaml'); exit(p.results_folder)" 2> rs.out
rs=`cat rs.out`
filename=$(basename $1)
sample_name="${filename%.*}"
rs_path="$rs/$sample_name"
mkdir -p $rs_path
touch $rs_path/$project_name\_running.flag
echo "dummy log" > $rs_path/$project_name\_log.md
echo "sleeping $sleeptime"
sleep $sleeptime
printf "num_lines\t$(wc -l $1 | sed -E 's/^[[:space:]]+//' | cut -f1 -d' ')" > $rs_path/stats.tsv
counts_file="dist.txt"
awk '{print length}' $1 | uniq > $rs_path/$counts_file
RScript --vanilla $(dirname $0)/plotHist.R $rs_path/$counts_file
printf "dist_file\tlength_dist.png" > $rs_path/objects.tsv
delta="$(($(date -u +%s)-$start_time))"
echo "Total of $delta seconds elapsed for process"
printf "Runtime\t$delta\nSuccess\t$(date)" > $rs_path/stats.tsv
mv $rs_path/$project_name\_running.flag $rs_path/$project_name\_completed.flag
