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
     
                                              
public class T07_post implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -914258161702044482L;
/** 岗位代码 */
private String post_id = "";
/** 岗位名称 */
private String post_des = "";
/** 节点id */
private String flow_id = "";
/** 是否有效
0:失效；1：有效 */
private String is_use = "";
/** 币种 
1:本币, 2:外币*/
private String curr_cd = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_post() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setPost_des(String post_desStr){
this.post_des = post_desStr;
}
public String getPost_des(){
return this.post_des;
}

public void setFlow_id(String flow_idStr){
this.flow_id = flow_idStr;
}
public String getFlow_id(){
return this.flow_id;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}
public String getCurr_cd() {
	return curr_cd;
}
public void setCurr_cd(String curr_cd) {
	this.curr_cd = curr_cd;
}

//=======================================================
}

