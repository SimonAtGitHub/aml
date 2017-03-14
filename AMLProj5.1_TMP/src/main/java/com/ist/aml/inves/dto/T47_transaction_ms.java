package com.ist.aml.inves.dto;

import java.util.Date;

import com.ist.aml.report.dto.T47_transaction;

public class T47_transaction_ms extends T47_transaction{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5275000987617882288L;
	private String is_staff="";
	//
	private String stcrkey;
	private String app_org_id;
	private String app_state_cd;
	private String case_kind;
	private String date_status_cd;
	private String status_cd;
	//add 2009.11.07  案例的创建日期即筛选日期
	private Date app_dt;
	private String app_dt_disp;
	//add 2009.12.15  行内员工号
	private String staffkey;
	private String alertkey;
	private Date case_date=new Date();
	public String getAlertkey() {
		return alertkey;
	}
	public void setAlertkey(String alertkey) {
		this.alertkey = alertkey;
	}
	public String getApp_org_id() {
		return app_org_id;
	}
	public void setApp_org_id(String app_org_id) {
		this.app_org_id = app_org_id;
	}
	public String getApp_state_cd() {
		return app_state_cd;
	}
	public void setApp_state_cd(String app_state_cd) {
		this.app_state_cd = app_state_cd;
	}
	public String getCase_kind() {
		return case_kind;
	}
	public void setCase_kind(String case_kind) {
		this.case_kind = case_kind;
	}
	public String getDate_status_cd() {
		return date_status_cd;
	}
	public void setDate_status_cd(String date_status_cd) {
		this.date_status_cd = date_status_cd;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public String getStcrkey() {
		return stcrkey;
	}
	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}

	public String getApp_dt_disp() {
		return app_dt_disp;
	}
	public void setApp_dt_disp(String app_dt_disp) {
		this.app_dt_disp = app_dt_disp;
	}
	public Date getApp_dt() {
		return app_dt;
	}
	public void setApp_dt(Date app_dt) {
		this.app_dt = app_dt;
	}

	public String getIs_staff() {
		return is_staff;
	}
	public void setIs_staff(String is_staff) {
		this.is_staff = is_staff;
	}

	public String getStaffkey() {
		return staffkey;
	}
	public void setStaffkey(String staffkey) {
		this.staffkey = staffkey;
	}
	public Date getCase_date() {
		return case_date;
	}
	public void setCase_date(Date case_date) {
		this.case_date = case_date;
	}



}
