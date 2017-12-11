package com.ist.aml.inves.dto;


import java.util.Date;

import com.ist.common.base.BaseDTO;

@SuppressWarnings("serial")
public class T07_party_ganz extends BaseDTO {
	
	/**
	 * 主键
	 */
	private String genz_no;
	/**
	 * 客户号
	 */
	private String party_id;
	/**
	 * 客户名称
	 */
	private String party_chn_name;
	/**
	 * 客户类型
	 */
	private String party_class_cd;
	
	/**
	 * 客户类型详细信息
	 */
	private String party_class_cd_disp;
	/**
	 * 客户归属机构主键
	 */
	private String organkey;
	/**
	 * 客户归属机构名称
	 */
	private String organname;
	
	/**
	 * 证件类型
	 */
	private String card_type;
	/**
	 * 证件类型详细信息
	 */
	private String card_type_disp;
	/**
	 * 证件号码
	 */
	private String card_no;
	/**
	 * 创建日期
	 */
	private Date create_date;
	/**
	 * 创建时间日期类型描述
	 */
	private String create_date_disp;
	/**
	 * 失效日期
	 */
	private Date infact_date;
	/**
	 * 失效时间日期类型描述
	 */
	private String infact_date_disp;

	/**
	 * 状态 1、有效 2、无效
	 */
	private String status_cd;
	
	/**
	 * 跟踪客户状态详细信息
	 */
	private String status_cd_disp;

	public String getGenz_no() {
		return genz_no;
	}

	public void setGenz_no(String genzNo) {
		genz_no = genzNo;
	}

	public String getParty_id() {
		return party_id;
	}

	public void setParty_id(String partyId) {
		party_id = partyId;
	}

	public String getParty_chn_name() {
		return party_chn_name;
	}

	public void setParty_chn_name(String partyChnName) {
		party_chn_name = partyChnName;
	}

	public String getParty_class_cd() {
		return party_class_cd;
	}

	public void setParty_class_cd(String partyClassCd) {
		party_class_cd = partyClassCd;
	}

	public String getParty_class_cd_disp() {
		return party_class_cd_disp;
	}

	public void setParty_class_cd_disp(String partyClassCdDisp) {
		party_class_cd_disp = partyClassCdDisp;
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

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String cardType) {
		card_type = cardType;
	}

	public String getCard_type_disp() {
		return card_type_disp;
	}

	public void setCard_type_disp(String cardTypeDisp) {
		card_type_disp = cardTypeDisp;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String cardNo) {
		card_no = cardNo;
	}

	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date createDate) {
		create_date = createDate;
	}

	public String getCreate_date_disp() {
		return create_date_disp;
	}

	public void setCreate_date_disp(String createDateDisp) {
		create_date_disp = createDateDisp;
	}

	public Date getInfact_date() {
		return infact_date;
	}

	public void setInfact_date(Date infactDate) {
		infact_date = infactDate;
	}

	public String getInfact_date_disp() {
		return infact_date_disp;
	}

	public void setInfact_date_disp(String infactDateDisp) {
		infact_date_disp = infactDateDisp;
	}

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String statusCd) {
		status_cd = statusCd;
	}

	public String getStatus_cd_disp() {
		return status_cd_disp;
	}

	public void setStatus_cd_disp(String statusCdDisp) {
		status_cd_disp = statusCdDisp;
	}

}
