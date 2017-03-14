/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2009-02-09] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.offs_report.controller;                
                                                  
/**
* <p>T07_amlpostActionForm.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_amlpostActionForm extends ActionForm {
/** 单位负责人姓名 */
private String organ_username="";
/** 单位负责人职务名称 */
private String organ_position="";
/** 单位负责人联系电话*/
private String organ_telephone="";
/** 反洗钱部门负责人*/
private String depart_username="";
/** 反洗钱部门联系电话*/
private String depart_telephone="";
/** 专职人数*/
private String full_time_num="";
/** 兼职人数*/
private String part_time_num="";
/** 主键 */
private String user_id = "";
/** 机构 */
private String organkey = "";
/** 部门名称 */
private String department = "";



/** 联系电话 */
private String telephone = "";
/** 1:单位负责人；2:反洗钱部门负责人;3:反洗钱人员 */
private String postitle = "";
private String postitle_disp = "";
/** 1:专职;2:兼职 */
private String us_status = "";
private String us_status_disp = "";
/** 职务名称 */
private String position = "";
/** 姓名 */
private String name = "";
/** null */
private String last_upd_user = "";
/** null */
private Date last_upd_dt = new Date();

//=======================================================
/** null */
private String last_upd_dt_disp = "";
/** 接收主键值 */
private String user_id_selected[]=null;
private String organkey_disp="";
/** 显示机构名称*/
private String searchOrganName="";
    public String getOrgankey_disp() {
	return organkey_disp;
}
public void setOrgankey_disp(String organkey_disp) {
	this.organkey_disp = organkey_disp;
}
	public String[] getUser_id_selected() {
	return user_id_selected;
}
public void setUser_id_selected(String[] user_id_selected) {
	this.user_id_selected = user_id_selected;
}
	/**                   
     * 构造函数           
     */                   
    public T07_amlpostActionForm() {    
    }                     
public void setTelephone(String telephoneStr){
this.telephone = telephoneStr;
}
public String getTelephone(){
return this.telephone;
}

public void setDepartment(String departmentStr){
this.department = departmentStr;
}
public String getDepartment(){
return this.department;
}

public void setPostitle(String postitleStr){
this.postitle = postitleStr;
}
public String getPostitle(){
return this.postitle;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setUs_status(String us_statusStr){
this.us_status = us_statusStr;
}
public String getUs_status(){
return this.us_status;
}

public void setPosition(String positionStr){
this.position = positionStr;
}
public String getPosition(){
return this.position;
}

public void setName(String nameStr){
this.name = nameStr;
}
public String getName(){
return this.name;
}

public void setUser_id(String user_idStr){
this.user_id = user_idStr;
}
public String getUser_id(){
return this.user_id;
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

//=======================================================
public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) { 
    	this.name="";
    	this.organkey="";
    	this.position="";
    	this.department="";
    	this.telephone="";
    	this.postitle="";
    	this.us_status="";
    	this.organkey_disp="";
    	this.postitle_disp="";
    	this.us_status_disp="";	
    }
    
    public void reset(){
    	this.name="";
    	this.organkey="";
    	this.position="";
    	this.department="";
    	this.telephone="";
    	this.postitle="";
    	this.us_status="";
    	this.organkey_disp="";
    	this.postitle_disp="";
    	this.us_status_disp="";
    	this.organ_position="";
    	this.organ_telephone="";
    	this.organ_username="";
    	this.depart_telephone="";
    	this.depart_username="";
    }
	public String getPostitle_disp() {
		return postitle_disp;
	}
	public void setPostitle_disp(String postitle_disp) {
		this.postitle_disp = postitle_disp;
	}
	public String getUs_status_disp() {
		return us_status_disp;
	}
	public void setUs_status_disp(String us_status_disp) {
		this.us_status_disp = us_status_disp;
	}
	public String getSearchOrganName() {
		return searchOrganName;
	}
	public void setSearchOrganName(String searchOrganName) {
		this.searchOrganName = searchOrganName;
	}
	public String getDepart_telephone() {
		return depart_telephone;
	}
	public void setDepart_telephone(String depart_telephone) {
		this.depart_telephone = depart_telephone;
	}
	public String getDepart_username() {
		return depart_username;
	}
	public void setDepart_username(String depart_username) {
		this.depart_username = depart_username;
	}
	public String getFull_time_num() {
		return full_time_num;
	}
	public void setFull_time_num(String full_time_num) {
		this.full_time_num = full_time_num;
	}
	public String getOrgan_position() {
		return organ_position;
	}
	public void setOrgan_position(String organ_position) {
		this.organ_position = organ_position;
	}
	public String getOrgan_telephone() {
		return organ_telephone;
	}
	public void setOrgan_telephone(String organ_telephone) {
		this.organ_telephone = organ_telephone;
	}
	public String getOrgan_username() {
		return organ_username;
	}
	public void setOrgan_username(String organ_username) {
		this.organ_username = organ_username;
	}
	public String getPart_time_num() {
		return part_time_num;
	}
	public void setPart_time_num(String part_time_num) {
		this.part_time_num = part_time_num;
	}                                                                                                        
}

