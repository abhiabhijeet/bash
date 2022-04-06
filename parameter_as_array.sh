#!/usr/bin/env bash

export SPARK_HOME=/usr/lib/spark/

root_dir="/home/ubuntu/"
jar_suffix_path="target/scala-2.11/assembly-0.1.jar"
jar_path="${root_dir}/${jar_suffix_path}"
main_class="com.x.y.z.p"

declare -a array=("X" "Y" "Z")
# get length of an array
arraylength=${#array[@]}

# use for loop to read all values and indexes
for (( i=1; i<${arraylength}+1; i++ ));
do
#checking and creating directory for current day
  if [ ! -d /home/ubuntu/hdp/log/$(date +%F) ]; then
    mkdir -p /home/ubuntu/hdp/log/$(date +%F);
  fi
  ${SPARK_HOME}bin/spark-submit --master local --class "$main_class" "$jar_path" ${array[$i-1]} $x $y $z > /home/ubuntu/hdp/log/$(date +%F)/${array[$i-1]}_Process_$(date +%F).log 2>&1
done
