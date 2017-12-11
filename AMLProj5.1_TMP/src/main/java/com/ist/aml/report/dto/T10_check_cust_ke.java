package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_check_cust_ke implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -9087353257674643956L;
	private String party_id = "";         
	private String party_name = "";           
	private String party_class_cd = "";       
	private String party_class_cd_display = "";
	private String organkey = "";             
	private String organName = "";        
	private String trans_all;            
	private String trans_rep;            
	private String trans_del;            
	private String check_status;
	private String fashion="asc";
	private String organStr="";
	private String order_check="";
	private String selectedPartyId="";
	private String check_result="";
	private String case_de_all;            
	private String case_ky_all;            
	private String case_ky_rep; 
	private String level_disp = "";
	private String levelkey = ""; //ÆÀ¼¶½á¹û
	private String card_type="";
	private String card_no="";
	private String lip_flag="";
	private Date curr_date=new Date();
	private int intPage=0;
	public int getIntPage() {
		return intPage;
	}
	public void setIntPage(int intPage) {
		this.intPage = intPage;
	}
	public Date getCurr_date() {
		return curr_date;
	}
	public void setCurr_date(Date currDate) {
		curr_date = currDate;
	}
	public String getCheck_result() {
		return check_result;
	}
	public void setCheck_result(String check_result) {
		this.check_result = check_result;
	}
	public String getSelectedPartyId() {
		return selectedPartyId;
	}
	public void setSelectedPartyId(String selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
	}
	public String getOrganStr() {
		return organStr;
	}
	public void setOrganStr(String organStr) {
		this.organStr = organStr;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getParty_name() {
		return party_name;
	}
	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getParty_class_cd_display() {
		return party_class_cd_display;
	}
	public void setParty_class_cd_display(String party_class_cd_display) {
		this.party_class_cd_display = party_class_cd_display;
	}
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getTrans_all() {
		return trans_all;
	}
	public void setTrans_all(String trans_all) {
		this.trans_all = trans_all;
	}
	public String getTrans_rep() {
		return trans_rep;
	}
	public void setTrans_rep(String trans_rep) {
		this.trans_rep = trans_rep;
	}
	public String getTrans_del() {
		return trans_del;
	}
	public void setTrans_del(String trans_del) {
		this.trans_del = trans_del;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	public String getOrder_check() {
		return order_check;
	}
	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}
	public String getCheck_status() {
		return check_status;
	}
	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}
	public String getCase_de_all() {
		return case_de_all;
	}
	public void setCase_de_all(String case_de_all) {
		this.case_de_all = case_de_all;
	}
	public String getCase_ky_all() {
		return case_ky_all;
	}
	public void setCase_ky_all(String case_ky_all) {
		this.case_ky_all = case_ky_all;
	}
	public String getCase_ky_rep() {
		return case_ky_rep;
	}
	public void setCase_ky_rep(String case_ky_rep) {
		this.case_ky_rep = case_ky_rep;
	}
	public String getLevel_disp() {
		return level_disp;
	}
	public void setLevel_disp(String level_disp) {
		this.level_disp = level_disp;
	}
	public String getLevelkey() {
		return levelkey;
	}
	public void setLevelkey(String levelkey) {
		this.levelkey = levelkey;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getLip_flag() {
		return lip_flag;
	}
	public void setLip_flag(String lip_flag) {
		this.lip_flag = lip_flag;
	}
           	
}
