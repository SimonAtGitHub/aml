/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2009-06-27   青蛙		创建        
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
import org.apache.struts.upload.FormFile;

import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_BlacklistActionForm extends ActionForm {
         
private String ischeck = "";
/** LIST_TYPE */
private String list_type = "";
/** INVALIDATE_DT */
private Date invalidate_dt = null;
/** PARTY_ID */
private String party_id = "";
/** PARTY_IDW */
private String party_idw = "";
/** ISUSE */
private String isuse = "";
/** VALIDATE_DT */
private Date validate_dt = null;
/** ORGANKEY */
private String organkey = "";
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
/** OBJ_NAMEW */
private String obj_namew = "";
/** MODIFY_USER */
private String modify_user = "";
/** CREATE_USER */
private String create_user = "";
/** CREATE_DT */
private Date create_dt = null;
private Date create1_dt = null;
/** MODIFY_DT */
private Date modify_dt = null;
/** list_type */
private String lists_type = "";
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
private String create1_dt_disp = "";
/** MODIFY_DT */
private String modify_dt_disp = "";
/** logon */
private String view = "";
private String[] selectedPartyId = {};
private String objkey = "";
private String organname;
//黑名单分类
private String m_list_type="";
private String card_type="";
private String card_no="";
private String is_party_id="";
private String rule_type="";
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
public String getIs_party_id() {
	return is_party_id;
}
public void setIs_party_id(String is_party_id) {
	this.is_party_id = is_party_id;
}
	public String getM_list_type() {
	return m_list_type;
}
public void setM_list_type(String m_list_type) {
	this.m_list_type = m_list_type;
}
	/**                   
     * 构造函数           
     */                   
    public T07_BlacklistActionForm() {    
    }                     
public void setList_type(String list_typeStr){
this.list_type = list_typeStr;
}
public String getList_type(){
return this.list_type;
}

public void setInvalidate_dt(Date invalidate_dtStr){
this.invalidate_dt = invalidate_dtStr;
}
public Date getInvalidate_dt(){
return this.invalidate_dt;
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
		return create1_dt;
	}
	public void setCreate1_dt(Date create1_dt) {
		this.create1_dt = create1_dt;
	}
	public String getLists_type() {
		return lists_type;
	}
	public void setLists_type(String lists_type) {
		this.lists_type = lists_type;
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
	public String getCreate1_dt_disp() {
		return create1_dt_disp;
	}
	public void setCreate1_dt_disp(String create1_dt_disp) {
		this.create1_dt_disp = create1_dt_disp;
	}
	public String[] getSelectedPartyId() {
		return selectedPartyId;
	}
	public void setSelectedPartyId(String[] selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
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
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
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
	public String getRule_type() {
		return rule_type;
	}
	public void setRule_type(String rule_type) {
		this.rule_type = rule_type;
	}                                                                                                        
}

