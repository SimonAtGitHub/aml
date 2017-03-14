/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2010-12-24] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.lip.dto;

/**
 * <p>
 * T10_pr_audit.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */



public class T10_pr_audit extends BaseDTO {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8413773274015000928L;
	/**
	 * 1 客户黑名单 2 地域黑名单 3 政要名单
	 */
	private String list_type = "";
	private String list_type_disp = "";
	/** null */
	private String app_user = "";
	/** null */
	private String upload_user = "";
	/**
	 * 1未同步 2已同步
	 */
	private String syn_st = "";
	private String syn_st_disp = "";
	/** null */
	private String app_dt = "";
	/**
	 * 1 联合国制裁黑名单 2 FATF黑名单 3 美国黑名单 4 欧盟黑名单 5 重点国家和地区 6 大中国地区黑名单 7 亚太地区黑名单 …
	 */
	private String list_source = "";
	private String list_source_disp = "";
	/** null */
	private String audit_user = "";
	/** null */
	private String audit_dt = "";
	/** 加载日期 */
	private String version = "";
	/** null */
	private String reserved_field1 = "";
	/**
	 * 1待审核 2申请审核 3审核通过 4退回审核
	 */
	private String ischeck = "";
	private String ischeck_disp = "";
	/** null */
	private String re_reason = "";
	/** null */
	private String syn_user = "";
	/** null */
	private String syn_dt = "";
	/** null */
	private String reserved_field2 = "";
	/** null */
	private String upload_dt = "";
	/** null */
	private String plots = "";
	/** 标题标识 */
	private String title_flag = "";
	/** 源表 */
	private String table_source = "";
	/** 目标表 */
	private String table_target = "";

	/**
	 * 1增量 2全量
	 */
	private String up_flag = "";
	private String up_flag_disp = "";
	
	/** 统计的更新次数 */
	private String up_num = "";
	
	/** 更新日期开始 */
	private String syn_dt_start = "";
	/** 更新日期结束 */
	private String syn_dt_end = "";
	
	// =======================================================

	/**
	 * 构造函数
	 */
	public T10_pr_audit() {
	}

	public void setList_type(String list_typeStr) {
		this.list_type = list_typeStr;
	}

	public String getList_type() {
		return this.list_type;
	}

	public void setApp_user(String app_userStr) {
		this.app_user = app_userStr;
	}

	public String getApp_user() {
		return this.app_user;
	}

	public void setUpload_user(String upload_userStr) {
		this.upload_user = upload_userStr;
	}

	public String getUpload_user() {
		return this.upload_user;
	}

	public void setSyn_st(String syn_stStr) {
		this.syn_st = syn_stStr;
	}

	public String getSyn_st() {
		return this.syn_st;
	}

	public void setApp_dt(String app_dtStr) {
		this.app_dt = app_dtStr;
	}

	public String getApp_dt() {
		return this.app_dt;
	}

	public void setList_source(String list_sourceStr) {
		this.list_source = list_sourceStr;
	}

	public String getList_source() {
		return this.list_source;
	}

	public void setAudit_user(String audit_userStr) {
		this.audit_user = audit_userStr;
	}

	public String getAudit_user() {
		return this.audit_user;
	}

	public void setAudit_dt(String audit_dtStr) {
		this.audit_dt = audit_dtStr;
	}

	public String getAudit_dt() {
		return this.audit_dt;
	}

	public void setVersion(String versionStr) {
		this.version = versionStr;
	}

	public String getVersion() {
		return this.version;
	}

	public void setReserved_field1(String reserved_field1Str) {
		this.reserved_field1 = reserved_field1Str;
	}

	public String getReserved_field1() {
		return this.reserved_field1;
	}

	public void setIscheck(String ischeckStr) {
		this.ischeck = ischeckStr;
	}

	public String getIscheck() {
		return this.ischeck;
	}

	public void setRe_reason(String re_reasonStr) {
		this.re_reason = re_reasonStr;
	}

	public String getRe_reason() {
		return this.re_reason;
	}

	public void setSyn_user(String syn_userStr) {
		this.syn_user = syn_userStr;
	}

	public String getSyn_user() {
		return this.syn_user;
	}

	public void setSyn_dt(String syn_dtStr) {
		this.syn_dt = syn_dtStr;
	}

	public String getSyn_dt() {
		return this.syn_dt;
	}

	public void setReserved_field2(String reserved_field2Str) {
		this.reserved_field2 = reserved_field2Str;
	}

	public String getReserved_field2() {
		return this.reserved_field2;
	}

	public void setUpload_dt(String upload_dtStr) {
		this.upload_dt = upload_dtStr;
	}

	public String getUpload_dt() {
		return this.upload_dt;
	}

	public void setPlots(String plotsStr) {
		this.plots = plotsStr;
	}

	public String getPlots() {
		return this.plots;
	}

	public String getTitle_flag() {
		return title_flag;
	}

	public void setTitle_flag(String title_flag) {
		this.title_flag = title_flag;
	}

	public String getList_type_disp() {
		return list_type_disp;
	}

	public void setList_type_disp(String list_type_disp) {
		this.list_type_disp = list_type_disp;
	}

	public String getList_source_disp() {
		return list_source_disp;
	}

	public void setList_source_disp(String list_source_disp) {
		this.list_source_disp = list_source_disp;
	}

	public String getIscheck_disp() {
		return ischeck_disp;
	}

	public void setIscheck_disp(String ischeck_disp) {
		this.ischeck_disp = ischeck_disp;
	}

	public String getSyn_st_disp() {
		return syn_st_disp;
	}

	public void setSyn_st_disp(String syn_st_disp) {
		this.syn_st_disp = syn_st_disp;
	}

	public String getTable_source() {
		return table_source;
	}

	public void setTable_source(String table_source) {
		this.table_source = table_source;
	}

	public String getTable_target() {
		return table_target;
	}

	public void setTable_target(String table_target) {
		this.table_target = table_target;
	}

	public String getUp_flag() {
		return up_flag;
	}

	public void setUp_flag(String up_flag) {
		this.up_flag = up_flag;
	}

	public String getUp_flag_disp() {
		return up_flag_disp;
	}

	public void setUp_flag_disp(String up_flag_disp) {
		this.up_flag_disp = up_flag_disp;
	}

	public String getUp_num() {
		return up_num;
	}

	public void setUp_num(String up_num) {
		this.up_num = up_num;
	}

	public String getSyn_dt_start() {
		return syn_dt_start;
	}

	public void setSyn_dt_start(String syn_dt_start) {
		this.syn_dt_start = syn_dt_start;
	}

	public String getSyn_dt_end() {
		return syn_dt_end;
	}

	public void setSyn_dt_end(String syn_dt_end) {
		this.syn_dt_end = syn_dt_end;
	}

	// =======================================================
}
