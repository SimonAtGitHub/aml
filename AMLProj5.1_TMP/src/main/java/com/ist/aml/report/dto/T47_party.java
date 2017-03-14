/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-28   青蛙		创建        
 */                                             
                                                  
package com.ist.aml.report.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: 北京银丰新融科技开发有限公司</p>      
 * @author 研发组                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 

import java.util.ArrayList;  
import java.util.Date;       
       
                                              
public class T47_party implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2648619132118943024L;
	/** 指标KEY */
	
	private String stat_indickey = "";
	private String organkey_flag = "";
	public String getOrgankey_flag() {
		return organkey_flag;
	}
	public void setOrgankey_flag(String organkeyFlag) {
		organkey_flag = organkeyFlag;
	}
	private String partystr="";
	private String application_num="";
	private String  alert_type_cd="";
	private String fieldname="";
	private String tablename="";
	private Date dt_start=null;
	private Date dt_end=null;
	private Long total_num = null; 
	/** 交易时间*/
	private Date tx_dt = null;                        
	/** 指标VALUE*/
	private String stat_val = "";
	private String stat_val5 = "";
	private String stat_val10 = "";
	private String stat_val30 = "";
	private String stat_val_month1 = "";
	
	ArrayList selectList = new ArrayList();
	
	/** 指标时间*/
	private Date statistic_dt = null;
	/** 指标时间*/
	private Date statistic_dt_end = null;
	/** 指标VALUE*/
	private String statistic_daynum = "";                                                
/** 网址 */
private String net_address = "";
/** AML类型2 保留 */
private String aml2_type_cd = "";
private String aml2_type_disp = "";
public String getAml2_type_disp() {
	return aml2_type_disp;
}
public void setAml2_type_disp(String aml2TypeDisp) {
	aml2_type_disp = aml2TypeDisp;
}
/** 移动电话 */
private String cell_no = "";
/** AML类型1 */
private String aml1_type_cd = "";
private String aml1_type_disp = "";
/** 当事人编号 */
private String party_id = "";
private String party_id_disp = "";
public String getParty_id_disp() {
	return party_id_disp;
}
public void setParty_id_disp(String partyIdDisp) {
	party_id_disp = partyIdDisp;
}
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
private String card_type_disp = "";
/** 当事人类型 C:对公当事人 I:个人当事人
 */
private String party_class_cd = "";
private String party_class_cd_disp = "";
/** 客户状态 */
private String party_status_cd = "";
private String party_status_cd_disp = "";
/** 组织机构*/
private String organ_id="";
public String getOrgan_id() {
	return organ_id;
}
public void setOrgan_id(String organId) {
	organ_id = organId;
}
/** 证件号码 */
private String card_no = "";
/** 当事人中文名称 */
private String party_chn_name = "";
/** 所属国家 */
private String country_cd = "";
private String country_cd_disp = "";
public String getOpp_name() {
	return opp_name;
}
public void setOpp_name(String oppName) {
	opp_name = oppName;
}
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

private String organname="";
/** 是否行内用户*/
private String is_party="";

public String getAml1_type_disp() {
	return aml1_type_disp;
}
public void setAml1_type_disp(String aml1TypeDisp) {
	aml1_type_disp = aml1TypeDisp;
}
public String getEnrol_fund_currency_disp() {
	return enrol_fund_currency_disp;
}
public void setEnrol_fund_currency_disp(String enrolFundCurrencyDisp) {
	enrol_fund_currency_disp = enrolFundCurrencyDisp;
}
/** 邮编 */
private String postalcode = "";

private String party_id_s = "";

private String card_type_s = "";

private String party_class_cd_s = "";

/** 注册资本币别代码 */
private String enrol_fund_currency_cd = "";
private String enrol_fund_currency_disp = "";

private String card_no_s = "";

private String party_chn_name_s = "";
/** 归属机构*/
private String organkey="";
private String organ_name="";
/** 客户归属机构*/
private String objorgankey="";
/** 归属机构码*/
private String searchorgankey="";
public String getSearchorgankey() {
	return searchorgankey;
}
public void setSearchorgankey(String searchorgankey) {
	this.searchorgankey = searchorgankey;
}
/** 下属机构*/
private String organkeys = "";
/** 翻页信息 */
private String intPage = ""; 

/** 可疑验证标志位	0未通过，1通过*/
private String validate_ind2 = "";

/** 验证状态 0否 1是*/
private String validate = "";

private String application_pary_type="";

/** 按哪个字段排序*/
private String customerorder=""; 


private String otherContact = "";
/** 注册资本 */
private String enrol_fund_amt = "";
/** 行业 */
private String industrykey = "";
private String occupation = "";
private String occupation_disp = "";
public String getOccupation_disp() {
	return occupation_disp;
}
public void setOccupation_disp(String occupationDisp) {
	occupation_disp = occupationDisp;
}
private String industrykeymap = "";
private String industrykey_disp = "";
private String legal_country_cd = ""; //	法定代表人国籍
private String legal_obj = ""; //	法定代表人


private String alertkey = ""; // 预警
private String alert_type = ""; // 预警类型
//	 验证状态
private String validate_ind = "1";
private String validate_ind_disp = "";

private String card_type_inf="";
private String legal_card_type_inf="";



/** 法定代表人身份证件号码 */
private String legal_card_no = "";
private String party_cd= "";
private String table_id = "";
private String field_id = "";
private String modify_ind = "";
private String default_val = "";
private String flag = "";
private String party_chn_name_flag = "";
private String legal_card_type = ""; //	法定代表人证件类型
private String legal_card_type_disp = ""; //	法定代表人证件类型
private String card_type_flag = "";
private String host_cust_id_flag = "";
private String card_no_flag = "";
private String country_cd_flag = "";
/** 机构信用代码*/
private String org_credit_no="";
/** 机构信用代码有效期*/
private Date org_credit_vt;
private String org_credit_vt_disp="";

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
private String aml2_type_cd_flag = "";

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

/** 客户处理状态代码 */
private String party_status = "";
public String getParty_status() {
	return party_status;
}
public void setParty_status(String partyStatus) {
	party_status = partyStatus;
}
public String getParty_status_disp() {
	return party_status_disp;
}
public void setParty_status_disp(String partyStatusDisp) {
	party_status_disp = partyStatusDisp;
}
/** 客户处理状态代码 */
private String party_status_disp = "";


public String getOrgankey_s() {
	return organkey_s;
}
public String getCreate_user() {
	return create_user;
}
public void setCreate_user(String createUser) {
	create_user = createUser;
}
public void setOrgankey_s(String organkeyS) {
	organkey_s = organkeyS;
}
public String getOpp_organname() {
	return opp_organname;
}
public void setOpp_organname(String oppOrganname) {
	opp_organname = oppOrganname;
}
public String getOpp_organkey() {
	return opp_organkey;
}
public void setOpp_organkey(String oppOrgankey) {
	opp_organkey = oppOrgankey;
}
public String getOpp_party_class_cd() {
	return opp_party_class_cd;
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
/** 排序方向*/
private String order=""; 
//============================================================
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
public String getApplication_pary_type() {
	return application_pary_type;
}
public void setApplication_pary_type(String applicationParyType) {
	application_pary_type = applicationParyType;
}
public String getValidate() {
	return validate;
}
public void setValidate(String validate) {
	this.validate = validate;
}
public String getValidate_ind2() {
	return validate_ind2;
}
public void setValidate_ind2(String validateInd2) {
	validate_ind2 = validateInd2;
}


	
	
	public String getIntPage() {
	return intPage;
}
public void setIntPage(String intPage) {
	this.intPage = intPage;
}
	public String getParty_chn_name_s() {
	return party_chn_name_s;
}
public void setParty_chn_name_s(String partyChnNameS) {
	party_chn_name_s = partyChnNameS;
}
	public String getOrgankeys() {
	return organkeys;
}
public void setOrgankeys(String organkeys) {
	this.organkeys = organkeys;
}
	
	
    public String getLegal_card_type_inf() {
		return legal_card_type_inf;
	}
	public void setLegal_card_type_inf(String legal_card_type_inf) {
		this.legal_card_type_inf = legal_card_type_inf;
	}
	public String getAlert_type() {
		return alert_type;
	}
	public void setAlert_type(String alert_type) {
		this.alert_type = alert_type;
	}
	public String getPostalcode() {
	return postalcode;
}
public void setPostalcode(String postalcode) {
	this.postalcode = postalcode;
}
	/**                   
     * 构造函数           
     */                   
    public T47_party() {    
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
public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}
public String getObjorgankey() {
	return objorgankey;
}
public void setObjorgankey(String objorgankey) {
	this.objorgankey = objorgankey;
}
public String getParty_status_cd() {
	return party_status_cd;
}
public void setParty_status_cd(String party_status_cd) {
	this.party_status_cd = party_status_cd;
}
public String getStat_indickey() {
	return stat_indickey;
}
public void setStat_indickey(String stat_indickey) {
	this.stat_indickey = stat_indickey;
}
public String getStat_val() {
	return stat_val;
}
public void setStat_val(String stat_val) {
	this.stat_val = stat_val;
}
public String getStat_val_month1() {
	return stat_val_month1;
}
public void setStat_val_month1(String stat_val_month1) {
	this.stat_val_month1 = stat_val_month1;
}
public String getStat_val10() {
	return stat_val10;
}
public void setStat_val10(String stat_val10) {
	this.stat_val10 = stat_val10;
}
public String getStat_val30() {
	return stat_val30;
}
public void setStat_val30(String stat_val30) {
	this.stat_val30 = stat_val30;
}
public String getStat_val5() {
	return stat_val5;
}
public void setStat_val5(String stat_val5) {
	this.stat_val5 = stat_val5;
}
public String getStatistic_daynum() {
	return statistic_daynum;
}
public void setStatistic_daynum(String statistic_daynum) {
	this.statistic_daynum = statistic_daynum;
}
public Date getStatistic_dt() {
	return statistic_dt;
}
public void setStatistic_dt(Date statistic_dt) {
	this.statistic_dt = statistic_dt;
}
public Date getStatistic_dt_end() {
	return statistic_dt_end;
}
public void setStatistic_dt_end(Date statistic_dt_end) {
	this.statistic_dt_end = statistic_dt_end;
}
public String getParty_class_cd_disp() {
	return party_class_cd_disp;
}
public void setParty_class_cd_disp(String party_class_cd_disp) {
	this.party_class_cd_disp = party_class_cd_disp;
}
public Date getTx_dt() {
	return tx_dt;
}
public void setTx_dt(Date tx_dt) {
	this.tx_dt = tx_dt;
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
public String getOtherContact() {
	return otherContact;
}
public void setOtherContact(String otherContract) {
	this.otherContact = otherContract;
}
public String getValidate_ind() {
	return validate_ind;
}
public void setValidate_ind(String validate_ind) {
	this.validate_ind = validate_ind;
}
public String getValidate_ind_disp() {
	return validate_ind_disp;
}
public void setValidate_ind_disp(String validate_ind_disp) {
	this.validate_ind_disp = validate_ind_disp;
}
public String getOrganname() {
	return organname;
}
public void setOrganname(String organname) {
	this.organname = organname;
}
public String getCard_type_disp() {
	return card_type_disp;
}
public void setCard_type_disp(String card_type_disp) {
	this.card_type_disp = card_type_disp;
}
public String getCountry_cd_disp() {
	return country_cd_disp;
}
public void setCountry_cd_disp(String country_cd_disp) {
	this.country_cd_disp = country_cd_disp;
}
public String getParty_status_cd_disp() {
	return party_status_cd_disp;
}
public void setParty_status_cd_disp(String party_status_cd_disp) {
	this.party_status_cd_disp = party_status_cd_disp;
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
public String getAlertkey() {
	return alertkey;
}
public void setAlertkey(String alertkey) {
	this.alertkey = alertkey;
}
public String getLegal_country_cd() {
	return legal_country_cd;
}
public void setLegal_country_cd(String legal_country_cd) {
	this.legal_country_cd = legal_country_cd;
}
public String getIndustrykeymap() {
	return industrykeymap;
}
public void setIndustrykeymap(String industrykeymap) {
	this.industrykeymap = industrykeymap;
}
public String getOccupation() {
	return occupation;
}
public void setOccupation(String occupation) {
	this.occupation = occupation;
}
public String getPartystr() {
	return partystr;
}
public void setPartystr(String partystr) {
	this.partystr = partystr;
}
public String getApplication_num() {
	return application_num;
}
public void setApplication_num(String application_num) {
	this.application_num = application_num;
}
public String getAlert_type_cd() {
	return alert_type_cd;
}
public void setAlert_type_cd(String alert_type_cd) {
	this.alert_type_cd = alert_type_cd;
}
public Date getDt_end() {
	return dt_end;
}
public void setDt_end(Date dt_end) {
	this.dt_end = dt_end;
}
public Date getDt_start() {
	return dt_start;
}
public void setDt_start(Date dt_start) {
	this.dt_start = dt_start;
}
public String getFieldname() {
	return fieldname;
}
public void setFieldname(String fieldname) {
	this.fieldname = fieldname;
}
public String getTablename() {
	return tablename;
}
public void setTablename(String tablename) {
	this.tablename = tablename;
}
public Long getTotal_num() {
	return total_num;
}
public void setTotal_num(Long total_num) {
	this.total_num = total_num;
}
public ArrayList getSelectList() {
	return selectList;
}
public void setSelectList(ArrayList selectList) {
	this.selectList = selectList;
}
public String getCard_type_inf() {
	return card_type_inf;
}
public void setCard_type_inf(String card_type_inf) {
	this.card_type_inf = card_type_inf;
}
public String getOrgan_name() {
	return organ_name;
}
public void setOrgan_name(String organName) {
	organ_name = organName;
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
public String getIs_party() {
	return is_party;
}
public void setIs_party(String isParty) {
	is_party = isParty;
}


}

