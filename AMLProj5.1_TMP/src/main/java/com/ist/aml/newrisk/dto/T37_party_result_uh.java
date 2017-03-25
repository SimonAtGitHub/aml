/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T37_party_result_uh extends BaseDTO
/*     */ {
/*     */   private static final long serialVersionUID = 7593999822670975110L;
/*  32 */   private String status_cd = "";
/*     */ 
/*  34 */   private String templatekey = "";
/*     */ 
/*  36 */   private String export_status = "";
/*     */ 
/*  38 */   private String party_id = "";
/*     */   private Date modifydate;
/*     */   private Date modifydate_end;
/*  42 */   private String modifydate_disp = "";
/*     */ 
/*  44 */   private String temptype = "";
/*  45 */   private String temptype_disp = "";
/*     */ 
/*  47 */   private String lastcheckflag = "";
/*     */ 
/*  49 */   private String modify_cd = "";
/*  50 */   private String modify_cd_disp = "";
/*     */ 
/*  52 */   private String levelkey = "";
/*  53 */   private String levelkey_disp = "";
/*     */ 
/*  55 */   private String granularity = "";
/*     */   private Date statistic_dt;
/*     */   private Date statistic_dt_end;
/*  59 */   private String statistic_dt_disp = "";
/*     */ 
/*  61 */   private Date reportdt = new Date();
/*     */ 
/*  63 */   private String organkey = "";
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
/*  74 */   private String party_class_cd_disp = "";
/*     */ 
/*  76 */   private String emendationlevel = "";
/*  77 */   private String emendationlevel_disp = "";
/*     */ 
/*  79 */   private String curr_post = "";
/*     */ 
/*  81 */   private String party_chn_name = "";
/*     */ 
/*  83 */   private String modifier = "";
/*     */   private Date create_dt;
/*     */   private Date create_dt_end;
/*  87 */   private String create_dt_disp = "";
/*     */ 
/*  89 */   private String resulekey = "";
/*     */ 
/*  91 */   private String tempcategory = "";
/*     */ 
/*  93 */   private String reportdt_disp = "";
/*     */ 
/*  96 */   private String marked = "";
/*     */ 
/*  98 */   private String organStr = "";
/*     */ 
/* 100 */   private String orderby = "";
/* 101 */   private String order = "";
/*     */ 
/*     */   public void setStatus_cd(String status_cdStr)
/*     */   {
/* 110 */     this.status_cd = status_cdStr;
/*     */   }
/*     */   public String getStatus_cd() {
/* 113 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 117 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 120 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setExport_status(String export_statusStr) {
/* 124 */     this.export_status = export_statusStr;
/*     */   }
/*     */   public String getExport_status() {
/* 127 */     return this.export_status;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String party_idStr) {
/* 131 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 134 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setModifydate(Date modifydateStr) {
/* 138 */     this.modifydate = modifydateStr;
/*     */   }
/*     */   public Date getModifydate() {
/* 141 */     return this.modifydate;
/*     */   }
/*     */ 
/*     */   public void setTemptype(String temptypeStr) {
/* 145 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 148 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public String getTemptype_disp() {
/* 152 */     return this.temptype_disp;
/*     */   }
/*     */   public void setTemptype_disp(String temptypeDisp) {
/* 155 */     this.temptype_disp = temptypeDisp;
/*     */   }
/*     */   public void setLastcheckflag(String lastcheckflagStr) {
/* 158 */     this.lastcheckflag = lastcheckflagStr;
/*     */   }
/*     */   public String getLastcheckflag() {
/* 161 */     return this.lastcheckflag;
/*     */   }
/*     */ 
/*     */   public void setModify_cd(String modify_cdStr) {
/* 165 */     this.modify_cd = modify_cdStr;
/*     */   }
/*     */   public String getModify_cd() {
/* 168 */     return this.modify_cd;
/*     */   }
/*     */ 
/*     */   public String getModify_cd_disp() {
/* 172 */     return this.modify_cd_disp;
/*     */   }
/*     */   public void setModify_cd_disp(String modifyCdDisp) {
/* 175 */     this.modify_cd_disp = modifyCdDisp;
/*     */   }
/*     */   public void setLevelkey(String levelkeyStr) {
/* 178 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 181 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 185 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 188 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt(Date statistic_dtStr) {
/* 192 */     this.statistic_dt = statistic_dtStr;
/*     */   }
/*     */   public Date getStatistic_dt() {
/* 195 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setReportdt(Date reportdtStr) {
/* 199 */     this.reportdt = reportdtStr;
/*     */   }
/*     */   public Date getReportdt() {
/* 202 */     return this.reportdt;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkeyStr) {
/* 206 */     this.organkey = organkeyStr;
/*     */   }
/*     */   public String getOrgankey() {
/* 209 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public void setFristappralevel(String fristappralevelStr) {
/* 213 */     this.fristappralevel = fristappralevelStr;
/*     */   }
/*     */   public String getFristappralevel() {
/* 216 */     return this.fristappralevel;
/*     */   }
/*     */ 
/*     */   public void setHost_cust_id(String host_cust_idStr) {
/* 220 */     this.host_cust_id = host_cust_idStr;
/*     */   }
/*     */   public String getHost_cust_id() {
/* 223 */     return this.host_cust_id;
/*     */   }
/*     */ 
/*     */   public void setLastlevelkey(String lastlevelkeyStr) {
/* 227 */     this.lastlevelkey = lastlevelkeyStr;
/*     */   }
/*     */   public String getLastlevelkey() {
/* 230 */     return this.lastlevelkey;
/*     */   }
/*     */ 
/*     */   public void setParty_class_cd(String party_class_cdStr) {
/* 234 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 237 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public String getParty_class_cd_disp() {
/* 241 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 244 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */   public void setEmendationlevel(String emendationlevelStr) {
/* 247 */     this.emendationlevel = emendationlevelStr;
/*     */   }
/*     */   public String getEmendationlevel() {
/* 250 */     return this.emendationlevel;
/*     */   }
/*     */ 
/*     */   public void setCurr_post(String curr_postStr) {
/* 254 */     this.curr_post = curr_postStr;
/*     */   }
/*     */   public String getCurr_post() {
/* 257 */     return this.curr_post;
/*     */   }
/*     */ 
/*     */   public void setParty_chn_name(String party_chn_nameStr) {
/* 261 */     this.party_chn_name = party_chn_nameStr;
/*     */   }
/*     */   public String getParty_chn_name() {
/* 264 */     return this.party_chn_name;
/*     */   }
/*     */ 
/*     */   public void setModifier(String modifierStr) {
/* 268 */     this.modifier = modifierStr;
/*     */   }
/*     */   public String getModifier() {
/* 271 */     return this.modifier;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date create_dtStr) {
/* 275 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public Date getCreate_dt() {
/* 278 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekeyStr) {
/* 282 */     this.resulekey = resulekeyStr;
/*     */   }
/*     */   public String getResulekey() {
/* 285 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public String getTempcategory() {
/* 289 */     return this.tempcategory;
/*     */   }
/*     */   public void setTempcategory(String tempcategory) {
/* 292 */     this.tempcategory = tempcategory;
/*     */   }
/*     */ 
/*     */   public void setModifydate_disp(String modifydate_dispStr) {
/* 296 */     this.modifydate_disp = modifydate_dispStr;
/*     */   }
/*     */   public String getModifydate_disp() {
/* 299 */     return this.modifydate_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr) {
/* 303 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 306 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setReportdt_disp(String reportdt_dispStr) {
/* 310 */     this.reportdt_disp = reportdt_dispStr;
/*     */   }
/*     */   public String getReportdt_disp() {
/* 313 */     return this.reportdt_disp;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt_disp(String create_dt_dispStr) {
/* 317 */     this.create_dt_disp = create_dt_dispStr;
/*     */   }
/*     */   public String getCreate_dt_disp() {
/* 320 */     return this.create_dt_disp;
/*     */   }
/*     */   public String getMarked() {
/* 323 */     return this.marked;
/*     */   }
/*     */   public void setMarked(String marked) {
/* 326 */     this.marked = marked;
/*     */   }
/*     */ 
/*     */   public String getOrderby() {
/* 330 */     return this.orderby;
/*     */   }
/*     */   public void setOrderby(String orderby) {
/* 333 */     this.orderby = orderby;
/*     */   }
/*     */ 
/*     */   public String getOrder() {
/* 337 */     return this.order;
/*     */   }
/*     */   public void setOrder(String order) {
/* 340 */     this.order = order;
/*     */   }
/*     */   public String getLevelkey_disp() {
/* 343 */     return this.levelkey_disp;
/*     */   }
/*     */   public void setLevelkey_disp(String levelkeyDisp) {
/* 346 */     this.levelkey_disp = levelkeyDisp;
/*     */   }
/*     */   public String getOrgan_name() {
/* 349 */     return this.organ_name;
/*     */   }
/*     */   public void setOrgan_name(String organName) {
/* 352 */     this.organ_name = organName;
/*     */   }
/*     */   public String getFristappralevel_disp() {
/* 355 */     return this.fristappralevel_disp;
/*     */   }
/*     */   public void setFristappralevel_disp(String fristappralevelDisp) {
/* 358 */     this.fristappralevel_disp = fristappralevelDisp;
/*     */   }
/*     */   public String getEmendationlevel_disp() {
/* 361 */     return this.emendationlevel_disp;
/*     */   }
/*     */   public void setEmendationlevel_disp(String emendationlevelDisp) {
/* 364 */     this.emendationlevel_disp = emendationlevelDisp;
/*     */   }
/*     */   public String getOrganStr() {
/* 367 */     return this.organStr;
/*     */   }
/*     */   public void setOrganStr(String organStr) {
/* 370 */     this.organStr = organStr;
/*     */   }
/*     */   public Date getModifydate_end() {
/* 373 */     return this.modifydate_end;
/*     */   }
/*     */   public void setModifydate_end(Date modifydateEnd) {
/* 376 */     this.modifydate_end = modifydateEnd;
/*     */   }
/*     */   public Date getStatistic_dt_end() {
/* 379 */     return this.statistic_dt_end;
/*     */   }
/*     */   public void setStatistic_dt_end(Date statisticDtEnd) {
/* 382 */     this.statistic_dt_end = statisticDtEnd;
/*     */   }
/*     */   public Date getCreate_dt_end() {
/* 385 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(Date createDtEnd) {
/* 388 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T37_party_result_uh
 * JD-Core Version:    0.6.2
 */