package com.niit.pig;

import java.io.IOException;
import java.util.HashMap;
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
			String lastChar = "";

			/**
			 * Handle full stop
			 */
			if (inputString.endsWith(".")) {
				lastChar = ".";
				inputString = StringUtils.chop(inputString);
			}

			/**
			 * Replace number with words
			 */
			for (Map.Entry<String, String> e : NUM_TO_WORD.entrySet()) {
				inputString = inputString.replaceAll(e.getKey(), " " + e.getValue() + " ");
			}

			/**
			 * Handle intermediate whitespace and append full stop
			 */
			return inputString.replaceAll("  ", " ").trim().concat(lastChar);
		} catch (NullPointerException e) {
			return StringUtils.EMPTY;
		}
	}

	private static Map<String, String> getCompleteNumToWord() {
		Map<String, String> numToWord = new HashMap<>();
		/**
		 * Key - regex; Value - number in words
		 */
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
		numToWord.put("\\.", "point");
		return numToWord;
	}
}
