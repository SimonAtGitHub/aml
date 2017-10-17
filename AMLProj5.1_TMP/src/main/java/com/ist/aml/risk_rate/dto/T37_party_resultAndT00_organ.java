package com.ist.aml.risk_rate.dto;

public class T37_party_resultAndT00_organ extends T37_party_result {
	
	private static final long serialVersionUID = 1L;
	private String organkey;
	private String organname;
	
	//ÐÐÊý
	private int rownum;
	
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "T37_party_resultAndT00_organ [organkey=" + organkey + ", organname=" + organname + ", rownum=" + rownum
				+ "]";
	}
}
