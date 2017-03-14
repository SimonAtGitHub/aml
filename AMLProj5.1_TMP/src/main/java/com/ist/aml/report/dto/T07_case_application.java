/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-27   青蛙		创建        
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

public class T07_case_application implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -100743879251242761L;
	private String is_staff="";
	//////////////////////////////////
	private String curr_org = "";
	private String curr_post = "";
	private String current_ind = "";
	private String orig_current_ind = "";
	private ArrayList application_numList = new ArrayList();
	/** 案例类型:0大额1可疑 */
	private String cast_type = "";
	private String cast_type_disp = "";
	private String validate_ind = "";
	private String validate_ind_disp = "";
	/** 可疑程度 */
	private String alert_level = "";
	private String alert_level_disp = "";
	
	//根据可疑程度判断是否需要走案例审核流程 add 2011.09.19
	private ArrayList alert_levelList = new ArrayList();
	
	/** 采取措施 */
	private String take_action = "";
	/** 可疑行为描述 */
	private String action_descrip = "";
	/** 可疑行为处理说明 */
	private String action_explain="";
	/** 数据来源1：手工新增2：系统生成 */
	private String date_status_cd = "";
	/** 案例名称 */
	private String case_name = "";
	/** 客户ID */
	private String party_id = "";
	/** 创建日期 */
	private Date app_dt = new Date();
	/** 预警时间 */
	private Date alert_dt = new Date();
	/** 创建机构 */
	private String app_org_id = "";
	private String app_org_name = "";
	/** null */
	private String app_case_reason = "";
	/** 案例编号 */
	private String application_num = "";
	/** 上报次数 */
	private Long recheck_num = null;
	/** 案例种类 */
	private String case_kind = "";
	private String case_kind_disp = "";
	/** 案例种类标签：0，A N;1，R,C,D,I */
	private String case_kind_flag = "";
	/** 案例时间 */
	private Date case_date = new Date();
	/** 状态1：正常2：批准3：否决4：排除5：重报 */
	private String app_state_cd = "";
	/** 上次更新用户 */
	private String last_upd_user = "";
	/** 流程id */
	private String flow_id = "";
	/** 客户名称 */
	private String party_name = "";
	/** 上次更新时间 */
	private Date last_upd_dt = new Date();
	/** 案例级别0:普通1重要2紧急
	 */
	private String case_level = "";
	/** 案例查询分历史查询和当前查询 */
	private String casesearchtime = "";
	private String casesearchtime_disp = "";
	private String case_leval_disp = "";

	private String party_class_cd = "";

	/** 本外币*/
	private String curr_cd = "";

	private Date case_tran_mindate = new Date();
	private Date case_tran_maxdate = new Date();
	private Date case_end_date = null;
	private Date case_end_date_end = null;
	private String case_tran_mindate_disp = "";
	private String case_tran_maxdate_disp = "";
	private String case_end_date_disp = "";
	//=======================================================
	/** 创建日期 */
	private String app_dt_disp = "";
	/** 案例时间 */
	private String case_date_disp = "";
	/** 上次更新时间 */
	private String last_upd_dt_disp = "";

	private String num = "";
	private String name = "";
	private Date app_dt_start = null;
	private String app_dt_start_disp = "";
	private Date app_dt_end = null;
	private String app_dt_end_disp = "";
	private String state = "";
	private String type = "";
	private String level = "";
	private String kind = "";
	private String order = "";
	private String orderby = "";
	private String alertkey = "";
	private String alert_type_cd = "";
	private String objname = "";
	private String objkey = "";
	private String alert_mode_cd = "";
	private String trans_num = "";
	private String amount = "";
	private Date create_dt = new Date();
	private String create_dt_disp = "";
	private String alert_status = "";
	private String score = "";
	private String alert_status_cd = "";
	private String transactionkey = "";
	private Date tx_dt = new Date();
	private String tx_dt_disp = "";
	private String tx_no = "";
	private String organkey = "";
	private String acct_num = "";
	private String party_chn_name = "";
	private String debit_Credit = "";
	private Double amt = null;
	private String amt_disp = "";
	ArrayList getAlert_caseList = new ArrayList();
	private String post_id = "";
	private String operator_num = "";
	private String reason = "";
	private Date last_upd_dt_start = null;
	private String last_upd_dt_start_disp = "";
	private Date last_upd_dt_end = null;
	private String last_upd_dt_end_disp = "";
	private String debit_credit = "";
	private String re_ind = "";
	private String tx_type_cd = "";
	private String debit_credit_disp = "";
	private String re_ind_disp = "";
	private String tx_type_cd_disp = "";
	private String currency_cd = "";
	private String currency_cd_disp = "";
	private String host_cust_id = "";
	private String app_state_cd_s = "";
	private String addtional = "";
	private String organname = "";
	private String post_name = "";

	private String rulekey = "";
	private String rulekey_disp = "";
	private String organnum = "";
	private String searchOrganName = "";
	private String organnum1 = "";
	private String searchOrganName1 = "";
	private String organnum2 = "";
	private String searchOrganName2 = "";
    /**案例编号  */
    private String[] selectedReportname = {};

	private String pbckey = "";//人行规则
	private String stcrkey = "";//特征代码
	//行内员工  2009.12.15
	private String staff = "";
	
	//可疑报告导出用 add 2010.4.16
	private String country_cd = ""; //所属国家
	private String card_type = "";  //证件类型
	private String card_no = "";  //证件号码
	private String legal_obj = "";  //法定代表人
	private String legal_card_type = ""; //代表人证件类型
	private String legal_card_no = "";  //代表人证件号码
	//end add
	
	private String deal_state = "";//未报送时认定状态
	
	private String deal_state1 = "";//已报送时认定状态
	private String organStr="";
	private String is_menu="";
	private String is_menu_disp="";
	
	private String isstaff="";
	private String is_grey="";
	private String  app_state_cd1="";

	private String msgkey="";
	private String packetkey="";
	public String getPacketkey() {
		return packetkey;
	}

	public void setPacketkey(String packetkey) {
		this.packetkey = packetkey;
	}

	public String getMsgkey() {
		return msgkey;
	}

	public void setMsgkey(String msgkey) {
		this.msgkey = msgkey;
	}

	/** 可疑案例排除标志 */
	private String delete_flag = "";
	
	private String application_advice = ""; //案例处理意见
	
	public String getOrganStr() {
		return organStr;
	}

	public void setOrganStr(String organStr) {
		this.organStr = organStr;
	}

	private Double tran_amt=0.0;
	private Long trans_count=new Long(0) ; //交易记录数
	private String trans_amt ="";  //交易金额
	private String stcr = ""; //人行特征代码
	private Long tran_count=new Long(0);
	public Long getTran_count() {
		return tran_count;
	}

	public void setTran_count(Long tranCount) {
		tran_count = tranCount;
	}

	public Long getAcct_count() {
		return acct_count;
	}

	public void setAcct_count(Long acctCount) {
		acct_count = acctCount;
	}

	public Long getParty_count() {
		return party_count;
	}

	public void setParty_count(Long partyCount) {
		party_count = partyCount;
	}

	public void setTrans_amt(String transAmt) {
		trans_amt = transAmt;
	}

	private Long acct_count=new Long(0);
	private Long party_count=new Long(0);

	

	
	/** 案例开始时间 */
	private Date case_date_start = null;
	/** 案例结束时间 */
	private Date case_date_end = null;
	/** 案例开始时间 */
	private String case_date_start_disp = "";
	/** 案例结束时间 */
	private String case_date_end_disp = "";
	
	/** add 2011.05.06 北京农商案例导出*/
	private String addr1 = ""; //地址1
	private String addr2 = ""; //地址2
	private String tel_no = ""; //固定电话
	private String cell_no = ""; //移动电话
	private String industrykey = "";//行业
	private Double enrol_fund_amt; //注册资金 ENROL_FUND_AMT
	private String union_organ = "";//机构行政区划对应码
	private int stcr_count; //特征总数
	private int agreement_count; //账户总数
	private String curr_oper_id = ""; //当前操作Id
	private String post02_date = ""; //编辑岗操作日期
	private String post02_result = ""; //编辑岗操作结果
	private String post03_date = "";  //审核岗操作日期
	private String post03_result = ""; //审核岗操作结果
	private String post04_date = "";  //审批岗操作日期
	private String post04_result = "";  //审批岗操作结果
	private String  reportkey="";
	/** end add*/
	
	/******************** 试点************/
	/** 案例来源:1规则 2模型 3多主体*/
	private String case_source = "";

	//===================================================//



	
	/** 当前节点 */
	private String node_id = "";
	
	public String getOrgannum1() {
		return organnum1;
	}

	public void setOrgannum1(String organnum1) {
		this.organnum1 = organnum1;
	}

	public String getOrgannum2() {
		return organnum2;
	}

	public void setOrgannum2(String organnum2) {
		this.organnum2 = organnum2;
	}

	public String getSearchOrganName1() {
		return searchOrganName1;
	}

	public void setSearchOrganName1(String searchOrganName1) {
		this.searchOrganName1 = searchOrganName1;
	}

	public String getSearchOrganName2() {
		return searchOrganName2;
	}

	public void setSearchOrganName2(String searchOrganName2) {
		this.searchOrganName2 = searchOrganName2;
	}

	public String getSearchOrganName() {
		return searchOrganName;
	}

	public void setSearchOrganName(String searchOrganName) {
		this.searchOrganName = searchOrganName;
	}

	public String getOrgannum() {
		return organnum;
	}

	public void setOrgannum(String organnum) {
		this.organnum = organnum;
	}

	public String getRulekey() {
		return rulekey;
	}

	public void setRulekey(String rulekey) {
		this.rulekey = rulekey;
	}

	public String getRulekey_disp() {
		return rulekey_disp;
	}

	public void setRulekey_disp(String rulekey_disp) {
		this.rulekey_disp = rulekey_disp;
	}

	/**
	 * @return the post_name
	 */
	public String getPost_name() {
		return post_name;
	}

	/**
	 * @param post_name the post_name to set
	 */
	public void setPost_name(String post_name) {
		this.post_name = post_name;
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

	public String getApp_state_cd_s() {
		return app_state_cd_s;
	}

	public void setApp_state_cd_s(String app_state_cd_s) {
		this.app_state_cd_s = app_state_cd_s;
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
	 * @return the operator_num
	 */
	public String getOperator_num() {
		return operator_num;
	}

	/**
	 * @param operator_num the operator_num to set
	 */
	public void setOperator_num(String operator_num) {
		this.operator_num = operator_num;
	}

	/**
	 * @return the post_id
	 */
	public String getPost_id() {
		return post_id;
	}

	/**
	 * @param post_id the post_id to set
	 */
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}

	/**
	 * @return the reason
	 */
	public String getReason() {
		return reason;
	}

	/**
	 * @param reason the reason to set
	 */
	public void setReason(String reason) {
		this.reason = reason;
	}

	/**
	 * @return the getAlert_caseList
	 */
	public ArrayList getGetAlert_caseList() {
		return getAlert_caseList;
	}

	/**
	 * @param getAlert_caseList the getAlert_caseList to set
	 */
	public void setGetAlert_caseList(ArrayList getAlert_caseList) {
		this.getAlert_caseList = getAlert_caseList;
	}

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
	 * @return the debit_Credit
	 */
	public String getDebit_Credit() {
		return debit_Credit;
	}

	/**
	 * @param debit_Credit the debit_Credit to set
	 */
	public void setDebit_Credit(String debit_Credit) {
		this.debit_Credit = debit_Credit;
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
	 * @return the alert_status_cd
	 */
	public String getAlert_status_cd() {
		return alert_status_cd;
	}

	/**
	 * @param alert_status_cd the alert_status_cd to set
	 */
	public void setAlert_status_cd(String alert_status_cd) {
		this.alert_status_cd = alert_status_cd;
	}

	/**
	 * @return the score
	 */
	public String getScore() {
		return score;
	}

	/**
	 * @param score the score to set
	 */
	public void setScore(String score) {
		this.score = score;
	}

	/**
	 * @return the alert_mode_cd
	 */
	public String getAlert_mode_cd() {
		return alert_mode_cd;
	}

	/**
	 * @param alert_mode_cd the alert_mode_cd to set
	 */
	public void setAlert_mode_cd(String alert_mode_cd) {
		this.alert_mode_cd = alert_mode_cd;
	}

	/**
	 * @return the alert_status
	 */
	public String getAlert_status() {
		return alert_status;
	}

	/**
	 * @param alert_status the alert_status to set
	 */
	public void setAlert_status(String alert_status) {
		this.alert_status = alert_status;
	}

	/**
	 * @return the alert_type_cd
	 */
	public String getAlert_type_cd() {
		return alert_type_cd;
	}

	/**
	 * @param alert_type_cd the alert_type_cd to set
	 */
	public void setAlert_type_cd(String alert_type_cd) {
		this.alert_type_cd = alert_type_cd;
	}

	/**
	 * @return the alertkey
	 */
	public String getAlertkey() {
		return alertkey;
	}

	/**
	 * @param alertkey the alertkey to set
	 */
	public void setAlertkey(String alertkey) {
		this.alertkey = alertkey;
	}

	/**
	 * @return the amount
	 */
	public String getAmount() {
		return amount;
	}

	/**
	 * @param amount the amount to set
	 */
	public void setAmount(String amount) {
		this.amount = amount;
	}

	/**
	 * @return the create_dt
	 */
	public Date getCreate_dt() {
		return create_dt;
	}

	/**
	 * @param create_dt the create_dt to set
	 */
	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}

	/**
	 * @return the objkey
	 */
	public String getObjkey() {
		return objkey;
	}

	/**
	 * @param objkey the objkey to set
	 */
	public void setObjkey(String objkey) {
		this.objkey = objkey;
	}

	/**
	 * @return the objname
	 */
	public String getObjname() {
		return objname;
	}

	/**
	 * @param objname the objname to set
	 */
	public void setObjname(String objname) {
		this.objname = objname;
	}

	/**
	 * @return the trans_num
	 */
	public String getTrans_num() {
		return trans_num;
	}

	/**
	 * @param trans_num the trans_num to set
	 */
	public void setTrans_num(String trans_num) {
		this.trans_num = trans_num;
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
	 * @return the num
	 */
	public String getNum() {
		return num;
	}

	/**
	 * @param num the num to set
	 */
	public void setNum(String num) {
		this.num = num;
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
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
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
	public T07_case_application() {
	}

	public void setCast_type(String cast_typeStr) {
		this.cast_type = cast_typeStr;
	}

	public String getCast_type() {
		return this.cast_type;
	}

	public void setDate_status_cd(String date_status_cdStr) {
		this.date_status_cd = date_status_cdStr;
	}

	public String getDate_status_cd() {
		return this.date_status_cd;
	}

	public void setCase_name(String case_nameStr) {
		this.case_name = case_nameStr;
	}

	public String getCase_name() {
		return this.case_name;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setApp_dt(Date app_dtStr) {
		this.app_dt = app_dtStr;
	}

	public Date getApp_dt() {
		return this.app_dt;
	}

	public void setApp_org_id(String app_org_idStr) {
		this.app_org_id = app_org_idStr;
	}

	public String getApp_org_id() {
		return this.app_org_id;
	}

	public void setApp_case_reason(String app_case_reasonStr) {
		this.app_case_reason = app_case_reasonStr;
	}

	public String getApp_case_reason() {
		return this.app_case_reason;
	}

	public void setApplication_num(String application_numStr) {
		this.application_num = application_numStr;
	}

	public String getApplication_num() {
		return this.application_num;
	}

	public void setRecheck_num(Long recheck_numStr) {
		this.recheck_num = recheck_numStr;
	}

	public Long getRecheck_num() {
		return this.recheck_num;
	}

	public void setCase_kind(String case_kindStr) {
		this.case_kind = case_kindStr;
	}

	public String getCase_kind() {
		return this.case_kind;
	}

	public void setCase_date(Date case_dateStr) {
		this.case_date = case_dateStr;
	}

	public Date getCase_date() {
		return this.case_date;
	}

	public void setApp_state_cd(String app_state_cdStr) {
		this.app_state_cd = app_state_cdStr;
	}

	public String getApp_state_cd() {
		return this.app_state_cd;
	}

	public void setLast_upd_user(String last_upd_userStr) {
		this.last_upd_user = last_upd_userStr;
	}

	public String getLast_upd_user() {
		return this.last_upd_user;
	}

	public void setFlow_id(String flow_idStr) {
		this.flow_id = flow_idStr;
	}

	public String getFlow_id() {
		return this.flow_id;
	}

	public void setParty_name(String party_nameStr) {
		this.party_name = party_nameStr;
	}

	public String getParty_name() {
		return this.party_name;
	}

	public void setLast_upd_dt(Date last_upd_dtStr) {
		this.last_upd_dt = last_upd_dtStr;
	}

	public Date getLast_upd_dt() {
		return this.last_upd_dt;
	}

	public void setCase_level(String case_levelStr) {
		this.case_level = case_levelStr;
	}

	public String getCase_level() {
		return this.case_level;
	}

	//=======================================================
	public void setApp_dt_disp(String app_dt_dispStr) {
		this.app_dt_disp = app_dt_dispStr;
	}

	public String getApp_dt_disp() {
		return this.app_dt_disp;
	}

	public void setCase_date_disp(String case_date_dispStr) {
		this.case_date_disp = case_date_dispStr;
	}

	public String getCase_date_disp() {
		return this.case_date_disp;
	}

	public void setLast_upd_dt_disp(String last_upd_dt_dispStr) {
		this.last_upd_dt_disp = last_upd_dt_dispStr;
	}

	public String getLast_upd_dt_disp() {
		return this.last_upd_dt_disp;
	}

	/**
	 * @return the create_dt_disp
	 */
	public String getCreate_dt_disp() {
		return create_dt_disp;
	}

	/**
	 * @param create_dt_disp the create_dt_disp to set
	 */
	public void setCreate_dt_disp(String create_dt_disp) {
		this.create_dt_disp = create_dt_disp;
	}

	public String getApp_org_name() {
		return app_org_name;
	}

	public void setApp_org_name(String app_org_name) {
		this.app_org_name = app_org_name;
	}

	public String getCase_leval_disp() {
		return case_leval_disp;
	}

	public void setCase_leval_disp(String case_leval_disp) {
		this.case_leval_disp = case_leval_disp;
	}

	public String getCast_type_disp() {
		return cast_type_disp;
	}

	public void setCast_type_disp(String cast_type_disp) {
		this.cast_type_disp = cast_type_disp;
	}

	public String getCase_kind_disp() {
		return case_kind_disp;
	}

	public void setCase_kind_disp(String case_kind_disp) {
		this.case_kind_disp = case_kind_disp;
	}

	/**
	 * @return the app_dt_start
	 */
	public Date getApp_dt_start() {
		return app_dt_start;
	}

	/**
	 * @param app_dt_start the app_dt_start to set
	 */
	public void setApp_dt_start(Date app_dt_start) {
		this.app_dt_start = app_dt_start;
	}

	/**
	 * @return the last_upd_dt_end
	 */
	public Date getLast_upd_dt_end() {
		return last_upd_dt_end;
	}

	/**
	 * @param last_upd_dt_end the last_upd_dt_end to set
	 */
	public void setLast_upd_dt_end(Date last_upd_dt_end) {
		this.last_upd_dt_end = last_upd_dt_end;
	}

	/**
	 * @return the last_upd_dt_start
	 */
	public Date getLast_upd_dt_start() {
		return last_upd_dt_start;
	}

	/**
	 * @param last_upd_dt_start the last_upd_dt_start to set
	 */
	public void setLast_upd_dt_start(Date last_upd_dt_start) {
		this.last_upd_dt_start = last_upd_dt_start;
	}

	/**
	 * @param app_dt_end the app_dt_end to set
	 */
	public void setApp_dt_end(Date app_dt_end) {
		this.app_dt_end = app_dt_end;
	}

	/**
	 * @return the app_dt_end
	 */
	public Date getApp_dt_end() {
		return app_dt_end;
	}

	/**
	 * @return the app_dt_end_disp
	 */
	public String getApp_dt_end_disp() {
		return app_dt_end_disp;
	}

	/**
	 * @param app_dt_end_disp the app_dt_end_disp to set
	 */
	public void setApp_dt_end_disp(String app_dt_end_disp) {
		this.app_dt_end_disp = app_dt_end_disp;
	}

	/**
	 * @return the app_dt_start_disp
	 */
	public String getApp_dt_start_disp() {
		return app_dt_start_disp;
	}

	/**
	 * @param app_dt_start_disp the app_dt_start_disp to set
	 */
	public void setApp_dt_start_disp(String app_dt_start_disp) {
		this.app_dt_start_disp = app_dt_start_disp;
	}

	/**
	 * @return the last_upd_dt_end_disp
	 */
	public String getLast_upd_dt_end_disp() {
		return last_upd_dt_end_disp;
	}

	/**
	 * @param last_upd_dt_end_disp the last_upd_dt_end_disp to set
	 */
	public void setLast_upd_dt_end_disp(String last_upd_dt_end_disp) {
		this.last_upd_dt_end_disp = last_upd_dt_end_disp;
	}

	/**
	 * @return the last_upd_dt_start_disp
	 */
	public String getLast_upd_dt_start_disp() {
		return last_upd_dt_start_disp;
	}

	/**
	 * @param last_upd_dt_start_disp the last_upd_dt_start_disp to set
	 */
	public void setLast_upd_dt_start_disp(String last_upd_dt_start_disp) {
		this.last_upd_dt_start_disp = last_upd_dt_start_disp;
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

	public Date getCase_end_date() {
		return case_end_date;
	}

	public void setCase_end_date(Date case_end_date) {
		this.case_end_date = case_end_date;
	}

	public Date getCase_tran_maxdate() {
		return case_tran_maxdate;
	}

	public void setCase_tran_maxdate(Date case_tran_maxdate) {
		this.case_tran_maxdate = case_tran_maxdate;
	}

	public Date getCase_tran_mindate() {
		return case_tran_mindate;
	}

	public void setCase_tran_mindate(Date case_tran_mindate) {
		this.case_tran_mindate = case_tran_mindate;
	}

	public String getCase_end_date_disp() {
		return case_end_date_disp;
	}

	public void setCase_end_date_disp(String case_end_date_disp) {
		this.case_end_date_disp = case_end_date_disp;
	}

	public String getCase_tran_maxdate_disp() {
		return case_tran_maxdate_disp;
	}

	public void setCase_tran_maxdate_disp(String case_tran_maxdate_disp) {
		this.case_tran_maxdate_disp = case_tran_maxdate_disp;
	}

	public String getCase_tran_mindate_disp() {
		return case_tran_mindate_disp;
	}

	public void setCase_tran_mindate_disp(String case_tran_mindate_disp) {
		this.case_tran_mindate_disp = case_tran_mindate_disp;
	}

	public String getCurr_cd() {
		return curr_cd;
	}

	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}

	public String getParty_class_cd() {
		return party_class_cd;
	}

	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}

	public String getOrgankey() {
		return organkey;
	}

	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}

	public String getAmt_disp() {
		return amt_disp;
	}

	public void setAmt_disp(String amt_disp) {
		this.amt_disp = amt_disp;
	}

	public String getAction_descrip() {
		return action_descrip;
	}

	public void setAction_descrip(String action_descrip) {
		this.action_descrip = action_descrip;
	}

	public String getAction_explain() {
		return action_explain;
	}

	public void setAction_explain(String actionExplain) {
		action_explain = actionExplain;
	}

	public String getTake_action() {
		return take_action;
	}

	public void setTake_action(String take_action) {
		this.take_action = take_action;
	}

	public Date getCase_end_date_end() {
		return case_end_date_end;
	}

	public void setCase_end_date_end(Date case_end_date_end) {
		this.case_end_date_end = case_end_date_end;
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

	public String getCurr_org() {
		return curr_org;
	}

	public void setCurr_org(String curr_org) {
		this.curr_org = curr_org;
	}

	public String getCurr_post() {
		return curr_post;
	}

	public void setCurr_post(String curr_post) {
		this.curr_post = curr_post;
	}

	public Date getAlert_dt() {
		return alert_dt;
	}

	public void setAlert_dt(Date alert_dt) {
		this.alert_dt = alert_dt;
	}

	public ArrayList getApplication_numList() {
		return application_numList;
	}

	public void setApplication_numList(ArrayList application_numList) {
		this.application_numList = application_numList;
	}

	public String getCurrent_ind() {
		return current_ind;
	}

	public void setCurrent_ind(String current_ind) {
		this.current_ind = current_ind;
	}

	public String getOrig_current_ind() {
		return orig_current_ind;
	}

	public void setOrig_current_ind(String orig_current_ind) {
		this.orig_current_ind = orig_current_ind;
	}

	public String getCasesearchtime() {
		return casesearchtime;
	}

	public void setCasesearchtime(String casesearchtime) {
		this.casesearchtime = casesearchtime;
	}

	public String getPbckey() {
		return pbckey;
	}

	public void setPbckey(String pbckey) {
		this.pbckey = pbckey;
	}

	public String getStcrkey() {
		return stcrkey;
	}

	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}

	public String getIs_staff() {
		return is_staff;
	}

	public void setIs_staff(String is_staff) {
		this.is_staff = is_staff;
	}

	public String getStaff() {
		return staff;
	}

	public void setStaff(String staff) {
		this.staff = staff;
	}

	public String[] getSelectedReportname() {
		return selectedReportname;
	}

	public void setSelectedReportname(String[] selectedReportname) {
		this.selectedReportname = selectedReportname;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}

	public String getLegal_obj() {
		return legal_obj;
	}

	public void setLegal_obj(String legal_obj) {
		this.legal_obj = legal_obj;
	}

	public String getLegal_card_type() {
		return legal_card_type;
	}

	public void setLegal_card_type(String legal_card_type) {
		this.legal_card_type = legal_card_type;
	}

	public String getLegal_card_no() {
		return legal_card_no;
	}

	public void setLegal_card_no(String legal_card_no) {
		this.legal_card_no = legal_card_no;
	}

	public String getDeal_state() {
		return deal_state;
	}

	public void setDeal_state(String deal_state) {
		this.deal_state = deal_state;
	}

	public String getDeal_state1() {
		return deal_state1;
	}

	public void setDeal_state1(String deal_state1) {
		this.deal_state1 = deal_state1;
	}

	public Long getTrans_count() {
		return trans_count;
	}

	public void setTrans_count(Long trans_count) {
		this.trans_count = trans_count;
	}

	public String getTrans_amt() {
		return trans_amt;
	}



	public String getStcr() {
		return stcr;
	}

	public void setStcr(String stcr) {
		this.stcr = stcr;
	}

	public String getNode_id() {
		return node_id;
	}

	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}

	public Date getCase_date_start() {
		return case_date_start;
	}

	public void setCase_date_start(Date case_date_start) {
		this.case_date_start = case_date_start;
	}

	public Date getCase_date_end() {
		return case_date_end;
	}

	public void setCase_date_end(Date case_date_end) {
		this.case_date_end = case_date_end;
	}

	public String getCase_date_start_disp() {
		return case_date_start_disp;
	}

	public void setCase_date_start_disp(String case_date_start_disp) {
		this.case_date_start_disp = case_date_start_disp;
	}

	public String getCase_date_end_disp() {
		return case_date_end_disp;
	}

	public void setCase_date_end_disp(String case_date_end_disp) {
		this.case_date_end_disp = case_date_end_disp;
	}

	public String getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(String delete_flag) {
		this.delete_flag = delete_flag;
	}

	public String getIs_menu() {
		return is_menu;
	}

	public void setIs_menu(String is_menu) {
		this.is_menu = is_menu;
	}

	public String getApplication_advice() {
		return application_advice;
	}

	public void setApplication_advice(String application_advice) {
		this.application_advice = application_advice;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getCell_no() {
		return cell_no;
	}

	public void setCell_no(String cell_no) {
		this.cell_no = cell_no;
	}

	public String getIndustrykey() {
		return industrykey;
	}

	public void setIndustrykey(String industrykey) {
		this.industrykey = industrykey;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getIs_menu_disp() {
		return is_menu_disp;
	}

	public void setIs_menu_disp(String is_menu_disp) {
		this.is_menu_disp = is_menu_disp;
	}

	public String getUnion_organ() {
		return union_organ;
	}

	public void setUnion_organ(String union_organ) {
		this.union_organ = union_organ;
	}

	public int getAgreement_count() {
		return agreement_count;
	}

	public void setAgreement_count(int agreement_count) {
		this.agreement_count = agreement_count;
	}

	public int getStcr_count() {
		return stcr_count;
	}

	public void setStcr_count(int stcr_count) {
		this.stcr_count = stcr_count;
	}

	public String getCasesearchtime_disp() {
		return casesearchtime_disp;
	}

	public void setCasesearchtime_disp(String casesearchtime_disp) {
		this.casesearchtime_disp = casesearchtime_disp;
	}

	public Double getEnrol_fund_amt() {
		return enrol_fund_amt;
	}

	public Double getTran_amt() {
		return tran_amt;
	}

	public void setTran_amt(Double tranAmt) {
		tran_amt = tranAmt;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void setEnrol_fund_amt(Double enrol_fund_amt) {
		this.enrol_fund_amt = enrol_fund_amt;
	}

	public String getCurr_oper_id() {
		return curr_oper_id;
	}

	public void setCurr_oper_id(String curr_oper_id) {
		this.curr_oper_id = curr_oper_id;
	}

	public String getPost02_date() {
		return post02_date;
	}

	public void setPost02_date(String post02_date) {
		this.post02_date = post02_date;
	}

	public String getPost02_result() {
		return post02_result;
	}

	public void setPost02_result(String post02_result) {
		this.post02_result = post02_result;
	}

	public String getPost03_date() {
		return post03_date;
	}

	public void setPost03_date(String post03_date) {
		this.post03_date = post03_date;
	}

	public String getPost03_result() {
		return post03_result;
	}

	public void setPost03_result(String post03_result) {
		this.post03_result = post03_result;
	}

	public String getPost04_date() {
		return post04_date;
	}

	public void setPost04_date(String post04_date) {
		this.post04_date = post04_date;
	}

	public String getPost04_result() {
		return post04_result;
	}

	public void setPost04_result(String post04_result) {
		this.post04_result = post04_result;
	}

	public String getIsstaff() {
		return isstaff;
	}

	public void setIsstaff(String isstaff) {
		this.isstaff = isstaff;
	}

	public String getIs_grey() {
		return is_grey;
	}

	public void setIs_grey(String is_grey) {
		this.is_grey = is_grey;
	}

	public String getApp_state_cd1() {
		return app_state_cd1;
	}

	public void setApp_state_cd1(String app_state_cd1) {
		this.app_state_cd1 = app_state_cd1;
	}

	public ArrayList getAlert_levelList() {
		return alert_levelList;
	}

	public void setAlert_levelList(ArrayList alert_levelList) {
		this.alert_levelList = alert_levelList;
	}

	public void setReportkey(String reportkey) {
		this.reportkey = reportkey;
	}

	public String getReportkey() {
		return reportkey;
	}

	public String getCase_source() {
		return case_source;
	}

	public void setCase_source(String caseSource) {
		case_source = caseSource;
	}

	public String getCase_kind_flag() {
		return case_kind_flag;
	}

	public void setCase_kind_flag(String caseKindFlag) {
		case_kind_flag = caseKindFlag;
	}

}