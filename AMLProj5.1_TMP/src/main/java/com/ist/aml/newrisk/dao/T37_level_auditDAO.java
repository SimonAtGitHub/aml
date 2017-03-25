/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T37_level_audit;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import java.sql.SQLException;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T37_level_auditDAO extends BaseDAO
/*     */ {
/*     */   public List getT37_level_auditList(SqlMapClient sqlMap, T37_level_audit t37_level_audit, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  48 */     List list = sqlMap.queryForList("getT37_level_auditList", t37_level_audit, iStartRec, iPageSize);
/*     */ 
/*  58 */     return list;
/*     */   }
/*     */ 
/*     */   public T37_level_audit getT37_level_auditDisp(SqlMapClient sqlMap, String adjust_reason)
/*     */     throws SQLException
/*     */   {
/*  69 */     T37_level_audit t37_level_audit = (T37_level_audit)sqlMap.queryForObject("getT37_level_auditDisp", adjust_reason);
/*  70 */     if (t37_level_audit == null) t37_level_audit = new T37_level_audit();
/*  71 */     return t37_level_audit;
/*     */   }
/*     */ 
/*     */   public int insertT37_level_audit(SqlMapClient sqlMap, T37_level_audit t37_level_audit)
/*     */     throws SQLException
/*     */   {
/*  82 */     int i = sqlMap.update("insertT37_level_audit", t37_level_audit);
/*  83 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT37_level_audit(SqlMapClient sqlMap, T37_level_audit t37_level_audit)
/*     */     throws SQLException
/*     */   {
/*  94 */     int i = sqlMap.update("modifyT37_level_audit", t37_level_audit);
/*  95 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT37_level_audit(SqlMapClient sqlMap, String adjust_reason)
/*     */     throws SQLException
/*     */   {
/* 106 */     int i = sqlMap.update("deleteT37_level_audit", adjust_reason);
/* 107 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T37_level_auditDAO
 * JD-Core Version:    0.6.2
 */