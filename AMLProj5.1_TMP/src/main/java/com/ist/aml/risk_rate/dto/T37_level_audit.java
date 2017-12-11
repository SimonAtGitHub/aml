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

package com.ist.aml.risk_rate.dto;                
                                                  
/**
* <p>T37_level_audit.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T37_level_audit extends BaseDTO {
                                              
/** 提交岗位 */
private String post_id = "";
private String post_id_disp = "";
/** 评级日期 */
private Date statistic_dt = new Date();
/** 评级结果KEY */
private String rsltkey = "";
/** 接收岗位 */
private String res_post_id = "";
/** 调整后风险等级 */
private String level_after_adjust = "";
/** 客户号 */
private String party_id = "";
/** 客户机构 */
private String organkey = "";
/** 调整人 */
private String last_upd_user = "";
/** 处理意见 */
private String adjust_reason = "";
/** 调整前风险等级 */
private String level_before_adjust = "";
/** 调整日期 */
private Date last_upd_dt = new Date();
/** 调整序号 */
private String audit_no = "";
/** 粒度 */
private String granularity = "";
//=======================================================
/** 评级日期 */
private String statistic_dt_disp = "";
/** 调整日期 */
private String last_upd_dt_disp = "";
private String tablename="";
                                              
    public String getTablename() {
	return tablename;
}
public void setTablename(String tablename) {
	this.tablename = tablename;
}
	/**                   
     * 构造函数           
     */                   
    public T37_level_audit() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setRsltkey(String rsltkeyStr){
this.rsltkey = rsltkeyStr;
}
public String getRsltkey(){
return this.rsltkey;
}

public void setRes_post_id(String res_post_idStr){
this.res_post_id = res_post_idStr;
}
public String getRes_post_id(){
return this.res_post_id;
}

public void setLevel_after_adjust(String level_after_adjustStr){
this.level_after_adjust = level_after_adjustStr;
}
public String getLevel_after_adjust(){
return this.level_after_adjust;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}
public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setAdjust_reason(String adjust_reasonStr){
this.adjust_reason = adjust_reasonStr;
}
public String getAdjust_reason(){
return this.adjust_reason;
}

public void setLevel_before_adjust(String level_before_adjustStr){
this.level_before_adjust = level_before_adjustStr;
}
public String getLevel_before_adjust(){
return this.level_before_adjust;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setAudit_no(String audit_noStr){
this.audit_no = audit_noStr;
}
public String getAudit_no(){
return this.audit_no;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getGranularity() {
	return granularity;
}
public void setGranularity(String granularity) {
	this.granularity = granularity;
}
public String getPost_id_disp() {
	return post_id_disp;
}
public void setPost_id_disp(String postIdDisp) {
	post_id_disp = postIdDisp;
}

}

