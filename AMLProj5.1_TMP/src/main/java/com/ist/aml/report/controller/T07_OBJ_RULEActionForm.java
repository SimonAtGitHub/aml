/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2009-06-23   ����		����        
 */                                             
                                                  
package com.ist.aml.report.controller;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import org.apache.struts.upload.FormFile;

import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
/**
 * @author Administrator
 *
 */
public class T07_OBJ_RULEActionForm extends ActionForm {
                                    
private String ischeck = "";
/** INVALIDATE_DT */
private Date invalidate_dt = null;
/** PBC_RULE_KEY */
private String pbc_rule_key = "";
/** PARTY_ID */
private String party_id = "";
/** PARTY_IDW */
private String party_idw = "";
/** ISUSE */
private String isuse = "";
private String isuse_disp = "";
/** VALIDATE_DT */
private Date validate_dt = null;
/** ORGANKEY */
private String organkey = "";
private String organname="";
/** REASON_CANCEL */
private String reason_cancel = "";
/** PARTY_CLASS_CD */
private String party_class_cd = "";
/** PARTY_CLASS_CDW */
private String party_class_cdw = "";
/** REASON_CREATE */
private String reason_create = "";
/** OBJ_NAME */
private String obj_name = "";
private String obj_namew = "";
/** MODIFY_USER */
private String modify_user = "";
/** CREATE_USER */
private String create_user = "";
/** CREATE_DT */
private Date create_dt = null;
/** CREATE_DT */
private Date create1_dt = null;
/** RULE_TYPE */
private String rule_type = "";
private String rule_type_disp = "";
/** ��������:1:���2:����3:���Ϳ��� */
private String pbc_type_cd = "";
private String pbc_cd = "";
/** MODIFY_DT */
private Date modify_dt = null;
/** list_type */
private String list_type = "";
/** listsearch_type */
private String listsearch_type = "";
/** listsearch_type */
private String fashion = "asc";
/** filename */
private FormFile filename;
//=======================================================
/** INVALIDATE_DT */
private String invalidate_dt_disp = "";
/** VALIDATE_DT */
private String validate_dt_disp = "";
/** CREATE_DT */
private String create_dt_disp = "";
/** CREATE_DT */
private String create1_dt_disp = "";
/** MODIFY_DT */
private String modify_dt_disp = "";
private String[] selectedPartyId = {};

/** �������� ��������Ƿ�����˲��� */
private String checkflag = "";
/** ��¼�û��Ƿ�Ϊ������Ա*/
private String check="";
private String bank_name;
private String bank_code2;
private String checkdate;
private String checkdate1;
public String getCheckdate1() {
	return checkdate1;
}
public void setCheckdate1(String checkdate1) {
	this.checkdate1 = checkdate1;
}
private String checktime;
private String name;
private String id_no;
private String result;
private String counter_no;
private String ope_line;
private String checkmode;
private String purpose;
private String tb_id;
private String is_inst;
    public String getBank_name() {
	return bank_name;
}
public void setBank_name(String bank_name) {
	this.bank_name = bank_name;
}
public String getBank_code2() {
	return bank_code2;
}
public void setBank_code2(String bank_code2) {
	this.bank_code2 = bank_code2;
}
public String getCheckdate() {
	return checkdate;
}
public void setCheckdate(String checkdate) {
	this.checkdate = checkdate;
}
public String getChecktime() {
	return checktime;
}
public void setChecktime(String checktime) {
	this.checktime = checktime;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getId_no() {
	return id_no;
}
public void setId_no(String id_no) {
	this.id_no = id_no;
}
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
public String getCounter_no() {
	return counter_no;
}
public void setCounter_no(String counter_no) {
	this.counter_no = counter_no;
}
public String getOpe_line() {
	return ope_line;
}
public void setOpe_line(String ope_line) {
	this.ope_line = ope_line;
}
public String getCheckmode() {
	return checkmode;
}
public void setCheckmode(String checkmode) {
	this.checkmode = checkmode;
}
public String getPurpose() {
	return purpose;
}
public void setPurpose(String purpose) {
	this.purpose = purpose;
}
public String getTb_id() {
	return tb_id;
}
public void setTb_id(String tb_id) {
	this.tb_id = tb_id;
}
public String getIs_inst() {
	return is_inst;
}
public void setIs_inst(String is_inst) {
	this.is_inst = is_inst;
}
	/**                   
     * ���캯��           
     */                   
    public T07_OBJ_RULEActionForm() {    
    }                     
public void setInvalidate_dt(Date invalidate_dtStr){
this.invalidate_dt = invalidate_dtStr;
}
public Date getInvalidate_dt(){
return this.invalidate_dt;
}

public void setPbc_rule_key(String pbc_rule_keyStr){
this.pbc_rule_key = pbc_rule_keyStr;
}
public String getPbc_rule_key(){
return this.pbc_rule_key;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setIsuse(String isuseStr){
this.isuse = isuseStr;
}
public String getIsuse(){
return this.isuse;
}

public void setValidate_dt(Date validate_dtStr){
this.validate_dt = validate_dtStr;
}
public Date getValidate_dt(){
return this.validate_dt;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setReason_cancel(String reason_cancelStr){
this.reason_cancel = reason_cancelStr;
}
public String getReason_cancel(){
return this.reason_cancel;
}

public void setParty_class_cd(String party_class_cdStr){
this.party_class_cd = party_class_cdStr;
}
public String getParty_class_cd(){
return this.party_class_cd;
}

public void setReason_create(String reason_createStr){
this.reason_create = reason_createStr;
}
public String getReason_create(){
return this.reason_create;
}

public void setObj_name(String obj_nameStr){
this.obj_name = obj_nameStr;
}
public String getObj_name(){
return this.obj_name;
}

public void setModify_user(String modify_userStr){
this.modify_user = modify_userStr;
}
public String getModify_user(){
return this.modify_user;
}

public void setCreate_user(String create_userStr){
this.create_user = create_userStr;
}
public String getCreate_user(){
return this.create_user;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setRule_type(String rule_typeStr){
this.rule_type = rule_typeStr;
}
public String getRule_type(){
return this.rule_type;
}

public void setModify_dt(Date modify_dtStr){
this.modify_dt = modify_dtStr;
}
public Date getModify_dt(){
return this.modify_dt;
}

//=======================================================
public void setInvalidate_dt_disp(String invalidate_dt_dispStr){
this.invalidate_dt_disp = invalidate_dt_dispStr;
}
public String getInvalidate_dt_disp(){
return this.invalidate_dt_disp;
}

public void setValidate_dt_disp(String validate_dt_dispStr){
this.validate_dt_disp = validate_dt_dispStr;
}
public String getValidate_dt_disp(){
return this.validate_dt_disp;
}

public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setModify_dt_disp(String modify_dt_dispStr){
this.modify_dt_disp = modify_dt_dispStr;
}
public String getModify_dt_disp(){
return this.modify_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public Date getCreate1_dt() {
		return this.create1_dt;
	}
	public void setCreate1_dt(Date create1_dt) {
		this.create1_dt = create1_dt;
	}
	public String getCreate1_dt_disp() {
		return this.create1_dt_disp;
	}
	public void setCreate1_dt_disp(String create1_dt_disp) {
		this.create1_dt_disp = create1_dt_disp;
	}
	public String getList_type() {
		return list_type;
	}
	public void setList_type(String list_type) {
		this.list_type = list_type;
	}
	public String getListsearch_type() {
		return listsearch_type;
	}
	public void setListsearch_type(String listsearch_type) {
		this.listsearch_type = listsearch_type;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	public String[] getSelectedPartyId() {
		return selectedPartyId;
	}
	public void setSelectedPartyId(String[] selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
	}
	public String getParty_idw() {
		return party_idw;
	}
	public void setParty_idw(String party_idw) {
		this.party_idw = party_idw;
	}
	public String getParty_class_cdw() {
		return party_class_cdw;
	}
	public void setParty_class_cdw(String party_class_cdw) {
		this.party_class_cdw = party_class_cdw;
	}
	public String getObj_namew() {
		return obj_namew;
	}
	public void setObj_namew(String obj_namew) {
		this.obj_namew = obj_namew;
	}
	public FormFile getFilename() {
		return filename;
	}
	public void setFilename(FormFile filename) {
		this.filename = filename;
	}
	public String getIscheck() {
		return ischeck;
	}
	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
	}
	public String getCheckflag() {
		return checkflag;
	}
	public void setCheckflag(String checkflag) {
		this.checkflag = checkflag;
	}
	public String getIsuse_disp() {
		return isuse_disp;
	}
	public void setIsuse_disp(String isuseDisp) {
		isuse_disp = isuseDisp;
	}
	public String getRule_type_disp() {
		return rule_type_disp;
	}
	public void setRule_type_disp(String ruleTypeDisp) {
		rule_type_disp = ruleTypeDisp;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	public String getPbc_type_cd() {
		return pbc_type_cd;
	}
	public void setPbc_type_cd(String pbcTypeCd) {
		pbc_type_cd = pbcTypeCd;
	}
	public String getPbc_cd() {
		return pbc_cd;
	}
	public void setPbc_cd(String pbcCd) {
		pbc_cd = pbcCd;
	}
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	
}

