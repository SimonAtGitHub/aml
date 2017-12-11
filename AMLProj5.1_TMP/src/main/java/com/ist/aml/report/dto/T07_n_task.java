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
      
                                              
public class T07_n_task implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 2384320785238485742L;
/** 工作类别
1：需完成工作任务2：信息查阅 */
private String href_type_cd = "";
/** 是否弹出窗口
1:弹出0:不弹出 */
private String open_ind = "";
/** 工作代码
T+节点代码+序号  */
private String task_id = "";
/** 链接名称 */
private String href_des = "";
/** 节点id
N+流程代码+序号 */
private String node_id = "";
/** 是否有效0:失效；1：有效 */
private String is_use = "";
/** Href_seq */
private Long href_seq =null;
/** 链接URL */
private String href_url = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_n_task() {    
    }                     
public void setHref_type_cd(String href_type_cdStr){
this.href_type_cd = href_type_cdStr;
}
public String getHref_type_cd(){
return this.href_type_cd;
}

public void setOpen_ind(String open_indStr){
this.open_ind = open_indStr;
}
public String getOpen_ind(){
return this.open_ind;
}

public void setTask_id(String task_idStr){
this.task_id = task_idStr;
}
public String getTask_id(){
return this.task_id;
}

public void setHref_des(String href_desStr){
this.href_des = href_desStr;
}
public String getHref_des(){
return this.href_des;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

public void setHref_seq(Long href_seqStr){
this.href_seq = href_seqStr;
}
public Long getHref_seq(){
return this.href_seq;
}

public void setHref_url(String href_urlStr){
this.href_url = href_urlStr;
}
public String getHref_url(){
return this.href_url;
}

//=======================================================
}

