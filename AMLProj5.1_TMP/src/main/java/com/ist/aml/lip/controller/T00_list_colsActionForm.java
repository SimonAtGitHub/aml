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
 * T00_list_colsActionForm.java
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
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class T00_list_colsActionForm extends ActionForm {

	/** 排序列 */
	private String sort_column = "";
	/** 排序字段 */
	private String sort_type = "";
	/** where条件 */
	private String where = "";
	/** 表后缀 */
	private String tableend = "";
	/** 按钮标志 */
	private String button_flag = "";
	/** 主键 */
	private String party_id = "";
	/** 标题 */
	private String title="";
	
	/** 全文检索的条件 */
	private String search_all="";
	/** 删除原因 */
	private String re_reason = "";
	/**
	 * 选中的名单代码
	 */
	private String[] selectkey = {};

	/** 是否在服务器库 1：是；2：否 */
	private String isserverdb = "";
	/** 是否查询条件 1：是；2：否 */
	private String iscond = "";
	/** 字段类型 */
	private String fieldtype = "";
	/** 是否用于排序 1：是；2：否 */
	private String issort = "";
	/** 修改时间（YYYY-MM-DD HH24:MI:SS） */
	private String modifydate = "";
	/** 添加信息码表KEY值 */
	private String addtabkey = "";
	/** 列代码 */
	private String colkey = "";
	/** 是否应用 1：是；2：否 */
	private String isapply = "";
	/** 是否列表显示 1：是；2：否 */
	private String isshow = "";
	/** 数据表代码 */
	private String tablecode = "";
	/** 是否在临时库 1：是；2：否 */
	private String istempdb = "";
	/** 是否查询条件显示方式 1：文本框；2：下拉菜单；3：定位；4：日期 */
	private String conddisp = "";
	/** 列表达式 */
	private String expression = "";
	/** 是否在自定义库 1：是；2：否 */
	private String iscustomdb = "";
	/** 字段长度 */
	private String collength = "";
	/** 列显示名称 */
	private String colname = "";
	/** 创建人 */
	private String creator = "";
	/** 是否隐藏字段 1：是；2：否 */
	private String ishidefield = "";
	/** 是否默认字段 1：是；2：否 */
	private String isdefaultfield = "";
	/** 显示序号 */
	private Integer dispseq = new Integer(0);
	/** 查询条件码表KEY值 */
	private String condtabkey = "";
	/** 是否在纠错库 1：是；2：否 */
	private String isrectifydb = "";
	/** 标志位 1：启用；2：禁用 */
	private String flag = "";
	/** 创建时间（YYYY-MM-DD HH24:MI:SS） */
	private String createdate = "";
	/** 添加方式 1：文本框；2：下拉菜单；3：定位；4：日期；5：多列文本框 */
	private String adddisp = "";
	/** 修改人 */
	private String modifier = "";
	/** 是否在添加字段信息时添加该字段信息 1：是；2：否 */
	private String isaddinfo = "";
	/** 是否在修改字段信息时添加该字段信息 1：是；2：否 */
	private String isupdinfo = "";

	// =======================================================
	/**
	 * 构造函数
	 */
	public T00_list_colsActionForm() {
	}

	public void setIsserverdb(String isserverdbStr) {
		this.isserverdb = isserverdbStr;
	}

	public String getIsserverdb() {
		return this.isserverdb;
	}

	public void setIscond(String iscondStr) {
		this.iscond = iscondStr;
	}

	public String getIscond() {
		return this.iscond;
	}

	public void setFieldtype(String fieldtypeStr) {
		this.fieldtype = fieldtypeStr;
	}

	public String getFieldtype() {
		return this.fieldtype;
	}

	public void setIssort(String issortStr) {
		this.issort = issortStr;
	}

	public String getIssort() {
		return this.issort;
	}

	public void setModifydate(String modifydateStr) {
		this.modifydate = modifydateStr;
	}

	public String getModifydate() {
		return this.modifydate;
	}

	public void setAddtabkey(String addtabkeyStr) {
		this.addtabkey = addtabkeyStr;
	}

	public String getAddtabkey() {
		return this.addtabkey;
	}

	public void setColkey(String colkeyStr) {
		this.colkey = colkeyStr;
	}

	public String getColkey() {
		return this.colkey;
	}

	public void setIsapply(String isapplyStr) {
		this.isapply = isapplyStr;
	}

	public String getIsapply() {
		return this.isapply;
	}

	public void setIsshow(String isshowStr) {
		this.isshow = isshowStr;
	}

	public String getIsshow() {
		return this.isshow;
	}

	public void setTablecode(String tablecodeStr) {
		this.tablecode = tablecodeStr;
	}

	public String getTablecode() {
		return this.tablecode;
	}

	public void setIstempdb(String istempdbStr) {
		this.istempdb = istempdbStr;
	}

	public String getIstempdb() {
		return this.istempdb;
	}

	public void setConddisp(String conddispStr) {
		this.conddisp = conddispStr;
	}

	public String getConddisp() {
		return this.conddisp;
	}

	public void setExpression(String expressionStr) {
		this.expression = expressionStr;
	}

	public String getExpression() {
		return this.expression;
	}

	public void setIscustomdb(String iscustomdbStr) {
		this.iscustomdb = iscustomdbStr;
	}

	public String getIscustomdb() {
		return this.iscustomdb;
	}

	public void setCollength(String collengthStr) {
		this.collength = collengthStr;
	}

	public String getCollength() {
		return this.collength;
	}

	public void setColname(String colnameStr) {
		this.colname = colnameStr;
	}

	public String getColname() {
		return this.colname;
	}

	public void setCreator(String creatorStr) {
		this.creator = creatorStr;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setIshidefield(String ishidefieldStr) {
		this.ishidefield = ishidefieldStr;
	}

	public String getIshidefield() {
		return this.ishidefield;
	}

	public void setIsdefaultfield(String isdefaultfieldStr) {
		this.isdefaultfield = isdefaultfieldStr;
	}

	public String getIsdefaultfield() {
		return this.isdefaultfield;
	}

	public void setDispseq(Integer idispseq) {
		this.dispseq = idispseq;
	}

	public Integer getDispseq() {
		return this.dispseq;
	}

	public void setCondtabkey(String condtabkeyStr) {
		this.condtabkey = condtabkeyStr;
	}

	public String getCondtabkey() {
		return this.condtabkey;
	}

	public void setIsrectifydb(String isrectifydbStr) {
		this.isrectifydb = isrectifydbStr;
	}

	public String getIsrectifydb() {
		return this.isrectifydb;
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

	public void setAdddisp(String adddispStr) {
		this.adddisp = adddispStr;
	}

	public String getAdddisp() {
		return this.adddisp;
	}

	public void setModifier(String modifierStr) {
		this.modifier = modifierStr;
	}

	public String getModifier() {
		return this.modifier;
	}

	public void setIsaddinfo(String isaddinfo) {
		this.isaddinfo = isaddinfo;
	}

	public String getIsaddinfo() {
		return isaddinfo;
	}

	public void setIsupdinfo(String isupdinfo) {
		this.isupdinfo = isupdinfo;
	}

	public String getIsupdinfo() {
		return isupdinfo;
	}

	public String getSort_column() {
		return sort_column;
	}

	public void setSort_column(String sort_column) {
		this.sort_column = sort_column;
	}

	public String getSort_type() {
		return sort_type;
	}

	public void setSort_type(String sort_type) {
		this.sort_type = sort_type;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getTableend() {
		return tableend;
	}

	public void setTableend(String tableend) {
		this.tableend = tableend;
	}

	public String getButton_flag() {
		return button_flag;
	}

	public void setButton_flag(String button_flag) {
		this.button_flag = button_flag;
	}

	public String[] getSelectkey() {
		return selectkey;
	}

	public void setSelectkey(String[] selectkey) {
		this.selectkey = selectkey;
	}

	public String getParty_id() {
		return party_id;
	}

	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}

	public String getRe_reason() {
		return re_reason;
	}

	public void setRe_reason(String re_reason) {
		this.re_reason = re_reason;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public String getSearch_all() {
		return search_all;
	}

	public void setSearch_all(String search_all) {
		this.search_all = search_all;
	}

}
