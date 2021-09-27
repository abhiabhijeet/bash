#!/bin/sh

function send_pager(){
	ip="$1"
	#pd-send -k "$PAGER_KEY" -t trigger -d "Write Message Here" -i `date +%s`
}
ifExists=$(ls /var/run/screen/S-ubuntu/ | grep -w "Screen_name")
if [[ -z "$ifExists" ]];then

	echo "[ `date` ] Screen does not exist,sending pager alert."
	ssh ubuntu@$MachineIP "$(typeset -f);send_pager `hostname -I`"
else
	echo "[ `date` ] Screen found."
fi
function pager(){
	ip="$1"
	pd-send -k "$PAGER_KEY" -t trigger -d "Write Message Here" -i `date +%s`
}
pid=$(ps -ef | grep "$STRING_NAME" | grep -vw "grep" | awk '{print $2}')

if [ -z "$pid" ];
then
	echo "Script not running Please check imediately"
	ssh ubuntu@$MachineIP "$(typeset -f);pager `hostname -i`"
else
	echo "Script is Runnning fine `hostname -i`"
fi
