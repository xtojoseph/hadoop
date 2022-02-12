package com.niit.hadoop.numsumdesign.max;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class MaxReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {

	@Override
	public void reduce(Text key, Iterable<FloatWritable> values, Context context)
			throws IOException, InterruptedException {
		float max = Float.NEGATIVE_INFINITY;
		for (FloatWritable v : values) {
			max = (max < v.get() ? v.get() : max);
		}
		
		context.write(key, new FloatWritable(max));
	}
}
