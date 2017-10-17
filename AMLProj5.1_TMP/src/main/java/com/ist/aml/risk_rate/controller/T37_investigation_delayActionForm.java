package com.ist.aml.risk_rate.controller;

import org.apache.struts.action.ActionForm;

public class T37_investigation_delayActionForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	//所属机构
	private String organ_name;
	//开户日期
	private String statistic_dt_disp;
	private String statistic_dt_disp_end;
	
	public String getOrgan_name() {
		return organ_name;
	}
	public void setOrgan_name(String organ_name) {
		this.organ_name = organ_name;
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
	
	@Override
	public String toString() {
		return "T37_investigation_delayActionForm [organ_name=" + organ_name + ", statistic_dt_disp="
				+ statistic_dt_disp + ", statistic_dt_disp_end=" + statistic_dt_disp_end + "]";
	}
}
