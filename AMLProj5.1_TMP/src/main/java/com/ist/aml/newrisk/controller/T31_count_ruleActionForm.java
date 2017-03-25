/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T31_count_ruleActionForm extends ActionForm
/*     */ {
/*  33 */   private String ctrulekey = "";
/*     */ 
/*  35 */   private String flag = "";
/*     */ 
/*  37 */   private String minisclosed = "";
/*     */ 
/*  39 */   private String create_org = "";
/*     */ 
/*  41 */   private String score = "";
/*     */ 
/*  43 */   private String create_user = "";
/*     */ 
/*  45 */   private String create_dt = "";
/*     */ 
/*  47 */   private String ctrulemin = "";
/*     */ 
/*  49 */   private String scoretype = "";
/*     */ 
/*  51 */   private String ctrulemax = "";
/*     */ 
/*  53 */   private String maxisclosed = "";
/*     */ 
/*     */   public void setCtrulekey(String ctrulekeyStr)
/*     */   {
/*  62 */     this.ctrulekey = ctrulekeyStr;
/*     */   }
/*     */   public String getCtrulekey() {
/*  65 */     return this.ctrulekey;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/*  69 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/*  72 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setMinisclosed(String minisclosedStr) {
/*  76 */     this.minisclosed = minisclosedStr;
/*     */   }
/*     */   public String getMinisclosed() {
/*  79 */     return this.minisclosed;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/*  83 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/*  86 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setScore(String scoreStr) {
/*  90 */     this.score = scoreStr;
/*     */   }
/*     */   public String getScore() {
/*  93 */     return this.score;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/*  97 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 100 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 104 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 107 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setCtrulemin(String ctruleminStr) {
/* 111 */     this.ctrulemin = ctruleminStr;
/*     */   }
/*     */   public String getCtrulemin() {
/* 114 */     return this.ctrulemin;
/*     */   }
/*     */ 
/*     */   public void setScoretype(String scoretypeStr) {
/* 118 */     this.scoretype = scoretypeStr;
/*     */   }
/*     */   public String getScoretype() {
/* 121 */     return this.scoretype;
/*     */   }
/*     */ 
/*     */   public void setCtrulemax(String ctrulemaxStr) {
/* 125 */     this.ctrulemax = ctrulemaxStr;
/*     */   }
/*     */   public String getCtrulemax() {
/* 128 */     return this.ctrulemax;
/*     */   }
/*     */ 
/*     */   public void setMaxisclosed(String maxisclosedStr) {
/* 132 */     this.maxisclosed = maxisclosedStr;
/*     */   }
/*     */   public String getMaxisclosed() {
/* 135 */     return this.maxisclosed;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 142 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_count_ruleActionForm
 * JD-Core Version:    0.6.2
 */