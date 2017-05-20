package com.controller.memoizer;

import org.cache2k.*;
import org.cache2k.processor.EntryProcessor;

import java.lang.reflect.Field;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.function.Function;

/**
 * Created by phuon on 16/05/2017.
 */
public class Memoizer{

	private static Memoizer instance;
	private static Cache cache;
	private Memoizer(){}

	public static Cache getInstance(){
		if(instance == null){
			instance = new Memoizer();
			cache = new Cache2kBuilder<String, Object>() {}
					.eternal(true)
					.build();
		}
		return cache;
	}

	/*public static Cache getCache() {
		return cache;
	}

	public static void setCache(Cache cache) {
		Memoizer.cache = cache;
	}*/
}
