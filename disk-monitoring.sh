#!/bin/bash

machineip=`dig +short myip.opendns.com @resolver1.opendns.com`
#machineip=`ifconfig.io`
message="Disk Utilization is above 90%, Machine-IP:$machineip, User:[`whoami`]"

df -H | grep "/dev/path/LVMVolGroup-esdata" | awk '{ print $5 " " $1 }' | while read output;
do
  #echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge 90 ]; then
    pd-send -k PD_KEY -t trigger -d "$message" -i `date +%s`
    echo "Running out of space \"$partition ($usep%)\""
  else
   echo "Running Fine"
  fi
done
