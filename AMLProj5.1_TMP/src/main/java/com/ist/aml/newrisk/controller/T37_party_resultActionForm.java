/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T37_party_resultActionForm extends ActionForm
/*     */ {
/*  33 */   private String status_cd = "";
/*     */ 
/*  35 */   private String templatekey = "";
/*  36 */   private String templatename = "";
/*     */ 
/*  38 */   private String export_status = "";
/*     */ 
/*  40 */   private String party_id = "";
/*     */   private Date modifydate;
/*  44 */   private String temptype = "";
/*     */ 
/*  46 */   private String lastcheckflag = "";
/*     */ 
/*  48 */   private String modify_cd = "";
/*     */ 
/*  50 */   private String levelkey = "";
/*     */ 
/*  52 */   private String granularity = "";
/*     */   private Date statistic_dt;
/*  56 */   private Date reportdt = new Date();
/*     */ 
/*  58 */   private String organkey = "";
/*  59 */   private String organkey_s = "";
/*  60 */   private String organ_name = "";
/*     */ 
/*  62 */   private String fristappralevel = "";
/*  63 */   private String fristappralevel_disp = "";
/*     */ 
/*  65 */   private String host_cust_id = "";
/*     */ 
/*  67 */   private String lastlevelkey = "";
/*     */ 
/*  69 */   private String party_class_cd = "";
/*     */ 
/*  71 */   private String emendationlevel = "";
/*  72 */   private String emendationlevel_disp = "";
/*  73 */   private String level_before_adjust = "";
/*     */ 
/*  75 */   private String curr_post = "";
/*     */ 
/*  77 */   private String party_chn_name = "";
/*     */ 
/*  79 */   private String modifier = "";
/*     */   private Date create_dt;
/*  83 */   private String resulekey = "";
/*     */ 
/*  85 */   private String reason = "";
/*     */ 
/*  88 */   private String modifydate_disp = "";
/*  89 */   private String modifydate_disp_end = "";
/*     */ 
/*  91 */   private String statistic_dt_disp = "";
/*  92 */   private String statistic_dt_disp_end = "";
/*     */ 
/*  94 */   private String reportdt_disp = "";
/*     */ 
/*  96 */   private String create_dt_disp = "";
/*     */ 
/*  98 */   private String score = "";
/*  99 */   private String lastscore = "";
/*     */ 
/* 101 */   private String audit_user = "";
/*     */ 
/* 103 */   private String return_reason = "";
/*     */   private Date audit_dt;
/* 107 */   private String check_user = "";
/*     */   private Date check_dt;
/* 111 */   private String rcheck_user = "";
/*     */   private Date rcheck_dt;
/*     */   private Date dealmax_dt;
/*     */   private Date nextstatistic_dt;
/*     */   private Date nextdealmax_dt;
/* 122 */   private String tempcategory = "";
/* 123 */   private String tempcategory_s = "";
/* 124 */   private String tempcategory_c = "";
/* 125 */   private String create_dt_disp_end = "";
/* 126 */   private String order = "";
/* 127 */   private String orderby = "";
/* 128 */   private String post_id = "";
/* 129 */   private String node_id = "";
/* 130 */   private String oper_id = "";
/*     */   private String[] rkeys;
/* 133 */   private String gskey = "";
/* 134 */   private String gsname = "";
/* 135 */   private String gsrm = "";
/*     */ 
/* 137 */   private String indickey = "";
/*     */ 
/* 139 */   private String indicname = "";
/*     */ 
/* 141 */   private String indicval = "";
/*     */ 
/* 143 */   private String marked = "";
/*     */ 
/* 145 */   private String changeflag = "";
/* 146 */   private String check_type = "";
/*     */ 
/*     */   public void setStatus_cd(String status_cdStr)
/*     */   {
/* 155 */     this.status_cd = status_cdStr;
/*     */   }
/*     */   public String getStatus_cd() {
/* 158 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 162 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 165 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public String getTemplatename() {
/* 169 */     return this.templatename;
/*     */   }
/*     */   public void setTemplatename(String templatename) {
/* 172 */     this.templatename = templatename;
/*     */   }
/*     */   public String getScore() {
/* 175 */     return this.score;
/*     */   }
/*     */   public void setScore(String score) {
/* 178 */     this.score = score;
/*     */   }
/*     */ 
/*     */   public String getLastscore() {
/* 182 */     return this.lastscore;
/*     */   }
/*     */   public void setLastscore(String lastscore) {
/* 185 */     this.lastscore = lastscore;
/*     */   }
/*     */   public void setExport_status(String export_statusStr) {
/* 188 */     this.export_status = export_statusStr;
/*     */   }
/*     */   public String getExport_status() {
/* 191 */     return this.export_status;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String party_idStr) {
/* 195 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 198 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setModifydate(Date modifydateStr) {
/* 202 */     this.modifydate = modifydateStr;
/*     */   }
/*     */   public Date getModifydate() {
/* 205 */     return this.modifydate;
/*     */   }
/*     */ 
/*     */   public void setTemptype(String temptypeStr) {
/* 209 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 212 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public void setLastcheckflag(String lastcheckflagStr) {
/* 216 */     this.lastcheckflag = lastcheckflagStr;
/*     */   }
/*     */   public String getLastcheckflag() {
/* 219 */     return this.lastcheckflag;
/*     */   }
/*     */ 
/*     */   public void setModify_cd(String modify_cdStr) {
/* 223 */     this.modify_cd = modify_cdStr;
/*     */   }
/*     */   public String getModify_cd() {
/* 226 */     return this.modify_cd;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/* 230 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 233 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 237 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 240 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public String getLevel_before_adjust() {
/* 244 */     return this.level_before_adjust;
/*     */   }
/*     */   public void setLevel_before_adjust(String levelBeforeAdjust) {
/* 247 */     this.level_before_adjust = levelBeforeAdjust;
/*     */   }
/*     */   public void setStatistic_dt(Date statistic_dtStr) {
/* 250 */     this.statistic_dt = statistic_dtStr;
/*     */   }
/*     */   public Date getStatistic_dt() {
/* 253 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setReportdt(Date reportdtStr) {
/* 257 */     this.reportdt = reportdtStr;
/*     */   }
/*     */   public Date getReportdt() {
/* 260 */     return this.reportdt;
/*     */   }
/*     */ 
/*     */   public String getReturn_reason() {
/* 264 */     return this.return_reason;
/*     */   }
/*     */   public void setReturn_reason(String returnReason) {
/* 267 */     this.return_reason = returnReason;
/*     */   }
/*     */   public void setOrgankey(String organkeyStr) {
/* 270 */     this.organkey = organkeyStr;
/*     */   }
/*     */   public String getOrgankey() {
/* 273 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public String getOrgankey_s() {
/* 277 */     return this.organkey_s;
/*     */   }
/*     */   public void setOrgankey_s(String organkeyS) {
/* 280 */     this.organkey_s = organkeyS;
/*     */   }
/*     */   public void setFristappralevel(String fristappralevelStr) {
/* 283 */     this.fristappralevel = fristappralevelStr;
/*     */   }
/*     */   public String getFristappralevel() {
/* 286 */     return this.fristappralevel;
/*     */   }
/*     */ 
/*     */   public String getFristappralevel_disp() {
/* 290 */     return this.fristappralevel_disp;
/*     */   }
/*     */   public void setFristappralevel_disp(String fristappralevelDisp) {
/* 293 */     this.fristappralevel_disp = fristappralevelDisp;
/*     */   }
/*     */   public void setHost_cust_id(String host_cust_idStr) {
/* 296 */     this.host_cust_id = host_cust_idStr;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 299 */     return this.host_cust_id;
/*     */   }
/*     */ 
/*     */   public String getReason() {
/* 303 */     return this.reason;
/*     */   }
/*     */   public void setReason(String reason) {
/* 306 */     this.reason = reason;
/*     */   }
/*     */   public void setLastlevelkey(String lastlevelkeyStr) {
/* 309 */     this.lastlevelkey = lastlevelkeyStr;
/*     */   }
/*     */   public String getLastlevelkey() {
/* 312 */     return this.lastlevelkey;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd(String party_class_cdStr) {
/* 316 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 319 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setEmendationlevel(String emendationlevelStr) {
/* 323 */     this.emendationlevel = emendationlevelStr;
/*     */   }
/*     */   public String getEmendationlevel() {
/* 326 */     return this.emendationlevel;
/*     */   }
/*     */ 
/*     */   public String getEmendationlevel_disp() {
/* 330 */     return this.emendationlevel_disp;
/*     */   }
/*     */   public void setEmendationlevel_disp(String emendationlevelDisp) {
/* 333 */     this.emendationlevel_disp = emendationlevelDisp;
/*     */   }
/*     */   public void setCurr_post(String curr_postStr) {
/* 336 */     this.curr_post = curr_postStr;
/*     */   }
/*     */   public String getCurr_post() {
/* 339 */     return this.curr_post;
/*     */   }
/*     */ 
/*     */   public void setParty_chn_name(String party_chn_nameStr) {
/* 343 */     this.party_chn_name = party_chn_nameStr;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 346 */     return this.party_chn_name;
/*     */   }
/*     */ 
/*     */   public void setModifier(String modifierStr) {
/* 350 */     this.modifier = modifierStr;
/*     */   }
/*     */   public String getModifier() {
/* 353 */     return this.modifier;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date create_dtStr) {
/* 357 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public Date getCreate_dt() {
/* 360 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekeyStr) {
/* 364 */     this.resulekey = resulekeyStr;
/*     */   }
/*     */   public String getResulekey() {
/* 367 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public void setModifydate_disp(String modifydate_dispStr)
/*     */   {
/* 372 */     this.modifydate_disp = modifydate_dispStr;
/*     */   }
/*     */   public String getModifydate_disp() {
/* 375 */     return this.modifydate_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr) {
/* 379 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 382 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setReportdt_disp(String reportdt_dispStr) {
/* 386 */     this.reportdt_disp = reportdt_dispStr;
/*     */   }
/*     */   public String getReportdt_disp() {
/* 389 */     return this.reportdt_disp;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt_disp(String create_dt_dispStr) {
/* 393 */     this.create_dt_disp = create_dt_dispStr;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 396 */     return this.create_dt_disp;
/*     */   }
/*     */ 
/*     */   public String getModifydate_disp_end() {
/* 400 */     return this.modifydate_disp_end;
/*     */   }
/*     */   public void setModifydate_disp_end(String modifydateDispEnd) {
/* 403 */     this.modifydate_disp_end = modifydateDispEnd;
/*     */   }
/*     */   public String getStatistic_dt_disp_end() {
/* 406 */     return this.statistic_dt_disp_end;
/*     */   }
/*     */   public void setStatistic_dt_disp_end(String statisticDtDispEnd) {
/* 409 */     this.statistic_dt_disp_end = statisticDtDispEnd;
/*     */   }
/*     */   public String getCreate_dt_disp_end() {
/* 412 */     return this.create_dt_disp_end;
/*     */   }
/*     */   public void setCreate_dt_disp_end(String createDtDispEnd) {
/* 415 */     this.create_dt_disp_end = createDtDispEnd;
/*     */   }
/*     */ 
/*     */   public String getOrgan_name() {
/* 419 */     return this.organ_name;
/*     */   }
/*     */   public void setOrgan_name(String organName) {
/* 422 */     this.organ_name = organName;
/*     */   }
/*     */ 
/*     */   public String getOrderby() {
/* 426 */     return this.orderby;
/*     */   }
/*     */   public void setOrderby(String orderby) {
/* 429 */     this.orderby = orderby;
/*     */   }
/*     */ 
/*     */   public String[] getRkeys() {
/* 433 */     return this.rkeys;
/*     */   }
/*     */   public void setRkeys(String[] rkeys) {
/* 436 */     this.rkeys = rkeys;
/*     */   }
/*     */ 
/*     */   public String getOrder() {
/* 440 */     return this.order;
/*     */   }
/*     */   public void setOrder(String order) {
/* 443 */     this.order = order;
/*     */   }
/*     */ 
/*     */   public String getPost_id() {
/* 447 */     return this.post_id;
/*     */   }
/*     */   public void setPost_id(String postId) {
/* 450 */     this.post_id = postId;
/*     */   }
/*     */ 
/*     */   public String getNode_id() {
/* 454 */     return this.node_id;
/*     */   }
/*     */   public void setNode_id(String nodeId) {
/* 457 */     this.node_id = nodeId;
/*     */   }
/*     */   public String getOper_id() {
/* 460 */     return this.oper_id;
/*     */   }
/*     */   public void setOper_id(String operId) {
/* 463 */     this.oper_id = operId;
/*     */   }
/*     */   public String getGskey() {
/* 466 */     return this.gskey;
/*     */   }
/*     */   public void setGskey(String gskey) {
/* 469 */     this.gskey = gskey;
/*     */   }
/*     */   public String getGsname() {
/* 472 */     return this.gsname;
/*     */   }
/*     */   public void setGsname(String gsname) {
/* 475 */     this.gsname = gsname;
/*     */   }
/*     */   public String getGsrm() {
/* 478 */     return this.gsrm;
/*     */   }
/*     */   public void setGsrm(String gsrm) {
/* 481 */     this.gsrm = gsrm;
/*     */   }
/*     */   public String getTempcategory() {
/* 484 */     return this.tempcategory;
/*     */   }
/*     */ 
/*     */   public String getTempcategory_s() {
/* 488 */     return this.tempcategory_s;
/*     */   }
/*     */   public void setTempcategory_s(String tempcategoryS) {
/* 491 */     this.tempcategory_s = tempcategoryS;
/*     */   }
/*     */ 
/*     */   public String getTempcategory_c() {
/* 495 */     return this.tempcategory_c;
/*     */   }
/*     */   public void setTempcategory_c(String tempcategoryC) {
/* 498 */     this.tempcategory_c = tempcategoryC;
/*     */   }
/*     */   public String getIndickey() {
/* 501 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 504 */     this.indickey = indickey;
/*     */   }
/*     */   public String getIndicname() {
/* 507 */     return this.indicname;
/*     */   }
/*     */   public void setIndicname(String indicname) {
/* 510 */     this.indicname = indicname;
/*     */   }
/*     */   public String getIndicval() {
/* 513 */     return this.indicval;
/*     */   }
/*     */   public void setIndicval(String indicval) {
/* 516 */     this.indicval = indicval;
/*     */   }
/*     */   public String getMarked() {
/* 519 */     return this.marked;
/*     */   }
/*     */   public void setMarked(String marked) {
/* 522 */     this.marked = marked;
/*     */   }
/*     */   public void setTempcategory(String tempcategory) {
/* 525 */     this.tempcategory = tempcategory;
/*     */   }
/*     */ 
/*     */   public String getChangeflag() {
/* 529 */     return this.changeflag;
/*     */   }
/*     */   public void setChangeflag(String changeflag) {
/* 532 */     this.changeflag = changeflag;
/*     */   }
/*     */   public String getCheck_type() {
/* 535 */     return this.check_type;
/*     */   }
/*     */   public void setCheck_type(String checkType) {
/* 538 */     this.check_type = checkType;
/*     */   }
/*     */ 
/*     */   public String getAudit_user() {
/* 542 */     return this.audit_user;
/*     */   }
/*     */   public void setAudit_user(String auditUser) {
/* 545 */     this.audit_user = auditUser;
/*     */   }
/*     */   public Date getAudit_dt() {
/* 548 */     return this.audit_dt;
/*     */   }
/*     */   public void setAudit_dt(Date auditDt) {
/* 551 */     this.audit_dt = auditDt;
/*     */   }
/*     */   public String getCheck_user() {
/* 554 */     return this.check_user;
/*     */   }
/*     */   public void setCheck_user(String checkUser) {
/* 557 */     this.check_user = checkUser;
/*     */   }
/*     */   public Date getCheck_dt() {
/* 560 */     return this.check_dt;
/*     */   }
/*     */   public void setCheck_dt(Date checkDt) {
/* 563 */     this.check_dt = checkDt;
/*     */   }
/*     */   public String getRcheck_user() {
/* 566 */     return this.rcheck_user;
/*     */   }
/*     */   public void setRcheck_user(String rcheckUser) {
/* 569 */     this.rcheck_user = rcheckUser;
/*     */   }
/*     */   public Date getRcheck_dt() {
/* 572 */     return this.rcheck_dt;
/*     */   }
/*     */   public void setRcheck_dt(Date rcheckDt) {
/* 575 */     this.rcheck_dt = rcheckDt;
/*     */   }
/*     */   public Date getDealmax_dt() {
/* 578 */     return this.dealmax_dt;
/*     */   }
/*     */   public void setDealmax_dt(Date dealmaxDt) {
/* 581 */     this.dealmax_dt = dealmaxDt;
/*     */   }
/*     */   public Date getNextstatistic_dt() {
/* 584 */     return this.nextstatistic_dt;
/*     */   }
/*     */   public void setNextstatistic_dt(Date nextstatisticDt) {
/* 587 */     this.nextstatistic_dt = nextstatisticDt;
/*     */   }
/*     */   public Date getNextdealmax_dt() {
/* 590 */     return this.nextdealmax_dt;
/*     */   }
/*     */   public void setNextdealmax_dt(Date nextdealmaxDt) {
/* 593 */     this.nextdealmax_dt = nextdealmaxDt;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 598 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_party_resultActionForm
 * JD-Core Version:    0.6.2
 */