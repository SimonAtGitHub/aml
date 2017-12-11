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

package com.ist.aml.information.controller;

import javax.servlet.http.*;
import org.apache.struts.action.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class T47_partyActionForm extends ActionForm {

	/** 证件有效起始日期 */
	private Date start_dt = new Date();
	/** 证件有效起始日期 */
	private String start_dt_disp = "";
	/** 证件有效终止日期 */
	private Date invalid_dt = new Date();
	/** 证件有效终止日期 */
	private String invalid_dt_disp = "";
	/** 证件状态: 0 失效, 1 有效 */
	private String card_state = "";
	/** 移动电话 */
	private String cell_no = "";
	/** 地址1 */
	private String addr1 = "";
	/** 保留2 */
	private String temp2 = "";
	/** 地址2 */
	private String addr2 = "";
	/**
	 * 证件类型 01:居民身份证、临时居民身份证或户口簿； 02：军人身份证件或警察身份证件；
	 * 03：港澳居民往来内地通行证、台湾居民往来内地通行证或者其他有效旅行证件； 04：护照； 05：其他 51:机构代码证 99:未知
	 */
	private String card_type = "";
	private String card_type_s = "";
	private String card_type_disp = "";
	/** 证件号码 */
	private String card_no = "";
	private String card_no_s = "";
	/** 当事人中文名称 */
	private String party_chn_name = "";
	private String party_chn_name_s = "";
	/**
	 * 当事人状态 0：正常 1：销户 2：未开户 4：删除 X：未知
	 */
	private String party_status_cd = "";
	private String party_status_cd_s = "";
	private String party_status_cd_disp = "";
	private String country_cd = "";
	private String country_disp = "";
	/** 上次更新用户 */
	private String last_upd_user = "";
	/** 所在地 */
	private String country_residence = "";
	/**
	 * AML类型2 01:法人; 02:自然人； 03:个体工商户； 04:其他组织
	 */
	private String aml2_type_cd = "";
	private String aml2_type_disp = "";
	/** 网址 */
	private String net_address = "";
	/**
	 * AML类型1 个人：01居民 02非居民 公司：51:各级党的机关、国家权力机关、行政机关、司法机关、军事机关、人民政协机关
	 * 52:人民解放军、武警部队 53:保险机构 54:证券经营机构
	 */
	private String aml1_type_cd = "";
	private String aml1_type_disp = "";
	/** 邮政编码 */
	private String postalcode = "";
	/** 当事人编号 */
	private String party_id = "";
	/** 当事人英文名称 */
	private String party_eng_name = "";
	/** 对私职业 */
	private String occupation = "";
	private String occupation_disp = "";
	/** 对公行业 */
	private String industrykey = "";
	private String industrykey_disp = "";
	/** 注册资金 */
	private String enrol_fund_amt = "";
	/** 注册资金币种 */
	private String enrol_fund_currency_cd = "";
	private String enrol_fund_currency_disp = "";
	/** 法定代表人 */
	private String legal_obj = "";
	/** 法定代表人身份证件类型 */
	private String legal_card_type = "";
	private String legal_card_type_disp = "";
	/** 法定代表人身份证件号码 */
	private String legal_card_no = "";
	/** 电子邮件 */
	private String email_addr = "";
	/**
	 * 是否新增客户0:否 1:是
	 */
	private String new_ind = "";
	/** 固定电话 */
	private String tel_no = "";
	/** 所属机构 */
	private String organkey = "";
	private String organName = "";
	private String organ_name = "";
	private String party_id_s = "";

	/** 保留1 */
	private String temp1 = "";
	/** 原客户号 */
	private String host_cust_id = "";
	/**
	 * 当事人类型C:对公当事人 I:个人当事人
	 */
	private String party_class_cd = "";
	private String party_class_cd_s = "";
	/** 建立时间 */
	private Date create_dt = new Date();
	/** 出生/成立日期 */
	private Date birth_dt = new Date();
	/** 上次更新时间 */
	private Date last_upd_dt = new Date();

	// =======================================================
	/** 建立时间 */
	private String create_dt_disp = "";
	/** 出生/成立日期 */
	private String birth_dt_disp = "";
	/** 上次更新时间 */
	private String last_upd_dt_disp = "";
	private String order = "";
	private String customerorder = "";
	private String orderby = "";
	private String searchorgankey = "";
	private String party_cd = "";
	private String table_id = "";
	private String field_id = "";
	private String modify_ind = "";
	private String default_val = "";
	private String flag = "";
	private String party_chn_name_flag = "";
	private String card_type_flag = "";
	private String host_cust_id_flag = "";
	private String card_no_flag = "";
	private String country_cd_flag = "";
	private String aml2_type_cd_flag = "";
	private String aml1_type_cd_flag = "";
	private String addr1_flag = "";
	private String addr2_flag = "";
	private String cell_no_flag = "";
	private String tel_no_flag = "";
	private String net_address_flag = "";
	private String email_addr_flag = "";
	private String postalcode_flag = "";
	private String occupation_flag = "";
	private String industrykey_flag = "";
	private String enrol_fund_amt_flag = "";
	private String legal_obj_flag = "";
	private String legal_card_type_flag = "";
	private String legal_card_no_flag = "";
	private String application_pary_type = "";
	private String validate = "";
	/** 机构信用代码*/
	private String org_credit_no="";
	/** 机构信用代码有效期*/
	private Date org_credit_vt=null;
	private String org_credit_vt_disp="";
	// 证件类型的详细信息
	private String card_type_inf = "";
	private String legal_card_type_inf = "";

	
	/***********add by lijie********/
	/** 合并机构信息 */
	private String opp_party_class_cd = "";
	private String opp_pbc_party_class_cd_disp = "";
	private String opp_pbc_party_class_cd = "";
	private String opp_organkey="";
	private String opp_organname="";
	private String organkey_s="";
	private String opp_organkey_s="";
	private String opp_name = "";
	private String opp_pbc_party_class_cd_s= "";
	/** 更新人 */
	private String create_user = "";
	/*****end by lijie******/
	
	
	
	
	public String getOpp_party_class_cd() {
		return opp_party_class_cd;
	}

	public String getOpp_name() {
		return opp_name;
	}

	public void setOpp_name(String oppName) {
		opp_name = oppName;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String createUser) {
		create_user = createUser;
	}

	public void setOpp_party_class_cd(String oppPartyClassCd) {
		opp_party_class_cd = oppPartyClassCd;
	}

	public String getOpp_pbc_party_class_cd_disp() {
		return opp_pbc_party_class_cd_disp;
	}

	public void setOpp_pbc_party_class_cd_disp(String oppPbcPartyClassCdDisp) {
		opp_pbc_party_class_cd_disp = oppPbcPartyClassCdDisp;
	}

	public String getOpp_pbc_party_class_cd() {
		return opp_pbc_party_class_cd;
	}

	public void setOpp_pbc_party_class_cd(String oppPbcPartyClassCd) {
		opp_pbc_party_class_cd = oppPbcPartyClassCd;
	}

	public String getOpp_organkey() {
		return opp_organkey;
	}

	public void setOpp_organkey(String oppOrgankey) {
		opp_organkey = oppOrgankey;
	}

	public String getOpp_organname() {
		return opp_organname;
	}

	public void setOpp_organname(String oppOrganname) {
		opp_organname = oppOrganname;
	}

	public String getOrgankey_s() {
		return organkey_s;
	}

	public void setOrgankey_s(String organkeyS) {
		organkey_s = organkeyS;
	}

	public String getOpp_organkey_s() {
		return opp_organkey_s;
	}

	public void setOpp_organkey_s(String oppOrgankeyS) {
		opp_organkey_s = oppOrgankeyS;
	}

	public String getOpp_pbc_party_class_cd_s() {
		return opp_pbc_party_class_cd_s;
	}

	public void setOpp_pbc_party_class_cd_s(String oppPbcPartyClassCdS) {
		opp_pbc_party_class_cd_s = oppPbcPartyClassCdS;
	}

	public String getCard_type_inf() {
		return card_type_inf;
	}

	public void setCard_type_inf(String card_type_inf) {
		this.card_type_inf = card_type_inf;
	}

	public String getLegal_card_type_inf() {
		return legal_card_type_inf;
	}

	public void setLegal_card_type_inf(String legal_card_type_inf) {
		this.legal_card_type_inf = legal_card_type_inf;
	}

	public String getDefault_val() {
		return default_val;
	}

	public void setDefault_val(String default_val) {
		this.default_val = default_val;
	}

	public String getField_id() {
		return field_id;
	}

	public void setField_id(String field_id) {
		this.field_id = field_id;
	}

	public String getModify_ind() {
		return modify_ind;
	}

	public void setModify_ind(String modify_ind) {
		this.modify_ind = modify_ind;
	}

	public String getParty_cd() {
		return party_cd;
	}

	public void setParty_cd(String party_cd) {
		this.party_cd = party_cd;
	}

	public String getTable_id() {
		return table_id;
	}

	public void setTable_id(String table_id) {
		this.table_id = table_id;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	/**
	 * 构造函数
	 */
	public T47_partyActionForm() {
	}

	public void setCell_no(String cell_noStr) {
		this.cell_no = cell_noStr;
	}

	public String getCell_no() {
		return this.cell_no;
	}

	public void setAddr1(String addr1Str) {
		this.addr1 = addr1Str;
	}

	public String getAddr1() {
		return this.addr1;
	}

	public void setTemp2(String temp2Str) {
		this.temp2 = temp2Str;
	}

	public String getTemp2() {
		return this.temp2;
	}

	public void setAddr2(String addr2Str) {
		this.addr2 = addr2Str;
	}

	public String getAddr2() {
		return this.addr2;
	}

	public void setCard_type(String card_typeStr) {
		this.card_type = card_typeStr;
	}

	public String getCard_type() {
		return this.card_type;
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

	public void setParty_status_cd(String party_status_cdStr) {
		this.party_status_cd = party_status_cdStr;
	}

	public String getParty_status_cd() {
		return this.party_status_cd;
	}

	public void setCountry_cd(String country_cdStr) {
		this.country_cd = country_cdStr;
	}

	public String getCountry_cd() {
		return this.country_cd;
	}

	public void setLast_upd_user(String last_upd_userStr) {
		this.last_upd_user = last_upd_userStr;
	}

	public String getLast_upd_user() {
		return this.last_upd_user;
	}

	public void setCountry_residence(String country_residenceStr) {
		this.country_residence = country_residenceStr;
	}

	public String getCountry_residence() {
		return this.country_residence;
	}

	public void setAml2_type_cd(String aml2_type_cdStr) {
		this.aml2_type_cd = aml2_type_cdStr;
	}

	public String getAml2_type_cd() {
		return this.aml2_type_cd;
	}

	public void setNet_address(String net_addressStr) {
		this.net_address = net_addressStr;
	}

	public String getNet_address() {
		return this.net_address;
	}

	public void setAml1_type_cd(String aml1_type_cdStr) {
		this.aml1_type_cd = aml1_type_cdStr;
	}

	public String getAml1_type_cd() {
		return this.aml1_type_cd;
	}

	public void setPostalcode(String postalcodeStr) {
		this.postalcode = postalcodeStr;
	}

	public String getPostalcode() {
		return this.postalcode;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setParty_eng_name(String party_eng_nameStr) {
		this.party_eng_name = party_eng_nameStr;
	}

	public String getParty_eng_name() {
		return this.party_eng_name;
	}

	public void setEmail_addr(String email_addrStr) {
		this.email_addr = email_addrStr;
	}

	public String getEmail_addr() {
		return this.email_addr;
	}

	public void setNew_ind(String new_indStr) {
		this.new_ind = new_indStr;
	}

	public String getNew_ind() {
		return this.new_ind;
	}

	public void setTel_no(String tel_noStr) {
		this.tel_no = tel_noStr;
	}

	public String getTel_no() {
		return this.tel_no;
	}

	public void setOrgankey(String organkeyStr) {
		this.organkey = organkeyStr;
	}

	public String getOrgankey() {
		return this.organkey;
	}

	public void setTemp1(String temp1Str) {
		this.temp1 = temp1Str;
	}

	public String getTemp1() {
		return this.temp1;
	}

	public void setHost_cust_id(String host_cust_idStr) {
		this.host_cust_id = host_cust_idStr;
	}

	public String getHost_cust_id() {
		return this.host_cust_id;
	}

	public void setParty_class_cd(String party_class_cdStr) {
		this.party_class_cd = party_class_cdStr;
	}

	public String getParty_class_cd() {
		return this.party_class_cd;
	}

	public void setCreate_dt(Date create_dtStr) {
		this.create_dt = create_dtStr;
	}

	public Date getCreate_dt() {
		return this.create_dt;
	}

	public void setBirth_dt(Date birth_dtStr) {
		this.birth_dt = birth_dtStr;
	}

	public Date getBirth_dt() {
		return this.birth_dt;
	}

	public void setLast_upd_dt(Date last_upd_dtStr) {
		this.last_upd_dt = last_upd_dtStr;
	}

	public Date getLast_upd_dt() {
		return this.last_upd_dt;
	}

	// =======================================================
	public void setCreate_dt_disp(String create_dt_dispStr) {
		this.create_dt_disp = create_dt_dispStr;
	}

	public String getCreate_dt_disp() {
		return this.create_dt_disp;
	}

	public void setBirth_dt_disp(String birth_dt_dispStr) {
		this.birth_dt_disp = birth_dt_dispStr;
	}

	public String getBirth_dt_disp() {
		return this.birth_dt_disp;
	}

	public void setLast_upd_dt_disp(String last_upd_dt_dispStr) {
		this.last_upd_dt_disp = last_upd_dt_dispStr;
	}

	public String getLast_upd_dt_disp() {
		return this.last_upd_dt_disp;
	}

	// =======================================================
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		/** @todo: finish this method, this is just the skeleton. */
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
	}

	public String getParty_status_cd_disp() {
		return party_status_cd_disp;
	}

	public void setParty_status_cd_disp(String party_status_cd_disp) {
		this.party_status_cd_disp = party_status_cd_disp;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getParty_chn_name_s() {
		return party_chn_name_s;
	}

	public void setParty_chn_name_s(String party_chn_name_s) {
		this.party_chn_name_s = party_chn_name_s;
	}

	public String getParty_class_cd_s() {
		return party_class_cd_s;
	}

	public void setParty_class_cd_s(String party_class_cd_s) {
		this.party_class_cd_s = party_class_cd_s;
	}

	public String getParty_status_cd_s() {
		return party_status_cd_s;
	}

	public void setParty_status_cd_s(String party_status_cd_s) {
		this.party_status_cd_s = party_status_cd_s;
	}

	public String getSearchorgankey() {
		return searchorgankey;
	}

	public void setSearchorgankey(String searchorgankey) {
		this.searchorgankey = searchorgankey;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getCountry_disp() {
		return country_disp;
	}

	public void setCountry_disp(String country_disp) {
		this.country_disp = country_disp;
	}

	public String getEnrol_fund_amt() {
		return enrol_fund_amt;
	}

	public void setEnrol_fund_amt(String enrol_fund_amt) {
		this.enrol_fund_amt = enrol_fund_amt;
	}

	public String getIndustrykey() {
		return industrykey;
	}

	public void setIndustrykey(String industrykey) {
		this.industrykey = industrykey;
	}

	public String getLegal_card_no() {
		return legal_card_no;
	}

	public void setLegal_card_no(String legal_card_no) {
		this.legal_card_no = legal_card_no;
	}

	public String getLegal_card_type() {
		return legal_card_type;
	}

	public void setLegal_card_type(String legal_card_type) {
		this.legal_card_type = legal_card_type;
	}

	public String getLegal_obj() {
		return legal_obj;
	}

	public void setLegal_obj(String legal_obj) {
		this.legal_obj = legal_obj;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getCustomerorder() {
		return customerorder;
	}

	public void setCustomerorder(String customerorder) {
		this.customerorder = customerorder;
	}

	public String getAddr1_flag() {
		return addr1_flag;
	}

	public void setAddr1_flag(String addr1_flag) {
		this.addr1_flag = addr1_flag;
	}

	public String getAddr2_flag() {
		return addr2_flag;
	}

	public void setAddr2_flag(String addr2_flag) {
		this.addr2_flag = addr2_flag;
	}

	public String getAml1_type_cd_flag() {
		return aml1_type_cd_flag;
	}

	public void setAml1_type_cd_flag(String aml1_type_cd_flag) {
		this.aml1_type_cd_flag = aml1_type_cd_flag;
	}

	public String getAml2_type_cd_flag() {
		return aml2_type_cd_flag;
	}

	public void setAml2_type_cd_flag(String aml2_type_cd_flag) {
		this.aml2_type_cd_flag = aml2_type_cd_flag;
	}

	public String getCard_no_flag() {
		return card_no_flag;
	}

	public void setCard_no_flag(String card_no_flag) {
		this.card_no_flag = card_no_flag;
	}

	public String getCard_type_flag() {
		return card_type_flag;
	}

	public void setCard_type_flag(String card_type_flag) {
		this.card_type_flag = card_type_flag;
	}

	public String getCell_no_flag() {
		return cell_no_flag;
	}

	public void setCell_no_flag(String cell_no_flag) {
		this.cell_no_flag = cell_no_flag;
	}

	public String getCountry_cd_flag() {
		return country_cd_flag;
	}

	public void setCountry_cd_flag(String country_cd_flag) {
		this.country_cd_flag = country_cd_flag;
	}

	public String getEmail_addr_flag() {
		return email_addr_flag;
	}

	public void setEmail_addr_flag(String email_addr_flag) {
		this.email_addr_flag = email_addr_flag;
	}

	public String getEnrol_fund_amt_flag() {
		return enrol_fund_amt_flag;
	}

	public void setEnrol_fund_amt_flag(String enrol_fund_amt_flag) {
		this.enrol_fund_amt_flag = enrol_fund_amt_flag;
	}

	public String getHost_cust_id_flag() {
		return host_cust_id_flag;
	}

	public void setHost_cust_id_flag(String host_cust_id_flag) {
		this.host_cust_id_flag = host_cust_id_flag;
	}

	public String getIndustrykey_flag() {
		return industrykey_flag;
	}

	public void setIndustrykey_flag(String industrykey_flag) {
		this.industrykey_flag = industrykey_flag;
	}

	public String getLegal_card_no_flag() {
		return legal_card_no_flag;
	}

	public void setLegal_card_no_flag(String legal_card_no_flag) {
		this.legal_card_no_flag = legal_card_no_flag;
	}

	public String getLegal_card_type_flag() {
		return legal_card_type_flag;
	}

	public void setLegal_card_type_flag(String legal_card_type_flag) {
		this.legal_card_type_flag = legal_card_type_flag;
	}

	public String getLegal_obj_flag() {
		return legal_obj_flag;
	}

	public void setLegal_obj_flag(String legal_obj_flag) {
		this.legal_obj_flag = legal_obj_flag;
	}

	public String getNet_address_flag() {
		return net_address_flag;
	}

	public void setNet_address_flag(String net_address_flag) {
		this.net_address_flag = net_address_flag;
	}

	public String getOccupation_flag() {
		return occupation_flag;
	}

	public void setOccupation_flag(String occupation_flag) {
		this.occupation_flag = occupation_flag;
	}

	public String getParty_chn_name_flag() {
		return party_chn_name_flag;
	}

	public void setParty_chn_name_flag(String party_chn_name_flag) {
		this.party_chn_name_flag = party_chn_name_flag;
	}

	public String getPostalcode_flag() {
		return postalcode_flag;
	}

	public void setPostalcode_flag(String postalcode_flag) {
		this.postalcode_flag = postalcode_flag;
	}

	public String getTel_no_flag() {
		return tel_no_flag;
	}

	public void setTel_no_flag(String tel_no_flag) {
		this.tel_no_flag = tel_no_flag;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getCard_type_disp() {
		return card_type_disp;
	}

	public void setCard_type_disp(String card_type_disp) {
		this.card_type_disp = card_type_disp;
	}

	public String getAml2_type_disp() {
		return aml2_type_disp;
	}

	public void setAml2_type_disp(String aml2_type_disp) {
		this.aml2_type_disp = aml2_type_disp;
	}

	public String getIndustrykey_disp() {
		return industrykey_disp;
	}

	public void setIndustrykey_disp(String industrykey_disp) {
		this.industrykey_disp = industrykey_disp;
	}

	public String getLegal_card_type_disp() {
		return legal_card_type_disp;
	}

	public void setLegal_card_type_disp(String legal_card_type_disp) {
		this.legal_card_type_disp = legal_card_type_disp;
	}

	public String getAml1_type_disp() {
		return aml1_type_disp;
	}

	public void setAml1_type_disp(String aml1_type_disp) {
		this.aml1_type_disp = aml1_type_disp;
	}

	public String getOccupation_disp() {
		return occupation_disp;
	}

	public void setOccupation_disp(String occupation_disp) {
		this.occupation_disp = occupation_disp;
	}

	public String getEnrol_fund_currency_cd() {
		return enrol_fund_currency_cd;
	}

	public void setEnrol_fund_currency_cd(String enrol_fund_currency_cd) {
		this.enrol_fund_currency_cd = enrol_fund_currency_cd;
	}

	public String getEnrol_fund_currency_disp() {
		return enrol_fund_currency_disp;
	}

	public void setEnrol_fund_currency_disp(String enrol_fund_currency_disp) {
		this.enrol_fund_currency_disp = enrol_fund_currency_disp;
	}

	public String getOrgan_name() {
		return organ_name;
	}

	public void setOrgan_name(String organ_name) {
		this.organ_name = organ_name;
	}

	public String getParty_id_s() {
		return party_id_s;
	}

	public void setParty_id_s(String party_id_s) {
		this.party_id_s = party_id_s;
	}

	public String getCard_no_s() {
		return card_no_s;
	}

	public void setCard_no_s(String card_no_s) {
		this.card_no_s = card_no_s;
	}

	public String getCard_type_s() {
		return card_type_s;
	}

	public void setCard_type_s(String card_type_s) {
		this.card_type_s = card_type_s;
	}

	public String getCard_state() {
		return card_state;
	}

	public void setCard_state(String card_state) {
		this.card_state = card_state;
	}

	public Date getInvalid_dt() {
		return invalid_dt;
	}

	public void setInvalid_dt(Date invalid_dt) {
		this.invalid_dt = invalid_dt;
	}

	public String getInvalid_dt_disp() {
		return invalid_dt_disp;
	}

	public void setInvalid_dt_disp(String invalid_dt_disp) {
		this.invalid_dt_disp = invalid_dt_disp;
	}

	public Date getStart_dt() {
		return start_dt;
	}

	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}

	public String getStart_dt_disp() {
		return start_dt_disp;
	}

	public void setStart_dt_disp(String start_dt_disp) {
		this.start_dt_disp = start_dt_disp;
	}

	public String getApplication_pary_type() {
		return application_pary_type;
	}

	public void setApplication_pary_type(String application_pary_type) {
		this.application_pary_type = application_pary_type;
	}

	public String getValidate() {
		return validate;
	}

	public void setValidate(String validate) {
		this.validate = validate;
	}

	public String getOrg_credit_no() {
		return org_credit_no;
	}

	public void setOrg_credit_no(String orgCreditNo) {
		org_credit_no = orgCreditNo;
	}

	public Date getOrg_credit_vt() {
		return org_credit_vt;
	}

	public void setOrg_credit_vt(Date orgCreditVt) {
		org_credit_vt = orgCreditVt;
	}

	public String getOrg_credit_vt_disp() {
		return org_credit_vt_disp;
	}

	public void setOrg_credit_vt_disp(String orgCreditVtDisp) {
		org_credit_vt_disp = orgCreditVtDisp;
	}
}
