package com.ist.aml.offs_report.controller;

import org.apache.struts.action.ActionForm;

public class T07_user_identityUrgeActionForm extends ActionForm{

	private static final long serialVersionUID = 1L;
	/* 查询时间 */
	private int startdate;
	private int enddate;
	private String startyear="";
	private String startseason="";
	private String endyear="";
	private String endseason="";
	/* 报表类型 */
	private String identitytype="";
	
	/* type用于区分监管报表督办的四个链接*/
	private String type="";
	private String allUnderOrgankey = "";
	
	
	private String organstr = "";
	
	public String getAllUnderOrgankey() {
		return allUnderOrgankey;
	}
	public void setAllUnderOrgankey(String allUnderOrgankey) {
		this.allUnderOrgankey = allUnderOrgankey;
	}
	public String getIdentitytype() {
		return identitytype;
	}
	public void setIdentitytype(String identitytype) {
		this.identitytype = identitytype;
	}
	public String getEndseason() {
		return endseason;
	}
	public void setEndseason(String endseason) {
		this.endseason = endseason;
	}
	public String getEndyear() {
		return endyear;
	}
	public void setEndyear(String endyear) {
		this.endyear = endyear;
	}
	public String getStartseason() {
		return startseason;
	}
	public void setStartseason(String startseason) {
		this.startseason = startseason;
	}
	public String getStartyear() {
		return startyear;
	}
	public void setStartyear(String startyear) {
		this.startyear = startyear;
	}
	public int getStartdate() {
		return startdate;
	}
	public void setStartdate(int startdate) {
		this.startdate = startdate;
	}
	public int getEnddate() {
		return enddate;
	}
	public void setEnddate(int enddate) {
		this.enddate = enddate;
	}
	public String getOrganstr() {
		return organstr;
	}
	public void setOrganstr(String organstr) {
		this.organstr = organstr;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
