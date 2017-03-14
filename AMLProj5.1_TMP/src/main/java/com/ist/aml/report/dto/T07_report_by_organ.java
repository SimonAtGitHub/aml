package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.TreeMap;

public class T07_report_by_organ implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8548142837701378025L;
	/** 现转标志 */
	private String cash_trans_flag = "";
	private String party_name = "";
	private String shrunsum = "";
	private String sprunsum = "";

	/** 币种 */
	private String curr_cd = "";
	/** 人工排除交易笔数 */
	private Long handout_num = null;
	/** 人工添加交易笔数 */
	private Long judge_num = null;
	/** 人工排除交易金额 */
	private Double handout_val = null;
	/** 交易总数笔数 */
	private Long total_num = null;
	/** 成功上报交易金额 */
	private Double success_val = null;
	/** 系统预警交易笔数 */
	private Long alert_num = null;
	/** 1:大额 2:可疑 */
	private String type_cd = "";
	private String type_cd_disp = "";
	/** 成功上报交易笔数 */
	private Long success_num = null;
	/** 统计时间 */
	private Date statisticdate = new Date();
	/** 机构号 */
	private String organkey = "";
	/** 人工添加交易金额 */
	private Double judge_val = null;
	/** 反馈错误交易金额 */
	private Double error_val = null;
	/** 反馈错误交易笔数 */
	private Long error_num = null;
	/** 交易总数金额 */
	private Double total_val = null;
	private String total_val_string = "";
	/** 系统预警交易金额 */
	private Double alert_val = null;
	private String alert_val_string = "";
	/** 主键 */
	private String id = "";
	/** 第一位:贩毒地区;第二位:走私地区;第三位:恐怖活动地区;第四位:赌博严重地区;第五位:避税型离岸金融中心 */
	private String area_type_cd = "";
	/** C:对公当事人,I:个人当事人 */
	private String custom_type_cd = "";
	/** 1:柜面;2:网银;3:电话 */
	private String opp_type_cd = "";
	/** 1:票据;2:信用证 */
	private String tool_type_cd = "";
	/** 统计类型：1:大额 2:可疑 */
	private String cast_type = "";
	/** 币种 */
	private String currency_cd = "";
	/** 查询种类 */
	private String searchtype = "";
	private Date dt_start = null;
	private Date dt_end = null;
	private String dt_start_disp = "";
	private String dt_end_disp = "";
	private String type = "";
	private String organname = "";
	private String fieldname = "";
	ArrayList selectList = new ArrayList();
	TreeMap map = new TreeMap();

	// =======================================================
	private String casesum = "";
	private String runsum = "";
	private String finisum = "";
	private String casenum = "";

	private String staffkey = "";
	private String staffname = "";
	private Long alertnum = null;
	private Double alertnvl = null;
	private String organstrs = "";

	/** 统计时间 */
	private String statisticdate_disp = "";

	private String keyvalue1 = "";
	private String keyvalue2 = "";
	private String gainname1 = "";
	private String gainname2 = "";
	private String tableName = "";
	private String msg_type_cd="";
	private String senddate_ch="";
	private String senddate_ch_b="";
	private String senddate_ch_s="";
	private String senddate_ch_e="";
	private String casesearchtime="";
	private  String reportkey="";
	private String csnm="";
	private String report_type_cd="";
	/** 金融机构网点代码 、名称 */
	private String finc = "";
	private String finn = "";
	/**
	 * 构造函数
	 */
	public T07_report_by_organ() {
	}

	public void setType_cd(String type_cdStr) {
		this.type_cd = type_cdStr;
	}

	public String getType_cd() {
		return this.type_cd;
	}

	public void setStatisticdate(Date statisticdateStr) {
		this.statisticdate = statisticdateStr;
	}

	public Date getStatisticdate() {
		return this.statisticdate;
	}

	public void setOrgankey(String organkeyStr) {
		this.organkey = organkeyStr;
	}

	public String getOrgankey() {
		return this.organkey;
	}

	/**
	 * @return the alert_num
	 */
	public Long getAlert_num() {
		return alert_num;
	}

	/**
	 * @param alert_num
	 *            the alert_num to set
	 */
	public void setAlert_num(Long alert_num) {
		this.alert_num = alert_num;
	}

	/**
	 * @return the alert_val
	 */
	public Double getAlert_val() {
		return alert_val;
	}

	/**
	 * @param alert_val
	 *            the alert_val to set
	 */
	public void setAlert_val(Double alert_val) {
		this.alert_val = alert_val;
	}

	/**
	 * @return the area_type_cd
	 */
	public String getArea_type_cd() {
		return area_type_cd;
	}

	/**
	 * @param area_type_cd
	 *            the area_type_cd to set
	 */
	public void setArea_type_cd(String area_type_cd) {
		this.area_type_cd = area_type_cd;
	}

	/**
	 * @return the custom_type_cd
	 */
	public String getCustom_type_cd() {
		return custom_type_cd;
	}

	/**
	 * @param custom_type_cd
	 *            the custom_type_cd to set
	 */
	public void setCustom_type_cd(String custom_type_cd) {
		this.custom_type_cd = custom_type_cd;
	}

	/**
	 * @return the error_num
	 */
	public Long getError_num() {
		return error_num;
	}

	/**
	 * @param error_num
	 *            the error_num to set
	 */
	public void setError_num(Long error_num) {
		this.error_num = error_num;
	}

	/**
	 * @return the error_val
	 */
	public Double getError_val() {
		return error_val;
	}

	/**
	 * @param error_val
	 *            the error_val to set
	 */
	public void setError_val(Double error_val) {
		this.error_val = error_val;
	}

	/**
	 * @return the handout_num
	 */
	public Long getHandout_num() {
		return handout_num;
	}

	/**
	 * @param handout_num
	 *            the handout_num to set
	 */
	public void setHandout_num(Long handout_num) {
		this.handout_num = handout_num;
	}

	/**
	 * @return the handout_val
	 */
	public Double getHandout_val() {
		return handout_val;
	}

	/**
	 * @param handout_val
	 *            the handout_val to set
	 */
	public void setHandout_val(Double handout_val) {
		this.handout_val = handout_val;
	}

	/**
	 * @return the judge_num
	 */
	public Long getJudge_num() {
		return judge_num;
	}

	/**
	 * @param judge_num
	 *            the judge_num to set
	 */
	public void setJudge_num(Long judge_num) {
		this.judge_num = judge_num;
	}

	/**
	 * @return the judge_val
	 */
	public Double getJudge_val() {
		return judge_val;
	}

	/**
	 * @param judge_val
	 *            the judge_val to set
	 */
	public void setJudge_val(Double judge_val) {
		this.judge_val = judge_val;
	}

	/**
	 * @return the opp_type_cd
	 */
	public String getOpp_type_cd() {
		return opp_type_cd;
	}

	/**
	 * @param opp_type_cd
	 *            the opp_type_cd to set
	 */
	public void setOpp_type_cd(String opp_type_cd) {
		this.opp_type_cd = opp_type_cd;
	}

	/**
	 * @return the success_num
	 */
	public Long getSuccess_num() {
		return success_num;
	}

	/**
	 * @param success_num
	 *            the success_num to set
	 */
	public void setSuccess_num(Long success_num) {
		this.success_num = success_num;
	}

	/**
	 * @return the success_val
	 */
	public Double getSuccess_val() {
		return success_val;
	}

	/**
	 * @param success_val
	 *            the success_val to set
	 */
	public void setSuccess_val(Double success_val) {
		this.success_val = success_val;
	}

	/**
	 * @return the tool_type_cd
	 */
	public String getTool_type_cd() {
		return tool_type_cd;
	}

	/**
	 * @param tool_type_cd
	 *            the tool_type_cd to set
	 */
	public void setTool_type_cd(String tool_type_cd) {
		this.tool_type_cd = tool_type_cd;
	}

	/**
	 * @return the total_num
	 */
	public Long getTotal_num() {
		return total_num;
	}

	/**
	 * @param total_num
	 *            the total_num to set
	 */
	public void setTotal_num(Long total_num) {
		this.total_num = total_num;
	}

	/**
	 * @return the total_val
	 */
	public Double getTotal_val() {
		return total_val;
	}

	/**
	 * @param total_val
	 *            the total_val to set
	 */
	public void setTotal_val(Double total_val) {
		this.total_val = total_val;
	}

	public void setId(String idStr) {
		this.id = idStr;
	}

	public String getId() {
		return this.id;
	}

	// =======================================================
	public void setStatisticdate_disp(String statisticdate_dispStr) {
		this.statisticdate_disp = statisticdate_dispStr;
	}

	public String getStatisticdate_disp() {
		return this.statisticdate_disp;
	}

	/**
	 * @return the searchtype
	 */
	public String getSearchtype() {
		return searchtype;
	}

	/**
	 * @param searchtype
	 *            the searchtype to set
	 */
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}

	/**
	 * @return the dt_end
	 */
	public Date getDt_end() {
		return dt_end;
	}

	/**
	 * @param dt_end
	 *            the dt_end to set
	 */
	public void setDt_end(Date dt_end) {
		this.dt_end = dt_end;
	}

	/**
	 * @return the dt_end_disp
	 */
	public String getDt_end_disp() {
		return dt_end_disp;
	}

	/**
	 * @param dt_end_disp
	 *            the dt_end_disp to set
	 */
	public void setDt_end_disp(String dt_end_disp) {
		this.dt_end_disp = dt_end_disp;
	}

	/**
	 * @return the dt_start
	 */
	public Date getDt_start() {
		return dt_start;
	}

	/**
	 * @param dt_start
	 *            the dt_start to set
	 */
	public void setDt_start(Date dt_start) {
		this.dt_start = dt_start;
	}

	/**
	 * @return the dt_start_disp
	 */
	public String getDt_start_disp() {
		return dt_start_disp;
	}

	/**
	 * @param dt_start_disp
	 *            the dt_start_disp to set
	 */
	public void setDt_start_disp(String dt_start_disp) {
		this.dt_start_disp = dt_start_disp;
	}

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the gainname1
	 */
	public String getGainname1() {
		return gainname1;
	}

	/**
	 * @param gainname1
	 *            the gainname1 to set
	 */
	public void setGainname1(String gainname1) {
		this.gainname1 = gainname1;
	}

	/**
	 * @return the gainname2
	 */
	public String getGainname2() {
		return gainname2;
	}

	/**
	 * @param gainname2
	 *            the gainname2 to set
	 */
	public void setGainname2(String gainname2) {
		this.gainname2 = gainname2;
	}

	/**
	 * @return the keyvalue1
	 */
	public String getKeyvalue1() {
		return keyvalue1;
	}

	/**
	 * @param keyvalue1
	 *            the keyvalue1 to set
	 */
	public void setKeyvalue1(String keyvalue1) {
		this.keyvalue1 = keyvalue1;
	}

	/**
	 * @return the keyvalue2
	 */
	public String getKeyvalue2() {
		return keyvalue2;
	}

	/**
	 * @param keyvalue2
	 *            the keyvalue2 to set
	 */
	public void setKeyvalue2(String keyvalue2) {
		this.keyvalue2 = keyvalue2;
	}

	/**
	 * @return the tableName
	 */
	public String getTableName() {
		return tableName;
	}

	/**
	 * @param tableName
	 *            the tableName to set
	 */
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	/**
	 * @return the organname
	 */
	public String getOrganname() {
		return organname;
	}

	/**
	 * @param organname
	 *            the organname to set
	 */
	public void setOrganname(String organname) {
		this.organname = organname;
	}

	/**
	 * @return the fieldname
	 */
	public String getFieldname() {
		return fieldname;
	}

	/**
	 * @param fieldname
	 *            the fieldname to set
	 */
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}

	/**
	 * @return the selectList
	 */
	public ArrayList getSelectList() {
		return selectList;
	}

	/**
	 * @param selectList
	 *            the selectList to set
	 */
	public void setSelectList(ArrayList selectList) {
		this.selectList = selectList;
	}

	/**
	 * @return the map
	 */
	public TreeMap getMap() {
		return map;
	}

	/**
	 * @param map
	 *            the map to set
	 */
	public void setMap(TreeMap map) {
		this.map = map;
	}

	public String getCurr_cd() {
		return curr_cd;
	}

	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}

	public String getCasenum() {
		return casenum;
	}

	public void setCasenum(String casenum) {
		this.casenum = casenum;
	}

	public String getCasesum() {
		return casesum;
	}

	public void setCasesum(String casesum) {
		this.casesum = casesum;
	}

	public String getFinisum() {
		return finisum;
	}

	public void setFinisum(String finisum) {
		this.finisum = finisum;
	}

	public String getRunsum() {
		return runsum;
	}

	public void setRunsum(String runsum) {
		this.runsum = runsum;
	}

	public String getType_cd_disp() {
		return type_cd_disp;
	}

	public void setType_cd_disp(String type_cd_disp) {
		this.type_cd_disp = type_cd_disp;
	}

	public Long getAlertnum() {
		return alertnum;
	}

	public void setAlertnum(Long alertnum) {
		this.alertnum = alertnum;
	}

	public Double getAlertnvl() {
		return alertnvl;
	}

	public void setAlertnvl(Double alertnvl) {
		this.alertnvl = alertnvl;
	}

	public String getStaffkey() {
		return staffkey;
	}

	public void setStaffkey(String staffkey) {
		this.staffkey = staffkey;
	}

	public String getStaffname() {
		return staffname;
	}

	public void setStaffname(String staffname) {
		this.staffname = staffname;
	}

	public String getAlert_val_string() {
		return alert_val_string;
	}

	public void setAlert_val_string(String alert_val_string) {
		this.alert_val_string = alert_val_string;
	}

	public String getTotal_val_string() {
		return total_val_string;
	}

	public void setTotal_val_string(String total_val_string) {
		this.total_val_string = total_val_string;
	}

	public String getCash_trans_flag() {
		return cash_trans_flag;
	}

	public void setCash_trans_flag(String cash_trans_flag) {
		this.cash_trans_flag = cash_trans_flag;
	}

	public String getParty_name() {
		return party_name;
	}

	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}

	public String getShrunsum() {
		return shrunsum;
	}

	public void setShrunsum(String shrunsum) {
		this.shrunsum = shrunsum;
	}

	public String getSprunsum() {
		return sprunsum;
	}

	public void setSprunsum(String sprunsum) {
		this.sprunsum = sprunsum;
	}

	public String getOrganstrs() {
		return organstrs;
	}

	public void setOrganstrs(String organstrs) {
		this.organstrs = organstrs;
	}

	// 储存对私信息
	private Double total_val_I;// 对私金额
	private String total_val_I_string;// 对私金额
	private Long total_num_I;// 对私交易笔数
	private String report_number;// 对公报告分数
	private String report_number_I;// 对私报告分数
	private String party_class_cd;// 客户类型

	public String getParty_class_cd() {
		return party_class_cd;
	}

	public void setParty_class_cd(String partyClassCd) {
		party_class_cd = partyClassCd;
	}

	public String getTotal_val_I_string() {
		return total_val_I_string;
	}

	public void setTotal_val_I_string(String totalValIString) {
		total_val_I_string = totalValIString;
	}

	public Double getTotal_val_I() {
		return total_val_I;
	}

	public void setTotal_val_I(Double totalValI) {
		total_val_I = totalValI;
	}

	public Long getTotal_num_I() {
		return total_num_I;
	}

	public void setTotal_num_I(Long totalNumI) {
		total_num_I = totalNumI;
	}

	public String getReport_number() {
		return report_number;
	}

	public void setReport_number(String reportNumber) {
		report_number = reportNumber;
	}

	public String getReport_number_I() {
		return report_number_I;
	}

	public void setReport_number_I(String reportNumberI) {
		report_number_I = reportNumberI;
	}

	public String getCast_type() {
		return cast_type;
	}

	public void setCast_type(String cast_type) {
		this.cast_type = cast_type;
	}

	public String getCurrency_cd() {
		return currency_cd;
	}

	public void setCurrency_cd(String currency_cd) {
		this.currency_cd = currency_cd;
	}

	public String getMsg_type_cd() {
		return msg_type_cd;
	}

	public void setMsg_type_cd(String msgTypeCd) {
		msg_type_cd = msgTypeCd;
	}

	public String getSenddate_ch() {
		return senddate_ch;
	}

	public void setSenddate_ch(String senddateCh) {
		senddate_ch = senddateCh;
	}

	public String getSenddate_ch_b() {
		return senddate_ch_b;
	}

	public void setSenddate_ch_b(String senddateChB) {
		senddate_ch_b = senddateChB;
	}

	public String getSenddate_ch_s() {
		return senddate_ch_s;
	}

	public void setSenddate_ch_s(String senddateChS) {
		senddate_ch_s = senddateChS;
	}

	public String getSenddate_ch_e() {
		return senddate_ch_e;
	}

	public void setSenddate_ch_e(String senddateChE) {
		senddate_ch_e = senddateChE;
	}

	public String getCasesearchtime() {
		return casesearchtime;
	}

	public void setCasesearchtime(String casesearchtime) {
		this.casesearchtime = casesearchtime;
	}

	public String getReportkey() {
		return reportkey;
	}

	public void setReportkey(String reportkey) {
		this.reportkey = reportkey;
	}

	public String getCsnm() {
		return csnm;
	}

	public void setCsnm(String csnm) {
		this.csnm = csnm;
	}

	public String getReport_type_cd() {
		return report_type_cd;
	}

	public void setReport_type_cd(String reportTypeCd) {
		report_type_cd = reportTypeCd;
	}

	public String getFinc() {
		return finc;
	}

	public void setFinc(String finc) {
		this.finc = finc;
	}

	public String getFinn() {
		return finn;
	}

	public void setFinn(String finn) {
		this.finn = finn;
	}



}
