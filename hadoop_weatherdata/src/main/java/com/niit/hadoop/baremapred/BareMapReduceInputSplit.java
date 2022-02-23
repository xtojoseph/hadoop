package com.niit.hadoop.baremapred;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;

public class BareMapReduceInputSplit extends Configured implements Tool {

	public static final String OUTPUT_BASENAME = "mapreduce.output.basename";

	@Override
	@SuppressWarnings("deprecation")
	public int run(String[] args) throws Exception {
		Job job = new Job(getConf());
		job.setJarByClass(BareMapReduceInputSplit.class);
		job.setJobName("Bare Map Reduce Input Split modified");

		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		/***
		 * Enforce no reducer to kick in, hence map output is written into HDFS
		 */
		job.setNumReduceTasks(0);

		/***
		 * Enforce task to split input into 3, so file_size/3 = 26474 with the help of
		 * "mapreduce.input.fileinputformat.split.maxsize"
		 */
		job.getConfiguration().set(FileInputFormat.SPLIT_MAXSIZE, "26474");

		/***
		 * Change default naming convention of output file
		 */
		job.getConfiguration().set(OUTPUT_BASENAME, "op");

		job.setOutputKeyClass(LongWritable.class);
		job.setOutputValueClass(Text.class);

		return job.waitForCompletion(true) ? 0 : 1;
	}
}
