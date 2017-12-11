/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2014-01-21] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.report.dto;                
                                                  
/**
* <p>T07_ATTENTION_log.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_ATTENTION_log extends BaseDTO {
                                              
/** 操作人 */
private String op_person = "";
/** 关注ID（主键） */
private String atten_id = "";
/** 操作时间 */
private String op_time = "";
/** 操作原因 */
private String op_reason = "";
/** 操作类型 1 添加  2修改  3 删除  4提交  5审核通过 6审核不通过 7审核退回  8审批通过 9审批不通过 10 审批退回 11延期 12排除 */
private String op_type = "";
private String op_name = "";


//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_ATTENTION_log() {    
    }                     
public void setOp_person(String op_personStr){
this.op_person = op_personStr;
}
public String getOp_person(){
return this.op_person;
}

public void setAtten_id(String atten_idStr){
this.atten_id = atten_idStr;
}
public String getAtten_id(){
return this.atten_id;
}

public void setOp_time(String op_timeStr){
this.op_time = op_timeStr;
}
public String getOp_time(){
return this.op_time;
}

public void setOp_reason(String op_reasonStr){
this.op_reason = op_reasonStr;
}
public String getOp_reason(){
return this.op_reason;
}
public String getOp_type() {
	return op_type;
}
public void setOp_type(String opType) {
	op_type = opType;
}
public String getOp_name() {
	return op_name;
}
public void setOp_name(String opName) {
	op_name = opName;
}



//=======================================================
}

