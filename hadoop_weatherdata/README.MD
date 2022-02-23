**Lab 2**

**Map (Filtering)**

Consider a Weather data set for this lab. The second column represents the date in yyyymmdd format. The sixth column records the maximum temperature of that day and the seventh column the minimum of that day.

1. Put the file into hdfs
2. Write a Map Reduce program to print to an output file the following:
  1. If the temperature is above 0 – &quot;It is a cold day&quot;
  2. If the temperature is below -3 – &quot;It is a freezing day&quot;
  

**Lab 2b**

**InputSplits, IdentityMapper and IdentityRedcuer**

1. Display the default block size
2. For the given file show the files, blocks and their locations
3. How are input splits calculated for a FileInputFormat?
4. What is the role of interface InputSplit, interface InputFormat and the RecordReader?
5. Run a map reduce task with no mapper and no reducer explicitly written? What do you observe?
6. Write a bare map-reduce job with default mapper and reducer.
  1. How many map and reduce tasks to you notice?
  2. Change the number of map tasks to 3 and re-run the program.
    1. By explicitly changing the number of map tasks
    2. By changing the number of input splits
  3. Set the number of reducers to a different value
  4. Set the number of reducers to 0.
    1. Does the Identity Reducer still run?
    2. What is the difference between the two?
    3. What is the name of the output file?
7. Write another bare map-reduce job
  1. Change the name of the output file to any name of your choice?
  2. What does the -r mean?
  
**Lab 3**

**MapReduce (Number Summations, Distinct)**

Consider a Weather data set for this lab. The second column represents the date in yyyymmdd format. The sixth column records the maximum temperature of that day and the seventh column the minimum of that day.

1. Write a Map Reduce program (using a ToolRunner class) to find the following:
  1. _Average_ temperature _every month_
  2. _Maximum_ temperature _every month_ (Use of **Combiners** )
2. Write a Map Reduce program to find all distinct temperature values

Hint: Map: filters and finds the temperatures

What should be the \&lt;k, v\&gt; be as output. Check NullWritable data type

1. Write a Map Reduce program to find the _number of entries_ for _every distinct month_ in the given dataset.
