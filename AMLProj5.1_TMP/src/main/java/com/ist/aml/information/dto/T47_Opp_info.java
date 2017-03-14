package com.ist.aml.information.dto;

import java.io.Serializable;

import java.util.Date;


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
public class T47_Opp_info implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7089717891034651539L;
	private String opp_organ_type="";
	private String opp_organkey="";
	private String opp_organname="";
	private String opp_party_id="";
	private String create_usr="";

	/** 对方账号 */
	private String opp_acct_num = "";

	private String opp_acct_num_s= "";

	private String opp_card_no_s= "";


	private String opp_name_s= "";

	private String opp_pbc_party_class_cd_s= "";

	private String opp_acct_type_cd_s="";

	private String opp_card_type_s="";

	/** 对方账户类型 */
	private String opp_acct_type_cd = "";

	/** 更新人 */
	private String create_user = "";

	/** 系统标识 */
	private String opp_sys_id = "";

	/** 对方客户类型 */
	private String opp_party_class_cd = "";

	private String opp_pbc_party_class_cd_disp = "";

	private String opp_pbc_party_class_cd = "";

	/** 对方证件类型 */
	private String opp_card_type = "";

	private String opp_card_type_disp = "";

	/** 对方证件号码 */
	private String opp_card_no = "";
	
	//证件类型明细
	private String opp_card_inf="";
	

	/** 更新日期 */
	private Date create_dt = new Date();

	/** 对方名称 */
	private String opp_name = "";

	private String[] opp_sys_ids = {};

	private String orderby = "";

	private String order = "";

	// =======================================================
	/** 更新日期 */
	private String create_dt_disp = "";

	
	private String opp_organname_s = "";
	private String opp_organ_type_s = "";
	private String opp_acct_type_cd_disp = "";
	private String opp_organ_type_disp = "";

	//对方证件类型详细信息
	private String opp_card_type_inf="";

	/**
	 * 构造函数
	 */
	
	/** 翻页信息 */                 //         
	private String intPage = "0";           


	public String getIntPage() {          
		return intPage;                
	}                                     
	public void setIntPage(String intPage) {             
		this.intPage = intPage;                        
	}                                  

	
	public T47_Opp_info() {
	}




	public Date getCreate_dt() {
		return create_dt;
	}




	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}




	public String getCreate_dt_disp() {
		return create_dt_disp;
	}




	public void setCreate_dt_disp(String create_dt_disp) {
		this.create_dt_disp = create_dt_disp;
	}




	public String getCreate_user() {
		return create_user;
	}




	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}




	public String getOpp_acct_num() {
		return opp_acct_num;
	}




	public void setOpp_acct_num(String opp_acct_num) {
		this.opp_acct_num = opp_acct_num;
	}




	public String getOpp_acct_num_s() {
		return opp_acct_num_s;
	}




	public void setOpp_acct_num_s(String opp_acct_num_s) {
		this.opp_acct_num_s = opp_acct_num_s;
	}




	public String getOpp_acct_type_cd() {
		return opp_acct_type_cd;
	}




	public void setOpp_acct_type_cd(String opp_acct_type_cd) {
		this.opp_acct_type_cd = opp_acct_type_cd;
	}




	public String getOpp_acct_type_cd_disp() {
		return opp_acct_type_cd_disp;
	}




	public void setOpp_acct_type_cd_disp(String opp_acct_type_cd_disp) {
		this.opp_acct_type_cd_disp = opp_acct_type_cd_disp;
	}




	public String getOpp_acct_type_cd_s() {
		return opp_acct_type_cd_s;
	}




	public void setOpp_acct_type_cd_s(String opp_acct_type_cd_s) {
		this.opp_acct_type_cd_s = opp_acct_type_cd_s;
	}




	public String getOpp_card_no() {
		return opp_card_no;
	}




	public void setOpp_card_no(String opp_card_no) {
		this.opp_card_no = opp_card_no;
	}




	public String getOpp_card_no_s() {
		return opp_card_no_s;
	}




	public void setOpp_card_no_s(String opp_card_no_s) {
		this.opp_card_no_s = opp_card_no_s;
	}




	public String getOpp_card_type() {
		return opp_card_type;
	}




	public void setOpp_card_type(String opp_card_type) {
		this.opp_card_type = opp_card_type;
	}




	public String getOpp_card_type_disp() {
		return opp_card_type_disp;
	}




	public void setOpp_card_type_disp(String opp_card_type_disp) {
		this.opp_card_type_disp = opp_card_type_disp;
	}




	public String getOpp_card_type_s() {
		return opp_card_type_s;
	}




	public void setOpp_card_type_s(String opp_card_type_s) {
		this.opp_card_type_s = opp_card_type_s;
	}




	public String getOpp_name() {
		return opp_name;
	}




	public void setOpp_name(String opp_name) {
		this.opp_name = opp_name;
	}




	public String getOpp_name_s() {
		return opp_name_s;
	}




	public void setOpp_name_s(String opp_name_s) {
		this.opp_name_s = opp_name_s;
	}




	public String getOpp_organ_type_disp() {
		return opp_organ_type_disp;
	}




	public void setOpp_organ_type_disp(String opp_organ_type_disp) {
		this.opp_organ_type_disp = opp_organ_type_disp;
	}




	public String getOpp_organ_type_s() {
		return opp_organ_type_s;
	}




	public void setOpp_organ_type_s(String opp_organ_type_s) {
		this.opp_organ_type_s = opp_organ_type_s;
	}




	public String getOpp_organname_s() {
		return opp_organname_s;
	}




	public void setOpp_organname_s(String opp_organname_s) {
		this.opp_organname_s = opp_organname_s;
	}




	public String getOpp_party_class_cd() {
		return opp_party_class_cd;
	}




	public void setOpp_party_class_cd(String opp_party_class_cd) {
		this.opp_party_class_cd = opp_party_class_cd;
	}




	public String getOpp_pbc_party_class_cd() {
		return opp_pbc_party_class_cd;
	}




	public void setOpp_pbc_party_class_cd(String opp_pbc_party_class_cd) {
		this.opp_pbc_party_class_cd = opp_pbc_party_class_cd;
	}




	public String getOpp_pbc_party_class_cd_disp() {
		return opp_pbc_party_class_cd_disp;
	}




	public void setOpp_pbc_party_class_cd_disp(String opp_pbc_party_class_cd_disp) {
		this.opp_pbc_party_class_cd_disp = opp_pbc_party_class_cd_disp;
	}




	public String getOpp_pbc_party_class_cd_s() {
		return opp_pbc_party_class_cd_s;
	}




	public void setOpp_pbc_party_class_cd_s(String opp_pbc_party_class_cd_s) {
		this.opp_pbc_party_class_cd_s = opp_pbc_party_class_cd_s;
	}




	public String getOpp_sys_id() {
		return opp_sys_id;
	}




	public void setOpp_sys_id(String opp_sys_id) {
		this.opp_sys_id = opp_sys_id;
	}




	public String[] getOpp_sys_ids() {
		return opp_sys_ids;
	}




	public void setOpp_sys_ids(String[] opp_sys_ids) {
		this.opp_sys_ids = opp_sys_ids;
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




	public String getCreate_usr() {
		return create_usr;
	}




	public void setCreate_usr(String create_usr) {
		this.create_usr = create_usr;
	}




	public String getOpp_organ_type() {
		return opp_organ_type;
	}




	public void setOpp_organ_type(String opp_organ_type) {
		this.opp_organ_type = opp_organ_type;
	}




	public String getOpp_organkey() {
		return opp_organkey;
	}




	public void setOpp_organkey(String opp_organkey) {
		this.opp_organkey = opp_organkey;
	}




	public String getOpp_organname() {
		return opp_organname;
	}




	public void setOpp_organname(String opp_organname) {
		this.opp_organname = opp_organname;
	}




	public String getOpp_party_id() {
		return opp_party_id;
	}




	public void setOpp_party_id(String opp_party_id) {
		this.opp_party_id = opp_party_id;
	}
	public String getOpp_card_type_inf() {
		return opp_card_type_inf;
	}
	public void setOpp_card_type_inf(String opp_card_type_inf) {
		this.opp_card_type_inf = opp_card_type_inf;
	}
	public String getOpp_card_inf() {
		return opp_card_inf;
	}
	public void setOpp_card_inf(String oppCardInf) {
		opp_card_inf = oppCardInf;
	}

	
}
