/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2010-12-14] by makecode program v2.2
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
 * T00_list_table.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */





public class T00_list_table implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1422650776066130069L;
	/** 状态 1：启用；2：禁用；3：删除 */
	private String status = "";
	private String status_disp = "";
	/** 标志 1：人工添加；2：系统默认 */
	private String flag = "";
	private String flag_disp = "";
	/** 创建时间（YYYY-MM-DD HH24:MI:SS） */
	private String createdate = "";
	/** 修改人 */
	private String modifier = "";
	/** 修改时间（YYYY-MM-DD HH24:MI:SS） */
	private String modifydate = "";
	/** 创建人 */
	private String creator = "";
	/** 数据表名称 */
	private String tablename = "";
	/** 数据表代码 */
	private String tablecode = "";
	/** 是否创建名单库 */
	private String createflag = "";
	private String createflag_disp = "";
	/** 名单库描述*/
	private String list_des="";


	// =======================================================

	/**
	 * 构造函数
	 */
	public T00_list_table() {
	}

	public void setStatus(String statusStr) {
		this.status = statusStr;
	}

	public String getStatus() {
		return this.status;
	}

	public void setFlag(String flagStr) {
		this.flag = flagStr;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setCreatedate(String createdateStr) {
		this.createdate = createdateStr;
	}

	public String getCreatedate() {
		return this.createdate;
	}

	public void setModifier(String modifierStr) {
		this.modifier = modifierStr;
	}

	public String getModifier() {
		return this.modifier;
	}

	public void setModifydate(String modifydateStr) {
		this.modifydate = modifydateStr;
	}

	public String getModifydate() {
		return this.modifydate;
	}

	public void setCreator(String creatorStr) {
		this.creator = creatorStr;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setTablename(String tablenameStr) {
		this.tablename = tablenameStr;
	}

	public String getTablename() {
		return this.tablename;
	}

	public void setTablecode(String tablecodeStr) {
		this.tablecode = tablecodeStr;
	}

	public String getTablecode() {
		return this.tablecode;
	}

	public String getFlag_disp() {
		return flag_disp;
	}

	public void setFlag_disp(String flag_disp) {
		this.flag_disp = flag_disp;
	}

	public String getCreateflag() {
		return createflag;
	}

	public void setCreateflag(String createflag) {
		this.createflag = createflag;
	}

	public String getCreateflag_disp() {
		return createflag_disp;
	}

	public void setCreateflag_disp(String createflag_disp) {
		this.createflag_disp = createflag_disp;
	}

	public String getStatus_disp() {
		return status_disp;
	}

	public void setStatus_disp(String status_disp) {
		this.status_disp = status_disp;
	}

	public String getList_des() {
		return list_des;
	}

	public void setList_des(String list_des) {
		this.list_des = list_des;
	}



	// =======================================================
}
