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
* <p>T07_ATTENTION_purview.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_ATTENTION_purview extends BaseDTO {
  
	/** 关注类型 */
	private String   atten_type  ="";
	/** 添加权限的岗位 */
	private String   add_post    ="";
	/** 加入结果：当在案例中加入后，在关注库的状态 */
	private String   add_result  ="";
	/** 添加后失效日期的天数 */
	private Integer   add_day  =new Integer(0);
	/** 延期类型：1哪个岗位放哪个岗位延期      2某些岗位可延期   3不能延期 */	
	private String   extend_type ="";
	/** 延期权限的岗位 */
	private String   extend_post ="";
	/** 延期天数 */
	private Integer extend_day = new Integer(0);
	/** 延期次数 */
	private Integer extend_num  =new Integer(0);
	
	/** 排除类型：1哪个岗位放哪个岗位排除      2某些岗位可排除   3不能排除 */
	private String   remove_type ="";
	/** 排除权限的岗位 */
	private String   remove_post ="";
	/** 启用标志1 启用 0 禁用 */
	private String   flag        ="";




//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_ATTENTION_purview() {    
    }




	public String getAtten_type() {
		return atten_type;
	}




	public void setAtten_type(String attenType) {
		atten_type = attenType;
	}




	public String getAdd_post() {
		return add_post;
	}




	public void setAdd_post(String addPost) {
		add_post = addPost;
	}




	public String getAdd_result() {
		return add_result;
	}




	public void setAdd_result(String addResult) {
		add_result = addResult;
	}




	public String getExtend_type() {
		return extend_type;
	}




	public void setExtend_type(String extendType) {
		extend_type = extendType;
	}




	public String getExtend_post() {
		return extend_post;
	}




	public void setExtend_post(String extendPost) {
		extend_post = extendPost;
	}




	public Integer getExtend_day() {
		return extend_day;
	}




	public void setExtend_day(Integer extendDay) {
		extend_day = extendDay;
	}




	public Integer getExtend_num() {
		return extend_num;
	}




	public void setExtend_num(Integer extendNum) {
		extend_num = extendNum;
	}




	public String getRemove_type() {
		return remove_type;
	}




	public void setRemove_type(String removeType) {
		remove_type = removeType;
	}




	public String getRemove_post() {
		return remove_post;
	}




	public void setRemove_post(String removePost) {
		remove_post = removePost;
	}




	public String getFlag() {
		return flag;
	}




	public void setFlag(String flag) {
		this.flag = flag;
	}




	public Integer getAdd_day() {
		return add_day;
	}




	public void setAdd_day(Integer addDay) {
		add_day = addDay;
	}    
    
    
}

