package com.ist.aml.report.dto;

import java.io.Serializable;

/**
 * 
 * @author zhanjin
 * 
 */
public class T07_case_module implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8970350018089200301L;
	/** 案例编号 */
	private String application_num;
	/** 模型类型 2单主体 2双主体 */
	private String moduletype;
	/** 1：模型分值 2：模型关键特征 3：网络条件 */
	private String alerttype;
	/***/
	private String module_no;
	/***/
	private String module_name;
	/***/
	private String net_id;
	/***/
	private String net_name;
	/***/
	private Double sumscore;
	/***/
	private Long trans_count;
	/***/
	private Double trans_amt;
	private String trans_amt_disp;
	/***/
	private String case_date;
	
	public String getTrans_amt_disp() {
		return trans_amt_disp;
	}

	public void setTrans_amt_disp(String transAmtDisp) {
		trans_amt_disp = transAmtDisp;
	}


	public String getApplication_num() {
		return application_num;
	}

	public void setApplication_num(String applicationNum) {
		application_num = applicationNum;
	}

	public String getModuletype() {
		return moduletype;
	}

	public void setModuletype(String moduletype) {
		this.moduletype = moduletype;
	}

	public String getAlerttype() {
		return alerttype;
	}

	public void setAlerttype(String alerttype) {
		this.alerttype = alerttype;
	}

	public String getModule_no() {
		return module_no;
	}

	public void setModule_no(String moduleNo) {
		module_no = moduleNo;
	}

	public String getModule_name() {
		return module_name;
	}

	public void setModule_name(String moduleName) {
		module_name = moduleName;
	}

	public String getNet_id() {
		return net_id;
	}

	public void setNet_id(String netId) {
		net_id = netId;
	}

	public String getNet_name() {
		return net_name;
	}

	public void setNet_name(String netName) {
		net_name = netName;
	}

	public Double getSumscore() {
		return sumscore;
	}

	public void setSumscore(Double sumscore) {
		this.sumscore = sumscore;
	}

	public Long getTrans_count() {
		return trans_count;
	}

	public void setTrans_count(Long transCount) {
		trans_count = transCount;
	}

	public Double getTrans_amt() {
		return trans_amt;
	}

	public void setTrans_amt(Double transAmt) {
		trans_amt = transAmt;
	}

	public String getCase_date() {
		return case_date;
	}

	public void setCase_date(String caseDate) {
		case_date = caseDate;
	}
}
