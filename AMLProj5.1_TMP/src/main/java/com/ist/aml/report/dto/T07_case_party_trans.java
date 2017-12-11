/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2007-12-05   青蛙		创建        
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

import java.util.Date;       
     
                                              
public class T07_case_party_trans implements Serializable {
                                              
	 /**
	 * 
	 */
	private static final long serialVersionUID = -5974794251274678029L;
	private  String    case_date_disp="";
     private  Date case_date=new Date();
	 private  String    application_num="";
  
	 private  String    app_org_id="";
     private  String    organName="";
     private  String    apporganname="";
	 private  String    party_id="";
     private  String    post_id="";
	 private  String    action_descrip="";
	   
	 private  String    take_action="";
	   
	 private  String    tran_count="";
   
	 private  String    tran_amt="";
  
	 private  String    party_chn_name="";
   
	 private  String    card_type="";
	 private  String    card_no="";
	 private  String    party_class_cd="";
	 private  String    addr1="";
	 private  String    country_cd="";
	 private  String    tel_no="";
	 private  String    validate_ind2="";
	 private  String    cell_no=""; 
	 private  String    curr_post="";
	 private  String    application_advice="";
	 private  Date    last_upd_dt=new Date();
	 private  String  last_upd_dt_disp="";
	 private  String    last_upd_user="";
	 private  String    curr_oper_id="";   
	 private  String    stcr="";
	 private  Date    tx_dt= new Date();
	 private  String   Tx_dt_disp=""; 
	 private  String    tx_cd="";
	 private  String    curr_cd="";
	 private  String    amt="";
	 private  String    opp_acct_type_cd="";
	 private  String    opp_acct_num="";
	 private  String    opp_organkey="";
	 private  String    opp_organname="";
	 private  String    opp_organ_type="";
	 private  String    opp_name="";
	 private  String    opp_card_type="";
	 private  String    opp_card_no="";  
	 private  String    transactionkey="";
	 private  String    receive_pay_cd="";
	 private  String    use_des="";
	 private  String    agent_name="";
	 private  String    agent_card_type="";
	 private  String    agent_card_no="";
	 private  String    agent_country="";
	 private  String    tx_no="";
	 private  String    tx_type_cd="";
	 private  String    organkey="";  
	
	 private  String    tsctkey="";
	 private  String    opp_area="";
	 private  String    settle_type_cd="";
	 private  String    handle_status_cd="";
	 private  String    status_cd_disp="";
	 private  String    app_state_cd="";
	 private  String    cash_trans_flag="";
	 private  String    cash_trans_flag_disp=""; 
	 private  String    case_kind="";
	 private  String    date_status_cd="";
	 private  String    enrol_fund_amt="";
	 private  String    legal_obj="";
	 private  String    legal_card_type="";
	 private  String    legal_card_no="";
	 private  String    occupation="";
	 private String    industrykey="";
	 
	 
	 
	 public String getIndustrykey() {
		return industrykey;
	}
	public void setIndustrykey(String industrykey) {
		this.industrykey = industrykey;
	}
	private String case_level="";
	 private String  alert_level="";
	 
	 private String union_organ="";
	 
	public String getAction_descrip() {
		return action_descrip;
	}
	public void setAction_descrip(String action_descrip) {
		this.action_descrip = action_descrip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
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
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	public String getApp_org_id() {
		return app_org_id;
	}
	public void setApp_org_id(String app_org_id) {
		this.app_org_id = app_org_id;
	}
	public String getApplication_advice() {
		return application_advice;
	}
	public void setApplication_advice(String application_advice) {
		this.application_advice = application_advice;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getCell_no() {
		return cell_no;
	}
	public void setCell_no(String cell_no) {
		this.cell_no = cell_no;
	}
	public String getCountry_cd() {
		return country_cd;
	}
	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}
	public String getCurr_cd() {
		return curr_cd;
	}
	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}
	public String getCurr_oper_id() {
		return curr_oper_id;
	}
	public void setCurr_oper_id(String curr_oper_id) {
		this.curr_oper_id = curr_oper_id;
	}
	public String getCurr_post() {
		return curr_post;
	}
	public void setCurr_post(String curr_post) {
		this.curr_post = curr_post;
	}
	public String getHandle_status_cd() {
		return handle_status_cd;
	}
	public void setHandle_status_cd(String handle_status_cd) {
		this.handle_status_cd = handle_status_cd;
	}

	public String getLast_upd_user() {
		return last_upd_user;
	}
	public void setLast_upd_user(String last_upd_user) {
		this.last_upd_user = last_upd_user;
	}
	public String getOpp_acct_num() {
		return opp_acct_num;
	}
	public void setOpp_acct_num(String opp_acct_num) {
		this.opp_acct_num = opp_acct_num;
	}
	public String getOpp_acct_type_cd() {
		return opp_acct_type_cd;
	}
	public void setOpp_acct_type_cd(String opp_acct_type_cd) {
		this.opp_acct_type_cd = opp_acct_type_cd;
	}
	public String getOpp_area() {
		return opp_area;
	}
	public void setOpp_area(String opp_area) {
		this.opp_area = opp_area;
	}
	public String getOpp_card_no() {
		return opp_card_no;
	}
	public void setOpp_card_no(String opp_card_no) {
		this.opp_card_no = opp_card_no;
	}
	public String getOpp_card_type() {
		return opp_card_type;
	}
	public void setOpp_card_type(String opp_card_type) {
		this.opp_card_type = opp_card_type;
	}
	public String getOpp_name() {
		return opp_name;
	}
	public void setOpp_name(String opp_name) {
		this.opp_name = opp_name;
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
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getReceive_pay_cd() {
		return receive_pay_cd;
	}
	public void setReceive_pay_cd(String receive_pay_cd) {
		this.receive_pay_cd = receive_pay_cd;
	}
	public String getSettle_type_cd() {
		return settle_type_cd;
	}
	public void setSettle_type_cd(String settle_type_cd) {
		this.settle_type_cd = settle_type_cd;
	}
	public String getStcr() {
		return stcr;
	}
	public void setStcr(String stcr) {
		this.stcr = stcr;
	}
	public String getTake_action() {
		return take_action;
	}
	public void setTake_action(String take_action) {
		this.take_action = take_action;
	}
	public String getTel_no() {
		return tel_no;
	}
	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}
	public String getTran_amt() {
		return tran_amt;
	}
	public void setTran_amt(String tran_amt) {
		this.tran_amt = tran_amt;
	}
	public String getTran_count() {
		return tran_count;
	}
	public void setTran_count(String tran_count) {
		this.tran_count = tran_count;
	}
	public String getTransactionkey() {
		return transactionkey;
	}
	public void setTransactionkey(String transactionkey) {
		this.transactionkey = transactionkey;
	}
	public String getTsctkey() {
		return tsctkey;
	}
	public void setTsctkey(String tsctkey) {
		this.tsctkey = tsctkey;
	}
	public String getTx_cd() {
		return tx_cd;
	}
	public void setTx_cd(String tx_cd) {
		this.tx_cd = tx_cd;
	}

	public String getTx_no() {
		return tx_no;
	}
	public void setTx_no(String tx_no) {
		this.tx_no = tx_no;
	}
	public String getTx_type_cd() {
		return tx_type_cd;
	}
	public void setTx_type_cd(String tx_type_cd) {
		this.tx_type_cd = tx_type_cd;
	}
	public String getUse_des() {
		return use_des;
	}
	public void setUse_des(String use_des) {
		this.use_des = use_des;
	}
	public String getValidate_ind2() {
		return validate_ind2;
	}
	public void setValidate_ind2(String validate_ind2) {
		this.validate_ind2 = validate_ind2;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getUnion_organ() {
		return union_organ;
	}
	public void setUnion_organ(String union_organ) {
		this.union_organ = union_organ;
	}
	public String getTx_dt_disp() {
		return Tx_dt_disp;
	}
	public void setTx_dt_disp(String tx_dt_disp) {
		Tx_dt_disp = tx_dt_disp;
	}
	public Date getTx_dt() {
		return tx_dt;
	}
	public void setTx_dt(Date tx_dt) {
		this.tx_dt = tx_dt;
	}
	public String getStatus_cd_disp() {
		return status_cd_disp;
	}
	public void setStatus_cd_disp(String status_cd_disp) {
		this.status_cd_disp = status_cd_disp;
	}
	public String getApp_state_cd() {
		return app_state_cd;
	}
	public void setApp_state_cd(String app_state_cd) {
		this.app_state_cd = app_state_cd;
	}
	public String getCash_trans_flag() {
		return cash_trans_flag;
	}
	public void setCash_trans_flag(String cash_trans_flag) {
		this.cash_trans_flag = cash_trans_flag;
	}
	public String getCash_trans_flag_disp() {
		return cash_trans_flag_disp;
	}
	public void setCash_trans_flag_disp(String cash_trans_flag_disp) {
		this.cash_trans_flag_disp = cash_trans_flag_disp;
	}
	public Date getLast_upd_dt() {
		return last_upd_dt;
	}
	public void setLast_upd_dt(Date last_upd_dt) {
		this.last_upd_dt = last_upd_dt;
	}
	public String getLast_upd_dt_disp() {
		return last_upd_dt_disp;
	}
	public void setLast_upd_dt_disp(String last_upd_dt_disp) {
		this.last_upd_dt_disp = last_upd_dt_disp;
	}
	public String getCase_level() {
		return case_level;
	}
	public void setCase_level(String case_level) {
		this.case_level = case_level;
	}
	public Date getCase_date() {
		return case_date;
	}
	public void setCase_date(Date case_date) {
		this.case_date = case_date;
	}
	public String getCase_date_disp() {
		return case_date_disp;
	}
	public void setCase_date_disp(String case_date_disp) {
		this.case_date_disp = case_date_disp;
	}
	public String getApporganname() {
		return apporganname;
	}
	public void setApporganname(String apporganname) {
		this.apporganname = apporganname;
	}
	public String getOpp_organname() {
		return opp_organname;
	}
	public void setOpp_organname(String opp_organname) {
		this.opp_organname = opp_organname;
	}
	public String getCase_kind() {
		return case_kind;
	}
	public void setCase_kind(String case_kind) {
		this.case_kind = case_kind;
	}
	public String getDate_status_cd() {
		return date_status_cd;
	}
	public void setDate_status_cd(String date_status_cd) {
		this.date_status_cd = date_status_cd;
	}
	public String getEnrol_fund_amt() {
		return enrol_fund_amt;
	}
	public void setEnrol_fund_amt(String enrol_fund_amt) {
		this.enrol_fund_amt = enrol_fund_amt;
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
	public String getAlert_level() {
		return alert_level;
	}
	public void setAlert_level(String alert_level) {
		this.alert_level = alert_level;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

//=======================================================
}

