#! /bin/bash

scr_name="test"

pid=`screen -ls | grep -w $scr_name`
if [ -z "$pid" ];
then
	#screen -dmS $scr_name
	screen -dmS $scr_name  sh
	screen -S $scr_name -X stuff "cd /home/ubuntu
	"
	screen -S $scr_name -X stuff "bash un_script.sh
	"
else
	echo "found $scr_name"
fi
