/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2009/06/29 08:49:24 xzq Exp $
* Created [2009-06-29] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.information.dto;                
                                                  
/**
* <p>T07_SUPervise_msg.java</p>
* <p>Description: </p>
* @author $Author: xzq $
* @version $Revision: 1.1.1.1 $ $Date: 2009/06/29 08:49:24 $
*/

import java.io.Serializable;
import java.util.Date;
                                              
public class T07_Supervise_msg implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -8207694440341966658L;
/** 督办标题 */
private String msg_name = "";
private String msg_name_s = "";

private String msg_mode = "";
/** 督办类型: 1 第一次交易补录, 2 第二次交易补录, 3 客户补录, 4.错误交易补录 5错误客户补录  6案例处理 */
private String msg_type = "";
private String msg_type_s = "";
/** 接收岗位：P0102 编辑; P0104 本币审批; P0105 外币对公审批; P0106 外币对私审批; P9999 机构维护 */
private String receipt_post = "";
/** 督办机构 */
private String msg_org = "";
/** 督办机构名称 */
private String msg_org_name = "";
private String msg_org_name_s = "";
/** 督办用户 */
private String create_user = "";
/** 督办日期 */
private String create_dt ="";
private Date date_dt=new Date();
/** 开始日期 */
private String start_dt ="";
/** 结束日期 */
private String end_dt = "";
/** 督办内容 */
private String msg_content = "";
/** 状态: 1 已读,2 未读 */
private String msg_state = "";
/** 接收机构 */
private String receipt_org = "";
private String receipt_org_s = "";
/** 督办ID */
private String msg_id = "";

private String voer_dt="";//处理时限
private String status="" ;//0有效 1无效
private String case_type_s="";
private String organkey="";
private String organkeys="";
private String case_type="";
private String total_num="";
private String nooper_num="";
private String oper_num="";
private String post_id="";
private String organlevel="";
private String maxorganlevel="";
//=======================================================
/** 督办日期 */
private String create_dt_disp = "";
/** 开始日期 */
private String start_dt_disp = "";
/** 结束日期 */
private String end_dt_disp = "";
/** 状态: 1 已读,2 未读 */
private String msg_state_disp = "";

private String[] msg_ids = {};  

private int intpage = 0;
private Date sys_date=null;
private String system_key="";
private Date validate_dt=new Date();
private String validate_dt_disp="";

private Date date_start_dt = null;
private Date date_end_dt = null;
private String party_class_cd="";
private String party_class_cd_s="";
private Date date_start_validate = null;
private Date date_end_validate = null;
private String case_type_s1 = "";
private Date tx_dt=new Date();
private String tx_dt_disp="";
private String dealadvise="";
private String deal_user="";
private String deal_dt="";




    /**                   
     * 构造函数           
     */                   
    public T07_Supervise_msg() {    
    }                     
public void setMsg_name(String msg_nameStr){
this.msg_name = msg_nameStr;
}
public String getMsg_name(){
return this.msg_name;
}

public void setMsg_type(String msg_typeStr){
this.msg_type = msg_typeStr;
}
public String getMsg_type(){
return this.msg_type;
}

public void setMsg_org(String msg_orgStr){
this.msg_org = msg_orgStr;
}
public String getMsg_org(){
return this.msg_org;
}

public void setCreate_user(String create_userStr){
this.create_user = create_userStr;
}
public String getCreate_user(){
return this.create_user;
}


public void setMsg_content(String msg_contentStr){
this.msg_content = msg_contentStr;
}
public String getMsg_content(){
return this.msg_content;
}

public void setMsg_state(String msg_stateStr){
this.msg_state = msg_stateStr;
}
public String getMsg_state(){
return this.msg_state;
}

public void setReceipt_org(String receipt_orgStr){
this.receipt_org = receipt_orgStr;
}
public String getReceipt_org(){
return this.receipt_org;
}

public void setMsg_id(String msg_idStr){
this.msg_id = msg_idStr;
}
public String getMsg_id(){
return this.msg_id;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public String getEnd_dt_disp() {
	return end_dt_disp;
}
public void setEnd_dt_disp(String end_dt_disp) {
	this.end_dt_disp = end_dt_disp;
}
public String[] getMsg_ids() {
	return msg_ids;
}
public void setMsg_ids(String[] msg_ids) {
	this.msg_ids = msg_ids;
}
public String getMsg_state_disp() {
	return msg_state_disp;
}
public void setMsg_state_disp(String msg_state_disp) {
	this.msg_state_disp = msg_state_disp;
}

public String getStart_dt_disp() {
	return start_dt_disp;
}
public void setStart_dt_disp(String start_dt_disp) {
	this.start_dt_disp = start_dt_disp;
}
public String getMsg_org_name() {
	return msg_org_name;
}
public void setMsg_org_name(String msg_org_name) {
	this.msg_org_name = msg_org_name;
}
public String getMsg_mode() {
	return msg_mode;
}
public void setMsg_mode(String msg_mode) {
	this.msg_mode = msg_mode;
}

public String getReceipt_post() {
	return receipt_post;
}
public void setReceipt_post(String receipt_post) {
	this.receipt_post = receipt_post;
}
public int getIntpage() {
	return intpage;
}
public void setIntpage(int intpage) {
	this.intpage = intpage;
}

public String getCreate_dt() {
	return create_dt;
}
public void setCreate_dt(String create_dt) {
	this.create_dt = create_dt;
}
public String getEnd_dt() {
	return end_dt;
}
public void setEnd_dt(String end_dt) {
	this.end_dt = end_dt;
}
public String getStart_dt() {
	return start_dt;
}
public void setStart_dt(String start_dt) {
	this.start_dt = start_dt;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getVoer_dt() {
	return voer_dt;
}
public void setVoer_dt(String voer_dt) {
	this.voer_dt = voer_dt;
}
public String getCase_type() {
	return case_type;
}
public void setCase_type(String case_type) {
	this.case_type = case_type;
}
public String getNooper_num() {
	return nooper_num;
}
public void setNooper_num(String nooper_num) {
	this.nooper_num = nooper_num;
}
public String getOper_num() {
	return oper_num;
}
public void setOper_num(String oper_num) {
	this.oper_num = oper_num;
}
public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}
public String getOrgankeys() {
	return organkeys;
}
public void setOrgankeys(String organkeys) {
	this.organkeys = organkeys;
}
public String getTotal_num() {
	return total_num;
}
public void setTotal_num(String total_num) {
	this.total_num = total_num;
}


public String getCase_type_s() {
	return case_type_s;
}
public void setCase_type_s(String case_type_s) {
	this.case_type_s = case_type_s;
}
public String getPost_id() {
	return post_id;
}
public void setPost_id(String post_id) {
	this.post_id = post_id;
}
public Date getSys_date() {
	return sys_date;
}
public void setSys_date(Date sys_date) {
	this.sys_date = sys_date;
}
public String getSystem_key() {
	return system_key;
}
public void setSystem_key(String system_key) {
	this.system_key = system_key;
}
public String getOrganlevel() {
	return organlevel;
}
public void setOrganlevel(String organlevel) {
	this.organlevel = organlevel;
}

public Date getDate_start_dt() {
	return date_start_dt;
}
public void setDate_start_dt(Date date_start_dt) {
	this.date_start_dt = date_start_dt;
}
public Date getDate_end_dt() {
	return date_end_dt;
}
public void setDate_end_dt(Date date_end_dt) {
	this.date_end_dt = date_end_dt;
}
public Date getDate_dt() {
	return date_dt;
}
public void setDate_dt(Date date_dt) {
	this.date_dt = date_dt;
}
public String getParty_class_cd() {
	return party_class_cd;
}
public void setParty_class_cd(String party_class_cd) {
	this.party_class_cd = party_class_cd;
}
public Date getValidate_dt() {
	return validate_dt;
}
public void setValidate_dt(Date validate_dt) {
	this.validate_dt = validate_dt;
}
public String getValidate_dt_disp() {
	return validate_dt_disp;
}
public void setValidate_dt_disp(String validate_dt_disp) {
	this.validate_dt_disp = validate_dt_disp;
}
public Date getDate_end_validate() {
	return date_end_validate;
}
public void setDate_end_validate(Date date_end_validate) {
	this.date_end_validate = date_end_validate;
}
public Date getDate_start_validate() {
	return date_start_validate;
}
public void setDate_start_validate(Date date_start_validate) {
	this.date_start_validate = date_start_validate;
}
public String getParty_class_cd_s() {
	return party_class_cd_s;
}
public void setParty_class_cd_s(String party_class_cd_s) {
	this.party_class_cd_s = party_class_cd_s;
}
public String getReceipt_org_s() {
	return receipt_org_s;
}
public void setReceipt_org_s(String receipt_org_s) {
	this.receipt_org_s = receipt_org_s;
}
public String getCase_type_s1() {
	return case_type_s1;
}
public void setCase_type_s1(String case_type_s1) {
	this.case_type_s1 = case_type_s1;
}
public String getMaxorganlevel() {
	return maxorganlevel;
}
public void setMaxorganlevel(String maxorganlevel) {
	this.maxorganlevel = maxorganlevel;
}
public Date getTx_dt() {
	return tx_dt;
}
public void setTx_dt(Date tx_dt) {
	this.tx_dt = tx_dt;
}
public String getTx_dt_disp() {
	return tx_dt_disp;
}
public void setTx_dt_disp(String tx_dt_disp) {
	this.tx_dt_disp = tx_dt_disp;
}
public String getDealadvise() {
	return dealadvise;
}
public void setDealadvise(String dealadvise) {
	this.dealadvise = dealadvise;
}
public String getDeal_dt() {
	return deal_dt;
}
public void setDeal_dt(String deal_dt) {
	this.deal_dt = deal_dt;
}
public String getDeal_user() {
	return deal_user;
}
public void setDeal_user(String deal_user) {
	this.deal_user = deal_user;
}
public String getMsg_name_s() {
	return msg_name_s;
}
public void setMsg_name_s(String msgNameS) {
	msg_name_s = msgNameS;
}
public String getMsg_type_s() {
	return msg_type_s;
}
public void setMsg_type_s(String msgTypeS) {
	msg_type_s = msgTypeS;
}
public String getMsg_org_name_s() {
	return msg_org_name_s;
}
public void setMsg_org_name_s(String msgOrgNameS) {
	msg_org_name_s = msgOrgNameS;
}

}

