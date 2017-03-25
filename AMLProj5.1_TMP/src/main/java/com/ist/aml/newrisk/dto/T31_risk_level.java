/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ 
/*     */ public class T31_risk_level extends BaseDTO
/*     */ {
/*  26 */   private String levelmax = "";
/*     */   private Double levelmax_d;
/*  41 */   private String create_org = "";
/*     */ 
/*  43 */   private String levelmin = "";
/*     */   private Double levelmin_d;
/*  46 */   private String maxisclosed = "";
/*     */ 
/*  48 */   private String levelkey = "";
/*     */ 
/*  50 */   private String levelname = "";
/*     */ 
/*  52 */   private String flag = "";
/*     */ 
/*  54 */   private String minisclosed = "";
/*     */ 
/*  56 */   private String leveldes = "";
/*     */ 
/*  58 */   private String modify_user = "";
/*     */ 
/*  60 */   private String create_user = "";
/*     */ 
/*  62 */   private String create_dt = "";
/*     */ 
/*  64 */   private String modify_dt = "";
/*     */ 
/*     */   public Double getLevelmax_d()
/*     */   {
/*  29 */     return this.levelmax_d;
/*     */   }
/*     */   public void setLevelmax_d(Double levelmaxD) {
/*  32 */     this.levelmax_d = levelmaxD;
/*     */   }
/*     */   public Double getLevelmin_d() {
/*  35 */     return this.levelmin_d;
/*     */   }
/*     */   public void setLevelmin_d(Double levelminD) {
/*  38 */     this.levelmin_d = levelminD;
/*     */   }
/*     */ 
/*     */   public void setLevelmax(String levelmaxStr)
/*     */   {
/*  73 */     this.levelmax = levelmaxStr;
/*     */   }
/*     */   public String getLevelmax() {
/*  76 */     return this.levelmax;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String create_orgStr) {
/*  80 */     this.create_org = create_orgStr;
/*     */   }
/*     */   public String getCreate_org() {
/*  83 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setLevelmin(String levelminStr) {
/*  87 */     this.levelmin = levelminStr;
/*     */   }
/*     */   public String getLevelmin() {
/*  90 */     return this.levelmin;
/*     */   }
/*     */ 
/*     */   public void setMaxisclosed(String maxisclosedStr)
/*     */   {
/*  95 */     this.maxisclosed = maxisclosedStr;
/*     */   }
/*     */   public String getMaxisclosed() {
/*  98 */     return this.maxisclosed;
/*     */   }
/*     */ 
/*     */   public void setLevelkey(String levelkeyStr) {
/* 102 */     this.levelkey = levelkeyStr;
/*     */   }
/*     */   public String getLevelkey() {
/* 105 */     return this.levelkey;
/*     */   }
/*     */ 
/*     */   public void setLevelname(String levelnameStr) {
/* 109 */     this.levelname = levelnameStr;
/*     */   }
/*     */   public String getLevelname() {
/* 112 */     return this.levelname;
/*     */   }
/*     */ 
/*     */   public void setFlag(String flagStr) {
/* 116 */     this.flag = flagStr;
/*     */   }
/*     */   public String getFlag() {
/* 119 */     return this.flag;
/*     */   }
/*     */ 
/*     */   public void setMinisclosed(String minisclosedStr) {
/* 123 */     this.minisclosed = minisclosedStr;
/*     */   }
/*     */   public String getMinisclosed() {
/* 126 */     return this.minisclosed;
/*     */   }
/*     */ 
/*     */   public void setLeveldes(String leveldesStr) {
/* 130 */     this.leveldes = leveldesStr;
/*     */   }
/*     */   public String getLeveldes() {
/* 133 */     return this.leveldes;
/*     */   }
/*     */ 
/*     */   public void setModify_user(String modify_userStr) {
/* 137 */     this.modify_user = modify_userStr;
/*     */   }
/*     */   public String getModify_user() {
/* 140 */     return this.modify_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String create_userStr) {
/* 144 */     this.create_user = create_userStr;
/*     */   }
/*     */   public String getCreate_user() {
/* 147 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(String create_dtStr) {
/* 151 */     this.create_dt = create_dtStr;
/*     */   }
/*     */   public String getCreate_dt() {
/* 154 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setModify_dt(String modify_dtStr) {
/* 158 */     this.modify_dt = modify_dtStr;
/*     */   }
/*     */   public String getModify_dt() {
/* 161 */     return this.modify_dt;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_risk_level
 * JD-Core Version:    0.6.2
 */