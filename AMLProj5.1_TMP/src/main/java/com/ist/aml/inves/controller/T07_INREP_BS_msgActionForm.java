/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2014-02-10] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.inves.controller;                
                                                  
/**
* <p>T07_INREP_BS_msgActionForm.java</p>
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
                                              
public class T07_INREP_BS_msgActionForm extends ActionForm {
                                              
/** 可疑补报报文 */
private Integer msg_a = new Integer(0);
/** 可疑补正报文 */
private Integer msg_i = new Integer(0);
/** 机构号 */
private String organkey = "";
/** 可疑纠错报文 */
private Integer msg_c = new Integer(0);
/** 可疑正常报文 */
private Integer msg_n = new Integer(0);
/** 报送日期 */
private Date report_dt = new Date();
/** 可疑重发报文 */
private Integer msg_r = new Integer(0);
/**机构名*/
private String organname  = "";
/**报送开始日期*/
private String report_dt_disp = "";
/**报送截至日期*/
private String report_dt_end = "";   
    /**                   
     * 构造函数           
     */                   
    public T07_INREP_BS_msgActionForm() {    
    }                     
public void setMsg_a(Integer imsg_a){
this.msg_a = imsg_a;
}
public Integer getMsg_a(){
return this.msg_a;
}

public void setMsg_i(Integer imsg_i){
this.msg_i = imsg_i;
}
public Integer getMsg_i(){
return this.msg_i;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setMsg_c(Integer imsg_c){
this.msg_c = imsg_c;
}
public Integer getMsg_c(){
return this.msg_c;
}

public void setMsg_n(Integer imsg_n){
this.msg_n = imsg_n;
}
public Integer getMsg_n(){
return this.msg_n;
}

public void setReport_dt(Date report_dtStr){
this.report_dt = report_dtStr;
}
public Date getReport_dt(){
return this.report_dt;
}

public void setMsg_r(Integer imsg_r){
this.msg_r = imsg_r;
}
public Integer getMsg_r(){
return this.msg_r;
}

//=======================================================
public void setReport_dt_disp(String report_dt_dispStr){
this.report_dt_disp = report_dt_dispStr;
}
public String getReport_dt_disp(){
return this.report_dt_disp;
}

public String getOrganname() {
	return organname;
}
public void setOrganname(String organname) {
	this.organname = organname;
}
public String getReport_dt_end() {
	return report_dt_end;
}
public void setReport_dt_end(String reportDtEnd) {
	report_dt_end = reportDtEnd;
}
	//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }                                                                                                        
}

