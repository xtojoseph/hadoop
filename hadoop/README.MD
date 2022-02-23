**Lab 1**

**Basic HDFS Read/Write Files**

Instructions: 1. Open any java IDE and create a project

2. Add the following .jar files in the library of your project

hadoop-client-3.2.2,

hadoop-common-3.2.2,

hadoop-mapreduce-client-core-3.2.2

3. Write your java program and create a jar file of your project

4. Start Hadoop

5. run the command _hadoop jar pathOfJarFile.jar IParguments OPpath_

1. Create a file with the following text on local filesystem

&quot; &quot;

1. Transfer this file into HDFS

hdfs dfs –ls /

hdfs dfs -mkdir \&lt;hdfs path\&gt;

hdfs dfs –put /file\_path /destination

to remove files from HDFS

hdfs dfs –rm \&lt;hdfs path\&gt;

1. Write a java program to read given file from HDFS
2. Modify the program to read the same file twice from HDFS
3. Modify the program to read from offset position 5 to 10
4. Write a java program to count the occurrence of every word in the file
5. Write a java program to write a file to HDFS.
