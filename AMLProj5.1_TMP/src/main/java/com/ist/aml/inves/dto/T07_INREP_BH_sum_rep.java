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
* <p>T07_INREP_BH_sum_rep.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T07_INREP_BH_sum_rep extends BaseDTO {
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
/** �Թ��ͻ��˹�Ԥ����ҽ��׽�� */
private Long amt_fc_man_c = new Long(0);
/** ��˽�ͻ�ϵͳԤ�����ҽ��ױ��� */
private Long trans_dc_sys_i = new Long(0);
/** ��˽�ͻ�ϵͳԤ�����ҽ��׽�� */
private Long amt_dc_sys_i = new Long(0);
/** �Թ��ͻ��˹�Ԥ����ҽ��ױ��� */
private Long trans_fc_man_c = new Long(0);
/** ��˽�ͻ��˹�Ԥ����ҽ��ױ��� */
private Long trans_fc_man_i = new Long(0);
/** �Թ��ͻ�ϵͳԤ����ҽ��ױ��� */
private Long trans_fc_sys_c = new Long(0);
/** �Թ��ͻ�ϵͳԤ�����ҽ��׽�� */
private Long amt_dc_sys_c = new Long(0);
/** �Թ��ͻ�ϵͳԤ�����ҽ��ױ��� */
private Long trans_dc_sys_c = new Long(0);
/** �������� */
private Date report_dt = new Date();
/** �Թ��ͻ��˹�Ԥ�����ҽ��ױ��� */
private Long trans_dc_man_c = new Long(0);
/** �Թ��ͻ��˹�Ԥ�����ҽ��׽�� */
private Long amt_dc_man_c = new Long(0);
/** ��˽�ͻ��˹�Ԥ�����ҽ��ױ��� */
private Long trans_dc_man_i = new Long(0);
/** ��˽�ͻ��˹�Ԥ�����ҽ��׽�� */
private Long amt_dc_man_i = new Long(0);
/** ������ */
private String organkey = "";
/** ��˽�ͻ�ϵͳԤ����ҽ��׽�� */
private Long amt_fc_sys_i = new Long(0);
/** ��˽�ͻ��˹�Ԥ����ҽ��׽�� */
private Long amt_fc_man_i = new Long(0);
/** ��˽�ͻ�ϵͳԤ����ҽ��ױ��� */
private Long trans_fc_sys_i = new Long(0);
/** �Թ��ͻ�ϵͳԤ����ҽ��׽�� */
private Long amt_fc_sys_c = new Long(0);
//=======================================================
/** �������� */
private String report_dt_disp = "";
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_INREP_BH_sum_rep() {    
    }                     
public void setAmt_fc_man_c(Long iamt_fc_man_c){
this.amt_fc_man_c = iamt_fc_man_c;
}
public Long getAmt_fc_man_c(){
return this.amt_fc_man_c;
}

public void setTrans_dc_sys_i(Long itrans_dc_sys_i){
this.trans_dc_sys_i = itrans_dc_sys_i;
}
public Long getTrans_dc_sys_i(){
return this.trans_dc_sys_i;
}

public void setAmt_dc_sys_i(Long iamt_dc_sys_i){
this.amt_dc_sys_i = iamt_dc_sys_i;
}
public Long getAmt_dc_sys_i(){
return this.amt_dc_sys_i;
}

public void setTrans_fc_man_c(Long itrans_fc_man_c){
this.trans_fc_man_c = itrans_fc_man_c;
}
public Long getTrans_fc_man_c(){
return this.trans_fc_man_c;
}

public void setTrans_fc_man_i(Long itrans_fc_man_i){
this.trans_fc_man_i = itrans_fc_man_i;
}
public Long getTrans_fc_man_i(){
return this.trans_fc_man_i;
}

public void setTrans_fc_sys_c(Long itrans_fc_sys_c){
this.trans_fc_sys_c = itrans_fc_sys_c;
}
public Long getTrans_fc_sys_c(){
return this.trans_fc_sys_c;
}

public void setAmt_dc_sys_c(Long iamt_dc_sys_c){
this.amt_dc_sys_c = iamt_dc_sys_c;
}
public Long getAmt_dc_sys_c(){
return this.amt_dc_sys_c;
}

public void setTrans_dc_sys_c(Long itrans_dc_sys_c){
this.trans_dc_sys_c = itrans_dc_sys_c;
}
public Long getTrans_dc_sys_c(){
return this.trans_dc_sys_c;
}

public void setReport_dt(Date report_dtStr){
this.report_dt = report_dtStr;
}
public Date getReport_dt(){
return this.report_dt;
}

public void setTrans_dc_man_c(Long itrans_dc_man_c){
this.trans_dc_man_c = itrans_dc_man_c;
}
public Long getTrans_dc_man_c(){
return this.trans_dc_man_c;
}

public void setAmt_dc_man_c(Long iamt_dc_man_c){
this.amt_dc_man_c = iamt_dc_man_c;
}
public Long getAmt_dc_man_c(){
return this.amt_dc_man_c;
}

public void setTrans_dc_man_i(Long itrans_dc_man_i){
this.trans_dc_man_i = itrans_dc_man_i;
}
public Long getTrans_dc_man_i(){
return this.trans_dc_man_i;
}

public void setAmt_dc_man_i(Long iamt_dc_man_i){
this.amt_dc_man_i = iamt_dc_man_i;
}
public Long getAmt_dc_man_i(){
return this.amt_dc_man_i;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setAmt_fc_sys_i(Long iamt_fc_sys_i){
this.amt_fc_sys_i = iamt_fc_sys_i;
}
public Long getAmt_fc_sys_i(){
return this.amt_fc_sys_i;
}

public void setAmt_fc_man_i(Long iamt_fc_man_i){
this.amt_fc_man_i = iamt_fc_man_i;
}
public Long getAmt_fc_man_i(){
return this.amt_fc_man_i;
}

public void setTrans_fc_sys_i(Long itrans_fc_sys_i){
this.trans_fc_sys_i = itrans_fc_sys_i;
}
public Long getTrans_fc_sys_i(){
return this.trans_fc_sys_i;
}

public void setAmt_fc_sys_c(Long iamt_fc_sys_c){
this.amt_fc_sys_c = iamt_fc_sys_c;
}
public Long getAmt_fc_sys_c(){
return this.amt_fc_sys_c;
}

//=======================================================
public void setReport_dt_disp(String report_dt_dispStr){
this.report_dt_disp = report_dt_dispStr;
}
public String getReport_dt_disp(){
return this.report_dt_disp;
}

}

