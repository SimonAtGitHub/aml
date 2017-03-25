/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T31_def_elementActionForm extends ActionForm
/*     */ {
/*  33 */   private String treelaye = "";
/*     */ 
/*  35 */   private String caltype = "";
/*     */ 
/*  37 */   private String elementkey = "";
/*     */ 
/*  39 */   private String templatekey = "";
/*     */ 
/*  41 */   private String base_score = "";
/*     */ 
/*  43 */   private String base_occ = "";
/*     */ 
/*  45 */   private String is_last = "";
/*     */ 
/*  47 */   private String is_sum = "";
/*     */ 
/*  49 */   private String element_score = "";
/*     */ 
/*  51 */   private String upelementkey = "";
/*     */ 
/*  53 */   private String elementname = "";
/*     */ 
/*  55 */   private String riskcaltype = "";
/*     */ 
/*  57 */   private String js_type = "";
/*     */ 
/*  59 */   private String des = "";
/*     */ 
/*  61 */   private String is_audit = "";
/*  62 */   private String is_audit_disp = "";
/*     */ 
/*     */   public void setTreelaye(String treelayeStr)
/*     */   {
/*  72 */     this.treelaye = treelayeStr;
/*     */   }
/*     */   public String getTreelaye() {
/*  75 */     return this.treelaye;
/*     */   }
/*     */ 
/*     */   public void setCaltype(String caltypeStr) {
/*  79 */     this.caltype = caltypeStr;
/*     */   }
/*     */   public String getCaltype() {
/*  82 */     return this.caltype;
/*     */   }
/*     */ 
/*     */   public void setElementkey(String elementkeyStr) {
/*  86 */     this.elementkey = elementkeyStr;
/*     */   }
/*     */   public String getElementkey() {
/*  89 */     return this.elementkey;
/*     */   }
/*     */ 
/*     */   public void setTemplatekey(String templatekeyStr) {
/*  93 */     this.templatekey = templatekeyStr;
/*     */   }
/*     */   public String getTemplatekey() {
/*  96 */     return this.templatekey;
/*     */   }
/*     */ 
/*     */   public void setBase_score(String base_scoreStr) {
/* 100 */     this.base_score = base_scoreStr;
/*     */   }
/*     */   public String getBase_score() {
/* 103 */     return this.base_score;
/*     */   }
/*     */ 
/*     */   public void setBase_occ(String base_occStr) {
/* 107 */     this.base_occ = base_occStr;
/*     */   }
/*     */   public String getBase_occ() {
/* 110 */     return this.base_occ;
/*     */   }
/*     */ 
/*     */   public void setIs_last(String is_lastStr) {
/* 114 */     this.is_last = is_lastStr;
/*     */   }
/*     */   public String getIs_last() {
/* 117 */     return this.is_last;
/*     */   }
/*     */ 
/*     */   public void setIs_sum(String is_sumStr) {
/* 121 */     this.is_sum = is_sumStr;
/*     */   }
/*     */   public String getIs_sum() {
/* 124 */     return this.is_sum;
/*     */   }
/*     */ 
/*     */   public void setElement_score(String element_scoreStr) {
/* 128 */     this.element_score = element_scoreStr;
/*     */   }
/*     */   public String getElement_score() {
/* 131 */     return this.element_score;
/*     */   }
/*     */ 
/*     */   public void setUpelementkey(String upelementkeyStr) {
/* 135 */     this.upelementkey = upelementkeyStr;
/*     */   }
/*     */   public String getUpelementkey() {
/* 138 */     return this.upelementkey;
/*     */   }
/*     */ 
/*     */   public void setElementname(String elementnameStr) {
/* 142 */     this.elementname = elementnameStr;
/*     */   }
/*     */   public String getElementname() {
/* 145 */     return this.elementname;
/*     */   }
/*     */ 
/*     */   public void setRiskcaltype(String riskcaltypeStr) {
/* 149 */     this.riskcaltype = riskcaltypeStr;
/*     */   }
/*     */   public String getRiskcaltype() {
/* 152 */     return this.riskcaltype;
/*     */   }
/*     */ 
/*     */   public void setDes(String desStr) {
/* 156 */     this.des = desStr;
/*     */   }
/*     */   public String getDes() {
/* 159 */     return this.des;
/*     */   }
/*     */ 
/*     */   public String getIs_audit() {
/* 163 */     return this.is_audit;
/*     */   }
/*     */   public void setIs_audit(String isAudit) {
/* 166 */     this.is_audit = isAudit;
/*     */   }
/*     */ 
/*     */   public String getIs_audit_disp() {
/* 170 */     return this.is_audit_disp;
/*     */   }
/*     */   public void setIs_audit_disp(String isAuditDisp) {
/* 173 */     this.is_audit_disp = isAuditDisp;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 179 */     return null;
/*     */   }
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {
/*     */   }
/*     */ 
/*     */   public String getJs_type() {
/* 185 */     return this.js_type;
/*     */   }
/*     */   public void setJs_type(String jsType) {
/* 188 */     this.js_type = jsType;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_elementActionForm
 * JD-Core Version:    0.6.2
 */