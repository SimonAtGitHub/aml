/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.upload.FormFile;
/*     */ 
/*     */ public class T37_risk_attachActionForm extends ActionForm
/*     */ {
/*     */   private FormFile filename;
/*  40 */   private String attach_name = "";
/*     */ 
/*  44 */   private String resulekey = "";
/*     */ 
/*  47 */   private String load_user = "";
/*     */ 
/*  50 */   private String alertkey = "";
/*     */ 
/*  53 */   private Date load_date = new Date();
/*     */ 
/*  56 */   private String attachkey = "";
/*     */ 
/*  59 */   private String attach_realname = "";
/*     */ 
/*  63 */   private String load_date_disp = "";
/*     */ 
/*     */   public void setAttach_name(String attach_nameStr)
/*     */   {
/*  72 */     this.attach_name = attach_nameStr;
/*     */   }
/*     */ 
/*     */   public String getAttach_name() {
/*  76 */     return this.attach_name;
/*     */   }
/*     */ 
/*     */   public String getResulekey() {
/*  80 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekey) {
/*  84 */     this.resulekey = resulekey;
/*     */   }
/*     */ 
/*     */   public void setLoad_user(String load_userStr) {
/*  88 */     this.load_user = load_userStr;
/*     */   }
/*     */ 
/*     */   public String getLoad_user() {
/*  92 */     return this.load_user;
/*     */   }
/*     */ 
/*     */   public void setAlertkey(String alertkeyStr) {
/*  96 */     this.alertkey = alertkeyStr;
/*     */   }
/*     */ 
/*     */   public String getAlertkey() {
/* 100 */     return this.alertkey;
/*     */   }
/*     */ 
/*     */   public void setLoad_date(Date load_dateStr) {
/* 104 */     this.load_date = load_dateStr;
/*     */   }
/*     */ 
/*     */   public Date getLoad_date() {
/* 108 */     return this.load_date;
/*     */   }
/*     */ 
/*     */   public void setAttachkey(String attachkeyStr) {
/* 112 */     this.attachkey = attachkeyStr;
/*     */   }
/*     */ 
/*     */   public String getAttachkey() {
/* 116 */     return this.attachkey;
/*     */   }
/*     */ 
/*     */   public void setAttach_realname(String attach_realnameStr) {
/* 120 */     this.attach_realname = attach_realnameStr;
/*     */   }
/*     */ 
/*     */   public String getAttach_realname() {
/* 124 */     return this.attach_realname;
/*     */   }
/*     */ 
/*     */   public void setLoad_date_disp(String load_date_dispStr)
/*     */   {
/* 129 */     this.load_date_disp = load_date_dispStr;
/*     */   }
/*     */ 
/*     */   public String getLoad_date_disp() {
/* 133 */     return this.load_date_disp;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 140 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ 
/*     */   public FormFile getFilename() {
/* 148 */     return this.filename;
/*     */   }
/*     */ 
/*     */   public void setFilename(FormFile filename) {
/* 152 */     this.filename = filename;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_risk_attachActionForm
 * JD-Core Version:    0.6.2
 */