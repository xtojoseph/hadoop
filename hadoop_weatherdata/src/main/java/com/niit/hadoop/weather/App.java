package com.niit.hadoop.weather;

import java.util.Arrays;

import org.apache.hadoop.util.ToolRunner;

import com.niit.hadoop.filterdesign.FilterDriver;
import com.niit.hadoop.numsumdesign.AvgDriver;

public class App {

	public static void main(String[] args) throws Exception {
		int exit = 0;
		if ("Filter".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new FilterDriver(), Arrays.copyOfRange(args, 1, args.length));
		} else if ("Avg".equalsIgnoreCase(args[0])) {
			exit = ToolRunner.run(new AvgDriver(), Arrays.copyOfRange(args, 1, args.length));
		}
		System.out.println("Completed!!");
		System.exit(exit);
	}
}
