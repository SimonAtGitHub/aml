package com.ist.aml.risk_rate.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T37_help_checkActionForm extends ActionForm{

	/** 协查编号 */
	private String check_no;
	/** 页面展示的协查编号数组 */
	private String[] check_noArr;
	/** 评价结果KEY */
	private String resultkey;
	/** 客户号 */
	private String party_id;
	/** 客户名称 */
	private String party_chn_name;
	/** 客户类型 */
	private String party_class_cd;
	/** 发起协查机构 */
	private String send_org;
	/** 发起协查日期 */
	private Date send_date;
	private Date send_date_end;
	/** 发起协查日期 页面展示*/
	private String send_date_disp;
	private String send_date_end_disp;
	/** 发起协查人 */
	private String send_user;
	/** 协查原因 */
	private String check_reason;
	/** 协查结论 */
	private String check_result;
	/** 协查机构 */
	private String check_org;
	/** 协查日期 */
	private Date check_date;
	/** 协查日期页面展示 */
	private String check_date_disp;
	/** 协查人 */
	private String check_user;
	/** 状态：0 未处理 1待协查 2待复核 3 已协查 4 退回 */
	private String status_cd;
	/** 页面显示状态 */
	private String status_cd_disp;
	/** 审核日期 */
	private Date rcheck_date;
	/** 审核日期页面展示 */
	private String rcheck_date_disp;
	/** 审核人 */
	private String rcheck_user;
	/** 审核机构 */
	private String rcheck_org;
	/** 退回原因 */
	private String return_reason;
	/** 退回人 */
	private String return_user;
	/** 退回日期 */
	private Date return_dt;
	/** return date page display */
	private String return_dt_disp;
	/** 客户机构 */
	private String organkey = "";
	private String organkey_s = "";
	private String organ_name = "";
	/** 数据来源 1系统 2再调整 */
	private String data_source;
	/** 来源 1:系统,2:再调整**/
	private String rate_source = "";
	/** 页面类型判断 */
	private String pageType;
	
	public T37_help_checkActionForm() {
		// TODO Auto-generated constructor stub
	}

	public String getCheck_no() {
		return check_no;
	}

	public void setCheck_no(String checkNo) {
		check_no = checkNo;
	}

	public String getResultkey() {
		return resultkey;
	}

	public void setResultkey(String resultkey) {
		this.resultkey = resultkey;
	}

	public String getParty_id() {
		return party_id;
	}

	public void setParty_id(String partyId) {
		party_id = partyId;
	}

	public String getParty_chn_name() {
		return party_chn_name;
	}

	public void setParty_chn_name(String partyChnName) {
		party_chn_name = partyChnName;
	}

	public String getSend_org() {
		return send_org;
	}

	public void setSend_org(String sendOrg) {
		send_org = sendOrg;
	}

	public Date getSend_date() {
		return send_date;
	}

	public void setSend_date(Date sendDate) {
		send_date = sendDate;
	}

	public String getSend_date_disp() {
		return send_date_disp;
	}

	public void setSend_date_disp(String sendDateDisp) {
		send_date_disp = sendDateDisp;
	}

	public String getSend_user() {
		return send_user;
	}

	public void setSend_user(String sendUser) {
		send_user = sendUser;
	}

	public String getCheck_reason() {
		return check_reason;
	}

	public void setCheck_reason(String checkReason) {
		check_reason = checkReason;
	}

	public String getCheck_result() {
		return check_result;
	}

	public void setCheck_result(String checkResult) {
		check_result = checkResult;
	}

	public String getCheck_org() {
		return check_org;
	}

	public void setCheck_org(String checkOrg) {
		check_org = checkOrg;
	}

	public Date getCheck_date() {
		return check_date;
	}

	public void setCheck_date(Date checkDate) {
		check_date = checkDate;
	}

	public String getCheck_date_disp() {
		return check_date_disp;
	}

	public void setCheck_date_disp(String checkDateDisp) {
		check_date_disp = checkDateDisp;
	}

	public String getCheck_user() {
		return check_user;
	}

	public void setCheck_user(String checkUser) {
		check_user = checkUser;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String statusCd) {
		status_cd = statusCd;
	}

	public String getStatus_cd_disp() {
		return status_cd_disp;
	}

	public void setStatus_cd_disp(String statusCdDisp) {
		status_cd_disp = statusCdDisp;
	}

	public Date getRcheck_date() {
		return rcheck_date;
	}

	public void setRcheck_date(Date rcheckDate) {
		rcheck_date = rcheckDate;
	}

	public String getRcheck_date_disp() {
		return rcheck_date_disp;
	}

	public void setRcheck_date_disp(String rcheckDateDisp) {
		rcheck_date_disp = rcheckDateDisp;
	}

	public String getRcheck_user() {
		return rcheck_user;
	}

	public void setRcheck_user(String rcheckUser) {
		rcheck_user = rcheckUser;
	}

	public String getRcheck_org() {
		return rcheck_org;
	}

	public void setRcheck_org(String rcheckOrg) {
		rcheck_org = rcheckOrg;
	}

	public String getOrgankey() {
		return organkey;
	}

	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}

	public String getOrgankey_s() {
		return organkey_s;
	}

	public void setOrgankey_s(String organkeyS) {
		organkey_s = organkeyS;
	}

	public String getOrgan_name() {
		return organ_name;
	}

	public void setOrgan_name(String organName) {
		organ_name = organName;
	}

	public String getReturn_reason() {
		return return_reason;
	}

	public void setReturn_reason(String returnReason) {
		return_reason = returnReason;
	}

	public String getReturn_user() {
		return return_user;
	}

	public void setReturn_user(String returnUser) {
		return_user = returnUser;
	}

	public Date getReturn_dt() {
		return return_dt;
	}

	public void setReturn_dt(Date returnDt) {
		return_dt = returnDt;
	}

	public void setReturn_dt_disp(String return_dt_disp) {
		this.return_dt_disp = return_dt_disp;
	}

	public String getReturn_dt_disp() {
		return return_dt_disp;
	}

	public void setSend_date_end_disp(String send_date_end_disp) {
		this.send_date_end_disp = send_date_end_disp;
	}

	public String getSend_date_end_disp() {
		return send_date_end_disp;
	}

	public void setSend_date_end(Date send_date_end) {
		this.send_date_end = send_date_end;
	}

	public Date getSend_date_end() {
		return send_date_end;
	}

	public void setCheck_noArr(String[] check_noArr) {
		this.check_noArr = check_noArr;
	}

	public String[] getCheck_noArr() {
		return check_noArr;
	}

	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}

	public String getParty_class_cd() {
		return party_class_cd;
	}

	public void setData_source(String data_source) {
		this.data_source = data_source;
	}

	public String getData_source() {
		return data_source;
	}

	public String getRate_source() {
		return rate_source;
	}

	public void setRate_source(String rateSource) {
		rate_source = rateSource;
	}

	public void setPageType(String pageType) {
		this.pageType = pageType;
	}

	public String getPageType() {
		return pageType;
	}

}
