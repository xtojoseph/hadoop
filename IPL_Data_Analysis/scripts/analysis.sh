#!/usr/bin/bash

#set the environment
export  PIG_SCRIPT_DIR=/media/sf_SharedFolder/scripts/analysis
export  HIVE_SCRIPT_DIR=/media/sf_SharedFolder/scripts/analysis
export  LOG_FILE=/media/sf_SharedFolder/scripts/analysis.log
truncate $LOG_FILE --size 0

echo "$(date) [MSG] Script Start Sucessfully " >> $LOG_FILE



echo "$(date) [INFO] Hive Analysis Initialization" >> $LOG_FILE
hive -f $HIVE_SCRIPT_DIR/hive_analysis_tables.sql

echo "$(date) [INFO] Calculating city analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/city_analysis.pig

echo "$(date) [INFO] Calculating venue analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/venue_analysis.pig

echo "$(date) [INFO] Calculating power play innings 1" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/powerplayInning1Avg.pig

echo "$(date) [INFO] Calculating power play innings 2" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/powerplayInning2Avg.pig

echo "$(date) [INFO] Calculating power play dismissal avg innings 1" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/AvgInning1DismissalAvg.pig

echo "$(date) [INFO] Calculating power play dismissal avg innings 2" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/AvgInning2DismissalAvg.pig

echo "$(date) [INFO] Calculating power play runs innings 1" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/SumRunsInning1.pig

echo "$(date) [INFO] Calculating power play runs innings 2" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/SumRunsInning2.pig

echo "$(date) [INFO] Calculating power play max dismissal" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/maxDismissalPerYear.pig

echo "$(date) [INFO] Calculating batsmans analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/BatsmanStatus.pig

echo "$(date) [INFO] Calculating Teamwise1st&2nd analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/Teamwise200.pig

echo "$(date) [INFO] Calculating 200 chasing analysis" >> $LOG_FILE
pig -useHCatalog $PIG_SCRIPT_DIR/Chasingteam.pig

echo "$(date) [MSG] Script run Completed" >> $LOG_FILE