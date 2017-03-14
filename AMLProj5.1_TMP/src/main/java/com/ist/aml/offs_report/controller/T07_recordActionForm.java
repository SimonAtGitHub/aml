/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2009-02-02] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.offs_report.controller;                
                                                  
/**
* <p>T07_recordActionForm.java</p>
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
                                              
public class T07_recordActionForm extends ActionForm {
                                              
/** 协助单位（公安机关/其他机关（不含人民银行））、相关文号、参加人数、发放材料份数 */
private String remark2 = "";
/** 培训方式、宣传方式、问题整改情况 */
private String remark3 = "";
/** 记录类型 1:培训记录；2:宣传记录；3:内控制度；4:内部审计；5:打击洗钱活动情况 */
private String record_type_cd = "";
/** 记录人 */
private String record_user = "";
/** 机构 */
private String organkey = "";
/** 记录编号 */
private String record_id = "";
/** 协助内容、主要内容、培训内容、宣传内容、审计项目名称及主要内容 */
private String content = "";
/** 效果、制度名称、培训对象、参加人数、审计发现的主要问题
 */
private String remark1 = "";
/** 更新人 */
private String last_upd_user = "";
/** 协助时间、制定时间、培训时间、活动时间，审计期限（开始时间） */
private Date create_dt = new Date();
/** 参与人员、被协助部门、制定部门、审计部门名称 */
private String record_obj = "";
/** 更新时间 */
private Date last_upd_dt = new Date();
/** 审计期限结束时间 */
private Date create_end_dt = new Date();

//=======================================================
/** 协助时间、制定时间、培训时间、活动时间，审计期限（开始时间） */
private String create_dt_disp = "";
/** 更新时间 */
private String last_upd_dt_disp = "";
/** 审计期限结束时间 */
private String create_end_dt_disp = "";
/** 接收对应查询条件值 */
private Date create_dt_end=new Date();
/** 接收对应查询条件值 */
private String create_dt_end_disp="";
/** 接收主键值 */
private String[] record_id_selected=null;
/** 季度 */
private String quarter="";
/** 排序 */
private String orderby;
private String order = "2";

/** add lixx 2010.10.21 人行需求增加*/
private String remark4 = ""; //配合调查次数、内控制度不完善
private String remark5 = ""; //冻结人民币次数、大额可疑交易漏报
private String remark6 = ""; //冻结人民币金额（万元）、客户身份识别不到位
private String remark7 = ""; //冻结外币次数、未发现问题
private String remark8 = ""; //冻结外币金额（万美元）、宣传培训不到位
private String remark9 = ""; //报告人民币份数、客户资料保存不全
private String remark10 = ""; //报告人民币金额（万元）、其他问题 
private String remark11 = ""; //报告外币份数
private String remark12 = ""; //报告外币金额（万美元）
/**edd add 2010.10.21*/

    public String[] getRecord_id_selected() {
	return record_id_selected;
}
public void setRecord_id_selected(String[] record_id_selected) {
	this.record_id_selected = record_id_selected;
}
	/**                   
     * 构造函数           
     */                   
    public T07_recordActionForm() {    
    }                     
public void setRemark2(String remark2Str){
this.remark2 = remark2Str;
}
public String getRemark2(){
return this.remark2;
}

public void setRemark3(String remark3Str){
this.remark3 = remark3Str;
}
public String getRemark3(){
return this.remark3;
}

public void setRecord_type_cd(String record_type_cdStr){
this.record_type_cd = record_type_cdStr;
}
public String getRecord_type_cd(){
return this.record_type_cd;
}

public void setRecord_user(String record_userStr){
this.record_user = record_userStr;
}
public String getRecord_user(){
return this.record_user;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setRecord_id(String record_idStr){
this.record_id = record_idStr;
}
public String getRecord_id(){
return this.record_id;
}

public void setContent(String contentStr){
this.content = contentStr;
}
public String getContent(){
return this.content;
}

public void setRemark1(String remark1Str){
this.remark1 = remark1Str;
}
public String getRemark1(){
return this.remark1;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setRecord_obj(String record_objStr){
this.record_obj = record_objStr;
}
public String getRecord_obj(){
return this.record_obj;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setCreate_end_dt(Date create_end_dtStr){
this.create_end_dt = create_end_dtStr;
}
public Date getCreate_end_dt(){
return this.create_end_dt;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}

public void setCreate_end_dt_disp(String create_end_dt_dispStr){
this.create_end_dt_disp = create_end_dt_dispStr;
}
public String getCreate_end_dt_disp(){
return this.create_end_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public Date getCreate_dt_end() {
		return create_dt_end;
	}
	public void setCreate_dt_end(Date create_dt_end) {
		this.create_dt_end = create_dt_end;
	}
	public String getCreate_dt_end_disp() {
		return create_dt_end_disp;
	}
	public void setCreate_dt_end_disp(String create_dt_end_disp) {
		this.create_dt_end_disp = create_dt_end_disp;
	}  
	
	public void reset(){
		this.content="";
		this.create_dt_disp="";
		this.create_dt_end_disp="";
		this.create_end_dt_disp="";
		this.record_obj="";
		this.remark1="";
		this.remark2="";
		this.remark3="";
		this.record_id="";
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	
	/** add lixx 2010.10.21 人行需求增加*/
	public String getRemark4() {
		return remark4;
	}
	public void setRemark4(String remark4) {
		this.remark4 = remark4;
	}
	public String getRemark5() {
		return remark5;
	}
	public void setRemark5(String remark5) {
		this.remark5 = remark5;
	}
	public String getRemark6() {
		return remark6;
	}
	public void setRemark6(String remark6) {
		this.remark6 = remark6;
	}
	public String getRemark7() {
		return remark7;
	}
	public void setRemark7(String remark7) {
		this.remark7 = remark7;
	}
	public String getRemark8() {
		return remark8;
	}
	public void setRemark8(String remark8) {
		this.remark8 = remark8;
	}
	public String getRemark9() {
		return remark9;
	}
	public void setRemark9(String remark9) {
		this.remark9 = remark9;
	}
	public String getRemark10() {
		return remark10;
	}
	public void setRemark10(String remark10) {
		this.remark10 = remark10;
	}
	public String getRemark11() {
		return remark11;
	}
	public void setRemark11(String remark11) {
		this.remark11 = remark11;
	}
	public String getRemark12() {
		return remark12;
	}
	public void setRemark12(String remark12) {
		this.remark12 = remark12;
	}
	/**end add*/
	
}


