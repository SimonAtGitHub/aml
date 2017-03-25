/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_def_element;
/*     */ import com.ist.aml.newrisk.dto.T31_def_elementscore;
/*     */ import com.ist.aml.newrisk.dto.T31_def_temp;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.Iterator;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
/*     */ import org.apache.commons.lang.StringUtils;
/*     */ 
/*     */ public class T31_def_elementDAO extends BaseDAO
/*     */ {
/*     */   public List getT31_def_elementList(SqlMapClient sqlMap, T31_def_element t31_def_element, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  58 */     List list = sqlMap.queryForList("getT31_def_elementList", 
/*  59 */       t31_def_element, iStartRec, iPageSize);
/*     */ 
/*  61 */     return list;
/*     */   }
/*     */ 
/*     */   public List getT31_def_elementList(SqlMapClient sqlMap, T31_def_element t31_def_element)
/*     */     throws SQLException
/*     */   {
/*  77 */     List list = sqlMap.queryForList("getT31_def_elementList", t31_def_element);
/*     */ 
/*  79 */     ArrayList t31_def_elementList1 = new ArrayList();
/*  80 */     Map caltypeMap = this.cm.getMapFromCache("caltype");
/*  81 */     Iterator iter = list.iterator();
/*  82 */     while (iter.hasNext()) {
/*  83 */       T31_def_element element = (T31_def_element)iter.next();
/*  84 */       element.setCaltype_disp((String)caltypeMap.get(element.getCaltype()));
/*  85 */       t31_def_elementList1.add(element);
/*     */     }
/*  87 */     return t31_def_elementList1;
/*     */   }
/*     */ 
/*     */   public T31_def_element getT31_def_elementDisp(SqlMapClient sqlMap, T31_def_element element)
/*     */     throws SQLException
/*     */   {
/* 102 */     T31_def_element t31_def_element = (T31_def_element)sqlMap
/* 103 */       .queryForObject("getT31_def_elementDisp", element);
/* 104 */     Map caltypeMap = this.cm.getMapFromCache("caltype");
/* 105 */     Map is_sumMap = this.cm.getMapFromCache("sum_type");
/* 106 */     Map is_auditMap = this.cm.getMapFromCache("is_audit");
/*     */ 
/* 108 */     if (caltypeMap.containsKey(t31_def_element.getCaltype()))
/*     */     {
/* 110 */       t31_def_element.setCaltype_disp((String)caltypeMap.get(t31_def_element.getCaltype()));
/*     */     }
/*     */ 
/* 113 */     if (is_sumMap.containsKey(t31_def_element.getIs_sum()))
/*     */     {
/* 115 */       t31_def_element.setIs_sum((String)is_sumMap.get(t31_def_element.getIs_sum()));
/*     */     }
/* 117 */     if (is_auditMap.containsKey(t31_def_element.getIs_audit())) {
/* 118 */       t31_def_element.setIs_audit_disp((String)is_auditMap.get(t31_def_element.getIs_audit()));
/*     */     }
/* 120 */     return t31_def_element;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_element(SqlMapClient sqlMap, T31_def_element t31_def_element)
/*     */     throws SQLException
/*     */   {
/* 135 */     int i = sqlMap.update("insertT31_def_element", t31_def_element);
/* 136 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT31_def_element(SqlMapClient sqlMap, T31_def_element t31_def_element)
/*     */     throws SQLException
/*     */   {
/* 151 */     int i = sqlMap.update("modifyT31_def_element", t31_def_element);
/* 152 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_element(SqlMapClient sqlMap, String elementkeys)
/*     */     throws SQLException
/*     */   {
/* 167 */     int i = sqlMap.update("deleteT31_def_element", elementkeys);
/* 168 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_elementscore(SqlMapClient sqlMap, String elementkeys) throws SQLException {
/* 172 */     int i = sqlMap.update("deleteT31_def_elementscore", elementkeys);
/* 173 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_elementscoreByElementkeys(SqlMapClient sqlMap, String[] elementkeys) throws SQLException {
/* 177 */     int i = sqlMap.update("deleteT31_def_elementscoreByElementkeys", elementkeys);
/* 178 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_element(SqlMapClient sqlMap, T31_def_element t31_def_element) throws SQLException
/*     */   {
/* 183 */     int i = sqlMap.update("deleteT31_def_element2", t31_def_element);
/* 184 */     return i;
/*     */   }
/*     */ 
/*     */   public ArrayList<T31_def_element> getELementList_for_cascade_del(SqlMapClient sqlMap, T31_def_element element) throws SQLException
/*     */   {
/* 189 */     return (ArrayList)sqlMap.queryForList("getELementList_for_cascade_del", element);
/*     */   }
/*     */ 
/*     */   public String getTreelaye(SqlMapClient sqlMap, String elementkey)
/*     */     throws SQLException
/*     */   {
/* 195 */     return (String)sqlMap.queryForObject("getTreelaye", elementkey);
/*     */   }
/*     */ 
/*     */   public Map getT31_def_elementList_for_map(SqlMapClient sqlMap, T31_def_element element)
/*     */     throws SQLException
/*     */   {
/* 203 */     return sqlMap.queryForMap("getT31_def_elementList_for_map", element, "elementkey");
/*     */   }
/*     */ 
/*     */   public List<T31_def_element> getT31_def_elementLocate(SqlMapClient sqlMap, T31_def_element t31_def_element, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/* 210 */     List list = sqlMap.queryForList("getT31_def_elementLocate", 
/* 211 */       t31_def_element, iStartRec, iPageSize);
/* 212 */     LinkedHashMap riskcaltypeMap = this.cm.getMapFromCache("riskcaltype");
/*     */ 
/* 215 */     for (T31_def_element element : list)
/*     */     {
/* 217 */       if (riskcaltypeMap.containsKey(element.getRiskcaltype()));
/* 219 */       element.setRiskcaltype((String)riskcaltypeMap.get(element.getRiskcaltype()));
/*     */     }
/*     */ 
/* 223 */     return list;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_element(SqlMapClient sqlMap, T31_def_temp t31_def_temp) throws SQLException
/*     */   {
/* 228 */     int rows = sqlMap.update("copyT31_def_element", t31_def_temp);
/* 229 */     return rows;
/*     */   }
/*     */ 
/*     */   public int copyT31_def_elementscore(SqlMapClient sqlMap, T31_def_temp t31_def_temp) throws SQLException {
/* 233 */     int rows = sqlMap.update("copyT31_def_elementscore", t31_def_temp);
/* 234 */     return rows;
/*     */   }
/*     */ 
/*     */   public int insertT31_def_elementscore(SqlMapClient sqlMap, T31_def_elementscore score) throws SQLException
/*     */   {
/* 239 */     int i = sqlMap.update("insertT31_def_elementscore", score);
/* 240 */     return i;
/*     */   }
/*     */ 
/*     */   public int deleteT31_def_elementscoreByElementkey(SqlMapClient sqlMap, T31_def_elementscore score) throws SQLException
/*     */   {
/* 245 */     int i = sqlMap.update("deleteT31_def_elementscoreByElementkey", score);
/* 246 */     return i;
/*     */   }
/*     */ 
/*     */   public Map getT31_def_elementscoreMap(SqlMapClient sqlMap, T31_def_element t31_def_element)
/*     */     throws SQLException
/*     */   {
/* 252 */     Map map = new HashMap();
/* 253 */     List list = sqlMap.queryForList("getT31_def_elementscoreMap", t31_def_element);
/* 254 */     List scoreList = null;
/* 255 */     for (T31_def_elementscore score : list)
/*     */     {
/* 257 */       String elementkey = score.getElementkey();
/*     */ 
/* 260 */       if (StringUtils.isNotEmpty(score.getMin_score()))
/*     */       {
/* 262 */         score.setMin_score_d(Double.valueOf(Double.parseDouble(score.getMin_score())));
/* 263 */         if (score.getMin_score().indexOf(".") == 0) {
/* 264 */           score.setMin_score("0" + score.getMin_score());
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 269 */       if (StringUtils.isNotEmpty(score.getMax_score()))
/*     */       {
/* 271 */         score.setMax_score_d(Double.valueOf(Double.parseDouble(score.getMax_score())));
/* 272 */         if (score.getMax_score().indexOf(".") == 0) {
/* 273 */           score.setMax_score("0" + score.getMax_score());
/*     */         }
/*     */       }
/* 276 */       if (StringUtils.isNotEmpty(score.getScore()))
/*     */       {
/* 278 */         score.setScore_d(Double.parseDouble(score.getScore()));
/*     */       }
/* 280 */       if (map.containsKey(elementkey))
/*     */       {
/* 282 */         scoreList = (ArrayList)map.get(elementkey);
/*     */       }
/*     */       else {
/* 285 */         scoreList = new ArrayList();
/*     */       }
/* 287 */       scoreList.add(score);
/* 288 */       map.put(elementkey, scoreList);
/*     */     }
/*     */ 
/* 291 */     return map;
/*     */   }
/*     */ 
/*     */   public int updateT31_def_element_jsType(SqlMapClient sqlMap, T31_def_element t31_def_element) throws SQLException
/*     */   {
/* 296 */     int i = sqlMap.update("updateT31_def_element_jsType", t31_def_element);
/* 297 */     return i;
/*     */   }
/*     */ 
/*     */   public String getT31_def_element_jsType(SqlMapClient sqlMap, T31_def_element t31_def_element) throws SQLException
/*     */   {
/* 302 */     String js_type = (String)sqlMap.queryForObject("getT31_def_element_jsType", t31_def_element);
/* 303 */     return js_type;
/*     */   }
/*     */ 
/*     */   public int updateT31_def_element_name(SqlMapClient sqlMap, T31_def_element t31_def_element)
/*     */     throws SQLException
/*     */   {
/* 309 */     int i = sqlMap.update("updateT31_def_element_name", t31_def_element);
/* 310 */     return i;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T31_def_elementDAO
 * JD-Core Version:    0.6.2
 */