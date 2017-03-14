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
* <p>T07_INREP_FR.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T07_INREP_FR extends BaseDTO {
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
/** 人民币交易需补录数 */
private Integer trans_need_dc = new Integer(0);
/** 统计类型: 1 大额, 2 可疑 */
private String cast_type = "";
/** 对公客户需补录量 */
private Integer cust_need_c = new Integer(0);
/** 对私客户需补录量 */
private Integer cust_need_i = new Integer(0);
/** 外币交易总数 */
private Integer trans_all_fc = new Integer(0);
/** 对私客户已补录量 */
private Integer cust_done_i = new Integer(0);
/** 外币交易需补录数 */
private Integer trans_need_fc = new Integer(0);
/** 人民币交易已补录量 */
private Integer trans_done_dc = new Integer(0);
/** 本币交易总数 */
private Integer trans_all_dc = new Integer(0);
/** 筛选日期 */
private Date statistic_dt = new Date();
/** 对公客户总量 */
private Integer cust_all_c = new Integer(0);
/** 机构号 */
private String organkey = "";
/** 外币交易已补录量 */
private Integer trans_done_fc = new Integer(0);
/** 对公客户需补录最终量 */
private Integer cust_done_c = new Integer(0);
/** 对私客户总量 */
private Integer cust_all_i = new Integer(0);
//=======================================================
/** 筛选日期 */
private String statistic_dt_disp = "";
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_INREP_FR() {    
    }                     
public void setTrans_need_dc(Integer itrans_need_dc){
this.trans_need_dc = itrans_need_dc;
}
public Integer getTrans_need_dc(){
return this.trans_need_dc;
}

public void setCast_type(String cast_typeStr){
this.cast_type = cast_typeStr;
}
public String getCast_type(){
return this.cast_type;
}

public void setCust_need_c(Integer icust_need_c){
this.cust_need_c = icust_need_c;
}
public Integer getCust_need_c(){
return this.cust_need_c;
}

public void setCust_need_i(Integer icust_need_i){
this.cust_need_i = icust_need_i;
}
public Integer getCust_need_i(){
return this.cust_need_i;
}

public void setTrans_all_fc(Integer itrans_all_fc){
this.trans_all_fc = itrans_all_fc;
}
public Integer getTrans_all_fc(){
return this.trans_all_fc;
}

public void setCust_done_i(Integer icust_done_i){
this.cust_done_i = icust_done_i;
}
public Integer getCust_done_i(){
return this.cust_done_i;
}

public void setTrans_need_fc(Integer itrans_need_fc){
this.trans_need_fc = itrans_need_fc;
}
public Integer getTrans_need_fc(){
return this.trans_need_fc;
}

public void setTrans_done_dc(Integer itrans_done_dc){
this.trans_done_dc = itrans_done_dc;
}
public Integer getTrans_done_dc(){
return this.trans_done_dc;
}

public void setTrans_all_dc(Integer itrans_all_dc){
this.trans_all_dc = itrans_all_dc;
}
public Integer getTrans_all_dc(){
return this.trans_all_dc;
}

public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setCust_all_c(Integer icust_all_c){
this.cust_all_c = icust_all_c;
}
public Integer getCust_all_c(){
return this.cust_all_c;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setTrans_done_fc(Integer itrans_done_fc){
this.trans_done_fc = itrans_done_fc;
}
public Integer getTrans_done_fc(){
return this.trans_done_fc;
}

public void setCust_done_c(Integer icust_done_c){
this.cust_done_c = icust_done_c;
}
public Integer getCust_done_c(){
return this.cust_done_c;
}

public void setCust_all_i(Integer icust_all_i){
this.cust_all_i = icust_all_i;
}
public Integer getCust_all_i(){
return this.cust_all_i;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

}

