/*     */ package com.ist.aml.cust_identify.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T10_newClientCheck
/*     */   implements Serializable
/*     */ {
/*     */   private String organkey;
/*     */   private String organ_name_disp;
/*     */   private String party_id;
/*     */   private String party_class_cd;
/*  26 */   private String party_chn_name = "";
/*     */ 
/*  30 */   private String party_eng_name = "";
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
/*  63 */   private String addr1 = "";
/*     */ 
/*  67 */   private String cell_no = "";
/*     */   private String occupation;
/*     */   private String occupation_disp;
/*     */   private String occupationinfo;
/*     */   private String duty;
/*     */   private String duty_disp;
/*  85 */   private String company = "";
/*     */   private Double indiv_income;
/*  93 */   private String income_source = "";
/*     */ 
/*  97 */   private String income_ecno = "";
/*     */ 
/* 101 */   private String create_purpose = "";
/*     */   private String industry;
/*     */   private String industry_disp;
/*     */   private String aml2_type_cd;
/*     */   private String aml2_type_cd_disp;
/*     */   private String aml2_type_cdinfo;
/* 118 */   private String main_manage_scope = "";
/*     */ 
/* 122 */   private String main_manage_business = "";
/*     */   private String enrol_fund_currency_cd;
/*     */   private String enrol_fund_currency_cd_disp;
/*     */   private Double enrol_fund_amt;
/* 136 */   private String legal_obj = "";
/*     */   private String legal_card_type;
/*     */   private String legal_card_type_disp;
/*     */   private String legal_card_typeinfo;
/*     */   private String legal_card_no;
/*     */   private Date legal_card_no_end_dt;
/*     */   private String legal_card_no_end_dt_disp;
/* 156 */   private String stock_holder = "";
/*     */   private String stock_holder_card_type;
/*     */   private String stock_holder_card_type_disp;
/*     */   private String stock_holder_card_typeinfo;
/*     */   private String stock_holder_card_no;
/*     */   private Date stock_holder_card_no_end_dt;
/*     */   private String stock_holder_card_no_end_dt_disp;
/* 175 */   private String org_credit_no = "";
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
/*     */   private String check_org;
/*     */   private Date check_dt;
/*     */   private String check_dt_disp;
/*     */   private Date valid_dt;
/*     */   private String valid_dt_disp;
/*     */   private String check_result;
/*     */   private String check_result_disp;
/*     */   private String addwmenu_flag;
/*     */   private String addwmenu_flag_disp;
/*     */   private String rule_type;
/*     */   private String rule_type_disp;
/*     */   private String addbmenu_flag;
/*     */   private String addbmenu_flag_disp;
/*     */   private String list_type;
/*     */   private String list_type_disp;
/*     */   private String reason_create;
/*     */   private String b_reason_create;
/*     */   private String check_type;
/*     */   private String table_name;
/*     */   private String check_reason;
/*     */   private String aml1_type_cd;
/*     */ 
/*     */   public String getOrgankey()
/*     */   {
/* 317 */     return this.organkey;
/*     */   }
/*     */   public void setOrgankey(String organkey) {
/* 320 */     this.organkey = organkey;
/*     */   }
/*     */   public String getParty_id() {
/* 323 */     return this.party_id;
/*     */   }
/*     */   public void setParty_id(String party_id) {
/* 326 */     this.party_id = party_id;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 329 */     return this.party_chn_name;
/*     */   }
/*     */   public void setParty_chn_name(String partyChnName) {
/* 332 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */   public String getParty_eng_name() {
/* 335 */     return this.party_eng_name;
/*     */   }
/*     */   public void setParty_eng_name(String partyEngName) {
/* 338 */     this.party_eng_name = partyEngName;
/*     */   }
/*     */   public String getCard_type_c() {
/* 341 */     return this.card_type_c;
/*     */   }
/*     */   public void setCard_type_c(String cardTypeC) {
/* 344 */     this.card_type_c = cardTypeC;
/*     */   }
/*     */   public String getCard_type() {
/* 347 */     return this.card_type;
/*     */   }
/*     */   public void setCard_type(String cardTypeI) {
/* 350 */     this.card_type = cardTypeI;
/*     */   }
/*     */   public String getCard_no() {
/* 353 */     return this.card_no;
/*     */   }
/*     */   public void setCard_no(String cardNo) {
/* 356 */     this.card_no = cardNo;
/*     */   }
/*     */   public Date getCard_end_dt() {
/* 359 */     return this.card_end_dt;
/*     */   }
/*     */   public void setCard_end_dt(Date cardEndDt) {
/* 362 */     this.card_end_dt = cardEndDt;
/*     */   }
/*     */   public String getCountry_cd() {
/* 365 */     return this.country_cd;
/*     */   }
/*     */   public void setCountry_cd(String countryCd) {
/* 368 */     this.country_cd = countryCd;
/*     */   }
/*     */   public String getAddr1() {
/* 371 */     return this.addr1;
/*     */   }
/*     */   public void setAddr1(String addr1) {
/* 374 */     this.addr1 = addr1;
/*     */   }
/*     */   public String getCell_no() {
/* 377 */     return this.cell_no;
/*     */   }
/*     */   public void setCell_no(String cellNo) {
/* 380 */     this.cell_no = cellNo;
/*     */   }
/*     */   public String getOccupation() {
/* 383 */     return this.occupation;
/*     */   }
/*     */   public void setOccupation(String occupation) {
/* 386 */     this.occupation = occupation;
/*     */   }
/*     */   public String getDuty() {
/* 389 */     return this.duty;
/*     */   }
/*     */   public void setDuty(String duty) {
/* 392 */     this.duty = duty;
/*     */   }
/*     */   public String getCompany() {
/* 395 */     return this.company;
/*     */   }
/*     */   public void setCompany(String company) {
/* 398 */     this.company = company;
/*     */   }
/*     */   public Double getIndiv_income() {
/* 401 */     return this.indiv_income;
/*     */   }
/*     */   public void setIndiv_income(Double indivIncome) {
/* 404 */     this.indiv_income = indivIncome;
/*     */   }
/*     */   public String getIncome_source() {
/* 407 */     return this.income_source;
/*     */   }
/*     */   public void setIncome_source(String incomeSource) {
/* 410 */     this.income_source = incomeSource;
/*     */   }
/*     */   public String getIncome_ecno() {
/* 413 */     return this.income_ecno;
/*     */   }
/*     */   public void setIncome_ecno(String economyEcno) {
/* 416 */     this.income_ecno = economyEcno;
/*     */   }
/*     */   public String getCreate_purpose() {
/* 419 */     return this.create_purpose;
/*     */   }
/*     */   public void setCreate_purpose(String createPurpose) {
/* 422 */     this.create_purpose = createPurpose;
/*     */   }
/*     */   public String getIndustry() {
/* 425 */     return this.industry;
/*     */   }
/*     */   public void setIndustry(String industry) {
/* 428 */     this.industry = industry;
/*     */   }
/*     */   public String getAml2_type_cd() {
/* 431 */     return this.aml2_type_cd;
/*     */   }
/*     */   public void setAml2_type_cd(String aml2TypeCd) {
/* 434 */     this.aml2_type_cd = aml2TypeCd;
/*     */   }
/*     */   public String getMain_manage_scope() {
/* 437 */     return this.main_manage_scope;
/*     */   }
/*     */   public void setMain_manage_scope(String mainManageScope) {
/* 440 */     this.main_manage_scope = mainManageScope;
/*     */   }
/*     */   public String getMain_manage_business() {
/* 443 */     return this.main_manage_business;
/*     */   }
/*     */   public void setMain_manage_business(String mainManageBusiness) {
/* 446 */     this.main_manage_business = mainManageBusiness;
/*     */   }
/*     */   public String getEnrol_fund_currency_cd() {
/* 449 */     return this.enrol_fund_currency_cd;
/*     */   }
/*     */   public void setEnrol_fund_currency_cd(String enrolFundCurrencyCd) {
/* 452 */     this.enrol_fund_currency_cd = enrolFundCurrencyCd;
/*     */   }
/*     */   public Double getEnrol_fund_amt() {
/* 455 */     return this.enrol_fund_amt;
/*     */   }
/*     */   public void setEnrol_fund_amt(Double enrolFundAmt) {
/* 458 */     this.enrol_fund_amt = enrolFundAmt;
/*     */   }
/*     */   public String getLegal_obj() {
/* 461 */     return this.legal_obj;
/*     */   }
/*     */   public void setLegal_obj(String legalObj) {
/* 464 */     this.legal_obj = legalObj;
/*     */   }
/*     */   public String getLegal_card_type() {
/* 467 */     return this.legal_card_type;
/*     */   }
/*     */   public void setLegal_card_type(String legalCardType) {
/* 470 */     this.legal_card_type = legalCardType;
/*     */   }
/*     */   public String getLegal_card_no() {
/* 473 */     return this.legal_card_no;
/*     */   }
/*     */   public void setLegal_card_no(String legalCardNo) {
/* 476 */     this.legal_card_no = legalCardNo;
/*     */   }
/*     */   public Date getLegal_card_no_end_dt() {
/* 479 */     return this.legal_card_no_end_dt;
/*     */   }
/*     */   public void setLegal_card_no_end_dt(Date legalCardNoEndDt) {
/* 482 */     this.legal_card_no_end_dt = legalCardNoEndDt;
/*     */   }
/*     */   public String getStock_holder() {
/* 485 */     return this.stock_holder;
/*     */   }
/*     */   public void setStock_holder(String stockHolder) {
/* 488 */     this.stock_holder = stockHolder;
/*     */   }
/*     */   public String getStock_holder_card_type() {
/* 491 */     return this.stock_holder_card_type;
/*     */   }
/*     */   public void setStock_holder_card_type(String stockHolderCardType) {
/* 494 */     this.stock_holder_card_type = stockHolderCardType;
/*     */   }
/*     */   public String getStock_holder_card_no() {
/* 497 */     return this.stock_holder_card_no;
/*     */   }
/*     */   public void setStock_holder_card_no(String stockHolderCardNo) {
/* 500 */     this.stock_holder_card_no = stockHolderCardNo;
/*     */   }
/*     */   public Date getStock_holder_card_no_end_dt() {
/* 503 */     return this.stock_holder_card_no_end_dt;
/*     */   }
/*     */   public void setStock_holder_card_no_end_dt(Date stockHolderCardNoEndDt) {
/* 506 */     this.stock_holder_card_no_end_dt = stockHolderCardNoEndDt;
/*     */   }
/*     */   public String getCheck_no() {
/* 509 */     return this.check_no;
/*     */   }
/*     */   public void setCheck_no(String checkNo) {
/* 512 */     this.check_no = checkNo;
/*     */   }
/*     */   public String getUpcode() {
/* 515 */     return this.upcode;
/*     */   }
/*     */   public void setUpcode(String upcode) {
/* 518 */     this.upcode = upcode;
/*     */   }
/*     */   public String getElementid() {
/* 521 */     return this.elementid;
/*     */   }
/*     */   public void setElementid(String elementid) {
/* 524 */     this.elementid = elementid;
/*     */   }
/*     */   public String getElementname() {
/* 527 */     return this.elementname;
/*     */   }
/*     */   public void setElementname(String elementname) {
/* 530 */     this.elementname = elementname;
/*     */   }
/*     */   public String getIstrue() {
/* 533 */     return this.istrue;
/*     */   }
/*     */   public void setIstrue(String istrue) {
/* 536 */     this.istrue = istrue;
/*     */   }
/*     */   public String getContext() {
/* 539 */     return this.context;
/*     */   }
/*     */   public void setContext(String context) {
/* 542 */     this.context = context;
/*     */   }
/*     */   public String getCheckuser() {
/* 545 */     return this.checkuser;
/*     */   }
/*     */   public void setCheckuser(String checkuser) {
/* 548 */     this.checkuser = checkuser;
/*     */   }
/*     */   public Date getCheckdate() {
/* 551 */     return this.checkdate;
/*     */   }
/*     */   public void setCheckdate(Date checkdate) {
/* 554 */     this.checkdate = checkdate;
/*     */   }
/*     */   public String getCheck_explain() {
/* 557 */     return this.check_explain;
/*     */   }
/*     */   public void setCheck_explain(String checkExplain) {
/* 560 */     this.check_explain = checkExplain;
/*     */   }
/*     */   public String getChecker() {
/* 563 */     return this.checker;
/*     */   }
/*     */   public void setChecker(String checker) {
/* 566 */     this.checker = checker;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 569 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 572 */     this.check_dt = checkDt;
/*     */   }
/*     */   public Date getValid_dt() {
/* 575 */     return this.valid_dt;
/*     */   }
/*     */   public void setValid_dt(Date validDt) {
/* 578 */     this.valid_dt = validDt;
/*     */   }
/*     */   public String getCheck_result() {
/* 581 */     return this.check_result;
/*     */   }
/*     */   public void setCheck_result(String checkResult) {
/* 584 */     this.check_result = checkResult;
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
/*     */   public void setCheck_type(String check_type) {
/* 678 */     this.check_type = check_type;
/*     */   }
/*     */   public String getCheck_type() {
/* 681 */     return this.check_type;
/*     */   }
/*     */   public void setCountry_cd_disp(String country_cd_disp) {
/* 684 */     this.country_cd_disp = country_cd_disp;
/*     */   }
/*     */   public String getCountry_cd_disp() {
/* 687 */     return this.country_cd_disp;
/*     */   }
/*     */   public String getCard_type_disp() {
/* 690 */     return this.card_type_disp;
/*     */   }
/*     */   public void setCard_type_disp(String cardTypeDisp) {
/* 693 */     this.card_type_disp = cardTypeDisp;
/*     */   }
/*     */   public void setOccupation_disp(String occupation_disp) {
/* 696 */     this.occupation_disp = occupation_disp;
/*     */   }
/*     */   public String getOccupation_disp() {
/* 699 */     return this.occupation_disp;
/*     */   }
/*     */   public void setDuty_disp(String duty_disp) {
/* 702 */     this.duty_disp = duty_disp;
/*     */   }
/*     */   public String getDuty_disp() {
/* 705 */     return this.duty_disp;
/*     */   }
/*     */   public void setIndustry_disp(String industry_disp) {
/* 708 */     this.industry_disp = industry_disp;
/*     */   }
/*     */   public String getIndustry_disp() {
/* 711 */     return this.industry_disp;
/*     */   }
/*     */   public void setOrgan_name_disp(String organ_name_disp) {
/* 714 */     this.organ_name_disp = organ_name_disp;
/*     */   }
/*     */   public String getOrgan_name_disp() {
/* 717 */     return this.organ_name_disp;
/*     */   }
/*     */   public void setCard_type_c_disp(String card_type_c_disp) {
/* 720 */     this.card_type_c_disp = card_type_c_disp;
/*     */   }
/*     */   public String getCard_type_c_disp() {
/* 723 */     return this.card_type_c_disp;
/*     */   }
/*     */   public void setAml2_type_cd_disp(String aml2_type_cd_disp) {
/* 726 */     this.aml2_type_cd_disp = aml2_type_cd_disp;
/*     */   }
/*     */   public String getAml2_type_cd_disp() {
/* 729 */     return this.aml2_type_cd_disp;
/*     */   }
/*     */ 
/*     */   public void setEnrol_fund_currency_cd_disp(String enrol_fund_currency_cd_disp) {
/* 733 */     this.enrol_fund_currency_cd_disp = enrol_fund_currency_cd_disp;
/*     */   }
/*     */   public String getEnrol_fund_currency_cd_disp() {
/* 736 */     return this.enrol_fund_currency_cd_disp;
/*     */   }
/*     */   public void setLegal_card_type_disp(String legal_card_type_disp) {
/* 739 */     this.legal_card_type_disp = legal_card_type_disp;
/*     */   }
/*     */   public String getLegal_card_type_disp() {
/* 742 */     return this.legal_card_type_disp;
/*     */   }
/*     */ 
/*     */   public void setStock_holder_card_type_disp(String stock_holder_card_type_disp) {
/* 746 */     this.stock_holder_card_type_disp = stock_holder_card_type_disp;
/*     */   }
/*     */   public String getStock_holder_card_type_disp() {
/* 749 */     return this.stock_holder_card_type_disp;
/*     */   }
/*     */   public void setIstrue_disp(String istrue_disp) {
/* 752 */     this.istrue_disp = istrue_disp;
/*     */   }
/*     */   public String getIstrue_disp() {
/* 755 */     return this.istrue_disp;
/*     */   }
/*     */   public String getAddwmenu_flag_disp() {
/* 758 */     return this.addwmenu_flag_disp;
/*     */   }
/*     */   public void setAddwmenu_flag_disp(String addwmenuFlagDisp) {
/* 761 */     this.addwmenu_flag_disp = addwmenuFlagDisp;
/*     */   }
/*     */   public String getAddbmenu_flag_disp() {
/* 764 */     return this.addbmenu_flag_disp;
/*     */   }
/*     */   public void setAddbmenu_flag_disp(String addbmenuFlagDisp) {
/* 767 */     this.addbmenu_flag_disp = addbmenuFlagDisp;
/*     */   }
/*     */   public String getRule_type_disp() {
/* 770 */     return this.rule_type_disp;
/*     */   }
/*     */   public void setRule_type_disp(String ruleTypeDisp) {
/* 773 */     this.rule_type_disp = ruleTypeDisp;
/*     */   }
/*     */   public String getList_type_disp() {
/* 776 */     return this.list_type_disp;
/*     */   }
/*     */   public void setList_type_disp(String listTypeDisp) {
/* 779 */     this.list_type_disp = listTypeDisp;
/*     */   }
/*     */   public void setB_reason_create(String b_reason_create) {
/* 782 */     this.b_reason_create = b_reason_create;
/*     */   }
/*     */   public String getB_reason_create() {
/* 785 */     return this.b_reason_create;
/*     */   }
/*     */   public void setCard_typeinfo(String card_typeinfo) {
/* 788 */     this.card_typeinfo = card_typeinfo;
/*     */   }
/*     */   public String getCard_typeinfo() {
/* 791 */     return this.card_typeinfo;
/*     */   }
/*     */   public void setOccupationinfo(String occupationinfo) {
/* 794 */     this.occupationinfo = occupationinfo;
/*     */   }
/*     */   public String getOccupationinfo() {
/* 797 */     return this.occupationinfo;
/*     */   }
/*     */   public void setTable_name(String table_name) {
/* 800 */     this.table_name = table_name;
/*     */   }
/*     */   public String getTable_name() {
/* 803 */     return this.table_name;
/*     */   }
/*     */   public void setCheck_result_disp(String check_result_disp) {
/* 806 */     this.check_result_disp = check_result_disp;
/*     */   }
/*     */   public String getCheck_result_disp() {
/* 809 */     return this.check_result_disp;
/*     */   }
/*     */   public void setCard_type_cinfo(String card_type_cinfo) {
/* 812 */     this.card_type_cinfo = card_type_cinfo;
/*     */   }
/*     */   public String getCard_type_cinfo() {
/* 815 */     return this.card_type_cinfo;
/*     */   }
/*     */   public void setAml2_type_cdinfo(String aml2_type_cdinfo) {
/* 818 */     this.aml2_type_cdinfo = aml2_type_cdinfo;
/*     */   }
/*     */   public String getAml2_type_cdinfo() {
/* 821 */     return this.aml2_type_cdinfo;
/*     */   }
/*     */   public void setLegal_card_typeinfo(String legal_card_typeinfo) {
/* 824 */     this.legal_card_typeinfo = legal_card_typeinfo;
/*     */   }
/*     */   public String getLegal_card_typeinfo() {
/* 827 */     return this.legal_card_typeinfo;
/*     */   }
/*     */   public void setStock_holder_card_typeinfo(String stock_holder_card_typeinfo) {
/* 830 */     this.stock_holder_card_typeinfo = stock_holder_card_typeinfo;
/*     */   }
/*     */   public String getStock_holder_card_typeinfo() {
/* 833 */     return this.stock_holder_card_typeinfo;
/*     */   }
/*     */   public String getCheck_reason() {
/* 836 */     return this.check_reason;
/*     */   }
/*     */   public void setCheck_reason(String checkReason) {
/* 839 */     this.check_reason = checkReason;
/*     */   }
/*     */   public void setAml1_type_cd(String aml1_type_cd) {
/* 842 */     this.aml1_type_cd = aml1_type_cd;
/*     */   }
/*     */   public String getAml1_type_cd() {
/* 845 */     return this.aml1_type_cd;
/*     */   }
/*     */   public void setCheck_org(String check_org) {
/* 848 */     this.check_org = check_org;
/*     */   }
/*     */   public String getCheck_org() {
/* 851 */     return this.check_org;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dto.T10_newClientCheck
 * JD-Core Version:    0.6.2
 */