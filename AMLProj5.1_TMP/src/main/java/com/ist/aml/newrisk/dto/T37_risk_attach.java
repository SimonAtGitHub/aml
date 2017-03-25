/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.Date;
/*     */ import org.apache.struts.upload.FormFile;
/*     */ 
/*     */ public class T37_risk_attach
/*     */   implements Serializable
/*     */ {
/*     */   private static final long serialVersionUID = 4683441815326863507L;
/*     */   private String tableName;
/*     */   private FormFile filename;
/*  35 */   private String attach_name = "";
/*     */ 
/*  38 */   private String resulekey = "";
/*     */ 
/*  41 */   private String load_user = "";
/*     */ 
/*  44 */   private String alertkey = "";
/*     */ 
/*  47 */   private Date load_date = new Date();
/*     */ 
/*  50 */   private String attachkey = "";
/*     */ 
/*  53 */   private String attach_realname = "";
/*     */ 
/*  57 */   private String load_date_disp = "";
/*     */ 
/*  60 */   private int int_page = 1;
/*     */ 
/*     */   public void setAttach_name(String attach_nameStr)
/*     */   {
/*  69 */     this.attach_name = attach_nameStr;
/*     */   }
/*     */ 
/*     */   public String getAttach_name() {
/*  73 */     return this.attach_name;
/*     */   }
/*     */ 
/*     */   public String getResulekey()
/*     */   {
/*  79 */     return this.resulekey;
/*     */   }
/*     */ 
/*     */   public void setResulekey(String resulekey) {
/*  83 */     this.resulekey = resulekey;
/*     */   }
/*     */ 
/*     */   public void setLoad_user(String load_userStr) {
/*  87 */     this.load_user = load_userStr;
/*     */   }
/*     */ 
/*     */   public String getLoad_user() {
/*  91 */     return this.load_user;
/*     */   }
/*     */ 
/*     */   public void setAlertkey(String alertkeyStr) {
/*  95 */     this.alertkey = alertkeyStr;
/*     */   }
/*     */ 
/*     */   public String getAlertkey() {
/*  99 */     return this.alertkey;
/*     */   }
/*     */ 
/*     */   public void setLoad_date(Date load_dateStr) {
/* 103 */     this.load_date = load_dateStr;
/*     */   }
/*     */ 
/*     */   public Date getLoad_date() {
/* 107 */     return this.load_date;
/*     */   }
/*     */ 
/*     */   public void setAttachkey(String attachkeyStr) {
/* 111 */     this.attachkey = attachkeyStr;
/*     */   }
/*     */ 
/*     */   public String getAttachkey() {
/* 115 */     return this.attachkey;
/*     */   }
/*     */ 
/*     */   public void setAttach_realname(String attach_realnameStr) {
/* 119 */     this.attach_realname = attach_realnameStr;
/*     */   }
/*     */ 
/*     */   public String getAttach_realname() {
/* 123 */     return this.attach_realname;
/*     */   }
/*     */ 
/*     */   public void setLoad_date_disp(String load_date_dispStr)
/*     */   {
/* 128 */     this.load_date_disp = load_date_dispStr;
/*     */   }
/*     */ 
/*     */   public String getLoad_date_disp() {
/* 132 */     return this.load_date_disp;
/*     */   }
/*     */ 
/*     */   public int getInt_page() {
/* 136 */     return this.int_page;
/*     */   }
/*     */ 
/*     */   public void setInt_page(int int_page) {
/* 140 */     this.int_page = int_page;
/*     */   }
/*     */ 
/*     */   public FormFile getFilename() {
/* 144 */     return this.filename;
/*     */   }
/*     */ 
/*     */   public void setFilename(FormFile filename) {
/* 148 */     this.filename = filename;
/*     */   }
/*     */ 
/*     */   public String getTableName() {
/* 152 */     return this.tableName;
/*     */   }
/*     */ 
/*     */   public void setTableName(String tableName) {
/* 156 */     this.tableName = tableName;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T37_risk_attach
 * JD-Core Version:    0.6.2
 */