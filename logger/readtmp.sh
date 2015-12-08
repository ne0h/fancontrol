#!/bin/sh
echo `date "+%Y-%m-%d %H:%M:%S"`","`curl -i -X GET http://192.168.1.174/` \
>> /var/services/homes/max/temperatures/temperatures_`date +%Y-%m-%d`.log
