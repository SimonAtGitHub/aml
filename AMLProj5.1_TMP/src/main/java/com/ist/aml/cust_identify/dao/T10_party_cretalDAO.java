/*     */ package com.ist.aml.cust_identify.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dto.T10_party_cretal;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.common.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ 
/*     */ public class T10_party_cretalDAO extends BaseDAO
/*     */ {
/*     */   public ArrayList getT10_party_cretallist(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/*  32 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_party_cretallist", t10_party_cretal, startRec, intPageSize);
/*  33 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  34 */     LinkedHashMap cretal_status_cdMap = this.cm.getMapFromCache("cretal_status_cd");
/*  35 */     for (int i = 0; i < list.size(); i++) {
/*  36 */       T10_party_cretal party_cretal = (T10_party_cretal)list.get(i);
/*  37 */       if (party_cretal.getOrgankey() != null) {
/*  38 */         party_cretal.setOrganname((String)organMap.get(party_cretal.getOrgankey()));
/*     */       }
/*  40 */       if (party_cretal.getStatistic_dt() != null) {
/*  41 */         party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(party_cretal.getStatistic_dt()));
/*  42 */         party_cretal.setStatistic_y_m(DateUtils.dateToStringShort(party_cretal.getStatistic_dt()).substring(0, 7));
/*     */       }
/*  44 */       if (party_cretal.getStatus_cd() != null) {
/*  45 */         party_cretal.setStatus_cd_disp((String)cretal_status_cdMap.get(party_cretal.getStatus_cd()));
/*     */       }
/*  47 */       party_cretal.setQuerycount_s(Long.valueOf(party_cretal.getQuerycount_n().longValue() + party_cretal.getQuerycount_r().longValue()));
/*     */     }
/*     */ 
/*  50 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_party_cretal_statisticslist(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException
/*     */   {
/*  55 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_party_cretal_statisticslist", t10_party_cretal);
/*  56 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  57 */     for (int i = 0; i < list.size(); i++) {
/*  58 */       T10_party_cretal party_cretal = (T10_party_cretal)list.get(i);
/*  59 */       if (party_cretal.getOrgankey() != null) {
/*  60 */         party_cretal.setOrganname((String)organMap.get(party_cretal.getOrgankey()));
/*     */       }
/*  62 */       if (party_cretal.getStatistic_dt() != null) {
/*  63 */         party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(party_cretal.getStatistic_dt()));
/*     */       }
/*  65 */       party_cretal.setQuerycount_s(Long.valueOf(party_cretal.getQuerycount_n().longValue() + party_cretal.getQuerycount_r().longValue()));
/*     */     }
/*     */ 
/*  68 */     return list;
/*     */   }
/*     */ 
/*     */   public int getT10_party_cretalCount(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  72 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_party_cretalcount", t10_party_cretal);
/*  73 */     if (iCount == null) {
/*  74 */       return 0;
/*     */     }
/*  76 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int addT10_party_cretal(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  80 */     Integer iCount = Integer.valueOf(sqlMap.update("add10_party_cretal", t10_party_cretal));
/*  81 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyT10_party_cretal(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  85 */     Integer iCount = Integer.valueOf(sqlMap.update("modifyT10_party_cretal", t10_party_cretal));
/*  86 */     return iCount.intValue();
/*     */   }
/*     */   public int sub_retT10_party_cretal(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  89 */     Integer iCount = Integer.valueOf(sqlMap.update("sub_retT10_party_cretal", t10_party_cretal));
/*  90 */     return iCount.intValue();
/*     */   }
/*     */   public int deleteT10_party_cretal(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  93 */     Integer iCount = Integer.valueOf(sqlMap.update("deleteT10_party_cretal", t10_party_cretal));
/*  94 */     return iCount.intValue();
/*     */   }
/*     */   public T10_party_cretal getT10_party_cretal_disp(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/*  97 */     T10_party_cretal party_cretal = (T10_party_cretal)sqlMap.queryForObject("getT10_party_cretal", t10_party_cretal);
/*  98 */     if ((party_cretal != null) && (party_cretal.getStatistic_dt() != null)) {
/*  99 */       party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(party_cretal.getStatistic_dt()));
/*     */     }
/* 101 */     return party_cretal;
/*     */   }
/*     */ 
/*     */   public T10_party_cretal getT10_party_cretal_statistics(SqlMapClient sqlMap, T10_party_cretal t10_party_cretal) throws SQLException {
/* 105 */     T10_party_cretal party_cretal = (T10_party_cretal)sqlMap.queryForObject("getT10_party_cretalstatistics", t10_party_cretal);
/* 106 */     if (party_cretal.getStatistic_dt() != null) {
/* 107 */       party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(party_cretal.getStatistic_dt()));
/*     */     }
/* 109 */     return party_cretal;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dao.T10_party_cretalDAO
 * JD-Core Version:    0.6.2
 */