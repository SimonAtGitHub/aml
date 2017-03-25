/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ 
/*     */ public class T10_checkparty_funActionForm extends ActionForm
/*     */ {
/*  18 */   private String party_id = "";
/*  19 */   private String party_chn_name = "";
/*     */ 
/*  21 */   private String host_cust_id = "";
/*     */ 
/*  23 */   private String party_class_cd = "";
/*  24 */   private String party_class_cd_disp = "";
/*     */ 
/*  34 */   private String partyrisk_no = "";
/*     */ 
/*  37 */   private String risk_type = "";
/*  38 */   private String risk_type_disp = "";
/*     */ 
/*  41 */   private String risk_type_str = "";
/*  42 */   private String risk_no = "";
/*  43 */   private String risk_name = "";
/*     */ 
/*  45 */   private String indickey = "";
/*     */ 
/*  47 */   private String indic_order = "";
/*  48 */   private String[] selectedrisk_No = new String[0];
/*     */ 
/*  50 */   private String risk_des = "";
/*     */ 
/*  52 */   private String risk_detail = "";
/*     */ 
/*  54 */   private Date risk_validite_dt = new Date();
/*  55 */   private String risk_validite_dt_disp = "";
/*  56 */   private Date risk_validite_dt_start = new Date();
/*  57 */   private String risk_validite_dt_start_disp = "";
/*  58 */   private Date risk_validite_dt_end = new Date();
/*  59 */   private String risk_validite_dt_end_disp = "";
/*     */ 
/*  61 */   private Date risk_create_dt = new Date();
/*  62 */   private String risk_create_dt_disp = "";
/*  63 */   private Date risk_create_dt_start = new Date();
/*  64 */   private String risk_create_dt_start_disp = "";
/*  65 */   private Date risk_create_dt_end = new Date();
/*  66 */   private String risk_create_dt_end_disp = "";
/*     */ 
/*  68 */   private String risk_create_user = "";
/*     */ 
/*  70 */   private String is_relaleder = "";
/*     */ 
/*  74 */   private String check_no = "";
/*     */ 
/*  76 */   private String check_type = "";
/*  77 */   private String check_type_disp = "";
/*     */ 
/*  79 */   private String recheck_type = "";
/*  80 */   private String recheck_type_disp = "";
/*     */ 
/*  85 */   private String aml1_type_cd = "";
/*  86 */   private String aml1_type_disp = "";
/*     */ 
/*  88 */   private String check_method = "";
/*  89 */   private String check_method_disp = "";
/*     */ 
/*  91 */   private String credit_flag = "";
/*  92 */   private String credit_flag_disp = "";
/*     */ 
/*  94 */   private String lian_flag = "";
/*  95 */   private String lian_flag_disp = "";
/*     */ 
/*  97 */   private Integer leader_num = new Integer(0);
/*  98 */   private String leader_numStr = "";
/*     */ 
/* 100 */   private String agent_flag = "";
/* 101 */   private String agent_flag_disp = "";
/*     */ 
/* 103 */   private String list_type = "";
/*     */ 
/* 105 */   private String addw_flag = "";
/*     */ 
/* 107 */   private String w_reason = "";
/*     */ 
/* 109 */   private String w_rule_type = "";
/*     */ 
/* 111 */   private String addb_flag = "";
/*     */ 
/* 113 */   private String m_list_type = "";
/*     */ 
/* 115 */   private String b_reason = "";
/*     */ 
/* 117 */   private String auditlevel_flag = "";
/*     */ 
/* 119 */   private String auditlevel = "";
/*     */ 
/* 121 */   private String check_result = "";
/*     */ 
/* 123 */   private String check_explain = "";
/*     */ 
/* 125 */   private Date check_dt = new Date();
/* 126 */   private String check_dt_disp = "";
/* 127 */   private Date check_dt_start = new Date();
/* 128 */   private String check_dt_start_disp = "";
/* 129 */   private Date check_dt_end = new Date();
/* 130 */   private String check_dt_end_disp = "";
/*     */ 
/* 132 */   private Date valid_dt = new Date();
/* 133 */   private String valid_dt_disp = "";
/* 134 */   private Date valid_dt_start = new Date();
/* 135 */   private String valid_dt_start_disp = "";
/* 136 */   private Date valid_dt_end = new Date();
/* 137 */   private String valid_dt_end_disp = "";
/*     */ 
/* 139 */   private String checker = "";
/*     */ 
/* 141 */   private String checker_org = "";
/* 142 */   private String checker_org_name = "";
/*     */ 
/* 144 */   private String changeflag = "";
/*     */ 
/* 146 */   private String[] selectedPartyrisk_No = new String[0];
/* 147 */   private String elementkey = "";
/* 148 */   private String elementname = "";
/* 149 */   private String element_score = "";
/*     */ 
/*     */   public String getParty_id()
/*     */   {
/* 155 */     return this.party_id;
/*     */   }
/*     */   public void setParty_id(String partyId) {
/* 158 */     this.party_id = partyId;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 161 */     return this.party_chn_name;
/*     */   }
/*     */   public void setParty_chn_name(String partyChnName) {
/* 164 */     this.party_chn_name = partyChnName;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 167 */     return this.host_cust_id;
/*     */   }
/*     */   public void setHost_cust_id(String hostCustId) {
/* 170 */     this.host_cust_id = hostCustId;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 173 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 176 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 179 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 182 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */   public String getPartyrisk_no() {
/* 185 */     return this.partyrisk_no;
/*     */   }
/*     */   public void setPartyrisk_no(String partyriskNo) {
/* 188 */     this.partyrisk_no = partyriskNo;
/*     */   }
/*     */   public String getRisk_type() {
/* 191 */     return this.risk_type;
/*     */   }
/*     */   public void setRisk_type(String riskType) {
/* 194 */     this.risk_type = riskType;
/*     */   }
/*     */   public String getRisk_type_disp() {
/* 197 */     return this.risk_type_disp;
/*     */   }
/*     */   public void setRisk_type_disp(String riskTypeDisp) {
/* 200 */     this.risk_type_disp = riskTypeDisp;
/*     */   }
/*     */   public String getRisk_des() {
/* 203 */     return this.risk_des;
/*     */   }
/*     */   public void setRisk_des(String riskDes) {
/* 206 */     this.risk_des = riskDes;
/*     */   }
/*     */   public String getRisk_detail() {
/* 209 */     return this.risk_detail;
/*     */   }
/*     */   public void setRisk_detail(String riskDetail) {
/* 212 */     this.risk_detail = riskDetail;
/*     */   }
/*     */   public Date getRisk_validite_dt() {
/* 215 */     return this.risk_validite_dt;
/*     */   }
/*     */   public void setRisk_validite_dt(Date riskValiditeDt) {
/* 218 */     this.risk_validite_dt = riskValiditeDt;
/*     */   }
/*     */   public String getRisk_validite_dt_disp() {
/* 221 */     return this.risk_validite_dt_disp;
/*     */   }
/*     */   public void setRisk_validite_dt_disp(String riskValiditeDtDisp) {
/* 224 */     this.risk_validite_dt_disp = riskValiditeDtDisp;
/*     */   }
/*     */   public Date getRisk_validite_dt_start() {
/* 227 */     return this.risk_validite_dt_start;
/*     */   }
/*     */   public void setRisk_validite_dt_start(Date riskValiditeDtStart) {
/* 230 */     this.risk_validite_dt_start = riskValiditeDtStart;
/*     */   }
/*     */   public String getRisk_validite_dt_start_disp() {
/* 233 */     return this.risk_validite_dt_start_disp;
/*     */   }
/*     */   public void setRisk_validite_dt_start_disp(String riskValiditeDtStartDisp) {
/* 236 */     this.risk_validite_dt_start_disp = riskValiditeDtStartDisp;
/*     */   }
/*     */   public Date getRisk_validite_dt_end() {
/* 239 */     return this.risk_validite_dt_end;
/*     */   }
/*     */   public void setRisk_validite_dt_end(Date riskValiditeDtEnd) {
/* 242 */     this.risk_validite_dt_end = riskValiditeDtEnd;
/*     */   }
/*     */   public String getRisk_validite_dt_end_disp() {
/* 245 */     return this.risk_validite_dt_end_disp;
/*     */   }
/*     */   public void setRisk_validite_dt_end_disp(String riskValiditeDtEndDisp) {
/* 248 */     this.risk_validite_dt_end_disp = riskValiditeDtEndDisp;
/*     */   }
/*     */   public Date getRisk_create_dt() {
/* 251 */     return this.risk_create_dt;
/*     */   }
/*     */   public void setRisk_create_dt(Date riskCreateDt) {
/* 254 */     this.risk_create_dt = riskCreateDt;
/*     */   }
/*     */   public String getRisk_create_dt_disp() {
/* 257 */     return this.risk_create_dt_disp;
/*     */   }
/*     */   public void setRisk_create_dt_disp(String riskCreateDtDisp) {
/* 260 */     this.risk_create_dt_disp = riskCreateDtDisp;
/*     */   }
/*     */   public Date getRisk_create_dt_start() {
/* 263 */     return this.risk_create_dt_start;
/*     */   }
/*     */   public void setRisk_create_dt_start(Date riskCreateDtStart) {
/* 266 */     this.risk_create_dt_start = riskCreateDtStart;
/*     */   }
/*     */   public String getRisk_create_dt_start_disp() {
/* 269 */     return this.risk_create_dt_start_disp;
/*     */   }
/*     */   public void setRisk_create_dt_start_disp(String riskCreateDtStartDisp) {
/* 272 */     this.risk_create_dt_start_disp = riskCreateDtStartDisp;
/*     */   }
/*     */   public Date getRisk_create_dt_end() {
/* 275 */     return this.risk_create_dt_end;
/*     */   }
/*     */   public void setRisk_create_dt_end(Date riskCreateDtEnd) {
/* 278 */     this.risk_create_dt_end = riskCreateDtEnd;
/*     */   }
/*     */   public String getRisk_create_dt_end_disp() {
/* 281 */     return this.risk_create_dt_end_disp;
/*     */   }
/*     */   public void setRisk_create_dt_end_disp(String riskCreateDtEndDisp) {
/* 284 */     this.risk_create_dt_end_disp = riskCreateDtEndDisp;
/*     */   }
/*     */   public String getRisk_create_user() {
/* 287 */     return this.risk_create_user;
/*     */   }
/*     */   public void setRisk_create_user(String riskCreateUser) {
/* 290 */     this.risk_create_user = riskCreateUser;
/*     */   }
/*     */   public String getCheck_no() {
/* 293 */     return this.check_no;
/*     */   }
/*     */   public void setCheck_no(String checkNo) {
/* 296 */     this.check_no = checkNo;
/*     */   }
/*     */   public String getCheck_type() {
/* 299 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 302 */     this.check_type = checkType;
/*     */   }
/*     */   public String getCheck_type_disp() {
/* 305 */     return this.check_type_disp;
/*     */   }
/*     */   public void setCheck_type_disp(String checkTypeDisp) {
/* 308 */     this.check_type_disp = checkTypeDisp;
/*     */   }
/*     */   public String getRecheck_type() {
/* 311 */     return this.recheck_type;
/*     */   }
/*     */   public void setRecheck_type(String recheckType) {
/* 314 */     this.recheck_type = recheckType;
/*     */   }
/*     */   public String getRecheck_type_disp() {
/* 317 */     return this.recheck_type_disp;
/*     */   }
/*     */   public void setRecheck_type_disp(String recheckTypeDisp) {
/* 320 */     this.recheck_type_disp = recheckTypeDisp;
/*     */   }
/*     */   public String getAml1_type_cd() {
/* 323 */     return this.aml1_type_cd;
/*     */   }
/*     */   public void setAml1_type_cd(String aml1TypeCd) {
/* 326 */     this.aml1_type_cd = aml1TypeCd;
/*     */   }
/*     */   public String getAml1_type_disp() {
/* 329 */     return this.aml1_type_disp;
/*     */   }
/*     */   public void setAml1_type_disp(String aml1TypeDisp) {
/* 332 */     this.aml1_type_disp = aml1TypeDisp;
/*     */   }
/*     */   public String getCheck_method() {
/* 335 */     return this.check_method;
/*     */   }
/*     */   public void setCheck_method(String checkMethod) {
/* 338 */     this.check_method = checkMethod;
/*     */   }
/*     */   public String getCredit_flag() {
/* 341 */     return this.credit_flag;
/*     */   }
/*     */   public void setCredit_flag(String creditFlag) {
/* 344 */     this.credit_flag = creditFlag;
/*     */   }
/*     */   public String getCredit_flag_disp() {
/* 347 */     return this.credit_flag_disp;
/*     */   }
/*     */   public void setCredit_flag_disp(String creditFlagDisp) {
/* 350 */     this.credit_flag_disp = creditFlagDisp;
/*     */   }
/*     */   public String getLian_flag() {
/* 353 */     return this.lian_flag;
/*     */   }
/*     */   public void setLian_flag(String lianFlag) {
/* 356 */     this.lian_flag = lianFlag;
/*     */   }
/*     */   public String getLian_flag_disp() {
/* 359 */     return this.lian_flag_disp;
/*     */   }
/*     */   public void setLian_flag_disp(String lianFlagDisp) {
/* 362 */     this.lian_flag_disp = lianFlagDisp;
/*     */   }
/*     */   public Integer getLeader_num() {
/* 365 */     return this.leader_num;
/*     */   }
/*     */   public void setLeader_num(Integer leaderNum) {
/* 368 */     this.leader_num = leaderNum;
/*     */   }
/*     */   public String getAgent_flag() {
/* 371 */     return this.agent_flag;
/*     */   }
/*     */   public void setAgent_flag(String agentFlag) {
/* 374 */     this.agent_flag = agentFlag;
/*     */   }
/*     */   public String getAgent_flag_disp() {
/* 377 */     return this.agent_flag_disp;
/*     */   }
/*     */   public void setAgent_flag_disp(String agentFlagDisp) {
/* 380 */     this.agent_flag_disp = agentFlagDisp;
/*     */   }
/*     */   public String getAddw_flag() {
/* 383 */     return this.addw_flag;
/*     */   }
/*     */   public void setAddw_flag(String addwFlag) {
/* 386 */     this.addw_flag = addwFlag;
/*     */   }
/*     */   public String getAddb_flag() {
/* 389 */     return this.addb_flag;
/*     */   }
/*     */   public void setAddb_flag(String addbFlag) {
/* 392 */     this.addb_flag = addbFlag;
/*     */   }
/*     */   public String getAuditlevel_flag() {
/* 395 */     return this.auditlevel_flag;
/*     */   }
/*     */   public void setAuditlevel_flag(String auditlevelFlag) {
/* 398 */     this.auditlevel_flag = auditlevelFlag;
/*     */   }
/*     */   public String getAuditlevel() {
/* 401 */     return this.auditlevel;
/*     */   }
/*     */   public void setAuditlevel(String auditlevel) {
/* 404 */     this.auditlevel = auditlevel;
/*     */   }
/*     */   public String getCheck_result() {
/* 407 */     return this.check_result;
/*     */   }
/*     */   public void setCheck_result(String checkResult) {
/* 410 */     this.check_result = checkResult;
/*     */   }
/*     */   public String getCheck_explain() {
/* 413 */     return this.check_explain;
/*     */   }
/*     */   public void setCheck_explain(String checkExplain) {
/* 416 */     this.check_explain = checkExplain;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 419 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 422 */     this.check_dt = checkDt;
/*     */   }
/*     */   public String getCheck_dt_disp() {
/* 425 */     return this.check_dt_disp;
/*     */   }
/*     */   public void setCheck_dt_disp(String checkDtDisp) {
/* 428 */     this.check_dt_disp = checkDtDisp;
/*     */   }
/*     */   public Date getCheck_dt_start() {
/* 431 */     return this.check_dt_start;
/*     */   }
/*     */   public void setCheck_dt_start(Date checkDtStart) {
/* 434 */     this.check_dt_start = checkDtStart;
/*     */   }
/*     */   public String getCheck_dt_start_disp() {
/* 437 */     return this.check_dt_start_disp;
/*     */   }
/*     */   public void setCheck_dt_start_disp(String checkDtStartDisp) {
/* 440 */     this.check_dt_start_disp = checkDtStartDisp;
/*     */   }
/*     */   public Date getCheck_dt_end() {
/* 443 */     return this.check_dt_end;
/*     */   }
/*     */   public void setCheck_dt_end(Date checkDtEnd) {
/* 446 */     this.check_dt_end = checkDtEnd;
/*     */   }
/*     */   public String getCheck_dt_end_disp() {
/* 449 */     return this.check_dt_end_disp;
/*     */   }
/*     */   public void setCheck_dt_end_disp(String checkDtEndDisp) {
/* 452 */     this.check_dt_end_disp = checkDtEndDisp;
/*     */   }
/*     */   public Date getValid_dt() {
/* 455 */     return this.valid_dt;
/*     */   }
/*     */   public void setValid_dt(Date validDt) {
/* 458 */     this.valid_dt = validDt;
/*     */   }
/*     */   public String getValid_dt_disp() {
/* 461 */     return this.valid_dt_disp;
/*     */   }
/*     */   public void setValid_dt_disp(String validDtDisp) {
/* 464 */     this.valid_dt_disp = validDtDisp;
/*     */   }
/*     */   public Date getValid_dt_start() {
/* 467 */     return this.valid_dt_start;
/*     */   }
/*     */   public void setValid_dt_start(Date validDtStart) {
/* 470 */     this.valid_dt_start = validDtStart;
/*     */   }
/*     */   public String getValid_dt_start_disp() {
/* 473 */     return this.valid_dt_start_disp;
/*     */   }
/*     */   public void setValid_dt_start_disp(String validDtStartDisp) {
/* 476 */     this.valid_dt_start_disp = validDtStartDisp;
/*     */   }
/*     */   public Date getValid_dt_end() {
/* 479 */     return this.valid_dt_end;
/*     */   }
/*     */   public void setValid_dt_end(Date validDtEnd) {
/* 482 */     this.valid_dt_end = validDtEnd;
/*     */   }
/*     */   public String getValid_dt_end_disp() {
/* 485 */     return this.valid_dt_end_disp;
/*     */   }
/*     */   public void setValid_dt_end_disp(String validDtEndDisp) {
/* 488 */     this.valid_dt_end_disp = validDtEndDisp;
/*     */   }
/*     */   public String getChecker() {
/* 491 */     return this.checker;
/*     */   }
/*     */   public void setChecker(String checker) {
/* 494 */     this.checker = checker;
/*     */   }
/*     */   public String getChecker_org() {
/* 497 */     return this.checker_org;
/*     */   }
/*     */   public void setChecker_org(String checkerOrg) {
/* 500 */     this.checker_org = checkerOrg;
/*     */   }
/*     */   public String getChecker_org_name() {
/* 503 */     return this.checker_org_name;
/*     */   }
/*     */   public void setChecker_org_name(String checkerOrgName) {
/* 506 */     this.checker_org_name = checkerOrgName;
/*     */   }
/*     */   public String[] getSelectedPartyrisk_No() {
/* 509 */     return this.selectedPartyrisk_No;
/*     */   }
/*     */   public void setSelectedPartyrisk_No(String[] selectedPartyriskNo) {
/* 512 */     this.selectedPartyrisk_No = selectedPartyriskNo;
/*     */   }
/*     */   public String getIs_relaleder() {
/* 515 */     return this.is_relaleder;
/*     */   }
/*     */   public void setIs_relaleder(String isRelaleder) {
/* 518 */     this.is_relaleder = isRelaleder;
/*     */   }
/*     */   public String getRisk_type_str() {
/* 521 */     return this.risk_type_str;
/*     */   }
/*     */   public void setRisk_type_str(String riskTypeStr) {
/* 524 */     this.risk_type_str = riskTypeStr;
/*     */   }
/*     */   public String getRisk_no() {
/* 527 */     return this.risk_no;
/*     */   }
/*     */   public void setRisk_no(String riskNo) {
/* 530 */     this.risk_no = riskNo;
/*     */   }
/*     */   public String getRisk_name() {
/* 533 */     return this.risk_name;
/*     */   }
/*     */   public void setRisk_name(String riskName) {
/* 536 */     this.risk_name = riskName;
/*     */   }
/*     */ 
/*     */   public String getIndickey() {
/* 540 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 543 */     this.indickey = indickey;
/*     */   }
/*     */   public String getIndic_order() {
/* 546 */     return this.indic_order;
/*     */   }
/*     */   public void setIndic_order(String indicOrder) {
/* 549 */     this.indic_order = indicOrder;
/*     */   }
/*     */   public String[] getSelectedrisk_No() {
/* 552 */     return this.selectedrisk_No;
/*     */   }
/*     */   public void setSelectedrisk_No(String[] selectedriskNo) {
/* 555 */     this.selectedrisk_No = selectedriskNo;
/*     */   }
/*     */   public String getCheck_method_disp() {
/* 558 */     return this.check_method_disp;
/*     */   }
/*     */   public void setCheck_method_disp(String checkMethodDisp) {
/* 561 */     this.check_method_disp = checkMethodDisp;
/*     */   }
/*     */   public String getW_reason() {
/* 564 */     return this.w_reason;
/*     */   }
/*     */   public void setW_reason(String wReason) {
/* 567 */     this.w_reason = wReason;
/*     */   }
/*     */   public String getW_rule_type() {
/* 570 */     return this.w_rule_type;
/*     */   }
/*     */   public void setW_rule_type(String wRuleType) {
/* 573 */     this.w_rule_type = wRuleType;
/*     */   }
/*     */   public String getB_reason() {
/* 576 */     return this.b_reason;
/*     */   }
/*     */   public void setB_reason(String bReason) {
/* 579 */     this.b_reason = bReason;
/*     */   }
/*     */   public String getLeader_numStr() {
/* 582 */     return this.leader_numStr;
/*     */   }
/*     */   public void setLeader_numStr(String leaderNumStr) {
/* 585 */     this.leader_numStr = leaderNumStr;
/*     */   }
/*     */   public String getChangeflag() {
/* 588 */     return this.changeflag;
/*     */   }
/*     */   public void setChangeflag(String changeflag) {
/* 591 */     this.changeflag = changeflag;
/*     */   }
/*     */   public String getList_type() {
/* 594 */     return this.list_type;
/*     */   }
/*     */   public void setList_type(String listType) {
/* 597 */     this.list_type = listType;
/*     */   }
/*     */   public String getM_list_type() {
/* 600 */     return this.m_list_type;
/*     */   }
/*     */   public void setM_list_type(String mListType) {
/* 603 */     this.m_list_type = mListType;
/*     */   }
/*     */   public String getElementkey() {
/* 606 */     return this.elementkey;
/*     */   }
/*     */   public void setElementkey(String elementkey) {
/* 609 */     this.elementkey = elementkey;
/*     */   }
/*     */   public String getElement_score() {
/* 612 */     return this.element_score;
/*     */   }
/*     */   public void setElement_score(String elementScore) {
/* 615 */     this.element_score = elementScore;
/*     */   }
/*     */   public String getElementname() {
/* 618 */     return this.elementname;
/*     */   }
/*     */   public void setElementname(String elementname) {
/* 621 */     this.elementname = elementname;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_checkparty_funActionForm
 * JD-Core Version:    0.6.2
 */