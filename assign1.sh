#!/bin/bash
#echo "${@: -1}"
if [ "$#" == "0" ]; then 
	echo "Usage: setup.sh 192.168.2.48"
exit 0;
fi
# reading IP and appending to IP File
printf "$1 \n" > /tmp/IP
printf "$2 \n" >> /tmp/IP
printf "$3 \n" >> /tmp/IP

# Handling , seperated IP.
cmd=`script -f /var/log/$(date +"%d-%b-%y_%H-%M-%S")_shell.log`

for i in $(cat /tmp/IP | sed -n 1'p' | tr ',' '\n')
	do 
		CMD_OUT=$(ssh root@$i "$cmd") >> /tmp/log.$$
		CMD_OUT_1=$(ssh root@$i "$cmd") >> /tmp/log.$$
		echo $CMD_OUT
done
