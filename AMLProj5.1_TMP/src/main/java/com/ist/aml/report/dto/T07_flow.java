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
      
                                              
public class T07_flow implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -9094335675460657543L;
/** 流程名称 */
private String flow_des = "";
/** 节点id */
private Long flow_id =null;
/** 是否有效
0:失效；1：有效 */
private String is_use = "";
//=======================================================
                                              
    /**                   
     * 构造函数           
     */                   
    public T07_flow() {    
    }                     
public void setFlow_des(String flow_desStr){
this.flow_des = flow_desStr;
}
public String getFlow_des(){
return this.flow_des;
}

public void setFlow_id(Long flow_idStr){
this.flow_id = flow_idStr;
}
public Long getFlow_id(){
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

