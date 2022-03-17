package com.niit.pig;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import org.apache.pig.FilterFunc;
import org.apache.pig.backend.executionengine.ExecException;
import org.apache.pig.data.Tuple;

public class IsStopWord extends FilterFunc {

	static final List<String> STOP_WORDS = Arrays.asList("the", "and", "this", "is", "an", "of");

	@Override
	public Boolean exec(Tuple input) throws IOException {
		try {
			if (input == null || input.size() == 0)
				return Boolean.FALSE;
			String word = (String) input.get(0);
			return STOP_WORDS.contains(word.toLowerCase());
		} catch (ExecException | NullPointerException ee) {
			return Boolean.FALSE;
		}
	}
}
