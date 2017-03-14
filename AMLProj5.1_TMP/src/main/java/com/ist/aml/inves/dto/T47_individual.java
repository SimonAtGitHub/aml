package com.ist.aml.inves.dto;

/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组-lijie
 * @version 4.0.1
 */

import java.io.Serializable;
import java.util.Date;


public class T47_individual implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7580304973475131406L;
	/** 户籍所在地 */
	private String place_orig = "";
	/** 职业 */
	private String occupation = "";
	/** 当事人编号 */
	private String party_id = "";
	/** 婚姻状况 */
	private String matrl_sts = "";
	/** 内部员工标志:1:是0：否X：未知 */
	private String staff_ind = "";
	/** 年收入 */
	private String indiv_income = "";
	/** 员工id */
	private String staffkey = "";
	/** 客户种类 */
	private String party_class_cd = "";
	/** 显示客户种类对应说明 */
	private String party_class_cd_disp = "";
	/** 客户名称 */
	private String party_name = "";
	/** 客户国籍 */
	private String country_no = "";
	/** 证件类型 */
	private String card_type = "";
	/** 证件号码 */
	private String card_no = "";
	/** 客户状态 */
	private String party_status_cd = "";
	/** 归属机构 */
	private String organkey = "";
	/** 机构名称 */
	private String organname = "";
	/** 排序字段 */
	private String customerorder = "";
	/** 排序方式 */
	private String order = "";
	/** 对私客户职业 */
	private String profession = "";
	/** 对私客户职业 */
	private String profession_disp = "";
	/** 通信地址 */
	private String addr = "";
	/** 联系电话 */
	private String tel_no = "";
	/** 工作单位 */
	private String company = "";
	/** 其他补充信息 */
	private String other_info = "";
	/** 客户经理号 */
	private String manager_no = "";
	/** 客户经理名 */
	private String manager_name = "";
	/** 地区代码 */
	private String area_no = "";
	private String area_no_disp = "";
	/** 启用标志 */
	private String flag = "";
	/** 客户类型 */
	private String upd_type = "";
	/** 上次更新用户 */
	private String last_upd_user = "";
	/** 上次更新时间 */
	private Date last_upd_dt = null;
	/** 上次更新时间 */
	private String last_upd_dt_disp = "";
	/** 证件到期日 */
	private Date card_end_dt = null;
	/** 证件到期日 */
	private String card_end_dt_disp = "";
	/** 建立业务关系时间 */
	private Date create_dt = null;
	/** 建立业务关系时间 */
	private String create_dt_disp = "";
	/** 导入系统时间 */
	private Date income_dt = null;
	/** 导入系统时间 */
	private String income_dt_disp = "";
	/** 最后交易时间 */
	private Date last_trans_dt = null;
	private String industrykey = "";
	/** 行业 */
	private String industrykey_disp = "";
	private String local_affair_no = "";
	/** 数据权限 */
	private String curr_org = "";
	// add by qiuyun 2010-5-20 存量客户支持拆分表

	private String tableName = "";

	private String tableName2 = "";

	private String tableName3 = "";
	// end

	/** 法定代表人证件到期日 */
	private Date legal_card_no_end_dt = null;
	/** 法定代表人证件到期日 */
	private String legal_card_no_end_dt_disp = "";
	/** 地税登记证到期日 */
	private Date local_affair_end_dt = null;
	/** 地税登记证到期日 */
	private String local_affair_end_dt_disp = "";
	/** 国税登记证到期日 */
	private Date nation_affair_end_dt = null;
	/** 国税登记证到期日 */
	private String nation_affair_end_dt_disp = "";
	/** 组织机构代码到期日 */
	private Date organ_code_end_dt = null;
	/** 组织机构代码到期日 */
	private String organ_code_end_dt_disp = "";
	// 对私客户行业
	private String industry = "";
	// 对私客户前任单位
	private String pre_comp = "";
	// 现单位入职时间
	private String employed_dt = null;
	private String employed_dt_display = "";
	// 对私单位性质
	private String comp_prop = "";
	// 对私工作单位地址
	private String comp_addr = "";
	// 对私发证机关
	private String issu_autj = "";
	// 实际控制客户
	private String actu_cont = "";
	// 实际收益人
	private String actu_prof = "";
	// 对私单位编码
	private String comp_code = "";
	private String cell_no = "";
	//
	private String email_addr = "";
	// 对私全户名
	private String full_acct_name = "";
	// =======================================================
	private String gender = "";

	private String place_orig_disp = "";

	public String getPlace_orig_disp() {
		return place_orig_disp;
	}

	public void setPlace_orig_disp(String place_orig_disp) {
		this.place_orig_disp = place_orig_disp;
	}

	/**
	 * 构造函数
	 */
	public T47_individual() {
	}

	public void setPlace_orig(String place_origStr) {
		this.place_orig = place_origStr;
	}

	public String getPlace_orig() {
		return this.place_orig;
	}

	public void setOccupation(String occupationStr) {
		this.occupation = occupationStr;
	}

	public String getOccupation() {
		return this.occupation;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setMatrl_sts(String matrl_stsStr) {
		this.matrl_sts = matrl_stsStr;
	}

	public String getMatrl_sts() {
		return this.matrl_sts;
	}

	public void setStaff_ind(String staff_indStr) {
		this.staff_ind = staff_indStr;
	}

	public String getStaff_ind() {
		return this.staff_ind;
	}

	public void setIndiv_income(String indiv_incomeStr) {
		this.indiv_income = indiv_incomeStr;
	}

	public String getIndiv_income() {
		return this.indiv_income;
	}

	public String getStaffkey() {
		return staffkey;
	}

	public void setStaffkey(String staffkey) {
		this.staffkey = staffkey;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getParty_class_cd() {
		return party_class_cd;
	}

	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}

	public String getParty_class_cd_disp() {
		return party_class_cd_disp;
	}

	public void setParty_class_cd_disp(String party_class_cd_disp) {
		this.party_class_cd_disp = party_class_cd_disp;
	}

	public String getParty_name() {
		return party_name;
	}

	public void setParty_name(String party_name) {
		this.party_name = party_name;
	}

	public String getCountry_no() {
		return country_no;
	}

	public void setCountry_no(String country_no) {
		this.country_no = country_no;
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

	public String getParty_status_cd() {
		return party_status_cd;
	}

	public void setParty_status_cd(String party_status_cd) {
		this.party_status_cd = party_status_cd;
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

	public String getCustomerorder() {
		return customerorder;
	}

	public void setCustomerorder(String customerorder) {
		this.customerorder = customerorder;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getProfession() {
		return profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	public String getProfession_disp() {
		return profession_disp;
	}

	public void setProfession_disp(String profession_disp) {
		this.profession_disp = profession_disp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getOther_info() {
		return other_info;
	}

	public void setOther_info(String other_info) {
		this.other_info = other_info;
	}

	public String getManager_no() {
		return manager_no;
	}

	public void setManager_no(String manager_no) {
		this.manager_no = manager_no;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getArea_no() {
		return area_no;
	}

	public void setArea_no(String area_no) {
		this.area_no = area_no;
	}

	public String getArea_no_disp() {
		return area_no_disp;
	}

	public void setArea_no_disp(String area_no_disp) {
		this.area_no_disp = area_no_disp;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getUpd_type() {
		return upd_type;
	}

	public void setUpd_type(String upd_type) {
		this.upd_type = upd_type;
	}

	public String getLast_upd_user() {
		return last_upd_user;
	}

	public void setLast_upd_user(String last_upd_user) {
		this.last_upd_user = last_upd_user;
	}

	public Date getLast_upd_dt() {
		return last_upd_dt;
	}

	public void setLast_upd_dt(Date last_upd_dt) {
		this.last_upd_dt = last_upd_dt;
	}

	public String getLast_upd_dt_disp() {
		return last_upd_dt_disp;
	}

	public void setLast_upd_dt_disp(String last_upd_dt_disp) {
		this.last_upd_dt_disp = last_upd_dt_disp;
	}

	public Date getCard_end_dt() {
		return card_end_dt;
	}

	public void setCard_end_dt(Date card_end_dt) {
		this.card_end_dt = card_end_dt;
	}

	public String getCard_end_dt_disp() {
		return card_end_dt_disp;
	}

	public void setCard_end_dt_disp(String card_end_dt_disp) {
		this.card_end_dt_disp = card_end_dt_disp;
	}

	public Date getCreate_dt() {
		return create_dt;
	}

	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}

	public String getCreate_dt_disp() {
		return create_dt_disp;
	}

	public void setCreate_dt_disp(String create_dt_disp) {
		this.create_dt_disp = create_dt_disp;
	}

	public Date getIncome_dt() {
		return income_dt;
	}

	public void setIncome_dt(Date income_dt) {
		this.income_dt = income_dt;
	}

	public String getIncome_dt_disp() {
		return income_dt_disp;
	}

	public void setIncome_dt_disp(String income_dt_disp) {
		this.income_dt_disp = income_dt_disp;
	}

	public Date getLast_trans_dt() {
		return last_trans_dt;
	}

	public void setLast_trans_dt(Date last_trans_dt) {
		this.last_trans_dt = last_trans_dt;
	}

	public String getIndustrykey() {
		return industrykey;
	}

	public void setIndustrykey(String industrykey) {
		this.industrykey = industrykey;
	}

	public String getIndustrykey_disp() {
		return industrykey_disp;
	}

	public void setIndustrykey_disp(String industrykey_disp) {
		this.industrykey_disp = industrykey_disp;
	}

	public String getLocal_affair_no() {
		return local_affair_no;
	}

	public void setLocal_affair_no(String local_affair_no) {
		this.local_affair_no = local_affair_no;
	}

	public String getCurr_org() {
		return curr_org;
	}

	public void setCurr_org(String curr_org) {
		this.curr_org = curr_org;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableName2() {
		return tableName2;
	}

	public void setTableName2(String tableName2) {
		this.tableName2 = tableName2;
	}

	public String getTableName3() {
		return tableName3;
	}

	public void setTableName3(String tableName3) {
		this.tableName3 = tableName3;
	}

	public Date getLegal_card_no_end_dt() {
		return legal_card_no_end_dt;
	}

	public void setLegal_card_no_end_dt(Date legal_card_no_end_dt) {
		this.legal_card_no_end_dt = legal_card_no_end_dt;
	}

	public String getLegal_card_no_end_dt_disp() {
		return legal_card_no_end_dt_disp;
	}

	public void setLegal_card_no_end_dt_disp(String legal_card_no_end_dt_disp) {
		this.legal_card_no_end_dt_disp = legal_card_no_end_dt_disp;
	}

	public Date getLocal_affair_end_dt() {
		return local_affair_end_dt;
	}

	public void setLocal_affair_end_dt(Date local_affair_end_dt) {
		this.local_affair_end_dt = local_affair_end_dt;
	}

	public String getLocal_affair_end_dt_disp() {
		return local_affair_end_dt_disp;
	}

	public void setLocal_affair_end_dt_disp(String local_affair_end_dt_disp) {
		this.local_affair_end_dt_disp = local_affair_end_dt_disp;
	}

	public Date getNation_affair_end_dt() {
		return nation_affair_end_dt;
	}

	public void setNation_affair_end_dt(Date nation_affair_end_dt) {
		this.nation_affair_end_dt = nation_affair_end_dt;
	}

	public String getNation_affair_end_dt_disp() {
		return nation_affair_end_dt_disp;
	}

	public void setNation_affair_end_dt_disp(String nation_affair_end_dt_disp) {
		this.nation_affair_end_dt_disp = nation_affair_end_dt_disp;
	}

	public Date getOrgan_code_end_dt() {
		return organ_code_end_dt;
	}

	public void setOrgan_code_end_dt(Date organ_code_end_dt) {
		this.organ_code_end_dt = organ_code_end_dt;
	}

	public String getOrgan_code_end_dt_disp() {
		return organ_code_end_dt_disp;
	}

	public void setOrgan_code_end_dt_disp(String organ_code_end_dt_disp) {
		this.organ_code_end_dt_disp = organ_code_end_dt_disp;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getPre_comp() {
		return pre_comp;
	}

	public void setPre_comp(String pre_comp) {
		this.pre_comp = pre_comp;
	}

	public String getEmployed_dt() {
		return employed_dt;
	}

	public void setEmployed_dt(String employed_dt) {
		this.employed_dt = employed_dt;
	}

	public String getEmployed_dt_display() {
		return employed_dt_display;
	}

	public void setEmployed_dt_display(String employed_dt_display) {
		this.employed_dt_display = employed_dt_display;
	}

	public String getComp_prop() {
		return comp_prop;
	}

	public void setComp_prop(String comp_prop) {
		this.comp_prop = comp_prop;
	}

	public String getComp_addr() {
		return comp_addr;
	}

	public void setComp_addr(String comp_addr) {
		this.comp_addr = comp_addr;
	}

	public String getIssu_autj() {
		return issu_autj;
	}

	public void setIssu_autj(String issu_autj) {
		this.issu_autj = issu_autj;
	}

	public String getActu_cont() {
		return actu_cont;
	}

	public void setActu_cont(String actu_cont) {
		this.actu_cont = actu_cont;
	}

	public String getActu_prof() {
		return actu_prof;
	}

	public void setActu_prof(String actu_prof) {
		this.actu_prof = actu_prof;
	}

	public String getComp_code() {
		return comp_code;
	}

	public void setComp_code(String comp_code) {
		this.comp_code = comp_code;
	}

	public String getCell_no() {
		return cell_no;
	}

	public void setCell_no(String cell_no) {
		this.cell_no = cell_no;
	}

	public String getEmail_addr() {
		return email_addr;
	}

	public void setEmail_addr(String email_addr) {
		this.email_addr = email_addr;
	}

	public String getFull_acct_name() {
		return full_acct_name;
	}

	public void setFull_acct_name(String full_acct_name) {
		this.full_acct_name = full_acct_name;
	}
	// =======================================================
}
