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
                                                  
import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_alertActionForm extends ActionForm {
	private Date invalid_dt=null;
	private String  invalid_dt_disp="";
	private String  invalid_dt_end_disp="";
	private Date invalid_dt_end=null;      
	private String[] alerkkeyCheckBox=null;
	private String validate_ind="";
	private String curr_cd="";
/** 人行规则 */
private String pbckey = "";
/** 记录状态1:正常2:失效4:作废	保留 */
private String record_status_cd = "";
/** 是否员工参与0:否1:是 */
private String staff_in_ind = "";
/** 预警对象名称 */
private String objname = "";
/** 处理人 */
private String handle_usr = "";
/** 预警对象 */
private String objkey = "";
/** 是否员工预警0:否1:是 */
private String staff_ind = "";
/** 预警金额数 */
private Double amount = null;
private String amount_string="";
/** 预警交易数 */
private Long trans_num = null;
/** 意见 */
private String txt = "";

/** 案例名称 */
private String case_name = "";
/** 案例创建机构 */
private String app_org_id = "";
private String app_org_name = "";
/** 案例种类 */
private String case_kind = "";
private String case_kind_disp = "";
/** 案例类型:0大额1可疑 */
private String cast_type = "";
private String cast_type_disp = "";
/** 机构 */
private String organkey = "";
/** 预警状态1:未处理 2:处理中3:已确认 4:已排除
 */
private String alert_status_cd = "";
/** 预警id */
private String alertkey = "";
/** 预警方式1:系统 2:人工 */
private String alert_mode_cd = "";

/** 系统规则 */
private String rulekey = "";
/** 产生时间 */
private Date create_dt = new Date();
/** 预警对象类型1:客户2:账户 */
private String obj_type_cd = "";
/** Alert_type_cd1:大额 2:可疑 */
private String alert_type_cd = "";
/** 预警日期（数据日期） */
private Date alert_dt = new Date();
/** 得分**/
private Long score=null;

/** 采取措施 */
private String take_action = "";
/** 可疑行为描述 */
private String action_descrip="";  
/** 可疑程度 */
private String alert_level="01"; 
private String alert_level_disp=""; 

//=======================================================
/** 产生时间 */
private String create_dt_disp = "";
/** 预警日期（数据日期） */
private String alert_dt_disp = "";
private String orderby="";
private String order="";
private String name="";
private String status="";
private String kind="";
private String pbcrule="";
private String type="";
private Date alert_dt_start=null;
private String alert_dt_start_disp="";
private Date alert_dt_end=null;
private String alert_dt_end_disp=""; 
private String pbc_des="";
private String organname="";
private String organnum="";
private Date time=new Date();
/** 案例编号 */
private String application_num = "";
private String indickey="";
private String indicname="";
private String unit="";
private String upper_limit="";
private String low_limit="";
private String indic_val="";
private String indic_score="";
private String host_cust_id="";
private String country_residence="";
private String party_chn_name="";
private String party_class_cd="";
private String party_id="";
private int num=0;
private String level="";
private String debit_credit="";
private String re_ind="";
private String tx_type_cd="";
private String debit_credit_disp="";
private String re_ind_disp="";
private String tx_type_cd_disp="";
private String currency_cd="";
private String currency_cd_disp="";
private String transactionkey="";
private String modify="";
private String tx_no="";
private String tx_dt_disp="";
private Date tx_dt=new Date();
private String acct_num="";
private String amt="";
private String searchtype="";
private String[] selectalertkey=null;
private String searchOrganName="";
//预警-交易表单复选框
private String transactionkeyCheckBox[]= null;
private String addtional="";
private String tranctionsize="";

private String nowtime="";
private String pbcname="";
private String sysname="";
private String newsearchflag="";
private String alert_status="";


/*预警分历史查询和当前查询*/
private String alertsearchtime = "";

/** 系统规则 */
private String rulekey_disp = "";

private String rule_des="";

	/**
 * @return the acct_num
 */
public String getAcct_num() {
	return acct_num;
}
/**
 * @param acct_num the acct_num to set
 */
public void setAcct_num(String acct_num) {
	this.acct_num = acct_num;
}
/**
 * @return the amt
 */
public String getAmt() {
	return amt;
}
/**
 * @param amt the amt to set
 */
public void setAmt(String amt) {
	this.amt = amt;
}
/**
 * @return the country_residence
 */
public String getCountry_residence() {
	return country_residence;
}
/**
 * @param country_residence the country_residence to set
 */
public void setCountry_residence(String country_residence) {
	this.country_residence = country_residence;
}
/**
 * @return the currency_cd
 */
public String getCurrency_cd() {
	return currency_cd;
}
/**
 * @param currency_cd the currency_cd to set
 */
public void setCurrency_cd(String currency_cd) {
	this.currency_cd = currency_cd;
}
/**
 * @return the currency_cd_disp
 */
public String getCurrency_cd_disp() {
	return currency_cd_disp;
}
/**
 * @param currency_cd_disp the currency_cd_disp to set
 */
public void setCurrency_cd_disp(String currency_cd_disp) {
	this.currency_cd_disp = currency_cd_disp;
}
/**
 * @return the debit_credit
 */
public String getDebit_credit() {
	return debit_credit;
}
/**
 * @param debit_credit the debit_credit to set
 */
public void setDebit_credit(String debit_credit) {
	this.debit_credit = debit_credit;
}
/**
 * @return the debit_credit_disp
 */
public String getDebit_credit_disp() {
	return debit_credit_disp;
}
/**
 * @param debit_credit_disp the debit_credit_disp to set
 */
public void setDebit_credit_disp(String debit_credit_disp) {
	this.debit_credit_disp = debit_credit_disp;
}
/**
 * @return the host_cust_id
 */
public String getHost_cust_id() {
	return host_cust_id;
}
/**
 * @param host_cust_id the host_cust_id to set
 */
public void setHost_cust_id(String host_cust_id) {
	this.host_cust_id = host_cust_id;
}
/**
 * @return the indic_score
 */
public String getIndic_score() {
	return indic_score;
}
/**
 * @param indic_score the indic_score to set
 */
public void setIndic_score(String indic_score) {
	this.indic_score = indic_score;
}
/**
 * @return the indic_val
 */
public String getIndic_val() {
	return indic_val;
}
/**
 * @param indic_val the indic_val to set
 */
public void setIndic_val(String indic_val) {
	this.indic_val = indic_val;
}
/**
 * @return the indickey
 */
public String getIndickey() {
	return indickey;
}
/**
 * @param indickey the indickey to set
 */
public void setIndickey(String indickey) {
	this.indickey = indickey;
}
/**
 * @return the indicname
 */
public String getIndicname() {
	return indicname;
}
/**
 * @param indicname the indicname to set
 */
public void setIndicname(String indicname) {
	this.indicname = indicname;
}
/**
 * @return the level
 */
public String getLevel() {
	return level;
}
/**
 * @param level the level to set
 */
public void setLevel(String level) {
	this.level = level;
}
/**
 * @return the low_limit
 */
public String getLow_limit() {
	return low_limit;
}
/**
 * @param low_limit the low_limit to set
 */
public void setLow_limit(String low_limit) {
	this.low_limit = low_limit;
}
/**
 * @return the modify
 */
public String getModify() {
	return modify;
}
/**
 * @param modify the modify to set
 */
public void setModify(String modify) {
	this.modify = modify;
}
/**
 * @return the num
 */
public int getNum() {
	return num;
}
/**
 * @param num the num to set
 */
public void setNum(int num) {
	this.num = num;
}
/**
 * @return the party_chn_name
 */
public String getParty_chn_name() {
	return party_chn_name;
}
/**
 * @param party_chn_name the party_chn_name to set
 */
public void setParty_chn_name(String party_chn_name) {
	this.party_chn_name = party_chn_name;
}
/**
 * @return the party_class_cd
 */
public String getParty_class_cd() {
	return party_class_cd;
}
/**
 * @param party_class_cd the party_class_cd to set
 */
public void setParty_class_cd(String party_class_cd) {
	this.party_class_cd = party_class_cd;
}
/**
 * @return the party_id
 */
public String getParty_id() {
	return party_id;
}
/**
 * @param party_id the party_id to set
 */
public void setParty_id(String party_id) {
	this.party_id = party_id;
}
/**
 * @return the re_ind
 */
public String getRe_ind() {
	return re_ind;
}
/**
 * @param re_ind the re_ind to set
 */
public void setRe_ind(String re_ind) {
	this.re_ind = re_ind;
}
/**
 * @return the re_ind_disp
 */
public String getRe_ind_disp() {
	return re_ind_disp;
}
/**
 * @param re_ind_disp the re_ind_disp to set
 */
public void setRe_ind_disp(String re_ind_disp) {
	this.re_ind_disp = re_ind_disp;
}
/**
 * @return the transactionkey
 */
public String getTransactionkey() {
	return transactionkey;
}
/**
 * @param transactionkey the transactionkey to set
 */
public void setTransactionkey(String transactionkey) {
	this.transactionkey = transactionkey;
}
/**
 * @return the tx_dt
 */
public Date getTx_dt() {
	return tx_dt;
}
/**
 * @param tx_dt the tx_dt to set
 */
public void setTx_dt(Date tx_dt) {
	this.tx_dt = tx_dt;
}
/**
 * @return the tx_dt_disp
 */
public String getTx_dt_disp() {
	return tx_dt_disp;
}
/**
 * @param tx_dt_disp the tx_dt_disp to set
 */
public void setTx_dt_disp(String tx_dt_disp) {
	this.tx_dt_disp = tx_dt_disp;
}
/**
 * @return the tx_no
 */
public String getTx_no() {
	return tx_no;
}
/**
 * @param tx_no the tx_no to set
 */
public void setTx_no(String tx_no) {
	this.tx_no = tx_no;
}
/**
 * @return the tx_type_cd
 */
public String getTx_type_cd() {
	return tx_type_cd;
}
/**
 * @param tx_type_cd the tx_type_cd to set
 */
public void setTx_type_cd(String tx_type_cd) {
	this.tx_type_cd = tx_type_cd;
}
/**
 * @return the tx_type_cd_disp
 */
public String getTx_type_cd_disp() {
	return tx_type_cd_disp;
}
/**
 * @param tx_type_cd_disp the tx_type_cd_disp to set
 */
public void setTx_type_cd_disp(String tx_type_cd_disp) {
	this.tx_type_cd_disp = tx_type_cd_disp;
}
/**
 * @return the unit
 */
public String getUnit() {
	return unit;
}
/**
 * @param unit the unit to set
 */
public void setUnit(String unit) {
	this.unit = unit;
}
/**
 * @return the upper_limit
 */
public String getUpper_limit() {
	return upper_limit;
}
/**
 * @param upper_limit the upper_limit to set
 */
public void setUpper_limit(String upper_limit) {
	this.upper_limit = upper_limit;
}
	public String getApplication_num() {
	return application_num;
}
public void setApplication_num(String application_num) {
	this.application_num = application_num;
}
	/**
 * @return the time
 */
public Date getTime() {
	return time;
}
/**
 * @param time the time to set
 */
public void setTime(Date time) {
	this.time = time;
}
	/**
 * @return the organnum
 */
public String getOrgannum() {
	return organnum;
}
/**
 * @param organnum the organnum to set
 */
public void setOrgannum(String organnum) {
	this.organnum = organnum;
}
	/**
 * @return the pbc_des
 */
public String getPbc_des() {
	return pbc_des;
}
/**
 * @param pbc_des the pbc_des to set
 */
public void setPbc_des(String pbc_des) {
	this.pbc_des = pbc_des;
}
	/**
 * @return the alert_dt_end
 */
public Date getAlert_dt_end() {
	return alert_dt_end;
}
/**
 * @param alert_dt_end the alert_dt_end to set
 */
public void setAlert_dt_end(Date alert_dt_end) {
	this.alert_dt_end = alert_dt_end;
}
/**
 * @return the alert_dt_end_disp
 */
public String getAlert_dt_end_disp() {
	return alert_dt_end_disp;
}
/**
 * @param alert_dt_end_disp the alert_dt_end_disp to set
 */
public void setAlert_dt_end_disp(String alert_dt_end_disp) {
	this.alert_dt_end_disp = alert_dt_end_disp;
}
/**
 * @return the alert_dt_start
 */
public Date getAlert_dt_start() {
	return alert_dt_start;
}
/**
 * @param alert_dt_start the alert_dt_start to set
 */
public void setAlert_dt_start(Date alert_dt_start) {
	this.alert_dt_start = alert_dt_start;
}
/**
 * @return the alert_dt_start_disp
 */
public String getAlert_dt_start_disp() {
	return alert_dt_start_disp;
}
/**
 * @param alert_dt_start_disp the alert_dt_start_disp to set
 */
public void setAlert_dt_start_disp(String alert_dt_start_disp) {
	this.alert_dt_start_disp = alert_dt_start_disp;
}
/**
 * @return the kind
 */
public String getKind() {
	return kind;
}
/**
 * @param kind the kind to set
 */
public void setKind(String kind) {
	this.kind = kind;
}
/**
 * @return the name
 */
public String getName() {
	return name;
}
/**
 * @param name the name to set
 */
public void setName(String name) {
	this.name = name;
}
/**
 * @return the order
 */
public String getOrder() {
	return order;
}
/**
 * @param order the order to set
 */
public void setOrder(String order) {
	this.order = order;
}
/**
 * @return the orderby
 */
public String getOrderby() {
	return orderby;
}
/**
 * @param orderby the orderby to set
 */
public void setOrderby(String orderby) {
	this.orderby = orderby;
}
/**
 * @return the pbcrule
 */
public String getPbcrule() {
	return pbcrule;
}
/**
 * @param pbcrule the pbcrule to set
 */
public void setPbcrule(String pbcrule) {
	this.pbcrule = pbcrule;
}
/**
 * @return the status
 */
public String getStatus() {
	return status;
}
/**
 * @param status the status to set
 */
public void setStatus(String status) {
	this.status = status;
}
/**
 * @return the type
 */
public String getType() {
	return type;
}
/**
 * @param type the type to set
 */
public void setType(String type) {
	this.type = type;
}
	/**                   
     * 构造函数           
     */                   
    public T07_alertActionForm() {    
    }                     
public void setPbckey(String pbckeyStr){
this.pbckey = pbckeyStr;
}
public String getPbckey(){
return this.pbckey;
}

public void setRecord_status_cd(String record_status_cdStr){
this.record_status_cd = record_status_cdStr;
}
public String getRecord_status_cd(){
return this.record_status_cd;
}

public void setStaff_in_ind(String staff_in_indStr){
this.staff_in_ind = staff_in_indStr;
}
public String getStaff_in_ind(){
return this.staff_in_ind;
}

public void setObjname(String objnameStr){
this.objname = objnameStr;
}
public String getObjname(){
return this.objname;
}

public void setHandle_usr(String handle_usrStr){
this.handle_usr = handle_usrStr;
}
public String getHandle_usr(){
return this.handle_usr;
}

public void setObjkey(String objkeyStr){
this.objkey = objkeyStr;
}
public String getObjkey(){
return this.objkey;
}

public void setStaff_ind(String staff_indStr){
this.staff_ind = staff_indStr;
}
public String getStaff_ind(){
return this.staff_ind;
}

public void setAmount(Double amountStr){
this.amount = amountStr;
}
public Double getAmount(){
return this.amount;
}

public void setTrans_num(Long trans_numStr){
this.trans_num = trans_numStr;
}
public Long getTrans_num(){
return this.trans_num;
}

public void setTxt(String txtStr){
this.txt = txtStr;
}
public String getTxt(){
return this.txt;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setAlert_status_cd(String alert_status_cdStr){
this.alert_status_cd = alert_status_cdStr;
}
public String getAlert_status_cd(){
return this.alert_status_cd;
}

public void setAlertkey(String alertkeyStr){
this.alertkey = alertkeyStr;
}
public String getAlertkey(){
return this.alertkey;
}

public void setAlert_mode_cd(String alert_mode_cdStr){
this.alert_mode_cd = alert_mode_cdStr;
}
public String getAlert_mode_cd(){
return this.alert_mode_cd;
}

public void setRulekey(String rulekeyStr){
this.rulekey = rulekeyStr;
}
public String getRulekey(){
return this.rulekey;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setObj_type_cd(String obj_type_cdStr){
this.obj_type_cd = obj_type_cdStr;
}
public String getObj_type_cd(){
return this.obj_type_cd;
}

public void setAlert_type_cd(String alert_type_cdStr){
this.alert_type_cd = alert_type_cdStr;
}
public String getAlert_type_cd(){
return this.alert_type_cd;
}

public void setAlert_dt(Date alert_dtStr){
this.alert_dt = alert_dtStr;
}
public Date getAlert_dt(){
return this.alert_dt;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setAlert_dt_disp(String alert_dt_dispStr){
this.alert_dt_disp = alert_dt_dispStr;
}
public String getAlert_dt_disp(){
return this.alert_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public Long getScore() {
		return score;
	}
	public void setScore(Long score) {
		this.score = score;
	}
	/**
	 * @return the organname
	 */
	public String getOrganname() {
		return organname;
	}
	/**
	 * @param organname the organname to set
	 */
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	/**
	 * @return the searchtype
	 */
	public String getSearchtype() {
		return searchtype;
	}
	/**
	 * @param searchtype the searchtype to set
	 */
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getRulekey_disp() {
		return rulekey_disp;
	}
	public void setRulekey_disp(String rulekey_disp) {
		this.rulekey_disp = rulekey_disp;
	}
	
	/**
	 * @return the selectalertkey
	 */
	public String[] getSelectalertkey() {
		return selectalertkey;
	}
	/**
	 * @param selectalertkey the selectalertkey to set
	 */
	public void setSelectalertkey(String[] selectalertkey) {
		this.selectalertkey = selectalertkey;
	}
	/**
	 * @return the searchOrganName
	 */
	public String getSearchOrganName() {
		return searchOrganName;
	}
	/**
	 * @param searchOrganName the searchOrganName to set
	 */
	public void setSearchOrganName(String searchOrganName) {
		this.searchOrganName = searchOrganName;
	}
	public String getTranctionsize() {
		return tranctionsize;
	}
	public void setTranctionsize(String tranctionsize) {
		this.tranctionsize = tranctionsize;
	}
	public String[] getTransactionkeyCheckBox() {
		return transactionkeyCheckBox;
	}
	public void setTransactionkeyCheckBox(String[] transactionkeyCheckBox) {
		this.transactionkeyCheckBox = transactionkeyCheckBox;
	}                   
	
	/**
	 * @return the nowtime
	 */
	public String getNowtime() {
		return nowtime;
	}
	/**
	 * @param nowtime the nowtime to set
	 */
	public void setNowtime(String nowtime) {
		this.nowtime = nowtime;
	}
	/**
	 * @return the pbcname
	 */
	public String getPbcname() {
		return pbcname;
	}
	/**
	 * @param pbcname the pbcname to set
	 */
	public void setPbcname(String pbcname) {
		this.pbcname = pbcname;
	}
	/**
	 * @return the sysname
	 */
	public String getSysname() {
		return sysname;
	}
	/**
	 * @param sysname the sysname to set
	 */
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	/**
	 * @return the newsearchflag
	 */
	public String getNewsearchflag() {
		return newsearchflag;
	}
	/**
	 * @param newsearchflag the newsearchflag to set
	 */
	public void setNewsearchflag(String newsearchflag) {
		this.newsearchflag = newsearchflag;
	}
	/**
	 * @return the addtional
	 */
	public String getAddtional() {
		return addtional;
	}
	/**
	 * @param addtional the addtional to set
	 */
	public void setAddtional(String addtional) {
		this.addtional = addtional;
	}
	public String getAlert_status() {
		return alert_status;
	}
	public void setAlert_status(String alert_status) {
		this.alert_status = alert_status;
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
	public Date getInvalid_dt_end() {
		return invalid_dt_end;
	}
	public void setInvalid_dt_end(Date invalid_dt_end) {
		this.invalid_dt_end = invalid_dt_end;
	}
	public String getInvalid_dt_end_disp() {
		return invalid_dt_end_disp;
	}
	public void setInvalid_dt_end_disp(String invalid_dt_end_disp) {
		this.invalid_dt_end_disp = invalid_dt_end_disp;
	}
	public String[] getAlerkkeyCheckBox() {
		return alerkkeyCheckBox;
	}
	public void setAlerkkeyCheckBox(String[] alerkkeyCheckBox) {
		this.alerkkeyCheckBox = alerkkeyCheckBox;
	}
	public String getValidate_ind() {
		return validate_ind;
	}
	public void setValidate_ind(String validate_ind) {
		this.validate_ind = validate_ind;
	}
	public String getCurr_cd() {
		return curr_cd;
	}
	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}
	public String getApp_org_id() {
		return app_org_id;
	}
	public void setApp_org_id(String app_org_id) {
		this.app_org_id = app_org_id;
	}
	public String getApp_org_name() {
		return app_org_name;
	}
	public void setApp_org_name(String app_org_name) {
		this.app_org_name = app_org_name;
	}
	public String getCase_kind() {
		return case_kind;
	}
	public void setCase_kind(String case_kind) {
		this.case_kind = case_kind;
	}
	public String getCase_kind_disp() {
		return case_kind_disp;
	}
	public void setCase_kind_disp(String case_kind_disp) {
		this.case_kind_disp = case_kind_disp;
	}
	public String getCase_name() {
		return case_name;
	}
	public void setCase_name(String case_name) {
		this.case_name = case_name;
	}
	public String getCast_type() {
		return cast_type;
	}
	public void setCast_type(String cast_type) {
		this.cast_type = cast_type;
	}
	public String getCast_type_disp() {
		return cast_type_disp;
	}
	public void setCast_type_disp(String cast_type_disp) {
		this.cast_type_disp = cast_type_disp;
	}
	public String getTake_action() {
		return take_action;
	}
	public void setTake_action(String take_action) {
		this.take_action = take_action;
	}
	public String getAction_descrip() {
		return action_descrip;
	}
	public void setAction_descrip(String action_descrip) {
		this.action_descrip = action_descrip;
	}
	public String getAlert_level() {
		return alert_level;
	}
	public void setAlert_level(String alert_level) {
		this.alert_level = alert_level;
	}
	public String getAlert_level_disp() {
		return alert_level_disp;
	}
	public void setAlert_level_disp(String alert_level_disp) {
		this.alert_level_disp = alert_level_disp;
	}
	public String getAlertsearchtime() {
		return alertsearchtime;
	}
	public void setAlertsearchtime(String alertsearchtime) {
		this.alertsearchtime = alertsearchtime;
	}
	
	
	public String getRule_des() {
		return rule_des;
	}
	public void setRule_des(String rule_des) {
		this.rule_des = rule_des;
	}
	public String getAmount_string() {
		return amount_string;
	}
	public void setAmount_string(String amount_string) {
		this.amount_string = amount_string;
	}
	                                                                                              
}
