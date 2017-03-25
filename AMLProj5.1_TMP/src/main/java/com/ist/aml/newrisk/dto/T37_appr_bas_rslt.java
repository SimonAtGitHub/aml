/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T37_appr_bas_rslt extends BaseDTO
/*     */ {
/*  28 */   private String resulekey = "";
/*     */ 
/*  30 */   private String templatekey = "";
/*     */ 
/*  32 */   private String upelementkey = "";
/*     */ 
/*  34 */   private String granularity = "";
/*     */   private Date statistic_dt;
/*  39 */   private String old_score = "";
/*     */ 
/*  41 */   private String elementkey = "";
/*     */ 
/*  43 */   private String elementname = "";
/*     */ 
/*  45 */   private String party_id = "";
/*     */ 
/*  47 */   private String organkey = "";
/*     */ 
/*  49 */   private String basic_val = "";
/*     */ 
/*  51 */   private String base_score = "";
/*     */ 
/*  53 */   private String score = "";
/*  54 */   private double score_d = 0.0D;
/*     */   private Double element_score;
/*  57 */   private String base_occ = "";
/*  58 */   private double base_occ_d = 0.0D;
/*     */ 
/*  60 */   private String is_last = "";
/*  61 */   private String treelaye = "";
/*     */ 
/*  63 */   private String js_type = "";
/*  64 */   private String js_type_disp = "";
/*     */ 
/*  67 */   private String statistic_dt_disp = "";
/*     */ 
/*     */   public String getResulekey()
/*     */   {
/*  76 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekey) {
/*  80 */     this.resulekey = resulekey;
/*     */   }
/*     */ 
/*     */   public void setUpelementkey(String upelementkeyStr) {
/*  84 */     this.upelementkey = upelementkeyStr;
/*     */   }
/*     */   public String getUpelementkey() {
/*  87 */     return this.upelementkey;
/*     */   }
/*     */ 
/*     */   public void setGranularity(String granularityStr) {
/*  91 */     this.granularity = granularityStr;
/*     */   }
/*     */   public String getGranularity() {
/*  94 */     return this.granularity;
/*     */   }
/*     */ 
/*     */   public void setOld_score(String old_scoreStr)
/*     */   {
/*  99 */     this.old_score = old_scoreStr;
/*     */   }
/*     */   public String getOld_score() {
/* 102 */     return this.old_score;
/*     */   }
/*     */ 
/*     */   public Double getElement_score() {
/* 106 */     return this.element_score;
/*     */   }
/*     */   public void setElement_score(Double elementScore) {
/* 109 */     this.element_score = elementScore;
/*     */   }
/*     */   public void setElementkey(String elementkeyStr) {
/* 112 */     this.elementkey = elementkeyStr;
/*     */   }
/*     */   public String getElementkey() {
/* 115 */     return this.elementkey;
/*     */   }
/*     */ 
/*     */   public String getElementname() {
/* 119 */     return this.elementname;
/*     */   }
/*     */   public void setElementname(String elementname) {
/* 122 */     this.elementname = elementname;
/*     */   }
/*     */   public void setParty_id(String party_idStr) {
/* 125 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 128 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public String getOrgankey() {
/* 132 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkey) {
/* 136 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public String getTemplatekey() {
/* 140 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekey) {
/* 144 */     this.templatekey = templatekey;
/*     */   }
/*     */ 
/*     */   public void setBasic_val(String basic_valStr) {
/* 148 */     this.basic_val = basic_valStr;
/*     */   }
/*     */   public String getBasic_val() {
/* 151 */     return this.basic_val;
/*     */   }
/*     */ 
/*     */   public void setBase_score(String base_scoreStr) {
/* 155 */     this.base_score = base_scoreStr;
/*     */   }
/*     */   public String getBase_score() {
/* 158 */     return this.base_score;
/*     */   }
/*     */ 
/*     */   public String getScore()
/*     */   {
/* 164 */     return this.score;
/*     */   }
/*     */ 
/*     */   public void setScore(String score) {
/* 168 */     this.score = score;
/*     */   }
/*     */ 
/*     */   public double getScore_d() {
/* 172 */     return this.score_d;
/*     */   }
/*     */ 
/*     */   public void setScore_d(double scoreD) {
/* 176 */     this.score_d = scoreD;
/*     */   }
/*     */ 
/*     */   public String getBase_occ() {
/* 180 */     return this.base_occ;
/*     */   }
/*     */ 
/*     */   public void setBase_occ(String baseOcc) {
/* 184 */     this.base_occ = baseOcc;
/*     */   }
/*     */ 
/*     */   public double getBase_occ_d() {
/* 188 */     return this.base_occ_d;
/*     */   }
/*     */ 
/*     */   public void setBase_occ_d(double baseOccD) {
/* 192 */     this.base_occ_d = baseOccD;
/*     */   }
/*     */ 
/*     */   public Date getStatistic_dt() {
/* 196 */     return this.statistic_dt;
/*     */   }
/*     */   public void setStatistic_dt(Date statisticDt) {
/* 199 */     this.statistic_dt = statisticDt;
/*     */   }
/*     */ 
/*     */   public String getTreelaye() {
/* 203 */     return this.treelaye;
/*     */   }
/*     */   public void setTreelaye(String treelaye) {
/* 206 */     this.treelaye = treelaye;
/*     */   }
/*     */ 
/*     */   public String getIs_last() {
/* 210 */     return this.is_last;
/*     */   }
/*     */   public void setIs_last(String isLast) {
/* 213 */     this.is_last = isLast;
/*     */   }
/*     */ 
/*     */   public String getJs_type() {
/* 217 */     return this.js_type;
/*     */   }
/*     */ 
/*     */   public void setJs_type(String jsType) {
/* 221 */     this.js_type = jsType;
/*     */   }
/*     */ 
/*     */   public String getJs_type_disp() {
/* 225 */     return this.js_type_disp;
/*     */   }
/*     */ 
/*     */   public void setJs_type_disp(String jsTypeDisp) {
/* 229 */     this.js_type_disp = jsTypeDisp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr)
/*     */   {
/* 234 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 237 */     return this.statistic_dt_disp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T37_appr_bas_rslt
 * JD-Core Version:    0.6.2
 */