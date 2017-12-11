package com.ist.aml.report.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T07_bh_tsdt_pActinoForm extends ActionForm {
	
	/**                   
     * 构造函数           
     */ 
	public T07_bh_tsdt_pActinoForm() {
	}

	private String	apply_no  ="";
	private String  reportkey  ="";
	private Long  tsdt_seqno ;
	private String party_id = "";
	private Date  tx_dt;
	private String  tx_dt_disp ="";
	private String  stcrkey ="";
	/** 业务标示号 */
	private String ticd = "";
	/** */
	private String  apply_type     ="";
	private String apply_type_disp = "";
	private String  apply_reason   ="";
	private String status_cd = "";
	private String msg_type = "";
/*************************************************************/
	public String getApply_no() {
		return apply_no;
	}
	public void setApply_no(String applyNo) {
		apply_no = applyNo;
	}
	public String getReportkey() {
		return reportkey;
	}
	public void setReportkey(String reportkey) {
		this.reportkey = reportkey;
	}
	public Long getTsdt_seqno() {
		return tsdt_seqno;
	}
	public void setTsdt_seqno(Long tsdtSeqno) {
		tsdt_seqno = tsdtSeqno;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String partyId) {
		party_id = partyId;
	}
	public Date getTx_dt() {
		return tx_dt;
	}
	public void setTx_dt(Date txDt) {
		tx_dt = txDt;
	}
	public String getTx_dt_disp() {
		return tx_dt_disp;
	}
	public void setTx_dt_disp(String txDtDisp) {
		tx_dt_disp = txDtDisp;
	}
	public String getStcrkey() {
		return stcrkey;
	}
	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}
	public String getTicd() {
		return ticd;
	}
	public void setTicd(String ticd) {
		this.ticd = ticd;
	}
	public String getApply_type() {
		return apply_type;
	}
	public void setApply_type(String applyType) {
		apply_type = applyType;
	}
	public String getApply_type_disp() {
		return apply_type_disp;
	}
	public void setApply_type_disp(String applyTypeDisp) {
		apply_type_disp = applyTypeDisp;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String applyReason) {
		apply_reason = applyReason;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String statusCd) {
		status_cd = statusCd;
	}
	public String getMsg_type() {
		return msg_type;
	}
	public void setMsg_type(String msgType) {
		msg_type = msgType;
	}
	
}
