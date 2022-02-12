package com.niit.hadoop.numsumdesign.distinct;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;

public class DistinctTempDriver extends Configured implements Tool {

	@Override
	@SuppressWarnings("deprecation")
	public int run(String[] args) throws Exception {
		Job job = new Job(getConf());
		job.setJarByClass(DistinctTempDriver.class);
		job.setJobName("Distinct Job");
		
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		job.setMapperClass(DistinctMapper.class);
		job.setReducerClass(DistinctReducer.class);
		
		job.setOutputKeyClass(FloatWritable.class);
		job.setOutputValueClass(NullWritable.class);
		
		return job.waitForCompletion(true) ? 0 : 1;
	}
}
