/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ 
/*     */ public class T31_swith
/*     */   implements Serializable
/*     */ {
/*     */   private static final long serialVersionUID = 2372074841907738321L;
/*  28 */   private String oper_id = "";
/*  29 */   private String oper_type = "";
/*  30 */   private String post_id = "";
/*  31 */   private String oper_url = "";
/*     */ 
/*  33 */   private String newseq_ind = "";
/*     */ 
/*  36 */   private String switch_id = "";
/*     */ 
/*  38 */   private String init_url = "";
/*     */ 
/*  40 */   private String orig_node = "";
/*     */ 
/*  42 */   private String flow_id = "";
/*     */ 
/*  44 */   private String is_use = "";
/*     */ 
/*  46 */   private String target_node = "";
/*     */ 
/*  48 */   private String levelkey = "";
/*     */ 
/*  68 */   private String status = "";
/*  69 */   private String is_report = "";
/*     */ 
/*     */   public String getLevelkey()
/*     */   {
/*  51 */     return this.levelkey;
/*     */   }
/*     */   public void setLevelkey(String levelkey) {
/*  54 */     this.levelkey = levelkey;
/*     */   }
/*     */   public String getStatus() {
/*  57 */     return this.status;
/*     */   }
/*     */   public void setStatus(String status) {
/*  60 */     this.status = status;
/*     */   }
/*     */   public String getIs_report() {
/*  63 */     return this.is_report;
/*     */   }
/*     */   public void setIs_report(String isReport) {
/*  66 */     this.is_report = isReport;
/*     */   }
/*     */ 
/*     */   public void setOper_id(String oper_idStr)
/*     */   {
/*  78 */     this.oper_id = oper_idStr;
/*     */   }
/*     */   public String getOper_id() {
/*  81 */     return this.oper_id;
/*     */   }
/*     */ 
/*     */   public void setNewseq_ind(String newseq_indStr) {
/*  85 */     this.newseq_ind = newseq_indStr;
/*     */   }
/*     */   public String getNewseq_ind() {
/*  88 */     return this.newseq_ind;
/*     */   }
/*     */ 
/*     */   public void setSwitch_id(String switch_idStr) {
/*  92 */     this.switch_id = switch_idStr;
/*     */   }
/*     */   public String getSwitch_id() {
/*  95 */     return this.switch_id;
/*     */   }
/*     */ 
/*     */   public void setInit_url(String init_urlStr) {
/*  99 */     this.init_url = init_urlStr;
/*     */   }
/*     */   public String getInit_url() {
/* 102 */     return this.init_url;
/*     */   }
/*     */ 
/*     */   public void setOrig_node(String orig_nodeStr) {
/* 106 */     this.orig_node = orig_nodeStr;
/*     */   }
/*     */   public String getOrig_node() {
/* 109 */     return this.orig_node;
/*     */   }
/*     */ 
/*     */   public void setFlow_id(String flow_idStr) {
/* 113 */     this.flow_id = flow_idStr;
/*     */   }
/*     */   public String getFlow_id() {
/* 116 */     return this.flow_id;
/*     */   }
/*     */ 
/*     */   public void setIs_use(String is_useStr) {
/* 120 */     this.is_use = is_useStr;
/*     */   }
/*     */   public String getIs_use() {
/* 123 */     return this.is_use;
/*     */   }
/*     */ 
/*     */   public void setTarget_node(String target_nodeStr) {
/* 127 */     this.target_node = target_nodeStr;
/*     */   }
/*     */   public String getTarget_node() {
/* 130 */     return this.target_node;
/*     */   }
/*     */   public String getOper_type() {
/* 133 */     return this.oper_type;
/*     */   }
/*     */   public void setOper_type(String oper_type) {
/* 136 */     this.oper_type = oper_type;
/*     */   }
/*     */   public String getOper_url() {
/* 139 */     return this.oper_url;
/*     */   }
/*     */   public void setOper_url(String oper_url) {
/* 142 */     this.oper_url = oper_url;
/*     */   }
/*     */   public String getPost_id() {
/* 145 */     return this.post_id;
/*     */   }
/*     */   public void setPost_id(String post_id) {
/* 148 */     this.post_id = post_id;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_swith
 * JD-Core Version:    0.6.2
 */