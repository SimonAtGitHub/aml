package com.ist.aml.report.controller;

import org.apache.struts.action.ActionForm;

public class T10_check_cust_keActionForm extends ActionForm {
	private String party_id ="";             
	private String party_name ="";         
	private String party_class_cd ="";       
	private String trans_rep;
	private String organkey="";
	private String organName="";                            
	private String order_check="";
	private String fashion ="asc";
	private String check_status;
	private String selectedPartyId="";
	public String getSelectedPartyId() {
		return selectedPartyId;
	}
	public void setSelectedPartyId(String selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
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
	public String getTrans_rep() {
		return trans_rep;
	}
	public void setTrans_rep(String trans_rep) {
		this.trans_rep = trans_rep;
	}
	public String getCheck_status() {
		return check_status;
	}
	public void setCheck_status(String check_status) {
		this.check_status = check_status;
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
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
}
