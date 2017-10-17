package com.ist.aml.risk_rate.dto;

import java.util.Date;

public class T37_party_resultAndT00_organAndT00_user extends T37_party_resultAndT00_organ {

	private static final long serialVersionUID = 1L;
	
	private String username;
	private String audit_realname;
	private String check_realname;
	private String rcheck_realname;
	
	private int rownum;
	
	/**实际跑批日*/
	private Date statisticdate;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAudit_realname() {
		return audit_realname;
	}
	public void setAudit_realname(String audit_realname) {
		this.audit_realname = audit_realname;
	}
	public String getCheck_realname() {
		return check_realname;
	}
	public void setCheck_realname(String check_realname) {
		this.check_realname = check_realname;
	}
	public String getRcheck_realname() {
		return rcheck_realname;
	}
	public void setRcheck_realname(String rcheck_realname) {
		this.rcheck_realname = rcheck_realname;
	}
	public Date getStatisticdate() {
		return statisticdate;
	}
	public void setStatisticdate(Date statisticdate) {
		this.statisticdate = statisticdate;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "T37_party_resultAndT00_organAndT00_user [username=" + username + ", audit_realname=" + audit_realname
				+ ", check_realname=" + check_realname + ", rcheck_realname=" + rcheck_realname + ", rownum=" + rownum
				+ ", statisticdate=" + statisticdate + "]";
	}


}
