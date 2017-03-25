/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T37_party_result extends BaseDTO
/*     */ {
/*     */   private static final long serialVersionUID = 8917938570971999929L;
/*  33 */   private String status_cd = "";
/*     */ 
/*  35 */   private String templatekey = "";
/*  36 */   private String templatename = "";
/*     */ 
/*  38 */   private String export_status = "";
/*     */ 
/*  40 */   private String party_id = "";
/*     */   private Date modifydate;
/*     */   private Date modifydate_end;
/*  45 */   private String temptype = "";
/*  46 */   private String temptype_disp = "";
/*     */ 
/*  48 */   private String lastcheckflag = "";
/*     */ 
/*  50 */   private String modify_cd = "";
/*     */ 
/*  52 */   private String levelkey = "";
/*  53 */   private String levelkey_disp = "";
/*     */ 
/*  55 */   private String granularity = "";
/*     */   private Date statistic_dt;
/*     */   private Date statistic_dt_end;
/*  60 */   private Date reportdt = new Date();
/*     */ 
/*  62 */   private String organkey = "";
/*  63 */   private String organkey_s = "";
/*  64 */   private String organ_name = "";
/*     */ 
/*  66 */   private String fristappralevel = "";
/*  67 */   private String fristappralevel_disp = "";
/*     */ 
/*  69 */   private String host_cust_id = "";
/*     */ 
/*  71 */   private String lastlevelkey = "";
/*     */ 
/*  73 */   private String party_class_cd = "";
/*     */ 
/*  75 */   private String emendationlevel = "";
/*  76 */   private String emendationlevel_disp = "";
/*  77 */   private String level_before_adjust = "";
/*     */ 
/*  79 */   private String higherlevel = "";
/*     */ 
/*  81 */   private String curr_post = "";
/*     */ 
/*  83 */   private String party_chn_name = "";
/*     */ 
/*  85 */   private String modifier = "";
/*     */   private Date create_dt;
/*     */   private Date create_dt_end;
/*  90 */   private String resulekey = "";
/*     */ 
/*  93 */   private String modifydate_disp = "";
/*     */ 
/*  95 */   private String statistic_dt_disp = "";
/*     */ 
/*  97 */   private String reportdt_disp = "";
/*     */ 
/*  99 */   private String create_dt_disp = "";
/*     */ 
/* 101 */   private String score = "";
/* 102 */   private String lastscore = "";
/*     */ 
/* 104 */   private String audit_user = "";
/*     */   private Date audit_dt;
/* 108 */   private String return_reason = "";
/*     */ 
/* 110 */   private String check_user = "";
/*     */   private Date check_dt;
/* 114 */   private String rcheck_user = "";
/*     */   private Date rcheck_dt;
/*     */   private Date dealmax_dt;
/* 119 */   private String dealmax_dt_disp = "";
/*     */   private Date nextstatistic_dt;
/*     */   private Date nextdealmax_dt;
/* 125 */   private String tempcategory = "";
/* 126 */   private String tempcategory_s = "";
/* 127 */   private String tempcategory_c = "";
/* 128 */   private String tempcategory_disp = "";
/* 129 */   private String organStr = "";
/* 130 */   private String order = "";
/* 131 */   private String orderby = "";
/* 132 */   private String gskey = "";
/* 133 */   private String gsname = "";
/* 134 */   private String gsrm = "";
/* 135 */   private String post_id = "";
/* 136 */   private String node_id = "";
/* 137 */   private String reason = "";
/*     */ 
/* 139 */   private String indickey = "";
/*     */ 
/* 141 */   private String indicname = "";
/*     */ 
/* 143 */   private String indicval = "";
/*     */ 
/* 145 */   private String marked = "";
/* 146 */   private String is_last = "";
/* 147 */   private String elementkey = "";
/*     */ 
/* 149 */   private String changeflag = "";
/* 150 */   private String check_type = "";
/*     */ 
/*     */   public void setStatus_cd(String status_cdStr)
/*     */   {
/* 159 */     this.status_cd = status_cdStr;
/*     */   }
/*     */   public String getStatus_cd() {
/* 162 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 166 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 169 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public String getTemplatename() {
/* 173 */     return this.templatename;
/*     */   }
/*     */   public void setTemplatename(String templatename) {
/* 176 */     this.templatename = templatename;
/*     */   }
/*     */   public void setExport_status(String export_statusStr) {
/* 179 */     this.export_status = export_statusStr;
/*     */   }
/*     */   public String getExport_status() {
/* 182 */     return this.export_status;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String party_idStr) {
/* 186 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 189 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setModifydate(Date modifydateStr) {
/* 193 */     this.modifydate = modifydateStr;
/*     */   }
/*     */   public Date getModifydate() {
/* 196 */     return this.modifydate;
/*     */   }
/*     */ 
/*     */   public String getScore() {
/* 200 */     return this.score;
/*     */   }
/*     */   public void setScore(String score) {
/* 203 */     this.score = score;
/*     */   }
/*     */ 
/*     */   public String getLastscore() {
/* 207 */     return this.lastscore;
/*     */   }
/*     */   public void setLastscore(String lastscore) {
/* 210 */     this.lastscore = lastscore;
/*     */   }
/*     */   public void setTemptype(String temptypeStr) {
/* 213 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 216 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public String getTemptype_disp() {
/* 220 */     return this.temptype_disp;
/*     */   }
/*     */   public void setTemptype_disp(String temptypeDisp) {
/* 223 */     this.temptype_disp = temptypeDisp;
/*     */   }
/*     */   public void setLastcheckflag(String lastcheckflagStr) {
/* 226 */     this.lastcheckflag = lastcheckflagStr;
/*     */   }
/*     */   public String getLastcheckflag() {
/* 229 */     return this.lastcheckflag;
/*     */   }
/*     */ 
/*     */   public void setModify_cd(String modify_cdStr) {
/* 233 */     this.modify_cd = modify_cdStr;
/*     */   }
/*     */   public String getModify_cd() {
/* 236 */     return this.modify_cd;
/*     */   }
/*     */ 
/*     */   public String getLevel_before_adjust() {
/* 240 */     return this.level_before_adjust;
/*     */   }
/*     */   public void setLevel_before_adjust(String levelBeforeAdjust) {
/* 243 */     this.level_before_adjust = levelBeforeAdjust;
/*     */   }
/*     */   public void setLevelkey(String levelkeyStr) {
/* 246 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 249 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public String getLevelkey_disp() {
/* 253 */     return this.levelkey_disp;
/*     */   }
/*     */   public void setLevelkey_disp(String levelkeyDisp) {
/* 256 */     this.levelkey_disp = levelkeyDisp;
/*     */   }
/*     */   public String getEmendationlevel_disp() {
/* 259 */     return this.emendationlevel_disp;
/*     */   }
/*     */   public void setEmendationlevel_disp(String emendationlevelDisp) {
/* 262 */     this.emendationlevel_disp = emendationlevelDisp;
/*     */   }
/*     */ 
/*     */   public String getHigherlevel() {
/* 266 */     return this.higherlevel;
/*     */   }
/*     */   public void setHigherlevel(String higherlevel) {
/* 269 */     this.higherlevel = higherlevel;
/*     */   }
/*     */   public void setGranularity(String granularityStr) {
/* 272 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 275 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt(Date statistic_dtStr) {
/* 279 */     this.statistic_dt = statistic_dtStr;
/*     */   }
/*     */   public Date getStatistic_dt() {
/* 282 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setReportdt(Date reportdtStr) {
/* 286 */     this.reportdt = reportdtStr;
/*     */   }
/*     */   public Date getReportdt() {
/* 289 */     return this.reportdt;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkeyStr) {
/* 293 */     this.organkey = organkeyStr;
/*     */   }
/*     */   public String getOrgankey() {
/* 296 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public String getOrgankey_s() {
/* 300 */     return this.organkey_s;
/*     */   }
/*     */   public void setOrgankey_s(String organkeyS) {
/* 303 */     this.organkey_s = organkeyS;
/*     */   }
/*     */   public void setFristappralevel(String fristappralevelStr) {
/* 306 */     this.fristappralevel = fristappralevelStr;
/*     */   }
/*     */   public String getFristappralevel() {
/* 309 */     return this.fristappralevel;
/*     */   }
/*     */ 
/*     */   public String getFristappralevel_disp() {
/* 313 */     return this.fristappralevel_disp;
/*     */   }
/*     */   public void setFristappralevel_disp(String fristappralevelDisp) {
/* 316 */     this.fristappralevel_disp = fristappralevelDisp;
/*     */   }
/*     */   public void setHost_cust_id(String host_cust_idStr) {
/* 319 */     this.host_cust_id = host_cust_idStr;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 322 */     return this.host_cust_id;
/*     */   }
/*     */ 
/*     */   public String getReturn_reason() {
/* 326 */     return this.return_reason;
/*     */   }
/*     */   public void setReturn_reason(String returnReason) {
/* 329 */     this.return_reason = returnReason;
/*     */   }
/*     */   public void setLastlevelkey(String lastlevelkeyStr) {
/* 332 */     this.lastlevelkey = lastlevelkeyStr;
/*     */   }
/*     */   public String getLastlevelkey() {
/* 335 */     return this.lastlevelkey;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd(String party_class_cdStr) {
/* 339 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 342 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setEmendationlevel(String emendationlevelStr) {
/* 346 */     this.emendationlevel = emendationlevelStr;
/*     */   }
/*     */   public String getEmendationlevel() {
/* 349 */     return this.emendationlevel;
/*     */   }
/*     */ 
/*     */   public void setCurr_post(String curr_postStr) {
/* 353 */     this.curr_post = curr_postStr;
/*     */   }
/*     */   public String getCurr_post() {
/* 356 */     return this.curr_post;
/*     */   }
/*     */ 
/*     */   public void setParty_chn_name(String party_chn_nameStr) {
/* 360 */     this.party_chn_name = party_chn_nameStr;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 363 */     return this.party_chn_name;
/*     */   }
/*     */ 
/*     */   public String getReason() {
/* 367 */     return this.reason;
/*     */   }
/*     */   public void setReason(String reason) {
/* 370 */     this.reason = reason;
/*     */   }
/*     */   public void setModifier(String modifierStr) {
/* 373 */     this.modifier = modifierStr;
/*     */   }
/*     */   public String getModifier() {
/* 376 */     return this.modifier;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date create_dtStr) {
/* 380 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public Date getCreate_dt() {
/* 383 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekeyStr) {
/* 387 */     this.resulekey = resulekeyStr;
/*     */   }
/*     */   public String getResulekey() {
/* 390 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public void setModifydate_disp(String modifydate_dispStr)
/*     */   {
/* 395 */     this.modifydate_disp = modifydate_dispStr;
/*     */   }
/*     */   public String getModifydate_disp() {
/* 398 */     return this.modifydate_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr) {
/* 402 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 405 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setReportdt_disp(String reportdt_dispStr) {
/* 409 */     this.reportdt_disp = reportdt_dispStr;
/*     */   }
/*     */   public String getReportdt_disp() {
/* 412 */     return this.reportdt_disp;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt_disp(String create_dt_dispStr) {
/* 416 */     this.create_dt_disp = create_dt_dispStr;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 419 */     return this.create_dt_disp;
/*     */   }
/*     */   public String getOrganStr() {
/* 422 */     return this.organStr;
/*     */   }
/*     */   public void setOrganStr(String organStr) {
/* 425 */     this.organStr = organStr;
/*     */   }
/*     */   public Date getModifydate_end() {
/* 428 */     return this.modifydate_end;
/*     */   }
/*     */   public void setModifydate_end(Date modifydateEnd) {
/* 431 */     this.modifydate_end = modifydateEnd;
/*     */   }
/*     */   public Date getStatistic_dt_end() {
/* 434 */     return this.statistic_dt_end;
/*     */   }
/*     */   public void setStatistic_dt_end(Date statisticDtEnd) {
/* 437 */     this.statistic_dt_end = statisticDtEnd;
/*     */   }
/*     */   public Date getCreate_dt_end() {
/* 440 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(Date createDtEnd) {
/* 443 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public String getOrgan_name() {
/* 446 */     return this.organ_name;
/*     */   }
/*     */   public void setOrgan_name(String organName) {
/* 449 */     this.organ_name = organName;
/*     */   }
/*     */   public String getOrderby() {
/* 452 */     return this.orderby;
/*     */   }
/*     */   public void setOrderby(String orderby) {
/* 455 */     this.orderby = orderby;
/*     */   }
/*     */   public String getOrder() {
/* 458 */     return this.order;
/*     */   }
/*     */   public void setOrder(String order) {
/* 461 */     this.order = order;
/*     */   }
/*     */   public String getPost_id() {
/* 464 */     return this.post_id;
/*     */   }
/*     */   public void setPost_id(String postId) {
/* 467 */     this.post_id = postId;
/*     */   }
/*     */   public String getNode_id() {
/* 470 */     return this.node_id;
/*     */   }
/*     */   public void setNode_id(String nodeId) {
/* 473 */     this.node_id = nodeId;
/*     */   }
/*     */   public String getTempcategory() {
/* 476 */     return this.tempcategory;
/*     */   }
/*     */   public void setTempcategory(String tempcategory) {
/* 479 */     this.tempcategory = tempcategory;
/*     */   }
/*     */ 
/*     */   public String getTempcategory_s() {
/* 483 */     return this.tempcategory_s;
/*     */   }
/*     */   public void setTempcategory_s(String tempcategoryS) {
/* 486 */     this.tempcategory_s = tempcategoryS;
/*     */   }
/*     */ 
/*     */   public String getTempcategory_c() {
/* 490 */     return this.tempcategory_c;
/*     */   }
/*     */   public void setTempcategory_c(String tempcategoryC) {
/* 493 */     this.tempcategory_c = tempcategoryC;
/*     */   }
/*     */   public String getTempcategory_disp() {
/* 496 */     return this.tempcategory_disp;
/*     */   }
/*     */   public void setTempcategory_disp(String tempcategoryDisp) {
/* 499 */     this.tempcategory_disp = tempcategoryDisp;
/*     */   }
/*     */   public String getGskey() {
/* 502 */     return this.gskey;
/*     */   }
/*     */   public void setGskey(String gskey) {
/* 505 */     this.gskey = gskey;
/*     */   }
/*     */   public String getGsname() {
/* 508 */     return this.gsname;
/*     */   }
/*     */   public void setGsname(String gsname) {
/* 511 */     this.gsname = gsname;
/*     */   }
/*     */   public String getGsrm() {
/* 514 */     return this.gsrm;
/*     */   }
/*     */   public void setGsrm(String gsrm) {
/* 517 */     this.gsrm = gsrm;
/*     */   }
/*     */   public String getMarked() {
/* 520 */     return this.marked;
/*     */   }
/*     */   public void setMarked(String marked) {
/* 523 */     this.marked = marked;
/*     */   }
/*     */   public String getIndickey() {
/* 526 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 529 */     this.indickey = indickey;
/*     */   }
/*     */   public String getIndicname() {
/* 532 */     return this.indicname;
/*     */   }
/*     */   public void setIndicname(String indicname) {
/* 535 */     this.indicname = indicname;
/*     */   }
/*     */   public String getIndicval() {
/* 538 */     return this.indicval;
/*     */   }
/*     */   public void setIndicval(String indicval) {
/* 541 */     this.indicval = indicval;
/*     */   }
/*     */   public String getIs_last() {
/* 544 */     return this.is_last;
/*     */   }
/*     */   public void setIs_last(String isLast) {
/* 547 */     this.is_last = isLast;
/*     */   }
/*     */   public String getElementkey() {
/* 550 */     return this.elementkey;
/*     */   }
/*     */   public void setElementkey(String elementkey) {
/* 553 */     this.elementkey = elementkey;
/*     */   }
/*     */   public String getChangeflag() {
/* 556 */     return this.changeflag;
/*     */   }
/*     */   public void setChangeflag(String changeflag) {
/* 559 */     this.changeflag = changeflag;
/*     */   }
/*     */   public String getCheck_type() {
/* 562 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 565 */     this.check_type = checkType;
/*     */   }
/*     */   public String getAudit_user() {
/* 568 */     return this.audit_user;
/*     */   }
/*     */   public void setAudit_user(String auditUser) {
/* 571 */     this.audit_user = auditUser;
/*     */   }
/*     */   public Date getAudit_dt() {
/* 574 */     return this.audit_dt;
/*     */   }
/*     */   public void setAudit_dt(Date auditDt) {
/* 577 */     this.audit_dt = auditDt;
/*     */   }
/*     */   public String getCheck_user() {
/* 580 */     return this.check_user;
/*     */   }
/*     */   public void setCheck_user(String checkUser) {
/* 583 */     this.check_user = checkUser;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 586 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 589 */     this.check_dt = checkDt;
/*     */   }
/*     */   public String getRcheck_user() {
/* 592 */     return this.rcheck_user;
/*     */   }
/*     */   public void setRcheck_user(String rcheckUser) {
/* 595 */     this.rcheck_user = rcheckUser;
/*     */   }
/*     */   public Date getRcheck_dt() {
/* 598 */     return this.rcheck_dt;
/*     */   }
/*     */   public void setRcheck_dt(Date rcheckDt) {
/* 601 */     this.rcheck_dt = rcheckDt;
/*     */   }
/*     */   public Date getDealmax_dt() {
/* 604 */     return this.dealmax_dt;
/*     */   }
/*     */   public void setDealmax_dt(Date dealmaxDt) {
/* 607 */     this.dealmax_dt = dealmaxDt;
/*     */   }
/*     */ 
/*     */   public String getDealmax_dt_disp() {
/* 611 */     return this.dealmax_dt_disp;
/*     */   }
/*     */   public void setDealmax_dt_disp(String dealmaxDtDisp) {
/* 614 */     this.dealmax_dt_disp = dealmaxDtDisp;
/*     */   }
/*     */   public Date getNextstatistic_dt() {
/* 617 */     return this.nextstatistic_dt;
/*     */   }
/*     */   public void setNextstatistic_dt(Date nextstatisticDt) {
/* 620 */     this.nextstatistic_dt = nextstatisticDt;
/*     */   }
/*     */   public Date getNextdealmax_dt() {
/* 623 */     return this.nextdealmax_dt;
/*     */   }
/*     */   public void setNextdealmax_dt(Date nextdealmaxDt) {
/* 626 */     this.nextdealmax_dt = nextdealmaxDt;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T37_party_result
 * JD-Core Version:    0.6.2
 */