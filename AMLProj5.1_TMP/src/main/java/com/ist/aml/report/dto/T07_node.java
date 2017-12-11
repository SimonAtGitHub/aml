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
     
                                              
public class T07_node implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -7632161569682931199L;
/** 岗位id */
private String post_id = "";
/** 页面名称
各节点初始化的页面 */
private String title = "";
/** 后续节点 */
private String next_node_id = "";
/** 节点所属机构级别
0:总行 1:支行 */
private String node_org = "";
/** 节点顺序号 */
private Long node_seq = null;
/** 是否有需完成的工作 */
private String task_ind = "";
/** 前溯节点 */
private String pre_node_id = "";
/** 是否有信息查询 */
private String info_ind = "";
/** 节点名称 */
private String node_des = "";
/** 节点id
N+流程代码+序号 */
private String node_id = "";
/** 节点id */
private String flow_id = "";
/** 是否有效
0:失效；1：有效 */
private String is_use = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_node() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setTitle(String titleStr){
this.title = titleStr;
}
public String getTitle(){
return this.title;
}

public void setNext_node_id(String next_node_idStr){
this.next_node_id = next_node_idStr;
}
public String getNext_node_id(){
return this.next_node_id;
}

public void setNode_org(String node_orgStr){
this.node_org = node_orgStr;
}
public String getNode_org(){
return this.node_org;
}

public void setNode_seq(Long node_seqStr){
this.node_seq = node_seqStr;
}
public Long getNode_seq(){
return this.node_seq;
}

public void setTask_ind(String task_indStr){
this.task_ind = task_indStr;
}
public String getTask_ind(){
return this.task_ind;
}

public void setPre_node_id(String pre_node_idStr){
this.pre_node_id = pre_node_idStr;
}
public String getPre_node_id(){
return this.pre_node_id;
}

public void setInfo_ind(String info_indStr){
this.info_ind = info_indStr;
}
public String getInfo_ind(){
return this.info_ind;
}

public void setNode_des(String node_desStr){
this.node_des = node_desStr;
}
public String getNode_des(){
return this.node_des;
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

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

//=======================================================
}

