package com.ist.aml.risk_rate.controller;

import org.apache.struts.action.ActionForm;

public class T37_level_adjust_customActionForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//客户号
	private String party_id = "";
	//评级日期
	private String statistic_dt_disp = "";
	private String statistic_dt_disp_end = "";
	//调整前风险等级
	private String level_before_adjust = "";
	//调整后风险等级
	private String level_after_adjust = "";
	//调整日期
	private String last_upd_dt_disp = "";
	private String last_upd_dt_disp_end = "";
	//调整人
	private String last_upd_user = "";
	//调整序号
	private String audit_no = "";
	
	private String orderby = "";
	private String order = "";
	
	
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getStatistic_dt_disp() {
		return statistic_dt_disp;
	}
	public void setStatistic_dt_disp(String statistic_dt_disp) {
		this.statistic_dt_disp = statistic_dt_disp;
	}
	public String getStatistic_dt_disp_end() {
		return statistic_dt_disp_end;
	}
	public void setStatistic_dt_disp_end(String statistic_dt_disp_end) {
		this.statistic_dt_disp_end = statistic_dt_disp_end;
	}
	public String getLevel_before_adjust() {
		return level_before_adjust;
	}
	public void setLevel_before_adjust(String level_before_adjust) {
		this.level_before_adjust = level_before_adjust;
	}
	public String getLevel_after_adjust() {
		return level_after_adjust;
	}
	public void setLevel_after_adjust(String level_after_adjust) {
		this.level_after_adjust = level_after_adjust;
	}
	public String getLast_upd_dt_disp() {
		return last_upd_dt_disp;
	}
	public void setLast_upd_dt_disp(String last_upd_dt_disp) {
		this.last_upd_dt_disp = last_upd_dt_disp;
	}
	public String getLast_upd_dt_disp_end() {
		return last_upd_dt_disp_end;
	}
	public void setLast_upd_dt_disp_end(String last_upd_dt_disp_end) {
		this.last_upd_dt_disp_end = last_upd_dt_disp_end;
	}
	public String getLast_upd_user() {
		return last_upd_user;
	}
	public void setLast_upd_user(String last_upd_user) {
		this.last_upd_user = last_upd_user;
	}
	public String getAudit_no() {
		return audit_no;
	}
	public void setAudit_no(String audit_no) {
		this.audit_no = audit_no;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	@Override
	public String toString() {
		return "T37_level_adjust_customActionForm [party_id=" + party_id + ", statistic_dt_disp=" + statistic_dt_disp
				+ ", statistic_dt_disp_end=" + statistic_dt_disp_end + ", level_before_adjust=" + level_before_adjust
				+ ", level_after_adjust=" + level_after_adjust + ", last_upd_dt_disp=" + last_upd_dt_disp
				+ ", last_upd_dt_disp_end=" + last_upd_dt_disp_end + ", last_upd_user=" + last_upd_user + ", audit_no="
				+ audit_no + ", orderby=" + orderby + ", order=" + order + "]";
	}
}
