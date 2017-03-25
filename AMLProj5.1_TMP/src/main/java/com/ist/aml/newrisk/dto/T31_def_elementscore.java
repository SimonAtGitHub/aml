/*     */ package com.ist.aml.newrisk.dto;
/*     */ 
/*     */ import com.ist.common.base.BaseDTO;
/*     */ 
/*     */ public class T31_def_elementscore extends BaseDTO
/*     */ {
/*  28 */   private String elementkey = "";
/*     */ 
/*  30 */   private String scoreid = "";
/*     */ 
/*  32 */   private String des = "";
/*     */ 
/*  34 */   private String min_score = "";
/*  35 */   private Double min_score_d = null;
/*     */ 
/*  37 */   private String max_score = "";
/*  38 */   private Double max_score_d = null;
/*     */ 
/*  40 */   private String score = "";
/*  41 */   private double score_d = 0.0D;
/*     */ 
/*     */   public String getElementkey()
/*     */   {
/*  48 */     return this.elementkey;
/*     */   }
/*     */   public void setElementkey(String elementkey) {
/*  51 */     this.elementkey = elementkey;
/*     */   }
/*     */   public String getScoreid() {
/*  54 */     return this.scoreid;
/*     */   }
/*     */   public void setScoreid(String scoreid) {
/*  57 */     this.scoreid = scoreid;
/*     */   }
/*     */   public String getDes() {
/*  60 */     return this.des;
/*     */   }
/*     */   public void setDes(String des) {
/*  63 */     this.des = des;
/*     */   }
/*     */   public String getMin_score() {
/*  66 */     return this.min_score;
/*     */   }
/*     */   public void setMin_score(String minScore) {
/*  69 */     this.min_score = minScore;
/*     */   }
/*     */ 
/*     */   public String getMax_score() {
/*  73 */     return this.max_score;
/*     */   }
/*     */   public void setMax_score(String maxScore) {
/*  76 */     this.max_score = maxScore;
/*     */   }
/*     */ 
/*     */   public String getScore() {
/*  80 */     return this.score;
/*     */   }
/*     */   public void setScore(String score) {
/*  83 */     this.score = score;
/*     */   }
/*     */   public double getScore_d() {
/*  86 */     return this.score_d;
/*     */   }
/*     */   public void setScore_d(double scoreD) {
/*  89 */     this.score_d = scoreD;
/*     */   }
/*     */   public Double getMin_score_d() {
/*  92 */     return this.min_score_d;
/*     */   }
/*     */   public void setMin_score_d(Double minScoreD) {
/*  95 */     this.min_score_d = minScoreD;
/*     */   }
/*     */   public Double getMax_score_d() {
/*  98 */     return this.max_score_d;
/*     */   }
/*     */   public void setMax_score_d(Double maxScoreD) {
/* 101 */     this.max_score_d = maxScoreD;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dto.T31_def_elementscore
 * JD-Core Version:    0.6.2
 */