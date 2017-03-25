/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T37_party_result_uh;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T37_party_result_uhDAO extends BaseDAO
/*     */ {
/*     */   public ArrayList getT37_party_resultList2(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  56 */     List list = sqlMap.queryForList("getT37_party_resultList2", t37_party_result_uh, iStartRec, iPageSize);
/*  57 */     ArrayList t37_party_resultList = new ArrayList();
/*  58 */     LinkedHashMap risk_levelMap = this.cm.getMapFromCache("t31_risk_level");
/*  59 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  60 */     LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/*  61 */     LinkedHashMap modify_map = this.cm.getMapFromCache("yesNo");
/*  62 */     LinkedHashMap party_classMap = this.cm.getMapFromCache("clienttype");
/*     */ 
/*  64 */     for (int i = 0; i < list.size(); i++) {
/*  65 */       T37_party_result_uh t37_pt_result = (T37_party_result_uh)list.get(i);
/*  66 */       if ((t37_pt_result.getTemptype() != null) && (!"".equals(t37_pt_result.getTemptype()))) {
/*  67 */         t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
/*     */       }
/*  69 */       if ((t37_pt_result.getOrgankey() != null) && (!"".equals(t37_pt_result.getOrgankey()))) {
/*  70 */         t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
/*     */       }
/*  72 */       if ((t37_pt_result.getParty_class_cd() != null) && (!"".equals(t37_pt_result.getParty_class_cd()))) {
/*  73 */         t37_pt_result.setParty_class_cd_disp((String)party_classMap.get(t37_pt_result.getParty_class_cd()));
/*     */       }
/*  75 */       if ((t37_pt_result.getFristappralevel() != null) && (!"".equals(t37_pt_result.getFristappralevel()))) {
/*  76 */         t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
/*     */       }
/*  78 */       if ((t37_pt_result.getLevelkey() != null) && (!"".equals(t37_pt_result.getLevelkey()))) {
/*  79 */         t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
/*     */       }
/*  81 */       if ((t37_pt_result.getModify_cd() != null) && (!"".equals(t37_pt_result.getModify_cd()))) {
/*  82 */         t37_pt_result.setModify_cd_disp((String)modify_map.get(t37_pt_result.getModify_cd()));
/*     */       }
/*  84 */       if (t37_pt_result.getStatistic_dt() != null) {
/*  85 */         t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
/*     */       }
/*  87 */       if (t37_pt_result.getModifydate() != null) {
/*  88 */         t37_pt_result.setModifydate_disp(DateUtils.dateToStringShort(t37_pt_result.getModifydate()));
/*     */       }
/*  90 */       if (t37_pt_result.getCreate_dt() != null) {
/*  91 */         t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
/*     */       }
/*  93 */       t37_party_resultList.add(t37_pt_result);
/*     */     }
/*     */ 
/*  96 */     return t37_party_resultList;
/*     */   }
/*     */ 
/*     */   public int getT37_party_resultListCount2(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh)
/*     */     throws SQLException
/*     */   {
/* 110 */     Integer iCount = (Integer)sqlMap.queryForObject("getT37_party_resultListCount2", t37_party_result_uh);
/* 111 */     if (iCount == null) {
/* 112 */       return 0;
/*     */     }
/* 114 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T37_party_result_uh getT37_party_result_uhDisp(SqlMapClient sqlMap, T37_party_result_uh temp_uh)
/*     */     throws SQLException
/*     */   {
/* 127 */     T37_party_result_uh t37_party_result_uh = (T37_party_result_uh)sqlMap.queryForObject("getT37_party_result_uhDisp", temp_uh);
/* 128 */     if (t37_party_result_uh == null)
/* 129 */       t37_party_result_uh = new T37_party_result_uh();
/* 130 */     return t37_party_result_uh;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_party_result_notransList(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/* 148 */     List list = sqlMap.queryForList("getT37_party_result_notransList", t37_party_result_uh, iStartRec, iPageSize);
/* 149 */     ArrayList t37_party_resultList = new ArrayList();
/* 150 */     LinkedHashMap risk_levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 151 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 152 */     LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 153 */     LinkedHashMap modify_map = this.cm.getMapFromCache("yesNo");
/* 154 */     for (int i = 0; i < list.size(); i++) {
/* 155 */       T37_party_result_uh t37_pt_result = (T37_party_result_uh)list.get(i);
/* 156 */       if ((t37_pt_result.getTemptype() != null) && (!"".equals(t37_pt_result.getTemptype()))) {
/* 157 */         t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
/*     */       }
/* 159 */       if ((t37_pt_result.getOrgankey() != null) && (!"".equals(t37_pt_result.getOrgankey()))) {
/* 160 */         t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
/*     */       }
/* 162 */       if ((t37_pt_result.getFristappralevel() != null) && (!"".equals(t37_pt_result.getFristappralevel()))) {
/* 163 */         t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
/*     */       }
/* 165 */       if ((t37_pt_result.getLevelkey() != null) && (!"".equals(t37_pt_result.getLevelkey()))) {
/* 166 */         t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
/*     */       }
/* 168 */       if (t37_pt_result.getStatistic_dt() != null) {
/* 169 */         t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
/*     */       }
/* 171 */       if (t37_pt_result.getCreate_dt() != null) {
/* 172 */         t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
/*     */       }
/* 174 */       t37_party_resultList.add(t37_pt_result);
/*     */     }
/*     */ 
/* 177 */     return t37_party_resultList;
/*     */   }
/*     */ 
/*     */   public int getT37_party_result_notransListCount(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh)
/*     */     throws SQLException
/*     */   {
/* 191 */     Integer iCount = (Integer)sqlMap.queryForObject("getT37_party_result_notransListCount", t37_party_result_uh);
/* 192 */     if (iCount == null) {
/* 193 */       return 0;
/*     */     }
/* 195 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT37_party_result_uh(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh)
/*     */     throws SQLException
/*     */   {
/* 233 */     int i = sqlMap.update("insertT37_party_result_uh", t37_party_result_uh);
/* 234 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT37_party_result_uh(SqlMapClient sqlMap, T37_party_result_uh t37_party_result_uh)
/*     */     throws SQLException
/*     */   {
/* 249 */     int i = sqlMap.update("modifyT37_party_result_uh", t37_party_result_uh);
/* 250 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT37_party_result_uh(SqlMapClient sqlMap, String create_dt)
/*     */     throws SQLException
/*     */   {
/* 265 */     int i = sqlMap.update("deleteT37_party_result_uh", create_dt);
/* 266 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T37_party_result_uhDAO
 * JD-Core Version:    0.6.2
 */