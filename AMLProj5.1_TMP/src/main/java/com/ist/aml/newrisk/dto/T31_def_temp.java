/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ 
/*     */ public class T31_def_temp extends BaseDTO
/*     */ {
/*  26 */   private String tempcategory = "";
/*  27 */   private String tempcategory_disp = "";
/*     */ 
/*  29 */   private Integer calculateseq = new Integer(1);
/*  30 */   private String calculateseq_str = "";
/*     */ 
/*  32 */   private String party_class_cd = "";
/*  33 */   private String party_class_cd_disp = "";
/*     */ 
/*  35 */   private String risk_table = "";
/*     */ 
/*  37 */   private String templatekey = "";
/*     */ 
/*  39 */   private String templatekey_temp = "";
/*     */ 
/*  41 */   private String sqlgranularity = "";
/*  42 */   private String sqlgranularity_disp = "";
/*     */ 
/*  44 */   private String datagranularity = "";
/*  45 */   private String datagranularity_disp = "";
/*     */ 
/*  47 */   private String temptype = "";
/*     */ 
/*  49 */   private String granularity = "";
/*  50 */   private String granularity_disp = "";
/*     */ 
/*  52 */   private String flag = "";
/*  53 */   private String flag_disp = "";
/*     */ 
/*  55 */   private String is_build = "";
/*     */ 
/*  57 */   private String coverflag = "";
/*  58 */   private String coverflag_disp = "";
/*     */ 
/*  60 */   private String tag = "";
/*     */ 
/*  62 */   private String modify_user = "";
/*     */ 
/*  64 */   private String create_user = "";
/*     */ 
/*  66 */   private String create_org = "";
/*  67 */   private String organkeystr = "";
/*     */ 
/*  69 */   private String templatename = "";
/*     */ 
/*  71 */   private String create_dt = "";
/*  72 */   private String create_dt_start = "";
/*  73 */   private String create_dt_end = "";
/*     */ 
/*  75 */   private String modify_dt = "";
/*     */ 
/*  77 */   private String des = "";
/*     */ 
/*  80 */   private String sqlkey = "";
/*     */   private String[] sqlkeys;
/*  83 */   private String calsql = "";
/*     */ 
/*  85 */   private String sql_str = "";
/*     */ 
/*  87 */   private String copy_key = "";
/*     */   private String[] templatekeys;
/*     */ 
/*     */   public void setTempcategory(String tempcategoryStr)
/*     */   {
/*  98 */     this.tempcategory = tempcategoryStr;
/*     */   }
/*     */   public String getTempcategory() {
/* 101 */     return this.tempcategory;
/*     */   }
/*     */ 
/*     */   public Integer getCalculateseq()
/*     */   {
/* 106 */     return this.calculateseq;
/*     */   }
/*     */   public void setCalculateseq(Integer calculateseq) {
/* 109 */     this.calculateseq = calculateseq;
/*     */   }
/*     */   public String getCalculateseq_str() {
/* 112 */     return this.calculateseq_str;
/*     */   }
/*     */   public void setCalculateseq_str(String calculateseqStr) {
/* 115 */     this.calculateseq_str = calculateseqStr;
/*     */   }
/*     */   public void setParty_class_cd(String party_class_cdStr) {
/* 118 */     this.party_class_cd = party_class_cdStr;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 121 */     return this.party_class_cd;
/*     */   }
/*     */ 
/*     */   public void setRisk_table(String risk_tableStr) {
/* 125 */     this.risk_table = risk_tableStr;
/*     */   }
/*     */   public String getRisk_table() {
/* 128 */     return this.risk_table;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/* 132 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/* 135 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public String getOrgankeystr() {
/* 139 */     return this.organkeystr;
/*     */   }
/*     */   public void setOrgankeystr(String organkeystr) {
/* 142 */     this.organkeystr = organkeystr;
/*     */   }
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 145 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 148 */     return this.templatekey;
/*     */   }
/*     */   public String getTemplatekey_temp() {
/* 151 */     return this.templatekey_temp;
/*     */   }
/*     */   public void setTemplatekey_temp(String templatekeyTemp) {
/* 154 */     this.templatekey_temp = templatekeyTemp;
/*     */   }
/*     */   public void setSqlgranularity(String sqlgranularityStr) {
/* 157 */     this.sqlgranularity = sqlgranularityStr;
/*     */   }
/*     */   public String getSqlgranularity() {
/* 160 */     return this.sqlgranularity;
/*     */   }
/*     */   public String getSqlgranularity_disp() {
/* 163 */     return this.sqlgranularity_disp;
/*     */   }
/*     */   public void setSqlgranularity_disp(String sqlgranularityDisp) {
/* 166 */     this.sqlgranularity_disp = sqlgranularityDisp;
/*     */   }
/*     */   public String getDatagranularity() {
/* 169 */     return this.datagranularity;
/*     */   }
/*     */   public void setDatagranularity(String datagranularity) {
/* 172 */     this.datagranularity = datagranularity;
/*     */   }
/*     */   public String getDatagranularity_disp() {
/* 175 */     return this.datagranularity_disp;
/*     */   }
/*     */   public void setDatagranularity_disp(String datagranularityDisp) {
/* 178 */     this.datagranularity_disp = datagranularityDisp;
/*     */   }
/*     */   public void setTemptype(String temptypeStr) {
/* 181 */     this.temptype = temptypeStr;
/*     */   }
/*     */   public String getTemptype() {
/* 184 */     return this.temptype;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 188 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 191 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public String getGranularity_disp() {
/* 195 */     return this.granularity_disp;
/*     */   }
/*     */   public void setGranularity_disp(String granularityDisp) {
/* 198 */     this.granularity_disp = granularityDisp;
/*     */   }
/*     */   public void setFlag(String flagStr) {
/* 201 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 204 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public String getTempcategory_disp() {
/* 208 */     return this.tempcategory_disp;
/*     */   }
/*     */   public void setTempcategory_disp(String tempcategoryDisp) {
/* 211 */     this.tempcategory_disp = tempcategoryDisp;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 214 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 217 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */   public String getFlag_disp() {
/* 220 */     return this.flag_disp;
/*     */   }
/*     */   public void setFlag_disp(String flagDisp) {
/* 223 */     this.flag_disp = flagDisp;
/*     */   }
/*     */   public void setIs_build(String is_buildStr) {
/* 226 */     this.is_build = is_buildStr;
/*     */   }
/*     */   public String getIs_build() {
/* 229 */     return this.is_build;
/*     */   }
/*     */ 
/*     */   public String getCoverflag() {
/* 233 */     return this.coverflag;
/*     */   }
/*     */   public void setCoverflag(String coverflag) {
/* 236 */     this.coverflag = coverflag;
/*     */   }
/*     */   public String getCoverflag_disp() {
/* 239 */     return this.coverflag_disp;
/*     */   }
/*     */   public void setCoverflag_disp(String coverflagDisp) {
/* 242 */     this.coverflag_disp = coverflagDisp;
/*     */   }
/*     */   public void setTag(String tagStr) {
/* 245 */     this.tag = tagStr;
/*     */   }
/*     */   public String getTag() {
/* 248 */     return this.tag;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 252 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 255 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 259 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 262 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setTemplatename(String templatenameStr) {
/* 266 */     this.templatename = templatenameStr;
/*     */   }
/*     */   public String getTemplatename() {
/* 269 */     return this.templatename;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 273 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 276 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public String getCreate_dt_start() {
/* 280 */     return this.create_dt_start;
/*     */   }
/*     */   public void setCreate_dt_start(String createDtStart) {
/* 283 */     this.create_dt_start = createDtStart;
/*     */   }
/*     */   public String getCreate_dt_end() {
/* 286 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(String createDtEnd) {
/* 289 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public void setModify_dt(String modify_dtStr) {
/* 292 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 295 */     return this.modify_dt;
/*     */   }
/*     */ 
/*     */   public void setDes(String desStr) {
/* 299 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 302 */     return this.des;
/*     */   }
/*     */   public String getSqlkey() {
/* 305 */     return this.sqlkey;
/*     */   }
/*     */   public void setSqlkey(String sqlkey) {
/* 308 */     this.sqlkey = sqlkey;
/*     */   }
/*     */   public String[] getSqlkeys() {
/* 311 */     return this.sqlkeys;
/*     */   }
/*     */   public void setSqlkeys(String[] sqlkeys) {
/* 314 */     this.sqlkeys = sqlkeys;
/*     */   }
/*     */   public String getCalsql() {
/* 317 */     return this.calsql;
/*     */   }
/*     */   public void setCalsql(String calsql) {
/* 320 */     this.calsql = calsql;
/*     */   }
/*     */   public String getSql_str() {
/* 323 */     return this.sql_str;
/*     */   }
/*     */   public void setSql_str(String sqlStr) {
/* 326 */     this.sql_str = sqlStr;
/*     */   }
/*     */   public String getCopy_key() {
/* 329 */     return this.copy_key;
/*     */   }
/*     */   public void setCopy_key(String copyKey) {
/* 332 */     this.copy_key = copyKey;
/*     */   }
/*     */   public String[] getTemplatekeys() {
/* 335 */     return this.templatekeys;
/*     */   }
/*     */   public void setTemplatekeys(String[] templatekeys) {
/* 338 */     this.templatekeys = templatekeys;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_def_temp
 * JD-Core Version:    0.6.2
 */