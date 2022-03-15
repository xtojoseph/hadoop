package com.niit.pig;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.pig.EvalFunc;
import org.apache.pig.data.Tuple;

public class NumToString extends EvalFunc<String> {
	static final Map<String, String> NUM_TO_WORD = getCompleteNumToWord();

	public String exec(Tuple input) throws IOException {
		if (input == null || input.size() == 0)
			return null;
		try {
			String inputString = (String) input.get(0);
			List<String> output = new ArrayList<>();
			inputString.chars().mapToObj(x -> (char) x).forEach(x -> {
				/**
				 * Logic to maintain spaces between words 
				 * eg: se7en => se seven en 
				 * eg: 123 => one two three
				 */
				if (!NUM_TO_WORD.containsKey(x.toString()) && !output.isEmpty()
						&& !NUM_TO_WORD.containsValue(output.get(output.size() - 1)))
					output.set(output.size() - 1, output.get(output.size() - 1) + x.toString());
				else
					output.add(NUM_TO_WORD.getOrDefault(x.toString(), x.toString()));
			});
			if (inputString.endsWith(".")) {
				output.remove(output.size() - 1);
				return String.join(" ", output).trim().concat(".");
			}
			return String.join(" ", output).trim();
		} catch (NullPointerException | IndexOutOfBoundsException e) {
			return StringUtils.EMPTY;
		}
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
