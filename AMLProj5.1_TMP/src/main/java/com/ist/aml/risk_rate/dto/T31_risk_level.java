/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-08-30] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.risk_rate.dto;                
                                                  
/**
* <p>T31_risk_level.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T31_risk_level extends BaseDTO {
                                              
/** 最大值 */
private String levelmax = "";
private Double levelmax_d;
public Double getLevelmax_d() {
	return levelmax_d;
}
public void setLevelmax_d(Double levelmaxD) {
	levelmax_d = levelmaxD;
}
public Double getLevelmin_d() {
	return levelmin_d;
}
public void setLevelmin_d(Double levelminD) {
	levelmin_d = levelminD;
}
/** 创建机构 */
private String create_org = "";
/** 最小值 */
private String levelmin = "";
private Double levelmin_d;
/** 最大值区间类型 0：闭  1：开 */
private String maxisclosed = "";
/** 风险级别key */
private String levelkey = "";
/** 风险等级 */
private String levelname = "";
/** 是否启用(0:否  1：是 */
private String flag = "";
/** 最小值区间类型0：闭  1：开 */
private String minisclosed = "";
/** 风险等级描述 */
private String leveldes = "";
/** 修改人 */
private String modify_user = "";
/** 创建人 */
private String create_user = "";
/** 创建日期 */
private String create_dt = "";
/** 修改日期 */
private String modify_dt = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T31_risk_level() {    
    }                     
public void setLevelmax(String levelmaxStr){
this.levelmax = levelmaxStr;
}
public String getLevelmax(){
return this.levelmax;
}

public void setCreate_org(String create_orgStr){
this.create_org = create_orgStr;
}
public String getCreate_org(){
return this.create_org;
}

public void setLevelmin(String levelminStr){
this.levelmin = levelminStr;
}
public String getLevelmin(){
return this.levelmin;
}


public void setMaxisclosed(String maxisclosedStr){
this.maxisclosed = maxisclosedStr;
}
public String getMaxisclosed(){
return this.maxisclosed;
}

public void setLevelkey(String levelkeyStr){
this.levelkey = levelkeyStr;
}
public String getLevelkey(){
return this.levelkey;
}

public void setLevelname(String levelnameStr){
this.levelname = levelnameStr;
}
public String getLevelname(){
return this.levelname;
}

public void setFlag(String flagStr){
this.flag = flagStr;
}
public String getFlag(){
return this.flag;
}

public void setMinisclosed(String minisclosedStr){
this.minisclosed = minisclosedStr;
}
public String getMinisclosed(){
return this.minisclosed;
}

public void setLeveldes(String leveldesStr){
this.leveldes = leveldesStr;
}
public String getLeveldes(){
return this.leveldes;
}

public void setModify_user(String modify_userStr){
this.modify_user = modify_userStr;
}
public String getModify_user(){
return this.modify_user;
}

public void setCreate_user(String create_userStr){
this.create_user = create_userStr;
}
public String getCreate_user(){
return this.create_user;
}

public void setCreate_dt(String create_dtStr){
this.create_dt = create_dtStr;
}
public String getCreate_dt(){
return this.create_dt;
}

public void setModify_dt(String modify_dtStr){
this.modify_dt = modify_dtStr;
}
public String getModify_dt(){
return this.modify_dt;
}

//=======================================================
}

