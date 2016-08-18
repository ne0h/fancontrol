#!/bin/sh
TEMPERATUR=`curl -s -X GET http://fancontrol/`
echo `date "+%Y-%m-%d %H:%M:%S"`","${TEMPERATUR:12:5} \
>> /var/services/homes/max/temperatures/temperatures_`date +%Y-%m-%d`.log
