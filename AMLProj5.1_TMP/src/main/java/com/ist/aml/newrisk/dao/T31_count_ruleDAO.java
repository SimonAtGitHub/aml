/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_count_rule;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import java.sql.SQLException;
/*     */ import java.util.Iterator;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T31_count_ruleDAO extends BaseDAO
/*     */ {
/*     */   public List getT31_count_ruleList(SqlMapClient sqlMap, T31_count_rule t31_count_rule, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  50 */     List list = sqlMap.queryForList("getT31_count_ruleList", t31_count_rule, iStartRec, iPageSize);
/*     */ 
/*  52 */     LinkedHashMap maxisclosedMap = this.cm.getMapFromCache("risk_maxisclosed");
/*  53 */     LinkedHashMap minisclosedMap = this.cm.getMapFromCache("risk_minisclosed");
/*     */ 
/*  55 */     Iterator iter = list.iterator();
/*  56 */     while (iter.hasNext()) {
/*  57 */       T31_count_rule _t31_count_rule = (T31_count_rule)iter.next();
/*  58 */       _t31_count_rule.setMaxisclosed((String)maxisclosedMap.get(_t31_count_rule.getMaxisclosed()));
/*  59 */       _t31_count_rule.setMinisclosed((String)minisclosedMap.get(_t31_count_rule.getMinisclosed()));
/*  60 */       if (_t31_count_rule.getScoretype().equals("A"))
/*  61 */         _t31_count_rule.setScoretype("金额");
/*  62 */       else if (_t31_count_rule.getScoretype().equals("T")) {
/*  63 */         _t31_count_rule.setScoretype("次数");
/*     */       }
/*  65 */       if (_t31_count_rule.getScore().indexOf(".") == 0) {
/*  66 */         _t31_count_rule.setScore(0 + _t31_count_rule.getScore());
/*     */       }
/*  68 */       if (_t31_count_rule.getCtrulemax().indexOf(".") == 0) {
/*  69 */         _t31_count_rule.setCtrulemax(0 + _t31_count_rule.getCtrulemax());
/*     */       }
/*  71 */       if (_t31_count_rule.getCtrulemin().indexOf(".") == 0) {
/*  72 */         _t31_count_rule.setCtrulemin(0 + _t31_count_rule.getCtrulemin());
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/*  85 */     return list;
/*     */   }
/*     */ 
/*     */   public T31_count_rule getT31_count_ruleDisp(SqlMapClient sqlMap, String create_dt)
/*     */     throws SQLException
/*     */   {
/*  96 */     T31_count_rule t31_count_rule = (T31_count_rule)sqlMap.queryForObject("getT31_count_ruleDisp", create_dt);
/*  97 */     if (t31_count_rule == null) t31_count_rule = new T31_count_rule();
/*  98 */     return t31_count_rule;
/*     */   }
/*     */ 
/*     */   public int insertT31_count_rule(SqlMapClient sqlMap, T31_count_rule t31_count_rule)
/*     */     throws SQLException
/*     */   {
/* 109 */     int i = sqlMap.update("insertT31_count_rule", t31_count_rule);
/* 110 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_count_rule(SqlMapClient sqlMap, T31_count_rule t31_count_rule)
/*     */     throws SQLException
/*     */   {
/* 121 */     int i = sqlMap.update("modifyT31_count_rule", t31_count_rule);
/* 122 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_count_rule(SqlMapClient sqlMap, String create_dt)
/*     */     throws SQLException
/*     */   {
/* 133 */     int i = sqlMap.update("deleteT31_count_rule", create_dt);
/* 134 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T31_count_ruleDAO
 * JD-Core Version:    0.6.2
 */