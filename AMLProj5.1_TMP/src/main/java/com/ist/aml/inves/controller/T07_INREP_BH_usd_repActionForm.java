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
* <p>T07_INREP_BH_usd_repActionForm.java</p>
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
                                              
public class T07_INREP_BH_usd_repActionForm extends ActionForm {
	private String start_time;
	private String end_time;
	private String organname;
	
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}                                        
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String startTime) {
		start_time = startTime;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String endTime) {
		end_time = endTime;
	}
                                              
/** 对公客户人工预警0903交易金额 */
private Integer amt_03_man_c = new Integer(0);
/** 对私客户系统预警0904交易金额 */
private Integer amt_04_sys_i = new Integer(0);
/** 对私客户系统预警0901交易笔数 */
private Integer trans_01_sys_i = new Integer(0);
/** 对公客户人工预警0904交易笔数 */
private Integer trans_04_man_c = new Integer(0);
/** 对私客户人工预警0904交易金额 */
private Integer amt_04_man_i = new Integer(0);
/** 对私客户人工预警0901交易笔数 */
private Integer trans_01_man_i = new Integer(0);
/** 对私客户系统预警0901交易金额 */
private Integer amt_01_sys_i = new Integer(0);
/** 对私客户系统预警0903交易金额 */
private Integer amt_03_sys_i = new Integer(0);
/** 对私客户人工预警0903交易笔数 */
private Integer trans_03_man_i = new Integer(0);
/** 对公客户人工预警0901交易笔数 */
private Integer trans_01_man_c = new Integer(0);
/** 对公客户系统预警0903交易笔数 */
private Integer trans_03_sys_c = new Integer(0);
/** 对公客户系统预警0904交易金额 */
private Integer amt_04_sys_c = new Integer(0);
/** 对公客户人工预警0903交易笔数 */
private Integer trans_03_man_c = new Integer(0);
/** 对私客户人工预警0903交易金额 */
private Integer amt_03_man_i = new Integer(0);
/** 对私客户系统预警0902交易金额 */
private Integer amt_02_sys_i = new Integer(0);
/** 对公客户系统预警0903交易金额 */
private Integer amt_03_sys_c = new Integer(0);
/** 对私客户人工预警0902交易金额 */
private Integer amt_02_man_i = new Integer(0);
/** 对公客户人工预警0904交易金额 */
private Integer amt_04_man_c = new Integer(0);
/** 对私客户系统预警0902交易笔数 */
private Integer trans_02_sys_i = new Integer(0);
/** 对公客户系统预警0902交易笔数 */
private Integer trans_02_sys_c = new Integer(0);
/** 对公客户人工预警0902交易金额 */
private Integer amt_02_man_c = new Integer(0);
/** 对公客户系统预警0901交易金额 */
private Integer amt_01_sys_c = new Integer(0);
/** 对私客户人工预警0902交易笔数 */
private Integer trans_02_man_i = new Integer(0);
/** 对公客户系统预警0901交易笔数 */
private Integer trans_01_sys_c = new Integer(0);
/** 对私客户人工预警0901交易金额 */
private Integer amt_01_man_i = new Integer(0);
/** 报送日期 */
private Date report_dt = new Date();
/** 对私客户系统预警0904交易笔数 */
private Integer trans_04_sys_i = new Integer(0);
/** 对私客户人工预警0904交易笔数 */
private Integer trans_04_man_i = new Integer(0);
/** 对公客户系统预警0902交易金额 */
private Integer amt_02_sys_c = new Integer(0);
/** 机构号 */
private String organkey = "";
/** 对私客户系统预警0903交易笔数 */
private Integer trans_03_sys_i = new Integer(0);
/** 对公客户人工预警0902交易笔数 */
private Integer trans_02_man_c = new Integer(0);
/** 对公客户人工预警0901交易金额 */
private Integer amt_01_man_c = new Integer(0);
/** 对公客户系统预警0904交易笔数 */
private Integer trans_04_sys_c = new Integer(0);

//=======================================================
/** 报送日期 */
private String report_dt_disp = "";
    /**                   
     * 构造函数           
     */                   
    public T07_INREP_BH_usd_repActionForm() {    
    }                     
public void setAmt_03_man_c(Integer iamt_03_man_c){
this.amt_03_man_c = iamt_03_man_c;
}
public Integer getAmt_03_man_c(){
return this.amt_03_man_c;
}

public void setAmt_04_sys_i(Integer iamt_04_sys_i){
this.amt_04_sys_i = iamt_04_sys_i;
}
public Integer getAmt_04_sys_i(){
return this.amt_04_sys_i;
}

public void setTrans_01_sys_i(Integer itrans_01_sys_i){
this.trans_01_sys_i = itrans_01_sys_i;
}
public Integer getTrans_01_sys_i(){
return this.trans_01_sys_i;
}

public void setTrans_04_man_c(Integer itrans_04_man_c){
this.trans_04_man_c = itrans_04_man_c;
}
public Integer getTrans_04_man_c(){
return this.trans_04_man_c;
}

public void setAmt_04_man_i(Integer iamt_04_man_i){
this.amt_04_man_i = iamt_04_man_i;
}
public Integer getAmt_04_man_i(){
return this.amt_04_man_i;
}

public void setTrans_01_man_i(Integer itrans_01_man_i){
this.trans_01_man_i = itrans_01_man_i;
}
public Integer getTrans_01_man_i(){
return this.trans_01_man_i;
}

public void setAmt_01_sys_i(Integer iamt_01_sys_i){
this.amt_01_sys_i = iamt_01_sys_i;
}
public Integer getAmt_01_sys_i(){
return this.amt_01_sys_i;
}

public void setAmt_03_sys_i(Integer iamt_03_sys_i){
this.amt_03_sys_i = iamt_03_sys_i;
}
public Integer getAmt_03_sys_i(){
return this.amt_03_sys_i;
}

public void setTrans_03_man_i(Integer itrans_03_man_i){
this.trans_03_man_i = itrans_03_man_i;
}
public Integer getTrans_03_man_i(){
return this.trans_03_man_i;
}

public void setTrans_01_man_c(Integer itrans_01_man_c){
this.trans_01_man_c = itrans_01_man_c;
}
public Integer getTrans_01_man_c(){
return this.trans_01_man_c;
}

public void setTrans_03_sys_c(Integer itrans_03_sys_c){
this.trans_03_sys_c = itrans_03_sys_c;
}
public Integer getTrans_03_sys_c(){
return this.trans_03_sys_c;
}

public void setAmt_04_sys_c(Integer iamt_04_sys_c){
this.amt_04_sys_c = iamt_04_sys_c;
}
public Integer getAmt_04_sys_c(){
return this.amt_04_sys_c;
}

public void setTrans_03_man_c(Integer itrans_03_man_c){
this.trans_03_man_c = itrans_03_man_c;
}
public Integer getTrans_03_man_c(){
return this.trans_03_man_c;
}

public void setAmt_03_man_i(Integer iamt_03_man_i){
this.amt_03_man_i = iamt_03_man_i;
}
public Integer getAmt_03_man_i(){
return this.amt_03_man_i;
}

public void setAmt_02_sys_i(Integer iamt_02_sys_i){
this.amt_02_sys_i = iamt_02_sys_i;
}
public Integer getAmt_02_sys_i(){
return this.amt_02_sys_i;
}

public void setAmt_03_sys_c(Integer iamt_03_sys_c){
this.amt_03_sys_c = iamt_03_sys_c;
}
public Integer getAmt_03_sys_c(){
return this.amt_03_sys_c;
}

public void setAmt_02_man_i(Integer iamt_02_man_i){
this.amt_02_man_i = iamt_02_man_i;
}
public Integer getAmt_02_man_i(){
return this.amt_02_man_i;
}

public void setAmt_04_man_c(Integer iamt_04_man_c){
this.amt_04_man_c = iamt_04_man_c;
}
public Integer getAmt_04_man_c(){
return this.amt_04_man_c;
}

public void setTrans_02_sys_i(Integer itrans_02_sys_i){
this.trans_02_sys_i = itrans_02_sys_i;
}
public Integer getTrans_02_sys_i(){
return this.trans_02_sys_i;
}

public void setTrans_02_sys_c(Integer itrans_02_sys_c){
this.trans_02_sys_c = itrans_02_sys_c;
}
public Integer getTrans_02_sys_c(){
return this.trans_02_sys_c;
}

public void setAmt_02_man_c(Integer iamt_02_man_c){
this.amt_02_man_c = iamt_02_man_c;
}
public Integer getAmt_02_man_c(){
return this.amt_02_man_c;
}

public void setAmt_01_sys_c(Integer iamt_01_sys_c){
this.amt_01_sys_c = iamt_01_sys_c;
}
public Integer getAmt_01_sys_c(){
return this.amt_01_sys_c;
}

public void setTrans_02_man_i(Integer itrans_02_man_i){
this.trans_02_man_i = itrans_02_man_i;
}
public Integer getTrans_02_man_i(){
return this.trans_02_man_i;
}

public void setTrans_01_sys_c(Integer itrans_01_sys_c){
this.trans_01_sys_c = itrans_01_sys_c;
}
public Integer getTrans_01_sys_c(){
return this.trans_01_sys_c;
}

public void setAmt_01_man_i(Integer iamt_01_man_i){
this.amt_01_man_i = iamt_01_man_i;
}
public Integer getAmt_01_man_i(){
return this.amt_01_man_i;
}

public void setReport_dt(Date report_dtStr){
this.report_dt = report_dtStr;
}
public Date getReport_dt(){
return this.report_dt;
}

public void setTrans_04_sys_i(Integer itrans_04_sys_i){
this.trans_04_sys_i = itrans_04_sys_i;
}
public Integer getTrans_04_sys_i(){
return this.trans_04_sys_i;
}

public void setTrans_04_man_i(Integer itrans_04_man_i){
this.trans_04_man_i = itrans_04_man_i;
}
public Integer getTrans_04_man_i(){
return this.trans_04_man_i;
}

public void setAmt_02_sys_c(Integer iamt_02_sys_c){
this.amt_02_sys_c = iamt_02_sys_c;
}
public Integer getAmt_02_sys_c(){
return this.amt_02_sys_c;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setTrans_03_sys_i(Integer itrans_03_sys_i){
this.trans_03_sys_i = itrans_03_sys_i;
}
public Integer getTrans_03_sys_i(){
return this.trans_03_sys_i;
}

public void setTrans_02_man_c(Integer itrans_02_man_c){
this.trans_02_man_c = itrans_02_man_c;
}
public Integer getTrans_02_man_c(){
return this.trans_02_man_c;
}

public void setAmt_01_man_c(Integer iamt_01_man_c){
this.amt_01_man_c = iamt_01_man_c;
}
public Integer getAmt_01_man_c(){
return this.amt_01_man_c;
}

public void setTrans_04_sys_c(Integer itrans_04_sys_c){
this.trans_04_sys_c = itrans_04_sys_c;
}
public Integer getTrans_04_sys_c(){
return this.trans_04_sys_c;
}

//=======================================================
public void setReport_dt_disp(String report_dt_dispStr){
this.report_dt_disp = report_dt_dispStr;
}
public String getReport_dt_disp(){
return this.report_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }                                                                                                        
}

