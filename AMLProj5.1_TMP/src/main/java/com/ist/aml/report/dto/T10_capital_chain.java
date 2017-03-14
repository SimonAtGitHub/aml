package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_capital_chain implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -9172496164697651228L;
	private String application_num="";
	private String party_id="";
	private String party_chn_name="";
	private String organkey="";
	private String tx_occur_area="";
	private Date tx_dt;
	private String tx_dt_display="";
	private String amt="";
	private String currency_cd="";
	private String fashion="asc";
	private Date start_dt;
	private Date end_dt;
	private String order_type="";
	private String organName="";
	private String cash_trans_flag="";
	private String tx_type="";
	private String sum_amt="";
	private String opp_party_id="";
	
	private String opp_organkey="";
	private String opp_name="";
	private String opp_party_class_cd="";
	private String cast_type="";
	private String acct_num = "";
	private String subjectno = "";
	private String opp_acct_num = "";
	public String getCast_type() {
		return cast_type;
	}
	public void setCast_type(String castType) {
		cast_type = castType;
	}
	public String getOpp_party_id() {
		return opp_party_id;
	}
	public void setOpp_party_id(String oppPartyId) {
		opp_party_id = oppPartyId;
	}
	public String getOpp_organkey() {
		return opp_organkey;
	}
	public void setOpp_organkey(String oppOrgankey) {
		opp_organkey = oppOrgankey;
	}
	public String getOpp_name() {
		return opp_name;
	}
	public void setOpp_name(String oppName) {
		opp_name = oppName;
	}
	public String getOpp_party_class_cd() {
		return opp_party_class_cd;
	}
	public void setOpp_party_class_cd(String oppPartyClassCd) {
		opp_party_class_cd = oppPartyClassCd;
	}
	public String getSum_amt() {
		return sum_amt;
	}
	public void setSum_amt(String sum_amt) {
		this.sum_amt = sum_amt;
	}
	public String getCash_trans_flag() {
		return cash_trans_flag;
	}
	public void setCash_trans_flag(String cash_trans_flag) {
		this.cash_trans_flag = cash_trans_flag;
	}
	public String getOrganName() {
		return organName;
	}
	public void setOrganName(String organName) {
		this.organName = organName;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}

	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getAmt() {
		return amt;
	}
	public void setAmt(String amt) {
		this.amt = amt;
	}
	public String getFashion() {
		return fashion;
	}
	public void setFashion(String fashion) {
		this.fashion = fashion;
	}
	public Date getStart_dt() {
		return start_dt;
	}
	
	public String getAcct_num() {
		return acct_num;
	}
	public void setAcct_num(String acctNum) {
		acct_num = acctNum;
	}
	public String getSubjectno() {
		return subjectno;
	}
	public void setSubjectno(String subjectno) {
		this.subjectno = subjectno;
	}
	public String getOpp_acct_num() {
		return opp_acct_num;
	}
	public void setOpp_acct_num(String oppAcctNum) {
		opp_acct_num = oppAcctNum;
	}
	public void setStart_dt(Date start_dt) {
		this.start_dt = start_dt;
	}
	public Date getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(Date end_dt) {
		this.end_dt = end_dt;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}
	public String getTx_occur_area() {
		return tx_occur_area;
	}
	public void setTx_occur_area(String tx_occur_area) {
		this.tx_occur_area = tx_occur_area;
	}
	public Date getTx_dt() {
		return tx_dt;
	}
	public void setTx_dt(Date tx_dt) {
		this.tx_dt = tx_dt;
	}
	public String getTx_dt_display() {
		return tx_dt_display;
	}
	public void setTx_dt_display(String tx_dt_display) {
		this.tx_dt_display = tx_dt_display;
	}
	public String getCurrency_cd() {
		return currency_cd;
	}
	public void setCurrency_cd(String currency_cd) {
		this.currency_cd = currency_cd;
	}
	public String getTx_type() {
		return tx_type;
	}
	public void setTx_type(String tx_type) {
		this.tx_type = tx_type;
	}
	public String getApplication_num() {
		return application_num;
	}
	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}

}
