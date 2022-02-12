package com.niit.hadoop.weather;

import java.util.Arrays;

import org.apache.hadoop.util.ToolRunner;

import com.niit.hadoop.filterdesign.FilterDriver;
import com.niit.hadoop.numsumdesign.avg.AvgDriver;
import com.niit.hadoop.numsumdesign.distinct.DistinctTempCountDriver;
import com.niit.hadoop.numsumdesign.distinct.DistinctTempDriver;
import com.niit.hadoop.numsumdesign.max.MaxTempDriver;

public class App {

	public static void main(String[] args) throws Exception {
		int exit = 0;
		if ("Filter".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new FilterDriver(), Arrays.copyOfRange(args, 1, args.length));
		} else if ("Avg".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new AvgDriver(), Arrays.copyOfRange(args, 1, args.length));
		} else if ("Max".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new MaxTempDriver(), Arrays.copyOfRange(args, 1, args.length));
		} else if ("Distinct".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new DistinctTempDriver(), Arrays.copyOfRange(args, 1, args.length));
		} else if ("count".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new DistinctTempCountDriver(), Arrays.copyOfRange(args, 1, args.length));
		}
		System.out.println("Completed!!");
		System.exit(exit);
	}
}
