/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-06-26] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.report.controller;                
                                                  
/**
* <p>T07_report_organActionForm.java</p>
* <p>Description: </p>

*/

import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_report_organActionForm extends ActionForm {
                                              
/** 人行机构编号 */
private String report_organkey = "";
/** 人行机构名称 */
private String organkey="";
private String organ_mapkey;
private String organname = "";
/** 机构 */
private String inner_organkey = "";
/** 机构序列表 */
private String seq_tablename = "";
/** 复选框 */
private String[] selectedReport_organkey={};
private String[] selectedOrgankey={};

//=======================================================
    /**                   
     * 构造函数           
     */                   
    public T07_report_organActionForm() {    
    }                     
public void setReport_organkey(String report_organkeyStr){
this.report_organkey = report_organkeyStr;
}
public String getReport_organkey(){
return this.report_organkey;
}

public void setOrganname(String organnameStr){
this.organname = organnameStr;
}
public String getOrganname(){
return this.organname;
}

public void setInner_organkey(String inner_organkeyStr){
this.inner_organkey = inner_organkeyStr;
}
public String getInner_organkey(){
return this.inner_organkey;
}

public void setSeq_tablename(String seq_tablenameStr){
this.seq_tablename = seq_tablenameStr;
}
public String getSeq_tablename(){
return this.seq_tablename;
}

public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}

	public String getOrgan_mapkey() {
	return organ_mapkey;
}
public void setOrgan_mapkey(String organMapkey) {
	organ_mapkey = organMapkey;
}

	
	public String[] getSelectedReport_organkey() {
	return selectedReport_organkey;
}
public void setSelectedReport_organkey(String[] selectedReportOrgankey) {
	selectedReport_organkey = selectedReportOrgankey;
}

	public String[] getSelectedOrgankey() {
	return selectedOrgankey;
}
public void setSelectedOrgankey(String[] selectedOrgankey) {
	this.selectedOrgankey = selectedOrgankey;
}
	//=======================================================
//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }                                                                                                        
}

