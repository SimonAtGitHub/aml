package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

public class T10_trans_analysisActinForm extends ActionForm {
	private String party_id="";
	private String pattern ="";  
	private String t_count ="";
	private String t_amt ="";
	private String t_percent="";
	private String group_type="";
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
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
	public String getGroup_type() {
		return group_type;
	}
	public void setGroup_type(String group_type) {
		this.group_type = group_type;
	}
	public String getT_percent() {
		return t_percent;
	}
	public void setT_percent(String t_percent) {
		this.t_percent = t_percent;
	}
}
