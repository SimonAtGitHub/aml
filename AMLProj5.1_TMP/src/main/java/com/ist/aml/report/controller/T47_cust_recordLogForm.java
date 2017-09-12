package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

public class T47_cust_recordLogForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	private String create_user;
	private String party_id;
	private String create_dt;
	
	
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	
}
