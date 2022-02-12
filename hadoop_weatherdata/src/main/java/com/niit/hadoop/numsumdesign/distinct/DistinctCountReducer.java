package com.niit.hadoop.numsumdesign.distinct;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class DistinctCountReducer extends Reducer<Text, IntWritable, Text, IntWritable> {

	@Override
	public void reduce(Text key, Iterable<IntWritable> values, Context context)
			throws IOException, InterruptedException {
		int count = 0;
		for (@SuppressWarnings("unused") IntWritable v : values) {
			count += v.get();
		}
		context.write(key, new IntWritable(count));
	}
}
