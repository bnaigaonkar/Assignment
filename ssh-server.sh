#!/bin/bash
# Auther: Bhawgan Naigaonkar
# Bash script for ssh
# Date: 26/11/2012

localIP="192.168.1.43"
# Arguments validation
if [ "$#" == "0" ]; then 
	echo "Usage: setup.sh 192.168.2.48"
exit 0;
fi
# reading IP and appending to IP File
printf "$1 \n" > /tmp/arg
printf "$2 \n" >> /tmp/arg
printf "$3 \n" >> /tmp/arg

#ssh root@ip "cmd" >> /tmo/log.$$


# Remove , seperated arguments, and save o/p to /tmp/IP file
cat /tmp/arg | sed -n 1'p' | tr ',' '\n' > /tmp/IP
#Read first IP from /tmp/IP file
First_IP=`cat /tmp/IP | sed '2,$d'`
#calling xterm with ssh session in background
xterm -e "pssh -h $First_IP -l root ls;history > /tmp/file;scp -r /tmp/file $localIPi:/tmp/" &
if [ -f /tmp/file ];
then 
	#find command to used in ssh session 
	cmd=`awk  -F'[; ]' '{print $4}' /tmp/file`
	cat /tmp/IP | sed -n '2,$p' | awk '{print $1}' > /tmp/Remg_IP
	#Run command on other server
	xterm -e "pssh -h /tmp/Remg_IP -l root $cmd"
fi
