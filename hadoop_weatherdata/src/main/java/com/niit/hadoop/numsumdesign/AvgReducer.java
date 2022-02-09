package com.niit.hadoop.numsumdesign;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class AvgReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {

	@Override
	public void reduce(Text key, Iterable<FloatWritable> values, Context context)
			throws IOException, InterruptedException {
		float sum = 0;
		int number = 0;
		for (FloatWritable v : values) {
			sum += v.get();
			number++;
		}
		float avg = sum / number;
		
		context.write(key, new FloatWritable(avg));
	}
}
