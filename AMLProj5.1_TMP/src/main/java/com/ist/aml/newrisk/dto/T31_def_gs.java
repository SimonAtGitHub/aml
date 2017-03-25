/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ 
/*     */ public class T31_def_gs extends BaseDTO
/*     */ {
/*  26 */   private String gskey = "";
/*     */ 
/*  28 */   private String create_org = "";
/*     */ 
/*  30 */   private String templatekey = "";
/*     */ 
/*  32 */   private String templatename = "";
/*     */ 
/*  34 */   private String gsrm = "";
/*     */ 
/*  36 */   private String party_class_cd = "";
/*  37 */   private String party_class_cd_disp = "";
/*     */ 
/*  39 */   private String levelkey = "";
/*  40 */   private String level_disp = "";
/*     */ 
/*  42 */   private String granularity = "";
/*  43 */   private String granularity_disp = "";
/*     */ 
/*  45 */   private String flag = "";
/*  46 */   private String flag_disp = "";
/*     */ 
/*  48 */   private String gsname = "";
/*     */ 
/*  50 */   private String modify_user = "";
/*     */ 
/*  52 */   private String create_user = "";
/*     */ 
/*  54 */   private String create_dt = "";
/*  55 */   private String create_dt_start = "";
/*  56 */   private String create_dt_end = "";
/*     */ 
/*  58 */   private Integer calseq = new Integer(1);
/*  59 */   private String calseq_str = "";
/*     */ 
/*  61 */   private String modify_dt = "";
/*     */ 
/*  63 */   private String des = "";
/*     */ 
/*  65 */   private String indickey = "";
/*  66 */   private String indicname = "";
/*     */ 
/*  68 */   private String valnum = "";
/*     */ 
/*  70 */   private String is_sum = "";
/*     */ 
/*  72 */   private String valtype = "";
/*     */ 
/*  74 */   private Long valparamin = null;
/*  75 */   private Long valparamin1 = null;
/*  76 */   private String valparamin_str = "";
/*     */ 
/*  78 */   private Long valparamax = null;
/*  79 */   private String valparamax_str = "";
/*     */   private String[] gskeys;
/*     */ 
/*     */   public void setGskey(String gskeyStr)
/*     */   {
/*  91 */     this.gskey = gskeyStr;
/*     */   }
/*     */   public String getGskey() {
/*  94 */     return this.gskey;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/*  98 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/* 101 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/* 105 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 108 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setGsrm(String gsrmStr) {
/* 112 */     this.gsrm = gsrmStr;
/*     */   }
/*     */   public String getGsrm() {
/* 115 */     return this.gsrm;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/* 119 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 122 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public String getLevel_disp() {
/* 126 */     return this.level_disp;
/*     */   }
/*     */   public void setLevel_disp(String levelDisp) {
/* 129 */     this.level_disp = levelDisp;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/* 133 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/* 136 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public String getGranularity_disp() {
/* 140 */     return this.granularity_disp;
/*     */   }
/*     */   public void setGranularity_disp(String granularityDisp) {
/* 143 */     this.granularity_disp = granularityDisp;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/* 147 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 150 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setGsname(String gsnameStr) {
/* 154 */     this.gsname = gsnameStr;
/*     */   }
/*     */   public String getGsname() {
/* 157 */     return this.gsname;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 161 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 164 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 168 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 171 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 175 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 178 */     return this.create_dt;
/*     */   }
/*     */   public Integer getCalseq() {
/* 181 */     return this.calseq;
/*     */   }
/*     */   public void setCalseq(Integer calseq) {
/* 184 */     this.calseq = calseq;
/*     */   }
/*     */   public String getCalseq_str() {
/* 187 */     return this.calseq_str;
/*     */   }
/*     */   public void setCalseq_str(String calseqStr) {
/* 190 */     this.calseq_str = calseqStr;
/*     */   }
/*     */   public void setModify_dt(String modify_dtStr) {
/* 193 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 196 */     return this.modify_dt;
/*     */   }
/*     */ 
/*     */   public void setDes(String desStr) {
/* 200 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 203 */     return this.des;
/*     */   }
/*     */   public String getTemplatename() {
/* 206 */     return this.templatename;
/*     */   }
/*     */   public void setTemplatename(String templatename) {
/* 209 */     this.templatename = templatename;
/*     */   }
/*     */   public String getFlag_disp() {
/* 212 */     return this.flag_disp;
/*     */   }
/*     */   public void setFlag_disp(String flagDisp) {
/* 215 */     this.flag_disp = flagDisp;
/*     */   }
/*     */   public String getCreate_dt_start() {
/* 218 */     return this.create_dt_start;
/*     */   }
/*     */   public void setCreate_dt_start(String createDtStart) {
/* 221 */     this.create_dt_start = createDtStart;
/*     */   }
/*     */   public String getCreate_dt_end() {
/* 224 */     return this.create_dt_end;
/*     */   }
/*     */   public void setCreate_dt_end(String createDtEnd) {
/* 227 */     this.create_dt_end = createDtEnd;
/*     */   }
/*     */   public String getIndickey() {
/* 230 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 233 */     this.indickey = indickey;
/*     */   }
/*     */   public String getIndicname() {
/* 236 */     return this.indicname;
/*     */   }
/*     */   public void setIndicname(String indicname) {
/* 239 */     this.indicname = indicname;
/*     */   }
/*     */   public String getValnum() {
/* 242 */     return this.valnum;
/*     */   }
/*     */   public void setValnum(String valnum) {
/* 245 */     this.valnum = valnum;
/*     */   }
/*     */   public String getIs_sum() {
/* 248 */     return this.is_sum;
/*     */   }
/*     */   public void setIs_sum(String isSum) {
/* 251 */     this.is_sum = isSum;
/*     */   }
/*     */   public String getValtype() {
/* 254 */     return this.valtype;
/*     */   }
/*     */   public void setValtype(String valtype) {
/* 257 */     this.valtype = valtype;
/*     */   }
/*     */   public Long getValparamin() {
/* 260 */     return this.valparamin;
/*     */   }
/*     */   public void setValparamin(Long valparamin) {
/* 263 */     this.valparamin = valparamin;
/*     */   }
/*     */   public Long getValparamin1() {
/* 266 */     return this.valparamin1;
/*     */   }
/*     */   public void setValparamin1(Long valparamin1) {
/* 269 */     this.valparamin1 = valparamin1;
/*     */   }
/*     */   public String getValparamin_str() {
/* 272 */     return this.valparamin_str;
/*     */   }
/*     */   public void setValparamin_str(String valparaminStr) {
/* 275 */     this.valparamin_str = valparaminStr;
/*     */   }
/*     */   public Long getValparamax() {
/* 278 */     return this.valparamax;
/*     */   }
/*     */   public void setValparamax(Long valparamax) {
/* 281 */     this.valparamax = valparamax;
/*     */   }
/*     */   public String getValparamax_str() {
/* 284 */     return this.valparamax_str;
/*     */   }
/*     */   public void setValparamax_str(String valparamaxStr) {
/* 287 */     this.valparamax_str = valparamaxStr;
/*     */   }
/*     */   public String[] getGskeys() {
/* 290 */     return this.gskeys;
/*     */   }
/*     */   public void setGskeys(String[] gskeys) {
/* 293 */     this.gskeys = gskeys;
/*     */   }
/*     */   public String getParty_class_cd() {
/* 296 */     return this.party_class_cd;
/*     */   }
/*     */   public void setParty_class_cd(String partyClassCd) {
/* 299 */     this.party_class_cd = partyClassCd;
/*     */   }
/*     */   public String getParty_class_cd_disp() {
/* 302 */     return this.party_class_cd_disp;
/*     */   }
/*     */   public void setParty_class_cd_disp(String partyClassCdDisp) {
/* 305 */     this.party_class_cd_disp = partyClassCdDisp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_def_gs
 * JD-Core Version:    0.6.2
 */