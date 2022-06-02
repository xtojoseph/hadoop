#!/usr/bin/bash

#set the environment
export  PIG_SCRIPT_DIR=/media/sf_SharedFolder/scripts/preprocessing
export  HIVE_SCRIPT_DIR=/media/sf_SharedFolder/scripts/preprocessing
export LOG_FILE=/media/sf_SharedFolder/scripts/preprocessing.log
truncate $LOG_FILE --size 0

echo "$(date) [MSG] Script Start Sucessfully " >> $LOG_FILE

echo "$(date) [INFO] Hive Preprocessing Initialization" >> $LOG_FILE
hive -f $HIVE_SCRIPT_DIR/hive_raw.sql

echo "$(date) [INFO] Preprocessing ..." >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/ipl_preprocessing.pig


echo "$(date) [MSG] Script run Completed" >> $LOG_FILE