/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_def_gs;
/*     */ import com.ist.aml.newrisk.dto.T31_def_temp;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import java.sql.SQLException;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T31_def_gsDAO extends BaseDAO
/*     */ {
/*     */   public List getT31_def_gsList(SqlMapClient sqlMap, T31_def_gs t31_def_gs, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  55 */     List list = sqlMap.queryForList("getT31_def_gsList", t31_def_gs, iStartRec, iPageSize);
/*     */ 
/*  57 */     LinkedHashMap granularitys = this.cm.getMapFromCache("risk_granularitys");
/*     */ 
/*  59 */     LinkedHashMap flagMap = this.cm.getMapFromCache("yesNo");
/*     */ 
/*  61 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*     */ 
/*  63 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/*     */ 
/*  65 */     for (int i = 0; i < list.size(); i++) {
/*  66 */       T31_def_gs temp = (T31_def_gs)list.get(i);
/*  67 */       if (temp.getGranularity() != null) {
/*  68 */         temp.setGranularity_disp((String)granularitys.get(temp.getGranularity()));
/*     */       }
/*  70 */       if (temp.getFlag() != null) {
/*  71 */         temp.setFlag_disp((String)flagMap.get(temp.getFlag()));
/*     */       }
/*  73 */       if (temp.getLevelkey() != null) {
/*  74 */         temp.setLevel_disp((String)levelMap.get(temp.getLevelkey()));
/*     */       }
/*  76 */       if (temp.getParty_class_cd() != null) {
/*  77 */         temp.setParty_class_cd_disp((String)clienttypeMap.get(temp.getParty_class_cd()));
/*     */       }
/*     */     }
/*     */ 
/*  81 */     return list;
/*     */   }
/*     */ 
/*     */   public int getT31_def_gsListCount(SqlMapClient sqlMap, T31_def_gs t31DefGs)
/*     */     throws SQLException
/*     */   {
/*  94 */     Integer iCount = (Integer)sqlMap.queryForObject("getT31_def_gsListCount", t31DefGs);
/*  95 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T31_def_temp getT31_def_tempDisp(SqlMapClient sqlMap, String calculateseq)
/*     */     throws SQLException
/*     */   {
/* 108 */     T31_def_temp t31_def_temp = (T31_def_temp)sqlMap.queryForObject("getT31_def_tempDisp", calculateseq);
/* 109 */     if (t31_def_temp == null)
/* 110 */       t31_def_temp = new T31_def_temp();
/* 111 */     return t31_def_temp;
/*     */   }
/*     */ 
/*     */   public T31_def_gs getT31_def_gsDisp(SqlMapClient sqlMap, String gskey)
/*     */     throws SQLException
/*     */   {
/* 125 */     T31_def_gs t31_def_gs = (T31_def_gs)sqlMap.queryForObject("getT31_def_gsDisp", gskey);
/*     */ 
/* 127 */     LinkedHashMap granularitys = this.cm.getMapFromCache("risk_granularitys");
/*     */ 
/* 129 */     LinkedHashMap flagMap = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 131 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*     */ 
/* 133 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/*     */ 
/* 135 */     if (t31_def_gs.getParty_class_cd() != null) {
/* 136 */       t31_def_gs.setParty_class_cd_disp((String)clienttypeMap.get(t31_def_gs.getParty_class_cd()));
/*     */     }
/* 138 */     if (t31_def_gs.getLevelkey() != null) {
/* 139 */       t31_def_gs.setLevel_disp((String)levelMap.get(t31_def_gs.getLevelkey()));
/*     */     }
/* 141 */     if (t31_def_gs.getFlag() != null) {
/* 142 */       t31_def_gs.setFlag_disp((String)flagMap.get(t31_def_gs.getFlag()));
/*     */     }
/* 144 */     if (t31_def_gs.getGranularity() != null) {
/* 145 */       t31_def_gs.setGranularity_disp((String)granularitys.get(t31_def_gs.getGranularity()));
/*     */     }
/*     */ 
/* 148 */     if (t31_def_gs == null)
/* 149 */       t31_def_gs = new T31_def_gs();
/* 150 */     return t31_def_gs;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_gs(SqlMapClient sqlMap, T31_def_gs t31_def_gs)
/*     */     throws SQLException
/*     */   {
/* 164 */     int i = sqlMap.update("insertT31_def_gs", t31_def_gs);
/* 165 */     return i;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_gs_indic(SqlMapClient sqlMap, T31_def_gs t31_def_gs)
/*     */     throws SQLException
/*     */   {
/* 179 */     int i = sqlMap.update("insertT31_def_gs_indic", t31_def_gs);
/* 180 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_def_gs(SqlMapClient sqlMap, T31_def_gs t31_def_gs)
/*     */     throws SQLException
/*     */   {
/* 195 */     int i = sqlMap.update("modifyT31_def_gs", t31_def_gs);
/* 196 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_gs(SqlMapClient sqlMap, String gskey)
/*     */     throws SQLException
/*     */   {
/* 210 */     int i = sqlMap.update("deleteT31_def_gs", gskey);
/* 211 */     return i;
/*     */   }
/*     */ 
/*     */   public T31_def_gs getT31_def_gs_indicDisp(SqlMapClient sqlMap, String gskey)
/*     */     throws SQLException
/*     */   {
/* 225 */     T31_def_gs t31_def_gs = (T31_def_gs)sqlMap.queryForObject("getT31_def_gs_indicDisp", gskey);
/*     */ 
/* 227 */     LinkedHashMap is_sumMap = this.cm.getMapFromCache("sum_type");
/*     */ 
/* 229 */     LinkedHashMap valtypeMap = this.cm.getMapFromCache("compare_operator");
/*     */ 
/* 238 */     if (t31_def_gs == null)
/* 239 */       t31_def_gs = new T31_def_gs();
/* 240 */     return t31_def_gs;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_gs_indic(SqlMapClient sqlMap, String gskey)
/*     */     throws SQLException
/*     */   {
/* 254 */     int i = sqlMap.update("deleteT31_def_gs_indic", gskey);
/* 255 */     return i;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_gs(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 269 */     int i = sqlMap.update("copyT31_def_gs", t31_def_temp);
/* 270 */     return i;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_gs_indic(SqlMapClient sqlMap, T31_def_temp t31_def_temp)
/*     */     throws SQLException
/*     */   {
/* 284 */     int i = sqlMap.update("copyT31_def_gs_indic", t31_def_temp);
/* 285 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T31_def_gsDAO
 * JD-Core Version:    0.6.2
 */