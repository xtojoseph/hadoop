#!/usr/bin/bash

#set the environment
export  PIG_SCRIPT_DIR=/media/sf_SharedFolder/scripts/analysis
export  HIVE_SCRIPT_DIR=/media/sf_SharedFolder/scripts/analysis
export  LOG_FILE=/media/sf_SharedFolder/scripts/analysis.log
truncate $LOG_FILE --size 0

echo "$(date) [MSG] Script Start Sucessfully " >> $LOG_FILE



echo "$(date) [INFO] Hive Analysis Initialization" >> $LOG_FILE
hive -f $HIVE_SCRIPT_DIR/demo_analysis.sql


echo "$(date) [INFO] Calculating Teamwise1st&2nd analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/Teamwise200.pig

echo "$(date) [INFO] Calculating 200 chasing analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/Chasingteam.pig

echo "$(date) [MSG] Script run Completed" >> $LOG_FILE