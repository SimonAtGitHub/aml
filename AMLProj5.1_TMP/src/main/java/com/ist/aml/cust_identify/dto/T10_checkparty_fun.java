/*     */ package com.ist.aml.cust_identify.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T10_checkparty_fun
/*     */   implements Serializable
/*     */ {
/*     */   private static final long serialVersionUID = 619740314354233084L;
/*  25 */   private String party_id = "";
/*  26 */   private String party_chn_name = "";
/*     */ 
/*  28 */   private String host_cust_id = "";
/*     */ 
/*  30 */   private String party_class_cd = "";
/*  31 */   private String party_class_cd_disp = "";
/*     */ 
/*  33 */   private String organkey = "";
/*  34 */   private String organname = "";
/*     */ 
/*  36 */   private String card_no = "";
/*  37 */   private String card_type = "";
/*  38 */   private String card_type_disp = "";
/*     */ 
/*  40 */   private String party_status_cd = "";
/*  41 */   private String party_status_cd_disp = "";
/*     */ 
/*  43 */   private String is_updatecard = "";
/*     */ 
/*  47 */   private String partyrisk_no = "";
/*     */ 
/*  50 */   private String risk_type = "";
/*  51 */   private String risk_type_disp = "";
/*     */ 
/*  53 */   private String risk_type_str = "";
/*  54 */   private String risk_no = "";
/*  55 */   private String risk_name = "";
/*     */ 
/*  57 */   private String indickey = "";
/*     */ 
/*  59 */   private Integer indic_order = new Integer(0);
/*     */ 
/*  61 */   private String risk_des = "";
/*     */ 
/*  63 */   private String risk_detail = "";
/*     */ 
/*  65 */   private Date risk_validite_dt = null;
/*  66 */   private String risk_validite_dt_disp = "";
/*  67 */   private Date risk_validite_dt_start = new Date();
/*  68 */   private String risk_validite_dt_start_disp = "";
/*  69 */   private Date risk_validite_dt_end = new Date();
/*  70 */   private String risk_validite_dt_end_disp = "";
/*     */ 
/*  72 */   private Date risk_create_dt = null;
/*  73 */   private String risk_create_dt_disp = "";
/*  74 */   private Date risk_create_dt_start = new Date();
/*  75 */   private String risk_create_dt_start_disp = "";
/*  76 */   private Date risk_create_dt_end = new Date();
/*  77 */   private String risk_create_dt_end_disp = "";
/*     */ 
/*  79 */   private String risk_create_user = "";
/*     */ 
/*  81 */   private String risk_create_org = "";
/*     */ 
/*  83 */   private String is_relaleder = "";
/*     */ 
/*  87 */   private String check_no = "";
/*     */ 
/*  89 */   private String check_type = "";
/*  90 */   private String check_type_disp = "";
/*     */ 
/*  92 */   private String recheck_type = "";
/*  93 */   private String recheck_type_disp = "";
/*     */ 
/*  98 */   private String aml1_type_cd = "";
/*  99 */   private String aml1_type_disp = "";
/*     */ 
/* 101 */   private String check_method = "";
/* 102 */   private String check_method_disp = "";
/*     */ 
/* 104 */   private String credit_flag = "";
/* 105 */   private String credit_flag_disp = "";
/*     */ 
/* 107 */   private String lian_flag = "";
/* 108 */   private String lian_flag_disp = "";
/*     */ 
/* 110 */   private Integer leader_num = new Integer(0);
/* 111 */   private String leader_numStr = "";
/*     */ 
/* 113 */   private String agent_flag = "";
/* 114 */   private String agent_flag_disp = "";
/*     */ 
/* 116 */   private String list_type = "";
/*     */ 
/* 118 */   private String addw_flag = "";
/*     */ 
/* 120 */   private String w_reason = "";
/*     */ 
/* 122 */   private String w_rule_type = "";
/*     */ 
/* 124 */   private String addb_flag = "";
/*     */ 
/* 126 */   private String m_list_type = "";
/*     */ 
/* 128 */   private String b_reason = "";
/*     */ 
/* 130 */   private String auditlevel_flag = "";
/*     */ 
/* 132 */   private String auditlevel = "";
/* 133 */   private String modify_cd = "";
/*     */ 
/* 135 */   private String check_result = "";
/* 136 */   private String check_result_disp = "";
/*     */ 
/* 138 */   private String check_explain = "";
/*     */ 
/* 140 */   private Date check_dt = new Date();
/* 141 */   private String check_dt_disp = "";
/* 142 */   private Date check_dt_start = new Date();
/* 143 */   private String check_dt_start_disp = "";
/* 144 */   private Date check_dt_end = new Date();
/* 145 */   private String check_dt_end_disp = "";
/*     */ 
/* 147 */   private Date valid_dt = new Date();
/* 148 */   private String valid_dt_disp = "";
/* 149 */   private Date valid_dt_start = new Date();
/* 150 */   private String valid_dt_start_disp = "";
/* 151 */   private Date valid_dt_end = new Date();
/* 152 */   private String valid_dt_end_disp = "";
/*     */ 
/* 154 */   private String checker = "";
/*     */ 
/* 156 */   private String post_id = "";
/*     */ 
/* 158 */   private String checker_org = "";
/* 159 */   private String checker_org_name = "";
/*     */ 
/* 162 */   private String changeflag = "";
/*     */ 
/* 164 */   private String check_reason_no = "";
/*     */ 
/* 166 */   private String elementkey = "";
/* 167 */   private String elementname = "";
/* 168 */   private String element_score = "";
/* 169 */   private Double element_score_d = null;
/* 170 */   private String table_status = "";
/*     */ 
/* 173 */   private String organStr = "";
/*     */ 
/*     */   public String getParty_id()
/*     */   {
/* 183 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String partyId) {
/* 187 */     this.party_id = partyId;
/*     */   }
/*     */ 
/*     */   public String getParty_chn_name() {
/* 191 */     return this.party_chn_name;
/*     */   }
/*     */ 
/*     */   public void setParty_chn_name(String partyChnName) {
/* 195 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */ 
/*     */   public String getHost_cust_id() {
/* 199 */     return this.host_cust_id;
/*     */   }
/*     */ 
/*     */   public void setHost_cust_id(String hostCustId) {
/* 203 */     this.host_cust_id = hostCustId;
/*     */   }
/*     */ 
/*     */   public String getParty_class_cd() {
/* 207 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 211 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */ 
/*     */   public String getParty_class_cd_disp() {
/* 215 */     return this.party_class_cd_disp;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 219 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */ 
/*     */   public String getPartyrisk_no() {
/* 223 */     return this.partyrisk_no;
/*     */   }
/*     */ 
/*     */   public void setPartyrisk_no(String partyriskNo) {
/* 227 */     this.partyrisk_no = partyriskNo;
/*     */   }
/*     */ 
/*     */   public String getRisk_type() {
/* 231 */     return this.risk_type;
/*     */   }
/*     */ 
/*     */   public void setRisk_type(String riskType) {
/* 235 */     this.risk_type = riskType;
/*     */   }
/*     */ 
/*     */   public String getRisk_type_disp() {
/* 239 */     return this.risk_type_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_type_disp(String riskTypeDisp) {
/* 243 */     this.risk_type_disp = riskTypeDisp;
/*     */   }
/*     */ 
/*     */   public String getRisk_des() {
/* 247 */     return this.risk_des;
/*     */   }
/*     */ 
/*     */   public void setRisk_des(String riskDes) {
/* 251 */     this.risk_des = riskDes;
/*     */   }
/*     */ 
/*     */   public String getRisk_detail() {
/* 255 */     return this.risk_detail;
/*     */   }
/*     */ 
/*     */   public void setRisk_detail(String riskDetail) {
/* 259 */     this.risk_detail = riskDetail;
/*     */   }
/*     */ 
/*     */   public Date getRisk_validite_dt() {
/* 263 */     return this.risk_validite_dt;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt(Date riskValiditeDt) {
/* 267 */     this.risk_validite_dt = riskValiditeDt;
/*     */   }
/*     */ 
/*     */   public String getRisk_validite_dt_disp() {
/* 271 */     return this.risk_validite_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt_disp(String riskValiditeDtDisp) {
/* 275 */     this.risk_validite_dt_disp = riskValiditeDtDisp;
/*     */   }
/*     */ 
/*     */   public Date getRisk_validite_dt_start() {
/* 279 */     return this.risk_validite_dt_start;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt_start(Date riskValiditeDtStart) {
/* 283 */     this.risk_validite_dt_start = riskValiditeDtStart;
/*     */   }
/*     */ 
/*     */   public String getRisk_validite_dt_start_disp() {
/* 287 */     return this.risk_validite_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt_start_disp(String riskValiditeDtStartDisp) {
/* 291 */     this.risk_validite_dt_start_disp = riskValiditeDtStartDisp;
/*     */   }
/*     */ 
/*     */   public Date getRisk_validite_dt_end() {
/* 295 */     return this.risk_validite_dt_end;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt_end(Date riskValiditeDtEnd) {
/* 299 */     this.risk_validite_dt_end = riskValiditeDtEnd;
/*     */   }
/*     */ 
/*     */   public String getRisk_validite_dt_end_disp() {
/* 303 */     return this.risk_validite_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_validite_dt_end_disp(String riskValiditeDtEndDisp) {
/* 307 */     this.risk_validite_dt_end_disp = riskValiditeDtEndDisp;
/*     */   }
/*     */ 
/*     */   public Date getRisk_create_dt() {
/* 311 */     return this.risk_create_dt;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt(Date riskCreateDt) {
/* 315 */     this.risk_create_dt = riskCreateDt;
/*     */   }
/*     */ 
/*     */   public String getRisk_create_dt_disp() {
/* 319 */     return this.risk_create_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt_disp(String riskCreateDtDisp) {
/* 323 */     this.risk_create_dt_disp = riskCreateDtDisp;
/*     */   }
/*     */ 
/*     */   public Date getRisk_create_dt_start() {
/* 327 */     return this.risk_create_dt_start;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt_start(Date riskCreateDtStart) {
/* 331 */     this.risk_create_dt_start = riskCreateDtStart;
/*     */   }
/*     */ 
/*     */   public String getRisk_create_dt_start_disp() {
/* 335 */     return this.risk_create_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt_start_disp(String riskCreateDtStartDisp) {
/* 339 */     this.risk_create_dt_start_disp = riskCreateDtStartDisp;
/*     */   }
/*     */ 
/*     */   public Date getRisk_create_dt_end() {
/* 343 */     return this.risk_create_dt_end;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt_end(Date riskCreateDtEnd) {
/* 347 */     this.risk_create_dt_end = riskCreateDtEnd;
/*     */   }
/*     */ 
/*     */   public String getRisk_create_dt_end_disp() {
/* 351 */     return this.risk_create_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_dt_end_disp(String riskCreateDtEndDisp) {
/* 355 */     this.risk_create_dt_end_disp = riskCreateDtEndDisp;
/*     */   }
/*     */ 
/*     */   public String getRisk_create_user() {
/* 359 */     return this.risk_create_user;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_user(String riskCreateUser) {
/* 363 */     this.risk_create_user = riskCreateUser;
/*     */   }
/*     */ 
/*     */   public String getCheck_no() {
/* 367 */     return this.check_no;
/*     */   }
/*     */ 
/*     */   public void setCheck_no(String checkNo) {
/* 371 */     this.check_no = checkNo;
/*     */   }
/*     */ 
/*     */   public String getCheck_type() {
/* 375 */     return this.check_type;
/*     */   }
/*     */ 
/*     */   public void setCheck_type(String checkType) {
/* 379 */     this.check_type = checkType;
/*     */   }
/*     */ 
/*     */   public String getCheck_type_disp() {
/* 383 */     return this.check_type_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_type_disp(String checkTypeDisp) {
/* 387 */     this.check_type_disp = checkTypeDisp;
/*     */   }
/*     */ 
/*     */   public String getRecheck_type() {
/* 391 */     return this.recheck_type;
/*     */   }
/*     */ 
/*     */   public void setRecheck_type(String recheckType) {
/* 395 */     this.recheck_type = recheckType;
/*     */   }
/*     */ 
/*     */   public String getRecheck_type_disp() {
/* 399 */     return this.recheck_type_disp;
/*     */   }
/*     */ 
/*     */   public void setRecheck_type_disp(String recheckTypeDisp) {
/* 403 */     this.recheck_type_disp = recheckTypeDisp;
/*     */   }
/*     */ 
/*     */   public String getAml1_type_cd() {
/* 407 */     return this.aml1_type_cd;
/*     */   }
/*     */ 
/*     */   public void setAml1_type_cd(String aml1TypeCd) {
/* 411 */     this.aml1_type_cd = aml1TypeCd;
/*     */   }
/*     */ 
/*     */   public String getAml1_type_disp() {
/* 415 */     return this.aml1_type_disp;
/*     */   }
/*     */ 
/*     */   public void setAml1_type_disp(String aml1TypeDisp) {
/* 419 */     this.aml1_type_disp = aml1TypeDisp;
/*     */   }
/*     */ 
/*     */   public String getCheck_method() {
/* 423 */     return this.check_method;
/*     */   }
/*     */ 
/*     */   public void setCheck_method(String checkMethod) {
/* 427 */     this.check_method = checkMethod;
/*     */   }
/*     */ 
/*     */   public String getCredit_flag() {
/* 431 */     return this.credit_flag;
/*     */   }
/*     */ 
/*     */   public void setCredit_flag(String creditFlag) {
/* 435 */     this.credit_flag = creditFlag;
/*     */   }
/*     */ 
/*     */   public String getCredit_flag_disp() {
/* 439 */     return this.credit_flag_disp;
/*     */   }
/*     */ 
/*     */   public void setCredit_flag_disp(String creditFlagDisp) {
/* 443 */     this.credit_flag_disp = creditFlagDisp;
/*     */   }
/*     */ 
/*     */   public String getLian_flag() {
/* 447 */     return this.lian_flag;
/*     */   }
/*     */ 
/*     */   public void setLian_flag(String lianFlag) {
/* 451 */     this.lian_flag = lianFlag;
/*     */   }
/*     */ 
/*     */   public String getLian_flag_disp() {
/* 455 */     return this.lian_flag_disp;
/*     */   }
/*     */ 
/*     */   public void setLian_flag_disp(String lianFlagDisp) {
/* 459 */     this.lian_flag_disp = lianFlagDisp;
/*     */   }
/*     */ 
/*     */   public Integer getLeader_num() {
/* 463 */     return this.leader_num;
/*     */   }
/*     */ 
/*     */   public void setLeader_num(Integer leaderNum) {
/* 467 */     this.leader_num = leaderNum;
/*     */   }
/*     */ 
/*     */   public String getAgent_flag() {
/* 471 */     return this.agent_flag;
/*     */   }
/*     */ 
/*     */   public void setAgent_flag(String agentFlag) {
/* 475 */     this.agent_flag = agentFlag;
/*     */   }
/*     */ 
/*     */   public String getAgent_flag_disp() {
/* 479 */     return this.agent_flag_disp;
/*     */   }
/*     */ 
/*     */   public void setAgent_flag_disp(String agentFlagDisp) {
/* 483 */     this.agent_flag_disp = agentFlagDisp;
/*     */   }
/*     */ 
/*     */   public String getAddw_flag() {
/* 487 */     return this.addw_flag;
/*     */   }
/*     */ 
/*     */   public void setAddw_flag(String addwFlag) {
/* 491 */     this.addw_flag = addwFlag;
/*     */   }
/*     */ 
/*     */   public String getAddb_flag() {
/* 495 */     return this.addb_flag;
/*     */   }
/*     */ 
/*     */   public void setAddb_flag(String addbFlag) {
/* 499 */     this.addb_flag = addbFlag;
/*     */   }
/*     */ 
/*     */   public String getAuditlevel_flag() {
/* 503 */     return this.auditlevel_flag;
/*     */   }
/*     */ 
/*     */   public void setAuditlevel_flag(String auditlevelFlag) {
/* 507 */     this.auditlevel_flag = auditlevelFlag;
/*     */   }
/*     */ 
/*     */   public String getAuditlevel() {
/* 511 */     return this.auditlevel;
/*     */   }
/*     */ 
/*     */   public void setAuditlevel(String auditlevel) {
/* 515 */     this.auditlevel = auditlevel;
/*     */   }
/*     */ 
/*     */   public String getCheck_result() {
/* 519 */     return this.check_result;
/*     */   }
/*     */ 
/*     */   public void setCheck_result(String checkResult) {
/* 523 */     this.check_result = checkResult;
/*     */   }
/*     */ 
/*     */   public String getCheck_explain() {
/* 527 */     return this.check_explain;
/*     */   }
/*     */ 
/*     */   public void setCheck_explain(String checkExplain) {
/* 531 */     this.check_explain = checkExplain;
/*     */   }
/*     */ 
/*     */   public Date getCheck_dt() {
/* 535 */     return this.check_dt;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt(Date checkDt) {
/* 539 */     this.check_dt = checkDt;
/*     */   }
/*     */ 
/*     */   public String getCheck_dt_disp() {
/* 543 */     return this.check_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt_disp(String checkDtDisp) {
/* 547 */     this.check_dt_disp = checkDtDisp;
/*     */   }
/*     */ 
/*     */   public Date getCheck_dt_start() {
/* 551 */     return this.check_dt_start;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt_start(Date checkDtStart) {
/* 555 */     this.check_dt_start = checkDtStart;
/*     */   }
/*     */ 
/*     */   public String getCheck_dt_start_disp() {
/* 559 */     return this.check_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt_start_disp(String checkDtStartDisp) {
/* 563 */     this.check_dt_start_disp = checkDtStartDisp;
/*     */   }
/*     */ 
/*     */   public Date getCheck_dt_end() {
/* 567 */     return this.check_dt_end;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt_end(Date checkDtEnd) {
/* 571 */     this.check_dt_end = checkDtEnd;
/*     */   }
/*     */ 
/*     */   public String getCheck_dt_end_disp() {
/* 575 */     return this.check_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_dt_end_disp(String checkDtEndDisp) {
/* 579 */     this.check_dt_end_disp = checkDtEndDisp;
/*     */   }
/*     */ 
/*     */   public Date getValid_dt() {
/* 583 */     return this.valid_dt;
/*     */   }
/*     */ 
/*     */   public void setValid_dt(Date validDt) {
/* 587 */     this.valid_dt = validDt;
/*     */   }
/*     */ 
/*     */   public String getValid_dt_disp() {
/* 591 */     return this.valid_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setValid_dt_disp(String validDtDisp) {
/* 595 */     this.valid_dt_disp = validDtDisp;
/*     */   }
/*     */ 
/*     */   public Date getValid_dt_start() {
/* 599 */     return this.valid_dt_start;
/*     */   }
/*     */ 
/*     */   public void setValid_dt_start(Date validDtStart) {
/* 603 */     this.valid_dt_start = validDtStart;
/*     */   }
/*     */ 
/*     */   public String getValid_dt_start_disp() {
/* 607 */     return this.valid_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setValid_dt_start_disp(String validDtStartDisp) {
/* 611 */     this.valid_dt_start_disp = validDtStartDisp;
/*     */   }
/*     */ 
/*     */   public Date getValid_dt_end() {
/* 615 */     return this.valid_dt_end;
/*     */   }
/*     */ 
/*     */   public void setValid_dt_end(Date validDtEnd) {
/* 619 */     this.valid_dt_end = validDtEnd;
/*     */   }
/*     */ 
/*     */   public String getValid_dt_end_disp() {
/* 623 */     return this.valid_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setValid_dt_end_disp(String validDtEndDisp) {
/* 627 */     this.valid_dt_end_disp = validDtEndDisp;
/*     */   }
/*     */ 
/*     */   public String getChecker() {
/* 631 */     return this.checker;
/*     */   }
/*     */ 
/*     */   public void setChecker(String checker) {
/* 635 */     this.checker = checker;
/*     */   }
/*     */ 
/*     */   public String getChecker_org() {
/* 639 */     return this.checker_org;
/*     */   }
/*     */ 
/*     */   public void setChecker_org(String checkerOrg) {
/* 643 */     this.checker_org = checkerOrg;
/*     */   }
/*     */ 
/*     */   public String getChecker_org_name() {
/* 647 */     return this.checker_org_name;
/*     */   }
/*     */ 
/*     */   public void setChecker_org_name(String checkerOrgName) {
/* 651 */     this.checker_org_name = checkerOrgName;
/*     */   }
/*     */ 
/*     */   public String getOrganStr() {
/* 655 */     return this.organStr;
/*     */   }
/*     */ 
/*     */   public void setOrganStr(String organStr) {
/* 659 */     this.organStr = organStr;
/*     */   }
/*     */ 
/*     */   public String getIs_relaleder() {
/* 663 */     return this.is_relaleder;
/*     */   }
/*     */ 
/*     */   public void setIs_relaleder(String isRelaleder) {
/* 667 */     this.is_relaleder = isRelaleder;
/*     */   }
/*     */ 
/*     */   public String getRisk_type_str() {
/* 671 */     return this.risk_type_str;
/*     */   }
/*     */ 
/*     */   public void setRisk_type_str(String riskTypeStr) {
/* 675 */     this.risk_type_str = riskTypeStr;
/*     */   }
/*     */ 
/*     */   public String getRisk_no() {
/* 679 */     return this.risk_no;
/*     */   }
/*     */ 
/*     */   public void setRisk_no(String riskNo) {
/* 683 */     this.risk_no = riskNo;
/*     */   }
/*     */ 
/*     */   public String getRisk_name() {
/* 687 */     return this.risk_name;
/*     */   }
/*     */ 
/*     */   public void setRisk_name(String riskName) {
/* 691 */     this.risk_name = riskName;
/*     */   }
/*     */ 
/*     */   public String getIndickey() {
/* 695 */     return this.indickey;
/*     */   }
/*     */ 
/*     */   public void setIndickey(String indickey) {
/* 699 */     this.indickey = indickey;
/*     */   }
/*     */ 
/*     */   public Integer getIndic_order()
/*     */   {
/* 705 */     return this.indic_order;
/*     */   }
/*     */ 
/*     */   public void setIndic_order(Integer indicOrder) {
/* 709 */     this.indic_order = indicOrder;
/*     */   }
/*     */ 
/*     */   public String getCheck_method_disp() {
/* 713 */     return this.check_method_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_method_disp(String checkMethodDisp) {
/* 717 */     this.check_method_disp = checkMethodDisp;
/*     */   }
/*     */ 
/*     */   public String getW_reason() {
/* 721 */     return this.w_reason;
/*     */   }
/*     */ 
/*     */   public void setW_reason(String wReason) {
/* 725 */     this.w_reason = wReason;
/*     */   }
/*     */ 
/*     */   public String getW_rule_type() {
/* 729 */     return this.w_rule_type;
/*     */   }
/*     */ 
/*     */   public void setW_rule_type(String wRuleType) {
/* 733 */     this.w_rule_type = wRuleType;
/*     */   }
/*     */ 
/*     */   public String getB_reason() {
/* 737 */     return this.b_reason;
/*     */   }
/*     */ 
/*     */   public void setB_reason(String bReason) {
/* 741 */     this.b_reason = bReason;
/*     */   }
/*     */ 
/*     */   public String getCheck_result_disp() {
/* 745 */     return this.check_result_disp;
/*     */   }
/*     */ 
/*     */   public void setCheck_result_disp(String checkResultDisp) {
/* 749 */     this.check_result_disp = checkResultDisp;
/*     */   }
/*     */ 
/*     */   public String getLeader_numStr() {
/* 753 */     return this.leader_numStr;
/*     */   }
/*     */ 
/*     */   public void setLeader_numStr(String leaderNumStr) {
/* 757 */     this.leader_numStr = leaderNumStr;
/*     */   }
/*     */ 
/*     */   public String getChangeflag() {
/* 761 */     return this.changeflag;
/*     */   }
/*     */ 
/*     */   public void setChangeflag(String changeflag) {
/* 765 */     this.changeflag = changeflag;
/*     */   }
/*     */ 
/*     */   public String getOrgankey() {
/* 769 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkey) {
/* 773 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public String getOrganname() {
/* 777 */     return this.organname;
/*     */   }
/*     */ 
/*     */   public void setOrganname(String organname) {
/* 781 */     this.organname = organname;
/*     */   }
/*     */ 
/*     */   public String getCard_no() {
/* 785 */     return this.card_no;
/*     */   }
/*     */ 
/*     */   public void setCard_no(String cardNo) {
/* 789 */     this.card_no = cardNo;
/*     */   }
/*     */ 
/*     */   public String getCard_type() {
/* 793 */     return this.card_type;
/*     */   }
/*     */ 
/*     */   public void setCard_type(String cardType) {
/* 797 */     this.card_type = cardType;
/*     */   }
/*     */ 
/*     */   public String getCard_type_disp() {
/* 801 */     return this.card_type_disp;
/*     */   }
/*     */ 
/*     */   public void setCard_type_disp(String cardTypeDisp) {
/* 805 */     this.card_type_disp = cardTypeDisp;
/*     */   }
/*     */ 
/*     */   public String getParty_status_cd() {
/* 809 */     return this.party_status_cd;
/*     */   }
/*     */ 
/*     */   public void setParty_status_cd(String partyStatusCd) {
/* 813 */     this.party_status_cd = partyStatusCd;
/*     */   }
/*     */ 
/*     */   public String getParty_status_cd_disp() {
/* 817 */     return this.party_status_cd_disp;
/*     */   }
/*     */ 
/*     */   public void setParty_status_cd_disp(String partyStatusCdDisp) {
/* 821 */     this.party_status_cd_disp = partyStatusCdDisp;
/*     */   }
/*     */ 
/*     */   public String getIs_updatecard() {
/* 825 */     return this.is_updatecard;
/*     */   }
/*     */ 
/*     */   public void setIs_updatecard(String isUpdatecard) {
/* 829 */     this.is_updatecard = isUpdatecard;
/*     */   }
/*     */ 
/*     */   public String getCheck_reason_no() {
/* 833 */     return this.check_reason_no;
/*     */   }
/*     */ 
/*     */   public void setCheck_reason_no(String checkReasonNo) {
/* 837 */     this.check_reason_no = checkReasonNo;
/*     */   }
/*     */ 
/*     */   public String getRisk_create_org() {
/* 841 */     return this.risk_create_org;
/*     */   }
/*     */ 
/*     */   public void setRisk_create_org(String riskCreateOrg) {
/* 845 */     this.risk_create_org = riskCreateOrg;
/*     */   }
/*     */ 
/*     */   public String getList_type() {
/* 849 */     return this.list_type;
/*     */   }
/*     */ 
/*     */   public void setList_type(String listType) {
/* 853 */     this.list_type = listType;
/*     */   }
/*     */ 
/*     */   public String getPost_id() {
/* 857 */     return this.post_id;
/*     */   }
/*     */ 
/*     */   public void setPost_id(String postId) {
/* 861 */     this.post_id = postId;
/*     */   }
/*     */ 
/*     */   public String getModify_cd() {
/* 865 */     return this.modify_cd;
/*     */   }
/*     */ 
/*     */   public void setModify_cd(String modifyCd) {
/* 869 */     this.modify_cd = modifyCd;
/*     */   }
/*     */ 
/*     */   public String getM_list_type() {
/* 873 */     return this.m_list_type;
/*     */   }
/*     */ 
/*     */   public void setM_list_type(String mListType) {
/* 877 */     this.m_list_type = mListType;
/*     */   }
/*     */ 
/*     */   public String getElementkey() {
/* 881 */     return this.elementkey;
/*     */   }
/*     */ 
/*     */   public void setElementkey(String elementkey) {
/* 885 */     this.elementkey = elementkey;
/*     */   }
/*     */ 
/*     */   public String getElement_score() {
/* 889 */     return this.element_score;
/*     */   }
/*     */ 
/*     */   public void setElement_score(String elementScore) {
/* 893 */     this.element_score = elementScore;
/*     */   }
/*     */ 
/*     */   public Double getElement_score_d()
/*     */   {
/* 899 */     return this.element_score_d;
/*     */   }
/*     */ 
/*     */   public void setElement_score_d(Double elementScoreD) {
/* 903 */     this.element_score_d = elementScoreD;
/*     */   }
/*     */ 
/*     */   public String getTable_status() {
/* 907 */     return this.table_status;
/*     */   }
/*     */ 
/*     */   public void setTable_status(String tableStatus) {
/* 911 */     this.table_status = tableStatus;
/*     */   }
/*     */ 
/*     */   public String getElementname() {
/* 915 */     return this.elementname;
/*     */   }
/*     */ 
/*     */   public void setElementname(String elementname) {
/* 919 */     this.elementname = elementname;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dto.T10_checkparty_fun
 * JD-Core Version:    0.6.2
 */