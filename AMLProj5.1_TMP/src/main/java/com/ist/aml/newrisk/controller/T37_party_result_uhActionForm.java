/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T37_party_result_uhActionForm extends ActionForm
/*     */ {
/*  33 */   private String status_cd = "";
/*     */ 
/*  35 */   private String templatekey = "";
/*     */ 
/*  37 */   private String export_status = "";
/*     */ 
/*  39 */   private String party_id = "";
/*     */   private Date modifydate;
/*     */   private Date modifydate_end;
/*  43 */   private String modifydate_disp = "";
/*  44 */   private String modifydate_disp_end = "";
/*     */ 
/*  46 */   private String temptype = "";
/*     */ 
/*  48 */   private String lastcheckflag = "";
/*     */ 
/*  50 */   private String modify_cd = "";
/*     */ 
/*  52 */   private String levelkey = "";
/*     */ 
/*  54 */   private String granularity = "";
/*     */   private Date statistic_dt;
/*     */   private Date statistic_dt_end;
/*  58 */   private String statistic_dt_disp = "";
/*  59 */   private String statistic_dt_disp_end = "";
/*     */ 
/*  61 */   private Date reportdt = new Date();
/*     */ 
/*  63 */   private String organkey = "";
/*  64 */   private String organ_name = "";
/*     */ 
/*  66 */   private String fristappralevel = "";
/*     */ 
/*  68 */   private String organStr = "";
/*     */ 
/*  70 */   private String host_cust_id = "";
/*     */ 
/*  72 */   private String lastlevelkey = "";
/*     */ 
/*  74 */   private String party_class_cd = "";
/*     */ 
/*  76 */   private String emendationlevel = "";
/*     */ 
/*  78 */   private String curr_post = "";
/*     */ 
/*  80 */   private String party_chn_name = "";
/*     */ 
/*  82 */   private String modifier = "";
/*     */   private Date create_dt;
/*     */   private Date create_dt_end;
/*  86 */   private String create_dt_disp = "";
/*  87 */   private String create_dt_disp_end = "";
/*     */ 
/*  89 */   private String resulekey = "";
/*     */ 
/*  91 */   private String tempcategory = "";
/*     */ 
/*  93 */   private String[] selectedResulekey = new String[0];
/*     */ 
/*  95 */   private String reportdt_disp = "";
/*     */ 
/*  97 */   private String marked = "";
/*     */ 
/*  99 */   private String orderby = "";
/* 100 */   private String order = "";
/*     */ 
/*     */   public void setStatus_cd(String status_cdStr)
/*     */   {
/* 109 */     this.status_cd = status_cdStr;
/*     */   }
/*     */   public String getStatus_cd() {
/* 112 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 116 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 119 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setExport_status(String export_statusStr) {
/* 123 */     this.export_status = export_statusStr;
/*     */   }
/*     */   public String getExport_status() {
/* 126 */     return this.export_status;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String party_idStr) {
/* 130 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 133 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setModifydate(Date modifydateStr) {
/* 137 */     this.modifydate = modifydateStr;
/*     */   }
/*     */   public Date getModifydate() {
/* 140 */     return this.modifydate;
/*     */   }
/*     */ 
/*     */   public Date getModifydate_end() {
/* 144 */     return this.modifydate_end;
/*     */   }
/*     */   public void setModifydate_end(Date modifydateEnd) {
/* 147 */     this.modifydate_end = modifydateEnd;
/*     */   }
/*     */   public Date getStatistic_dt_end() {
/* 150 */     return this.statistic_dt_end;
/*     */   }
/*     */   public void setStatistic_dt_end(Date statisticDtEnd) {
/* 153 */     this.statistic_dt_end = statisticDtEnd;
/*     */   }
/*     */   public Date getCreate_dt_end() {
/* 156 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(Date createDtEnd) {
/* 159 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public String getOrganStr() {
/* 162 */     return this.organStr;
/*     */   }
/*     */   public void setOrganStr(String organStr) {
/* 165 */     this.organStr = organStr;
/*     */   }
/*     */   public void setTemptype(String temptypeStr) {
/* 168 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 171 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public void setLastcheckflag(String lastcheckflagStr) {
/* 175 */     this.lastcheckflag = lastcheckflagStr;
/*     */   }
/*     */   public String getLastcheckflag() {
/* 178 */     return this.lastcheckflag;
/*     */   }
/*     */ 
/*     */   public void setModify_cd(String modify_cdStr) {
/* 182 */     this.modify_cd = modify_cdStr;
/*     */   }
/*     */   public String getModify_cd() {
/* 185 */     return this.modify_cd;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/* 189 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 192 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 196 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 199 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt(Date statistic_dtStr) {
/* 203 */     this.statistic_dt = statistic_dtStr;
/*     */   }
/*     */   public Date getStatistic_dt() {
/* 206 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setReportdt(Date reportdtStr) {
/* 210 */     this.reportdt = reportdtStr;
/*     */   }
/*     */   public Date getReportdt() {
/* 213 */     return this.reportdt;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkeyStr) {
/* 217 */     this.organkey = organkeyStr;
/*     */   }
/*     */   public String getOrgankey() {
/* 220 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public String getOrgan_name() {
/* 224 */     return this.organ_name;
/*     */   }
/*     */   public void setOrgan_name(String organName) {
/* 227 */     this.organ_name = organName;
/*     */   }
/*     */   public void setFristappralevel(String fristappralevelStr) {
/* 230 */     this.fristappralevel = fristappralevelStr;
/*     */   }
/*     */   public String getFristappralevel() {
/* 233 */     return this.fristappralevel;
/*     */   }
/*     */ 
/*     */   public void setHost_cust_id(String host_cust_idStr) {
/* 237 */     this.host_cust_id = host_cust_idStr;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 240 */     return this.host_cust_id;
/*     */   }
/*     */ 
/*     */   public void setLastlevelkey(String lastlevelkeyStr) {
/* 244 */     this.lastlevelkey = lastlevelkeyStr;
/*     */   }
/*     */   public String getLastlevelkey() {
/* 247 */     return this.lastlevelkey;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd(String party_class_cdStr) {
/* 251 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 254 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setEmendationlevel(String emendationlevelStr) {
/* 258 */     this.emendationlevel = emendationlevelStr;
/*     */   }
/*     */   public String getEmendationlevel() {
/* 261 */     return this.emendationlevel;
/*     */   }
/*     */ 
/*     */   public void setCurr_post(String curr_postStr) {
/* 265 */     this.curr_post = curr_postStr;
/*     */   }
/*     */   public String getCurr_post() {
/* 268 */     return this.curr_post;
/*     */   }
/*     */ 
/*     */   public void setParty_chn_name(String party_chn_nameStr) {
/* 272 */     this.party_chn_name = party_chn_nameStr;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 275 */     return this.party_chn_name;
/*     */   }
/*     */ 
/*     */   public void setModifier(String modifierStr) {
/* 279 */     this.modifier = modifierStr;
/*     */   }
/*     */   public String getModifier() {
/* 282 */     return this.modifier;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date create_dtStr) {
/* 286 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public Date getCreate_dt() {
/* 289 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekeyStr) {
/* 293 */     this.resulekey = resulekeyStr;
/*     */   }
/*     */   public String getResulekey() {
/* 296 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public String getTempcategory() {
/* 300 */     return this.tempcategory;
/*     */   }
/*     */   public void setTempcategory(String tempcategory) {
/* 303 */     this.tempcategory = tempcategory;
/*     */   }
/*     */   public String[] getSelectedResulekey() {
/* 306 */     return this.selectedResulekey;
/*     */   }
/*     */   public void setSelectedResulekey(String[] selectedResulekey) {
/* 309 */     this.selectedResulekey = selectedResulekey;
/*     */   }
/*     */ 
/*     */   public void setModifydate_disp(String modifydate_dispStr) {
/* 313 */     this.modifydate_disp = modifydate_dispStr;
/*     */   }
/*     */   public String getModifydate_disp() {
/* 316 */     return this.modifydate_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr) {
/* 320 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 323 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setReportdt_disp(String reportdt_dispStr) {
/* 327 */     this.reportdt_disp = reportdt_dispStr;
/*     */   }
/*     */   public String getReportdt_disp() {
/* 330 */     return this.reportdt_disp;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt_disp(String create_dt_dispStr) {
/* 334 */     this.create_dt_disp = create_dt_dispStr;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 337 */     return this.create_dt_disp;
/*     */   }
/*     */   public String getMarked() {
/* 340 */     return this.marked;
/*     */   }
/*     */   public void setMarked(String marked) {
/* 343 */     this.marked = marked;
/*     */   }
/*     */ 
/*     */   public String getOrderby() {
/* 347 */     return this.orderby;
/*     */   }
/*     */   public void setOrderby(String orderby) {
/* 350 */     this.orderby = orderby;
/*     */   }
/*     */ 
/*     */   public String getOrder() {
/* 354 */     return this.order;
/*     */   }
/*     */   public void setOrder(String order) {
/* 357 */     this.order = order;
/*     */   }
/*     */   public String getModifydate_disp_end() {
/* 360 */     return this.modifydate_disp_end;
/*     */   }
/*     */   public void setModifydate_disp_end(String modifydateDispEnd) {
/* 363 */     this.modifydate_disp_end = modifydateDispEnd;
/*     */   }
/*     */   public String getStatistic_dt_disp_end() {
/* 366 */     return this.statistic_dt_disp_end;
/*     */   }
/*     */   public void setStatistic_dt_disp_end(String statisticDtDispEnd) {
/* 369 */     this.statistic_dt_disp_end = statisticDtDispEnd;
/*     */   }
/*     */   public String getCreate_dt_disp_end() {
/* 372 */     return this.create_dt_disp_end;
/*     */   }
/*     */   public void setCreate_dt_disp_end(String createDtDispEnd) {
/* 375 */     this.create_dt_disp_end = createDtDispEnd;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 380 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_party_result_uhActionForm
 * JD-Core Version:    0.6.2
 */