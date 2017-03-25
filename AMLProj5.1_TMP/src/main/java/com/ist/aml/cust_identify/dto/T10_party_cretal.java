/*     */ package com.ist.aml.cust_identify.dto;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.util.Date;
/*     */ 
/*     */ public class T10_party_cretal
/*     */   implements Serializable
/*     */ {
/*     */   private static final long serialVersionUID = -8246638916400756816L;
/*  13 */   private Date statistic_dt = new Date();
/*  14 */   private String statistic_dt_disp = "";
/*     */ 
/*  16 */   private String statistic_y_m = "";
/*  17 */   private Date statistic_dt_start = new Date();
/*  18 */   private String statistic_dt_start_disp = "";
/*  19 */   private Date statistic_dt_end = new Date();
/*  20 */   private String statistic_dt_end_disp = "";
/*     */ 
/*  22 */   private String organkey = "";
/*  23 */   private String organname = "";
/*  24 */   private String organStr = "";
/*     */ 
/*  26 */   private String create_user = "";
/*     */ 
/*  28 */   private String create_org = "";
/*     */ 
/*  30 */   private String status_cd = "";
/*  31 */   private String status_cd_disp = "";
/*  32 */   private String status_dist = "";
/*     */ 
/*  34 */   private Date create_dt = new Date();
/*     */ 
/*  36 */   private Long querycount_s = null;
/*     */ 
/*  38 */   private Long querycount_n = null;
/*     */ 
/*  40 */   private Long acctcount_n = null;
/*     */ 
/*  42 */   private Long partycount_n = null;
/*     */ 
/*  44 */   private Long kycount_n = null;
/*     */ 
/*  46 */   private Long querycount_r = null;
/*     */ 
/*  48 */   private Long acctcount_r = null;
/*     */ 
/*  50 */   private Long partycount_r = null;
/*     */ 
/*  52 */   private Long kycount_r = null;
/*     */ 
/*     */   public Date getStatistic_dt() {
/*  55 */     return this.statistic_dt;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt(Date statisticDt) {
/*  59 */     this.statistic_dt = statisticDt;
/*     */   }
/*     */ 
/*     */   public String getOrgankey() {
/*  63 */     return this.organkey;
/*     */   }
/*     */ 
/*     */   public void setOrgankey(String organkey) {
/*  67 */     this.organkey = organkey;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_n() {
/*  71 */     return this.querycount_n;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_n(Long querycountN) {
/*  75 */     this.querycount_n = querycountN;
/*     */   }
/*     */ 
/*     */   public Long getAcctcount_n() {
/*  79 */     return this.acctcount_n;
/*     */   }
/*     */ 
/*     */   public void setAcctcount_n(Long acctcountN) {
/*  83 */     this.acctcount_n = acctcountN;
/*     */   }
/*     */ 
/*     */   public Long getPartycount_n() {
/*  87 */     return this.partycount_n;
/*     */   }
/*     */ 
/*     */   public void setPartycount_n(Long partycountN) {
/*  91 */     this.partycount_n = partycountN;
/*     */   }
/*     */ 
/*     */   public Long getKycount_n() {
/*  95 */     return this.kycount_n;
/*     */   }
/*     */ 
/*     */   public void setKycount_n(Long kycountN) {
/*  99 */     this.kycount_n = kycountN;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_r() {
/* 103 */     return this.querycount_r;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_r(Long querycountR) {
/* 107 */     this.querycount_r = querycountR;
/*     */   }
/*     */ 
/*     */   public Long getAcctcount_r() {
/* 111 */     return this.acctcount_r;
/*     */   }
/*     */ 
/*     */   public void setAcctcount_r(Long acctcountR) {
/* 115 */     this.acctcount_r = acctcountR;
/*     */   }
/*     */ 
/*     */   public Long getPartycount_r() {
/* 119 */     return this.partycount_r;
/*     */   }
/*     */ 
/*     */   public void setPartycount_r(Long partycountR) {
/* 123 */     this.partycount_r = partycountR;
/*     */   }
/*     */ 
/*     */   public Long getKycount_r() {
/* 127 */     return this.kycount_r;
/*     */   }
/*     */ 
/*     */   public void setKycount_r(Long kycountR) {
/* 131 */     this.kycount_r = kycountR;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_disp() {
/* 135 */     return this.statistic_dt_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_disp(String statisticDtDisp) {
/* 139 */     this.statistic_dt_disp = statisticDtDisp;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_start_disp() {
/* 143 */     return this.statistic_dt_start_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_start_disp(String statisticDtStartDisp) {
/* 147 */     this.statistic_dt_start_disp = statisticDtStartDisp;
/*     */   }
/*     */ 
/*     */   public String getStatistic_dt_end_disp() {
/* 151 */     return this.statistic_dt_end_disp;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_end_disp(String statisticDtEndDisp) {
/* 155 */     this.statistic_dt_end_disp = statisticDtEndDisp;
/*     */   }
/*     */ 
/*     */   public Date getStatistic_dt_start() {
/* 159 */     return this.statistic_dt_start;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_start(Date statisticDtStart) {
/* 163 */     this.statistic_dt_start = statisticDtStart;
/*     */   }
/*     */ 
/*     */   public Date getStatistic_dt_end() {
/* 167 */     return this.statistic_dt_end;
/*     */   }
/*     */ 
/*     */   public void setStatistic_dt_end(Date statisticDtEnd) {
/* 171 */     this.statistic_dt_end = statisticDtEnd;
/*     */   }
/*     */ 
/*     */   public String getOrganname() {
/* 175 */     return this.organname;
/*     */   }
/*     */ 
/*     */   public void setOrganname(String organname) {
/* 179 */     this.organname = organname;
/*     */   }
/*     */ 
/*     */   public String getOrganStr() {
/* 183 */     return this.organStr;
/*     */   }
/*     */ 
/*     */   public void setOrganStr(String organStr) {
/* 187 */     this.organStr = organStr;
/*     */   }
/*     */ 
/*     */   public Long getQuerycount_s() {
/* 191 */     return this.querycount_s;
/*     */   }
/*     */ 
/*     */   public void setQuerycount_s(Long querycountS) {
/* 195 */     this.querycount_s = querycountS;
/*     */   }
/*     */ 
/*     */   public String getCreate_user() {
/* 199 */     return this.create_user;
/*     */   }
/*     */ 
/*     */   public void setCreate_user(String createUser) {
/* 203 */     this.create_user = createUser;
/*     */   }
/*     */ 
/*     */   public String getCreate_org() {
/* 207 */     return this.create_org;
/*     */   }
/*     */ 
/*     */   public void setCreate_org(String createOrg) {
/* 211 */     this.create_org = createOrg;
/*     */   }
/*     */ 
/*     */   public String getStatus_cd() {
/* 215 */     return this.status_cd;
/*     */   }
/*     */ 
/*     */   public void setStatus_cd(String statusCd) {
/* 219 */     this.status_cd = statusCd;
/*     */   }
/*     */ 
/*     */   public Date getCreate_dt() {
/* 223 */     return this.create_dt;
/*     */   }
/*     */ 
/*     */   public void setCreate_dt(Date createDt) {
/* 227 */     this.create_dt = createDt;
/*     */   }
/*     */ 
/*     */   public String getStatus_dist() {
/* 231 */     return this.status_dist;
/*     */   }
/*     */ 
/*     */   public void setStatus_dist(String statusDist) {
/* 235 */     this.status_dist = statusDist;
/*     */   }
/*     */ 
/*     */   public String getStatistic_y_m() {
/* 239 */     return this.statistic_y_m;
/*     */   }
/*     */ 
/*     */   public void setStatistic_y_m(String statisticYM) {
/* 243 */     this.statistic_y_m = statisticYM;
/*     */   }
/*     */ 
/*     */   public String getStatus_cd_disp() {
/* 247 */     return this.status_cd_disp;
/*     */   }
/*     */ 
/*     */   public void setStatus_cd_disp(String statusCdDisp) {
/* 251 */     this.status_cd_disp = statusCdDisp;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dto.T10_party_cretal
 * JD-Core Version:    0.6.2
 */