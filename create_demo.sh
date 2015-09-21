#!/bin/bash

##################################
###### Update variables ##########
##################################
export HDP_USER=admin
export HDP_USER_HOME=/user/admin
export HDP_OLD_USER_HOME=/user/ccasano
###################################

find . -type f -name create_demo.hsql -print0 | xargs -0 sed -i "s,$HDP_OLD_USER_HOME,$HDP_USER_HOME,g"

echo Creating Demo Files For User: $HDP_USER
echo ...in the following directory: $HDP_USER_HOME

#hadoop fs -rm -R -skipTrash $HDP_USER_HOME/MachineData

echo Creating folders...
hadoop fs -mkdir $HDP_USER_HOME/MachineData
hadoop fs -mkdir $HDP_USER_HOME/MachineData/sensordata/
hadoop fs -mkdir $HDP_USER_HOME/MachineData/devicedata/
hadoop fs -mkdir $HDP_USER_HOME/MachineData/logdata/

hadoop fs -put sensordata.csv $HDP_USER_HOME/MachineData/sensordata/sensordata.csv
hadoop fs -put devicedata.csv $HDP_USER_HOME/MachineData/devicedata/devicedata.csv
hadoop fs -put logdata.csv $HDP_USER_HOME/MachineData/logdata/logdata.csv

sudo -u hdfs hadoop fs -chown -R $HDP_USER $HDP_USER_HOME/MachineData
sudo -u hdfs hadoop fs -chmod -R 777 $HDP_USER_HOME/MachineData

hadoop fs -ls $HDP_USER_HOME/MachineData/

echo Creating Hive tables...

hive -f create_demo.hsql
