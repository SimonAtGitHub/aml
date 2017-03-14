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

package com.ist.aml.report.dto;                
                                                  
/**
* <p>T07_report_organ.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_report_organ extends BaseDTO {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 3234097734435514711L;
/** 人行机构编号 */
private String report_organkey = "";
/** 人行机构名称 */
private String organkey;
private String organ_mapkey;
private String organname = "";
/** 创建机构 */
private String inner_organkey = "";
/** 人行机构表 */
private String seq_tablename = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_report_organ() {    
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

//=======================================================
}

