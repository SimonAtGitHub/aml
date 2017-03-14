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

import java.util.ArrayList;  
import java.util.Date;       
    
                                              
public class T07_case_stcr implements Serializable {
	
 	 /**
	 * 
	 */
	private static final long serialVersionUID = -5571011123019582793L;

	private int tfrans_count    =0;//交易总数
 	  
 	 /** 案例编号 */
 	 private String application_num = "";
 	 /** 客户号 */
 	 private String party_id = "";
 	 /** 特征代码 */
 	 private String stcr = "";
 	 /** 特征代码 */
 	 private String stcr_disp = "";
 	 /** 特征状态 1：处理中；2：已审批；4：已排除 */
 	 private String status = "";
 	 /** 特征状态 1：处理中；2：已审批；4：已排除 */
 	 private String status_disp = "";
 	 /**创建日期 */
 	 private String create_date = "";
 	 /**案例类型 */
 	 private String case_type = "";
 	 /** 修改后的特征代码 */
 	 private String stcrkey = "";
 	 /** 案例查询时间：当前案例、历史案例 */
 	 private String casesearchtime = "";
 	 /** 特征交易列表 */
     private ArrayList t07_stcr_transList;
     
     private Date case_date=new Date();
     
 	 /** 账户号 */
 	 private String acct_num = "";
 	 
 	 private int intPage=0;
 	 
 	 private String party_class_cd="";
 	/** 模型 */
 	private String model_no = "";
 	private String model_name = "";
 	/** 匹配度 */
 	private Double matching = null;
 	private String matching_disp = "";
 	private Double rulevalue;
 	private String rulevalue_disp ="";

 	/** 1.来源于规则，2.来源于模型*/
 	private String flag = "";
	public String getParty_class_cd() {
		return party_class_cd;
	}


	public void setParty_class_cd(String partyClassCd) {
		party_class_cd = partyClassCd;
	}


	public int getIntPage() {
		return intPage;
	}


	public void setIntPage(int intPage) {
		this.intPage = intPage;
	}


	public String getAcct_num() {
		return acct_num;
	}


	public void setAcct_num(String acctNum) {
		acct_num = acctNum;
	}


	public T07_case_stcr() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Double getRulevalue() {
		return rulevalue;
	}


	public void setRulevalue(Double rulevalue) {
		this.rulevalue = rulevalue;
	}


	public String getRulevalue_disp() {
		return rulevalue_disp;
	}


	public void setRulevalue_disp(String rulevalueDisp) {
		rulevalue_disp = rulevalueDisp;
	}


	public String getApplication_num() {
		return application_num;
	}


	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}


	public String getParty_id() {
		return party_id;
	}


	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}


	public String getStcr() {
		return stcr;
	}


	public void setStcr(String stcr) {
		this.stcr = stcr;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getCreate_date() {
		return create_date;
	}


	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}


	public int getTfrans_count() {
		return tfrans_count;
	}


	public void setTfrans_count(int tfrans_count) {
		this.tfrans_count = tfrans_count;
	}


	public String getStcr_disp() {
		return stcr_disp;
	}


	public void setStcr_disp(String stcr_disp) {
		this.stcr_disp = stcr_disp;
	}


	public String getStatus_disp() {
		return status_disp;
	}


	public void setStatus_disp(String status_disp) {
		this.status_disp = status_disp;
	}


	public String getCase_type() {
		return case_type;
	}


	public void setCase_type(String case_type) {
		this.case_type = case_type;
	}


	public String getStcrkey() {
		return stcrkey;
	}


	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}


	public String getCasesearchtime() {
		return casesearchtime;
	}


	public void setCasesearchtime(String casesearchtime) {
		this.casesearchtime = casesearchtime;
	}


	public ArrayList getT07_stcr_transList() {
		return t07_stcr_transList;
	}


	public void setT07_stcr_transList(ArrayList list) {
		t07_stcr_transList = list;
	}


	public Date getCase_date() {
		return case_date;
	}


	public void setCase_date(Date case_date) {
		this.case_date = case_date;
	}


	public String getModel_no() {
		return model_no;
	}


	public void setModel_no(String modelNo) {
		model_no = modelNo;
	}


	public String getModel_name() {
		return model_name;
	}


	public void setModel_name(String modelName) {
		model_name = modelName;
	}


	public Double getMatching() {
		return matching;
	}


	public void setMatching(Double matching) {
		this.matching = matching;
	}


	public String getMatching_disp() {
		return matching_disp;
	}

	public void setMatching_disp(String matchingDisp) {
		matching_disp = matchingDisp;
	}


	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}

