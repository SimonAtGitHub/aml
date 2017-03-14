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
* <p>T07_ATTENTION_swith.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_ATTENTION_swith extends BaseDTO {
                                              
/** 操作按钮的URL */
private String op_url = "";
/** 是否启用 1是 0 否 */
private String flag = "";
/** 操作结果状态 */
private String op_result = "";
/** 是否有结果： 1 有  0 没有 */
private String is_result = "";
/** 操作按钮的名称 */
private String op_type = "";
/** 操作按钮的名称 */
private String op_name = "";
/** 关注库岗位：P1编辑岗  P2审核岗  P3审批岗 */
private String atten_post = "";
/** 是否有图标 */
private String is_icon = "";
/** 按钮图标的名称 */
private String icon_name = "";
/** 是否添加原因 */
private String is_add_reason = "";
/** 验证类型：0不验证 1单选  2多选 */
private String validate_type = "";
/** 目标岗位*/
private String target_post = "";
/** 显示顺序 */
private Integer seq = 0;

//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_ATTENTION_swith() {    
    }

	public String getOp_url() {
		return op_url;
	}

	public void setOp_url(String opUrl) {
		op_url = opUrl;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getOp_result() {
		return op_result;
	}

	public void setOp_result(String opResult) {
		op_result = opResult;
	}

	public String getIs_result() {
		return is_result;
	}

	public void setIs_result(String isResult) {
		is_result = isResult;
	}

	public String getOp_name() {
		return op_name;
	}

	public void setOp_name(String opName) {
		op_name = opName;
	}

	public String getAtten_post() {
		return atten_post;
	}

	public void setAtten_post(String attenPost) {
		atten_post = attenPost;
	}

	public String getIs_icon() {
		return is_icon;
	}

	public void setIs_icon(String isIcon) {
		is_icon = isIcon;
	}

	public String getIcon_name() {
		return icon_name;
	}

	public void setIcon_name(String iconName) {
		icon_name = iconName;
	}

	public String getIs_add_reason() {
		return is_add_reason;
	}

	public void setIs_add_reason(String isAddReason) {
		is_add_reason = isAddReason;
	}

	public String getValidate_type() {
		return validate_type;
	}

	public void setValidate_type(String validateType) {
		validate_type = validateType;
	}

	public String getTarget_post() {
		return target_post;
	}

	public void setTarget_post(String targetPost) {
		target_post = targetPost;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOp_type() {
		return op_type;
	}

	public void setOp_type(String opType) {
		op_type = opType;
	}   
    
//=======================================================
}

