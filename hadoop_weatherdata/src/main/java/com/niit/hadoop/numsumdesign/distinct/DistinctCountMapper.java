package com.niit.hadoop.numsumdesign.distinct;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class DistinctCountMapper extends Mapper<LongWritable, Text, Text, IntWritable> {

	@Override
	public void map(LongWritable keyIn, Text valueIn, Context context) throws IOException, InterruptedException {
		String line = valueIn.toString();
		String month = line.substring(6, 12);
		
		context.write(new Text(month), new IntWritable(1));
	}
}
