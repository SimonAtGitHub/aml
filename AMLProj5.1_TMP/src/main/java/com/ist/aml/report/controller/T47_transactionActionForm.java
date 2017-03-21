/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-29   青蛙		创建        
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
                                                  
import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T47_transactionActionForm extends ActionForm {
private String 	tx_dt_start_disp = "";
private String 	tx_dt_end_disp = "";
private String tx_today_disp="";
private String cash_ind="";
private  String[] selectedTransactionkey=null;
private String alert_type_cd="";

private String  start_time="";
public String[] getSelectedTransactionkey() {
	return selectedTransactionkey;
}
public void setSelectedTransactionkey(String[] selectedTransactionkey) {
	this.selectedTransactionkey = selectedTransactionkey;
}
private String  start_time2="";
private String  teller_disp="";
private String  party_name="";
private String  organ_name="";
public String getNet_id() {
	return net_id;
}
public void setNet_id(String netId) {
	net_id = netId;
}
private String  net_id="";
private String opp_off_shore_ind="";
private Date tx_today=null;
/** 交易金额 */
private Double amt_start =null;
private Double amt_end =null;
/** 排序字段名称 */
private String 	order_name = "tx_dt";
/** 排序类型 */
private String 	order_type = "1";                                              
/** 用途 */
private String use_des = "";
/** 对方账户类型 */
private String opp_acct_type_cd = "";
/** 交易类型 */
private String tx_type_cd = "";

/** 是否跨境交易 */
private String overarea_ind = "";
/** 流水号 */
private String tx_no = "";
/** 业务类型 */
private String bus_type_cd = "";
/** 现/转标志 */
private String cash_trans_flag = "";
/** 对方所在地区 */
private String opp_area = "";
private String opp_area_disp = "";

private String opp_pbc_party_class_cd="";

/** 传票号 */
private String voucher_no="";

/** 对方所在国家 */
private String opp_coutry = "";
private String opp_country="";
private String opp_area1="";
private String opp_area2="";
private String opp_area2Name="";
private String opp_areaName="";
private String trans_key="";

private String cal_ind = "1";
private String cal_ind_disp = "";

private String tsctkey="";  //涉外收支交易代码 
private String tsctkey_flag="";  //涉外收支交易代码
private String tsctkey1="";
private String tsctkey2="";
private String tsctkey3="";
private String tx_go="";//交易去向
private String tx_go_disp="";//交易去向
private String tx_go_country="";//交易去向国别
private String tx_go_area=""; //交易去向行政区
private String tx_go_area1="";
private String tx_go_area2="";
private String tx_occur="";	//交易发生地
private String tx_occur_disp="";	//交易发生地
private String tx_occur_country="";	//交易发生地国别
private String tx_occur_area="";	//交易发生地行政区
private String tx_occur_area1="";
private String tx_occur_area2="";
private String agent_name="";	//代办人姓名
private String agent_card_type="";	//代办人身份证件/证明文件类型
private String agent_card_no="" ; //代办人身份证件/证明文件号码
private String agent_country="";	//代办人国籍
private String  org_trans_rela=""; 	//金融机构和交易关系
private String  org_trans_rela_flag=""; 	//金融机构和交易关系
private String trans_ip="";

/** 结算方式 */
private String settle_type_cd = "";
private String settle_type_cd1 = "";//本币现金结算方式
private String settle_type_cd2 = "";//外币现金结算方式
private String settle_type_cd3 = "";//本币非现金结算方式
private String settle_type_cd4 = "";//外币非现金结算方式
private String settle_type_cd_flag = "";
/** Aml交易代码 */
private String tx_cd = "";
/** 交易时间 */
private Date dt_time = null;
/** 核心主键 */
private String cb_pk = "";
/** 原币交易金额 */
private Double amt = null;
private String amt_disp="";
/** 科目号 */
private String subjectno = "";
/** 对方行号 */
private String opp_organkey = "";

private String organname = "";
private String organ_area = "";
private String organ_area_disp = "";
private String organ_area_cd = "";
private String organ_area_cd_disp = "";
private String organ_code = "";
private String organ_code_type_disp = "";
private String organ_code_type = "";

/** 币种 */
private String currency_cd = "";
private String curr_cd="";
private String curr_cd_search="";
private String party_class_cd_search="";
/** 交易日期 */
private Date tx_dt = null;
/** 是否需补录 0:否1:是 */
private String re_ind = "";
/** 对方证件类型 */
private String opp_card_type = "";
/** 对方行号类型 */
private String opp_organ_type = "";
/** 当事人中文名称 */
private String party_chn_name = "";
private String party_chn_name_disp = "";
/** 折人民币 */
private Double cny_amt = null;
private String cny_amt_string = "";
/** 对方证件号码 */
private String opp_card_no = "";
/** 对方客户号 */
private String opp_party_id = "";
/** 对方交易日期 */
private Date opp_tx_dt = null;
/** 对方名称 */
private String opp_name = "";
/** 我行账户 */
private String acct_num = "";
/** 对方账号 */
private String opp_acct_num = "";
/** 折美元 */
private Double usd_amt = null;
/** 我行客户号 */
private String party_id = "";
private String party_id1 = "";
/** 处理状态0:未预警1:预警2:处理中3:已上报4:已排除 */
private String handle_status_cd = "";
/** 对方系统Id */
private String opp_sys_id = "";
/** 收付标志 */
private String receive_pay_cd = "";
private String receive_pay_cd_flag = "";
/** 柜员 */
private String teller = "";
/** 批量标志 0:否1:是 */
private String batch_ind = "";
/** 机构代码 */
private String organkey = "";
/**针对新增交易时，客户定位回填会冲掉原来的机构定位key*/
private String organkey_new = "";
/** 借贷标志 */
private String debit_credit = "";
/** 原交易代码 */
private String cb_tx_cd = "";
/** 客户类型 */
private String party_class_cd = "";

/** 对方客户类型 */
private String opp_party_class_cd = "";
/** 业务标识 */
private String transactionkey = "";
private String transactionkey_flag = "";
/** 汇款标志 */
private String remit_type_cd = "";
/** 摘要 */
private String des = "";
/** 是否已补录 */
private String addtional="";
/** 补录时间 */
private Date re_dt=null;
private String re_dt_disp="";

/** 交易方向 */
private String tx_direct = "";
/** 对方银行名称 */
private String opp_organname = "";
/** 凭证代码*/
private String token_no="";

private String host_cust_id="";
/** 交易类型 */
private String tx_type_cd_disp = "";
/** 币种 */
private String currency_cd_disp = "";
//=======================================================
/** 交易时间 */
private String dt_time_disp = "";
/** 交易日期 */
private String tx_dt_disp = "";
/** 对方交易日期 */
private String opp_tx_dt_disp = "";

/** 交易日期结束时间 */
private Date tx_dtEnd = null;
/** 交易日期结束时间 */
private String tx_dtEndDisp = "";

/** 折人民币开始查询金额 */
private String cny_amtDisp = "";
/** 折人民币结束查询金额 */
private Double cny_amtEnd = null;
/** 折人民币结束查询金额 */
private String cny_amtEndDisp = "";

/** 交易列表排序 */
private String trasactionOrder = "";
/** 交易列表排序方式 */

private String trasactionKind = "desc";
/** 预警编号 */
private String alertkey="";
/** 交易结束日期 */
private String tx_enddt_disp = "";
/** 交易结束日期 */
private Date tx_enddt =  null;
/** 原币交易金额 */
private Double amt_max_value =null;
//现转
private String cash_trans_flag_disp = "";
/** 特征代码 */
private String stcr = "";
/** 案例编号 */
private String application_num = "";
//机构名称
private String organName = "";
private String debit_credit_disp="";
//排序
private String orderby ="";
private String order ="";
private String searchtype="";
//预警-交易表单复选框
private String transactionkeyCheckBox[]= null;
/** 交易结束日期 */
private String tx_enddt_search_disp = "";
/** 交易结束日期 */
private String tx_dt_search_disp = "";
/** 交易金额 */
private String amt_start_search = "";
private String amt_end_search = "";
/** 预警编号 */
private String alertkey_search="";
//现转
private String cash_trans_flag_search_disp = "";
/** 是否已补录 */
private String addtional_search="";
//借贷标志
private String debit_credit_search_disp="";
/** 我行账户 */
private String acct_num_search = "";
/** 机构代码 */
private String organkey_search = "";
/** 我行客户号 */
private String party_id_search = "";
private String status="";  //是否保存对手信息
private String re_ind_search = "";

private String checkedt47 = "";

String isInnerOrganCode = "";
String opp_isInnerOrganCode = "";

/** 账户类型 */
String acct_type = "";
String acct_type_string = "";

private String alert_type = "";
//特征编号
private String stcrkey = "";
// 开户时间
private Date open_dt = null;
public String getStcrkey() {
	return stcrkey;
}
public void setStcrkey(String stcrkey) {
	this.stcrkey = stcrkey;
}
private String open_dt_disp = "";
private Date close_dt = null;
private String close_dt_disp = "";

private String appid = "";
// 验证状态
private String validate_ind ="";
private String validate_ind2 ="";
private String validateflag ="";
private String validate_ind_disp = "";
//交易渠道
private String channel="";

//证件类型明细

private String card_inf="";
private String opp_card_inf="";

// 交易当前/历史
private String trans_table ="";

private String is_party ="1";

    public String getOpp_card_inf() {
	return opp_card_inf;
}
public void setOpp_card_inf(String opp_card_inf) {
	this.opp_card_inf = opp_card_inf;
}
	/**
 * @return re_ind_search
 */
public String getRe_ind_search() {
	return re_ind_search;
}
/**
 * @param re_ind_search 要设置的 re_ind_search
 */
public void setRe_ind_search(String re_ind_search) {
	this.re_ind_search = re_ind_search;
}
	/**
 * @return searchtype
 */
public String getSearchtype() {
	return searchtype;
}
/**
 * @param searchtype 要设置的 searchtype
 */
public void setSearchtype(String searchtype) {
	this.searchtype = searchtype;
}
	/**
 * @return debit_credit_disp
 */
public String getDebit_credit_disp() {
	return debit_credit_disp;
}
/**
 * @param debit_credit_disp 要设置的 debit_credit_disp
 */
public void setDebit_credit_disp(String debit_credit_disp) {
	this.debit_credit_disp = debit_credit_disp;
}
	/**                   
     * 构造函数           
     */                   
    public T47_transactionActionForm() {    
    }                     
public void setUse_des(String use_desStr){
this.use_des = use_desStr;
}
public String getUse_des(){
return this.use_des;
}

public void setOpp_acct_type_cd(String opp_acct_type_cdStr){
this.opp_acct_type_cd = opp_acct_type_cdStr;
}
public String getOpp_acct_type_cd(){
return this.opp_acct_type_cd;
}

public void setTx_type_cd(String tx_type_cdStr){
this.tx_type_cd = tx_type_cdStr;
}
public String getTx_type_cd(){
return this.tx_type_cd;
}

public void setOverarea_ind(String overarea_indStr){
this.overarea_ind = overarea_indStr;
}
public String getOverarea_ind(){
return this.overarea_ind;
}

public void setTx_no(String tx_noStr){
this.tx_no = tx_noStr;
}
public String getTx_no(){
return this.tx_no;
}

public void setBus_type_cd(String bus_type_cdStr){
this.bus_type_cd = bus_type_cdStr;
}
public String getBus_type_cd(){
return this.bus_type_cd;
}

public void setCash_trans_flag(String cash_trans_flagStr){
this.cash_trans_flag = cash_trans_flagStr;
}
public String getCash_trans_flag(){
return this.cash_trans_flag;
}

public void setOpp_area(String opp_areaStr){
this.opp_area = opp_areaStr;
}
public String getOpp_area(){
return this.opp_area;
}

public void setSettle_type_cd(String settle_type_cdStr){
this.settle_type_cd = settle_type_cdStr;
}
public String getSettle_type_cd(){
return this.settle_type_cd;
}

public void setTx_cd(String tx_cdStr){
this.tx_cd = tx_cdStr;
}
public String getTx_cd(){
return this.tx_cd;
}

public void setDt_time(Date dt_timeStr){
this.dt_time = dt_timeStr;
}
public Date getDt_time(){
return this.dt_time;
}

public void setCb_pk(String cb_pkStr){
this.cb_pk = cb_pkStr;
}
public String getCb_pk(){
return this.cb_pk;
}

public void setSubjectno(String subjectnoStr){
this.subjectno = subjectnoStr;
}
public String getSubjectno(){
return this.subjectno;
}

public void setOpp_organkey(String opp_organkeyStr){
this.opp_organkey = opp_organkeyStr;
}
public String getOpp_organkey(){
return this.opp_organkey;
}

public void setCurrency_cd(String currency_cdStr){
this.currency_cd = currency_cdStr;
}
public String getCurrency_cd(){
return this.currency_cd;
}

public void setTx_dt(Date tx_dtStr){
this.tx_dt = tx_dtStr;
}
public Date getTx_dt(){
return this.tx_dt;
}

public void setRe_ind(String re_indStr){
this.re_ind = re_indStr;
}
public String getRe_ind(){
return this.re_ind;
}

public void setOpp_card_type(String opp_card_typeStr){
this.opp_card_type = opp_card_typeStr;
}
public String getOpp_card_type(){
return this.opp_card_type;
}

public void setOpp_organ_type(String opp_organ_typeStr){
this.opp_organ_type = opp_organ_typeStr;
}
public String getOpp_organ_type(){
return this.opp_organ_type;
}

public void setParty_chn_name(String party_chn_nameStr){
this.party_chn_name = party_chn_nameStr;
}
public String getParty_chn_name(){
return this.party_chn_name;
}

public void setOpp_card_no(String opp_card_noStr){
this.opp_card_no = opp_card_noStr;
}
public String getOpp_card_no(){
return this.opp_card_no;
}

public void setOpp_party_id(String opp_party_idStr){
this.opp_party_id = opp_party_idStr;
}
public String getOpp_party_id(){
return this.opp_party_id;
}

public void setOpp_tx_dt(Date opp_tx_dtStr){
this.opp_tx_dt = opp_tx_dtStr;
}
public Date getOpp_tx_dt(){
return this.opp_tx_dt;
}

public void setOpp_name(String opp_nameStr){
this.opp_name = opp_nameStr;
}
public String getOpp_name(){
return this.opp_name;
}

public void setAcct_num(String acct_numStr){
this.acct_num = acct_numStr;
}
public String getAcct_num(){
return this.acct_num;
}

public void setOpp_acct_num(String opp_acct_numStr){
this.opp_acct_num = opp_acct_numStr;
}
public String getOpp_acct_num(){
return this.opp_acct_num;
}

/**
 * @return the amt
 */
public Double getAmt() {
	return amt;
}
/**
 * @param amt the amt to set
 */
public void setAmt(Double amt) {
	this.amt = amt;
}
/**
 * @return the cny_amt
 */
public Double getCny_amt() {
	return cny_amt;
}
/**
 * @param cny_amt the cny_amt to set
 */
public void setCny_amt(Double cny_amt) {
	this.cny_amt = cny_amt;
}

/**
 * @return the cny_amtDisp
 */
public String getCny_amtDisp() {
	return cny_amtDisp;
}
/**
 * @param cny_amtDisp the cny_amtDisp to set
 */
public void setCny_amtDisp(String cny_amtDisp) {
	this.cny_amtDisp = cny_amtDisp;
}

/**
 * @return the cny_amtEnd
 */
public Double getCny_amtEnd() {
	return cny_amtEnd;
}
/**
 * @param cny_amtEnd the cny_amtEnd to set
 */
public void setCny_amtEnd(Double cny_amtEnd) {
	this.cny_amtEnd = cny_amtEnd;
}

/**
 * @return the cny_amtEndDisp
 */
public String getCny_amtEndDisp() {
	return cny_amtEndDisp;
}
/**
 * @param cny_amtEndDisp the cny_amtEndDisp to set
 */
public void setCny_amtEndDisp(String cny_amtEndDisp) {
	this.cny_amtEndDisp = cny_amtEndDisp;
}
/**
 * @return the usd_amt
 */
public Double getUsd_amt() {
	return usd_amt;
}
/**
 * @param usd_amt the usd_amt to set
 */
public void setUsd_amt(Double usd_amt) {
	this.usd_amt = usd_amt;
}
public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setHandle_status_cd(String handle_status_cdStr){
this.handle_status_cd = handle_status_cdStr;
}
public String getHandle_status_cd(){
return this.handle_status_cd;
}

public void setOpp_sys_id(String opp_sys_idStr){
this.opp_sys_id = opp_sys_idStr;
}
public String getOpp_sys_id(){
return this.opp_sys_id;
}

public void setReceive_pay_cd(String receive_pay_cdStr){
this.receive_pay_cd = receive_pay_cdStr;
}
public String getReceive_pay_cd(){
return this.receive_pay_cd;
}

public void setTeller(String tellerStr){
this.teller = tellerStr;
}
public String getTeller(){
return this.teller;
}

public void setBatch_ind(String batch_indStr){
this.batch_ind = batch_indStr;
}
public String getBatch_ind(){
return this.batch_ind;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setDebit_credit(String debit_creditStr){
this.debit_credit = debit_creditStr;
}
public String getDebit_credit(){
return this.debit_credit;
}

public void setCb_tx_cd(String cb_tx_cdStr){
this.cb_tx_cd = cb_tx_cdStr;
}
public String getCb_tx_cd(){
return this.cb_tx_cd;
}

public void setParty_class_cd(String party_class_cdStr){
this.party_class_cd = party_class_cdStr;
}
public String getParty_class_cd(){
return this.party_class_cd;
}

public void setOpp_party_class_cd(String opp_party_class_cdStr){
this.opp_party_class_cd = opp_party_class_cdStr;
}
public String getOpp_party_class_cd(){
return this.opp_party_class_cd;
}

public void setTransactionkey(String transactionkeyStr){
this.transactionkey = transactionkeyStr;
}
public String getTransactionkey(){
return this.transactionkey;
}

public void setRemit_type_cd(String remit_type_cdStr){
this.remit_type_cd = remit_type_cdStr;
}
public String getRemit_type_cd(){
return this.remit_type_cd;
}

public void setDes(String desStr){
this.des = desStr;
}
public String getDes(){
return this.des;
}

//=======================================================
public void setDt_time_disp(String dt_time_dispStr){
this.dt_time_disp = dt_time_dispStr;
}
public String getDt_time_disp(){
return this.dt_time_disp;
}

public void setTx_dt_disp(String tx_dt_dispStr){
this.tx_dt_disp = tx_dt_dispStr;
}
public String getTx_dt_disp(){
return this.tx_dt_disp;
}

public void setTx_dtEnd(Date tx_dtEnd){
	this.tx_dtEnd = tx_dtEnd;
}
public Date getTx_dtEnd(){
	return this.tx_dtEnd;
}


public void setTx_dtEndDisp(String tx_dtEndDisp){
	this.tx_dtEndDisp = tx_dtEndDisp;
}
public String getTx_dtEndDisp(){
	return this.tx_dtEndDisp;
}


public void setOpp_tx_dt_disp(String opp_tx_dt_dispStr){
this.opp_tx_dt_disp = opp_tx_dt_dispStr;
}
public String getOpp_tx_dt_disp(){
return this.opp_tx_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public String getAddtional() {
		return addtional;
	}
	public void setAddtional(String addtional) {
		this.addtional = addtional;
	}
	public Date getRe_dt() {
		return re_dt;
	}
	public void setRe_dt(Date re_dt) {
		this.re_dt = re_dt;
	}
	public String getRe_dt_disp() {
		return re_dt_disp;
	}
	public void setRe_dt_disp(String re_dt_disp) {
		this.re_dt_disp = re_dt_disp;
	}
	public String getOpp_organname() {
		return opp_organname;
	}
	public void setOpp_organname(String opp_organname) {
		this.opp_organname = opp_organname;
	}
	public String getTx_direct() {
		return tx_direct;
	}
	public void setTx_direct(String tx_direct) {
		this.tx_direct = tx_direct;
	}
	public String getToken_no() {
		return token_no;
	}
	public void setToken_no(String token_no) {
		this.token_no = token_no;
	}
	public String getHost_cust_id() {
		return host_cust_id;
	}
	public void setHost_cust_id(String host_cust_id) {
		this.host_cust_id = host_cust_id;
	}
	public String getTx_type_cd_disp() {
		return tx_type_cd_disp;
	}
	public void setTx_type_cd_disp(String tx_type_cd_disp) {
		this.tx_type_cd_disp = tx_type_cd_disp;
	}
	public String getCurrency_cd_disp() {
		return currency_cd_disp;
	}
	public void setCurrency_cd_disp(String currency_cd_disp) {
		this.currency_cd_disp = currency_cd_disp;
	}
	
	/* add by aixq start*/
	public String getTrasactionOrder() {
		return trasactionOrder;
	}
	public void setTrasactionOrder(String trasactionOrder) {
		this.trasactionOrder = trasactionOrder;
	}

	public String getTrasactionKind() {
		return trasactionKind;
	}
	public void setTrasactionKind(String trasactionKind) {
		this.trasactionKind = trasactionKind;
	}
	/* add by aixq end*/
	/**
	 * @return alertkey
	 */
	public String getAlertkey() {
		return alertkey;
	}
	/**
	 * @param alertkey 要设置的 alertkey
	 */
	public void setAlertkey(String alertkey) {
		this.alertkey = alertkey;
	}
	/**
	 * @return tx_enddt_disp
	 */
	public String getTx_enddt_disp() {
		return tx_enddt_disp;
	}
	/**
	 * @param tx_enddt_disp 要设置的 tx_enddt_disp
	 */
	public void setTx_enddt_disp(String tx_enddt_disp) {
		this.tx_enddt_disp = tx_enddt_disp;
	}
	/**
	 * @return amt_max_value
	 */
	public Double getAmt_max_value() {
		return amt_max_value;
	}
	/**
	 * @param amt_max_value 要设置的 amt_max_value
	 */
	public void setAmt_max_value(Double amt_max_value) {
		this.amt_max_value = amt_max_value;
	}
	/**
	 * @return cash_trans_flag_disp
	 */
	public String getCash_trans_flag_disp() {
		return cash_trans_flag_disp;
	}
	/**
	 * @param cash_trans_flag_disp 要设置的 cash_trans_flag_disp
	 */
	public void setCash_trans_flag_disp(String cash_trans_flag_disp) {
		this.cash_trans_flag_disp = cash_trans_flag_disp;
	}
	
	public String getStcr() {
		return stcr;
	}
	public void setStcr(String stcr) {
		this.stcr = stcr;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String applicationNum) {
		application_num = applicationNum;
	}
	/**
	 * @return order
	 */
	public String getOrder() {
		return order;
	}
	/**
	 * @param order 要设置的 order
	 */
	public void setOrder(String order) {
		this.order = order;
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
	/**
	 * @return organName
	 */
	public String getOrganName() {
		return organName;
	}
	/**
	 * @param setOrganName 要设置的 organName
	 */
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	
	
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getTx_dt_end_disp() {
		return tx_dt_end_disp;
	}
	public void setTx_dt_end_disp(String tx_dt_end_disp) {
		this.tx_dt_end_disp = tx_dt_end_disp;
	}
	public String getTx_dt_start_disp() {
		return tx_dt_start_disp;
	}
	public void setTx_dt_start_disp(String tx_dt_start_disp) {
		this.tx_dt_start_disp = tx_dt_start_disp;
	}
	public String[] getTransactionkeyCheckBox() {
		return transactionkeyCheckBox;
	}
	public void setTransactionkeyCheckBox(String[] transactionkeyCheckBox) {
		this.transactionkeyCheckBox = transactionkeyCheckBox;
	}
	public String getParty_id1() {
		return party_id1;
	}
	public void setParty_id1(String party_id1) {
		this.party_id1 = party_id1;
	}
	public Date getTx_enddt() {
		return tx_enddt;
	}
	public void setTx_enddt(Date tx_enddt) {
		this.tx_enddt = tx_enddt;
	}
	/**
	 * @return acct_num_search
	 */
	public String getAcct_num_search() {
		return acct_num_search;
	}
	/**
	 * @param acct_num_search 要设置的 acct_num_search
	 */
	public void setAcct_num_search(String acct_num_search) {
		this.acct_num_search = acct_num_search;
	}
	/**
	 * @return addtional_search
	 */
	public String getAddtional_search() {
		return addtional_search;
	}
	/**
	 * @param addtional_search 要设置的 addtional_search
	 */
	public void setAddtional_search(String addtional_search) {
		this.addtional_search = addtional_search;
	}
	/**
	 * @return alertkey_search
	 */
	public String getAlertkey_search() {
		return alertkey_search;
	}
	/**
	 * @param alertkey_search 要设置的 alertkey_search
	 */
	public void setAlertkey_search(String alertkey_search) {
		this.alertkey_search = alertkey_search;
	}
	/**
	 * @return amt_end_search
	 */
	public String getAmt_end_search() {
		return amt_end_search;
	}
	/**
	 * @param amt_end_search 要设置的 amt_end_search
	 */
	public void setAmt_end_search(String amt_end_search) {
		this.amt_end_search = amt_end_search;
	}
	/**
	 * @return amt_start_search
	 */
	public String getAmt_start_search() {
		return amt_start_search;
	}
	/**
	 * @param amt_start_search 要设置的 amt_start_search
	 */
	public void setAmt_start_search(String amt_start_search) {
		this.amt_start_search = amt_start_search;
	}
	/**
	 * @return cash_trans_flag_search_disp
	 */
	public String getCash_trans_flag_search_disp() {
		return cash_trans_flag_search_disp;
	}
	/**
	 * @param cash_trans_flag_search_disp 要设置的 cash_trans_flag_search_disp
	 */
	public void setCash_trans_flag_search_disp(String cash_trans_flag_search_disp) {
		this.cash_trans_flag_search_disp = cash_trans_flag_search_disp;
	}
	/**
	 * @return debit_credit_search_disp
	 */
	public String getDebit_credit_search_disp() {
		return debit_credit_search_disp;
	}
	/**
	 * @param debit_credit_search_disp 要设置的 debit_credit_search_disp
	 */
	public void setDebit_credit_search_disp(String debit_credit_search_disp) {
		this.debit_credit_search_disp = debit_credit_search_disp;
	}
	/**
	 * @return organkey_search
	 */
	public String getOrgankey_search() {
		return organkey_search;
	}
	/**
	 * @param organkey_search 要设置的 organkey_search
	 */
	public void setOrgankey_search(String organkey_search) {
		this.organkey_search = organkey_search;
	}
	/**
	 * @return party_id_search
	 */
	public String getParty_id_search() {
		return party_id_search;
	}
	/**
	 * @param party_id_search 要设置的 party_id_search
	 */
	public void setParty_id_search(String party_id_search) {
		this.party_id_search = party_id_search;
	}
	/**
	 * @return tx_dt_search_disp
	 */
	public String getTx_dt_search_disp() {
		return tx_dt_search_disp;
	}
	/**
	 * @param tx_dt_search_disp 要设置的 tx_dt_search_disp
	 */
	public void setTx_dt_search_disp(String tx_dt_search_disp) {
		this.tx_dt_search_disp = tx_dt_search_disp;
	}
	/**
	 * @return tx_enddt_search_disp
	 */
	public String getTx_enddt_search_disp() {
		return tx_enddt_search_disp;
	}
	/**
	 * @param tx_enddt_search_disp 要设置的 tx_enddt_search_disp
	 */
	public void setTx_enddt_search_disp(String tx_enddt_search_disp) {
		this.tx_enddt_search_disp = tx_enddt_search_disp;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return checkedt47
	 */
	public String getCheckedt47() {
		return checkedt47;
	}
	/**
	 * @param checkedt47 要设置的 checkedt47
	 */
	public void setCheckedt47(String checkedt47) {
		this.checkedt47 = checkedt47;
	}
	public String getCurr_cd() {
		return curr_cd;
	}
	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
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
	public String getOpp_area2Name() {
		return opp_area2Name;
	}
	public void setOpp_area2Name(String opp_area2Name) {
		this.opp_area2Name = opp_area2Name;
	}
	public String getOpp_areaName() {
		return opp_areaName;
	}
	public void setOpp_areaName(String opp_areaName) {
		this.opp_areaName = opp_areaName;
	}
	public String getOpp_coutry() {
		return opp_coutry;
	}
	public void setOpp_coutry(String opp_coutry) {
		this.opp_coutry = opp_coutry;
	}
	public String getOpp_country() {
		return opp_country;
	}
	public void setOpp_country(String opp_country) {
		this.opp_country = opp_country;
	}
	public String getTrans_key() {
		return trans_key;
	}
	public void setTrans_key(String trans_key) {
		this.trans_key = trans_key;
	}
	public Date getTx_today() {
		return tx_today;
	}
	public void setTx_today(Date tx_today) {
		this.tx_today = tx_today;
	}
	public String getTx_today_disp() {
		return tx_today_disp;
	}
	public void setTx_today_disp(String tx_today_disp) {
		this.tx_today_disp = tx_today_disp;
	}

	public String getAgent_country() {
		return agent_country;
	}
	public void setAgent_country(String agent_country) {
		this.agent_country = agent_country;
	}
	public String getAgent_name() {
		return agent_name;
	}
	public void setAgent_name(String agent_name) {
		this.agent_name = agent_name;
	}
	public String getOrg_trans_rela() {
		return org_trans_rela;
	}
	public void setOrg_trans_rela(String org_trans_rela) {
		this.org_trans_rela = org_trans_rela;
	}
	public String getTsctkey() {
		return tsctkey;
	}
	public void setTsctkey(String tsctkey) {
		this.tsctkey = tsctkey;
	}
	public String getTx_go_area() {
		return tx_go_area;
	}
	public void setTx_go_area(String tx_go_area) {
		this.tx_go_area = tx_go_area;
	}
	public String getTx_go_country() {
		return tx_go_country;
	}
	public void setTx_go_country(String tx_go_country) {
		this.tx_go_country = tx_go_country;
	}
	public String getTx_occur_area() {
		return tx_occur_area;
	}
	public void setTx_occur_area(String tx_occur_area) {
		this.tx_occur_area = tx_occur_area;
	}
	public String getTx_occur_country() {
		return tx_occur_country;
	}
	public void setTx_occur_country(String tx_occur_country) {
		this.tx_occur_country = tx_occur_country;
	}
	public String getAgent_card_no() {
		return agent_card_no;
	}
	public void setAgent_card_no(String agent_card_no) {
		this.agent_card_no = agent_card_no;
	}
	public String getAgent_card_type() {
		return agent_card_type;
	}
	public void setAgent_card_type(String agent_card_type) {
		this.agent_card_type = agent_card_type;
	}
	public String getTsctkey1() {
		return tsctkey1;
	}
	public void setTsctkey1(String tsctkey1) {
		this.tsctkey1 = tsctkey1;
	}
	public String getTsctkey2() {
		return tsctkey2;
	}
	public void setTsctkey2(String tsctkey2) {
		this.tsctkey2 = tsctkey2;
	}
	public String getTsctkey3() {
		return tsctkey3;
	}
	public void setTsctkey3(String tsctkey3) {
		this.tsctkey3 = tsctkey3;
	}
	public String getTx_go_area1() {
		return tx_go_area1;
	}
	public void setTx_go_area1(String tx_go_area1) {
		this.tx_go_area1 = tx_go_area1;
	}
	public String getTx_go_area2() {
		return tx_go_area2;
	}
	public void setTx_go_area2(String tx_go_area2) {
		this.tx_go_area2 = tx_go_area2;
	}
	public String getTx_occur_area1() {
		return tx_occur_area1;
	}
	public void setTx_occur_area1(String tx_occur_area1) {
		this.tx_occur_area1 = tx_occur_area1;
	}
	public String getTx_occur_area2() {
		return tx_occur_area2;
	}
	public void setTx_occur_area2(String tx_occur_area2) {
		this.tx_occur_area2 = tx_occur_area2;
	}
	public String getCash_ind() {
		return cash_ind;
	}
	public void setCash_ind(String cash_ind) {
		this.cash_ind = cash_ind;
	}
	public String getVoucher_no() {
		return voucher_no;
	}
	public void setVoucher_no(String voucher_no) {
		this.voucher_no = voucher_no;
	}
	public String getOpp_pbc_party_class_cd() {
		return opp_pbc_party_class_cd;
	}
	public void setOpp_pbc_party_class_cd(String opp_pbc_party_class_cd) {
		this.opp_pbc_party_class_cd = opp_pbc_party_class_cd;
	}
	public String getParty_chn_name_disp() {
		return party_chn_name_disp;
	}
	public void setParty_chn_name_disp(String party_chn_name_disp) {
		this.party_chn_name_disp = party_chn_name_disp;
	}
	public String getAlert_type() {
		return alert_type;
	}
	public void setAlert_type(String alert_type) {
		this.alert_type = alert_type;
	}
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public Date getClose_dt() {
		return close_dt;
	}
	public void setClose_dt(Date close_dt) {
		this.close_dt = close_dt;
	}
	public String getClose_dt_disp() {
		return close_dt_disp;
	}
	public void setClose_dt_disp(String close_dt_disp) {
		this.close_dt_disp = close_dt_disp;
	}
	public Date getOpen_dt() {
		return open_dt;
	}
	public void setOpen_dt(Date open_dt) {
		this.open_dt = open_dt;
	}
	public String getOpen_dt_disp() {
		return open_dt_disp;
	}
	public void setOpen_dt_disp(String open_dt_disp) {
		this.open_dt_disp = open_dt_disp;
	}

	public String getValidate_ind_disp() {
		return validate_ind_disp;
	}
	public void setValidate_ind_disp(String validate_ind_disp) {
		this.validate_ind_disp = validate_ind_disp;
	}
	public String getAcct_type() { 
		return acct_type;
	}
	public void setAcct_type(String acct_type) {
		this.acct_type = acct_type;
	}
	public String getAcct_type_string() {
		return acct_type_string;
	}
	public void setAcct_type_string(String acct_type_string) {
		this.acct_type_string = acct_type_string;
	}
	public String getOrg_trans_rela_flag() {
		return org_trans_rela_flag;
	}
	public void setOrg_trans_rela_flag(String org_trans_rela_flag) {
		this.org_trans_rela_flag = org_trans_rela_flag;
	}
	public String getReceive_pay_cd_flag() {
		return receive_pay_cd_flag;
	}
	public void setReceive_pay_cd_flag(String receive_pay_cd_flag) {
		this.receive_pay_cd_flag = receive_pay_cd_flag;
	}
	public String getSettle_type_cd_flag() {
		return settle_type_cd_flag;
	}
	public void setSettle_type_cd_flag(String settle_type_cd_flag) {
		this.settle_type_cd_flag = settle_type_cd_flag;
	}
	public String getTransactionkey_flag() {
		return transactionkey_flag;
	}
	public void setTransactionkey_flag(String transactionkey_flag) {
		this.transactionkey_flag = transactionkey_flag;
	}
	public String getTsctkey_flag() {
		return tsctkey_flag;
	}
	public void setTsctkey_flag(String tsctkey_flag) {
		this.tsctkey_flag = tsctkey_flag;
	}
	public String getIsInnerOrganCode() {
		return isInnerOrganCode;
	}
	public void setIsInnerOrganCode(String isInnerOrganCode) {
		this.isInnerOrganCode = isInnerOrganCode;
	}
	public String getOpp_isInnerOrganCode() {
		return opp_isInnerOrganCode;
	}
	public void setOpp_isInnerOrganCode(String opp_isInnerOrganCode) {
		this.opp_isInnerOrganCode = opp_isInnerOrganCode;
	}
	public String getTx_go() {
		return tx_go;
	}
	public void setTx_go(String tx_go) {
		this.tx_go = tx_go;
	}
	public String getTx_go_disp() {
		return tx_go_disp;
	}
	public void setTx_go_disp(String tx_go_disp) {
		this.tx_go_disp = tx_go_disp;
	}
	public String getTx_occur() {
		return tx_occur;
	}
	public void setTx_occur(String tx_occur) {
		this.tx_occur = tx_occur;
	}
	public String getTx_occur_disp() {
		return tx_occur_disp;
	}
	public void setTx_occur_disp(String tx_occur_disp) {
		this.tx_occur_disp = tx_occur_disp;
	}
	public String getOrgan_area_cd() {
		return organ_area_cd;
	}
	public void setOrgan_area_cd(String organ_area_cd) {
		this.organ_area_cd = organ_area_cd;
	}
	public String getOrgan_area_cd_disp() {
		return organ_area_cd_disp;
	}
	public void setOrgan_area_cd_disp(String organ_area_cd_disp) {
		this.organ_area_cd_disp = organ_area_cd_disp;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organ_code) {
		this.organ_code = organ_code;
	}
	public String getOrgan_code_type_disp() {
		return organ_code_type_disp;
	}
	public void setOrgan_code_type_disp(String organ_code_type_disp) {
		this.organ_code_type_disp = organ_code_type_disp;
	}
	public String getOrgan_code_type() {
		return organ_code_type;
	}
	public void setOrgan_code_type(String organ_code_type) {
		this.organ_code_type = organ_code_type;
	}
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	public String getOrgan_area() {
		return organ_area;
	}
	public void setOrgan_area(String organ_area) {
		this.organ_area = organ_area;
	}
	public String getOrgan_area_disp() {
		return organ_area_disp;
	}
	public void setOrgan_area_disp(String organ_area_disp) {
		this.organ_area_disp = organ_area_disp;
	}
	public String getOpp_area_disp() {
		return opp_area_disp;
	}
	public void setOpp_area_disp(String opp_area_disp) {
		this.opp_area_disp = opp_area_disp;
	}
	public String getCny_amt_string() {
		return cny_amt_string;
	}
	public void setCny_amt_string(String cny_amt_string) {
		this.cny_amt_string = cny_amt_string;
	}

	public String getValidate_ind() {
		return validate_ind;
	}
	public void setValidate_ind(String validate_ind) {
		this.validate_ind = validate_ind;
	}
	public String getCal_ind() {
		return cal_ind;
	}
	public void setCal_ind(String cal_ind) {
		this.cal_ind = cal_ind;
	}
	public String getCal_ind_disp() {
		return cal_ind_disp;
	}
	public void setCal_ind_disp(String cal_ind_disp) {
		this.cal_ind_disp = cal_ind_disp;
	}
	public String getParty_name() {
		return party_name;
	}
	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getStart_time2() {
		return start_time2;
	}
	public void setStart_time2(String start_time2) {
		this.start_time2 = start_time2;
	}
	public String getTeller_disp() {
		return teller_disp;
	}
	public void setTeller_disp(String teller_disp) {
		this.teller_disp = teller_disp;
	}
	public String getOrgan_name() {
		return organ_name;
	}
	public void setOrgan_name(String organ_name) {
		this.organ_name = organ_name;
	}
	public String getOpp_off_shore_ind() {
		return opp_off_shore_ind;
	}
	public void setOpp_off_shore_ind(String opp_off_shore_ind) {
		this.opp_off_shore_ind = opp_off_shore_ind;
	}
	public String getCurr_cd_search() {
		return curr_cd_search;
	}
	public void setCurr_cd_search(String curr_cd_search) {
		this.curr_cd_search = curr_cd_search;
	}
	public String getParty_class_cd_search() {
		return party_class_cd_search;
	}
	public void setParty_class_cd_search(String party_class_cd_search) {
		this.party_class_cd_search = party_class_cd_search;
	}
	public String getValidate_ind2() {
		return validate_ind2;
	}
	public void setValidate_ind2(String validate_ind2) {
		this.validate_ind2 = validate_ind2;
	}
	public String getValidateflag() {
		return validateflag;
	}
	public void setValidateflag(String validateflag) {
		this.validateflag = validateflag;
	}
	public Double getAmt_end() {
		return amt_end;
	}
	public void setAmt_end(Double amt_end) {
		this.amt_end = amt_end;
	}
	public Double getAmt_start() {
		return amt_start;
	}
	public void setAmt_start(Double amt_start) {
		this.amt_start = amt_start;
	}
	public String getAlert_type_cd() {
		return alert_type_cd;
	}
	public void setAlert_type_cd(String alert_type_cd) {
		this.alert_type_cd = alert_type_cd;
	}
	public synchronized String getSettle_type_cd1() {
		return settle_type_cd1;
	}
	public synchronized void setSettle_type_cd1(String settle_type_cd1) {
		this.settle_type_cd1 = settle_type_cd1;
	}
	public String getCard_inf() {
		return card_inf;
	}
	public void setCard_inf(String card_inf) {
		this.card_inf = card_inf;
	}
	public String getAmt_disp() {
		return amt_disp;
	}
	public void setAmt_disp(String amt_disp) {
		this.amt_disp = amt_disp;
	}
	public String getSettle_type_cd2() {
		return settle_type_cd2;
	}
	public void setSettle_type_cd2(String settle_type_cd2) {
		this.settle_type_cd2 = settle_type_cd2;
	}
	public String getSettle_type_cd3() {
		return settle_type_cd3;
	}
	public void setSettle_type_cd3(String settle_type_cd3) {
		this.settle_type_cd3 = settle_type_cd3;
	}
	public String getSettle_type_cd4() {
		return settle_type_cd4;
	}
	public void setSettle_type_cd4(String settle_type_cd4) {
		this.settle_type_cd4 = settle_type_cd4;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getTrans_table() {
		return trans_table;
	}
	public void setTrans_table(String trans_table) {
		this.trans_table = trans_table;
	}
	public String getIs_party() {
		return is_party;
	}
	public void setIs_party(String is_party) {
		this.is_party = is_party;
	}
	public String getOrgankey_new() {
		return organkey_new;
	}
	public void setOrgankey_new(String organkeyNew) {
		organkey_new = organkeyNew;
	}
	public String getTrans_ip() {
		return trans_ip;
	}
	public void setTrans_ip(String trans_ip) {
		this.trans_ip = trans_ip;
	}
}

