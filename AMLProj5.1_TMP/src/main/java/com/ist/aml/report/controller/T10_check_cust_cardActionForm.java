package com.ist.aml.report.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class T10_check_cust_cardActionForm extends ActionForm {
	private String party_id = "";
	private String party_name = "";
	private String party_class_cd = "";
	private String organkey = "";
	private String check_status = "";
	private String card_due_start;
	private String card_due_end;
	private String selectedPartyId = "";
	private String order_check = "";
	private String fashion = "asc";
	private Date card_due_dt = null;
	private String valid_dt_disp = "";
	private String organName = "";
	
	private String card_type_inf = "";
	private String legal_card_type_inf = "";

	public String getLegal_card_type_inf() {
		return legal_card_type_inf;
	}

	public void setLegal_card_type_inf(String legalCardTypeInf) {
		legal_card_type_inf = legalCardTypeInf;
	}
	public String getCard_type_inf() {
		return card_type_inf;
	}

	public void setCard_type_inf(String cardTypeInf) {
		card_type_inf = cardTypeInf;
	}
	private int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOrganName() {
		return organName;
	}

	public void setOrganName(String organName) {
		this.organName = organName;
	}

	public String getValid_dt_disp() {
		return valid_dt_disp;
	}

	public void setValid_dt_disp(String valid_dt_disp) {
		this.valid_dt_disp = valid_dt_disp;
	}

	public Date getCard_due_dt() {
		return card_due_dt;
	}

	public void setCard_due_dt(Date card_due_dt) {
		this.card_due_dt = card_due_dt;
	}

	public String getCard_due_dt_disp() {
		return card_due_dt_disp;
	}

	public void setCard_due_dt_disp(String card_due_dt_disp) {
		this.card_due_dt_disp = card_due_dt_disp;
	}

	private String card_due_dt_disp = "";
	private String legal_card_no_end_dt_disp = "";

	public String getLegal_card_no_end_dt_disp() {
		return legal_card_no_end_dt_disp;
	}

	public void setLegal_card_no_end_dt_disp(String legal_card_no_end_dt_disp) {
		this.legal_card_no_end_dt_disp = legal_card_no_end_dt_disp;
	}

	public Date getLegal_card_no_end_dt() {
		return legal_card_no_end_dt;
	}

	public void setLegal_card_no_end_dt(Date legal_card_no_end_dt) {
		this.legal_card_no_end_dt = legal_card_no_end_dt;
	}

	public String getLocal_affair_end_dt_disp() {
		return local_affair_end_dt_disp;
	}

	public void setLocal_affair_end_dt_disp(String local_affair_end_dt_disp) {
		this.local_affair_end_dt_disp = local_affair_end_dt_disp;
	}

	public Date getLocal_affair_end_dt() {
		return local_affair_end_dt;
	}

	public void setLocal_affair_end_dt(Date local_affair_end_dt) {
		this.local_affair_end_dt = local_affair_end_dt;
	}

	public String getNation_affair_end_dt_disp() {
		return nation_affair_end_dt_disp;
	}

	public void setNation_affair_end_dt_disp(String nation_affair_end_dt_disp) {
		this.nation_affair_end_dt_disp = nation_affair_end_dt_disp;
	}

	public Date getNation_affair_end_dt() {
		return nation_affair_end_dt;
	}

	public void setNation_affair_end_dt(Date nation_affair_end_dt) {
		this.nation_affair_end_dt = nation_affair_end_dt;
	}

	public String getOrgan_code_end_dt_disp() {
		return organ_code_end_dt_disp;
	}

	public void setOrgan_code_end_dt_disp(String organ_code_end_dt_disp) {
		this.organ_code_end_dt_disp = organ_code_end_dt_disp;
	}

	public Date getOrgan_code_end_dt() {
		return organ_code_end_dt;
	}

	public void setOrgan_code_end_dt(Date organ_code_end_dt) {
		this.organ_code_end_dt = organ_code_end_dt;
	}

	private String flag_disp = "";

	public String getFlag_disp() {
		return flag_disp;
	}

	public void setFlag_disp(String flag_disp) {
		this.flag_disp = flag_disp;
	}

	private Date legal_card_no_end_dt = null;
	private String local_affair_end_dt_disp = "";
	private Date local_affair_end_dt = null;
	private String nation_affair_end_dt_disp = "";
	private Date nation_affair_end_dt = null;
	private String organ_code_end_dt_disp = "";
	private Date organ_code_end_dt = null;

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

	public String getOrgankey() {
		return organkey;
	}

	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}

	public String getCheck_status() {
		return check_status;
	}

	public void setCheck_status(String check_status) {
		this.check_status = check_status;
	}

	public String getSelectedPartyId() {
		return selectedPartyId;
	}

	public void setSelectedPartyId(String selectedPartyId) {
		this.selectedPartyId = selectedPartyId;
	}

	public String getOrder_check() {
		return order_check;
	}

	public void setOrder_check(String order_check) {
		this.order_check = order_check;
	}

	public String getFashion() {
		return fashion;
	}

	public void setFashion(String fashion) {
		this.fashion = fashion;
	}

	public String getCard_due_start() {
		return card_due_start;
	}

	public void setCard_due_start(String card_due_start) {
		this.card_due_start = card_due_start;
	}

	public String getCard_due_end() {
		return card_due_end;
	}

	public void setCard_due_end(String card_due_end) {
		this.card_due_end = card_due_end;
	}

	/** 客户号 */

	/** 显示客户种类对应说明 */
	private String party_class_cd_disp = "";

	public String getParty_class_cd_disp() {
		return party_class_cd_disp;
	}

	public void setParty_class_cd_disp(String party_class_cd_disp) {
		this.party_class_cd_disp = party_class_cd_disp;
	}

	public String getParty_chn_name() {
		return party_chn_name;
	}

	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
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

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getCell_no() {
		return cell_no;
	}

	public void setCell_no(String cellNo) {
		cell_no = cellNo;
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

	public String getCountry_residence() {
		return country_residence;
	}

	public void setCountry_residence(String country_residence) {
		this.country_residence = country_residence;
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

	public String getTemp1() {
		return temp1;
	}

	public void setTemp1(String temp1) {
		this.temp1 = temp1;
	}

	public String getTemp2() {
		return temp2;
	}

	public void setTemp2(String temp2) {
		this.temp2 = temp2;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
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

	public String getEnrol_fund_amt() {
		return enrol_fund_amt;
	}

	public void setEnrol_fund_amt(String enrol_fund_amt) {
		this.enrol_fund_amt = enrol_fund_amt;
	}

	public String getEnrol_fund_currency_cd() {
		return enrol_fund_currency_cd;
	}

	public void setEnrol_fund_currency_cd(String enrol_fund_currency_cd) {
		this.enrol_fund_currency_cd = enrol_fund_currency_cd;
	}

	public String getBase_acct_num() {
		return base_acct_num;
	}

	public void setBase_acct_num(String base_acct_num) {
		this.base_acct_num = base_acct_num;
	}

	public String getBase_bank_id() {
		return base_bank_id;
	}

	public void setBase_bank_id(String base_bank_id) {
		this.base_bank_id = base_bank_id;
	}

	public String getBase_bank_org() {
		return base_bank_org;
	}

	public void setBase_bank_org(String base_bank_org) {
		this.base_bank_org = base_bank_org;
	}

	public String getCompany_scope() {
		return company_scope;
	}

	public void setCompany_scope(String company_scope) {
		this.company_scope = company_scope;
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

	public String getCompany_type_cd() {
		return company_type_cd;
	}

	public void setCompany_type_cd(String company_type_cd) {
		this.company_type_cd = company_type_cd;
	}

	public String getMain_manage_scope() {
		return main_manage_scope;
	}

	public void setMain_manage_scope(String main_manage_scope) {
		this.main_manage_scope = main_manage_scope;
	}

	public String getLegal_obj() {
		return legal_obj;
	}

	public void setLegal_obj(String legal_obj) {
		this.legal_obj = legal_obj;
	}

	public String getLegal_card_type() {
		return legal_card_type;
	}

	public void setLegal_card_type(String legal_card_type) {
		this.legal_card_type = legal_card_type;
	}

	public String getLegal_card_no() {
		return legal_card_no;
	}

	public void setLegal_card_no(String legal_card_no) {
		this.legal_card_no = legal_card_no;
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

	public String getBusiness_licence() {
		return business_licence;
	}

	public void setBusiness_licence(String business_licence) {
		this.business_licence = business_licence;
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

	public String[] getClient_selected() {
		return client_selected;
	}

	public void setClient_selected(String[] client_selected) {
		this.client_selected = client_selected;
	}

	public String getCurr_org() {
		return curr_org;
	}

	public void setCurr_org(String curr_org) {
		this.curr_org = curr_org;
	}

	/** 客户名称 */
	private String party_chn_name = "";
	/** 客户国籍 */
	private String country_cd = "";
	/** 证件类型 */
	private String card_type = "";
	/** 证件号码 */
	private String card_no = "";
	/** 客户状态 */
	private String party_status_cd = "";

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
	private String addr1 = "";
	/** 联系电话 */
	private String tel_no = "";
	private String cell_no = "";

	/** 工作单位 */
	private String company = "";
	/** 其他补充信息 */
	private String other_info = "";
	/** 客户经理号 */
	private String manager_no = "";
	/** 客户经理名 */
	private String manager_name = "";
	/** 地区代码 */
	private String country_residence = "";
	private String area_no_disp = "";
	/** 启用标志 */
	private String flag = "";
	/** 客户类型 */
	private String temp1 = "";
	/** 识别类型 */
	private String temp2 = "";
	/** 性别 */
	private String gender = "";
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
	/** 注册资金 */
	private String enrol_fund_amt = "";
	/** 注册资金币种 */
	private String enrol_fund_currency_cd = "";
	/** 基本账号 */
	private String base_acct_num = "";
	/** 基本账号归属行 */
	private String base_bank_id = "";
	/** 基本账号归属网点 */
	private String base_bank_org = "";
	/** 经营范围 */
	private String company_scope = "";
	/** 行业 */
	private String industrykey = "";
	/** 行业 */
	private String industrykey_disp = "";
	/** 企业类型 */
	private String company_type_cd = "";
	/** 主营业务 */
	private String main_manage_scope = "";
	/** 法人代表 */
	private String legal_obj = "";
	/** 法人代表证件类型 */
	private String legal_card_type = "";
	/** 法人代表证件号码 */
	private String legal_card_no = "";
	/** 法人居住地 */
	private String legal_addr = "";
	/** 法人联系方式 */
	private String legal_tel = "";
	/** 营业执照号 */
	private String business_licence = "";
	/** 营业执照到期日 */
	private Date licence_end_dt = null;
	/** 营业执照到期日 */
	private String licence_end_dt_disp = "";
	/** 国税登记证号 */
	private String nation_affair_no = "";
	/** 地税登记证号 */
	private String local_affair_no = "";

	/** 机构信用代码 */
	private String org_credit_no = "";

	/** 机构信用代码有效期 */
	private Date org_credit_vt = null;
	private String org_credit_vt_disp = "";

	private String[] client_selected = null;
	/** 数据权限 */
	private String curr_org = "";
	private String occupation = "";

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	private String checkid = "";

	public String getCheckid() {
		return checkid;
	}

	public void setCheckid(String checkid) {
		this.checkid = checkid;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getFundorigin() {
		return fundorigin;
	}

	public void setFundorigin(String fundorigin) {
		this.fundorigin = fundorigin;
	}

	public String getFounduse() {
		return founduse;
	}

	public void setFounduse(String founduse) {
		this.founduse = founduse;
	}

	public String getRunbusi() {
		return runbusi;
	}

	public void setRunbusi(String runbusi) {
		this.runbusi = runbusi;
	}

	public String getChangeid() {
		return changeid;
	}

	public void setChangeid(String changeid) {
		this.changeid = changeid;
	}

	public String getTradeanalyse() {
		return tradeanalyse;
	}

	public void setTradeanalyse(String tradeanalyse) {
		this.tradeanalyse = tradeanalyse;
	}

	public String getRunstatanalyse() {
		return runstatanalyse;
	}

	public void setRunstatanalyse(String runstatanalyse) {
		this.runstatanalyse = runstatanalyse;
	}

	public String getFinanceeanalyse() {
		return financeeanalyse;
	}

	public void setFinanceeanalyse(String financeeanalyse) {
		this.financeeanalyse = financeeanalyse;
	}

	public String getCustid() {
		return custid;
	}

	public void setCustid(String custid) {
		this.custid = custid;
	}

	public String getCustname() {
		return custname;
	}

	public void setCustname(String custname) {
		this.custname = custname;
	}

	public String getLinkmode() {
		return linkmode;
	}

	public void setLinkmode(String linkmode) {
		this.linkmode = linkmode;
	}

	public String getAmt() {
		return amt;
	}

	public void setAmt(String amt) {
		this.amt = amt;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAccuno() {
		return accuno;
	}

	public void setAccuno(String accuno) {
		this.accuno = accuno;
	}

	public String getOpp_organ_type() {
		return opp_organ_type;
	}

	public void setOpp_organ_type(String opp_organ_type) {
		this.opp_organ_type = opp_organ_type;
	}

	public String getAreano() {
		return areano;
	}

	public void setAreano(String areano) {
		this.areano = areano;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getOpp_party_id() {
		return opp_party_id;
	}

	public void setOpp_party_id(String opp_party_id) {
		this.opp_party_id = opp_party_id;
	}

	private String background = "";
	private String fundorigin = "";
	private String founduse = "";
	private String runbusi = "";
	private String changeid = "";

	// T10_ECONOMYINFO
	private String tradeanalyse = "";
	private String runstatanalyse = "";
	private String financeeanalyse = "";

	// T10_CONTROLLERINFO
	private String custid = "";
	private String custname = "";
	private String linkmode = "";
	private Double amt_m = null;
	private String amt = "";

	// T10_DAIBANPERINFO

	public Double getAmt_m() {
		return amt_m;
	}

	public void setAmt_m(Double amtM) {
		amt_m = amtM;
	}

	private String addr = "";
	// T10_OPPCUSTINFO

	private String accuno = "";
	private String opp_organ_type = "";

	private String areano = "";
	private String areaname = "";
	private String note = "";
	private String opp_party_id = "";

	public String getParty_name_agent() {
		return party_name_agent;
	}

	public void setParty_name_agent(String party_name_agent) {
		this.party_name_agent = party_name_agent;
	}

	public String getCard_no_agent() {
		return card_no_agent;
	}

	public void setCard_no_agent(String card_no_agent) {
		this.card_no_agent = card_no_agent;
	}

	public String getCard_type_agent() {
		return card_type_agent;
	}

	public void setCard_type_agent(String card_type_agent) {
		this.card_type_agent = card_type_agent;
	}

	public String getLinkmode_agent() {
		return linkmode_agent;
	}

	public void setLinkmode_agent(String linkmode_agent) {
		this.linkmode_agent = linkmode_agent;
	}

	public String getParty_name_opp() {
		return party_name_opp;
	}

	public void setParty_name_opp(String party_name_opp) {
		this.party_name_opp = party_name_opp;
	}

	public String getCard_no_opp() {
		return card_no_opp;
	}

	public void setCard_no_opp(String card_no_opp) {
		this.card_no_opp = card_no_opp;
	}

	public String getCard_type_opp() {
		return card_type_opp;
	}

	public void setCard_type_opp(String card_type_opp) {
		this.card_type_opp = card_type_opp;
	}

	private String party_name_agent = "";
	private String card_no_agent = "";
	private String card_type_agent = "";
	private String linkmode_agent = "";
	private String party_name_opp = "";
	private String card_no_opp = "";
	private String card_type_opp = "";
	private String check_type = "";

	public String getCheck_type() {
		return check_type;
	}

	public void setCheck_type(String check_type) {
		this.check_type = check_type;
	}

	public Date getCheck_dt() {
		return check_dt;
	}

	public void setCheck_dt(Date check_dt) {
		this.check_dt = check_dt;
	}

	public Date getValid_dt() {
		return valid_dt;
	}

	public void setValid_dt(Date valid_dt) {
		this.valid_dt = valid_dt;
	}

	public String getCheck_result() {
		return check_result;
	}

	public void setCheck_result(String check_result) {
		this.check_result = check_result;
	}

	public String getCheck_explain() {
		return check_explain;
	}

	public void setCheck_explain(String check_explain) {
		this.check_explain = check_explain;
	}

	public String getChecker() {
		return checker;
	}

	public void setChecker(String checker) {
		this.checker = checker;
	}

	public String getChecker_org() {
		return checker_org;
	}

	public void setChecker_org(String checker_org) {
		this.checker_org = checker_org;
	}

	private Date check_dt = null;
	private Date valid_dt = null;
	private String check_result = "";
	private String check_explain = "";
	private String checker = "";
	private String checker_org = "";
	private String obj_name = "";

	public String getObj_name() {
		return obj_name;
	}

	public void setObj_name(String obj_name) {
		this.obj_name = obj_name;
	}

	public String getIsuse() {
		return isuse;
	}

	public void setIsuse(String isuse) {
		this.isuse = isuse;
	}

	public String getReason_create() {
		return reason_create;
	}

	public void setReason_create(String reason_create) {
		this.reason_create = reason_create;
	}

	public String getReason_cancel() {
		return reason_cancel;
	}

	public void setReason_cancel(String reason_cancel) {
		this.reason_cancel = reason_cancel;
	}

	public String getRule_type() {
		return rule_type;
	}

	public void setRule_type(String rule_type) {
		this.rule_type = rule_type;
	}

	public Date getValidate_dt() {
		return validate_dt;
	}

	public void setValidate_dt(Date validate_dt) {
		this.validate_dt = validate_dt;
	}

	public Date getInvalidate_dt() {
		return invalidate_dt;
	}

	public void setInvalidate_dt(Date invalidate_dt) {
		this.invalidate_dt = invalidate_dt;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public String getModify_user() {
		return modify_user;
	}

	public void setModify_user(String modify_user) {
		this.modify_user = modify_user;
	}

	public Date getModify_dt() {
		return modify_dt;
	}

	public void setModify_dt(Date modify_dt) {
		this.modify_dt = modify_dt;
	}

	public String getReason_create_new() {
		return reason_create_new;
	}

	public void setReason_create_new(String reason_create_new) {
		this.reason_create_new = reason_create_new;
	}

	public String getRule_type_new() {
		return rule_type_new;
	}

	public void setRule_type_new(String rule_type_new) {
		this.rule_type_new = rule_type_new;
	}

	public Date getValidate_dt_new() {
		return validate_dt_new;
	}

	public void setValidate_dt_new(Date validate_dt_new) {
		this.validate_dt_new = validate_dt_new;
	}

	public Date getInvalidate_dt_new() {
		return invalidate_dt_new;
	}

	public void setInvalidate_dt_new(Date invalidate_dt_new) {
		this.invalidate_dt_new = invalidate_dt_new;
	}

	public String getIsuse_new() {
		return isuse_new;
	}

	public void setIsuse_new(String isuse_new) {
		this.isuse_new = isuse_new;
	}

	public String getIscheck() {
		return ischeck;
	}

	public void setIscheck(String ischeck) {
		this.ischeck = ischeck;
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

	private String isuse = "";

	private String reason_create = null;
	private String reason_cancel = "";
	private String rule_type = "";
	private Date validate_dt = null;
	private Date invalidate_dt = null;
	private String create_user = "";

	private String modify_user = "";
	private Date modify_dt = null;
	private String reason_create_new = "";
	private String rule_type_new = "";
	private Date validate_dt_new = null;
	private Date invalidate_dt_new = null;
	private String isuse_new = "";
	private String ischeck = "";
	private String list_type = "";

	public String getList_type() {
		return list_type;
	}

	public void setList_type(String list_type) {
		this.list_type = list_type;
	}

	private String validate_dt_new_disp = "";

	public String getValidate_dt_new_disp() {
		return validate_dt_new_disp;
	}

	public void setValidate_dt_new_disp(String validate_dt_new_disp) {
		this.validate_dt_new_disp = validate_dt_new_disp;
	}

	public String getInvalidate_dt_new_disp() {
		return invalidate_dt_new_disp;
	}

	public void setInvalidate_dt_new_disp(String invalidate_dt_new_disp) {
		this.invalidate_dt_new_disp = invalidate_dt_new_disp;
	}

	private String invalidate_dt_new_disp = "";

	public void reset(ActionMapping actionmapping, HttpServletRequest httpservletrequest) {
		// TODO Auto-generated method stub
		try {
			background = "";
			fundorigin = "";
			founduse = "";
			runbusi = "";
			changeid = "";

			// T10_ECONOMYINFO
			tradeanalyse = "";
			runstatanalyse = "";
			financeeanalyse = "";

			// T10_CONTROLLERINFO
			custid = "";
			custname = "";
			linkmode = "";
			amt = "";
			// T10_DAIBANPERINFO

			addr = "";
			// T10_OPPCUSTINFO

			accuno = "";
			opp_organ_type = "";

			areano = "";
			areaname = "";
			note = "";
			opp_party_id = "";
			income_dt_disp = "";
			party_name = "";
			card_no = "";
			card_type = "";
			card_due_dt_disp = "";
			party_name_agent = "";
			card_no_agent = "";
			card_type_agent = "";
			linkmode_agent = "";
			party_name_opp = "";
			card_no_opp = "";
			card_type_opp = "";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
