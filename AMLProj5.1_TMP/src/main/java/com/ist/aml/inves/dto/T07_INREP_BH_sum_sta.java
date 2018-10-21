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
* <p>T07_INREP_BH_sum_sta.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T07_INREP_BH_sum_sta extends BaseDTO {
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
/** ��˽�ͻ���ҽ�� */
private Long amt_fc_i = new Long(0);
/** ��˽�ͻ����ҽ�� */
private Long amt_dc_i = new Long(0);
/** ɸѡ���� */
private Date statistic_dt = new Date();
/** ������ */
private String organkey = "";
/** �Թ��ͻ����ҽ�� */
private Long amt_dc_c = new Long(0);
/** �Թ��ͻ���ҽ�� */
private Long amt_fc_c = new Long(0);
/** ��˽�ͻ����ұ��� */
private Long trans_dc_i = new Long(0);
/** ��˽�ͻ���ұ��� */
private Long trans_fc_i = new Long(0);
/** �Թ��ͻ���ұ��� */
private Long trans_fc_c = new Long(0);
/** �Թ��ͻ����ұ��� */
private Long trans_dc_c = new Long(0);
//=======================================================
/** ɸѡ���� */
private String statistic_dt_disp = "";
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_INREP_BH_sum_sta() {    
    }                     
public void setAmt_fc_i(Long iamt_fc_i){
this.amt_fc_i = iamt_fc_i;
}
public Long getAmt_fc_i(){
return this.amt_fc_i;
}

public void setAmt_dc_i(Long iamt_dc_i){
this.amt_dc_i = iamt_dc_i;
}
public Long getAmt_dc_i(){
return this.amt_dc_i;
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

public void setAmt_dc_c(Long iamt_dc_c){
this.amt_dc_c = iamt_dc_c;
}
public Long getAmt_dc_c(){
return this.amt_dc_c;
}

public void setAmt_fc_c(Long iamt_fc_c){
this.amt_fc_c = iamt_fc_c;
}
public Long getAmt_fc_c(){
return this.amt_fc_c;
}

public void setTrans_dc_i(Long itrans_dc_i){
this.trans_dc_i = itrans_dc_i;
}
public Long getTrans_dc_i(){
return this.trans_dc_i;
}

public void setTrans_fc_i(Long itrans_fc_i){
this.trans_fc_i = itrans_fc_i;
}
public Long getTrans_fc_i(){
return this.trans_fc_i;
}

public void setTrans_fc_c(Long itrans_fc_c){
this.trans_fc_c = itrans_fc_c;
}
public Long getTrans_fc_c(){
return this.trans_fc_c;
}

public void setTrans_dc_c(Long itrans_dc_c){
this.trans_dc_c = itrans_dc_c;
}
public Long getTrans_dc_c(){
return this.trans_dc_c;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

}

