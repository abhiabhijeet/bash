#!/bin/sh

ifExists=$(ls /var/run/screen/S-ubuntu/ | grep -w "Screen_name")
if [[ -z "$ifExists" ]];then

	echo "[ `date` ] Screen does not exist"
else
	echo "[ `date` ] Screen found."
fi

#Check for running process

pid=$(ps -ef | grep "$STRING_NAME" | grep -vw "grep" | awk '{print $2}')

if [ -z "$pid" ];
then
	echo "Script not running Please check imediately"
else
	echo "Script is Runnning fine `hostname -i`"
fi
