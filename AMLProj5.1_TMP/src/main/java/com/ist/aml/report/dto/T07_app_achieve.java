/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-27   青蛙		创建        
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
                      
public class T07_app_achieve implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -7902517518913149020L;
/** 上报次数 */
private Long recheck_num =null;
/** 案例编号 */
private String application_num = "";
/** 工作状态
0：未处理1：草稿2：完成D：作废 */
private String task_status_cd = "";
/** 上次更新用户 */
private String last_upd_user = "";
/** 创建时间 */
private Date create_dt = new Date();
/** Task_id */
private String task_id = "";
/** 节点 */
private String node_id = "";
/** 节点id */
private String flow_id = "";
/** 上次更新时间 */
private Date last_upd_dt = new Date();
/** 流程序号 */
private Long seq_num = null;
//=======================================================
/** 创建时间 */
private String create_dt_disp = "";
/** 上次更新时间 */
private String last_upd_dt_disp = "";
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_app_achieve() {    
    }                     
public void setRecheck_num(Long recheck_numStr){
this.recheck_num = recheck_numStr;
}
public Long getRecheck_num(){
return this.recheck_num;
}

public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setTask_status_cd(String task_status_cdStr){
this.task_status_cd = task_status_cdStr;
}
public String getTask_status_cd(){
return this.task_status_cd;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setTask_id(String task_idStr){
this.task_id = task_idStr;
}
public String getTask_id(){
return this.task_id;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setFlow_id(String flow_idStr){
this.flow_id = flow_idStr;
}
public String getFlow_id(){
return this.flow_id;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setSeq_num(Long seq_numStr){
this.seq_num = seq_numStr;
}
public Long getSeq_num(){
return this.seq_num;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}

}

