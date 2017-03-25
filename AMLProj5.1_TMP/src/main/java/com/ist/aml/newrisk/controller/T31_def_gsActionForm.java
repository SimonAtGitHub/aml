/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T31_def_gsActionForm extends ActionForm
/*     */ {
/*  33 */   private String gskey = "";
/*     */ 
/*  35 */   private String create_org = "";
/*     */ 
/*  37 */   private String templatekey = "";
/*     */ 
/*  39 */   private String templatename = "";
/*     */ 
/*  41 */   private String gsrm = "";
/*     */ 
/*  44 */   private String party_class_cd = "";
/*  45 */   private String party_class_cd_disp = "";
/*  46 */   private String levelkey = "";
/*     */ 
/*  48 */   private String granularity = "";
/*     */ 
/*  50 */   private String flag = "";
/*  51 */   private String flag_disp = "";
/*     */ 
/*  53 */   private String gsname = "";
/*     */ 
/*  55 */   private String modify_user = "";
/*     */ 
/*  57 */   private String create_user = "";
/*     */ 
/*  59 */   private String create_dt = "";
/*  60 */   private String create_dt_start = "";
/*  61 */   private String create_dt_end = "";
/*     */ 
/*  63 */   private Integer calseq = new Integer(1);
/*  64 */   private String calseq_str = "";
/*     */ 
/*  66 */   private String modify_dt = "";
/*     */ 
/*  68 */   private String des = "";
/*     */ 
/*  70 */   private String indickey = "";
/*  71 */   private String indicname = "";
/*     */ 
/*  73 */   private String valnum = "";
/*     */ 
/*  75 */   private String is_sum = "";
/*     */ 
/*  77 */   private String valtype = "";
/*     */ 
/*  79 */   private Long valparamin = null;
/*  80 */   private Long valparamin1 = null;
/*  81 */   private String valparamin_str = "";
/*     */ 
/*  83 */   private Long valparamax = null;
/*  84 */   private String valparamax_str = "";
/*     */   private String[] gskeys;
/*     */ 
/*     */   public void setGskey(String gskeyStr)
/*     */   {
/*  95 */     this.gskey = gskeyStr;
/*     */   }
/*     */   public String getGskey() {
/*  98 */     return this.gskey;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/* 102 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/* 105 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 109 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 112 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setGsrm(String gsrmStr) {
/* 116 */     this.gsrm = gsrmStr;
/*     */   }
/*     */   public String getGsrm() {
/* 119 */     return this.gsrm;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/* 123 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 126 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 130 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 133 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/* 137 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 140 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setGsname(String gsnameStr) {
/* 144 */     this.gsname = gsnameStr;
/*     */   }
/*     */   public String getGsname() {
/* 147 */     return this.gsname;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 151 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 154 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 158 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 161 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 165 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 168 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public Integer getCalseq() {
/* 172 */     return this.calseq;
/*     */   }
/*     */   public void setCalseq(Integer calseq) {
/* 175 */     this.calseq = calseq;
/*     */   }
/*     */   public String getCalseq_str() {
/* 178 */     return this.calseq_str;
/*     */   }
/*     */   public void setCalseq_str(String calseqStr) {
/* 181 */     this.calseq_str = calseqStr;
/*     */   }
/*     */   public void setModify_dt(String modify_dtStr) {
/* 184 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 187 */     return this.modify_dt;
/*     */   }
/*     */ 
/*     */   public void setDes(String desStr) {
/* 191 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 194 */     return this.des;
/*     */   }
/*     */ 
/*     */   public String getTemplatename() {
/* 198 */     return this.templatename;
/*     */   }
/*     */   public void setTemplatename(String templatename) {
/* 201 */     this.templatename = templatename;
/*     */   }
/*     */   public String getFlag_disp() {
/* 204 */     return this.flag_disp;
/*     */   }
/*     */   public void setFlag_disp(String flagDisp) {
/* 207 */     this.flag_disp = flagDisp;
/*     */   }
/*     */   public String getCreate_dt_start() {
/* 210 */     return this.create_dt_start;
/*     */   }
/*     */   public void setCreate_dt_start(String createDtStart) {
/* 213 */     this.create_dt_start = createDtStart;
/*     */   }
/*     */   public String getCreate_dt_end() {
/* 216 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(String createDtEnd) {
/* 219 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public String getIndickey() {
/* 222 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 225 */     this.indickey = indickey;
/*     */   }
/*     */   public String getIndicname() {
/* 228 */     return this.indicname;
/*     */   }
/*     */   public void setIndicname(String indicname) {
/* 231 */     this.indicname = indicname;
/*     */   }
/*     */   public String getValnum() {
/* 234 */     return this.valnum;
/*     */   }
/*     */   public void setValnum(String valnum) {
/* 237 */     this.valnum = valnum;
/*     */   }
/*     */   public String getIs_sum() {
/* 240 */     return this.is_sum;
/*     */   }
/*     */   public void setIs_sum(String isSum) {
/* 243 */     this.is_sum = isSum;
/*     */   }
/*     */   public String getValtype() {
/* 246 */     return this.valtype;
/*     */   }
/*     */   public void setValtype(String valtype) {
/* 249 */     this.valtype = valtype;
/*     */   }
/*     */ 
/*     */   public Long getValparamin() {
/* 253 */     return this.valparamin;
/*     */   }
/*     */   public void setValparamin(Long valparamin) {
/* 256 */     this.valparamin = valparamin;
/*     */   }
/*     */   public Long getValparamin1() {
/* 259 */     return this.valparamin1;
/*     */   }
/*     */   public void setValparamin1(Long valparamin1) {
/* 262 */     this.valparamin1 = valparamin1;
/*     */   }
/*     */   public String getValparamin_str() {
/* 265 */     return this.valparamin_str;
/*     */   }
/*     */   public void setValparamin_str(String valparaminStr) {
/* 268 */     this.valparamin_str = valparaminStr;
/*     */   }
/*     */   public Long getValparamax() {
/* 271 */     return this.valparamax;
/*     */   }
/*     */   public void setValparamax(Long valparamax) {
/* 274 */     this.valparamax = valparamax;
/*     */   }
/*     */   public String getValparamax_str() {
/* 277 */     return this.valparamax_str;
/*     */   }
/*     */   public void setValparamax_str(String valparamaxStr) {
/* 280 */     this.valparamax_str = valparamaxStr;
/*     */   }
/*     */   public String[] getGskeys() {
/* 283 */     return this.gskeys;
/*     */   }
/*     */   public void setGskeys(String[] gskeys) {
/* 286 */     this.gskeys = gskeys;
/*     */   }
/*     */ 
/*     */   public String getParty_class_cd() {
/* 290 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 293 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 296 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 299 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 305 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_gsActionForm
 * JD-Core Version:    0.6.2
 */