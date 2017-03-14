package com.ist.aml.report.dto;

import java.io.Serializable;

public class T07_bs_report_p implements Serializable {
	private String	apply_no    ="";
	private String  reportkey   ="";
	private String  msg_key     ="";
	private String  apply_type  ="";
	private String apply_type_disp = "";
	/** ÐòºÅ */
	private int serial =0;
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	private int  		trans_num         =0;
	private String  apply_reason   ="";
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
	public String getMsg_key() {
		return msg_key;
	}
	public void setMsg_key(String msgKey) {
		msg_key = msgKey;
	}
	public String getApply_type() {
		return apply_type;
	}
	public void setApply_type(String applyType) {
		apply_type = applyType;
	}
	public int getTrans_num() {
		return trans_num;
	}
	public void setTrans_num(int transNum) {
		trans_num = transNum;
	}
	public String getApply_reason() {
		return apply_reason;
	}
	public void setApply_reason(String applyReason) {
		apply_reason = applyReason;
	}
	public String getApply_type_disp() {
		return apply_type_disp;
	}
	public void setApply_type_disp(String applyTypeDisp) {
		apply_type_disp = applyTypeDisp;
	}
	
	
}
