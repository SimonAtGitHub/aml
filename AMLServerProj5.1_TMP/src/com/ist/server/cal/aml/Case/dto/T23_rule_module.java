package com.ist.server.cal.aml.Case.dto;

public class T23_rule_module {
	private String module_no    ="";
	private String key_stcr_k   ="";
	private String stcr_k_no    ="";
	private String stcr_k_des   ="";
	private String stcr_score   ="";
	private String case_minscore="0";
 	private  int stcr_cnt    =0;
	private String Fomula_exp_r="0";
	public String getFomula_exp_r() {
		return Fomula_exp_r;
	}
	public void setFomula_exp_r(String fomula_exp_r) {
		Fomula_exp_r = fomula_exp_r;
	}
	public int getStcr_cnt() {
		return stcr_cnt;
	}
	public void setStcr_cnt(int stcr_cnt) {
		this.stcr_cnt = stcr_cnt;
	}
	public String getModule_no() {
		return module_no;
	}
	public void setModule_no(String module_no) {
		this.module_no = module_no;
	}
	public String getKey_stcr_k() {
		return key_stcr_k;
	}
	public void setKey_stcr_k(String key_stcr_k) {
		this.key_stcr_k = key_stcr_k;
	}
	public String getStcr_k_no() {
		return stcr_k_no;
	}
	public void setStcr_k_no(String stcr_k_no) {
		this.stcr_k_no = stcr_k_no;
	}
	public String getStcr_k_des() {
		return stcr_k_des;
	}
	public void setStcr_k_des(String stcr_k_des) {
		this.stcr_k_des = stcr_k_des;
	}
	public String getStcr_score() {
		return stcr_score;
	}
	public void setStcr_score(String stcr_score) {
		this.stcr_score = stcr_score;
	}
	public String getCase_minscore() {
		return case_minscore;
	}
	public void setCase_minscore(String case_minscore) {
		this.case_minscore = case_minscore;
	}
	 
	 
}
