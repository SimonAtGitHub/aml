package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_survey_cust implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4294525003388786891L;
	/**客户号*/
	private String party_id="";
	/**客户种类*/
	private String party_class_cd="";
	/**显示客户种类对应说明*/
	private String party_class_cd_disp="";
	/**客户名称*/
	private String party_chn_name="";
	/**客户国籍*/
	private String country_cd="";
	private String country_cd_disp="";
	/**证件类型*/
	private String card_type="";
	private String card_type_disp="";
	/**证件号码*/
	private String card_no="";
	/**客户状态*/
	private String party_status_cd="";
	private String party_status_cd_disp="";
	/**归属机构*/
	private String organkey="";
	/**机构名称*/
	private String organname="";
	/**排序字段*/
	private String customerorder="";
	/**排序方式*/
	private String order="";
	/**对私客户职业*/
	private String profession="";
    /**对私客户职业*/
    private String profession_disp="";
	/**通信地址*/
	private String addr1="";
	/**联系电话*/
	private String tel_no="";
	/**移动电话*/
	private String cell_no="";
	/**工作单位*/
	private String company="";
	/**其他补充信息*/
	private String other_info="";
	/**客户经理号*/
	private String manager_no="";
	/**客户经理名*/
	private String manager_name="";
	/**地区代码*/
	private String country_residence="";
	private String area_no_disp="";
	/**启用标志*/
	private String flag="";
	/**客户类型*/
	private String temp1="";
	/**识别类型*/
	private String temp2="";
	/**性别*/
	private String gender="";
	/**更新类型*/
	private String upd_type="";
	/**上次更新用户*/
	private String last_upd_user="";
	/**上次更新时间*/
	private Date last_upd_dt=null;
	/**上次更新时间*/
	private String last_upd_dt_disp="";
	/**证件到期日*/
	private Date card_end_dt=null;
	/**证件到期日*/
	private String card_end_dt_disp="";
	/**建立业务关系时间*/
	private Date create_dt=null;
	/**建立业务关系时间*/
	private String create_dt_disp="";
	/**导入系统时间*/
	private Date income_dt=null;
	/**导入系统时间*/
	private String income_dt_disp="";
	/**最后交易时间*/
	private Date last_trans_dt=null;
	/**保留字段*/
	private Date temp3= null;
	/**组织机构代码*/
	private String organ_code="";
	/**注册资金*/
	private String enrol_fund_amt="";
	/**注册资金币种*/
	private String enrol_fund_currency_cd="";
	/**基本账号*/
	private String base_acct_num="";
	/**基本账号归属行*/
	private String base_bank_id="";
	/**基本账号归属网点*/
	private String base_bank_org="";
	/**经营范围*/
	private String company_scope="";
	/**行业*/
	private String industrykey="";
    /**行业*/
    private String industrykey_disp="";
	/**企业类型*/
	private String company_type_cd="";
	/**主营业务*/
	private String main_manage_scope="";
	/**法人代表*/
	private String legal_obj="";
	/**法人代表证件类型*/
	private String legal_card_type="";
	/**法人代表证件号码*/
	private String legal_card_no="";
	/**法人居住地*/
	private String legal_addr="";
	/**法人联系方式*/
	private String legal_tel="";
	/**营业执照号*/
	private String business_licence="";
	/**营业执照到期日*/
	private Date licence_end_dt=null;
	/**营业执照到期日*/
	private String licence_end_dt_disp="";
	/**国税登记证号*/
	private String nation_affair_no="";
	/**地税登记证号*/
	private String local_affair_no="";
	/**机构信用代码*/
	private String org_credit_no="";
	/**机构信用代码有效期*/
	private Date org_credit_vt=new Date();
	private String org_credit_vt_disp="";
     /**数据权限*/
    private String curr_org = "";
    private String occupation="";
    private String organ_code_end_dt_disp="";
    private String nation_affair_end_dt_disp="";
    private Date nation_affair_end_dt;
    private String local_affair_end_dt_disp="";
    private Date local_affair_end_dt;
    private Date legal_card_no_end_dt;
    private String legal_card_no_end_dt_disp="";
    private Date organ_code_end_dt=null;
    
    private String list_type = ""; //名单类型 ：白、黑、灰名单
    
	public Date getOrgan_code_end_dt() {
		return organ_code_end_dt;
	}
	public void setOrgan_code_end_dt(Date organ_code_end_dt) {
		this.organ_code_end_dt = organ_code_end_dt;
	}
	public String getLocal_affair_end_dt_disp() {
		return local_affair_end_dt_disp;
	}
	public void setLocal_affair_end_dt_disp(String local_affair_end_dt_disp) {
		this.local_affair_end_dt_disp = local_affair_end_dt_disp;
	}
	public String getNation_affair_end_dt_disp() {
		return nation_affair_end_dt_disp;
	}
	public void setNation_affair_end_dt_disp(String nation_affair_end_dt_disp) {
		this.nation_affair_end_dt_disp = nation_affair_end_dt_disp;
	}
	public String getOrgan_code_end_dt_disp() {
		return organ_code_end_dt_disp;
	}
	public void setOrgan_code_end_dt_disp(String organ_code_end_dt_disp) {
		this.organ_code_end_dt_disp = organ_code_end_dt_disp;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	/**
     * @return the curr_org
     */
    public String getCurr_org() {
        return curr_org;
    }
    /**
     * @param curr_org the curr_org to set
     */
    public void setCurr_org(String curr_org) {
        this.curr_org = curr_org;
    }
    public String getLicence_end_dt_disp() {
		return licence_end_dt_disp;
	}
	public void setLicence_end_dt_disp(String licence_end_dt_disp) {
		this.licence_end_dt_disp = licence_end_dt_disp;
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
	public String getLast_upd_user() {
		return last_upd_user;
	}
	public void setLast_upd_user(String last_upd_user) {
		this.last_upd_user = last_upd_user;
	}
	public String getUpd_type() {
		return upd_type;
	}
	public void setUpd_type(String upd_type) {
		this.upd_type = upd_type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_no() {
		return manager_no;
	}
	public void setManager_no(String manager_no) {
		this.manager_no = manager_no;
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

	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
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
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	
	public String getParty_status_cd() {
		return party_status_cd;
	}
	public void setParty_status_cd(String party_status_cd) {
		this.party_status_cd = party_status_cd;
	}
	public String getParty_class_cd_disp() {
		return party_class_cd_disp;
	}
	public void setParty_class_cd_disp(String party_class_cd_disp) {
		this.party_class_cd_disp = party_class_cd_disp;
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
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
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
	public String getBusiness_licence() {
		return business_licence;
	}
	public void setBusiness_licence(String business_licence) {
		this.business_licence = business_licence;
	}
	public String getCompany_scope() {
		return company_scope;
	}
	public void setCompany_scope(String company_scope) {
		this.company_scope = company_scope;
	}
	public String getCompany_type_cd() {
		return company_type_cd;
	}
	public void setCompany_type_cd(String company_type_cd) {
		this.company_type_cd = company_type_cd;
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
	public String getIndustrykey() {
		return industrykey;
	}
	public void setIndustrykey(String industrykey) {
		this.industrykey = industrykey;
	}
	public String getLegal_addr() {
		return legal_addr;
	}
	public void setLegal_addr(String legal_addr) {
		this.legal_addr = legal_addr;
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
	public String getLocal_affair_no() {
		return local_affair_no;
	}
	public void setLocal_affair_no(String local_affair_no) {
		this.local_affair_no = local_affair_no;
	}
	public String getMain_manage_scope() {
		return main_manage_scope;
	}
	public void setMain_manage_scope(String main_manage_scope) {
		this.main_manage_scope = main_manage_scope;
	}
	public String getNation_affair_no() {
		return nation_affair_no;
	}
	public void setNation_affair_no(String nation_affair_no) {
		this.nation_affair_no = nation_affair_no;
	}
	public String getOrgan_code() {
		return organ_code;
	}
	public void setOrgan_code(String organ_code) {
		this.organ_code = organ_code;
	}
	public String getArea_no_disp() {
		return area_no_disp;
	}
	public void setArea_no_disp(String area_no_disp) {
		this.area_no_disp = area_no_disp;
	}
    /**
     * @return the industrykey_disp
     */
    public String getIndustrykey_disp() {
        return industrykey_disp;
    }
    /**
     * @param industrykey_disp the industrykey_disp to set
     */
    public void setIndustrykey_disp(String industrykey_disp) {
        this.industrykey_disp = industrykey_disp;
    }
    /**
     * @return the profession_disp
     */
    public String getProfession_disp() {
        return profession_disp;
    }
    /**
     * @param profession_disp the profession_disp to set
     */
    public void setProfession_disp(String profession_disp) {
        this.profession_disp = profession_disp;
    }
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getCountry_cd() {
		return country_cd;
	}
	public void setCountry_cd(String country_cd) {
		this.country_cd = country_cd;
	}
	public String getCountry_residence() {
		return country_residence;
	}
	public void setCountry_residence(String country_residence) {
		this.country_residence = country_residence;
	}
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}
	public String getCountry_cd_disp() {
		return country_cd_disp;
	}
	public void setCountry_cd_disp(String country_cd_disp) {
		this.country_cd_disp = country_cd_disp;
	}
	public String getCard_type_disp() {
		return card_type_disp;
	}
	public void setCard_type_disp(String card_type_disp) {
		this.card_type_disp = card_type_disp;
	}
	public String getParty_status_cd_disp() {
		return party_status_cd_disp;
	}
	public void setParty_status_cd_disp(String party_status_cd_disp) {
		this.party_status_cd_disp = party_status_cd_disp;
	}
	public String getLegal_card_no_end_dt_disp() {
		return legal_card_no_end_dt_disp;
	}
	public void setLegal_card_no_end_dt_disp(String legal_card_no_end_dt_disp) {
		this.legal_card_no_end_dt_disp = legal_card_no_end_dt_disp;
	}
	public Date getNation_affair_end_dt() {
		return nation_affair_end_dt;
	}
	public void setNation_affair_end_dt(Date nation_affair_end_dt) {
		this.nation_affair_end_dt = nation_affair_end_dt;
	}
	public Date getLocal_affair_end_dt() {
		return local_affair_end_dt;
	}
	public void setLocal_affair_end_dt(Date local_affair_end_dt) {
		this.local_affair_end_dt = local_affair_end_dt;
	}
	public Date getLegal_card_no_end_dt() {
		return legal_card_no_end_dt;
	}
	public void setLegal_card_no_end_dt(Date legal_card_no_end_dt) {
		this.legal_card_no_end_dt = legal_card_no_end_dt;
	}
	public String getList_type() {
		return list_type;
	}
	public void setList_type(String list_type) {
		this.list_type = list_type;
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
