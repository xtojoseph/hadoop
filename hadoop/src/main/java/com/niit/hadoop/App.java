package com.niit.hadoop;

import java.net.URI;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IOUtils;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) throws Exception {
		String uri_op = args[0];
		String op_result = args[1];
		Path filePath = new Path(uri_op);
		Path opPath = new Path(op_result);

		Configuration con = new Configuration(); // core-site.xml
		FileSystem fs = FileSystem.get(URI.create(uri_op), con);
		FSDataInputStream in = null;
		FSDataOutputStream out = null;
		try {
			out = fs.create(filePath);
			out.writeChars("Writing into HDFS doc\nwill New line work here?\nlet us see in HDFS doc\n");
			in = fs.open(filePath);
			IOUtils.copyBytes(in, System.out, 4096, false);
		} finally {
			IOUtils.closeStream(in);
			in.close();
			out.close();
			fs.close();
		}
		@SuppressWarnings("deprecation")
		Job job = new Job();
		job.setJarByClass(App.class);
		job.setJobName("Occurence Job");
		FileInputFormat.addInputPath(job, filePath);
		FileOutputFormat.setOutputPath(job, opPath);

		job.setMapperClass(AppMapper.class);
		job.setReducerClass(AppReducer.class);

		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(IntWritable.class);

		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}
