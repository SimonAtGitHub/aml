package com.ist.aml.offs_report.dto;                
                                                  
/**
* <p>T07_amlpost.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.io.Serializable;
import java.util.*;
//import com.ist.common.base.BaseDTO; 
                                              
public class T07_amlpost  implements Serializable {


	private static final long serialVersionUID = 6558475081466513912L;
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
private String organkey_disp = "";
/** 1:专职;2:兼职 */
private String us_status = "";
/** 职务名称 */
private String position = "";
/** 姓名 */
private String name = "";
/** 更新人 */
private String last_upd_user = "";
/** 更新日期 */
private Date last_upd_dt = new Date();
//=======================================================
/** 更新日期 */
private String last_upd_dt_disp = "";
/** 翻页信息*/
private String intPage = "0";
/** 用户机构权限字符串 */
private String organstr="";
/** 上级机构 */
private String uporgankey="";
public String getOrganstr() {
	return organstr;
}
public void setOrganstr(String organstr) {
	this.organstr = organstr;
}
public String getUporgankey() {
	return uporgankey;
}
public void setUporgankey(String uporgankey) {
	this.uporgankey = uporgankey;
}
/**                   
 * 构造函数           
 */                   
public T07_amlpost() {    
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
public String getOrgankey_disp() {
	return organkey_disp;
}
public void setOrgankey_disp(String organkey_disp) {
	this.organkey_disp = organkey_disp;
}
public String getIntPage() {
	return intPage;
}
public void setIntPage(String intPage) {
	this.intPage = intPage;
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

