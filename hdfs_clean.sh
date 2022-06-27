#!/bin/bash
now=$(date +%s);
days_to_keep=30

hdfs dfs -ls /pathname | while read i; do

file_date=`echo $i | awk '{print $6}'`;
file_name=`echo $i | awk '{print $8}'`;

difference=$(( ($now - $(date -d "$file_date" +%s)) / (24 * 60 * 60) ));
if [ $difference -gt $days_to_keep ]; then
	echo "Deleting $file_name older than $days_to_keep and date is $file_date";
	hdfs dfs -rm -r $file_name
fi
done
