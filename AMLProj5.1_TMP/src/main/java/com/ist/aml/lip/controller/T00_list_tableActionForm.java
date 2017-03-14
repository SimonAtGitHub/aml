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

package com.ist.aml.lip.controller;

/**
 * <p>
 * T00_list_tableActionForm.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import javax.servlet.http.*;
import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class T00_list_tableActionForm extends ActionForm {

	/** 状态 1：启用；2：禁用 */
	private String status = "";
	/** 标志 1：人工添加；2：系统默认 */
	private String flag = "";
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

	/** 名单库列信息的字符串 */
	private String columnListStr = null;
	/** 选中的数据表代码 */
	private String[] selecttablecode = {};
	/** 名单库描述*/
	private String list_des="";
	private FormFile filename;
	


	// =======================================================
	/**
	 * 构造函数
	 */
	public T00_list_tableActionForm() {
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

	public String getColumnListStr() {
		return columnListStr;
	}

	public void setColumnListStr(String columnListStr) {
		this.columnListStr = columnListStr;
	}

	public String[] getSelecttablecode() {
		return selecttablecode;
	}

	public void setSelecttablecode(String[] selecttablecode) {
		this.selecttablecode = selecttablecode;
	}

	public String getList_des() {
		return list_des;
	}

	public void setList_des(String list_des) {
		this.list_des = list_des;
	}

	public FormFile getFilename() {
		return filename;
	}

	public void setFilename(FormFile filename) {
		this.filename = filename;
	}

	
}
