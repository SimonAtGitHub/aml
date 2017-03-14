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
     
                                              
public class T07_n_move implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 8481493126989773945L;
/** 操作类型
1：上报2：退回
3：排除 */
private String oper_type = "";
/** 操作id
B+节点+序号 */
private String oper_id = "";
/** 按钮对应操作 */
private String oper_url = "";
/** 操作类别
1：继续流转2：中途结束3：最终结束 */
private String oper_category = "";
/** 节点id
N+流程代码+序号 */
private String node_id = "";
/** 顺序 */
private Long oper_seq = null;
/** 按钮显示名称 */
private String oper_desc = "";
/** 是否有效
0:失效；1:有效 */
private String is_use = "";

/** 图片路径 */
private String image_path = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_n_move() {    
    }                     
public void setOper_type(String oper_typeStr){
this.oper_type = oper_typeStr;
}
public String getOper_type(){
return this.oper_type;
}

public void setOper_id(String oper_idStr){
this.oper_id = oper_idStr;
}
public String getOper_id(){
return this.oper_id;
}

public void setOper_url(String oper_urlStr){
this.oper_url = oper_urlStr;
}
public String getOper_url(){
return this.oper_url;
}

public void setOper_category(String oper_categoryStr){
this.oper_category = oper_categoryStr;
}
public String getOper_category(){
return this.oper_category;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setOper_seq(Long oper_seqStr){
this.oper_seq = oper_seqStr;
}
public Long getOper_seq(){
return this.oper_seq;
}

public void setOper_desc(String oper_descStr){
this.oper_desc = oper_descStr;
}
public String getOper_desc(){
return this.oper_desc;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}
public String getImage_path() {
	return image_path;
}
public void setImage_path(String image_path) {
	this.image_path = image_path;
}

//=======================================================
}

