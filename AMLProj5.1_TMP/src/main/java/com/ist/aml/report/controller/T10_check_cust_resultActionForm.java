package com.ist.aml.report.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T10_check_cust_resultActionForm  extends ActionForm{
	private String party_id="";
	private String party_name="";
	private String party_class_cd="";
	private String organkey="";
	private String organName="";
	private String check_type="";
	private Date check_dt;
	private String check_result="";
	private String fashion="asc";
	private String order_check="";
	private String selectedPartyId="";
	private String check_start_dt="";
	private String check_end_dt="";
	
	public String getCheck_start_dt() {
		return check_start_dt;
	}
	public void setCheck_start_dt(String check_start_dt) {
		this.check_start_dt = check_start_dt;
	}
	public String getCheck_end_dt() {
		return check_end_dt;
	}
	public void setCheck_end_dt(String check_end_dt) {
		this.check_end_dt = check_end_dt;
	}
	public String getSelectedPartyId() {
		return selectedPartyId;
	}
	public void setSelectedPartyId(String selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
	}
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getParty_name() {
		return party_name;
	}
	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getCheck_type() {
		return check_type;
	}
	public void setCheck_type(String check_type) {
		this.check_type = check_type;
	}
	public Date getCheck_dt() {
		return check_dt;
	}
	public void setCheck_dt(Date check_dt) {
		this.check_dt = check_dt;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	
}
