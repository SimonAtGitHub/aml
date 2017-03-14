/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-08-30] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.risk_rate.controller;                
                                                  
/**
* <p>T37_party_resultActionForm.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
                                              
public class T37_party_resultActionForm extends ActionForm {
                                              
/** 评级结果状态，0:系统初评;1:上报未审核;2:审核不通过;3:审核通过,4:不需上报已处理,5:审批不通过,6:审批通过  */
private String status_cd = "";
private String status_cd_disp = "";
/** 模板编码 */
private String templatekey = "";
private String templatename = "";
/** 导出状态 0:未导出 1:已导出 */
private String export_status = "";
/** 客户号 */
private String party_id = "";
/** 人工调整日期 */
private Date modifydate;
private Date modifydate_end;
/** 模板类型 */
private String temptype = "";
/** 上期是否人工调整 */
private String lastcheckflag = "";
/** 是否人工调整：0，否  1，是 */
private String modify_cd = "";
/** 最终风险等级 */
private String levelkey = "";
/** 粒度 */
private String granularity = "";
/** 评级日期 */
private Date statistic_dt;
/** 报告时间 */
private Date reportdt = new Date();
/** 客户机构 */
private String organkey = "";
private String organkey_s = "";
private String organ_name = "";
/** 初评等级 */
private String fristappralevel = "";
private String fristappralevel_disp = "";
/** 原客户号 */
private String host_cust_id = "";
/** 上次评级结果 */
private String lastlevelkey = "";
/** 客户类型 */
private String party_class_cd = "";
/** 调整等级 */
private String emendationlevel = "";
private String emendationlevel_disp = "";
private String level_before_adjust="";
/** 当前岗位 */
private String curr_post = "";
/** 客户名称 */
private String party_chn_name = "";
/** 调整人 */
private String modifier = "";
/** 开户日期 */
private Date create_dt;
private Date create_dt_end;
/** 评价结果KEY */
private String resulekey = "";
/** 校正原因 */
private String reason = "";
//=======================================================
/** 人工调整日期 */
private String modifydate_disp = "";
private String modifydate_disp_end = "";
/** 评级日期 */
private String statistic_dt_disp = "";
private String statistic_dt_disp_end = "";
/** 报告时间 */
private String reportdt_disp = "";
/** 开户日期 */
private String create_dt_disp = "";
/** 得分 */
private String score = "";
private String lastscore="";
/** 提交人 */
private String audit_user ="";
/**退回编辑刚原因 */
private String return_reason = "";
/** 提交日期 */
private Date audit_dt;
/** 审核人 */
private String check_user = "";
/** 审核日期 */
private Date check_dt;
/** 审批人 */
private String rcheck_user = "";
/** 审批日期 */
private Date rcheck_dt;
private String rcheck_dt_disp = "";
private String rcheck_dt_disp_end = "";
/** 处理时限 */
private Date  dealmax_dt;
/** 下次评级日期 */
private Date  nextstatistic_dt;
/** 下次评级处理时限 */
private Date  nextdealmax_dt;

/** 评级类型  1：新开户 2：定期核查 3：人工核查*/
private String tempcategory = ""; 
private String tempcategory_s = "";
private String tempcategory_c ="";
private String create_dt_disp_end = "";
private String order = "";
private String orderby = "";
private String post_id = "";
private String node_id = "";
private String oper_id = "";
private String flow_id = "";
private String[] rkeys;

private String gskey ="";
private String gsname ="";
private String gsrm ="";
/** 指标编码 */
private String indickey="";
/** 指标名称 */
private String indicname="";
/** 指标值 */
private String indicval="";
/** 区分再调整和报告页面*/
private String marked="";
/** 区分新开和定期的调查结论参数*/
private String changeflag = "";
private String check_type ="";
/** 协查状态，0 未处理 1待协查 2待复核 3 已协查 4 退回**/
private String hcheck_status ="";
private String hcheck_status_disp ="";
/** 退回人**/
private String return_user = "";
/** 退回日期**/
private Date return_dt;
/** 来源 1:系统,2:再调整**/
private String rate_source = "";
/** 审核、审批状态 1:单个,2:批量**/
private String opera_status = "";
/** 分值是否调整 */
private String scoremodi_flag = "";
/** 页面复选框*/
private String[] selectedResulekey = {};
/** 导出类型 */
private String exportType;
/** 评价结果KEY */
private String currresulekey = "";
private String currtemplatekey = "";
public String getCurrtemplatekey() {
	return currtemplatekey;
}
public void setCurrtemplatekey(String currtemplatekey) {
	this.currtemplatekey = currtemplatekey;
}
public String getCurrresulekey() {
	return currresulekey;
}
public void setCurrresulekey(String currresulekey) {
	this.currresulekey = currresulekey;
}
	//===============================================================================
    /**                   
     * 构造函数           
     */                   
    public T37_party_resultActionForm() {    
    }              
  //===============================================================================
public void setStatus_cd(String status_cdStr){
this.status_cd = status_cdStr;
}
public String getStatus_cd(){
return this.status_cd;
}

public String getStatus_cd_disp() {
	return status_cd_disp;
}
public void setStatus_cd_disp(String statusCdDisp) {
	status_cd_disp = statusCdDisp;
}
public void setTemplatekey(String templatekeyStr){
this.templatekey = templatekeyStr;
}
public String getTemplatekey(){
return this.templatekey;
}

public String getTemplatename() {
	return templatename;
}
public void setTemplatename(String templatename) {
	this.templatename = templatename;
}
public String getScore() {
	return score;
}
public void setScore(String score) {
	this.score = score;
}

public String getLastscore() {
	return lastscore;
}
public void setLastscore(String lastscore) {
	this.lastscore = lastscore;
}
public void setExport_status(String export_statusStr){
this.export_status = export_statusStr;
}
public String getExport_status(){
return this.export_status;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setModifydate(Date modifydateStr){
this.modifydate = modifydateStr;
}
public Date getModifydate(){
return this.modifydate;
}

public void setTemptype(String temptypeStr){
this.temptype = temptypeStr;
}
public String getTemptype(){
return this.temptype;
}

public void setLastcheckflag(String lastcheckflagStr){
this.lastcheckflag = lastcheckflagStr;
}
public String getLastcheckflag(){
return this.lastcheckflag;
}

public void setModify_cd(String modify_cdStr){
this.modify_cd = modify_cdStr;
}
public String getModify_cd(){
return this.modify_cd;
}

public void setLevelkey(String levelkeyStr){
this.levelkey = levelkeyStr;
}
public String getLevelkey(){
return this.levelkey;
}

public void setGranularity(String granularityStr){
this.granularity = granularityStr;
}
public String getGranularity(){
return this.granularity;
}

public String getLevel_before_adjust() {
	return level_before_adjust;
}
public void setLevel_before_adjust(String levelBeforeAdjust) {
	level_before_adjust = levelBeforeAdjust;
}
public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setReportdt(Date reportdtStr){
this.reportdt = reportdtStr;
}
public Date getReportdt(){
return this.reportdt;
}

public String getReturn_reason() {
	return return_reason;
}
public void setReturn_reason(String returnReason) {
	return_reason = returnReason;
}
public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public String getOrgankey_s() {
	return organkey_s;
}
public void setOrgankey_s(String organkeyS) {
	organkey_s = organkeyS;
}
public void setFristappralevel(String fristappralevelStr){
this.fristappralevel = fristappralevelStr;
}
public String getFristappralevel(){
return this.fristappralevel;
}

public String getFristappralevel_disp() {
	return fristappralevel_disp;
}
public void setFristappralevel_disp(String fristappralevelDisp) {
	fristappralevel_disp = fristappralevelDisp;
}
public void setHost_cust_id(String host_cust_idStr){
this.host_cust_id = host_cust_idStr;
}
public String getHost_cust_id(){
return this.host_cust_id;
}

public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public void setLastlevelkey(String lastlevelkeyStr){
this.lastlevelkey = lastlevelkeyStr;
}
public String getLastlevelkey(){
return this.lastlevelkey;
}

public void setParty_class_cd(String party_class_cdStr){
this.party_class_cd = party_class_cdStr;
}
public String getParty_class_cd(){
return this.party_class_cd;
}

public void setEmendationlevel(String emendationlevelStr){
this.emendationlevel = emendationlevelStr;
}
public String getEmendationlevel(){
return this.emendationlevel;
}

public String getEmendationlevel_disp() {
	return emendationlevel_disp;
}
public void setEmendationlevel_disp(String emendationlevelDisp) {
	emendationlevel_disp = emendationlevelDisp;
}
public void setCurr_post(String curr_postStr){
this.curr_post = curr_postStr;
}
public String getCurr_post(){
return this.curr_post;
}

public void setParty_chn_name(String party_chn_nameStr){
this.party_chn_name = party_chn_nameStr;
}
public String getParty_chn_name(){
return this.party_chn_name;
}

public void setModifier(String modifierStr){
this.modifier = modifierStr;
}
public String getModifier(){
return this.modifier;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setResulekey(String resulekeyStr){
this.resulekey = resulekeyStr;
}
public String getResulekey(){
return this.resulekey;
}

//=======================================================
public void setModifydate_disp(String modifydate_dispStr){
this.modifydate_disp = modifydate_dispStr;
}
public String getModifydate_disp(){
return this.modifydate_disp;
}

public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

public void setReportdt_disp(String reportdt_dispStr){
this.reportdt_disp = reportdt_dispStr;
}
public String getReportdt_disp(){
return this.reportdt_disp;
}

public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public String getModifydate_disp_end() {
	return modifydate_disp_end;
}
public void setModifydate_disp_end(String modifydateDispEnd) {
	modifydate_disp_end = modifydateDispEnd;
}
public String getStatistic_dt_disp_end() {
	return statistic_dt_disp_end;
}
public void setStatistic_dt_disp_end(String statisticDtDispEnd) {
	statistic_dt_disp_end = statisticDtDispEnd;
}
public String getCreate_dt_disp_end() {
	return create_dt_disp_end;
}
public void setCreate_dt_disp_end(String createDtDispEnd) {
	create_dt_disp_end = createDtDispEnd;
}

	public String getOrgan_name() {
	return organ_name;
}
public void setOrgan_name(String organName) {
	organ_name = organName;
}

	public String getOrderby() {
	return orderby;
}
public void setOrderby(String orderby) {
	this.orderby = orderby;
}

	public String[] getRkeys() {
	return rkeys;
}
public void setRkeys(String[] rkeys) {
	this.rkeys = rkeys;
}

	public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}

	public String getPost_id() {
	return post_id;
}
public void setPost_id(String postId) {
	post_id = postId;
}

	public String getNode_id() {
	return node_id;
}
public void setNode_id(String nodeId) {
	node_id = nodeId;
}
public String getOper_id() {
	return oper_id;
}
public void setOper_id(String operId) {
	oper_id = operId;
}

	public String getFlow_id() {
	return flow_id;
}
public void setFlow_id(String flowId) {
	flow_id = flowId;
}
	public String getGskey() {
	return gskey;
}
public void setGskey(String gskey) {
	this.gskey = gskey;
}
public String getGsname() {
	return gsname;
}
public void setGsname(String gsname) {
	this.gsname = gsname;
}
public String getGsrm() {
	return gsrm;
}
public void setGsrm(String gsrm) {
	this.gsrm = gsrm;
}
	public String getTempcategory() {
	return tempcategory;
}
	
public String getTempcategory_s() {
		return tempcategory_s;
	}
	public void setTempcategory_s(String tempcategoryS) {
		tempcategory_s = tempcategoryS;
	}
	
public String getTempcategory_c() {
		return tempcategory_c;
	}
	public void setTempcategory_c(String tempcategoryC) {
		tempcategory_c = tempcategoryC;
	}
public String getIndickey() {
		return indickey;
	}
	public void setIndickey(String indickey) {
		this.indickey = indickey;
	}
	public String getIndicname() {
		return indicname;
	}
	public void setIndicname(String indicname) {
		this.indicname = indicname;
	}
	public String getIndicval() {
		return indicval;
	}
	public void setIndicval(String indicval) {
		this.indicval = indicval;
	}
public String getMarked() {
		return marked;
	}
	public void setMarked(String marked) {
		this.marked = marked;
	}
public void setTempcategory(String tempcategory) {
	this.tempcategory = tempcategory;
}

	public String getChangeflag() {
	return changeflag;
}
public void setChangeflag(String changeflag) {
	this.changeflag = changeflag;
}
public String getCheck_type() {
	return check_type;
}
public void setCheck_type(String checkType) {
	check_type = checkType;
}

	public String getHcheck_status() {
	return hcheck_status;
}
public void setHcheck_status(String hcheckStatus) {
	hcheck_status = hcheckStatus;
}
public String getHcheck_status_disp() {
	return hcheck_status_disp;
}
public void setHcheck_status_disp(String hcheckStatusDisp) {
	hcheck_status_disp = hcheckStatusDisp;
}
public String getReturn_user() {
	return return_user;
}
public void setReturn_user(String returnUser) {
	return_user = returnUser;
}
public Date getReturn_dt() {
	return return_dt;
}
public void setReturn_dt(Date returnDt) {
	return_dt = returnDt;
}
	public String getAudit_user() {
	return audit_user;
}
public void setAudit_user(String auditUser) {
	audit_user = auditUser;
}
public Date getAudit_dt() {
	return audit_dt;
}
public void setAudit_dt(Date auditDt) {
	audit_dt = auditDt;
}
public String getCheck_user() {
	return check_user;
}
public void setCheck_user(String checkUser) {
	check_user = checkUser;
}
public Date getCheck_dt() {
	return check_dt;
}
public void setCheck_dt(Date checkDt) {
	check_dt = checkDt;
}
public String getRcheck_user() {
	return rcheck_user;
}
public void setRcheck_user(String rcheckUser) {
	rcheck_user = rcheckUser;
}
public Date getRcheck_dt() {
	return rcheck_dt;
}
public void setRcheck_dt(Date rcheckDt) {
	rcheck_dt = rcheckDt;
}

public String getRcheck_dt_disp() {
	return rcheck_dt_disp;
}
public void setRcheck_dt_disp(String rcheckDtDisp) {
	rcheck_dt_disp = rcheckDtDisp;
}
public String getRcheck_dt_disp_end() {
	return rcheck_dt_disp_end;
}
public void setRcheck_dt_disp_end(String rcheckDtDispEnd) {
	rcheck_dt_disp_end = rcheckDtDispEnd;
}
public Date getDealmax_dt() {
	return dealmax_dt;
}
public void setDealmax_dt(Date dealmaxDt) {
	dealmax_dt = dealmaxDt;
}
public Date getNextstatistic_dt() {
	return nextstatistic_dt;
}
public void setNextstatistic_dt(Date nextstatisticDt) {
	nextstatistic_dt = nextstatisticDt;
}
public Date getNextdealmax_dt() {
	return nextdealmax_dt;
}
public void setNextdealmax_dt(Date nextdealmaxDt) {
	nextdealmax_dt = nextdealmaxDt;
}

	public String getRate_source() {
	return rate_source;
}
public void setRate_source(String rateSource) {
	rate_source = rateSource;
}
public String getOpera_status() {
	return opera_status;
}
public void setOpera_status(String operaStatus) {
	opera_status = operaStatus;
}

	public String getScoremodi_flag() {
	return scoremodi_flag;
}
public void setScoremodi_flag(String scoremodiFlag) {
	scoremodi_flag = scoremodiFlag;
}
	//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public void setModifydate_end(Date modifydate_end) {
		this.modifydate_end = modifydate_end;
	}
	public Date getModifydate_end() {
		return modifydate_end;
	}
	public void setCreate_dt_end(Date create_dt_end) {
		this.create_dt_end = create_dt_end;
	}
	public Date getCreate_dt_end() {
		return create_dt_end;
	}
	public void setSelectedResulekey(String[] selectedResulekey) {
		this.selectedResulekey = selectedResulekey;
	}
	public String[] getSelectedResulekey() {
		return selectedResulekey;
	}
	public void setExportType(String exportType) {
		this.exportType = exportType;
	}
	public String getExportType() {
		return exportType;
	}
}

