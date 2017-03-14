package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.ArrayList;
 

public class WorkBench implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -525639791322976586L;
	/** 任务编号*/
	private String application_num = "";
	/** 节点id*/
	private String node_id = "";
	/** 节点基本信息 */
	private T07_node rm_node = new T07_node();
	/** 操作id信息 */
	private ArrayList operlist = new ArrayList();
	/** 需完成工作列表 */
	private ArrayList worklist = new ArrayList();
	/** 信息查阅列表 */
	private ArrayList infolist = new ArrayList();
	//案例状态 
	private String app_status_cd = "";
	//案例类型
	private String case_type = "";
	
	public WorkBench() {
		
	}

	public String getApplication_num() {
		return application_num;
	}

	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}

	public ArrayList getInfolist() {
		return infolist;
	}

	public void setInfolist(ArrayList infolist) {
		this.infolist = infolist;
	}

	public String getNode_id() {
		return node_id;
	}

	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}



	public ArrayList getOperlist() {
		return operlist;
	}

	public void setOperlist(ArrayList operlist) {
		this.operlist = operlist;
	}


	public T07_node getRm_node() {
		return rm_node;
	}

	public void setRm_node(T07_node rm_node) {
		this.rm_node = rm_node;
	}

	public ArrayList getWorklist() {
		return worklist;
	}

	public void setWorklist(ArrayList worklist) {
		this.worklist = worklist;
	}

	public String getApp_status_cd() {
		return app_status_cd;
	}

	public void setApp_status_cd(String app_status_cd) {
		this.app_status_cd = app_status_cd;
	}

	public String getCase_type() {
		return case_type;
	}

	public void setCase_type(String case_type) {
		this.case_type = case_type;
	}

}
