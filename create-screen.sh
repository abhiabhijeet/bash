#! /bin/bash

scr_name="test"

pid=`screen -ls | grep -w $scr_name`
if [ -z "$pid" ];
then
	echo "Creating $scr_name and Running command to Launch UI"
	#screen -dmS $scr_name
	screen -dmS $scr_name  sh
	screen -S $scr_name -X stuff "cd /home/ubuntu
	"
	screen -S $scr_name -X stuff "bash run_script.sh
	"
else
	echo "found $scr_name"
fi
