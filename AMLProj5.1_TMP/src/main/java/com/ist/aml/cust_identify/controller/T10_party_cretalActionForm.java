/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import java.util.Date;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ 
/*     */ public class T10_party_cretalActionForm extends ActionForm
/*     */ {
/*   9 */   private Date statistic_dt = new Date();
/*  10 */   private String statistic_dt_disp = "";
/*  11 */   private Date statistic_dt_start = new Date();
/*  12 */   private String statistic_dt_start_disp = "";
/*  13 */   private Date statistic_dt_end = new Date();
/*  14 */   private String statistic_dt_end_disp = "";
/*     */ 
/*  16 */   private String organkey = "";
/*  17 */   private String organname = "";
/*     */ 
/*  19 */   private String create_user = "";
/*     */ 
/*  21 */   private String create_org = "";
/*     */ 
/*  23 */   private String status_cd = "";
/*     */ 
/*  25 */   private Date create_dt = new Date();
/*     */ 
/*  27 */   private Long querycount_s = null;
/*     */ 
/*  29 */   private Long querycount_n = null;
/*     */ 
/*  31 */   private Long acctcount_n = null;
/*     */ 
/*  33 */   private Long partycount_n = null;
/*     */ 
/*  35 */   private Long kycount_n = null;
/*     */ 
/*  37 */   private Long querycount_r = null;
/*     */ 
/*  39 */   private Long acctcount_r = null;
/*     */ 
/*  41 */   private Long partycount_r = null;
/*     */ 
/*  43 */   private Long kycount_r = null;
/*     */ 
/*  45 */   private String[] checkboxKeys = new String[0];
/*     */ 
/*  47 */   public Date getStatistic_dt() { return this.statistic_dt; }
/*     */ 
/*     */   public void setStatistic_dt(Date statisticDt)
/*     */   {
/*  51 */     this.statistic_dt = statisticDt;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_disp() {
/*  55 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statisticDtDisp) {
/*  59 */     this.statistic_dt_disp = statisticDtDisp;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_start_disp() {
/*  63 */     return this.statistic_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_start_disp(String statisticDtStartDisp) {
/*  67 */     this.statistic_dt_start_disp = statisticDtStartDisp;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_end_disp() {
/*  71 */     return this.statistic_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_end_disp(String statisticDtEndDisp) {
/*  75 */     this.statistic_dt_end_disp = statisticDtEndDisp;
/*     */   }
/*     */ 
/*     */   public String getOrgankey() {
/*  79 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkey) {
/*  83 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_n() {
/*  87 */     return this.querycount_n;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_n(Long querycountN) {
/*  91 */     this.querycount_n = querycountN;
/*     */   }
/*     */ 
/*     */   public Long getAcctcount_n() {
/*  95 */     return this.acctcount_n;
/*     */   }
/*     */ 
/*     */   public void setAcctcount_n(Long acctcountN) {
/*  99 */     this.acctcount_n = acctcountN;
/*     */   }
/*     */ 
/*     */   public Long getPartycount_n() {
/* 103 */     return this.partycount_n;
/*     */   }
/*     */ 
/*     */   public void setPartycount_n(Long partycountN) {
/* 107 */     this.partycount_n = partycountN;
/*     */   }
/*     */ 
/*     */   public Long getKycount_n() {
/* 111 */     return this.kycount_n;
/*     */   }
/*     */ 
/*     */   public void setKycount_n(Long kycountN) {
/* 115 */     this.kycount_n = kycountN;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_r() {
/* 119 */     return this.querycount_r;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_r(Long querycountR) {
/* 123 */     this.querycount_r = querycountR;
/*     */   }
/*     */ 
/*     */   public Long getAcctcount_r() {
/* 127 */     return this.acctcount_r;
/*     */   }
/*     */ 
/*     */   public void setAcctcount_r(Long acctcountR) {
/* 131 */     this.acctcount_r = acctcountR;
/*     */   }
/*     */ 
/*     */   public Long getPartycount_r() {
/* 135 */     return this.partycount_r;
/*     */   }
/*     */ 
/*     */   public void setPartycount_r(Long partycountR) {
/* 139 */     this.partycount_r = partycountR;
/*     */   }
/*     */ 
/*     */   public Long getKycount_r() {
/* 143 */     return this.kycount_r;
/*     */   }
/*     */ 
/*     */   public void setKycount_r(Long kycountR) {
/* 147 */     this.kycount_r = kycountR;
/*     */   }
/*     */ 
/*     */   public Date getStatistic_dt_start() {
/* 151 */     return this.statistic_dt_start;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_start(Date statisticDtStart) {
/* 155 */     this.statistic_dt_start = statisticDtStart;
/*     */   }
/*     */ 
/*     */   public Date getStatistic_dt_end() {
/* 159 */     return this.statistic_dt_end;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_end(Date statisticDtEnd) {
/* 163 */     this.statistic_dt_end = statisticDtEnd;
/*     */   }
/*     */ 
/*     */   public String getOrganname() {
/* 167 */     return this.organname;
/*     */   }
/*     */ 
/*     */   public void setOrganname(String organname) {
/* 171 */     this.organname = organname;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_s() {
/* 175 */     return this.querycount_s;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_s(Long querycountS) {
/* 179 */     this.querycount_s = querycountS;
/*     */   }
/*     */ 
/*     */   public String getCreate_user() {
/* 183 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String createUser) {
/* 187 */     this.create_user = createUser;
/*     */   }
/*     */ 
/*     */   public String getCreate_org() {
/* 191 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String createOrg) {
/* 195 */     this.create_org = createOrg;
/*     */   }
/*     */ 
/*     */   public String getStatus_cd() {
/* 199 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setStatus_cd(String statusCd) {
/* 203 */     this.status_cd = statusCd;
/*     */   }
/*     */ 
/*     */   public Date getCreate_dt() {
/* 207 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date createDt) {
/* 211 */     this.create_dt = createDt;
/*     */   }
/*     */ 
/*     */   public String[] getCheckboxKeys() {
/* 215 */     return this.checkboxKeys;
/*     */   }
/*     */ 
/*     */   public void setCheckboxKeys(String[] checkboxKeys) {
/* 219 */     this.checkboxKeys = checkboxKeys;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_party_cretalActionForm
 * JD-Core Version:    0.6.2
 */