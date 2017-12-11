package com.ist.aml.report.bo;

import java.text.CollationKey;
import java.text.Collator;
import java.util.Comparator;
import java.util.Map;

public class CountryComparator implements Comparator{
	
	private Map map;
	Collator collator=Collator.getInstance();
	public CountryComparator(Map map){
		this.map=map;
	}
	
	public int compare(Object o1, Object o2) {
		Object o3=map.get(o1);
		Object o4=map.get(o2);
		
		CollationKey key1=collator.getCollationKey(o3.toString());
		CollationKey key2=collator.getCollationKey(o4.toString());
		
		return key1.compareTo(key2);
		
	}
	
}
