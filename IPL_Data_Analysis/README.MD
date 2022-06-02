# IPL data analysis
Project to implement and understand the Hadoop ecosystem.

Technologies used:
------------------


1. Flume - Data ingestion
2. Hive - Intermediate and Result Tables
3. Pig - Data pre-processing and analysis
4. PowerBI - Visualization from hive tables


About the Project:
----------------------------


Implementation of a complete pipeline from data ingestion to visualization of the IPL data.
Achieved by pipeline implemented by shell script.
Below analysis are done and visualized:
1. Power play analysis
2. Target 200+ score
3. Batsman analysis - strike rate, top 10, avg


Data Description
----------------


IPL data is used as a data source.
The files are as follows:
1. data/Matches2008-2020.csv – Match level details

2. data/Ball-By-Ball2008-2020.csv – Ball by ball delivery details

3. data/IPL Stadiums.txt - List of all stadiums and corresponding locations (used for data cleansing)

4. data/IPL Teams.txt - List of all teams (used for data cleansing)


Process Flow Details
--------------------

***Flume***
Configured as spool dir to pick up data and wrtie to hdfs.
scripts/lab.conf
Run the configuration using the below command:
flume-ng agent --conf $FLUME_HOME/conf --conf-file lab.conf --name a1 -Dflume.root.logger=INFO,console

***Pre-Processing***
Data cleansing part done by HIVE and PIG scripts.
Run the below shell script to perform the data cleansing process:
scripts/preprocess.sh

log details in scripts/preprocess.log

Details of preprocess.sh:

Hive is responsible for  database and tables creation 
Achieved via the following script:
scripts/preprocessing/hive_raw.sql

PIG is the component that does the preprocessing with the following pig latin script:
scripts/prepocessing/ipl_preprocessing.pig

***Analysis***
Above mentioned analysis are done with the help of below script:
scripts/analysis.sh
or
scripts/demo.sh

log are available in scripts/analysis.log

Details of analysis.sh:

Hive result tables are created by scripts/analysis/hive_analysis_tables.sh

PIG latin scripts in scripts/analysis/*.pig are used for the analysis

***Visualization***
Done in PowerBI via thrift API from HIVE - hiveserver2
Refer documentation/visualization.pbix


***PreRequisite***
Hadoop, HIVE, PIG, Flume, PowerBI preinstalled
hive --service metastore & hive --service hiveserver2 up and running.

Additional Configuration setup
------------------------------

HIVE is run as a remote metastore using HCatalog - MySQL for PIG and PowerBI to fetch details from hive.
Supporting configuration files are provided in configurations/
1. bashrc - exports for PIG_OPTS, HCAT_HOME
2. hdfs-site.xml - webhdfs and dfs.permissions
3. hive-env.sh.template -  export METASTORE_PORT=9084
4. hive-site.xml - javax.jdo.option.ConnectionURL, datanucleus.autoCreateSchema, datanucleus.fixedDatastore, datanucleus.autoStartMechanism, hive.metastore.uris, hive.metastore.port, javax.jdo.option.ConnectionPassword, ConnectionUserName
5. mysql-connector-java-<mysql version intalled>.jar - to be downloaded and placed in hive/lib
6. ClouderaHive - for setting up hive connection to PowerBI via thrift api.


***Special Mention to my fellow teammates in doing the analysis: Archana, Jishnu & Rahul***

***Courtsey to***
1. Kaggle for dataset and analysis points: ref(https://www.kaggle.com/code/dude431/ipl-detailed-analysis)
2. Hive Metatore and Hiveserver2 configuration setup: ref(http://www.thecloudavenue.com/2013/11/InstallingAndConfiguringHCatalogAndIntegratingWithPig.html)
3. Thabresh - cricket analysis project: ref(https://github.com/thabaresh-s/cricket-data-analysis-using-Hive-and-Pig)

***More Documentation in docmentation/***
