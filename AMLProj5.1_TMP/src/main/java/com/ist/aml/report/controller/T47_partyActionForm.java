/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-28   青蛙		创建        
 */                                             
                                                  
package com.ist.aml.report.controller;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: 北京银丰新融科技开发有限公司</p>      
 * @author 研发组                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
                                              
public class T47_partyActionForm extends ActionForm {
                                              
/** 网址 */
private String net_address = "";
/** AML类型2 保留 */
private String aml2_type_cd = "";
/** 移动电话 */
private String cell_no = "";
/** AML类型1 */
private String aml1_type_cd = "";
/** 当事人编号 */
private String party_id = "";
private String party_id_disp = "";
/** 地址1 */
private String addr1 = "";
/** 电子邮件 */
private String email_addr = "";
/** 当事人英文名称 */
private String party_eng_name = "";
/** 地址2 */
private String addr2 = "";
/** 固定电话 */
private String tel_no = "";
/** 原客户号 */
private String host_cust_id = "";
/** 证件类型 01:居民身份证、临时居民身份证或户口簿02：军人身份证件或警察身份证件03：港澳居民往来内地通行证、台湾居民往来内地通行证或者其他有效旅行证件04：护照05：其他51:机构代码证 */
private String card_type = "";
/** 客户类型 C:对公当事人 I:个人当事人
 */
private String party_class_cd = "";
/** 证件号码 */
private String card_no = "";
/** 当事人中文名称 */
private String party_chn_name = "";
/** 所属国家 */
private String country_cd = "";
/** 上次更新用户 */
private String last_upd_user = "";
/** 建立时间 */
private Date create_dt = new Date();
/** 上次更新时间 */
private Date last_upd_dt = new Date();
/** null */
private Date birth_dt = new Date();
/** 所在地 */
private String country_residence = "";

//=======================================================
/** 建立时间 */
private String create_dt_disp = "";
/** 上次更新时间 */
private String last_upd_dt_disp = "";
/** null */
private String birth_dt_disp = "";
/** 归属机构码*/
private String organkey="";
/** 归属机构码查询*/
private String searchorgankey="";
/** 归属机构名称*/
private String organName="";
/** 客户状态*/
private String party_status_cd="";
/** 客户状态描述*/
private String party_status_disp="";
/** 当事人类型 C:对公当事人 I:个人当事人
 * /** 所属国家 */
private String country_disp = "";
 /* 客户类型描述*/
private String party_class_disp = "";
/** 证件类型描述 */
private String card_type_disp = "";
/** 按哪个字段排序*/
private String customerorder=""; 
/** 排序方向*/
private String order="1"; 
/** 排序方向*/
private String orderby="";
private String party_chn_name_s="";
private String legal_card_type="";


/** 证件有效起始日期 */
private Date start_dt = new Date();
/** 证件有效起始日期 */
private String start_dt_disp = "";
/** 证件有效终止日期 */
private Date invalid_dt = new Date();
/** 证件有效终止日期 */
private String invalid_dt_disp = "";
/** 证件状态: 0 失效, 1 有效*/
private String card_state= "";                                              

/** 保留2 */
private String temp2 = "";



private String party_status_cd_s = "";
private String party_status_cd_disp = "";


private String aml2_type_disp = "";

private String aml1_type_disp = "";

/** 对私职业 */
private String occupation = "";
private String occupation_disp = "";
/** 对公行业 */
private String industrykey = "";
private String industrykey_disp = "";
/** 注册资金 */
private String enrol_fund_amt = "";

private String enrol_fund_currency_disp = "";
/** 法定代表人 */
private String legal_obj = "";

private String legal_card_type_disp = "";
/** 法定代表人身份证件号码 */
private String legal_card_no = "";

/** 是否新增客户0:否
1:是
 */
private String new_ind = "";

private String organ_name = "";


/** 保留1 */
private String temp1 = "";



private String party_cd= "";
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
private String application_pary_type="";


//证件类型的详细信息
private String card_type_inf="";
private String legal_card_type_inf="";
private String party_chn_name_search="";



/* 客户号复选框**/
private String partyCheckBox[]= null;

/* 案例客户新增页面用到字段**/
private String ctnm = "";
private String csnm = "";
private String citp = "";
private String ctid = "";
private String ctnt = "";
private String cttp = "";
private String otherContact = "";
private String ctvc_i = "";
private String ctvc = "";

/** 是否行内用户*/
private String is_party="";

public String getParty_chn_name_search() {
	return party_chn_name_search;
}
public void setParty_chn_name_search(String partyChnNameSearch) {
	party_chn_name_search = partyChnNameSearch;
}
public String getCtnm() {
	return ctnm;
}
public void setCtnm(String ctnm) {
	this.ctnm = ctnm;
}
public String getCsnm() {
	return csnm;
}
public void setCsnm(String csnm) {
	this.csnm = csnm;
}
public String getCitp() {
	return citp;
}
public void setCitp(String citp) {
	this.citp = citp;
}
public String getCtid() {
	return ctid;
}
public void setCtid(String ctid) {
	this.ctid = ctid;
}
public String getCtnt() {
	return ctnt;
}
public void setCtnt(String ctnt) {
	this.ctnt = ctnt;
}
public String getCttp() {
	return cttp;
}
public void setCttp(String cttp) {
	this.cttp = cttp;
}
public String getOtherContact() {
	return otherContact;
}
public void setOtherContact(String otherContact) {
	this.otherContact = otherContact;
}
public String getCtvc_i() {
	return ctvc_i;
}
public void setCtvc_i(String ctvcI) {
	ctvc_i = ctvcI;
}
public String getCtvc() {
	return ctvc;
}
public void setCtvc(String ctvc) {
	this.ctvc = ctvc;
}
public Date getStart_dt() {
	return start_dt;
}
public void setStart_dt(Date startDt) {
	start_dt = startDt;
}
public String getStart_dt_disp() {
	return start_dt_disp;
}
public void setStart_dt_disp(String startDtDisp) {
	start_dt_disp = startDtDisp;
}
public Date getInvalid_dt() {
	return invalid_dt;
}
public void setInvalid_dt(Date invalidDt) {
	invalid_dt = invalidDt;
}
public String getInvalid_dt_disp() {
	return invalid_dt_disp;
}
public void setInvalid_dt_disp(String invalidDtDisp) {
	invalid_dt_disp = invalidDtDisp;
}
public String getCard_state() {
	return card_state;
}
public void setCard_state(String cardState) {
	card_state = cardState;
}
public String getTemp2() {
	return temp2;
}
public void setTemp2(String temp2) {
	this.temp2 = temp2;
}
public String getParty_status_cd_s() {
	return party_status_cd_s;
}
public void setParty_status_cd_s(String partyStatusCdS) {
	party_status_cd_s = partyStatusCdS;
}
public String getParty_status_cd_disp() {
	return party_status_cd_disp;
}
public void setParty_status_cd_disp(String partyStatusCdDisp) {
	party_status_cd_disp = partyStatusCdDisp;
}
public String getAml2_type_disp() {
	return aml2_type_disp;
}
public void setAml2_type_disp(String aml2TypeDisp) {
	aml2_type_disp = aml2TypeDisp;
}
public String getAml1_type_disp() {
	return aml1_type_disp;
}
public void setAml1_type_disp(String aml1TypeDisp) {
	aml1_type_disp = aml1TypeDisp;
}
public String getOccupation() {
	return occupation;
}
public void setOccupation(String occupation) {
	this.occupation = occupation;
}
public String getOccupation_disp() {
	return occupation_disp;
}
public void setOccupation_disp(String occupationDisp) {
	occupation_disp = occupationDisp;
}
public String getIndustrykey() {
	return industrykey;
}
public void setIndustrykey(String industrykey) {
	this.industrykey = industrykey;
}
public String getIndustrykey_disp() {
	return industrykey_disp;
}
public void setIndustrykey_disp(String industrykeyDisp) {
	industrykey_disp = industrykeyDisp;
}
public String getEnrol_fund_amt() {
	return enrol_fund_amt;
}
public void setEnrol_fund_amt(String enrolFundAmt) {
	enrol_fund_amt = enrolFundAmt;
}
public String getEnrol_fund_currency_disp() {
	return enrol_fund_currency_disp;
}
public void setEnrol_fund_currency_disp(String enrolFundCurrencyDisp) {
	enrol_fund_currency_disp = enrolFundCurrencyDisp;
}
public String getLegal_obj() {
	return legal_obj;
}
public void setLegal_obj(String legalObj) {
	legal_obj = legalObj;
}
public String getLegal_card_type_disp() {
	return legal_card_type_disp;
}
public void setLegal_card_type_disp(String legalCardTypeDisp) {
	legal_card_type_disp = legalCardTypeDisp;
}
public String getLegal_card_no() {
	return legal_card_no;
}
public void setLegal_card_no(String legalCardNo) {
	legal_card_no = legalCardNo;
}
public String getNew_ind() {
	return new_ind;
}
public void setNew_ind(String newInd) {
	new_ind = newInd;
}
public String getOrgan_name() {
	return organ_name;
}
public void setOrgan_name(String organName) {
	organ_name = organName;
}
public String getTemp1() {
	return temp1;
}
public void setTemp1(String temp1) {
	this.temp1 = temp1;
}
public String getParty_cd() {
	return party_cd;
}
public void setParty_cd(String partyCd) {
	party_cd = partyCd;
}
public String getTable_id() {
	return table_id;
}
public void setTable_id(String tableId) {
	table_id = tableId;
}
public String getField_id() {
	return field_id;
}
public void setField_id(String fieldId) {
	field_id = fieldId;
}
public String getModify_ind() {
	return modify_ind;
}
public void setModify_ind(String modifyInd) {
	modify_ind = modifyInd;
}
public String getDefault_val() {
	return default_val;
}
public void setDefault_val(String defaultVal) {
	default_val = defaultVal;
}
public String getFlag() {
	return flag;
}
public void setFlag(String flag) {
	this.flag = flag;
}
public String getParty_chn_name_flag() {
	return party_chn_name_flag;
}
public void setParty_chn_name_flag(String partyChnNameFlag) {
	party_chn_name_flag = partyChnNameFlag;
}
public String getCard_type_flag() {
	return card_type_flag;
}
public void setCard_type_flag(String cardTypeFlag) {
	card_type_flag = cardTypeFlag;
}
public String getHost_cust_id_flag() {
	return host_cust_id_flag;
}
public void setHost_cust_id_flag(String hostCustIdFlag) {
	host_cust_id_flag = hostCustIdFlag;
}
public String getCard_no_flag() {
	return card_no_flag;
}
public void setCard_no_flag(String cardNoFlag) {
	card_no_flag = cardNoFlag;
}
public String getCountry_cd_flag() {
	return country_cd_flag;
}
public void setCountry_cd_flag(String countryCdFlag) {
	country_cd_flag = countryCdFlag;
}
public String getAml2_type_cd_flag() {
	return aml2_type_cd_flag;
}
public void setAml2_type_cd_flag(String aml2TypeCdFlag) {
	aml2_type_cd_flag = aml2TypeCdFlag;
}
public String getAml1_type_cd_flag() {
	return aml1_type_cd_flag;
}
public void setAml1_type_cd_flag(String aml1TypeCdFlag) {
	aml1_type_cd_flag = aml1TypeCdFlag;
}
public String getAddr1_flag() {
	return addr1_flag;
}
public void setAddr1_flag(String addr1Flag) {
	addr1_flag = addr1Flag;
}
public String getAddr2_flag() {
	return addr2_flag;
}
public void setAddr2_flag(String addr2Flag) {
	addr2_flag = addr2Flag;
}
public String getCell_no_flag() {
	return cell_no_flag;
}
public void setCell_no_flag(String cellNoFlag) {
	cell_no_flag = cellNoFlag;
}
public String getTel_no_flag() {
	return tel_no_flag;
}
public void setTel_no_flag(String telNoFlag) {
	tel_no_flag = telNoFlag;
}
public String getNet_address_flag() {
	return net_address_flag;
}
public void setNet_address_flag(String netAddressFlag) {
	net_address_flag = netAddressFlag;
}
public String getEmail_addr_flag() {
	return email_addr_flag;
}
public void setEmail_addr_flag(String emailAddrFlag) {
	email_addr_flag = emailAddrFlag;
}
public String getPostalcode_flag() {
	return postalcode_flag;
}
public void setPostalcode_flag(String postalcodeFlag) {
	postalcode_flag = postalcodeFlag;
}
public String getOccupation_flag() {
	return occupation_flag;
}
public void setOccupation_flag(String occupationFlag) {
	occupation_flag = occupationFlag;
}
public String getIndustrykey_flag() {
	return industrykey_flag;
}
public void setIndustrykey_flag(String industrykeyFlag) {
	industrykey_flag = industrykeyFlag;
}
public String getEnrol_fund_amt_flag() {
	return enrol_fund_amt_flag;
}
public void setEnrol_fund_amt_flag(String enrolFundAmtFlag) {
	enrol_fund_amt_flag = enrolFundAmtFlag;
}
public String getLegal_obj_flag() {
	return legal_obj_flag;
}
public void setLegal_obj_flag(String legalObjFlag) {
	legal_obj_flag = legalObjFlag;
}
public String getLegal_card_type_flag() {
	return legal_card_type_flag;
}
public void setLegal_card_type_flag(String legalCardTypeFlag) {
	legal_card_type_flag = legalCardTypeFlag;
}
public String getLegal_card_no_flag() {
	return legal_card_no_flag;
}
public void setLegal_card_no_flag(String legalCardNoFlag) {
	legal_card_no_flag = legalCardNoFlag;
}
public String getApplication_pary_type() {
	return application_pary_type;
}
public void setApplication_pary_type(String applicationParyType) {
	application_pary_type = applicationParyType;
}
public String getCard_type_inf() {
	return card_type_inf;
}
public void setCard_type_inf(String cardTypeInf) {
	card_type_inf = cardTypeInf;
}
public String getLegal_card_type_inf() {
	return legal_card_type_inf;
}
public void setLegal_card_type_inf(String legalCardTypeInf) {
	legal_card_type_inf = legalCardTypeInf;
}











private String organname="";
public String getOrganname() {
	return organname;
}
public void setOrganname(String organname) {
	this.organname = organname;
}
public String getPostalcode() {
	return postalcode;
}
public void setPostalcode(String postalcode) {
	this.postalcode = postalcode;
}
public String getParty_id_s() {
	return party_id_s;
}
public void setParty_id_s(String partyIdS) {
	party_id_s = partyIdS;
}
public String getCard_type_s() {
	return card_type_s;
}
public void setCard_type_s(String cardTypeS) {
	card_type_s = cardTypeS;
}
public String getParty_class_cd_s() {
	return party_class_cd_s;
}
public void setParty_class_cd_s(String partyClassCdS) {
	party_class_cd_s = partyClassCdS;
}
public String getEnrol_fund_currency_cd() {
	return enrol_fund_currency_cd;
}
public void setEnrol_fund_currency_cd(String enrolFundCurrencyCd) {
	enrol_fund_currency_cd = enrolFundCurrencyCd;
}
public String getCard_no_s() {
	return card_no_s;
}
public void setCard_no_s(String cardNoS) {
	card_no_s = cardNoS;
}
public String getOrgankeys() {
	return organkeys;
}
public void setOrgankeys(String organkeys) {
	this.organkeys = organkeys;
}
public String getIntPage() {
	return intPage;
}
public void setIntPage(String intPage) {
	this.intPage = intPage;
}
public String getValidate_ind2() {
	return validate_ind2;
}
public void setValidate_ind2(String validateInd2) {
	validate_ind2 = validateInd2;
}
public String getValidate() {
	return validate;
}
public void setValidate(String validate) {
	this.validate = validate;
}
/** 邮编 */
private String postalcode = "";

private String party_id_s = "";

private String card_type_s = "";

private String party_class_cd_s = "";

/** 注册资本币别代码 */
private String enrol_fund_currency_cd = "";

private String card_no_s = "";


/** 下属机构*/
private String organkeys = "";
/** 翻页信息 */
private String intPage = "0"; 

/** 可疑验证标志位	0未通过，1通过*/
private String validate_ind2 = "";

/** 验证状态 0否 1是*/
private String validate = "";




    public String getLegal_card_type() {
	return legal_card_type;
}
public void setLegal_card_type(String legalCardType) {
	legal_card_type = legalCardType;
}
	public String getParty_chn_name_s() {
	return party_chn_name_s;
}
public void setParty_chn_name_s(String partyChnNameS) {
	party_chn_name_s = partyChnNameS;
}
	/**
 * @return orderby
 */
public String getOrderby() {
	return orderby;
}
/**
 * @param orderby 要设置的 orderby
 */
public void setOrderby(String orderby) {
	this.orderby = orderby;
}
	public String getCustomerorder() {
	return customerorder;
}
public void setCustomerorder(String customerorder) {
	this.customerorder = customerorder;
}
public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}
	public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}
public String getParty_status_cd() {
	return party_status_cd;
}
public void setParty_status_cd(String party_status_cd) {
	this.party_status_cd = party_status_cd;
}
	/**                   
     * 构造函数           
     */                   
    public T47_partyActionForm() {    
    }                     
public void setNet_address(String net_addressStr){
this.net_address = net_addressStr;
}
public String getNet_address(){
return this.net_address;
}

public void setAml2_type_cd(String aml2_type_cdStr){
this.aml2_type_cd = aml2_type_cdStr;
}
public String getAml2_type_cd(){
return this.aml2_type_cd;
}

public void setCell_no(String cell_noStr){
this.cell_no = cell_noStr;
}
public String getCell_no(){
return this.cell_no;
}

public void setAml1_type_cd(String aml1_type_cdStr){
this.aml1_type_cd = aml1_type_cdStr;
}
public String getAml1_type_cd(){
return this.aml1_type_cd;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setAddr1(String addr1Str){
this.addr1 = addr1Str;
}
public String getAddr1(){
return this.addr1;
}

public void setEmail_addr(String email_addrStr){
this.email_addr = email_addrStr;
}
public String getEmail_addr(){
return this.email_addr;
}

public void setParty_eng_name(String party_eng_nameStr){
this.party_eng_name = party_eng_nameStr;
}
public String getParty_eng_name(){
return this.party_eng_name;
}

public void setAddr2(String addr2Str){
this.addr2 = addr2Str;
}
public String getAddr2(){
return this.addr2;
}

public void setTel_no(String tel_noStr){
this.tel_no = tel_noStr;
}
public String getTel_no(){
return this.tel_no;
}

public void setHost_cust_id(String host_cust_idStr){
this.host_cust_id = host_cust_idStr;
}
public String getHost_cust_id(){
return this.host_cust_id;
}

public void setCard_type(String card_typeStr){
this.card_type = card_typeStr;
}
public String getCard_type(){
return this.card_type;
}

public void setParty_class_cd(String party_class_cdStr){
this.party_class_cd = party_class_cdStr;
}
public String getParty_class_cd(){
return this.party_class_cd;
}

public void setCard_no(String card_noStr){
this.card_no = card_noStr;
}
public String getCard_no(){
return this.card_no;
}

public void setParty_chn_name(String party_chn_nameStr){
this.party_chn_name = party_chn_nameStr;
}
public String getParty_chn_name(){
return this.party_chn_name;
}

public void setCountry_cd(String country_cdStr){
this.country_cd = country_cdStr;
}
public String getCountry_cd(){
return this.country_cd;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setBirth_dt(Date birth_dtStr){
this.birth_dt = birth_dtStr;
}
public Date getBirth_dt(){
return this.birth_dt;
}

public void setCountry_residence(String country_residenceStr){
this.country_residence = country_residenceStr;
}
public String getCountry_residence(){
return this.country_residence;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}

public void setBirth_dt_disp(String birth_dt_dispStr){
this.birth_dt_disp = birth_dt_dispStr;
}
public String getBirth_dt_disp(){
return this.birth_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public String getCard_type_disp() {
		return card_type_disp;
	}
	public void setCard_type_disp(String card_type_disp) {
		this.card_type_disp = card_type_disp;
	}
	public String getCountry_disp() {
		return country_disp;
	}
	public void setCountry_disp(String country_disp) {
		this.country_disp = country_disp;
	}
	public String getParty_class_disp() {
		return party_class_disp;
	}
	public void setParty_class_disp(String party_class_disp) {
		this.party_class_disp = party_class_disp;
	}
	public String getParty_status_disp() {
		return party_status_disp;
	}
	public void setParty_status_disp(String party_status_disp) {
		this.party_status_disp = party_status_disp;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getSearchorgankey() {
		return searchorgankey;
	}
	public void setSearchorgankey(String searchorgankey) {
		this.searchorgankey = searchorgankey;
	}
	public String getParty_id_disp() {
		return party_id_disp;
	}
	public void setParty_id_disp(String party_id_disp) {
		this.party_id_disp = party_id_disp;
	}
	public String[] getPartyCheckBox() {
		return partyCheckBox;
	}
	public void setPartyCheckBox(String[] partyCheckBox) {
		this.partyCheckBox = partyCheckBox;
	}
	public String getIs_party() {
		return is_party;
	}
	public void setIs_party(String isParty) {
		is_party = isParty;
	}
	
}

