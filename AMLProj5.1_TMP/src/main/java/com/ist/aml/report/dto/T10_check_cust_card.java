package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_check_cust_card implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8676643918621593600L;
	private String party_id ="";             
	private String party_name ="";         
	private String party_class_cd = "";       
	private String party_class_cd_display = "";
	private String organkey="";
	private String card_type="";
	private String card_no="";
	private String card_type_display="";
	private Date card_due_dt;
	private String card_due_dt_display="";
	private String check_status="";
	private String organ_display=""; 
	private String organStr="";
	private String selectedPartyId="";
	private String order_check="";
	private String fashion = "asc";
	private String card_due_start;
	private String card_due_end;
	private Date card_due_end_dt=null;
	private Date curr_date=new Date();
	public Date getCurr_date() {
		return curr_date;
	}
	public void setCurr_date(Date curr_date) {
		this.curr_date = curr_date;
	}
	public Date getCard_due_end_dt() {
		return card_due_end_dt;
	}
	public void setCard_due_end_dt(Date card_due_end_dt) {
		this.card_due_end_dt = card_due_end_dt;
	}
	public Date getCard_due_start_dt() {
		return card_due_start_dt;
	}
	public void setCard_due_start_dt(Date card_due_start_dt) {
		this.card_due_start_dt = card_due_start_dt;
	}
	private Date card_due_start_dt=null;
	private String check_result="";
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
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
	public String getParty_class_cd_display() {
		return party_class_cd_display;
	}
	public void setParty_class_cd_display(String party_class_cd_display) {
		this.party_class_cd_display = party_class_cd_display;
	}
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_type_display() {
		return card_type_display;
	}
	public void setCard_type_display(String card_type_display) {
		this.card_type_display = card_type_display;
	}
	public String getCheck_status() {
		return check_status;
	}
	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}
	public String getOrgan_display() {
		return organ_display;
	}
	public void setOrgan_display(String organ_display) {
		this.organ_display = organ_display;
	}
	public String getOrganStr() {
		return organStr;
	}
	public void setOrganStr(String organStr) {
		this.organStr = organStr;
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
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	public Date getCard_due_dt() {
		return card_due_dt;
	}
	public void setCard_due_dt(Date card_due_dt) {
		this.card_due_dt = card_due_dt;
	}
	public String getCard_due_dt_display() {
		return card_due_dt_display;
	}
	public void setCard_due_dt_display(String card_due_dt_display) {
		this.card_due_dt_display = card_due_dt_display;
	}
	public String getCard_due_start() {
		return card_due_start;
	}
	public void setCard_due_start(String card_due_start) {
		this.card_due_start = card_due_start;
	}
	public String getCard_due_end() {
		return card_due_end;
	}
	public void setCard_due_end(String card_due_end) {
		this.card_due_end = card_due_end;
	}
}
