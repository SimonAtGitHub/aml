/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2014-02-10] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.inves.dto;

/**
 * <p>T07_INREP_BH_msg.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.Date;

import com.ist.common.base.BaseDTO;

public class T07_INREP_BH_msg extends BaseDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1487792275778722159L;
	/** 大额补报报文 */
	private Integer msg_a = new Integer(0);
	/** 大额补正报文 */
	private Integer msg_i = new Integer(0);
	/** 机构号 */
	private String organkey = "";
	/** 大额纠错报文 */
	private Integer msg_c = new Integer(0);
	/** 大额正常报文 */
	private Integer msg_n = new Integer(0);
	/** 大额删除报文 */
	private Integer msg_d = new Integer(0);
	/** 报送日期 */
	private Date report_dt ;
	/** 大额重发报文 */
	private Integer msg_r = new Integer(0);
	/** 机构名 */
	private String organname = "";
	/** 报送开始日期 */
	private Date report_dt_disp;
	/** 报送截至日期 */
	private Date report_dt_end;
	private String organStr = "";
	/**
	 * 构造函数
	 */
	public T07_INREP_BH_msg() {
	}

	public void setMsg_a(Integer imsg_a) {
		this.msg_a = imsg_a;
	}

	public Integer getMsg_a() {
		return this.msg_a;
	}

	public void setMsg_i(Integer imsg_i) {
		this.msg_i = imsg_i;
	}

	public Integer getMsg_i() {
		return this.msg_i;
	}

	public void setOrgankey(String organkeyStr) {
		this.organkey = organkeyStr;
	}

	public String getOrgankey() {
		return this.organkey;
	}

	public void setMsg_c(Integer imsg_c) {
		this.msg_c = imsg_c;
	}

	public Integer getMsg_c() {
		return this.msg_c;
	}

	public void setMsg_n(Integer imsg_n) {
		this.msg_n = imsg_n;
	}

	public Integer getMsg_n() {
		return this.msg_n;
	}

	public void setMsg_d(Integer imsg_d) {
		this.msg_d = imsg_d;
	}

	public Integer getMsg_d() {
		return this.msg_d;
	}

	public void setReport_dt(Date report_dtStr) {
		this.report_dt = report_dtStr;
	}

	public Date getReport_dt() {
		return this.report_dt;
	}

	public void setMsg_r(Integer imsg_r) {
		this.msg_r = imsg_r;
	}

	public Integer getMsg_r() {
		return this.msg_r;
	}

	public String getOrganname() {
		return organname;
	}

	public void setOrganname(String organname) {
		this.organname = organname;
	}

	public Date getReport_dt_disp() {
		return report_dt_disp;
	}

	public void setReport_dt_disp(Date report_dt_disp) {
		this.report_dt_disp = report_dt_disp;
	}

	public Date getReport_dt_end() {
		return report_dt_end;
	}

	public void setReport_dt_end(Date report_dt_disp) {
		this.report_dt_end = report_dt_disp;
	}

	public String getOrganStr() {
		return organStr;
	}

	public void setOrganStr(String organStr) {
		this.organStr = organStr;
	}

}
