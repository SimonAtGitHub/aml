package com.ist.aml.report.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T07_case_AssistActionForm extends ActionForm{
	
	private String assitno="";
	private String application_num="";
	private String init_organkey="";
	private String req_organkey=""; //请求机构
	private String deal_organkey="";//协查机构
	private String deal_organkeys="";
    private String reasons="";//协查原因
    private Date req_time=null;//请求时间
    private String req_time_disp="";
    private int req_queue=0;//协查序号
    private String req_user="";//请求用户
    private String status="";//协查状态 0 协查未完成；1 协查完成　2　协查进行中
    private String deal_user="";//协查操作员
    private Date deal_time=null;//协查完成时间
    private String deal_time_disp="";
    private String req_orgname="";
    private String deal_orgname="";
    private String deal_username="";
    private String status_disp="";
    private String handlereport="";//协查报告
    private String application_num_s="";
	public String getApplication_num_s() {
		return application_num_s;
	}
	public void setApplication_num_s(String applicationNumS) {
		application_num_s = applicationNumS;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}
	
	public String getDeal_organkey() {
		return deal_organkey;
	}
	public void setDeal_organkey(String deal_organkey) {
		this.deal_organkey = deal_organkey;
	}
	
	public String getInit_organkey() {
		return init_organkey;
	}
	public void setInit_organkey(String init_organkey) {
		this.init_organkey = init_organkey;
	}
	
	
	public String getReasons() {
		return reasons;
	}
	public void setReasons(String reasons) {
		this.reasons = reasons;
	}
	
	public String getReq_organkey() {
		return req_organkey;
	}
	public void setReq_organkey(String req_organkey) {
		this.req_organkey = req_organkey;
	}
	public int getReq_queue() {
		return req_queue;
	}
	public void setReq_queue(int req_queue) {
		this.req_queue = req_queue;
	}
	public Date getReq_time() {
		return req_time;
	}
	public void setReq_time(Date req_time) {
		this.req_time = req_time;
	}
	public String getReq_user() {
		return req_user;
	}
	public void setReq_user(String req_user) {
		this.req_user = req_user;
	}
	public String getHandlereport() {
		return handlereport;
	}
	public void setHandlereport(String handlereport) {
		this.handlereport = handlereport;
	}
	public String getAssitno() {
		return assitno;
	}
	public void setAssitno(String assitno) {
		this.assitno = assitno;
	}
	public String getDeal_organkeys() {
		return deal_organkeys;
	}
	public void setDeal_organkeys(String deal_organkeys) {
		this.deal_organkeys = deal_organkeys;
	}
	public String getDeal_orgname() {
		return deal_orgname;
	}
	public void setDeal_orgname(String deal_orgname) {
		this.deal_orgname = deal_orgname;
	}
	public Date getDeal_time() {
		return deal_time;
	}
	public void setDeal_time(Date deal_time) {
		this.deal_time = deal_time;
	}
	public String getDeal_time_disp() {
		return deal_time_disp;
	}
	public void setDeal_time_disp(String deal_time_disp) {
		this.deal_time_disp = deal_time_disp;
	}
	public String getDeal_user() {
		return deal_user;
	}
	public void setDeal_user(String deal_user) {
		this.deal_user = deal_user;
	}
	public String getDeal_username() {
		return deal_username;
	}
	public void setDeal_username(String deal_username) {
		this.deal_username = deal_username;
	}
	public String getReq_orgname() {
		return req_orgname;
	}
	public void setReq_orgname(String req_orgname) {
		this.req_orgname = req_orgname;
	}
	public String getReq_time_disp() {
		return req_time_disp;
	}
	public void setReq_time_disp(String req_time_disp) {
		this.req_time_disp = req_time_disp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus_disp() {
		return status_disp;
	}
	public void setStatus_disp(String status_disp) {
		this.status_disp = status_disp;
	}
	
	
}
