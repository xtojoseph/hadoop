package com.niit.hadoop.numsumdesign.distinct;

import java.io.IOException;

import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.mapreduce.Reducer;

public class DistinctReducer extends Reducer<FloatWritable, NullWritable, FloatWritable, NullWritable> {

	@Override
	public void reduce(FloatWritable key, Iterable<NullWritable> values, Context context)
			throws IOException, InterruptedException {
		context.write(key, NullWritable.get());
	}
}
