package com.niit.pig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class NumToString extends EvalFunc<String> {
	static final Map<String, String> NUM_TO_WORD = getCompleteNumToWord();

	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() == 0)
			return null;
		String str = (String) input.get(0);
		List<String> output = new ArrayList<>();
		str.chars().mapToObj(x -> (char) x).forEach(x -> output.add(NUM_TO_WORD.getOrDefault(x.toString(), x.toString())));
		if (str.endsWith(".")) {
			output.remove(output.size()-1);
			return String.join(" ", output).concat(".");
		}
		return String.join(" ", output);
	}

	private static Map<String, String> getCompleteNumToWord() {
		Map<String, String> numToWord = new HashMap<>();
		numToWord.put("1", "one");
		numToWord.put("2", "two");
		numToWord.put("3", "three");
		numToWord.put("4", "four");
		numToWord.put("5", "five");
		numToWord.put("6", "six");
		numToWord.put("7", "seven");
		numToWord.put("8", "eight");
		numToWord.put("9", "nine");
		numToWord.put("0", "zero");
		numToWord.put(".", "point");
		return numToWord;
	}
}
