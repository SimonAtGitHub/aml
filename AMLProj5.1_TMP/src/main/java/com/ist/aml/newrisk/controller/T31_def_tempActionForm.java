/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T31_def_tempActionForm extends ActionForm
/*     */ {
/*  33 */   private String tempcategory = "";
/*     */ 
/*  35 */   private Integer calculateseq = new Integer(0);
/*  36 */   private String calculateseq_str = "";
/*     */ 
/*  38 */   private String party_class_cd = "";
/*     */ 
/*  40 */   private String risk_table = "";
/*     */ 
/*  42 */   private String create_org = "";
/*     */ 
/*  44 */   private String templatekey = "";
/*     */ 
/*  46 */   private String sqlkey = "";
/*     */   private String[] sqlkeys;
/*  49 */   private String sqlgranularity = "";
/*  50 */   private String sqlgranularity_disp = "";
/*     */ 
/*  52 */   private String datagranularity = "";
/*     */ 
/*  54 */   private String temptype = "";
/*  55 */   private String temptype_disp = "";
/*     */ 
/*  57 */   private String granularity = "";
/*     */ 
/*  59 */   private String flag = "";
/*     */ 
/*  61 */   private String is_build = "";
/*     */ 
/*  63 */   private String coverflag = "";
/*     */ 
/*  65 */   private String tag = "";
/*     */ 
/*  67 */   private String modify_user = "";
/*     */ 
/*  69 */   private String create_user = "";
/*     */ 
/*  71 */   private String templatename = "";
/*     */ 
/*  73 */   private String templatename_s = "";
/*     */ 
/*  75 */   private String create_dt = "";
/*  76 */   private String create_dt_start = "";
/*  77 */   private String create_dt_end = "";
/*     */ 
/*  79 */   private String modify_dt = "";
/*     */ 
/*  81 */   private String des = "";
/*     */   private String[] templatekeys;
/*     */ 
/*     */   public void setTempcategory(String tempcategoryStr)
/*     */   {
/*  92 */     this.tempcategory = tempcategoryStr;
/*     */   }
/*     */   public String getTempcategory() {
/*  95 */     return this.tempcategory;
/*     */   }
/*     */ 
/*     */   public Integer getCalculateseq()
/*     */   {
/* 100 */     return this.calculateseq;
/*     */   }
/*     */   public void setCalculateseq(Integer calculateseq) {
/* 103 */     this.calculateseq = calculateseq;
/*     */   }
/*     */   public String getCalculateseq_str() {
/* 106 */     return this.calculateseq_str;
/*     */   }
/*     */   public void setCalculateseq_str(String calculateseqStr) {
/* 109 */     this.calculateseq_str = calculateseqStr;
/*     */   }
/*     */   public void setparty_class_cd(String party_class_cdStr) {
/* 112 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getparty_class_cd() {
/* 115 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setRisk_table(String risk_tableStr) {
/* 119 */     this.risk_table = risk_tableStr;
/*     */   }
/*     */   public String getRisk_table() {
/* 122 */     return this.risk_table;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/* 126 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/* 129 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 133 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 136 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setSqlgranularity(String sqlgranularityStr) {
/* 140 */     this.sqlgranularity = sqlgranularityStr;
/*     */   }
/*     */   public String getSqlgranularity() {
/* 143 */     return this.sqlgranularity;
/*     */   }
/*     */ 
/*     */   public String getSqlgranularity_disp() {
/* 147 */     return this.sqlgranularity_disp;
/*     */   }
/*     */   public void setSqlgranularity_disp(String sqlgranularityDisp) {
/* 150 */     this.sqlgranularity_disp = sqlgranularityDisp;
/*     */   }
/*     */   public void setTemptype(String temptypeStr) {
/* 153 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 156 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public String getTemptype_disp() {
/* 160 */     return this.temptype_disp;
/*     */   }
/*     */   public void setTemptype_disp(String temptypeDisp) {
/* 163 */     this.temptype_disp = temptypeDisp;
/*     */   }
/*     */   public void setGranularity(String granularityStr) {
/* 166 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 169 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/* 173 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 176 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setIs_build(String is_buildStr) {
/* 180 */     this.is_build = is_buildStr;
/*     */   }
/*     */   public String getIs_build() {
/* 183 */     return this.is_build;
/*     */   }
/*     */ 
/*     */   public String getParty_class_cd() {
/* 187 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 190 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */ 
/*     */   public String getCoverflag() {
/* 194 */     return this.coverflag;
/*     */   }
/*     */   public void setCoverflag(String coverflag) {
/* 197 */     this.coverflag = coverflag;
/*     */   }
/*     */ 
/*     */   public void setTag(String tagStr) {
/* 201 */     this.tag = tagStr;
/*     */   }
/*     */   public String getTag() {
/* 204 */     return this.tag;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 208 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 211 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 215 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 218 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setTemplatename(String templatenameStr) {
/* 222 */     this.templatename = templatenameStr;
/*     */   }
/*     */   public String getTemplatename() {
/* 225 */     return this.templatename;
/*     */   }
/*     */ 
/*     */   public String getTemplatename_s() {
/* 229 */     return this.templatename_s;
/*     */   }
/*     */   public void setTemplatename_s(String templatenameS) {
/* 232 */     this.templatename_s = templatenameS;
/*     */   }
/*     */   public void setCreate_dt(String create_dtStr) {
/* 235 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 238 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public String getCreate_dt_start() {
/* 242 */     return this.create_dt_start;
/*     */   }
/*     */   public void setCreate_dt_start(String createDtStart) {
/* 245 */     this.create_dt_start = createDtStart;
/*     */   }
/*     */   public String getCreate_dt_end() {
/* 248 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(String createDtEnd) {
/* 251 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public void setModify_dt(String modify_dtStr) {
/* 254 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 257 */     return this.modify_dt;
/*     */   }
/*     */ 
/*     */   public String getDatagranularity() {
/* 261 */     return this.datagranularity;
/*     */   }
/*     */   public void setDatagranularity(String datagranularity) {
/* 264 */     this.datagranularity = datagranularity;
/*     */   }
/*     */   public void setDes(String desStr) {
/* 267 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 270 */     return this.des;
/*     */   }
/*     */ 
/*     */   public String[] getTemplatekeys() {
/* 274 */     return this.templatekeys;
/*     */   }
/*     */   public void setTemplatekeys(String[] templatekeys) {
/* 277 */     this.templatekeys = templatekeys;
/*     */   }
/*     */   public String getSqlkey() {
/* 280 */     return this.sqlkey;
/*     */   }
/*     */   public void setSqlkey(String sqlkey) {
/* 283 */     this.sqlkey = sqlkey;
/*     */   }
/*     */   public String[] getSqlkeys() {
/* 286 */     return this.sqlkeys;
/*     */   }
/*     */   public void setSqlkeys(String[] sqlkeys) {
/* 289 */     this.sqlkeys = sqlkeys;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 295 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_tempActionForm
 * JD-Core Version:    0.6.2
 */