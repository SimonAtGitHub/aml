package com.ist.aml.risk_rate.dto;

import java.util.Date;

import com.ist.common.base.BaseDTO;

	/**
	 * 这个类是"客户调查延期查询"中需要查询的结果集合中的字段与数据库对应的字段，包括下面四张表
	 * t10_checkparty_relt
	 * t47_party
	 * t00_user
	 * t00_organ
	 * 字段没有写全，只写了要用到的
	 * @author yangyu
	 *
	 */
public class T37_primary_survey_delayResult extends BaseDTO{

	
	private static final long serialVersionUID = 1L;
	
	//客户号
	private String party_id;
	//客户名称
	private String party_chn_name;
	//机构号
	private String organkey;
	//机构名称
	private String organname;
	//开户日期
	private Date create_dt;
	private Date create_dt_end;
	//调查日期
	private Date check_dt;
	//调查人
	private String checker;
	//调查人名
	private String check_realname;
	
	private int rownum;
	
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	public Date getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}
	public Date getCreate_dt_end() {
		return create_dt_end;
	}
	public void setCreate_dt_end(Date create_dt_end) {
		this.create_dt_end = create_dt_end;
	}
	public Date getCheck_dt() {
		return check_dt;
	}
	public void setCheck_dt(Date check_dt) {
		this.check_dt = check_dt;
	}
	public String getChecker() {
		return checker;
	}
	public void setChecker(String checker) {
		this.checker = checker;
	}
	public String getCheck_realname() {
		return check_realname;
	}
	public void setCheck_realname(String check_realname) {
		this.check_realname = check_realname;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	@Override
	public String toString() {
		return "T37_primary_survey_delayResult [party_id=" + party_id + ", party_chn_name=" + party_chn_name
				+ ", organkey=" + organkey + ", organname=" + organname + ", create_dt=" + create_dt
				+ ", create_dt_end=" + create_dt_end + ", check_dt=" + check_dt + ", checker=" + checker
				+ ", check_realname=" + check_realname + ", rownum=" + rownum + "]";
	}
}
