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

package com.ist.aml.inves.dto;                
                                                  
/**
* <p>T07_INREP_BH_cny_sta.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T07_INREP_BH_cny_sta extends BaseDTO {
	private String start_time;
	private String end_time;
	private Date report_dt_start;
	private Date report_dt_end;
	private String org_ids;
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
	public Date getReport_dt_start() {
		return report_dt_start;
	}
	public void setReport_dt_start(Date reportDtStart) {
		report_dt_start = reportDtStart;
	}
	public Date getReport_dt_end() {
		return report_dt_end;
	}
	public void setReport_dt_end(Date reportDtEnd) {
		report_dt_end = reportDtEnd;
	}
	public String getOrg_ids() {
		return org_ids;
	}
	public void setOrg_ids(String orgIds) {
		org_ids = orgIds;
	}                                              
/** 对私客户0903交易笔数 */
private Integer trans_03_i = new Integer(0);
/** 对私客户0901交易金额 */
private Integer amt_01_i = new Integer(0);
/** 对私客户0904交易金额 */
private Integer amt_04_i = new Integer(0);
/** 对公客户0902交易笔数 */
private Integer trans_02_c = new Integer(0);
/** 对公客户0903交易笔数 */
private Integer trans_03_c = new Integer(0);
/** 对公客户0903交易金额 */
private Integer amt_03_c = new Integer(0);
/** 对私客户0904交易笔数 */
private Integer trans_04_i = new Integer(0);
/** 筛选日期 */
private Date statistic_dt = new Date();
/** 机构号 */
private String organkey = "";
/** 对公客户0901交易金额 */
private Integer amt_01_c = new Integer(0);
/** 对私客户0902交易笔数 */
private Integer trans_02_i = new Integer(0);
/** 对公客户0902交易金额 */
private Integer amt_02_c = new Integer(0);
/** 对私客户0901交易笔数 */
private Integer trans_01_i = new Integer(0);
/** 对公客户0904交易笔数 */
private Integer trans_04_c = new Integer(0);
/** 对公客户0901交易笔数 */
private Integer trans_01_c = new Integer(0);
/** 对私客户0903交易金额 */
private Integer amt_03_i = new Integer(0);
/** 对私客户0902交易金额 */
private Integer amt_02_i = new Integer(0);
/** 对公客户0904交易金额 */
private Integer amt_04_c = new Integer(0);
//=======================================================
/** 筛选日期 */
private String statistic_dt_disp = "";
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_INREP_BH_cny_sta() {    
    }                     
public void setTrans_03_i(Integer itrans_03_i){
this.trans_03_i = itrans_03_i;
}
public Integer getTrans_03_i(){
return this.trans_03_i;
}

public void setAmt_01_i(Integer iamt_01_i){
this.amt_01_i = iamt_01_i;
}
public Integer getAmt_01_i(){
return this.amt_01_i;
}

public void setAmt_04_i(Integer iamt_04_i){
this.amt_04_i = iamt_04_i;
}
public Integer getAmt_04_i(){
return this.amt_04_i;
}

public void setTrans_02_c(Integer itrans_02_c){
this.trans_02_c = itrans_02_c;
}
public Integer getTrans_02_c(){
return this.trans_02_c;
}

public void setTrans_03_c(Integer itrans_03_c){
this.trans_03_c = itrans_03_c;
}
public Integer getTrans_03_c(){
return this.trans_03_c;
}

public void setAmt_03_c(Integer iamt_03_c){
this.amt_03_c = iamt_03_c;
}
public Integer getAmt_03_c(){
return this.amt_03_c;
}

public void setTrans_04_i(Integer itrans_04_i){
this.trans_04_i = itrans_04_i;
}
public Integer getTrans_04_i(){
return this.trans_04_i;
}

public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setAmt_01_c(Integer iamt_01_c){
this.amt_01_c = iamt_01_c;
}
public Integer getAmt_01_c(){
return this.amt_01_c;
}

public void setTrans_02_i(Integer itrans_02_i){
this.trans_02_i = itrans_02_i;
}
public Integer getTrans_02_i(){
return this.trans_02_i;
}

public void setAmt_02_c(Integer iamt_02_c){
this.amt_02_c = iamt_02_c;
}
public Integer getAmt_02_c(){
return this.amt_02_c;
}

public void setTrans_01_i(Integer itrans_01_i){
this.trans_01_i = itrans_01_i;
}
public Integer getTrans_01_i(){
return this.trans_01_i;
}

public void setTrans_04_c(Integer itrans_04_c){
this.trans_04_c = itrans_04_c;
}
public Integer getTrans_04_c(){
return this.trans_04_c;
}

public void setTrans_01_c(Integer itrans_01_c){
this.trans_01_c = itrans_01_c;
}
public Integer getTrans_01_c(){
return this.trans_01_c;
}

public void setAmt_03_i(Integer iamt_03_i){
this.amt_03_i = iamt_03_i;
}
public Integer getAmt_03_i(){
return this.amt_03_i;
}

public void setAmt_02_i(Integer iamt_02_i){
this.amt_02_i = iamt_02_i;
}
public Integer getAmt_02_i(){
return this.amt_02_i;
}

public void setAmt_04_c(Integer iamt_04_c){
this.amt_04_c = iamt_04_c;
}
public Integer getAmt_04_c(){
return this.amt_04_c;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

}

