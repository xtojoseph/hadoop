package com.niit.hadoop.numsumdesign.distinct;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class DistinctMapper extends Mapper<LongWritable, Text, FloatWritable, NullWritable> {

	@Override
	public void map(LongWritable keyIn, Text valueIn, Context context) throws IOException, InterruptedException {
		String line = valueIn.toString();
		Float temp = Float.parseFloat(line.substring(48, 53));
		
		context.write(new FloatWritable(temp), NullWritable.get());
	}
}
