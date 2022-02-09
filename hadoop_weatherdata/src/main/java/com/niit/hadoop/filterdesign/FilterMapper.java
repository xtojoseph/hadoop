package com.niit.hadoop.filterdesign;

import java.io.IOException;

import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

public class FilterMapper extends Mapper<LongWritable, Text, Text, Text> {

	@Override
	public void map(LongWritable keyIn, Text valueIn, Context context) throws IOException, InterruptedException {
		String line = valueIn.toString();
		String mapKey = line.substring(6, 14);
		Float mapValue = Float.parseFloat(line.substring(48, 53));
		
		if (mapValue < -3)
			context.write(new Text(mapKey), new Text(mapValue + " --- It is a freezing day - "));
		else if (mapValue < 0)
			context.write(new Text(mapKey), new Text(mapValue + " --- It is a cold day - "));
	}
}
