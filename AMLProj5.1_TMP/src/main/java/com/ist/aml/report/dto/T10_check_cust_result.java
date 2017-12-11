package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_check_cust_result implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4015286358899704166L;
	private String party_id="";
	private String party_name="";
	private String party_class_cd="";
	private String party_class_cd_display="";
	private String organkey="";
	private String organName="";
	private String check_type="";
	private String check_type_display="";
	private Date check_dt;
	private String check_dt_display="";
	private Date valid_dt;
	private String valid_dt_display="";
	private String check_result="";
	private String check_result_display="";
	private String check_explain="";
	private String checker="";
	private String is_due="";
	private String fashion="asc";
	private String order_check="";
	private String check_start_dt="";
	private String check_end_dt="";
	private String checker_org="";
	private Date check_start_dt_disp=null;
	public Date getCheck_start_dt_disp() {
		return check_start_dt_disp;
	}
	public void setCheck_start_dt_disp(Date check_start_dt_disp) {
		this.check_start_dt_disp = check_start_dt_disp;
	}
	public Date getCheck_end_dt_disp() {
		return check_end_dt_disp;
	}
	public void setCheck_end_dt_disp(Date check_end_dt_disp) {
		this.check_end_dt_disp = check_end_dt_disp;
	}
	private Date check_end_dt_disp=null;
	private String organStr = "";
	public String getOrganStr() {
		return organStr;
	}
	public void setOrganStr(String organStr) {
		this.organStr = organStr;
	}
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
	public String getCheck_type_display() {
		return check_type_display;
	}
	public void setCheck_type_display(String check_type_display) {
		this.check_type_display = check_type_display;
	}
	public Date getCheck_dt() {
		return check_dt;
	}
	public void setCheck_dt(Date check_dt) {
		this.check_dt = check_dt;
	}
	public Date getValid_dt() {
		return valid_dt;
	}
	public void setValid_dt(Date valid_dt) {
		this.valid_dt = valid_dt;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
	}
	public String getCheck_result_display() {
		return check_result_display;
	}
	public void setCheck_result_display(String check_result_display) {
		this.check_result_display = check_result_display;
	}
	public String getCheck_explain() {
		return check_explain;
	}
	public void setCheck_explain(String check_explain) {
		this.check_explain = check_explain;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getIs_due() {
		return is_due;
	}
	public void setIs_due(String is_due) {
		this.is_due = is_due;
	}
	public String getCheck_dt_display() {
		return check_dt_display;
	}
	public void setCheck_dt_display(String check_dt_display) {
		this.check_dt_display = check_dt_display;
	}
	public String getValid_dt_display() {
		return valid_dt_display;
	}
	public void setValid_dt_display(String valid_dt_display) {
		this.valid_dt_display = valid_dt_display;
	}
	public String getChecker_org() {
		return checker_org;
	}
	public void setChecker_org(String checker_org) {
		this.checker_org = checker_org;
	}
}
