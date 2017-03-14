package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

public class T10_trans_analysis_caseActinForm extends ActionForm {
	private String application_num="";
	private String party_id="";
	private String t_count ="";
	private String t_amt ="";
	private String count_percent="";
	private String amt_percent="";
	private String pattern ="";  
	private String group_type="";

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
	public String getGroup_type() {
		return group_type;
	}
	public void setGroup_type(String group_type) {
		this.group_type = group_type;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String applicationNum) {
		application_num = applicationNum;
	}
	public String getCount_percent() {
		return count_percent;
	}
	public void setCount_percent(String countPercent) {
		count_percent = countPercent;
	}
	public String getAmt_percent() {
		return amt_percent;
	}
	public void setAmt_percent(String amtPercent) {
		amt_percent = amtPercent;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String partyId) {
		party_id = partyId;
	}
}
