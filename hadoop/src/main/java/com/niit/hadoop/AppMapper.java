package com.niit.hadoop;

import java.io.IOException;
import java.util.Arrays;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class AppMapper extends Mapper<LongWritable, Text, Text, IntWritable>{

	@Override
	public void map(LongWritable keyIn, Text valueIn, Context context){
		String line = valueIn.toString();
		Arrays.asList(line.split(" ")).forEach(s -> {
			try {
				context.write(new Text(s), new IntWritable(1));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
	}
}
