package com.niit.hadoop.numsumdesign;

import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;

public class AvgDriver extends Configured implements Tool {

	@Override
	@SuppressWarnings("deprecation")
	public int run(String[] args) throws Exception {
		Job job = new Job(getConf());
		job.setJarByClass(AvgDriver.class);
		job.setJobName("Avg Job");
		
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		
		job.setMapperClass(AvgMapper.class);
		job.setReducerClass(AvgReducer.class);
		
		job.setMapOutputKeyClass(Text.class);
		job.setMapOutputValueClass(FloatWritable.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(FloatWritable.class);
		
		return job.waitForCompletion(true) ? 0 : 1;
	}
}
