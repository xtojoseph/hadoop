package com.niit.hadoop.baremapred;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;

public class BareMapReduce extends Configured implements Tool {

	@Override
	@SuppressWarnings("deprecation")
	public int run(String[] args) throws Exception {
		Job job = new Job(getConf());
		job.setJarByClass(BareMapReduce.class);
		job.setJobName("Bare Map Reduce Job");

		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		/***
		 * Identity Mapper and Identity Reducer kicks in
		 */

		job.setOutputKeyClass(LongWritable.class);
		job.setOutputValueClass(Text.class);

		return job.waitForCompletion(true) ? 0 : 1;
	}
}
