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

public class T47_corporation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2821981215644824251L;
	/** 行业 */
	private String industrykey = "";
	/** 企业规模 */
	private String company_scope = "";
	/** 特殊行业许可证号 */
	private String spec_indus_allow_cert_id = "";
	/** 基本帐户 */
	private String base_acct_num = "";
	/** 外商投资批准证书号 */
	private String forg_invest_cert_num = "";
	/** 当事人编号 */
	private String party_id = "";
	/** 是否集团客户 */
	private String group_cust_ind = "";
	/** 基本户开户行支行 */
	private String base_bank_org = "";
	/** 注册资本 */
	private String enrol_fund_amt = "";
	/** 基本户开户行 */
	private String base_bank_id = "";
	/** 企业类型 */
	private String company_type_cd = "";
	/** 发照日期 */
	private Date issue_license_dt = new Date();
	/** 执照年检日期 */
	private Date license_year_check_dt = new Date();
	/** 注册资本币别代码 */
	private String enrol_fund_currency_cd = "";
	/** 营业执照号 */
	private String business_licence = "";
	/** 贷款卡号 */
	private String loan_card_num = "";
	/** 所有制形式 */
	private String having_sys_form = "";
	/** 主营范围 */
	private String main_manage_scope = "";
	// =======================================================
	/** 发照日期 */
	private String issue_license_dt_disp = "";
	/** 执照年检日期 */
	private String license_year_check_dt_disp = "";
	/** 法定代表人 */
	private String legal_obj = "";
	/** 法定代表人证件类型 */
	private String legal_card_type = "";
	/** 法定代表人证件号码 */
	private String legal_card_no = "";

	private String company_type_cd_disp = "";

	private String industrykey_disp = "";
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
	/** 更新类型 */
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
	/** 保留字段 */
	private Date temp3 = null;
	/** 组织机构代码 */
	private String organ_code = "";
	/** 法人居住地 */
	private String legal_addr = "";
	/** 法人联系方式 */
	private String legal_tel = "";
	/** 营业执照到期日 */
	private Date licence_end_dt = null;
	/** 营业执照到期日 */
	private String licence_end_dt_disp = "";
	/** 国税登记证号 */
	private String nation_affair_no = "";
	/** 地税登记证号 */
	private String local_affair_no = "";
	/** 数据权限 */
	private String curr_org = "";
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
	private Date employed_dt = null;
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

	// 新加对公信息
	// 存款人类别
	private String depositer_ty = "";
	// 基本存款账户开户许可证号
	private String permit_no = "";
	// 批件（营业执照）的名称
	private String license_name = "";
	// 注册日期
	private Date register_dt = null;
	private String register_dt_display = "";
	// 注册地
	private String register_addr = "";
	// 单位负责人
	private String subject_officer = "";
	// 开户单位上级法人
	private String superior_legal = "";
	// 控股股东
	private String stock_holder = "";
	// 实际收益人
	private String acut_prof = "";
	// 实际控制人证件类型
	private String stock_holder_card_type = "";
	// 实际控制人身份证件号码
	private String stock_holder_card_no = "";
	// 实际控制人身份证件有效期限
	private Date stock_holder_card_no_end_dt = null;
	private String stock_holder_card_no_end_dt_display = "";
	/** 机构信用代码*/
	private String org_credit_no="";
	/** 机构信用代码有效期*/
	private Date org_credit_vt;
	private String org_credit_vt_disp="";
	

	public String getIndustrykey_disp() {
		return industrykey_disp;
	}

	public void setIndustrykey_disp(String industrykey_disp) {
		this.industrykey_disp = industrykey_disp;
	}

	public String getCompany_type_cd_disp() {
		return company_type_cd_disp;
	}

	public void setCompany_type_cd_disp(String company_type_cd_disp) {
		this.company_type_cd_disp = company_type_cd_disp;
	}

	/**
	 * 构造函数
	 */
	public T47_corporation() {
	}

	public void setIndustrykey(String industrykeyStr) {
		this.industrykey = industrykeyStr;
	}

	public String getIndustrykey() {
		return this.industrykey;
	}

	public void setCompany_scope(String company_scopeStr) {
		this.company_scope = company_scopeStr;
	}

	public String getCompany_scope() {
		return this.company_scope;
	}

	public void setSpec_indus_allow_cert_id(String spec_indus_allow_cert_idStr) {
		this.spec_indus_allow_cert_id = spec_indus_allow_cert_idStr;
	}

	public String getSpec_indus_allow_cert_id() {
		return this.spec_indus_allow_cert_id;
	}

	public void setBase_acct_num(String base_acct_numStr) {
		this.base_acct_num = base_acct_numStr;
	}

	public String getBase_acct_num() {
		return this.base_acct_num;
	}

	public void setForg_invest_cert_num(String forg_invest_cert_numStr) {
		this.forg_invest_cert_num = forg_invest_cert_numStr;
	}

	public String getForg_invest_cert_num() {
		return this.forg_invest_cert_num;
	}

	public void setParty_id(String party_idStr) {
		this.party_id = party_idStr;
	}

	public String getParty_id() {
		return this.party_id;
	}

	public void setGroup_cust_ind(String group_cust_indStr) {
		this.group_cust_ind = group_cust_indStr;
	}

	public String getGroup_cust_ind() {
		return this.group_cust_ind;
	}

	public void setBase_bank_org(String base_bank_orgStr) {
		this.base_bank_org = base_bank_orgStr;
	}

	public String getBase_bank_org() {
		return this.base_bank_org;
	}

	public void setEnrol_fund_amt(String enrol_fund_amtStr) {
		this.enrol_fund_amt = enrol_fund_amtStr;
	}

	public String getEnrol_fund_amt() {
		return this.enrol_fund_amt;
	}

	public void setBase_bank_id(String base_bank_idStr) {
		this.base_bank_id = base_bank_idStr;
	}

	public String getBase_bank_id() {
		return this.base_bank_id;
	}

	public void setCompany_type_cd(String company_type_cdStr) {
		this.company_type_cd = company_type_cdStr;
	}

	public String getCompany_type_cd() {
		return this.company_type_cd;
	}

	public void setIssue_license_dt(Date issue_license_dtStr) {
		this.issue_license_dt = issue_license_dtStr;
	}

	public Date getIssue_license_dt() {
		return this.issue_license_dt;
	}

	public void setLicense_year_check_dt(Date license_year_check_dtStr) {
		this.license_year_check_dt = license_year_check_dtStr;
	}

	public Date getLicense_year_check_dt() {
		return this.license_year_check_dt;
	}

	public void setEnrol_fund_currency_cd(String enrol_fund_currency_cdStr) {
		this.enrol_fund_currency_cd = enrol_fund_currency_cdStr;
	}

	public String getEnrol_fund_currency_cd() {
		return this.enrol_fund_currency_cd;
	}

	public void setBusiness_licence(String business_licenceStr) {
		this.business_licence = business_licenceStr;
	}

	public String getBusiness_licence() {
		return this.business_licence;
	}

	public void setLoan_card_num(String loan_card_numStr) {
		this.loan_card_num = loan_card_numStr;
	}

	public String getLoan_card_num() {
		return this.loan_card_num;
	}

	public void setHaving_sys_form(String having_sys_formStr) {
		this.having_sys_form = having_sys_formStr;
	}

	public String getHaving_sys_form() {
		return this.having_sys_form;
	}

	public void setMain_manage_scope(String main_manage_scopeStr) {
		this.main_manage_scope = main_manage_scopeStr;
	}

	public String getMain_manage_scope() {
		return this.main_manage_scope;
	}

	// =======================================================
	public void setIssue_license_dt_disp(String issue_license_dt_dispStr) {
		this.issue_license_dt_disp = issue_license_dt_dispStr;
	}

	public String getIssue_license_dt_disp() {
		return this.issue_license_dt_disp;
	}

	public void setLicense_year_check_dt_disp(
			String license_year_check_dt_dispStr) {
		this.license_year_check_dt_disp = license_year_check_dt_dispStr;
	}

	public String getLicense_year_check_dt_disp() {
		return this.license_year_check_dt_disp;
	}

	public String getLegal_card_no() {
		return legal_card_no;
	}

	public void setLegal_card_no(String legal_card_no) {
		this.legal_card_no = legal_card_no;
	}

	public String getLegal_card_type() {
		return legal_card_type;
	}

	public void setLegal_card_type(String legal_card_type) {
		this.legal_card_type = legal_card_type;
	}

	public String getLegal_obj() {
		return legal_obj;
	}

	public void setLegal_obj(String legal_obj) {
		this.legal_obj = legal_obj;
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

	public Date getTemp3() {
		return temp3;
	}

	public void setTemp3(Date temp3) {
		this.temp3 = temp3;
	}

	public String getOrgan_code() {
		return organ_code;
	}

	public void setOrgan_code(String organ_code) {
		this.organ_code = organ_code;
	}

	public String getLegal_addr() {
		return legal_addr;
	}

	public void setLegal_addr(String legal_addr) {
		this.legal_addr = legal_addr;
	}

	public String getLegal_tel() {
		return legal_tel;
	}

	public void setLegal_tel(String legal_tel) {
		this.legal_tel = legal_tel;
	}

	public Date getLicence_end_dt() {
		return licence_end_dt;
	}

	public void setLicence_end_dt(Date licence_end_dt) {
		this.licence_end_dt = licence_end_dt;
	}

	public String getLicence_end_dt_disp() {
		return licence_end_dt_disp;
	}

	public void setLicence_end_dt_disp(String licence_end_dt_disp) {
		this.licence_end_dt_disp = licence_end_dt_disp;
	}

	public String getNation_affair_no() {
		return nation_affair_no;
	}

	public void setNation_affair_no(String nation_affair_no) {
		this.nation_affair_no = nation_affair_no;
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

	public Date getEmployed_dt() {
		return employed_dt;
	}

	public void setEmployed_dt(Date employed_dt) {
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

	public String getDepositer_ty() {
		return depositer_ty;
	}

	public void setDepositer_ty(String depositer_ty) {
		this.depositer_ty = depositer_ty;
	}

	public String getPermit_no() {
		return permit_no;
	}

	public void setPermit_no(String permit_no) {
		this.permit_no = permit_no;
	}

	public String getLicense_name() {
		return license_name;
	}

	public void setLicense_name(String license_name) {
		this.license_name = license_name;
	}

	public Date getRegister_dt() {
		return register_dt;
	}

	public void setRegister_dt(Date register_dt) {
		this.register_dt = register_dt;
	}

	public String getRegister_dt_display() {
		return register_dt_display;
	}

	public void setRegister_dt_display(String register_dt_display) {
		this.register_dt_display = register_dt_display;
	}

	public String getRegister_addr() {
		return register_addr;
	}

	public void setRegister_addr(String register_addr) {
		this.register_addr = register_addr;
	}

	public String getSubject_officer() {
		return subject_officer;
	}

	public void setSubject_officer(String subject_officer) {
		this.subject_officer = subject_officer;
	}

	public String getSuperior_legal() {
		return superior_legal;
	}

	public void setSuperior_legal(String superior_legal) {
		this.superior_legal = superior_legal;
	}

	public String getStock_holder() {
		return stock_holder;
	}

	public void setStock_holder(String stock_holder) {
		this.stock_holder = stock_holder;
	}

	public String getAcut_prof() {
		return acut_prof;
	}

	public void setAcut_prof(String acut_prof) {
		this.acut_prof = acut_prof;
	}

	public String getStock_holder_card_type() {
		return stock_holder_card_type;
	}

	public void setStock_holder_card_type(String stock_holder_card_type) {
		this.stock_holder_card_type = stock_holder_card_type;
	}

	public String getStock_holder_card_no() {
		return stock_holder_card_no;
	}

	public void setStock_holder_card_no(String stock_holder_card_no) {
		this.stock_holder_card_no = stock_holder_card_no;
	}

	public Date getStock_holder_card_no_end_dt() {
		return stock_holder_card_no_end_dt;
	}

	public void setStock_holder_card_no_end_dt(Date stock_holder_card_no_end_dt) {
		this.stock_holder_card_no_end_dt = stock_holder_card_no_end_dt;
	}

	public String getStock_holder_card_no_end_dt_display() {
		return stock_holder_card_no_end_dt_display;
	}

	public void setStock_holder_card_no_end_dt_display(
			String stock_holder_card_no_end_dt_display) {
		this.stock_holder_card_no_end_dt_display = stock_holder_card_no_end_dt_display;
	}

	public String getOrg_credit_no() {
		return org_credit_no;
	}

	public void setOrg_credit_no(String orgCreditNo) {
		org_credit_no = orgCreditNo;
	}

	public Date getOrg_credit_vt() {
		return org_credit_vt;
	}

	public void setOrg_credit_vt(Date orgCreditVt) {
		org_credit_vt = orgCreditVt;
	}

	public String getOrg_credit_vt_disp() {
		return org_credit_vt_disp;
	}

	public void setOrg_credit_vt_disp(String orgCreditVtDisp) {
		org_credit_vt_disp = orgCreditVtDisp;
	}
	
	

}
