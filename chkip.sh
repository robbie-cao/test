#!/bin/bash

# setup:
# $ sudo apt-get install mailutils lynx
# $ crontab -e
# # m h  dom mon dow  command
# 0 */1 * * * /path/to/chkip.sh


function exip() { lynx --dump http://ipecho.net/plain; }

prev_ip=0

if [ -e ip_addr ]; then
    prev_ip=`cat ip_addr`
else
    echo "0.0.0.0" > ip_addr
fi

curr_ip=`exip`

#echo $prev_ip
#echo $curr_ip

if [ $prev_ip != $curr_ip ]; then
    mail -s "New IP: $curr_ip" user1@xxx.com user2@xxx.com < ip_addr
    echo $curr_ip > ip_addr
fi

