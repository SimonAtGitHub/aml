package com.ist.aml.report.dto;

import java.io.Serializable;

public class T10_trans_analysis_case implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5669700263309714766L;
	private String application_num="";
	private String party_id="";
	private String t_count ="";
	private String t_amt ="";
	private Double count_percent;
	private Double amt_percent;
	private String pattern ="";  
	private String group_type="";
	private String cast_type="";
	public String getCast_type() {
		return cast_type;
	}
	public void setCast_type(String castType) {
		cast_type = castType;
	}
	public String getPattern() {
		return pattern;
	}
	public void setPattern(String pattern) {
		this.pattern = pattern;
	}
	public String getT_count() {
		return t_count;
	}
	public void setT_count(String t_count) {
		this.t_count = t_count;
	}
	public String getT_amt() {
		return t_amt;
	}
	public void setT_amt(String t_amt) {
		this.t_amt = t_amt;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getGroup_type() {
		return group_type;
	}
	public void setGroup_type(String group_type) {
		this.group_type = group_type;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}
	public Double getCount_percent() {
		return count_percent;
	}
	public void setCount_percent(Double countPercent) {
		count_percent = countPercent;
	}
	public Double getAmt_percent() {
		return amt_percent;
	}
	public void setAmt_percent(Double amtPercent) {
		amt_percent = amtPercent;
	}
}
