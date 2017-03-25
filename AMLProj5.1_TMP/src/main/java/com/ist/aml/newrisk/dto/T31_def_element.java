/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ 
/*     */ public class T31_def_element extends BaseDTO
/*     */ {
/*  26 */   private String treelaye = "";
/*     */ 
/*  28 */   private String caltype = "";
/*  29 */   private String caltype_disp = "";
/*     */ 
/*  31 */   private String elementkey = "";
/*     */ 
/*  33 */   private String indickey = "";
/*     */ 
/*  35 */   private String valnum = "0";
/*  36 */   private String[] elementkeys = null;
/*     */ 
/*  38 */   private String templatekey = "";
/*     */ 
/*  40 */   private String base_score = "";
/*     */ 
/*  42 */   private double base_score_d = 0.0D;
/*     */ 
/*  44 */   private String base_occ = "";
/*     */ 
/*  46 */   private double base_occ_d = 0.0D;
/*     */ 
/*  48 */   private String is_last = "";
/*     */ 
/*  50 */   private String is_sum = "0";
/*     */ 
/*  52 */   private String element_score = "";
/*     */ 
/*  54 */   private double element_score_d = 0.0D;
/*     */ 
/*  56 */   private String upelementkey = "";
/*     */ 
/*  58 */   private String elementname = "";
/*     */ 
/*  60 */   private String riskcaltype = "";
/*     */ 
/*  62 */   private String js_type = "";
/*     */ 
/*  64 */   private String des = "";
/*     */ 
/*  66 */   private String is_audit = "";
/*  67 */   private String is_audit_disp = "";
/*     */ 
/*     */   public void setTreelaye(String treelayeStr)
/*     */   {
/*  76 */     this.treelaye = treelayeStr;
/*     */   }
/*     */   public String getTreelaye() {
/*  79 */     return this.treelaye;
/*     */   }
/*     */ 
/*     */   public void setCaltype(String caltypeStr) {
/*  83 */     this.caltype = caltypeStr;
/*     */   }
/*     */   public String getCaltype() {
/*  86 */     return this.caltype;
/*     */   }
/*     */ 
/*     */   public void setElementkey(String elementkeyStr) {
/*  90 */     this.elementkey = elementkeyStr;
/*     */   }
/*     */   public String getElementkey() {
/*  93 */     return this.elementkey;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/*  97 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/* 100 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setBase_score(String base_scoreStr) {
/* 104 */     this.base_score = base_scoreStr;
/*     */   }
/*     */   public String getBase_score() {
/* 107 */     return this.base_score;
/*     */   }
/*     */ 
/*     */   public void setBase_occ(String base_occStr) {
/* 111 */     this.base_occ = base_occStr;
/*     */   }
/*     */   public String getBase_occ() {
/* 114 */     return this.base_occ;
/*     */   }
/*     */ 
/*     */   public void setIs_last(String is_lastStr) {
/* 118 */     this.is_last = is_lastStr;
/*     */   }
/*     */   public String getIs_last() {
/* 121 */     return this.is_last;
/*     */   }
/*     */ 
/*     */   public void setIs_sum(String is_sumStr) {
/* 125 */     this.is_sum = is_sumStr;
/*     */   }
/*     */   public String getIs_sum() {
/* 128 */     return this.is_sum;
/*     */   }
/*     */ 
/*     */   public void setElement_score(String element_scoreStr) {
/* 132 */     this.element_score = element_scoreStr;
/*     */   }
/*     */   public String getElement_score() {
/* 135 */     return this.element_score;
/*     */   }
/*     */ 
/*     */   public void setUpelementkey(String upelementkeyStr) {
/* 139 */     this.upelementkey = upelementkeyStr;
/*     */   }
/*     */   public String getUpelementkey() {
/* 142 */     return this.upelementkey;
/*     */   }
/*     */ 
/*     */   public void setElementname(String elementnameStr) {
/* 146 */     this.elementname = elementnameStr;
/*     */   }
/*     */   public String getElementname() {
/* 149 */     return this.elementname;
/*     */   }
/*     */ 
/*     */   public void setRiskcaltype(String riskcaltypeStr) {
/* 153 */     this.riskcaltype = riskcaltypeStr;
/*     */   }
/*     */   public String getRiskcaltype() {
/* 156 */     return this.riskcaltype;
/*     */   }
/*     */ 
/*     */   public void setDes(String desStr) {
/* 160 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 163 */     return this.des;
/*     */   }
/*     */   public double getBase_score_d() {
/* 166 */     return this.base_score_d;
/*     */   }
/*     */   public void setBase_score_d(double baseScoreD) {
/* 169 */     this.base_score_d = baseScoreD;
/*     */   }
/*     */   public double getBase_occ_d() {
/* 172 */     return this.base_occ_d;
/*     */   }
/*     */   public void setBase_occ_d(double baseOccD) {
/* 175 */     this.base_occ_d = baseOccD;
/*     */   }
/*     */   public double getElement_score_d() {
/* 178 */     return this.element_score_d;
/*     */   }
/*     */   public void setElement_score_d(double elementScoreD) {
/* 181 */     this.element_score_d = elementScoreD;
/*     */   }
/*     */   public String[] getElementkeys() {
/* 184 */     return this.elementkeys;
/*     */   }
/*     */   public void setElementkeys(String[] elementkeys) {
/* 187 */     this.elementkeys = elementkeys;
/*     */   }
/*     */   public String getIndickey() {
/* 190 */     return this.indickey;
/*     */   }
/*     */   public void setIndickey(String indickey) {
/* 193 */     this.indickey = indickey;
/*     */   }
/*     */ 
/*     */   public String getCaltype_disp() {
/* 197 */     return this.caltype_disp;
/*     */   }
/*     */   public void setCaltype_disp(String caltypeDisp) {
/* 200 */     this.caltype_disp = caltypeDisp;
/*     */   }
/*     */   public String getJs_type() {
/* 203 */     return this.js_type;
/*     */   }
/*     */   public void setJs_type(String jsType) {
/* 206 */     this.js_type = jsType;
/*     */   }
/*     */   public String getValnum() {
/* 209 */     return this.valnum;
/*     */   }
/*     */   public void setValnum(String valnum) {
/* 212 */     this.valnum = valnum;
/*     */   }
/*     */   public String getIs_audit() {
/* 215 */     return this.is_audit;
/*     */   }
/*     */   public void setIs_audit(String isAudit) {
/* 218 */     this.is_audit = isAudit;
/*     */   }
/*     */   public String getIs_audit_disp() {
/* 221 */     return this.is_audit_disp;
/*     */   }
/*     */   public void setIs_audit_disp(String isAuditDisp) {
/* 224 */     this.is_audit_disp = isAuditDisp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_def_element
 * JD-Core Version:    0.6.2
 */