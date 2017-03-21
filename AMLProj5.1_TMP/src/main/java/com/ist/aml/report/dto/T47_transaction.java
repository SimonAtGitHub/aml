/**                                             
 * 日期             作者 		动作        
 * 2006-12-29   青蛙		创建        
 */

package com.ist.aml.report.dto;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */


import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;


import com.ist.common.base.BaseDTO;
import com.ist.common.jcs.CatchManager;

public class T47_transaction extends BaseDTO{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2449209269121529814L;
	private String cash_ind = "";
	private String cash_ind_disp = "";
	private String cash_ind_flag = "";
	private String curr_cd_search="";
	private String party_class_cd_search="";
	private String host_cust_id_flag="";
	private String org_area="";
	private String pbckey="";
	private String alert_mode_cd="";
	private String alert_mode_cd_disp="";
	private String alert_type_cd="";
	private String alert_type_cd_disp="";
	private Date create_dt=null;
	private String create_dt_disp="";
	private String obj_type_cd="";
	private String obj_type_cd_disp="";
	private String staff_ind="";
	private String handle_usr="";
	private String intpage="";
	private Date tx_dt_start =null;
	private String net_id="";
	public String getNet_id() {
		return net_id;
	}

	public void setNet_id(String netId) {
		net_id = netId;
	}

	private Date tx_dt_end = null;
	private Date starttime = null;
	private Date starttime2 = null;
	private String  start_time="";
	private String  start_time2="";
	private String settle_type_cd1 = "";
	private String organkeystr = "";

	private String amt_cd = "";

	/** 交易金额 */
	private Double amt_start =null;

	private Double amt_end =null;

	/** 排序字段名称 */
	private String order_name = "";

	/** 排序类型 */
	private String order_type = "";

	/** 用途 */
	private String use_des = "";

	/** 对方账户类型 */
	String opp_acct_type_cd = "";

	String opp_acct_type_cd_string = "";

	/** 账户类型 */
	String acct_type = "";
	String acct_type_string = "";
	String acct_type_disp = "";

	/** 交易类型 */
	private String tx_type_cd = "";
		private String tx_type_cd_flag="";

	/** 是否跨境交易 */
	private String overarea_ind = "";
	private String overarea_indflag="";
	
	private String opp_off_shore_ind="";
	private String opp_off_shore_ind_flag="";

	/** 流水号 */
	private String tx_no = "";

	/** 业务类型 */
	private String bus_type_cd = "";

	/** 现/转标志 */
	private String cash_trans_flag = "";

	/** 对方所在地区 */
	private String opp_area = "";
	private String opp_area_disp = "";
	/** 对方所在国家 */
	private String opp_coutry = "";
	private String opp_country="";
	private String opp_area1="";
	private String opp_area2="";
	private String opp_area2Name="";
	private String opp_areaName="";
	private String trans_key="";
	
	private String cal_ind = "";
	private String cal_ind_disp = "";
	
	private String tsctkey="";  //涉外收支交易代码 
	private String tsctkey_flag="";
	private String tsctname="";
	private String tsctkey1="";
	private String tsctkey2="";
	private String tsctname2="";
	private String tsctkey3="";
	private String tsctname3="";
	private String tx_go="";//交易去向
	private String tx_go_disp="";//交易去向
	private String tx_go_country="";//交易去向国别
	private String tx_go_country_flag="";
	private String tx_go_area=""; //交易去向行政区
	private String tx_go_area1="";
	private String tx_go_area2="";
	private String tx_go_area2name="";
	private String tx_go_areaname="";
	private String tx_go_area_flag="";
	private String tx_occur="";	//交易发生地
	private String tx_occur_disp="";	//交易发生地
	private String tx_occur_country="";	//交易发生地国别
	private String tx_occur_country_flag="";
	private String tx_occur_area="";	//交易发生地行政区
	private String tx_occur_area_flag="";
	private String tx_occur_area1="";
	private String tx_occur_areaname="";
	private String tx_occur_area2="";
	private String tx_occur_area2name="";
	
	private String agent_name="";	//代办人姓名
	private String agent_name_flag="";
	private String agent_card_type="";	//代办人身份证件/证明文件类型
	private String agent_card_type_flag="";
	private String agent_card_no="" ; //代办人身份证件/证明文件号码
	private String agent_card_no_flag="" ;
	private String agent_country="";	//代办人国籍
	private String agent_country_flag="";
	private String  org_trans_rela=""; 	//金融机构和交易关系
	private String  org_trans_rela_flag="";
	private String  objname="";
    private String jiaoyifangshi="";
    private String trans_ip="";
    
	/** 结算方式 */
	private String settle_type_cd = "";
	private String settle_type_cd_flag = "";
	
	
	private Date alert_dt=null;
	private String rulekey="";
	public String getCase_kind() {
		return case_kind;
	}

	public void setCase_kind(String caseKind) {
		case_kind = caseKind;
	}

	public String getDate_status_cd() {
		return date_status_cd;
	}

	public void setDate_status_cd(String dateStatusCd) {
		date_status_cd = dateStatusCd;
	}

	private String app_state_cd="";
	
	private String case_kind="";
	private String date_status_cd="";

	/** Aml交易代码 */
	private String tx_cd = "";
	private String tx_cd_flag="";
	/** 交易时间 */
	private Date dt_time =null;

	/** 核心主键 */
	private String cb_pk = "";

	/** 原币交易金额 */
	private Double amt = null;
	private String amt_disp="";

	private String amt_string = "";

	/** 科目号 */
	private String subjectno = "";

	private String organ_name = "";
	private String receive_pay_cd_disp = "";
	private String handle_status_cd_disp = "";

	/** 科目名称 */
	private String subjectname = "";

	/** 对方行号 */
	private String opp_organkey = "";

	/** 币种 */
	private String currency_cd = "";

	private String curr_cd = "";

	/** 交易日期 */
	private Date tx_dt = null;

	/** 是否需补录 0:否1:是 */
	private String re_ind = "";

	private String re_ind_disp = "";

	/** 对方是否我行帐户 */
	private String opp_isparty = "";

	private String opp_isparty_flag = "";

	/** 对方证件类型 */

	private String opp_card_type = "";

	private String opp_card_type_disp = "";

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
	private String staff_ind_disp = "";
	private String txt = "";

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

	private String usd_amt_string = "";

	/** 我行客户号 */
	private String party_id = "";

	private String party_id1 = "";

	/** 处理状态0:未预警1:预警2:处理中3:已上报4:已排除 */
	private String handle_status_cd = "";

	/** 对方系统Id */
	private String opp_sys_id = "";

	/** 收付标志 */
	private String receive_pay_cd = "";

	/** 柜员 */
	private String teller = "";

	private String teller_disp = "";

	/** 批量标志 0:否1:是 */
	private String batch_ind = "";

	private String batch_ind_flag = "";

	/** 机构代码 */
	private String organkey = "";
	/**针对新增交易时，客户定位回填会冲掉原来的机构定位key*/
	private String organkey_new = "";
	/**机构名称*/
	private String organname = "";
	//private String organ_area_cd = "";
	private String org_area_disp = "";
	private String organ_area = "";
	private String organ_area_disp = "";
	private String organ_code = "";
	private String organ_code_type_disp = "";
	private String organ_code_type = "";

	/** 借贷标志 */
	private String debit_credit = "";

	/** 原交易代码 */
	private String cb_tx_cd = "";
	

	/** 原交易名称 */
	private String cb_tx_cd_name = "";

	/** 客户类型 */
	private String party_class_cd = "";

	private String party_class_cd_disp = "";

	/** 对方客户类型 */
	private String opp_party_class_cd = "";

	private String opp_party_class_cd_disp = "";

	/** 业务标识 */
	private String transactionkey = "";

	/** 汇款标志 */
	private String remit_type_cd = "";

	/** 摘要 */
	private String des = "";

	/** 是否已补录 */
	private String addtional = "";
	
	/** 补录时间 */
	private Date re_dt = new Date();

	private String re_dt_disp = "";

	private String status = ""; // 是否保存对手信息
	// =======================================================

	/** 交易时间 */
	private String dt_time_disp = "";

	/** 交易日期 */
	private String tx_dt_disp = "";

	/** 交易日期结束时间 */
	private Date tx_dtEnd = null;

	/** 交易日期结束时间 */
	private String tx_dtEndDisp = "";

	/** 对方交易日期 */
	private String opp_tx_dt_disp = "";

	/** 国籍 */
	private String country_cd = "";

	/** 交易方向 */
	private String tx_direct = "";

	/** 对方银行名称 */
	private String opp_organname = "";

	/** 凭证代码 */
	private String token_no = "";

	/** 原客户号 */
	private String host_cust_id = "";

	/** 交易类型 */
	private String tx_type_cd_disp = "";

	/** 币种 */
	private String currency_cd_disp = "";

	private ArrayList list = new ArrayList();

	private String debit_credit_disp = ""; // 0:借 1：贷

	private String alertkey = "";

	private String application_num = "";

	/** 折人民币开始查询金额 */
	private String cny_amtDisp = "";

	/** 折人民币结束查询金额 */
	private Double cny_amtEnd = null;

	/** 折人民币结束查询金额 */
	private String cny_amtEndDisp = "";

	/** 交易列表排序 */
	private String trasactionOrder = "";

	/** 交易列表排序方式 */
	private String trasactionKind = "";

	private String checkedt47 = "";

	/** 抹账标志 0:正常1:抹账 */

	private String cancel_ind = "";

	private String cancel_ind_disp = "";

	/**
	 * written by liulb
	 */
	// 现转
	private String cash_trans_flag_disp = "";

	// 机构名称
	private String organName = "";

	// ========================================================
	private String unionorgkey = ""; // 我行行号

	private String card_type = ""; // 我行客户证件类型

	private String card_type_disp = "";

	private String card_no = ""; // 我行客户证件号码

	private String searchtype = "";

	private String re_ind_search = "";

	/** 交易结束日期 */
	private Date tx_enddt = null;

	private String tx_dt_start_disp = "";

	private String tx_dt_end_disp = "";

	/** 业务标识 */
	private String transactionkey_flag = "";

	/** 对方行号类型 */
	private String opp_organ_type_flag = "";

	/** 对方行号 */
	private String opp_organkey_flag = "";

	/** 对方名称 */
	private String opp_name_flag = "";

	/** 对方账号 */
	private String opp_acct_num_flag = "";

	/** 原币交易金额 */
	private String amt_flag = "";

	/** 交易日期 */
	private String tx_dt_flag = "";

	/** 我行客户号 */
	private String party_id_flag = "";

	/** 我行帐号 */
	private String acct_num_flag = "";

	/** 我行客户名称 */
	private String party_chn_name_flag = "";

	/** 我行客户类型 */
	private String party_class_cd_flag = "";

	/** 我行客户证件类型 */
	private String card_type_flag = "";

	/** 我行客户证件号码 */
	private String card_no_flag = "";

	/** 它行客户号 */
	private String opp_party_id_flag = "";

	/** 它行客户类型 */
	private String opp_party_class_cd_falg = "";
	private String opp_pbc_party_class_cd_flag="";

	/** 它行客户证件类型 */
	private String opp_Card_type_flag = "";

	/** 它行客户证件号码 */
	private String opp_Card_no_flag = "";

	/** 它行交易时间 */
	private String opp_tx_dt_flag = "";

	/** 币种 */
	private String currency_cd_flag = "";
    /**借/贷 */
	private String debit_credit_flag="";

	/** 用途 */
	private String use_des_flag = "";

	/** 折美元 */
	private String usd_amt_flag = "";

	/** 国籍 */
	private String country_cd_flag = "";

	/** 交易方向 */
	private String tx_direct_flag = "";

	/** 对方银行名称 */
	private String opp_organname_flag = "";

	/** 收付标志 */
	private String receive_pay_cd_flag = "";

	/** 凭证代码 */
	private String token_no_flag = "";

	/** 业务标识 */
	private String transactionkey_value = "";

	/** 对方行号类型 */
	private String opp_organ_type_value = "";

	/** 对方行号 */
	private String opp_organkey_value = "";

	/** 对方名称 */
	private String opp_name_value = "";

	/** 对方账号 */
	private String opp_acct_num_value = "";

	/** 原币交易金额 */
	private String amt_value = "";

	/** 原币交易金额 */
	private String amt_val = "";

	/** 交易日期 */
	private String tx_dt_value = "";

	/** 我行客户号 */
	private String party_id_value = "";

	/** 我行帐号 */
	private String acct_num_value = "";

	/** 我行客户名称 */
	private String party_chn_name_value = "";

	/** 我行客户类型 */
	private String party_class_cd_value = "";

	/** 我行客户证件类型 */
	private String card_type_value = "";

	/** 我行客户证件号码 */
	private String card_no_value = "";

	/** 它行客户号 */
	private String opp_party_id_value = "";

	/** 它行客户类型 */
	private String opp_party_class_cd_value = "";

	/** 它行客户证件类型 */
	private String opp_Card_type_value = "";

	/** 它行客户证件号码 */
	private String opp_Card_no_value = "";

	/** 它行交易时间 */
	private String opp_tx_dt_value = "";

	/** 币种 */
	private String currency_cd_value = "";

	/** 用途 */
	private String use_des_value = "";

	/** 折美元 */
	private String usd_amt_value = "";

	/** 国籍 */
	private String country_cd_value = "";

	/** 交易方向 */
	private String tx_direct_value = "";

	/** 对方银行名称 */
	private String opp_organname_value = "";

	/** 收付标志 */
	private String receive_pay_cd_value = "";

	/** 凭证代码 */
	private String token_no_value = "";

	/** 原币交易金额 */
	private Double amt_max_value = null;

	/** 交易结束日期 */
	private String tx_enddt_disp = "";

	private String trans_field = "";

	private String interfacekey = "";

	private String modify_ind = "";

	private String default_val = "";

	// 排序
	private String orderby = "";

	private String order = "";

	/** 是否跨境标志显示 */
	private String overarea_ind_flag = "";

	/** 处理状态显示 */
	private String handle_status_cd_flag = "";

	/** 汇款标志显示 */
	private String remit_type_cd_flag = "";

	/** 对方账户类型 */
	private String opp_acct_type_cd_flag = "";

	/** 交易结束日期 */
	private String tx_enddt_search_disp = "";

	/** 交易结束日期 */
	private String tx_dt_search_disp = "";

	/** 交易金额 */
	private String amt_start_search = "";

	private String amt_end_search = "";

	/** 预警编号 */
	private String alertkey_search = "";

	// 现转
	private String cash_trans_flag_search_disp = "";

	/** 是否已补录 */
	private String addtional_search = "";

	// 借贷标志
	private String debit_credit_search_disp = "";

	/** 我行账户 */
	private String acct_num_search = "";

	/** 机构代码 */
	private String organkey_search = "";

	/** 我行客户号 */
	private String party_id_search = "";
	
	/** 传票号 */
	private String voucher_no="";
	
	private String opp_pbc_party_class_cd="";
	
	private String tx_today_disp="";
	private Date tx_today=null;

	private String alert_type = "";
	private String alert_status_cd = "";
    private String alert_status_cd_disp = "";
    private String rulekey_disp = "";
    private String organ_disp = "";
	
	// 开户时间
	private Date open_dt = null;
	private String open_dt_disp = "";
	private Date close_dt = null;
	private String close_dt_disp = "";
	

	String isInnerOrganCode = "";
	String opp_isInnerOrganCode = "";
	
	private String appid = "";
	// 验证状态
	private String validate_ind = "";
	private String validate_ind2 = "";
	private String validateflag="";
	private String validate_ind_disp = "";	
	private String settle_type_cd_v = "";	
	private String tx_occur_v = "";	
	private String tx_go_v = "";	
	private String opp_area_v = "";	
	//交易渠道
	private String channel="";
	
	//预警查询的历史和当前查询
	private String alertsearchtime = "";
	
	//预警信息的出处
	private String orig_table = "";
	
	//证件类型明细
	private String card_inf="";	
	private String opp_card_inf="";
	
	//预警交易处理状态 1:处理中  2：已审批 4：已排除
	private String status_cd = "";
	private String status_cd_disp = "";
	
	// add by liulb 10.14 for shyh
	private String openOrganname = "";
	
	private String stcrkey = "";//交易特征代码
	
	/** 筛选标志：0：NULL  1：大额筛选  2：可疑筛选  3：大额筛选-可疑筛选*/
	private String validate_flag = "";
	private String validate_flag_disp = "";
	
	//交易当前/历史
	private String trans_table="";
	//判定该交易来自当前表还是历史表：add by lijie
	private String trans_searchtime = "";
	
	private String union_organ = "";//机构行政区划对应码
	
	/** 特征代码 */
	private String stcr = "";
	
	private String is_recordflag ="";
	
	public String getIs_recordflag() {
		return is_recordflag;
	}

	public void setIs_recordflag(String isRecordflag) {
		is_recordflag = isRecordflag;
	}

	public String getApp_state_cd() {
		return app_state_cd;
	}

	public void setApp_state_cd(String appStateCd) {
		app_state_cd = appStateCd;
	}

	
	public String getOpenOrganname() {
		return openOrganname;
	}

	public void setOpenOrganname(String openOrganname) {
		this.openOrganname = openOrganname;
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

	public String getVoucher_no() {
		return voucher_no;
	}

	public void setVoucher_no(String voucher_no) {
		this.voucher_no = voucher_no;
	}

	/**
	 * @return re_ind_search
	 */
	public String getRe_ind_search() {
		return re_ind_search;
	}

	/**
	 * @param re_ind_search
	 *            要设置的 re_ind_search
	 */
	public void setRe_ind_search(String re_ind_search) {
		this.re_ind_search = re_ind_search;
	}
   
	/**
	 * @return acct_num_search
	 */
	public String getAcct_num_search() {
		return acct_num_search;
	}

	/**
	 * @param acct_num_search
	 *            要设置的 acct_num_search
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
	 * @param addtional_search
	 *            要设置的 addtional_search
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
	 * @param alertkey_search
	 *            要设置的 alertkey_search
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
	 * @param amt_end_search
	 *            要设置的 amt_end_search
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
	 * @param amt_start_search
	 *            要设置的 amt_start_search
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
	 * @param cash_trans_flag_search_disp
	 *            要设置的 cash_trans_flag_search_disp
	 */
	public void setCash_trans_flag_search_disp(
			String cash_trans_flag_search_disp) {
		this.cash_trans_flag_search_disp = cash_trans_flag_search_disp;
	}

	/**
	 * @return debit_credit_search_disp
	 */
	public String getDebit_credit_search_disp() {
		return debit_credit_search_disp;
	}

	/**
	 * @param debit_credit_search_disp
	 *            要设置的 debit_credit_search_disp
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
	 * @param organkey_search
	 *            要设置的 organkey_search
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
	 * @param party_id_search
	 *            要设置的 party_id_search
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
	 * @param tx_dt_search_disp
	 *            要设置的 tx_dt_search_disp
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
	 * @param tx_enddt_search_disp
	 *            要设置的 tx_enddt_search_disp
	 */
	public void setTx_enddt_search_disp(String tx_enddt_search_disp) {
		this.tx_enddt_search_disp = tx_enddt_search_disp;
	}

	/**
	 * 构造函数
	 */
	public T47_transaction() {
	}

	public void setUse_des(String use_desStr) {
		this.use_des = use_desStr;
	}

	public String getUse_des() {
		return this.use_des;
	}

	public void setOpp_acct_type_cd(String opp_acct_type_cdStr) {
		this.opp_acct_type_cd = opp_acct_type_cdStr;
	}

	public String getOpp_acct_type_cd() {
		return this.opp_acct_type_cd;
	}

	public void setTx_type_cd(String tx_type_cdStr) {
		this.tx_type_cd = tx_type_cdStr;
	}

	public String getTx_type_cd() {
		return this.tx_type_cd;
	}

	public void setOverarea_ind(String overarea_indStr) {
		this.overarea_ind = overarea_indStr;
	}

	public String getOverarea_ind() {
		return this.overarea_ind;
	}

	public void setTx_no(String tx_noStr) {
		this.tx_no = tx_noStr;
	}

	public String getTx_no() {
		return this.tx_no;
	}

	public void setBus_type_cd(String bus_type_cdStr) {
		this.bus_type_cd = bus_type_cdStr;
	}

	public String getBus_type_cd() {
		return this.bus_type_cd;
	}

	public void setOpp_area(String opp_areaStr) {
		this.opp_area = opp_areaStr;
	}

	public String getOpp_area() {
		return this.opp_area;
	}

	public void setSettle_type_cd(String settle_type_cdStr) {
		this.settle_type_cd = settle_type_cdStr;
	}

	public String getSettle_type_cd() {
		return this.settle_type_cd;
	}

	public void setTx_cd(String tx_cdStr) {
		this.tx_cd = tx_cdStr;
	}

	public String getTx_cd() {
		return this.tx_cd;
	}

	public void setDt_time(Date dt_timeStr) {
		this.dt_time = dt_timeStr;
	}

	public Date getDt_time() {
		return this.dt_time;
	}

	public void setCb_pk(String cb_pkStr) {
		this.cb_pk = cb_pkStr;
	}

	public String getCb_pk() {
		return this.cb_pk;
	}

	public void setSubjectno(String subjectnoStr) {
		this.subjectno = subjectnoStr;
	}

	public String getSubjectno() {
		return this.subjectno;
	}

	public void setOpp_organkey(String opp_organkeyStr) {
		this.opp_organkey = opp_organkeyStr;
	}

	public String getOpp_organkey() {
		return this.opp_organkey;
	}

	public void setCurrency_cd(String currency_cdStr) {
		this.currency_cd = currency_cdStr;
	}

	public String getCurrency_cd() {
		return this.currency_cd;
	}

	public void setTx_dt(Date tx_dtStr) {
		this.tx_dt = tx_dtStr;
	}

	public Date getTx_dt() {
		return this.tx_dt;
	}

	public void setRe_ind(String re_indStr) {
		this.re_ind = re_indStr;
	}

	public String getRe_ind() {
		return this.re_ind;
	}

	public void setOpp_card_type(String opp_card_typeStr) {
		this.opp_card_type = opp_card_typeStr;
	}

	public String getOpp_card_type() {
		return this.opp_card_type;
	}

	public void setOpp_organ_type(String opp_organ_typeStr) {
		this.opp_organ_type = opp_organ_typeStr;
	}

	public String getOpp_organ_type() {
		return this.opp_organ_type;
	}

	public void setParty_chn_name(String party_chn_nameStr) {
		this.party_chn_name = party_chn_nameStr;
	}

	public String getParty_chn_name() {
		return this.party_chn_name;
	}

	public void setOpp_card_no(String opp_card_noStr) {
		this.opp_card_no = opp_card_noStr;
	}

	public String getOpp_card_no() {
		return this.opp_card_no;
	}

	public void setOpp_party_id(String opp_party_idStr) {
		this.opp_party_id = opp_party_idStr;
	}

	public String getOpp_party_id() {
		return this.opp_party_id;
	}

	public void setOpp_tx_dt(Date opp_tx_dtStr) {
		this.opp_tx_dt = opp_tx_dtStr;
	}

	public Date getOpp_tx_dt() {
		return this.opp_tx_dt;
	}

	public void setOpp_name(String opp_nameStr) {
		this.opp_name = opp_nameStr;
	}

	public String getOpp_name() {
		return this.opp_name;
	}

	public void setAcct_num(String acct_numStr) {
		this.acct_num = acct_numStr;
	}

	public String getAcct_num() {
		return this.acct_num;
	}

	public void setOpp_acct_num(String opp_acct_numStr) {
		this.opp_acct_num = opp_acct_numStr;
	}

	public String getOpp_acct_num() {
		return this.opp_acct_num;
	}

	/**
	 * @return the amt
	 */
	public Double getAmt() {
		return amt;
	}

	/**
	 * @param amt
	 *            the amt to set
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
	 * @param cny_amt
	 *            the cny_amt to set
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
	 * @param cny_amtDisp
	 *            the cny_amtDisp to set
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
	 * @param cny_amtEnd
	 *            the cny_amtEnd to set
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
	 * @param cny_amtEndDisp
	 *            the cny_amtEndDisp to set
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
	 * @param usd_amt
	 *            the usd_amt to set
	 */
	public void setUsd_amt(Double usd_amt) {
		this.usd_amt = usd_amt;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setHandle_status_cd(String handle_status_cdStr) {
		this.handle_status_cd = handle_status_cdStr;
	}

	public String getHandle_status_cd() {
		return this.handle_status_cd;
	}

	public void setOpp_sys_id(String opp_sys_idStr) {
		this.opp_sys_id = opp_sys_idStr;
	}

	public String getOpp_sys_id() {
		return this.opp_sys_id;
	}

	public void setReceive_pay_cd(String receive_pay_cdStr) {
		this.receive_pay_cd = receive_pay_cdStr;
	}

	public String getReceive_pay_cd() {
		return this.receive_pay_cd;
	}

	public void setTeller(String tellerStr) {
		this.teller = tellerStr;
	}

	public String getTeller() {
		return this.teller;
	}

	public void setBatch_ind(String batch_indStr) {
		this.batch_ind = batch_indStr;
	}

	public String getBatch_ind() {
		return this.batch_ind;
	}

	public void setOrgankey(String organkeyStr) {
		this.organkey = organkeyStr;
	}

	public String getOrgankey() {
		return this.organkey;
	}

	public void setDebit_credit(String debit_creditStr) {
		this.debit_credit = debit_creditStr;
	}

	/**
	 * edit by liulb 2006.1.4 根据码表获取借贷标识描述{‘借’，‘贷’}
	 * 
	 * @return
	 */
	public String getDebit_credit() {
		return debit_credit;
	}

	public void setCb_tx_cd(String cb_tx_cdStr) {
		this.cb_tx_cd = cb_tx_cdStr;
	}

	public String getCb_tx_cd() {
		return this.cb_tx_cd;
	}

	public void setParty_class_cd(String party_class_cdStr) {
		this.party_class_cd = party_class_cdStr;
	}

	public String getParty_class_cd() {
		return this.party_class_cd;
	}

	public void setTransactionkey(String transactionkeyStr) {
		this.transactionkey = transactionkeyStr;
	}

	public String getTransactionkey() {
		return this.transactionkey;
	}

	public void setRemit_type_cd(String remit_type_cdStr) {
		this.remit_type_cd = remit_type_cdStr;
	}

	public String getRemit_type_cd() {
		return this.remit_type_cd;
	}

	public void setDes(String desStr) {
		this.des = desStr;
	}

	public String getDes() {
		return this.des;
	}

	// =======================================================
	public void setDt_time_disp(String dt_time_dispStr) {
		this.dt_time_disp = dt_time_dispStr;
	}

	public String getDt_time_disp() {
		return this.dt_time_disp;
	}

	public void setTx_dt_disp(String tx_dt_dispStr) {
		this.tx_dt_disp = tx_dt_dispStr;
	}

	public String getTx_dt_disp() {
		return this.tx_dt_disp;
	}

	public void setTx_dtEnd(Date tx_dtEnd) {
		this.tx_dtEnd = tx_dtEnd;
	}

	public Date getTx_dtEnd() {
		return this.tx_dtEnd;
	}

	public void setTx_dtEndDisp(String tx_dtEndDisp) {
		this.tx_dtEndDisp = tx_dtEndDisp;
	}

	public String getTx_dtEndDisp() {
		return this.tx_dtEndDisp;
	}

	public void setOpp_tx_dt_disp(String opp_tx_dt_dispStr) {
		this.opp_tx_dt_disp = opp_tx_dt_dispStr;
	}

	public String getOpp_tx_dt_disp() {
		return this.opp_tx_dt_disp;
	}

	public ArrayList getList() {
		return list;
	}

	public void setList(ArrayList list) {
		this.list = list;
	}

	public String getDebit_credit_disp() {
		// CatchManager cm = CatchManager.getInstance();
		// TreeMap trackFlagMap = cm.getColumnCatch("trackflag", true);
		// debit_credit_disp = (String)trackFlagMap.get(this.debit_credit);
		return debit_credit_disp;
	}

	public void setDebit_credit_disp(String debit_credit_disp) {
		this.debit_credit_disp = debit_credit_disp;
	}

	public String getRe_ind_disp() {
		return re_ind_disp;
	}

	public void setRe_ind_disp(String re_ind_disp) {
		this.re_ind_disp = re_ind_disp;
	}

	public String getOpp_acct_num_flag() {
		return opp_acct_num_flag;
	}

	public void setOpp_acct_num_flag(String opp_acct_num_flag) {
		this.opp_acct_num_flag = opp_acct_num_flag;
	}

	public String getOpp_name_flag() {
		return opp_name_flag;
	}

	public void setOpp_name_flag(String opp_name_flag) {
		this.opp_name_flag = opp_name_flag;
	}

	public String getOpp_organ_type_flag() {
		return opp_organ_type_flag;
	}

	public void setOpp_organ_type_flag(String opp_organ_type_flag) {
		this.opp_organ_type_flag = opp_organ_type_flag;
	}

	public String getOpp_organkey_flag() {
		return opp_organkey_flag;
	}

	public void setOpp_organkey_flag(String opp_organkey_flag) {
		this.opp_organkey_flag = opp_organkey_flag;
	}

	public String getAmt_flag() {
		return amt_flag;
	}

	public void setAmt_flag(String amt_flag) {
		this.amt_flag = amt_flag;
	}

	public String getAlertkey() {
		return alertkey;
	}

	public void setAlertkey(String alertkey) {
		this.alertkey = alertkey;
	}

	public String getTrans_field() {
		return trans_field;
	}

	public void setTrans_field(String trans_field) {
		this.trans_field = trans_field;
	}

	public String getInterfacekey() {
		return interfacekey;
	}

	public void setInterfacekey(String interfacekey) {
		this.interfacekey = interfacekey;
	}

	public String getDefault_val() {
		return default_val;
	}

	public void setDefault_val(String default_val) {
		this.default_val = default_val;
	}

	public String getModify_ind() {
		return modify_ind;
	}

	public void setModify_ind(String modify_ind) {
		this.modify_ind = modify_ind;
	}

	public String getAmt_value() {
		return amt_value;
	}

	public void setAmt_value(String amt_value) {
		this.amt_value = amt_value;
	}

	public String getOpp_acct_num_value() {
		return opp_acct_num_value;
	}

	public void setOpp_acct_num_value(String opp_acct_num_value) {
		this.opp_acct_num_value = opp_acct_num_value;
	}

	public String getOpp_name_value() {
		return opp_name_value;
	}

	public void setOpp_name_value(String opp_name_value) {
		this.opp_name_value = opp_name_value;
	}

	public String getOpp_organ_type_value() {
		return opp_organ_type_value;
	}

	public void setOpp_organ_type_value(String opp_organ_type_value) {
		this.opp_organ_type_value = opp_organ_type_value;
	}

	public String getOpp_organkey_value() {
		return opp_organkey_value;
	}

	public void setOpp_organkey_value(String opp_organkey_value) {
		this.opp_organkey_value = opp_organkey_value;
	}

	public String getCash_trans_flag_disp() {
		return cash_trans_flag_disp;
	}

	public void setCash_trans_flag_disp(String cash_trans_flag_disp) {
		this.cash_trans_flag_disp = cash_trans_flag_disp;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
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

	public String getUnionorgkey() {
		return unionorgkey;
	}

	public void setUnionorgkey(String unionorgkey) {
		this.unionorgkey = unionorgkey;
	}

	public String getParty_id_flag() {
		return party_id_flag;
	}

	public void setParty_id_flag(String party_id_flag) {
		this.party_id_flag = party_id_flag;
	}

	public String getAcct_num_flag() {
		return acct_num_flag;
	}

	public void setAcct_num_flag(String acct_num_flag) {
		this.acct_num_flag = acct_num_flag;
	}

	public String getAcct_num_value() {
		return acct_num_value;
	}

	public void setAcct_num_value(String acct_num_value) {
		this.acct_num_value = acct_num_value;
	}

	public String getCard_no_flag() {
		return card_no_flag;
	}

	public void setCard_no_flag(String card_no_flag) {
		this.card_no_flag = card_no_flag;
	}

	public String getCard_no_value() {
		return card_no_value;
	}

	public void setCard_no_value(String card_no_value) {
		this.card_no_value = card_no_value;
	}

	public String getCard_type_flag() {
		return card_type_flag;
	}

	public void setCard_type_flag(String card_type_flag) {
		this.card_type_flag = card_type_flag;
	}

	public String getCard_type_value() {
		return card_type_value;
	}

	public void setCard_type_value(String card_type_value) {
		this.card_type_value = card_type_value;
	}

	public String getCurrency_cd_flag() {
		return currency_cd_flag;
	}

	public void setCurrency_cd_flag(String currency_cd_flag) {
		this.currency_cd_flag = currency_cd_flag;
	}

	public String getCurrency_cd_value() {
		return currency_cd_value;
	}

	public void setCurrency_cd_value(String currency_cd_value) {
		this.currency_cd_value = currency_cd_value;
	}

	public String getOpp_party_id_flag() {
		return opp_party_id_flag;
	}

	public void setOpp_party_id_flag(String opp_party_id_flag) {
		this.opp_party_id_flag = opp_party_id_flag;
	}

	public String getOpp_party_id_value() {
		return opp_party_id_value;
	}

	public void setOpp_party_id_value(String opp_party_id_value) {
		this.opp_party_id_value = opp_party_id_value;
	}

	public String getOpp_tx_dt_flag() {
		return opp_tx_dt_flag;
	}

	public void setOpp_tx_dt_flag(String opp_tx_dt_flag) {
		this.opp_tx_dt_flag = opp_tx_dt_flag;
	}

	public String getOpp_tx_dt_value() {
		return opp_tx_dt_value;
	}

	public void setOpp_tx_dt_value(String opp_tx_dt_value) {
		this.opp_tx_dt_value = opp_tx_dt_value;
	}

	public String getParty_chn_name_flag() {
		return party_chn_name_flag;
	}

	public void setParty_chn_name_flag(String party_chn_name_flag) {
		this.party_chn_name_flag = party_chn_name_flag;
	}

	public String getParty_chn_name_value() {
		return party_chn_name_value;
	}

	public void setParty_chn_name_value(String party_chn_name_value) {
		this.party_chn_name_value = party_chn_name_value;
	}

	public String getParty_class_cd_flag() {
		return party_class_cd_flag;
	}

	public void setParty_class_cd_flag(String party_class_cd_flag) {
		this.party_class_cd_flag = party_class_cd_flag;
	}

	public String getParty_class_cd_value() {
		return party_class_cd_value;
	}

	public void setParty_class_cd_value(String party_class_cd_value) {
		this.party_class_cd_value = party_class_cd_value;
	}

	public String getUse_des_flag() {
		return use_des_flag;
	}

	public void setUse_des_flag(String use_des_flag) {
		this.use_des_flag = use_des_flag;
	}

	public String getUse_des_value() {
		return use_des_value;
	}

	public void setUse_des_value(String use_des_value) {
		this.use_des_value = use_des_value;
	}

	public String getParty_id_value() {
		return party_id_value;
	}

	public void setParty_id_value(String party_id_value) {
		this.party_id_value = party_id_value;
	}

	public String getTx_dt_flag() {
		return tx_dt_flag;
	}

	public void setTx_dt_flag(String tx_dt_flag) {
		this.tx_dt_flag = tx_dt_flag;
	}

	public String getTx_dt_value() {
		return tx_dt_value;
	}

	public void setTx_dt_value(String tx_dt_value) {
		this.tx_dt_value = tx_dt_value;
	}

	public String getOpp_Card_no_flag() {
		return opp_Card_no_flag;
	}

	public void setOpp_Card_no_flag(String opp_Card_no_flag) {
		this.opp_Card_no_flag = opp_Card_no_flag;
	}

	public String getOpp_Card_no_value() {
		return opp_Card_no_value;
	}

	public void setOpp_Card_no_value(String opp_Card_no_value) {
		this.opp_Card_no_value = opp_Card_no_value;
	}

	public String getOpp_Card_type_flag() {
		return opp_Card_type_flag;
	}

	public void setOpp_Card_type_flag(String opp_Card_type_flag) {
		this.opp_Card_type_flag = opp_Card_type_flag;
	}

	public String getOpp_Card_type_value() {
		return opp_Card_type_value;
	}

	public void setOpp_Card_type_value(String opp_Card_type_value) {
		this.opp_Card_type_value = opp_Card_type_value;
	}

	public String getOpp_party_class_cd() {
		return opp_party_class_cd;
	}

	public void setOpp_party_class_cd(String opp_party_class_cd) {
		this.opp_party_class_cd = opp_party_class_cd;
	}

	public String getOpp_party_class_cd_falg() {
		return opp_party_class_cd_falg;
	}

	public void setOpp_party_class_cd_falg(String opp_party_class_cd_falg) {
		this.opp_party_class_cd_falg = opp_party_class_cd_falg;
	}

	public String getOpp_party_class_cd_value() {
		return opp_party_class_cd_value;
	}

	public void setOpp_party_class_cd_value(String opp_party_class_cd_value) {
		this.opp_party_class_cd_value = opp_party_class_cd_value;
	}

	public String getApplication_num() {
		return application_num;
	}

	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}

	public String getCountry_cd_flag() {
		return country_cd_flag;
	}

	public void setCountry_cd_flag(String country_cd_flag) {
		this.country_cd_flag = country_cd_flag;
	}

	public String getCountry_cd_value() {
		return country_cd_value;
	}

	public void setCountry_cd_value(String country_cd_value) {
		this.country_cd_value = country_cd_value;
	}

	public String getUsd_amt_flag() {
		return usd_amt_flag;
	}

	public void setUsd_amt_flag(String usd_amt_flag) {
		this.usd_amt_flag = usd_amt_flag;
	}

	public String getUsd_amt_value() {
		return usd_amt_value;
	}

	public void setUsd_amt_value(String usd_amt_value) {
		this.usd_amt_value = usd_amt_value;
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

	public String getOpp_organname_flag() {
		return opp_organname_flag;
	}

	public void setOpp_organname_flag(String opp_organname_flag) {
		this.opp_organname_flag = opp_organname_flag;
	}

	public String getTx_direct_flag() {
		return tx_direct_flag;
	}

	public void setTx_direct_flag(String tx_direct_flag) {
		this.tx_direct_flag = tx_direct_flag;
	}

	public String getOpp_organname_value() {
		return opp_organname_value;
	}

	public void setOpp_organname_value(String opp_organname_value) {
		this.opp_organname_value = opp_organname_value;
	}

	public String getTx_direct_value() {
		return tx_direct_value;
	}

	public void setTx_direct_value(String tx_direct_value) {
		this.tx_direct_value = tx_direct_value;
	}

	public String getReceive_pay_cd_flag() {
		return receive_pay_cd_flag;
	}

	public void setReceive_pay_cd_flag(String receive_pay_cd_flag) {
		this.receive_pay_cd_flag = receive_pay_cd_flag;
	}

	public String getReceive_pay_cd_value() {
		return receive_pay_cd_value;
	}

	public void setReceive_pay_cd_value(String receive_pay_cd_value) {
		this.receive_pay_cd_value = receive_pay_cd_value;
	}

	public String getTransactionkey_flag() {
		return transactionkey_flag;
	}

	public void setTransactionkey_flag(String transactionkey_flag) {
		this.transactionkey_flag = transactionkey_flag;
	}

	public String getTransactionkey_value() {
		return transactionkey_value;
	}

	public void setTransactionkey_value(String transactionkey_value) {
		this.transactionkey_value = transactionkey_value;
	}

	public String getCash_trans_flag() {
		return cash_trans_flag;
	}

	public void setCash_trans_flag(String cash_trans_flag) {
		this.cash_trans_flag = cash_trans_flag;
	}

	public String getToken_no() {
		return token_no;
	}

	public void setToken_no(String token_no) {
		this.token_no = token_no;
	}

	public String getToken_no_flag() {
		return token_no_flag;
	}

	public void setToken_no_flag(String token_no_flag) {
		this.token_no_flag = token_no_flag;
	}

	public String getToken_no_value() {
		return token_no_value;
	}

	public void setToken_no_value(String token_no_value) {
		this.token_no_value = token_no_value;
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

	/* add by aixq start */
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

	/* add by aixq end */
	/**
	 * @return amt_max_value
	 */
	public Double getAmt_max_value() {
		return amt_max_value;
	}

	/**
	 * @param amt_max_value
	 *            要设置的 amt_max_value
	 */
	public void setAmt_max_value(Double amt_max_value) {
		this.amt_max_value = amt_max_value;
	}

	/**
	 * @return tx_enddt_disp
	 */
	public String getTx_enddt_disp() {
		return tx_enddt_disp;
	}

	/**
	 * @param tx_enddt_disp
	 *            要设置的 tx_enddt_disp
	 */
	public void setTx_enddt_disp(String tx_enddt_disp) {
		this.tx_enddt_disp = tx_enddt_disp;
	}

	/**
	 * @return order
	 */
	public String getOrder() {
		return order;
	}

	/**
	 * @param order
	 *            要设置的 order
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
	 * @param orderby
	 *            要设置的 orderby
	 */
	public void setOrderby(String orderby) {
		this.orderby = orderby;
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

	public String getOrgankeystr() {
		return organkeystr;
	}

	public void setOrgankeystr(String organkeystr) {
		this.organkeystr = organkeystr;
	}

	public Date getTx_dt_end() {
		return tx_dt_end;
	}

	public void setTx_dt_end(Date tx_dt_end) {
		this.tx_dt_end = tx_dt_end;
	}

	public Date getTx_dt_start() {
		return tx_dt_start;
	}

	public void setTx_dt_start(Date tx_dt_start) {
		this.tx_dt_start = tx_dt_start;
	}

	/**
	 * @return searchtype
	 */
	public String getSearchtype() {
		return searchtype;
	}

	/**
	 * @param searchtype
	 *            要设置的 searchtype
	 */
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}

	/**
	 * @return overarea_ind_flag
	 */
	public String getOverarea_ind_flag() {
		return overarea_ind_flag;
	}

	/**
	 * @param overarea_ind_flag
	 *            要设置的 overarea_ind_flag
	 */
	public void setOverarea_ind_flag(String overarea_ind_flag) {
		this.overarea_ind_flag = overarea_ind_flag;
	}

	/**
	 * @return handle_status_cd_flag
	 */
	public String getHandle_status_cd_flag() {
		return handle_status_cd_flag;
	}

	/**
	 * @param handle_status_cd_flag
	 *            要设置的 handle_status_cd_flag
	 */
	public void setHandle_status_cd_flag(String handle_status_cd_flag) {
		this.handle_status_cd_flag = handle_status_cd_flag;
	}

	/**
	 * @return remit_type_cd_flag
	 */
	public String getRemit_type_cd_flag() {
		return remit_type_cd_flag;
	}

	/**
	 * @param remit_type_cd_flag
	 *            要设置的 remit_type_cd_flag
	 */
	public void setRemit_type_cd_flag(String remit_type_cd_flag) {
		this.remit_type_cd_flag = remit_type_cd_flag;
	}

	/**
	 * @return opp_acct_type_cd_flag
	 */
	public String getOpp_acct_type_cd_flag() {
		return opp_acct_type_cd_flag;
	}

	/**
	 * @param opp_acct_type_cd_flag
	 *            要设置的 opp_acct_type_cd_flag
	 */
	public void setOpp_acct_type_cd_flag(String opp_acct_type_cd_flag) {
		this.opp_acct_type_cd_flag = opp_acct_type_cd_flag;
	}

	public String getCard_type_disp() {
		return card_type_disp;
	}

	public void setCard_type_disp(String card_type_disp) {
		this.card_type_disp = card_type_disp;
	}

	public String getOpp_card_type_disp() {
		return opp_card_type_disp;
	}

	public void setOpp_card_type_disp(String opp_card_type_disp) {
		this.opp_card_type_disp = opp_card_type_disp;
	}

	public String getOpp_party_class_cd_disp() {
		return opp_party_class_cd_disp;
	}

	public void setOpp_party_class_cd_disp(String opp_party_class_cd_disp) {
		this.opp_party_class_cd_disp = opp_party_class_cd_disp;
	}

	public String getParty_class_cd_disp() {
		return party_class_cd_disp;
	}

	public void setParty_class_cd_disp(String party_class_cd_disp) {
		this.party_class_cd_disp = party_class_cd_disp;
	}

	public String getParty_id1() {
		return party_id1;
	}

	public void setParty_id1(String party_id1) {
		this.party_id1 = party_id1;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return tx_dt_end_disp
	 */
	public String getTx_dt_end_disp() {
		return tx_dt_end_disp;
	}

	/**
	 * @param tx_dt_end_disp
	 *            要设置的 tx_dt_end_disp
	 */
	public void setTx_dt_end_disp(String tx_dt_end_disp) {
		this.tx_dt_end_disp = tx_dt_end_disp;
	}

	/**
	 * @return tx_dt_start_disp
	 */
	public String getTx_dt_start_disp() {
		return tx_dt_start_disp;
	}

	/**
	 * @param tx_dt_start_disp
	 *            要设置的 tx_dt_start_disp
	 */
	public void setTx_dt_start_disp(String tx_dt_start_disp) {
		this.tx_dt_start_disp = tx_dt_start_disp;
	}

	/**
	 * @return tx_enddt
	 */
	public Date getTx_enddt() {
		return tx_enddt;
	}

	/**
	 * @param tx_enddt
	 *            要设置的 tx_enddt
	 */
	public void setTx_enddt(Date tx_enddt) {
		this.tx_enddt = tx_enddt;
	}

	/**
	 * @return checkedt47
	 */
	public String getCheckedt47() {
		return checkedt47;
	}

	/**
	 * @param checkedt47
	 *            要设置的 checkedt47
	 */
	public void setCheckedt47(String checkedt47) {
		this.checkedt47 = checkedt47;
	}

	public String getAcct_type_string() {
		return acct_type_string;
	}

	public void setAcct_type_string(String acct_type_string) {
		this.acct_type_string = acct_type_string;
	}

	public String getSubjectname() {
		return subjectname;
	}

	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}

	public String getBatch_ind_flag() {
		return batch_ind_flag;
	}

	public void setBatch_ind_flag(String batch_ind_flag) {
		this.batch_ind_flag = batch_ind_flag;
	}

	public String getCb_tx_cd_name() {
		return cb_tx_cd_name;
	}

	public void setCb_tx_cd_name(String cb_tx_cd_name) {
		this.cb_tx_cd_name = cb_tx_cd_name;
	}

	public String getTeller_disp() {
		return teller_disp;
	}

	public void setTeller_disp(String teller_disp) {
		this.teller_disp = teller_disp;
	}

	public String getCancel_ind() {
		return cancel_ind;
	}

	public void setCancel_ind(String cancel_ind) {
		this.cancel_ind = cancel_ind;
	}

	public String getCancel_ind_disp() {
		return cancel_ind_disp;
	}

	public void setCancel_ind_disp(String cancel_ind_disp) {
		this.cancel_ind_disp = cancel_ind_disp;
	}

	public String getOpp_isparty() {
		return opp_isparty;
	}

	public void setOpp_isparty(String opp_isparty) {
		this.opp_isparty = opp_isparty;
	}

	public String getOpp_isparty_flag() {
		return opp_isparty_flag;
	}

	public void setOpp_isparty_flag(String opp_isparty_flag) {
		this.opp_isparty_flag = opp_isparty_flag;
	}

	public String getAmt_string() {
		return amt_string;
	}

	public void setAmt_string(String amt_string) {
		this.amt_string = amt_string;
	}

	public String getCny_amt_string() {
		return cny_amt_string;
	}

	public void setCny_amt_string(String cny_amt_string) {
		this.cny_amt_string = cny_amt_string;
	}

	public String getUsd_amt_string() {
		return usd_amt_string;
	}

	public void setUsd_amt_string(String usd_amt_string) {
		this.usd_amt_string = usd_amt_string;
	}

	public String getAmt_val() {
		return amt_val;
	}

	public void setAmt_val(String amt_val) {
		this.amt_val = amt_val;
	}

	public String getAmt_cd() {
		return amt_cd;
	}

	public void setAmt_cd(String amt_cd) {
		this.amt_cd = amt_cd;
	}

	public String getOpp_acct_type_cd_string() {
		return opp_acct_type_cd_string;
	}

	public void setOpp_acct_type_cd_string(String opp_acct_type_cd_string) {
		this.opp_acct_type_cd_string = opp_acct_type_cd_string;
	}

	public String getCurr_cd() {
		return curr_cd;
	}

	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}

	public String getAmt_disp() {
		return amt_disp;
	}

	public void setAmt_disp(String amt_disp) {
		this.amt_disp = amt_disp;
	}

	public String getDebit_credit_flag() {
		return debit_credit_flag;
	}

	public void setDebit_credit_flag(String debit_credit_flag) {
		this.debit_credit_flag = debit_credit_flag;
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

	public String getOpp_coutry() {
		return opp_coutry;
	}

	public void setOpp_coutry(String opp_coutry) {
		this.opp_coutry = opp_coutry;
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

	
	
	public String getAgent_country_flag() {
		return agent_country_flag;
	}

	public void setAgent_country_flag(String agent_country_flag) {
		this.agent_country_flag = agent_country_flag;
	}

	public String getAgent_name_flag() {
		return agent_name_flag;
	}

	public void setAgent_name_flag(String agent_name_flag) {
		this.agent_name_flag = agent_name_flag;
	}

	public String getOrg_trans_rela_flag() {
		return org_trans_rela_flag;
	}

	public void setOrg_trans_rela_flag(String org_trans_rela_flag) {
		this.org_trans_rela_flag = org_trans_rela_flag;
	}

	public String getTsctkey_flag() {
		return tsctkey_flag;
	}

	public void setTsctkey_flag(String tsctkey_flag) {
		this.tsctkey_flag = tsctkey_flag;
	}

	public String getTx_go_area_flag() {
		return tx_go_area_flag;
	}

	public void setTx_go_area_flag(String tx_go_area_flag) {
		this.tx_go_area_flag = tx_go_area_flag;
	}

	public String getTx_go_country_flag() {
		return tx_go_country_flag;
	}

	public void setTx_go_country_flag(String tx_go_country_flag) {
		this.tx_go_country_flag = tx_go_country_flag;
	}

	public String getTx_occur_area_flag() {
		return tx_occur_area_flag;
	}

	public void setTx_occur_area_flag(String tx_occur_area_flag) {
		this.tx_occur_area_flag = tx_occur_area_flag;
	}

	public String getTx_occur_country_flag() {
		return tx_occur_country_flag;
	}

	public void setTx_occur_country_flag(String tx_occur_country_flag) {
		this.tx_occur_country_flag = tx_occur_country_flag;
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

	public String getTsctname() {
		return tsctname;
	}

	public void setTsctname(String tsctname) {
		this.tsctname = tsctname;
	}

	public String getTsctname2() {
		return tsctname2;
	}

	public void setTsctname2(String tsctname2) {
		this.tsctname2 = tsctname2;
	}

	public String getTsctname3() {
		return tsctname3;
	}

	public void setTsctname3(String tsctname3) {
		this.tsctname3 = tsctname3;
	}

	public String getSettle_type_cd_flag() {
		return settle_type_cd_flag;
	}

	public void setSettle_type_cd_flag(String settle_type_cd_flag) {
		this.settle_type_cd_flag = settle_type_cd_flag;
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

	public String getTx_go_area2name() {
		return tx_go_area2name;
	}

	public void setTx_go_area2name(String tx_go_area2name) {
		this.tx_go_area2name = tx_go_area2name;
	}

	public String getTx_go_areaname() {
		return tx_go_areaname;
	}

	public void setTx_go_areaname(String tx_go_areaname) {
		this.tx_go_areaname = tx_go_areaname;
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

	public String getTx_occur_area2name() {
		return tx_occur_area2name;
	}

	public void setTx_occur_area2name(String tx_occur_area2name) {
		this.tx_occur_area2name = tx_occur_area2name;
	}

	public String getTx_occur_areaname() {
		return tx_occur_areaname;
	}

	public void setTx_occur_areaname(String tx_occur_areaname) {
		this.tx_occur_areaname = tx_occur_areaname;
	}

	public String getAgent_card_no() {
		return agent_card_no;
	}

	public void setAgent_card_no(String agent_card_no) {
		this.agent_card_no = agent_card_no;
	}

	public String getAgent_card_no_flag() {
		return agent_card_no_flag;
	}

	public void setAgent_card_no_flag(String agent_card_no_flag) {
		this.agent_card_no_flag = agent_card_no_flag;
	}

	public String getAgent_card_type() {
		return agent_card_type;
	}

	public void setAgent_card_type(String agent_card_type) {
		this.agent_card_type = agent_card_type;
	}

	public String getAgent_card_type_flag() {
		return agent_card_type_flag;
	}

	public void setAgent_card_type_flag(String agent_card_type_flag) {
		this.agent_card_type_flag = agent_card_type_flag;
	}

	public String getCash_ind() {
		return cash_ind;
	}

	public void setCash_ind(String cash_ind) {
		this.cash_ind = cash_ind;
	}

	public String getCash_ind_disp() {
		return cash_ind_disp;
	}

	public void setCash_ind_disp(String cash_ind_disp) {
		this.cash_ind_disp = cash_ind_disp;
	}

	public String getCash_ind_flag() {
		return cash_ind_flag;
	}

	public void setCash_ind_flag(String cash_ind_flag) {
		this.cash_ind_flag = cash_ind_flag;
	}

	public String getHost_cust_id_flag() {
		return host_cust_id_flag;
	}

	public void setHost_cust_id_flag(String host_cust_id_flag) {
		this.host_cust_id_flag = host_cust_id_flag;
	}

	public String getOrg_area() {
		return org_area;
	}

	public void setOrg_area(String org_area) {
		this.org_area = org_area;
	}

	public String getOpp_pbc_party_class_cd() {
		return opp_pbc_party_class_cd;
	}

	public void setOpp_pbc_party_class_cd(String opp_pbc_party_class_cd) {
		this.opp_pbc_party_class_cd = opp_pbc_party_class_cd;
	}

	public String getOpp_pbc_party_class_cd_flag() {
		return opp_pbc_party_class_cd_flag;
	}

	public void setOpp_pbc_party_class_cd_flag(String opp_pbc_party_class_cd_flag) {
		this.opp_pbc_party_class_cd_flag = opp_pbc_party_class_cd_flag;
	}

	public String getParty_chn_name_disp() {
		return party_chn_name_disp;
	}

	public void setParty_chn_name_disp(String party_chn_name_disp) {
		this.party_chn_name_disp = party_chn_name_disp;
	}
	public String getPbckey() {
		return pbckey;
	}

	public void setPbckey(String pbckey) {
		this.pbckey = pbckey;
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

	public String getAlert_type() {
		return alert_type;
	}

	public void setAlert_type(String alert_type) {
		this.alert_type = alert_type;
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

	public String getAcct_type() {
		return acct_type;
	}

	public void setAcct_type(String acct_type) {
		this.acct_type = acct_type;
	}

	public String getAppid() {
		return appid;
	}

	public void setAppid(String appid) {
		this.appid = appid;
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

	public String getOrg_area_disp() {
		return org_area_disp;
	}

	public void setOrg_area_disp(String org_area_disp) {
		this.org_area_disp = org_area_disp;
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

	public String getAcct_type_disp() {
		return acct_type_disp;
	}

	public void setAcct_type_disp(String acct_type_disp) {
		this.acct_type_disp = acct_type_disp;
	}

	public String getOpp_area_disp() {
		return opp_area_disp;
	}

	public void setOpp_area_disp(String opp_area_disp) {
		this.opp_area_disp = opp_area_disp;
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
	
	public String getTstp(CatchManager cm) {
		String tstp = "";
		String curr_cd = this.getCurr_cd();
		LinkedHashMap curr2settle = cm.getMapFromCache("curr2settle");
		String settle = (String)curr2settle.get(curr_cd);
		tstp += settle;			
		
		if(settle.equals("00")) {
			tstp += this.getCash_ind();
			tstp += this.getSettle_type_cd();
		} else {
			tstp += this.getSettle_type_cd();
		}
		return tstp;
	}

	public String getOpp_area_v() {
		return opp_area_v;
	}

	public void setOpp_area_v(String opp_area_v) {
		this.opp_area_v = opp_area_v;
	}

	public String getSettle_type_cd_v() {
		return settle_type_cd_v;
	}

	public void setSettle_type_cd_v(String settle_type_cd_v) {
		this.settle_type_cd_v = settle_type_cd_v;
	}

	public String getTx_go_v() {
		return tx_go_v;
	}

	public void setTx_go_v(String tx_go_v) {
		this.tx_go_v = tx_go_v;
	}

	public String getTx_occur_v() {
		return tx_occur_v;
	}

	public void setTx_occur_v(String tx_occur_v) {
		this.tx_occur_v = tx_occur_v;
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

	public String getIntpage() {
		return intpage;
	}

	public void setIntpage(String intpage) {
		this.intpage = intpage;
	}

	

	public Date getStarttime() {
		return starttime;
	}

	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}

	public Date getStarttime2() {
		return starttime2;
	}

	public void setStarttime2(Date starttime2) {
		this.starttime2 = starttime2;
	}

	public String getOrgan_name() {
		return organ_name;
	}

	public void setOrgan_name(String organ_name) {
		this.organ_name = organ_name;
	}

	public String getReceive_pay_cd_disp() {
		return receive_pay_cd_disp;
	}

	public void setReceive_pay_cd_disp(String receive_pay_cd_disp) {
		this.receive_pay_cd_disp = receive_pay_cd_disp;
	}

	public String getHandle_status_cd_disp() {
		return handle_status_cd_disp;
	}

	public void setHandle_status_cd_disp(String handle_status_cd_disp) {
		this.handle_status_cd_disp = handle_status_cd_disp;
	}

	public String getAlert_mode_cd() {
		return alert_mode_cd;
	}

	public void setAlert_mode_cd(String alert_mode_cd) {
		this.alert_mode_cd = alert_mode_cd;
	}

	public String getAlert_mode_cd_disp() {
		return alert_mode_cd_disp;
	}

	public void setAlert_mode_cd_disp(String alert_mode_cd_disp) {
		this.alert_mode_cd_disp = alert_mode_cd_disp;
	}

	public String getAlert_type_cd() {
		return alert_type_cd;
	}

	public void setAlert_type_cd(String alert_type_cd) {
		this.alert_type_cd = alert_type_cd;
	}

	public String getAlert_type_cd_disp() {
		return alert_type_cd_disp;
	}

	public void setAlert_type_cd_disp(String alert_type_cd_disp) {
		this.alert_type_cd_disp = alert_type_cd_disp;
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

	public String getHandle_usr() {
		return handle_usr;
	}

	public void setHandle_usr(String handle_usr) {
		this.handle_usr = handle_usr;
	}

	public String getObj_type_cd() {
		return obj_type_cd;
	}

	public void setObj_type_cd(String obj_type_cd) {
		this.obj_type_cd = obj_type_cd;
	}

	public String getObj_type_cd_disp() {
		return obj_type_cd_disp;
	}

	public void setObj_type_cd_disp(String obj_type_cd_disp) {
		this.obj_type_cd_disp = obj_type_cd_disp;
	}

	public String getStaff_ind() {
		return staff_ind;
	}

	public void setStaff_ind(String staff_ind) {
		this.staff_ind = staff_ind;
	}

	public String getStaff_ind_disp() {
		return staff_ind_disp;
	}

	public void setStaff_ind_disp(String staff_ind_disp) {
		this.staff_ind_disp = staff_ind_disp;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public String getOpp_off_shore_ind() {
		return opp_off_shore_ind;
	}

	public void setOpp_off_shore_ind(String opp_off_shore_ind) {
		this.opp_off_shore_ind = opp_off_shore_ind;
	}

	public String getOpp_off_shore_ind_flag() {
		return opp_off_shore_ind_flag;
	}

	public void setOpp_off_shore_ind_flag(String opp_off_shore_ind_flag) {
		this.opp_off_shore_ind_flag = opp_off_shore_ind_flag;
	}

	public String getOverarea_indflag() {
		return overarea_indflag;
	}

	public void setOverarea_indflag(String overarea_indflag) {
		this.overarea_indflag = overarea_indflag;
	}

	public String getTx_cd_flag() {
		return tx_cd_flag;
	}

	public void setTx_cd_flag(String tx_cd_flag) {
		this.tx_cd_flag = tx_cd_flag;
	}

	public String getTx_type_cd_flag() {
		return tx_type_cd_flag;
	}

	public void setTx_type_cd_flag(String tx_type_cd_flag) {
		this.tx_type_cd_flag = tx_type_cd_flag;
	}

	public String getObjname() {
		return objname;
	}

	public void setObjname(String objname) {
		this.objname = objname;
	}

	public String getAlert_status_cd() {
		return alert_status_cd;
	}

	public void setAlert_status_cd(String alert_status_cd) {
		this.alert_status_cd = alert_status_cd;
	}

	public String getAlert_status_cd_disp() {
		return alert_status_cd_disp;
	}

	public void setAlert_status_cd_disp(String alert_status_cd_disp) {
		this.alert_status_cd_disp = alert_status_cd_disp;
	}


	public String getRulekey_disp() {
		return rulekey_disp;
	}

	public void setRulekey_disp(String rulekey_disp) {
		this.rulekey_disp = rulekey_disp;
	}

	public String getOrgan_disp() {
		return organ_disp;
	}

	public void setOrgan_disp(String organ_disp) {
		this.organ_disp = organ_disp;
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

	public String getOpp_card_inf() {
		return opp_card_inf;
	}

	public void setOpp_card_inf(String opp_card_inf) {
		this.opp_card_inf = opp_card_inf;
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

	public String getAlertsearchtime() {
		return alertsearchtime;
	}

	public void setAlertsearchtime(String alertsearchtime) {
		this.alertsearchtime = alertsearchtime;
	}

	public String getOrig_table() {
		return orig_table;
	}

	public void setOrig_table(String orig_table) {
		this.orig_table = orig_table;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public String getStatus_cd_disp() {
		return status_cd_disp;
	}

	public void setStatus_cd_disp(String status_cd_disp) {
		this.status_cd_disp = status_cd_disp;
	}

	public String getJiaoyifangshi() {
		return jiaoyifangshi;
	}

	public void setJiaoyifangshi(String jiaoyifangshi) {
		this.jiaoyifangshi = jiaoyifangshi;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getStcrkey() {
		return stcrkey;
	}

	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}

	public String getValidate_flag() {
		return validate_flag;
	}

	public void setValidate_flag(String validate_flag) {
		this.validate_flag = validate_flag;
	}

	public String getValidate_flag_disp() {
		return validate_flag_disp;
	}

	public void setValidate_flag_disp(String validate_flag_disp) {
		this.validate_flag_disp = validate_flag_disp;
	}

	public String getTrans_table() {
		return trans_table;
	}

	public void setTrans_table(String trans_table) {
		this.trans_table = trans_table;
	}

	public String getStcr() {
		return stcr;
	}

	public void setStcr(String stcr) {
		this.stcr = stcr;
	}

	public String getUnion_organ() {
		return union_organ;
	}

	public void setUnion_organ(String union_organ) {
		this.union_organ = union_organ;
	}

	public void setAlert_dt(Date alert_dt) {
		this.alert_dt = alert_dt;
	}

	public Date getAlert_dt() {
		return alert_dt;
	}

	public void setRulekey(String rulekey) {
		this.rulekey = rulekey;
	}

	public String getRulekey() {
		return rulekey;
	}

	public String getOrgankey_new() {
		return organkey_new;
	}

	public void setOrgankey_new(String organkeyNew) {
		organkey_new = organkeyNew;
	}

	public String getTrans_searchtime() {
		return trans_searchtime;
	}

	public void setTrans_searchtime(String transSearchtime) {
		trans_searchtime = transSearchtime;
	}

	public String getTrans_ip() {
		return trans_ip;
	}

	public void setTrans_ip(String trans_ip) {
		this.trans_ip = trans_ip;
	}

}