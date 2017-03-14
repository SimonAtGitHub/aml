/**                                             
 * Create by makecode program v2.0              
 * 日期             作者 		动作        
 * 2006-12-27   青蛙		创建        
 */                                             
                                                  
package com.ist.aml.risk_rate.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: 北京银丰新融科技开发有限公司</p>      
 * @author 研发组                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 
      
                                              
public class T31_swith implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 2372074841907738321L;
/** 操作id */
private String oper_id = "";
private String oper_type = "";
private String post_id="";
private String oper_url = "";
/** 是否产生新流程序号 */
private String newseq_ind = "";
/** 流转类型
1：单步前进2：单步回退3：多步前进4：多步回退5：静止流程6：中途否决7：中途批准(保留)8：终点否决9：终点批准10：作废 */
private String switch_id = "";
/** 初始化Url */
private String init_url = "";
/** 源节点 */
private String orig_node = "";
/** 节点id */
private String flow_id = "";
/** 流程类别,1：正常，2：再调整 */
private String flow_type = "";
/** 是否有效 */
private String is_use = "";
/** 目标节点 */
private String target_node = "";

private String levelkey="";
/** 模版编码 */
private String templatekey = "";
//=======================================================
public String getLevelkey() {
	return levelkey;
}
public void setLevelkey(String levelkey) {
	this.levelkey = levelkey;
}

public String getTemplatekey() {
	return templatekey;
}
public void setTemplatekey(String templatekey) {
	this.templatekey = templatekey;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getIs_report() {
	return is_report;
}
public void setIs_report(String isReport) {
	is_report = isReport;
}
private String status="";
private String is_report="";

                                              
    /**                   
     * 构造函数           
     */                   
    public T31_swith() {    
    }                     
public void setOper_id(String oper_idStr){
this.oper_id = oper_idStr;
}
public String getOper_id(){
return this.oper_id;
}

public void setNewseq_ind(String newseq_indStr){
this.newseq_ind = newseq_indStr;
}
public String getNewseq_ind(){
return this.newseq_ind;
}

public void setSwitch_id(String switch_idStr){
this.switch_id = switch_idStr;
}
public String getSwitch_id(){
return this.switch_id;
}

public void setInit_url(String init_urlStr){
this.init_url = init_urlStr;
}
public String getInit_url(){
return this.init_url;
}

public void setOrig_node(String orig_nodeStr){
this.orig_node = orig_nodeStr;
}
public String getOrig_node(){
return this.orig_node;
}

public void setFlow_id(String flow_idStr){
this.flow_id = flow_idStr;
}
public String getFlow_id(){
return this.flow_id;
}

public String getFlow_type() {
	return flow_type;
}
public void setFlow_type(String flowType) {
	flow_type = flowType;
}
public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

public void setTarget_node(String target_nodeStr){
this.target_node = target_nodeStr;
}
public String getTarget_node(){
return this.target_node;
}
public String getOper_type() {
	return oper_type;
}
public void setOper_type(String oper_type) {
	this.oper_type = oper_type;
}
public String getOper_url() {
	return oper_url;
}
public void setOper_url(String oper_url) {
	this.oper_url = oper_url;
}
public String getPost_id() {
	return post_id;
}
public void setPost_id(String post_id) {
	this.post_id = post_id;
}

//=======================================================
}

