/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_def_temp;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ 
/*     */ public class T31_def_tempDAO extends BaseDAO
/*     */ {
/*     */   public ArrayList getT31_def_tempList(SqlMapClient sqlMap, T31_def_temp t31_def_temp, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  56 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT31_def_tempList", t31_def_temp, 
/*  57 */       iStartRec, iPageSize);
/*     */ 
/*  59 */     LinkedHashMap granularitys = this.cm.getMapFromCache("risk_granularitys");
/*  60 */     LinkedHashMap clienttype = this.cm.getMapFromCache("temp_clienttype");
/*  61 */     LinkedHashMap flag = this.cm.getMapFromCache("flag");
/*  62 */     LinkedHashMap coverMap = this.cm.getMapFromCache("yesNo");
/*  63 */     LinkedHashMap category = this.cm.getMapFromCache("template_category");
/*  64 */     for (int i = 0; i < list.size(); i++) {
/*  65 */       T31_def_temp temp = (T31_def_temp)list.get(i);
/*  66 */       if (temp.getGranularity() != null) {
/*  67 */         temp.setGranularity_disp((String)granularitys.get(temp.getGranularity()));
/*     */       }
/*  69 */       if (temp.getParty_class_cd() != null) {
/*  70 */         temp.setParty_class_cd_disp((String)clienttype.get(temp.getParty_class_cd()));
/*     */       }
/*  72 */       if (temp.getFlag() != null) {
/*  73 */         temp.setFlag_disp((String)flag.get(temp.getFlag()));
/*     */       }
/*  75 */       if (temp.getTempcategory() != null) {
/*  76 */         temp.setTempcategory_disp((String)category.get(temp.getTempcategory()));
/*     */       }
/*  78 */       if (temp.getCoverflag() != null) {
/*  79 */         temp.setCoverflag_disp((String)coverMap.get(temp.getCoverflag()));
/*     */       }
/*     */     }
/*  82 */     return list;
/*     */   }
/*     */ 
/*     */   public int getT31_def_tempListCount(SqlMapClient sqlMap, T31_def_temp t31DefTemp)
/*     */     throws SQLException
/*     */   {
/*  95 */     Integer iCount = (Integer)sqlMap.queryForObject("getT31_def_tempListCount", t31DefTemp);
/*  96 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T31_def_temp getT31_def_tempDisp(SqlMapClient sqlMap, String templatekey)
/*     */     throws SQLException
/*     */   {
/* 109 */     T31_def_temp t31_def_temp = (T31_def_temp)sqlMap.queryForObject("getT31_def_tempDisp", templatekey);
/* 110 */     if (t31_def_temp == null)
/* 111 */       t31_def_temp = new T31_def_temp();
/* 112 */     return t31_def_temp;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_temp(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 126 */     int i = sqlMap.update("insertT31_def_temp", t31_def_temp);
/* 127 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_def_temp(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 141 */     int i = sqlMap.update("modifyT31_def_temp", t31_def_temp);
/* 142 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_def_temp_flag(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 156 */     int i = sqlMap.update("modifyT31_def_temp_flag", t31_def_temp);
/* 157 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_temp(SqlMapClient sqlMap, String calculateseq)
/*     */     throws SQLException
/*     */   {
/* 170 */     int i = sqlMap.update("deleteT31_def_temp", calculateseq);
/* 171 */     return i;
/*     */   }
/*     */ 
/*     */   public ArrayList getT31_def_temp_granList(SqlMapClient sqlMap, String key)
/*     */     throws SQLException
/*     */   {
/* 185 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT31_def_temp_granList", key);
/* 186 */     LinkedHashMap granularityMap = this.cm.getMapFromCache("data_granularity");
/* 187 */     for (int i = 0; i < list.size(); i++) {
/* 188 */       T31_def_temp temp = (T31_def_temp)list.get(i);
/* 189 */       if (temp.getGranularity() != null) {
/* 190 */         temp.setSqlgranularity_disp((String)granularityMap.get(temp.getSqlgranularity()));
/*     */       }
/* 192 */       if (temp.getDatagranularity() != null) {
/* 193 */         temp.setDatagranularity_disp((String)granularityMap.get(temp.getDatagranularity()));
/*     */       }
/*     */     }
/* 196 */     return list;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_temp_gran(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 207 */     int i = sqlMap.update("insertT31_def_temp_gran", t31_def_temp);
/* 208 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_def_temp_gran(SqlMapClient sqlMap, T31_def_temp t31DefTemp)
/*     */     throws SQLException
/*     */   {
/* 219 */     int i = sqlMap.update("modifyT31_def_temp_gran", t31DefTemp);
/* 220 */     return i;
/*     */   }
/*     */ 
/*     */   public T31_def_temp getT31_def_temp_granDisp(SqlMapClient sqlMap, String sqlkey)
/*     */     throws SQLException
/*     */   {
/* 230 */     T31_def_temp t31_def_temp = (T31_def_temp)sqlMap.queryForObject("getT31_def_temp_granDisp", sqlkey);
/* 231 */     if (t31_def_temp == null)
/* 232 */       t31_def_temp = new T31_def_temp();
/* 233 */     return t31_def_temp;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_temp_gran(SqlMapClient sqlMap, String sqlkey)
/*     */     throws SQLException
/*     */   {
/* 244 */     int i = sqlMap.update("deleteT31_def_temp_gran", sqlkey);
/* 245 */     return i;
/*     */   }
/*     */ 
/*     */   public ArrayList getT31_def_temp_sqlList(SqlMapClient sqlMap, String key)
/*     */     throws SQLException
/*     */   {
/* 259 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT31_def_temp_sqlList", key);
/*     */ 
/* 261 */     return list;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_temp_sql(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 275 */     int i = sqlMap.update("insertT31_def_temp_sql", t31_def_temp);
/* 276 */     return i;
/*     */   }
/*     */ 
/*     */   public int delT31_def_temp_sql(SqlMapClient sqlMap, String key)
/*     */     throws SQLException
/*     */   {
/* 290 */     int i = sqlMap.update("delT31_def_temp_sql", key);
/* 291 */     return i;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_temp_sql(SqlMapClient sqlMap, T31_def_temp temp)
/*     */     throws SQLException
/*     */   {
/* 305 */     int i = sqlMap.update("copyT31_def_temp_sql", temp);
/* 306 */     return i;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_temp_gran(SqlMapClient sqlMap, T31_def_temp temp)
/*     */     throws SQLException
/*     */   {
/* 320 */     int i = sqlMap.update("copyT31_def_temp_gran", temp);
/* 321 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T31_def_tempDAO
 * JD-Core Version:    0.6.2
 */