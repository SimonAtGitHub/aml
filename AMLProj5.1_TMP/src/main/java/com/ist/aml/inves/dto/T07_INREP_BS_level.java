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
* <p>T07_INREP_BS_level.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T07_INREP_BS_level extends BaseDTO {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 7985149990403208877L;
/** 重点可疑且同时报告当地公安外币交易金额 */
private Integer amt_fc_04 = new Integer(0);
/** 重点可疑且同时报告当地人行外币交易笔数 */
private Integer trans_fc_03 = new Integer(0);
/** 重点可疑且同时报告当地人行和公安人民币交易金额 */
private Integer amt_dc_05 = new Integer(0);
/** 重点可疑人民币交易笔数 */
private Integer trans_dc_02 = new Integer(0);
/** 重点可疑且同时报告当地公安案例份数 */
private Integer case_04 = new Integer(0);
/** 重点可疑且同时报告当地人行案例份数 */
private Integer case_03 = new Integer(0);
/** 重点可疑且同时报告当地公安外币交易笔数 */
private Integer trans_fc_04 = new Integer(0);
/** 重点可疑且同时报告当地人行人民币交易笔数 */
private Integer trans_dc_03 = new Integer(0);
/** 重点可疑且同时报告当地公安人民币交易金额 */
private Integer amt_dc_04 = new Integer(0);
/** 重点可疑且同时报告当地公安人民币交易笔数 */
private Integer trans_dc_04 = new Integer(0);
/** 重点可疑外币交易金额 */
private Integer amt_fc_02 = new Integer(0);
/** 重点可疑且同时报告当地人行人民币交易金额 */
private Integer amt_dc_03 = new Integer(0);
/** 报送日期、筛选日期 */
private Date statistic_dt = new Date();
/** 重点可疑且同时报告当地人行和公安外币交易金额 */
private Integer amt_fc_05 = new Integer(0);
/** 重点可疑案例份数 */
private Integer case_02 = new Integer(0);
/** 重点可疑且同时报告当地人行和公安外币交易笔数 */
private Integer trans_fc_05 = new Integer(0);
/** 机构号 */
private String organkey = "";
/** 重点可疑且同时报告当地人行和公安人民币交易笔数 */
private Integer trans_dc_05 = new Integer(0);
/** 重点可疑且同时报告当地人行外币交易金额 */
private Integer amt_fc_03 = new Integer(0);
/** 重点可疑人民币交易金额 */
private Integer amt_dc_02 = new Integer(0);
/** 重点可疑外币交易笔数 */
private Integer trans_fc_02 = new Integer(0);
/** 可疑交易份数 */
private Integer sum_mount = new Integer(0);
/** 重点可疑且同时报告当地人行和公安案例份数 */
private Integer case_05 = new Integer(0);
/** 机构名 */
private String organname = "";
/** 开始日期 */
private Date statistic_dt_start;
/** 截至日期 */
private Date statistic_dt_end;
private String organStr = "";             
    public String getOrganStr() {
	return organStr;
}
public void setOrganStr(String organStr) {
	this.organStr = organStr;
}
	/**                   
     * 构造函数           
     */                   
    public T07_INREP_BS_level() {    
    }                     
public void setAmt_fc_04(Integer iamt_fc_04){
this.amt_fc_04 = iamt_fc_04;
}
public Integer getAmt_fc_04(){
return this.amt_fc_04;
}

public void setTrans_fc_03(Integer itrans_fc_03){
this.trans_fc_03 = itrans_fc_03;
}
public Integer getTrans_fc_03(){
return this.trans_fc_03;
}

public void setAmt_dc_05(Integer iamt_dc_05){
this.amt_dc_05 = iamt_dc_05;
}
public Integer getAmt_dc_05(){
return this.amt_dc_05;
}

public void setTrans_dc_02(Integer itrans_dc_02){
this.trans_dc_02 = itrans_dc_02;
}
public Integer getTrans_dc_02(){
return this.trans_dc_02;
}

public void setCase_04(Integer icase_04){
this.case_04 = icase_04;
}
public Integer getCase_04(){
return this.case_04;
}

public void setCase_03(Integer icase_03){
this.case_03 = icase_03;
}
public Integer getCase_03(){
return this.case_03;
}

public void setTrans_fc_04(Integer itrans_fc_04){
this.trans_fc_04 = itrans_fc_04;
}
public Integer getTrans_fc_04(){
return this.trans_fc_04;
}

public void setTrans_dc_03(Integer itrans_dc_03){
this.trans_dc_03 = itrans_dc_03;
}
public Integer getTrans_dc_03(){
return this.trans_dc_03;
}

public void setAmt_dc_04(Integer iamt_dc_04){
this.amt_dc_04 = iamt_dc_04;
}
public Integer getAmt_dc_04(){
return this.amt_dc_04;
}

public void setTrans_dc_04(Integer itrans_dc_04){
this.trans_dc_04 = itrans_dc_04;
}
public Integer getTrans_dc_04(){
return this.trans_dc_04;
}

public void setAmt_fc_02(Integer iamt_fc_02){
this.amt_fc_02 = iamt_fc_02;
}
public Integer getAmt_fc_02(){
return this.amt_fc_02;
}

public void setAmt_dc_03(Integer iamt_dc_03){
this.amt_dc_03 = iamt_dc_03;
}
public Integer getAmt_dc_03(){
return this.amt_dc_03;
}

public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setAmt_fc_05(Integer iamt_fc_05){
this.amt_fc_05 = iamt_fc_05;
}
public Integer getAmt_fc_05(){
return this.amt_fc_05;
}

public void setCase_02(Integer icase_02){
this.case_02 = icase_02;
}
public Integer getCase_02(){
return this.case_02;
}

public void setTrans_fc_05(Integer itrans_fc_05){
this.trans_fc_05 = itrans_fc_05;
}
public Integer getTrans_fc_05(){
return this.trans_fc_05;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setTrans_dc_05(Integer itrans_dc_05){
this.trans_dc_05 = itrans_dc_05;
}
public Integer getTrans_dc_05(){
return this.trans_dc_05;
}

public void setAmt_fc_03(Integer iamt_fc_03){
this.amt_fc_03 = iamt_fc_03;
}
public Integer getAmt_fc_03(){
return this.amt_fc_03;
}

public void setAmt_dc_02(Integer iamt_dc_02){
this.amt_dc_02 = iamt_dc_02;
}
public Integer getAmt_dc_02(){
return this.amt_dc_02;
}

public void setTrans_fc_02(Integer itrans_fc_02){
this.trans_fc_02 = itrans_fc_02;
}
public Integer getTrans_fc_02(){
return this.trans_fc_02;
}

public void setSum_mount(Integer isum_mount){
this.sum_mount = isum_mount;
}
public Integer getSum_mount(){
return this.sum_mount;
}

public void setCase_05(Integer icase_05){
this.case_05 = icase_05;
}
public Integer getCase_05(){
return this.case_05;
}
public String getOrganname() {
	return organname;
}
public void setOrganname(String organname) {
	this.organname = organname;
}
public Date getStatistic_dt_start() {
	return statistic_dt_start;
}
public void setStatistic_dt_start(Date statistic_dt_start) {
	this.statistic_dt_start = statistic_dt_start;
}
public Date getStatistic_dt_end() {
	return statistic_dt_end;
}
public void setStatistic_dt_end(Date statistic_dt_end) {
	this.statistic_dt_end = statistic_dt_end;
}


}

