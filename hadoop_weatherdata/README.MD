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
