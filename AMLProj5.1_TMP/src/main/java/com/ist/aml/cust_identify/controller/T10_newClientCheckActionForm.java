/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ 
/*     */ public class T10_newClientCheckActionForm extends ActionForm
/*     */ {
/*     */   private String organkey;
/*     */   private String organ_name_disp;
/*     */   private String party_id;
/*     */   private String party_class_cd;
/*     */   private String party_chn_name;
/*     */   private String party_eng_name;
/*     */   private String card_type_c;
/*     */   private String card_type_c_disp;
/*     */   private String card_type_cinfo;
/*     */   private String card_type;
/*     */   private String card_type_disp;
/*     */   private String card_typeinfo;
/*     */   private String card_no;
/*     */   private Date card_end_dt;
/*     */   private String card_end_dt_disp;
/*     */   private String country_cd;
/*     */   private String country_cd_disp;
/*     */   private String addr1;
/*     */   private String cell_no;
/*     */   private String occupation;
/*     */   private String occupation_disp;
/*     */   private String occupationinfo;
/*     */   private String duty;
/*     */   private String duty_disp;
/*     */   private String company;
/*     */   private Double indiv_income;
/*     */   private String income_source;
/*     */   private String income_ecno;
/*     */   private String create_purpose;
/*     */   private String industry;
/*     */   private String industry_disp;
/*     */   private String aml2_type_cd;
/*     */   private String aml2_type_cd_disp;
/*     */   private String aml2_type_cdinfo;
/*     */   private String main_manage_scope;
/*     */   private String main_manage_business;
/*     */   private String enrol_fund_currency_cd;
/*     */   private String enrol_fund_currency_cd_disp;
/*     */   private Double enrol_fund_amt;
/*     */   private String legal_obj;
/*     */   private String legal_card_type;
/*     */   private String legal_card_type_disp;
/*     */   private String legal_card_typeinfo;
/*     */   private String legal_card_no;
/*     */   private Date legal_card_no_end_dt;
/*     */   private String legal_card_no_end_dt_disp;
/*     */   private String stock_holder;
/*     */   private String stock_holder_card_type;
/*     */   private String stock_holder_card_type_disp;
/*     */   private String stock_holder_card_typeinfo;
/*     */   private String stock_holder_card_no;
/*     */   private Date stock_holder_card_no_end_dt;
/*     */   private String stock_holder_card_no_end_dt_disp;
/* 179 */   private String org_credit_no = "";
/*     */   private Date org_credit_vt;
/*     */   private String org_credit_vt_disp;
/*     */   private String check_no;
/*     */   private String upcode;
/*     */   private String elementid;
/*     */   private String elementname;
/*     */   private String istrue;
/*     */   private String istrue_disp;
/*     */   private String context;
/*     */   private String checkuser;
/*     */   private Date checkdate;
/*     */   private String checkdate_disp;
/*     */   private String check_explain;
/*     */   private String checker;
/*     */   private Date check_dt;
/*     */   private String check_dt_disp;
/*     */   private Date valid_dt;
/*     */   private String valid_dt_disp;
/*     */   private String check_result;
/*     */   private String addwmenu_flag;
/*     */   private String addwmenu_flag_disp;
/*     */   private String rule_type;
/*     */   private String addbmenu_flag;
/*     */   private String addbmenu_flag_disp;
/*     */   private String list_type;
/*     */   private String reason_create;
/*     */   private String b_reason_create;
/*     */   private String check_type;
/*     */   private String aml1_type_cd;
/*     */   private String aml1_type_cd_disp;
/*     */   private String check_reason;
/*     */   private String table_name;
/*     */ 
/*     */   public String getCheck_type()
/*     */   {
/* 306 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 309 */     this.check_type = checkType;
/*     */   }
/*     */   public String getTable_name() {
/* 312 */     return this.table_name;
/*     */   }
/*     */   public void setTable_name(String tableName) {
/* 315 */     this.table_name = tableName;
/*     */   }
/*     */ 
/*     */   public String getOrgankey()
/*     */   {
/* 323 */     return this.organkey;
/*     */   }
/*     */   public void setOrgankey(String organkey) {
/* 326 */     this.organkey = organkey;
/*     */   }
/*     */   public String getParty_id() {
/* 329 */     return this.party_id;
/*     */   }
/*     */   public void setParty_id(String party_id) {
/* 332 */     this.party_id = party_id;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 335 */     return this.party_chn_name;
/*     */   }
/*     */   public void setParty_chn_name(String partyChnName) {
/* 338 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */   public String getParty_eng_name() {
/* 341 */     return this.party_eng_name;
/*     */   }
/*     */   public void setParty_eng_name(String partyEngName) {
/* 344 */     this.party_eng_name = partyEngName;
/*     */   }
/*     */   public String getCard_type_c() {
/* 347 */     return this.card_type_c;
/*     */   }
/*     */   public void setCard_type_c(String cardTypeC) {
/* 350 */     this.card_type_c = cardTypeC;
/*     */   }
/*     */   public String getCard_type() {
/* 353 */     return this.card_type;
/*     */   }
/*     */   public void setCard_type(String cardTypeI) {
/* 356 */     this.card_type = cardTypeI;
/*     */   }
/*     */   public String getCard_no() {
/* 359 */     return this.card_no;
/*     */   }
/*     */   public void setCard_no(String cardNo) {
/* 362 */     this.card_no = cardNo;
/*     */   }
/*     */   public Date getCard_end_dt() {
/* 365 */     return this.card_end_dt;
/*     */   }
/*     */   public void setCard_end_dt(Date cardEndDt) {
/* 368 */     this.card_end_dt = cardEndDt;
/*     */   }
/*     */   public String getCountry_cd() {
/* 371 */     return this.country_cd;
/*     */   }
/*     */   public void setCountry_cd(String countryCd) {
/* 374 */     this.country_cd = countryCd;
/*     */   }
/*     */   public String getAddr1() {
/* 377 */     return this.addr1;
/*     */   }
/*     */   public void setAddr1(String addr1) {
/* 380 */     this.addr1 = addr1;
/*     */   }
/*     */   public String getCell_no() {
/* 383 */     return this.cell_no;
/*     */   }
/*     */   public void setCell_no(String cellNo) {
/* 386 */     this.cell_no = cellNo;
/*     */   }
/*     */   public String getOccupation() {
/* 389 */     return this.occupation;
/*     */   }
/*     */   public void setOccupation(String occupation) {
/* 392 */     this.occupation = occupation;
/*     */   }
/*     */   public String getDuty() {
/* 395 */     return this.duty;
/*     */   }
/*     */   public void setDuty(String duty) {
/* 398 */     this.duty = duty;
/*     */   }
/*     */   public String getCompany() {
/* 401 */     return this.company;
/*     */   }
/*     */   public void setCompany(String company) {
/* 404 */     this.company = company;
/*     */   }
/*     */   public Double getIndiv_income() {
/* 407 */     return this.indiv_income;
/*     */   }
/*     */   public void setIndiv_income(Double indivIncome) {
/* 410 */     this.indiv_income = indivIncome;
/*     */   }
/*     */   public String getIncome_source() {
/* 413 */     return this.income_source;
/*     */   }
/*     */   public void setIncome_source(String incomeSource) {
/* 416 */     this.income_source = incomeSource;
/*     */   }
/*     */   public String getIncome_ecno() {
/* 419 */     return this.income_ecno;
/*     */   }
/*     */   public void setIncome_ecno(String economyEcno) {
/* 422 */     this.income_ecno = economyEcno;
/*     */   }
/*     */   public String getCreate_purpose() {
/* 425 */     return this.create_purpose;
/*     */   }
/*     */   public void setCreate_purpose(String createPurpose) {
/* 428 */     this.create_purpose = createPurpose;
/*     */   }
/*     */   public String getIndustry() {
/* 431 */     return this.industry;
/*     */   }
/*     */   public void setIndustry(String industry) {
/* 434 */     this.industry = industry;
/*     */   }
/*     */   public String getAml2_type_cd() {
/* 437 */     return this.aml2_type_cd;
/*     */   }
/*     */   public void setAml2_type_cd(String aml2TypeCd) {
/* 440 */     this.aml2_type_cd = aml2TypeCd;
/*     */   }
/*     */   public String getMain_manage_scope() {
/* 443 */     return this.main_manage_scope;
/*     */   }
/*     */   public void setMain_manage_scope(String mainManageScope) {
/* 446 */     this.main_manage_scope = mainManageScope;
/*     */   }
/*     */   public String getMain_manage_business() {
/* 449 */     return this.main_manage_business;
/*     */   }
/*     */   public void setMain_manage_business(String mainManageBusiness) {
/* 452 */     this.main_manage_business = mainManageBusiness;
/*     */   }
/*     */   public String getEnrol_fund_currency_cd() {
/* 455 */     return this.enrol_fund_currency_cd;
/*     */   }
/*     */   public void setEnrol_fund_currency_cd(String enrolFundCurrencyCd) {
/* 458 */     this.enrol_fund_currency_cd = enrolFundCurrencyCd;
/*     */   }
/*     */   public Double getEnrol_fund_amt() {
/* 461 */     return this.enrol_fund_amt;
/*     */   }
/*     */   public void setEnrol_fund_amt(Double enrolFundAmt) {
/* 464 */     this.enrol_fund_amt = enrolFundAmt;
/*     */   }
/*     */   public String getLegal_obj() {
/* 467 */     return this.legal_obj;
/*     */   }
/*     */   public void setLegal_obj(String legalObj) {
/* 470 */     this.legal_obj = legalObj;
/*     */   }
/*     */   public String getLegal_card_type() {
/* 473 */     return this.legal_card_type;
/*     */   }
/*     */   public void setLegal_card_type(String legalCardType) {
/* 476 */     this.legal_card_type = legalCardType;
/*     */   }
/*     */   public String getLegal_card_no() {
/* 479 */     return this.legal_card_no;
/*     */   }
/*     */   public void setLegal_card_no(String legalCardNo) {
/* 482 */     this.legal_card_no = legalCardNo;
/*     */   }
/*     */   public Date getLegal_card_no_end_dt() {
/* 485 */     return this.legal_card_no_end_dt;
/*     */   }
/*     */   public void setLegal_card_no_end_dt(Date legalCardNoEndDt) {
/* 488 */     this.legal_card_no_end_dt = legalCardNoEndDt;
/*     */   }
/*     */   public String getStock_holder() {
/* 491 */     return this.stock_holder;
/*     */   }
/*     */   public void setStock_holder(String stockHolder) {
/* 494 */     this.stock_holder = stockHolder;
/*     */   }
/*     */   public String getStock_holder_card_type() {
/* 497 */     return this.stock_holder_card_type;
/*     */   }
/*     */   public void setStock_holder_card_type(String stockHolderCardType) {
/* 500 */     this.stock_holder_card_type = stockHolderCardType;
/*     */   }
/*     */   public String getStock_holder_card_no() {
/* 503 */     return this.stock_holder_card_no;
/*     */   }
/*     */   public void setStock_holder_card_no(String stockHolderCardNo) {
/* 506 */     this.stock_holder_card_no = stockHolderCardNo;
/*     */   }
/*     */   public Date getStock_holder_card_no_end_dt() {
/* 509 */     return this.stock_holder_card_no_end_dt;
/*     */   }
/*     */   public void setStock_holder_card_no_end_dt(Date stockHolderCardNoEndDt) {
/* 512 */     this.stock_holder_card_no_end_dt = stockHolderCardNoEndDt;
/*     */   }
/*     */   public String getCheck_no() {
/* 515 */     return this.check_no;
/*     */   }
/*     */   public void setCheck_no(String checkNo) {
/* 518 */     this.check_no = checkNo;
/*     */   }
/*     */   public String getUpcode() {
/* 521 */     return this.upcode;
/*     */   }
/*     */   public void setUpcode(String upcode) {
/* 524 */     this.upcode = upcode;
/*     */   }
/*     */   public String getElementid() {
/* 527 */     return this.elementid;
/*     */   }
/*     */   public void setElementid(String elementid) {
/* 530 */     this.elementid = elementid;
/*     */   }
/*     */   public String getElementname() {
/* 533 */     return this.elementname;
/*     */   }
/*     */   public void setElementname(String elementname) {
/* 536 */     this.elementname = elementname;
/*     */   }
/*     */   public String getIstrue() {
/* 539 */     return this.istrue;
/*     */   }
/*     */   public void setIstrue(String istrue) {
/* 542 */     this.istrue = istrue;
/*     */   }
/*     */   public String getContext() {
/* 545 */     return this.context;
/*     */   }
/*     */   public void setContext(String context) {
/* 548 */     this.context = context;
/*     */   }
/*     */   public String getCheckuser() {
/* 551 */     return this.checkuser;
/*     */   }
/*     */   public void setCheckuser(String checkuser) {
/* 554 */     this.checkuser = checkuser;
/*     */   }
/*     */   public Date getCheckdate() {
/* 557 */     return this.checkdate;
/*     */   }
/*     */   public void setCheckdate(Date checkdate) {
/* 560 */     this.checkdate = checkdate;
/*     */   }
/*     */   public String getCheck_result() {
/* 563 */     return this.check_result;
/*     */   }
/*     */   public void setCheck_result(String checkResult) {
/* 566 */     this.check_result = checkResult;
/*     */   }
/*     */   public String getChecker() {
/* 569 */     return this.checker;
/*     */   }
/*     */   public void setChecker(String checker) {
/* 572 */     this.checker = checker;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 575 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 578 */     this.check_dt = checkDt;
/*     */   }
/*     */   public Date getValid_dt() {
/* 581 */     return this.valid_dt;
/*     */   }
/*     */   public void setValid_dt(Date validDt) {
/* 584 */     this.valid_dt = validDt;
/*     */   }
/*     */   public String getAddwmenu_flag() {
/* 587 */     return this.addwmenu_flag;
/*     */   }
/*     */   public void setAddwmenu_flag(String addwmenuFalg) {
/* 590 */     this.addwmenu_flag = addwmenuFalg;
/*     */   }
/*     */   public String getRule_type() {
/* 593 */     return this.rule_type;
/*     */   }
/*     */   public void setRule_type(String ruleType) {
/* 596 */     this.rule_type = ruleType;
/*     */   }
/*     */   public String getAddbmenu_flag() {
/* 599 */     return this.addbmenu_flag;
/*     */   }
/*     */   public void setAddbmenu_flag(String addbmenuFlag) {
/* 602 */     this.addbmenu_flag = addbmenuFlag;
/*     */   }
/*     */   public String getList_type() {
/* 605 */     return this.list_type;
/*     */   }
/*     */   public void setList_type(String listType) {
/* 608 */     this.list_type = listType;
/*     */   }
/*     */   public String getReason_create() {
/* 611 */     return this.reason_create;
/*     */   }
/*     */   public void setReason_create(String reasonCreate) {
/* 614 */     this.reason_create = reasonCreate;
/*     */   }
/*     */   public void setParty_class_cd(String party_class_cd) {
/* 617 */     this.party_class_cd = party_class_cd;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 620 */     return this.party_class_cd;
/*     */   }
/*     */   public String getCard_end_dt_disp() {
/* 623 */     return this.card_end_dt_disp;
/*     */   }
/*     */   public void setCard_end_dt_disp(String cardEndDtDisp) {
/* 626 */     this.card_end_dt_disp = cardEndDtDisp;
/*     */   }
/*     */   public String getLegal_card_no_end_dt_disp() {
/* 629 */     return this.legal_card_no_end_dt_disp;
/*     */   }
/*     */   public void setLegal_card_no_end_dt_disp(String legalCardNoEndDtDisp) {
/* 632 */     this.legal_card_no_end_dt_disp = legalCardNoEndDtDisp;
/*     */   }
/*     */   public String getStock_holder_card_no_end_dt_disp() {
/* 635 */     return this.stock_holder_card_no_end_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setStock_holder_card_no_end_dt_disp(String stockHolderCardNoEndDtDisp) {
/* 639 */     this.stock_holder_card_no_end_dt_disp = stockHolderCardNoEndDtDisp;
/*     */   }
/*     */   public String getCheckdate_disp() {
/* 642 */     return this.checkdate_disp;
/*     */   }
/*     */   public void setCheckdate_disp(String checkdateDisp) {
/* 645 */     this.checkdate_disp = checkdateDisp;
/*     */   }
/*     */   public String getCheck_dt_disp() {
/* 648 */     return this.check_dt_disp;
/*     */   }
/*     */   public void setCheck_dt_disp(String checkDtDisp) {
/* 651 */     this.check_dt_disp = checkDtDisp;
/*     */   }
/*     */   public String getValid_dt_disp() {
/* 654 */     return this.valid_dt_disp;
/*     */   }
/*     */   public void setValid_dt_disp(String validDtDisp) {
/* 657 */     this.valid_dt_disp = validDtDisp;
/*     */   }
/*     */   public String getOrg_credit_no() {
/* 660 */     return this.org_credit_no;
/*     */   }
/*     */   public void setOrg_credit_no(String orgCreditNo) {
/* 663 */     this.org_credit_no = orgCreditNo;
/*     */   }
/*     */   public Date getOrg_credit_vt() {
/* 666 */     return this.org_credit_vt;
/*     */   }
/*     */   public void setOrg_credit_vt(Date orgCreditDt) {
/* 669 */     this.org_credit_vt = orgCreditDt;
/*     */   }
/*     */   public String getOrg_credit_vt_disp() {
/* 672 */     return this.org_credit_vt_disp;
/*     */   }
/*     */   public void setOrg_credit_vt_disp(String orgCreditDtDisp) {
/* 675 */     this.org_credit_vt_disp = orgCreditDtDisp;
/*     */   }
/*     */   public void setCountry_cd_disp(String country_cd_disp) {
/* 678 */     this.country_cd_disp = country_cd_disp;
/*     */   }
/*     */   public String getCountry_cd_disp() {
/* 681 */     return this.country_cd_disp;
/*     */   }
/*     */   public String getCard_type_disp() {
/* 684 */     return this.card_type_disp;
/*     */   }
/*     */   public void setCard_type_disp(String cardTypeDisp) {
/* 687 */     this.card_type_disp = cardTypeDisp;
/*     */   }
/*     */   public void setOccupation_disp(String occupation_disp) {
/* 690 */     this.occupation_disp = occupation_disp;
/*     */   }
/*     */   public String getOccupation_disp() {
/* 693 */     return this.occupation_disp;
/*     */   }
/*     */   public void setDuty_disp(String duty_disp) {
/* 696 */     this.duty_disp = duty_disp;
/*     */   }
/*     */   public String getDuty_disp() {
/* 699 */     return this.duty_disp;
/*     */   }
/*     */   public void setIndustry_disp(String industry_disp) {
/* 702 */     this.industry_disp = industry_disp;
/*     */   }
/*     */   public String getIndustry_disp() {
/* 705 */     return this.industry_disp;
/*     */   }
/*     */   public void setOrgan_name_disp(String organ_name_disp) {
/* 708 */     this.organ_name_disp = organ_name_disp;
/*     */   }
/*     */   public String getOrgan_name_disp() {
/* 711 */     return this.organ_name_disp;
/*     */   }
/*     */   public void setCard_type_c_disp(String card_type_c_disp) {
/* 714 */     this.card_type_c_disp = card_type_c_disp;
/*     */   }
/*     */   public String getCard_type_c_disp() {
/* 717 */     return this.card_type_c_disp;
/*     */   }
/*     */   public void setAml2_type_cd_disp(String aml2_type_cd_disp) {
/* 720 */     this.aml2_type_cd_disp = aml2_type_cd_disp;
/*     */   }
/*     */   public String getAml2_type_cd_disp() {
/* 723 */     return this.aml2_type_cd_disp;
/*     */   }
/*     */ 
/*     */   public void setEnrol_fund_currency_cd_disp(String enrol_fund_currency_cd_disp) {
/* 727 */     this.enrol_fund_currency_cd_disp = enrol_fund_currency_cd_disp;
/*     */   }
/*     */   public String getEnrol_fund_currency_cd_disp() {
/* 730 */     return this.enrol_fund_currency_cd_disp;
/*     */   }
/*     */   public void setLegal_card_type_disp(String legal_card_type_disp) {
/* 733 */     this.legal_card_type_disp = legal_card_type_disp;
/*     */   }
/*     */   public String getLegal_card_type_disp() {
/* 736 */     return this.legal_card_type_disp;
/*     */   }
/*     */ 
/*     */   public void setStock_holder_card_type_disp(String stock_holder_card_type_disp) {
/* 740 */     this.stock_holder_card_type_disp = stock_holder_card_type_disp;
/*     */   }
/*     */   public String getStock_holder_card_type_disp() {
/* 743 */     return this.stock_holder_card_type_disp;
/*     */   }
/*     */   public void setIstrue_disp(String istrue_disp) {
/* 746 */     this.istrue_disp = istrue_disp;
/*     */   }
/*     */   public String getIstrue_disp() {
/* 749 */     return this.istrue_disp;
/*     */   }
/*     */   public String getAddwmenu_flag_disp() {
/* 752 */     return this.addwmenu_flag_disp;
/*     */   }
/*     */   public void setAddwmenu_flag_disp(String addwmenuFlagDisp) {
/* 755 */     this.addwmenu_flag_disp = addwmenuFlagDisp;
/*     */   }
/*     */   public String getAddbmenu_flag_disp() {
/* 758 */     return this.addbmenu_flag_disp;
/*     */   }
/*     */   public void setAddbmenu_flag_disp(String addbmenuFlagDisp) {
/* 761 */     this.addbmenu_flag_disp = addbmenuFlagDisp;
/*     */   }
/*     */   public void setB_reason_create(String b_reason_create) {
/* 764 */     this.b_reason_create = b_reason_create;
/*     */   }
/*     */   public String getB_reason_create() {
/* 767 */     return this.b_reason_create;
/*     */   }
/*     */   public void setCheck_explain(String check_explain) {
/* 770 */     this.check_explain = check_explain;
/*     */   }
/*     */   public String getCheck_explain() {
/* 773 */     return this.check_explain;
/*     */   }
/*     */   public void setCard_typeinfo(String card_typeinfo) {
/* 776 */     this.card_typeinfo = card_typeinfo;
/*     */   }
/*     */   public String getCard_typeinfo() {
/* 779 */     return this.card_typeinfo;
/*     */   }
/*     */   public void setOccupationinfo(String occupationinfo) {
/* 782 */     this.occupationinfo = occupationinfo;
/*     */   }
/*     */   public String getOccupationinfo() {
/* 785 */     return this.occupationinfo;
/*     */   }
/*     */   public void setCard_type_cinfo(String card_type_cinfo) {
/* 788 */     this.card_type_cinfo = card_type_cinfo;
/*     */   }
/*     */   public String getCard_type_cinfo() {
/* 791 */     return this.card_type_cinfo;
/*     */   }
/*     */   public void setAml2_type_cdinfo(String aml2_type_cdinfo) {
/* 794 */     this.aml2_type_cdinfo = aml2_type_cdinfo;
/*     */   }
/*     */   public String getAml2_type_cdinfo() {
/* 797 */     return this.aml2_type_cdinfo;
/*     */   }
/*     */   public void setLegal_card_typeinfo(String legal_card_typeinfo) {
/* 800 */     this.legal_card_typeinfo = legal_card_typeinfo;
/*     */   }
/*     */   public String getLegal_card_typeinfo() {
/* 803 */     return this.legal_card_typeinfo;
/*     */   }
/*     */   public void setStock_holder_card_typeinfo(String stock_holder_card_typeinfo) {
/* 806 */     this.stock_holder_card_typeinfo = stock_holder_card_typeinfo;
/*     */   }
/*     */   public String getStock_holder_card_typeinfo() {
/* 809 */     return this.stock_holder_card_typeinfo;
/*     */   }
/*     */   public String getAml1_type_cd() {
/* 812 */     return this.aml1_type_cd;
/*     */   }
/*     */   public void setAml1_type_cd(String aml1TypeCd) {
/* 815 */     this.aml1_type_cd = aml1TypeCd;
/*     */   }
/*     */   public String getAml1_type_cd_disp() {
/* 818 */     return this.aml1_type_cd_disp;
/*     */   }
/*     */   public void setAml1_type_cd_disp(String aml1TypeCdDisp) {
/* 821 */     this.aml1_type_cd_disp = aml1TypeCdDisp;
/*     */   }
/*     */   public String getCheck_reason() {
/* 824 */     return this.check_reason;
/*     */   }
/*     */   public void setCheck_reason(String checkReason) {
/* 827 */     this.check_reason = checkReason;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_newClientCheckActionForm
 * JD-Core Version:    0.6.2
 */