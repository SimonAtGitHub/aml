package com.ist.aml.cust_identify.dto;

import java.io.Serializable;
import java.util.Date;

public class T10_newClientCheck
  implements Serializable
{
  private String organkey;
  private String organ_name_disp;
  private String party_id;
  private String party_class_cd;
  private String party_chn_name = "";

  private String party_eng_name = "";
  private String card_type_c;
  private String card_type_c_disp;
  private String card_type_cinfo;
  private String card_type;
  private String card_type_disp;
  private String card_typeinfo;
  private String card_no;
  private Date card_end_dt;
  private String card_end_dt_disp;
  private String country_cd;
  private String country_cd_disp;
  private String addr1 = "";

  private String cell_no = "";
  private String occupation;
  private String occupation_disp;
  private String occupationinfo;
  private String duty;
  private String duty_disp;
  private String company = "";
  private Double indiv_income;
  private String income_source = "";

  private String income_ecno = "";

  private String create_purpose = "";
  private String industry;
  private String industry_disp;
  private String aml2_type_cd;
  private String aml2_type_cd_disp;
  private String aml2_type_cdinfo;
  private String main_manage_scope = "";

  private String main_manage_business = "";
  private String enrol_fund_currency_cd;
  private String enrol_fund_currency_cd_disp;
  private Double enrol_fund_amt;
  private String legal_obj = "";
  private String legal_card_type;
  private String legal_card_type_disp;
  private String legal_card_typeinfo;
  private String legal_card_no;
  private Date legal_card_no_end_dt;
  private String legal_card_no_end_dt_disp;
  private String stock_holder = "";
  private String stock_holder_card_type;
  private String stock_holder_card_type_disp;
  private String stock_holder_card_typeinfo;
  private String stock_holder_card_no;
  private Date stock_holder_card_no_end_dt;
  private String stock_holder_card_no_end_dt_disp;
  private String org_credit_no = "";
  private Date org_credit_vt;
  private String org_credit_vt_disp;
  private String check_no;
  private String upcode;
  private String elementid;
  private String elementname;
  private String istrue;
  private String istrue_disp;
  private String context;
  private String checkuser;
  private Date checkdate;
  private String checkdate_disp;
  private String check_explain;
  private String checker;
  private String check_org;
  private Date check_dt;
  private String check_dt_disp;
  private Date valid_dt;
  private String valid_dt_disp;
  private String check_result;
  private String check_result_disp;
  private String addwmenu_flag;
  private String addwmenu_flag_disp;
  private String rule_type;
  private String rule_type_disp;
  private String addbmenu_flag;
  private String addbmenu_flag_disp;
  private String list_type;
  private String list_type_disp;
  private String reason_create;
  private String b_reason_create;
  private String check_type;
  private String table_name;
  private String check_reason;
  private String aml1_type_cd;
  //by zyd  2018-08-07新乡 增加营业执照到期日
  private Date licence_end_dt;
  private String  licence_end_dtdisp;
  
  public Date getLicence_end_dt() {
	return licence_end_dt;
}

public void setLicence_end_dt(Date licenceEndDt) {
	licence_end_dt = licenceEndDt;
}

public String getLicence_end_dtdisp() {
	return licence_end_dtdisp;
}

public void setLicence_end_dtdisp(String licenceEndDtdisp) {
	licence_end_dtdisp = licenceEndDtdisp;
}
//end 
  public String getOrgankey()
  {
    return this.organkey; }

  public void setOrgankey(String organkey) {
    this.organkey = organkey; }

  public String getParty_id() {
    return this.party_id; }

  public void setParty_id(String party_id) {
    this.party_id = party_id; }

  public String getParty_chn_name() {
    return this.party_chn_name; }

  public void setParty_chn_name(String partyChnName) {
    this.party_chn_name = partyChnName; }

  public String getParty_eng_name() {
    return this.party_eng_name; }

  public void setParty_eng_name(String partyEngName) {
    this.party_eng_name = partyEngName; }

  public String getCard_type_c() {
    return this.card_type_c; }

  public void setCard_type_c(String cardTypeC) {
    this.card_type_c = cardTypeC; }

  public String getCard_type() {
    return this.card_type; }

  public void setCard_type(String cardTypeI) {
    this.card_type = cardTypeI; }

  public String getCard_no() {
    return this.card_no; }

  public void setCard_no(String cardNo) {
    this.card_no = cardNo; }

  public Date getCard_end_dt() {
    return this.card_end_dt; }

  public void setCard_end_dt(Date cardEndDt) {
    this.card_end_dt = cardEndDt; }

  public String getCountry_cd() {
    return this.country_cd; }

  public void setCountry_cd(String countryCd) {
    this.country_cd = countryCd; }

  public String getAddr1() {
    return this.addr1; }

  public void setAddr1(String addr1) {
    this.addr1 = addr1; }

  public String getCell_no() {
    return this.cell_no; }

  public void setCell_no(String cellNo) {
    this.cell_no = cellNo; }

  public String getOccupation() {
    return this.occupation; }

  public void setOccupation(String occupation) {
    this.occupation = occupation; }

  public String getDuty() {
    return this.duty; }

  public void setDuty(String duty) {
    this.duty = duty; }

  public String getCompany() {
    return this.company; }

  public void setCompany(String company) {
    this.company = company; }

  public Double getIndiv_income() {
    return this.indiv_income; }

  public void setIndiv_income(Double indivIncome) {
    this.indiv_income = indivIncome; }

  public String getIncome_source() {
    return this.income_source; }

  public void setIncome_source(String incomeSource) {
    this.income_source = incomeSource; }

  public String getIncome_ecno() {
    return this.income_ecno; }

  public void setIncome_ecno(String economyEcno) {
    this.income_ecno = economyEcno; }

  public String getCreate_purpose() {
    return this.create_purpose; }

  public void setCreate_purpose(String createPurpose) {
    this.create_purpose = createPurpose; }

  public String getIndustry() {
    return this.industry; }

  public void setIndustry(String industry) {
    this.industry = industry; }

  public String getAml2_type_cd() {
    return this.aml2_type_cd; }

  public void setAml2_type_cd(String aml2TypeCd) {
    this.aml2_type_cd = aml2TypeCd; }

  public String getMain_manage_scope() {
    return this.main_manage_scope; }

  public void setMain_manage_scope(String mainManageScope) {
    this.main_manage_scope = mainManageScope; }

  public String getMain_manage_business() {
    return this.main_manage_business; }

  public void setMain_manage_business(String mainManageBusiness) {
    this.main_manage_business = mainManageBusiness; }

  public String getEnrol_fund_currency_cd() {
    return this.enrol_fund_currency_cd; }

  public void setEnrol_fund_currency_cd(String enrolFundCurrencyCd) {
    this.enrol_fund_currency_cd = enrolFundCurrencyCd; }

  public Double getEnrol_fund_amt() {
    return this.enrol_fund_amt; }

  public void setEnrol_fund_amt(Double enrolFundAmt) {
    this.enrol_fund_amt = enrolFundAmt; }

  public String getLegal_obj() {
    return this.legal_obj; }

  public void setLegal_obj(String legalObj) {
    this.legal_obj = legalObj; }

  public String getLegal_card_type() {
    return this.legal_card_type; }

  public void setLegal_card_type(String legalCardType) {
    this.legal_card_type = legalCardType; }

  public String getLegal_card_no() {
    return this.legal_card_no; }

  public void setLegal_card_no(String legalCardNo) {
    this.legal_card_no = legalCardNo; }

  public Date getLegal_card_no_end_dt() {
    return this.legal_card_no_end_dt; }

  public void setLegal_card_no_end_dt(Date legalCardNoEndDt) {
    this.legal_card_no_end_dt = legalCardNoEndDt; }

  public String getStock_holder() {
    return this.stock_holder; }

  public void setStock_holder(String stockHolder) {
    this.stock_holder = stockHolder; }

  public String getStock_holder_card_type() {
    return this.stock_holder_card_type; }

  public void setStock_holder_card_type(String stockHolderCardType) {
    this.stock_holder_card_type = stockHolderCardType; }

  public String getStock_holder_card_no() {
    return this.stock_holder_card_no; }

  public void setStock_holder_card_no(String stockHolderCardNo) {
    this.stock_holder_card_no = stockHolderCardNo; }

  public Date getStock_holder_card_no_end_dt() {
    return this.stock_holder_card_no_end_dt; }

  public void setStock_holder_card_no_end_dt(Date stockHolderCardNoEndDt) {
    this.stock_holder_card_no_end_dt = stockHolderCardNoEndDt; }

  public String getCheck_no() {
    return this.check_no; }

  public void setCheck_no(String checkNo) {
    this.check_no = checkNo; }

  public String getUpcode() {
    return this.upcode; }

  public void setUpcode(String upcode) {
    this.upcode = upcode; }

  public String getElementid() {
    return this.elementid; }

  public void setElementid(String elementid) {
    this.elementid = elementid; }

  public String getElementname() {
    return this.elementname; }

  public void setElementname(String elementname) {
    this.elementname = elementname; }

  public String getIstrue() {
    return this.istrue; }

  public void setIstrue(String istrue) {
    this.istrue = istrue; }

  public String getContext() {
    return this.context; }

  public void setContext(String context) {
    this.context = context; }

  public String getCheckuser() {
    return this.checkuser; }

  public void setCheckuser(String checkuser) {
    this.checkuser = checkuser; }

  public Date getCheckdate() {
    return this.checkdate; }

  public void setCheckdate(Date checkdate) {
    this.checkdate = checkdate; }

  public String getCheck_explain() {
    return this.check_explain; }

  public void setCheck_explain(String checkExplain) {
    this.check_explain = checkExplain; }

  public String getChecker() {
    return this.checker; }

  public void setChecker(String checker) {
    this.checker = checker; }

  public Date getCheck_dt() {
    return this.check_dt; }

  public void setCheck_dt(Date checkDt) {
    this.check_dt = checkDt; }

  public Date getValid_dt() {
    return this.valid_dt; }

  public void setValid_dt(Date validDt) {
    this.valid_dt = validDt; }

  public String getCheck_result() {
    return this.check_result; }

  public void setCheck_result(String checkResult) {
    this.check_result = checkResult; }

  public String getAddwmenu_flag() {
    return this.addwmenu_flag; }

  public void setAddwmenu_flag(String addwmenuFalg) {
    this.addwmenu_flag = addwmenuFalg; }

  public String getRule_type() {
    return this.rule_type; }

  public void setRule_type(String ruleType) {
    this.rule_type = ruleType; }

  public String getAddbmenu_flag() {
    return this.addbmenu_flag; }

  public void setAddbmenu_flag(String addbmenuFlag) {
    this.addbmenu_flag = addbmenuFlag; }

  public String getList_type() {
    return this.list_type; }

  public void setList_type(String listType) {
    this.list_type = listType; }

  public String getReason_create() {
    return this.reason_create; }

  public void setReason_create(String reasonCreate) {
    this.reason_create = reasonCreate; }

  public void setParty_class_cd(String party_class_cd) {
    this.party_class_cd = party_class_cd; }

  public String getParty_class_cd() {
    return this.party_class_cd; }

  public String getCard_end_dt_disp() {
    return this.card_end_dt_disp; }

  public void setCard_end_dt_disp(String cardEndDtDisp) {
    this.card_end_dt_disp = cardEndDtDisp; }

  public String getLegal_card_no_end_dt_disp() {
    return this.legal_card_no_end_dt_disp; }

  public void setLegal_card_no_end_dt_disp(String legalCardNoEndDtDisp) {
    this.legal_card_no_end_dt_disp = legalCardNoEndDtDisp; }

  public String getStock_holder_card_no_end_dt_disp() {
    return this.stock_holder_card_no_end_dt_disp;
  }

  public void setStock_holder_card_no_end_dt_disp(String stockHolderCardNoEndDtDisp) {
    this.stock_holder_card_no_end_dt_disp = stockHolderCardNoEndDtDisp; }

  public String getCheckdate_disp() {
    return this.checkdate_disp; }

  public void setCheckdate_disp(String checkdateDisp) {
    this.checkdate_disp = checkdateDisp; }

  public String getCheck_dt_disp() {
    return this.check_dt_disp; }

  public void setCheck_dt_disp(String checkDtDisp) {
    this.check_dt_disp = checkDtDisp; }

  public String getValid_dt_disp() {
    return this.valid_dt_disp; }

  public void setValid_dt_disp(String validDtDisp) {
    this.valid_dt_disp = validDtDisp; }

  public String getOrg_credit_no() {
    return this.org_credit_no; }

  public void setOrg_credit_no(String orgCreditNo) {
    this.org_credit_no = orgCreditNo; }

  public Date getOrg_credit_vt() {
    return this.org_credit_vt; }

  public void setOrg_credit_vt(Date orgCreditDt) {
    this.org_credit_vt = orgCreditDt; }

  public String getOrg_credit_vt_disp() {
    return this.org_credit_vt_disp; }

  public void setOrg_credit_vt_disp(String orgCreditDtDisp) {
    this.org_credit_vt_disp = orgCreditDtDisp; }

  public void setCheck_type(String check_type) {
    this.check_type = check_type; }

  public String getCheck_type() {
    return this.check_type; }

  public void setCountry_cd_disp(String country_cd_disp) {
    this.country_cd_disp = country_cd_disp; }

  public String getCountry_cd_disp() {
    return this.country_cd_disp; }

  public String getCard_type_disp() {
    return this.card_type_disp; }

  public void setCard_type_disp(String cardTypeDisp) {
    this.card_type_disp = cardTypeDisp; }

  public void setOccupation_disp(String occupation_disp) {
    this.occupation_disp = occupation_disp; }

  public String getOccupation_disp() {
    return this.occupation_disp; }

  public void setDuty_disp(String duty_disp) {
    this.duty_disp = duty_disp; }

  public String getDuty_disp() {
    return this.duty_disp; }

  public void setIndustry_disp(String industry_disp) {
    this.industry_disp = industry_disp; }

  public String getIndustry_disp() {
    return this.industry_disp; }

  public void setOrgan_name_disp(String organ_name_disp) {
    this.organ_name_disp = organ_name_disp; }

  public String getOrgan_name_disp() {
    return this.organ_name_disp; }

  public void setCard_type_c_disp(String card_type_c_disp) {
    this.card_type_c_disp = card_type_c_disp; }

  public String getCard_type_c_disp() {
    return this.card_type_c_disp; }

  public void setAml2_type_cd_disp(String aml2_type_cd_disp) {
    this.aml2_type_cd_disp = aml2_type_cd_disp; }

  public String getAml2_type_cd_disp() {
    return this.aml2_type_cd_disp;
  }

  public void setEnrol_fund_currency_cd_disp(String enrol_fund_currency_cd_disp) {
    this.enrol_fund_currency_cd_disp = enrol_fund_currency_cd_disp; }

  public String getEnrol_fund_currency_cd_disp() {
    return this.enrol_fund_currency_cd_disp; }

  public void setLegal_card_type_disp(String legal_card_type_disp) {
    this.legal_card_type_disp = legal_card_type_disp; }

  public String getLegal_card_type_disp() {
    return this.legal_card_type_disp;
  }

  public void setStock_holder_card_type_disp(String stock_holder_card_type_disp) {
    this.stock_holder_card_type_disp = stock_holder_card_type_disp; }

  public String getStock_holder_card_type_disp() {
    return this.stock_holder_card_type_disp; }

  public void setIstrue_disp(String istrue_disp) {
    this.istrue_disp = istrue_disp; }

  public String getIstrue_disp() {
    return this.istrue_disp; }

  public String getAddwmenu_flag_disp() {
    return this.addwmenu_flag_disp; }

  public void setAddwmenu_flag_disp(String addwmenuFlagDisp) {
    this.addwmenu_flag_disp = addwmenuFlagDisp; }

  public String getAddbmenu_flag_disp() {
    return this.addbmenu_flag_disp; }

  public void setAddbmenu_flag_disp(String addbmenuFlagDisp) {
    this.addbmenu_flag_disp = addbmenuFlagDisp; }

  public String getRule_type_disp() {
    return this.rule_type_disp; }

  public void setRule_type_disp(String ruleTypeDisp) {
    this.rule_type_disp = ruleTypeDisp; }

  public String getList_type_disp() {
    return this.list_type_disp; }

  public void setList_type_disp(String listTypeDisp) {
    this.list_type_disp = listTypeDisp; }

  public void setB_reason_create(String b_reason_create) {
    this.b_reason_create = b_reason_create; }

  public String getB_reason_create() {
    return this.b_reason_create; }

  public void setCard_typeinfo(String card_typeinfo) {
    this.card_typeinfo = card_typeinfo; }

  public String getCard_typeinfo() {
    return this.card_typeinfo; }

  public void setOccupationinfo(String occupationinfo) {
    this.occupationinfo = occupationinfo; }

  public String getOccupationinfo() {
    return this.occupationinfo; }

  public void setTable_name(String table_name) {
    this.table_name = table_name; }

  public String getTable_name() {
    return this.table_name; }

  public void setCheck_result_disp(String check_result_disp) {
    this.check_result_disp = check_result_disp; }

  public String getCheck_result_disp() {
    return this.check_result_disp; }

  public void setCard_type_cinfo(String card_type_cinfo) {
    this.card_type_cinfo = card_type_cinfo; }

  public String getCard_type_cinfo() {
    return this.card_type_cinfo; }

  public void setAml2_type_cdinfo(String aml2_type_cdinfo) {
    this.aml2_type_cdinfo = aml2_type_cdinfo; }

  public String getAml2_type_cdinfo() {
    return this.aml2_type_cdinfo; }

  public void setLegal_card_typeinfo(String legal_card_typeinfo) {
    this.legal_card_typeinfo = legal_card_typeinfo; }

  public String getLegal_card_typeinfo() {
    return this.legal_card_typeinfo; }

  public void setStock_holder_card_typeinfo(String stock_holder_card_typeinfo) {
    this.stock_holder_card_typeinfo = stock_holder_card_typeinfo; }

  public String getStock_holder_card_typeinfo() {
    return this.stock_holder_card_typeinfo; }

  public String getCheck_reason() {
    return this.check_reason; }

  public void setCheck_reason(String checkReason) {
    this.check_reason = checkReason; }

  public void setAml1_type_cd(String aml1_type_cd) {
    this.aml1_type_cd = aml1_type_cd; }

  public String getAml1_type_cd() {
    return this.aml1_type_cd; }

  public void setCheck_org(String check_org) {
    this.check_org = check_org; }

  public String getCheck_org() {
    return this.check_org;
  }
}