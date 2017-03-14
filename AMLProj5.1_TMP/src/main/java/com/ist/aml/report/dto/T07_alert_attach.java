/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2007-04-03   青蛙		创建        
 */                                             
                                                  
package com.ist.aml.report.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: 北京银丰新融科技开发有限公司</p>      
 * @author 研发组                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 
  
import java.util.Date;       
                        
public class T07_alert_attach implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 4431682601182650613L;
/** 附件名称 */
private String attach_name = "";
/** 案例编号 */
private String application_num = "";
/** 上传人 */
private String load_user = "";
/** 预警ID */
private String alertkey = "";
/** 上传时间 */
private Date load_date = new Date();
/** 附件KEY */
private String attachkey = "";
/** 附件真实名称 */
private String attach_realname = "";
//=======================================================
/** 上传时间 */
private String load_date_disp = "";
/**页码 */                                      
private int int_page = 1;

private String casesearchtime="";//当前和历史案例
    /**                   
     * 构造函数           
     */                   
    public T07_alert_attach() {    
    }                     
public void setAttach_name(String attach_nameStr){
this.attach_name = attach_nameStr;
}
public String getAttach_name(){
return this.attach_name;
}

public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setLoad_user(String load_userStr){
this.load_user = load_userStr;
}
public String getLoad_user(){
return this.load_user;
}

public void setAlertkey(String alertkeyStr){
this.alertkey = alertkeyStr;
}
public String getAlertkey(){
return this.alertkey;
}

public void setLoad_date(Date load_dateStr){
this.load_date = load_dateStr;
}
public Date getLoad_date(){
return this.load_date;
}

public void setAttachkey(String attachkeyStr){
this.attachkey = attachkeyStr;
}
public String getAttachkey(){
return this.attachkey;
}

public void setAttach_realname(String attach_realnameStr){
this.attach_realname = attach_realnameStr;
}
public String getAttach_realname(){
return this.attach_realname;
}

//=======================================================
public void setLoad_date_disp(String load_date_dispStr){
this.load_date_disp = load_date_dispStr;
}
public String getLoad_date_disp(){
return this.load_date_disp;
}
public int getInt_page() {
	return int_page;
}
public void setInt_page(int int_page) {
	this.int_page = int_page;
}
public String getCasesearchtime() {
	return casesearchtime;
}
public void setCasesearchtime(String casesearchtime) {
	this.casesearchtime = casesearchtime;
}

}

