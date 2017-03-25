/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T31_risk_levelActionForm extends ActionForm
/*     */ {
/*  33 */   private String levelmax = "";
/*     */ 
/*  35 */   private String create_org = "";
/*     */ 
/*  37 */   private String levelmin = "";
/*     */ 
/*  39 */   private String maxisclosed = "";
/*     */ 
/*  41 */   private String levelkey = "";
/*     */ 
/*  43 */   private String levelname = "";
/*     */ 
/*  45 */   private String flag = "";
/*     */ 
/*  47 */   private String minisclosed = "";
/*     */ 
/*  49 */   private String leveldes = "";
/*     */ 
/*  51 */   private String modify_user = "";
/*     */ 
/*  53 */   private String create_user = "";
/*     */ 
/*  55 */   private String create_dt = "";
/*     */ 
/*  57 */   private String modify_dt = "";
/*     */ 
/*  59 */   private String[] selectedLevelkey = new String[0];
/*     */ 
/*     */   public void setLevelmax(String levelmaxStr)
/*     */   {
/*  67 */     this.levelmax = levelmaxStr;
/*     */   }
/*     */   public String getLevelmax() {
/*  70 */     return this.levelmax;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/*  74 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/*  77 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setLevelmin(String levelminStr) {
/*  81 */     this.levelmin = levelminStr;
/*     */   }
/*     */   public String getLevelmin() {
/*  84 */     return this.levelmin;
/*     */   }
/*     */ 
/*     */   public void setMaxisclosed(String maxisclosedStr) {
/*  88 */     this.maxisclosed = maxisclosedStr;
/*     */   }
/*     */   public String getMaxisclosed() {
/*  91 */     return this.maxisclosed;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/*  95 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/*  98 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setLevelname(String levelnameStr) {
/* 102 */     this.levelname = levelnameStr;
/*     */   }
/*     */   public String getLevelname() {
/* 105 */     return this.levelname;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/* 109 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 112 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setMinisclosed(String minisclosedStr) {
/* 116 */     this.minisclosed = minisclosedStr;
/*     */   }
/*     */   public String getMinisclosed() {
/* 119 */     return this.minisclosed;
/*     */   }
/*     */ 
/*     */   public void setLeveldes(String leveldesStr) {
/* 123 */     this.leveldes = leveldesStr;
/*     */   }
/*     */   public String getLeveldes() {
/* 126 */     return this.leveldes;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 130 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 133 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 137 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 140 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 144 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 147 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setModify_dt(String modify_dtStr) {
/* 151 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 154 */     return this.modify_dt;
/*     */   }
/*     */   public String[] getSelectedLevelkey() {
/* 157 */     return this.selectedLevelkey;
/*     */   }
/*     */   public void setSelectedLevelkey(String[] selectedLevelkey) {
/* 160 */     this.selectedLevelkey = selectedLevelkey;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 166 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_risk_levelActionForm
 * JD-Core Version:    0.6.2
 */