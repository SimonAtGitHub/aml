/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T37_level_audit extends BaseDTO
/*     */ {
/*  28 */   private String post_id = "";
/*  29 */   private String post_id_disp = "";
/*     */ 
/*  31 */   private Date statistic_dt = new Date();
/*     */ 
/*  33 */   private String rsltkey = "";
/*     */ 
/*  35 */   private String res_post_id = "";
/*     */ 
/*  37 */   private String level_after_adjust = "";
/*     */ 
/*  39 */   private String party_id = "";
/*     */ 
/*  41 */   private String organkey = "";
/*     */ 
/*  43 */   private String last_upd_user = "";
/*     */ 
/*  45 */   private String adjust_reason = "";
/*     */ 
/*  47 */   private String level_before_adjust = "";
/*     */ 
/*  49 */   private Date last_upd_dt = new Date();
/*     */ 
/*  51 */   private String audit_no = "";
/*     */ 
/*  53 */   private String granularity = "";
/*     */ 
/*  56 */   private String statistic_dt_disp = "";
/*     */ 
/*  58 */   private String last_upd_dt_disp = "";
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
/*     */   public String getOrgankey() {
/* 108 */     return this.organkey;
/*     */   }
/*     */   public void setOrgankey(String organkey) {
/* 111 */     this.organkey = organkey;
/*     */   }
/*     */   public void setLast_upd_user(String last_upd_userStr) {
/* 114 */     this.last_upd_user = last_upd_userStr;
/*     */   }
/*     */   public String getLast_upd_user() {
/* 117 */     return this.last_upd_user;
/*     */   }
/*     */ 
/*     */   public void setAdjust_reason(String adjust_reasonStr) {
/* 121 */     this.adjust_reason = adjust_reasonStr;
/*     */   }
/*     */   public String getAdjust_reason() {
/* 124 */     return this.adjust_reason;
/*     */   }
/*     */ 
/*     */   public void setLevel_before_adjust(String level_before_adjustStr) {
/* 128 */     this.level_before_adjust = level_before_adjustStr;
/*     */   }
/*     */   public String getLevel_before_adjust() {
/* 131 */     return this.level_before_adjust;
/*     */   }
/*     */ 
/*     */   public void setLast_upd_dt(Date last_upd_dtStr) {
/* 135 */     this.last_upd_dt = last_upd_dtStr;
/*     */   }
/*     */   public Date getLast_upd_dt() {
/* 138 */     return this.last_upd_dt;
/*     */   }
/*     */ 
/*     */   public void setAudit_no(String audit_noStr) {
/* 142 */     this.audit_no = audit_noStr;
/*     */   }
/*     */   public String getAudit_no() {
/* 145 */     return this.audit_no;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statistic_dt_dispStr)
/*     */   {
/* 150 */     this.statistic_dt_disp = statistic_dt_dispStr;
/*     */   }
/*     */   public String getStatistic_dt_disp() {
/* 153 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setLast_upd_dt_disp(String last_upd_dt_dispStr) {
/* 157 */     this.last_upd_dt_disp = last_upd_dt_dispStr;
/*     */   }
/*     */   public String getLast_upd_dt_disp() {
/* 160 */     return this.last_upd_dt_disp;
/*     */   }
/*     */   public String getGranularity() {
/* 163 */     return this.granularity;
/*     */   }
/*     */   public void setGranularity(String granularity) {
/* 166 */     this.granularity = granularity;
/*     */   }
/*     */   public String getPost_id_disp() {
/* 169 */     return this.post_id_disp;
/*     */   }
/*     */   public void setPost_id_disp(String postIdDisp) {
/* 172 */     this.post_id_disp = postIdDisp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T37_level_audit
 * JD-Core Version:    0.6.2
 */