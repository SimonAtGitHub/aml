package com.ist.aml.information.controller;

/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组-lijie
 * @version 4.0.1
 */

import javax.servlet.http.*;
import org.apache.struts.action.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class T47_OPP_bankActionForm extends ActionForm {
	/**
	 * 对方金融机构代码类型01：现代化支付系统行号； 02：人民币结算账户管理系统行号； 03：银行内部机构号； 04：其他
	 */
	private String opp_code_type_cd_s = "";

	/** 对方金融机构代码 */
	private String opp_organkey_s = "";

	/** 对方金融机构名称 */
	private String opp_orgname_s = "";

	/** 对方金融机构地区 */
	private String opp_area_s = "";
	private String opp_area2name = "";


	/** 对方金融机构国家 */
	private String opp_country_s = "";

	/**
	 * 对方金融机构代码类型01：现代化支付系统行号； 02：人民币结算账户管理系统行号； 03：银行内部机构号； 04：其他
	 */
	private String opp_code_type_cd = "";

	private String opp_code_type_cd_disp = "";

	/** 对方金融机构代码 */
	private String opp_organkey = "";

	/** 对方金融机构名称 */
	private String opp_orgname = "";

	/** 对方金融机构地区 */
	private String opp_area = "";
	private String opp_area1 = "";
	private String opp_area2 = "";
	private String opp_areaname = "";

	/** 对方金融机构国家 */
	private String opp_country = "";

	private String opp_country_disp = "";

	/** 是否有效 */
	private String flag = "";

	private String[] opp_organkeys = {};
	
	private String orderby= "";

	private String order = "";
	private String unionorgkey = "";
	private String union_name = "";
	private String union_type = "";
	private String country_cd = "";
	private String city_cd = "";
	// =======================================================
	/**
	 * 构造函数
	 */
	public T47_OPP_bankActionForm() {
	}

	public void setOpp_code_type_cd(String opp_code_type_cdStr) {
		this.opp_code_type_cd = opp_code_type_cdStr;
	}

	public String getOpp_code_type_cd() {
		return this.opp_code_type_cd;
	}

	public void setOpp_organkey(String opp_organkeyStr) {
		this.opp_organkey = opp_organkeyStr;
	}

	public String getOpp_organkey() {
		return this.opp_organkey;
	}

	public void setOpp_orgname(String opp_orgnameStr) {
		this.opp_orgname = opp_orgnameStr;
	}

	public String getOpp_orgname() {
		return this.opp_orgname;
	}

	public void setOpp_area(String opp_areaStr) {
		this.opp_area = opp_areaStr;
	}

	public String getOpp_area() {
		return this.opp_area;
	}

	public void setOpp_country(String opp_countryStr) {
		this.opp_country = opp_countryStr;
	}

	public String getOpp_country() {
		return this.opp_country;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
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

	public String getOpp_code_type_cd_disp() {
		return opp_code_type_cd_disp;
	}

	public void setOpp_code_type_cd_disp(String opp_code_type_cd_disp) {
		this.opp_code_type_cd_disp = opp_code_type_cd_disp;
	}

	public String getOpp_country_disp() {
		return opp_country_disp;
	}

	public void setOpp_country_disp(String opp_country_disp) {
		this.opp_country_disp = opp_country_disp;
	}

	public String getOpp_code_type_cd_s() {
		return opp_code_type_cd_s;
	}

	public void setOpp_code_type_cd_s(String opp_code_type_cd_s) {
		this.opp_code_type_cd_s = opp_code_type_cd_s;
	}

	public String getOpp_organkey_s() {
		return opp_organkey_s;
	}

	public void setOpp_organkey_s(String opp_organkey_s) {
		this.opp_organkey_s = opp_organkey_s;
	}

	public String getOpp_orgname_s() {
		return opp_orgname_s;
	}

	public void setOpp_orgname_s(String opp_orgname_s) {
		this.opp_orgname_s = opp_orgname_s;
	}

	public String getOpp_area_s() {
		return opp_area_s;
	}

	public void setOpp_area_s(String opp_area_s) {
		this.opp_area_s = opp_area_s;
	}

	public String getOpp_country_s() {
		return opp_country_s;
	}

	public void setOpp_country_s(String opp_country_s) {
		this.opp_country_s = opp_country_s;
	}

	public String getOpp_areaname() {
		return opp_areaname;
	}

	public void setOpp_areaname(String opp_areaname) {
		this.opp_areaname = opp_areaname;
	}

	public String[] getOpp_organkeys() {
		return opp_organkeys;
	}

	public void setOpp_organkeys(String[] opp_organkeys) {
		this.opp_organkeys = opp_organkeys;
	}

	public String getOpp_area1() {
		return opp_area1;
	}

	public void setOpp_area1(String opp_area1) {
		this.opp_area1 = opp_area1;
	}

	public String getOpp_area2() {
		return opp_area2;
	}

	public void setOpp_area2(String opp_area2) {
		this.opp_area2 = opp_area2;
	}

	public String getOpp_area2name() {
		return opp_area2name;
	}

	public void setOpp_area2name(String opp_area2name) {
		this.opp_area2name = opp_area2name;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public String getCity_cd() {
		return city_cd;
	}

	public void setCity_cd(String city_cd) {
		this.city_cd = city_cd;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}

	public String getUnion_name() {
		return union_name;
	}

	public void setUnion_name(String union_name) {
		this.union_name = union_name;
	}

	public String getUnion_type() {
		return union_type;
	}

	public void setUnion_type(String union_type) {
		this.union_type = union_type;
	}

	public String getUnionorgkey() {
		return unionorgkey;
	}

	public void setUnionorgkey(String unionorgkey) {
		this.unionorgkey = unionorgkey;
	}
}

