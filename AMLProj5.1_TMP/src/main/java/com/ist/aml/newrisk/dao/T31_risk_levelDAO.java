/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_risk_level;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import java.sql.SQLException;
/*     */ import java.util.Iterator;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T31_risk_levelDAO extends BaseDAO
/*     */ {
/*     */   public List getT31_risk_levelList(SqlMapClient sqlMap, T31_risk_level t31_risk_level, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  48 */     List list = sqlMap.queryForList("getT31_risk_levelList", t31_risk_level, iStartRec, iPageSize);
/*     */ 
/*  59 */     LinkedHashMap maxisclosedMap = this.cm.getMapFromCache("risk_maxisclosed");
/*  60 */     LinkedHashMap minisclosedMap = this.cm.getMapFromCache("risk_minisclosed");
/*     */ 
/*  62 */     Iterator iter = list.iterator();
/*  63 */     while (iter.hasNext()) {
/*  64 */       T31_risk_level _t31_risk_level = (T31_risk_level)iter.next();
/*  65 */       _t31_risk_level.setMaxisclosed((String)maxisclosedMap.get(_t31_risk_level.getMaxisclosed()));
/*  66 */       _t31_risk_level.setMinisclosed((String)minisclosedMap.get(_t31_risk_level.getMinisclosed()));
/*     */     }
/*     */ 
/*  69 */     return list;
/*     */   }
/*     */ 
/*     */   public List getT31_risk_levelList(SqlMapClient sqlMap, T31_risk_level t31_risk_level) throws SQLException {
/*  73 */     List list = sqlMap.queryForList("getT31_risk_levelList", t31_risk_level);
/*     */ 
/*  76 */     LinkedHashMap maxisclosedMap = this.cm.getMapFromCache("risk_maxisclosed");
/*  77 */     LinkedHashMap minisclosedMap = this.cm.getMapFromCache("risk_minisclosed");
/*     */ 
/*  79 */     Iterator iter = list.iterator();
/*  80 */     while (iter.hasNext()) {
/*  81 */       T31_risk_level _t31_risk_level = (T31_risk_level)iter.next();
/*  82 */       _t31_risk_level.setMaxisclosed((String)maxisclosedMap.get(_t31_risk_level.getMaxisclosed()));
/*  83 */       _t31_risk_level.setMinisclosed((String)minisclosedMap.get(_t31_risk_level.getMinisclosed()));
/*     */     }
/*     */ 
/*  86 */     return list;
/*     */   }
/*     */ 
/*     */   public T31_risk_level getT31_risk_levelDisp(SqlMapClient sqlMap, String create_dt)
/*     */     throws SQLException
/*     */   {
/*  97 */     T31_risk_level t31_risk_level = (T31_risk_level)sqlMap.queryForObject("getT31_risk_levelDisp", create_dt);
/*  98 */     if (t31_risk_level == null) t31_risk_level = new T31_risk_level();
/*  99 */     return t31_risk_level;
/*     */   }
/*     */ 
/*     */   public int insertT31_risk_level(SqlMapClient sqlMap, T31_risk_level t31_risk_level)
/*     */     throws SQLException
/*     */   {
/* 110 */     int i = sqlMap.update("insertT31_risk_level", t31_risk_level);
/* 111 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_risk_level(SqlMapClient sqlMap, T31_risk_level t31_risk_level)
/*     */     throws SQLException
/*     */   {
/* 122 */     int i = sqlMap.update("modifyT31_risk_level", t31_risk_level);
/* 123 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_risk_level(SqlMapClient sqlMap, String create_dt)
/*     */     throws SQLException
/*     */   {
/* 134 */     int i = sqlMap.update("deleteT31_risk_level", create_dt);
/* 135 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T31_risk_levelDAO
 * JD-Core Version:    0.6.2
 */