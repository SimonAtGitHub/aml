/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ 
/*     */ public class T37_level_auditActionForm extends ActionForm
/*     */ {
/*  33 */   private String post_id = "";
/*     */ 
/*  35 */   private Date statistic_dt = new Date();
/*     */ 
/*  37 */   private String rsltkey = "";
/*     */ 
/*  39 */   private String res_post_id = "";
/*     */ 
/*  41 */   private String level_after_adjust = "";
/*     */ 
/*  43 */   private String party_id = "";
/*     */ 
/*  45 */   private String last_upd_user = "";
/*     */ 
/*  47 */   private String adjust_reason = "";
/*     */ 
/*  49 */   private String level_before_adjust = "";
/*     */ 
/*  51 */   private Date last_upd_dt = new Date();
/*     */ 
/*  53 */   private String audit_no = "";
/*     */ 
/*  57 */   private String statistic_dt_disp = "";
/*     */ 
/*  59 */   private String last_upd_dt_disp = "";
/*     */ 
/*     */   public void setPost_id(String post_idStr)
/*     */   {
/*  66 */     this.post_id = post_idStr;
/*     */   }
/*     */   public String getPost_id() {
/*  69 */     return this.post_id;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt(Date statistic_dtStr) {
/*  73 */     this.statistic_dt = statistic_dtStr;
/*     */   }
/*     */   public Date getStatistic_dt() {
/*  76 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setRsltkey(String rsltkeyStr) {
/*  80 */     this.rsltkey = rsltkeyStr;
/*     */   }
/*     */   public String getRsltkey() {
/*  83 */     return this.rsltkey;
/*     */   }
/*     */ 
/*     */   public void setRes_post_id(String res_post_idStr) {
/*  87 */     this.res_post_id = res_post_idStr;
/*     */   }
/*     */   public String getRes_post_id() {
/*  90 */     return this.res_post_id;
/*     */   }
/*     */ 
/*     */   public void setLevel_after_adjust(String level_after_adjustStr) {
/*  94 */     this.level_after_adjust = level_after_adjustStr;
/*     */   }
/*     */   public String getLevel_after_adjust() {
/*  97 */     return this.level_after_adjust;
/*     */   }
/*     */ 
/*     */   public void setParty_id(String party_idStr) {
/* 101 */     this.party_id = party_idStr;
/*     */   }
/*     */   public String getParty_id() {
/* 104 */     return this.party_id;
/*     */   }
/*     */ 
/*     */   public void setLast_upd_user(String last_upd_userStr) {
/* 108 */     this.last_upd_user = last_upd_userStr;
/*     */   }
/*     */   public String getLast_upd_user() {
/* 111 */     return this.last_upd_user;
/*     */   }
/*     */ 
/*     */   public void setAdjust_reason(String adjust_reasonStr) {
/* 115 */     this.adjust_reason = adjust_reasonStr;
/*     */   }
/*     */   public String getAdjust_reason() {
/* 118 */     return this.adjust_reason;
/*     */   }
/*     */ 
/*     */   public void setLevel_before_adjust(String level_before_adjustStr) {
/* 122 */     this.level_before_adjust = level_before_adjustStr;
/*     */   }
/*     */   public String getLevel_before_adjust() {
/* 125 */     return this.level_before_adjust;
/*     */   }
/*     */ 
/*     */   public void setLast_upd_dt(Date last_upd_dtStr) {
/* 129 */     this.last_upd_dt = last_upd_dtStr;
/*     */   }
/*     */   public Date getLast_upd_dt() {
/* 132 */     return this.last_upd_dt;
/*     */   }
/*     */ 
/*     */   public void setAudit_no(String audit_noStr) {
/* 136 */     this.audit_no = audit_noStr;
/*     */   }
/*     */   public String getAudit_no() {
/* 139 */     return this.audit_no;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr)
/*     */   {
/* 144 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 147 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setLast_upd_dt_disp(String last_upd_dt_dispStr) {
/* 151 */     this.last_upd_dt_disp = last_upd_dt_dispStr;
/*     */   }
/*     */   public String getLast_upd_dt_disp() {
/* 154 */     return this.last_upd_dt_disp;
/*     */   }
/*     */ 
/*     */   public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/* 160 */     return null;
/*     */   }
/*     */ 
/*     */   public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest)
/*     */   {
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_level_auditActionForm
 * JD-Core Version:    0.6.2
 */