/**
* Create by makecode program v2.1
* 日期             作者 		动作
* 2009-06-27   青蛙		创建
*/

package com.ist.aml.report.dto;                
                                                  
/**
* <p>Title: IST BRMS</p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2003 - 2007</p>
* <p>Company: 北京银丰新融科技开发有限公司</p>
* @author 研发组
* @version 1.0
*/

import java.io.Serializable; 

import java.util.Date;       
       
                                              
public class T07_Blacklist implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = -2602463387960205631L;
/**
 * 1：申批通过，2：待审核，3：审核不通过，4：待审批，5：审批不通过
 */             
private String ischeck = "";
private String isuse_new = "";
private String reason_create_new = "";
private Date validate_dt_new = null;
private Date invalidate_dt_new = null;
private String validate_dt_new_disp = "";
private String invalidate_dt_new_disp = "";
/** LIST_TYPE */
private String list_type = "";
/** INVALIDATE_DT */
private Date invalidate_dt = null;
/** PARTY_ID */
private String party_id = "";
/** ISUSE */
private String isuse = "";
/** VALIDATE_DT */
private Date validate_dt = null;
/** ORGANKEY */
private String organkey = "";
private String organkeystr = "";
/** REASON_CANCEL */
private String reason_cancel = "";
/** PARTY_CLASS_CD */
private String party_class_cd = "";
/** REASON_CREATE */
private String reason_create = "";
/** OBJ_NAME */
private String obj_name = "";
/** MODIFY_USER */
private String modify_user = "";
/** CREATE_USER */
private String create_user = "";
/** CREATE_DT */
private Date create_dt = null;
private Date create1_dt = null;
/** MODIFY_DT */
private Date modify_dt = null;
private String lists_type = "";
/** listsearch_type */
private String listsearch_type = "";
/** listsearch_type */
private String fashion = "";
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
private String[] selectedPartyId = {};  
/** logon */
private String view = "";
private String external_id = "";
private String category = "";
private String title = "";
private String programs = "";
private String birth_date = "";
private String last_occupation = "";
private String residence_country = "";
private String birth_country = "";
private String nationality = "";
private String gender = "";
private String remarks = "";
private String organname = "";
private String objkey = "";//区分黑名单中客户的唯一标示，有同名同号的，据此区分记录
private String name_type = "";
private String m_list_type="";
private String card_type="";
private String card_no="";
private String is_party_id="";

/** start add lixx 2011.09.26 名单管理 流程添加是否有审核操作 */
private String ischeck_disp = "";
/** end add lixx 2011.09.26 名单管理 流程添加是否有审核操作 */

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
    public T07_Blacklist() {    
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
public String getIscheck() {
	return ischeck;
}
public void setIscheck(String ischeck) {
	this.ischeck = ischeck;
}
public String getIsuse_new() {
	return isuse_new;
}
public void setIsuse_new(String isuse_new) {
	this.isuse_new = isuse_new;
}
public String getReason_create_new() {
	return reason_create_new;
}
public void setReason_create_new(String reason_create_new) {
	this.reason_create_new = reason_create_new;
}
public Date getValidate_dt_new() {
	return validate_dt_new;
}
public void setValidate_dt_new(Date validate_dt_new) {
	this.validate_dt_new = validate_dt_new;
}
public Date getInvalidate_dt_new() {
	return invalidate_dt_new;
}
public void setInvalidate_dt_new(Date invalidate_dt_new) {
	this.invalidate_dt_new = invalidate_dt_new;
}
public String getValidate_dt_new_disp() {
	return validate_dt_new_disp;
}
public void setValidate_dt_new_disp(String validate_dt_new_disp) {
	this.validate_dt_new_disp = validate_dt_new_disp;
}
public String getInvalidate_dt_new_disp() {
	return invalidate_dt_new_disp;
}
public void setInvalidate_dt_new_disp(String invalidate_dt_new_disp) {
	this.invalidate_dt_new_disp = invalidate_dt_new_disp;
}
public String getExternal_id() {
	return external_id;
}
public void setExternal_id(String external_id) {
	this.external_id = external_id;
}
public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getPrograms() {
	return programs;
}
public void setPrograms(String programs) {
	this.programs = programs;
}
public String getBirth_date() {
	return birth_date;
}
public void setBirth_date(String birth_date) {
	this.birth_date = birth_date;
}
public String getLast_occupation() {
	return last_occupation;
}
public void setLast_occupation(String last_occupation) {
	this.last_occupation = last_occupation;
}
public String getResidence_country() {
	return residence_country;
}
public void setResidence_country(String residence_country) {
	this.residence_country = residence_country;
}
public String getBirth_country() {
	return birth_country;
}
public void setBirth_country(String birth_country) {
	this.birth_country = birth_country;
}
public String getNationality() {
	return nationality;
}
public void setNationality(String nationality) {
	this.nationality = nationality;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getRemarks() {
	return remarks;
}
public void setRemarks(String remarks) {
	this.remarks = remarks;
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
/**
 * @return the name_type
 */
public String getName_type() {
    return name_type;
}
/**
 * @param name_type the name_type to set
 */
public void setName_type(String name_type) {
    this.name_type = name_type;
}
public String getOrgankeystr() {
	return organkeystr;
}
public void setOrgankeystr(String organkeystr) {
	this.organkeystr = organkeystr;
}
public String getIscheck_disp() {
	return ischeck_disp;
}
public void setIscheck_disp(String ischeck_disp) {
	this.ischeck_disp = ischeck_disp;
}
}

