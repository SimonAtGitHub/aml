package com.ist.aml.risk_rate.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts.upload.FormFile;

public class T37_helpcheck_attach implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -538144820995660524L;
	
	private FormFile filename;
	
	/** 附件KEY */
	private String attachKey; 
	/** 协查编号 */
	private String check_no;
	/** 附件名称(地址） */
	private String attach_name;
	/** 附件实名 */
	private String attach_realName;
	/** 上传日期 */
	private Date load_date;
	/** load_date for page */
	private String load_date_disp;
	/** 上传者 */
	private String load_user;
	
	public T37_helpcheck_attach() {
		// TODO Auto-generated constructor stub
	}

	public String getAttachKey() {
		return attachKey;
	}

	public void setAttachKey(String attachKey) {
		this.attachKey = attachKey;
	}

	public String getCheck_no() {
		return check_no;
	}

	public void setCheck_no(String checkNo) {
		check_no = checkNo;
	}

	public String getAttach_name() {
		return attach_name;
	}

	public void setAttach_name(String attachName) {
		attach_name = attachName;
	}

	public String getAttach_realName() {
		return attach_realName;
	}

	public void setAttach_realName(String attachRealName) {
		attach_realName = attachRealName;
	}

	public Date getLoad_date() {
		return load_date;
	}

	public void setLoad_date(Date loadDate) {
		load_date = loadDate;
	}

	public String getLoad_user() {
		return load_user;
	}

	public void setLoad_user(String loadUser) {
		load_user = loadUser;
	}

	public void setLoad_date_disp(String load_date_disp) {
		this.load_date_disp = load_date_disp;
	}

	public String getLoad_date_disp() {
		return load_date_disp;
	}

	public void setFilename(FormFile filename) {
		this.filename = filename;
	}

	public FormFile getFilename() {
		return filename;
	}

}
