package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

public class T10_capital_chainActionForm extends ActionForm {
	private String start_dt_display="";
	private String end_dt_display="";
	private String fashion ="asc";
	private String order_type="";
	private String acct_num = "";
	private String subjectno = "";
	private String opp_acct_num = "";
	private String opp_organkey="";
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getStart_dt_display() {
		return start_dt_display;
	}
	public void setStart_dt_display(String start_dt_display) {
		this.start_dt_display = start_dt_display;
	}
	public String getEnd_dt_display() {
		return end_dt_display;
	}
	public void setEnd_dt_display(String end_dt_display) {
		this.end_dt_display = end_dt_display;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	public String getAcct_num() {
		return acct_num;
	}
	public void setAcct_num(String acctNum) {
		acct_num = acctNum;
	}
	public String getSubjectno() {
		return subjectno;
	}
	public void setSubjectno(String subjectno) {
		this.subjectno = subjectno;
	}
	public String getOpp_acct_num() {
		return opp_acct_num;
	}
	public void setOpp_acct_num(String oppAcctNum) {
		opp_acct_num = oppAcctNum;
	}
	public String getOpp_organkey() {
		return opp_organkey;
	}
	public void setOpp_organkey(String oppOrgankey) {
		opp_organkey = oppOrgankey;
	}
	
}
