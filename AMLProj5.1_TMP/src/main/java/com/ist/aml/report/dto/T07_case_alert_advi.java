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
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_case_alert_advi implements Serializable {

/**
	 * 
	 */
	private static final long serialVersionUID = -1176664409534878192L;
private String rulekey = "";
private String manualkey = "";
private String manual_con = "";
private String manual_ind = "";
private String manual_ind_disp = "";
private String record_cd= "";
/** 岗位代码 */
private String post_id = "";
/** null */
private String application_num = "";
/** 原因 */
private String reason = "";
/** 是否当前记录 */
private String current_ind = "";
/** 预警ID */
private String alertkey = "";
/** 操作员 */
private String operator_num = "";
/** 上次更新用户 */
private String last_upd_user = "";
/** 上次更新时间 */
private Date last_upd_dt = new Date();
/** 流程序号 */
private Long seq_num =null;
//=======================================================
/** 上次更新时间 */
private String last_upd_dt_disp = "";

private String  post_name="";

/** 客户号 */
private String party_id = "";
/** 特征代码 */
private String stcr = "";

/** 对象代码 */
private String objkey = ""; 
/** 对象类型*/
private String objtype = ""; 
/** 操作类型*/
private String opertype = ""; 
/** 操作类型*/
private String opertype_disp = ""; 
/** 创建人*/
private String create_user = ""; 
/** 创建时间*/
private Date create_dt = new Date();
private String create_dt_disp = ""; 
public String getObjkey() {
	return objkey;
}
public void setObjkey(String objkey) {
	this.objkey = objkey;
}
public String getObjtype() {
	return objtype;
}
public void setObjtype(String objtype) {
	this.objtype = objtype;
}
public String getOpertype() {
	return opertype;
}
public void setOpertype(String opertype) {
	this.opertype = opertype;
}
public String getCreate_user() {
	return create_user;
}
public String getOpertype_disp() {
	return opertype_disp;
}
public void setOpertype_disp(String opertypeDisp) {
	opertype_disp = opertypeDisp;
}
public void setCreate_user(String createUser) {
	create_user = createUser;
}
public Date getCreate_dt() {
	return create_dt;
}
public void setCreate_dt(Date createDt) {
	create_dt = createDt;
}
public String getCreate_dt_disp() {
	return create_dt_disp;
}
public void setCreate_dt_disp(String createDtDisp) {
	create_dt_disp = createDtDisp;
}
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_case_alert_advi() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setReason(String reasonStr){
this.reason = reasonStr;
}
public String getReason(){
return this.reason;
}

public void setCurrent_ind(String current_indStr){
this.current_ind = current_indStr;
}
public String getCurrent_ind(){
return this.current_ind;
}

public void setAlertkey(String alertkeyStr){
this.alertkey = alertkeyStr;
}
public String getAlertkey(){
return this.alertkey;
}

public void setOperator_num(String operator_numStr){
this.operator_num = operator_numStr;
}
public String getOperator_num(){
return this.operator_num;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setSeq_num(Long seq_numStr){
this.seq_num = seq_numStr;
}
public Long getSeq_num(){
return this.seq_num;
}

//=======================================================
public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getPost_name() {
	return post_name;
}
public void setPost_name(String post_name) {
	this.post_name = post_name;
}
public String getManual_con() {
	return manual_con;
}
public void setManual_con(String manual_con) {
	this.manual_con = manual_con;
}
public String getManualkey() {
	return manualkey;
}
public void setManualkey(String manualkey) {
	this.manualkey = manualkey;
}
public String getRulekey() {
	return rulekey;
}
public void setRulekey(String rulekey) {
	this.rulekey = rulekey;
}
public String getManual_ind() {
	return manual_ind;
}
public void setManual_ind(String manual_ind) {
	this.manual_ind = manual_ind;
}
public String getRecord_cd() {
	return record_cd;
}
public void setRecord_cd(String record_cd) {
	this.record_cd = record_cd;
}
public String getManual_ind_disp() {
	return manual_ind_disp;
}
public void setManual_ind_disp(String manual_ind_disp) {
	this.manual_ind_disp = manual_ind_disp;
}
public String getParty_id() {
	return party_id;
}
public void setParty_id(String party_id) {
	this.party_id = party_id;
}
public String getStcr() {
	return stcr;
}
public void setStcr(String stcr) {
	this.stcr = stcr;
}

}

