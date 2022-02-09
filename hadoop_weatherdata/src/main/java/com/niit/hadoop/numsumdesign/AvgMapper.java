package com.niit.hadoop.numsumdesign;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AvgMapper extends Mapper<LongWritable, Text, Text, FloatWritable> {

	@Override
	public void map(LongWritable keyIn, Text valueIn, Context context) throws IOException, InterruptedException {
		String line = valueIn.toString();
		String month = line.substring(6, 12);
		Float temp = Float.parseFloat(line.substring(48, 53));
		
		context.write(new Text(month), new FloatWritable(temp));
	}
}
