/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2014-01-21] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.report.controller;

/**
 * <p>T07_ATTENTION_libActionForm.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import javax.servlet.http.*;
import org.apache.struts.action.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class T07_ATTENTION_libActionForm extends ActionForm {

	/** 根据来源写不同的岗位，关注库岗位 P1编辑岗 P2审核岗 P3审批岗；案例岗位见t07_post */
	private String atten_post = "";
	private String target_post = "";
	/** 关注ID（主键） */
	private String atten_id = "";
	/** 删除日期 */
	private String delete_dt = "";
	/** 客户号 */
	private String party_id = "";
	/** 关注类型 1：一般关注 2：持续关注 3：重点关注 */
	private String atten_type = "";
	/** 失效日期 */
	private String invalid_dt = "";
	private String invalid_dt_begin = "";
	private String invalid_dt_end = "";
	/** 客户归属机构 */
	private String organkey = "";
	/** 客户归属机构名称*/
	private String organname="";
	
	/** 操作类型 */
	private String op_type="";

	private String organStr = "";
	/** 状态 */
	private String status = "";
	/** 操作结果 */
	private String op_result="";
	
	/** 证件类型 */
	private String card_type = "";
	/** 客户类型： C 对公 I 对私 */
	private String party_class_cd = "";
	/** 证件号码 */
	private String card_no = "";
	/** 客户名称 */
	private String party_chn_name = "";
	/** 创建日期 */
	private String create_dt = "";
	/** 关注来源： 1关注库 2 案例 3风险评级 4 客户识别 */
	private String atten_source = "";
	/** 当前日期 */
	private String curr_dt = "";
	private String[] selectedKeys=null;
	/** 是否查历史表：0 当前  1历史 */
	private String is_his="0";
	
	// =======================================================
	/**
	 * 构造函数
	 */
	public T07_ATTENTION_libActionForm() {
	}



	public String getAtten_post() {
		return atten_post;
	}



	public void setAtten_post(String attenPost) {
		atten_post = attenPost;
	}



	public void setAtten_id(String atten_idStr) {
		this.atten_id = atten_idStr;
	}

	public String getAtten_id() {
		return this.atten_id;
	}

	public void setDelete_dt(String delete_dtStr) {
		this.delete_dt = delete_dtStr;
	}

	public String getDelete_dt() {
		return this.delete_dt;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setAtten_type(String atten_typeStr) {
		this.atten_type = atten_typeStr;
	}

	public String getAtten_type() {
		return this.atten_type;
	}

	public void setInvalid_dt(String invalid_dtStr) {
		this.invalid_dt = invalid_dtStr;
	}

	public String getInvalid_dt() {
		return this.invalid_dt;
	}

	public String getInvalid_dt_begin() {
		return invalid_dt_begin;
	}

	public void setInvalid_dt_begin(String invalidDtBegin) {
		invalid_dt_begin = invalidDtBegin;
	}

	public String getInvalid_dt_end() {
		return invalid_dt_end;
	}

	public void setInvalid_dt_end(String invalidDtEnd) {
		invalid_dt_end = invalidDtEnd;
	}

	public void setOrgankey(String organkeyStr) {
		this.organkey = organkeyStr;
	}

	public String getOrgankey() {
		return this.organkey;
	}
	
	public String getOrganStr() {
		return organStr;
	}



	public void setOrganStr(String organStr) {
		this.organStr = organStr;
	}

	public void setStatus(String statusStr) {
		this.status = statusStr;
	}

	public String getStatus() {
		return this.status;
	}

	public void setCard_type(String card_typeStr) {
		this.card_type = card_typeStr;
	}

	public String getCard_type() {
		return this.card_type;
	}

	public void setParty_class_cd(String party_class_cdStr) {
		this.party_class_cd = party_class_cdStr;
	}

	public String getParty_class_cd() {
		return this.party_class_cd;
	}

	public void setCard_no(String card_noStr) {
		this.card_no = card_noStr;
	}

	public String getCard_no() {
		return this.card_no;
	}

	public void setParty_chn_name(String party_chn_nameStr) {
		this.party_chn_name = party_chn_nameStr;
	}

	public String getParty_chn_name() {
		return this.party_chn_name;
	}

	public void setCreate_dt(String create_dtStr) {
		this.create_dt = create_dtStr;
	}

	public String getCreate_dt() {
		return this.create_dt;
	}

	public void setAtten_source(String atten_sourceStr) {
		this.atten_source = atten_sourceStr;
	}

	public String getAtten_source() {
		return this.atten_source;
	}

	public String[] getSelectedKeys() {
		return selectedKeys;
	}

	public void setSelectedKeys(String[] selectedKeys) {
		this.selectedKeys = selectedKeys;
	}

	// =======================================================
	// =======================================================
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		/** @todo: finish this method, this is just the skeleton. */
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
	}



	public String getCurr_dt() {
		return curr_dt;
	}



	public void setCurr_dt(String currDt) {
		curr_dt = currDt;
	}



	public String getTarget_post() {
		return target_post;
	}



	public void setTarget_post(String targetPost) {
		target_post = targetPost;
	}



	public String getOp_result() {
		return op_result;
	}



	public void setOp_result(String opResult) {
		op_result = opResult;
	}






	public String getOrganname() {
		return organname;
	}



	public void setOrganname(String organname) {
		this.organname = organname;
	}



	public String getIs_his() {
		return is_his;
	}



	public void setIs_his(String isHis) {
		is_his = isHis;
	}



	public String getOp_type() {
		return op_type;
	}



	public void setOp_type(String opType) {
		op_type = opType;
	}
}
