/*     */ package com.ist.aml.newrisk.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dto.T31_n_move;
/*     */ import com.ist.aml.newrisk.dto.T31_risk_level;
/*     */ import com.ist.aml.newrisk.dto.T37_appr_bas_rslt;
/*     */ import com.ist.aml.newrisk.dto.T37_level_audit;
/*     */ import com.ist.aml.newrisk.dto.T37_party_result;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ 
/*     */ public class T37_party_resultDAO extends BaseDAO
/*     */ {
/*     */   public List getT37_party_resultList(SqlMapClient sqlMap, T37_party_result t37_party_result, int iStartRec, int iPageSize)
/*     */     throws SQLException
/*     */   {
/*  52 */     List list = sqlMap.queryForList("getT37_party_resultList", t37_party_result, iStartRec, iPageSize);
/*  53 */     ArrayList t37_party_resultList = new ArrayList();
/*  54 */     LinkedHashMap risk_levelMap = this.cm.getMapFromCache("t31_risk_level");
/*  55 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  56 */     LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/*  57 */     LinkedHashMap tempcategory_map = this.cm.getMapFromCache("tempcategory");
/*  58 */     for (int i = 0; i < list.size(); i++) {
/*  59 */       T37_party_result t37_pt_result = (T37_party_result)list.get(i);
/*  60 */       if ((t37_pt_result.getTemptype() != null) && (!"".equals(t37_pt_result.getTemptype()))) {
/*  61 */         t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
/*     */       }
/*  63 */       if ((t37_pt_result.getTempcategory() != null) && (!"".equals(t37_pt_result.getTempcategory()))) {
/*  64 */         t37_pt_result.setTempcategory_disp((String)tempcategory_map.get(t37_pt_result.getTempcategory()));
/*     */       }
/*  66 */       if ((t37_pt_result.getOrgankey() != null) && (!"".equals(t37_pt_result.getOrgankey()))) {
/*  67 */         t37_pt_result.setOrgan_name((String)organMap.get(t37_pt_result.getOrgankey()));
/*     */       }
/*  69 */       if ((t37_pt_result.getFristappralevel() != null) && (!"".equals(t37_pt_result.getFristappralevel()))) {
/*  70 */         t37_pt_result.setFristappralevel_disp((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
/*     */       }
/*  72 */       if ((t37_pt_result.getEmendationlevel() != null) && (!"".equals(t37_pt_result.getEmendationlevel()))) {
/*  73 */         t37_pt_result.setEmendationlevel_disp((String)risk_levelMap.get(t37_pt_result.getEmendationlevel()));
/*     */       }
/*  75 */       t37_pt_result.setHigherlevel(maojorLevel(sqlMap, t37_pt_result.getFristappralevel(), t37_pt_result.getEmendationlevel()));
/*  76 */       if (t37_pt_result.getStatistic_dt() != null) {
/*  77 */         t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
/*     */       }
/*  79 */       if (t37_pt_result.getDealmax_dt() != null) {
/*  80 */         t37_pt_result.setDealmax_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getDealmax_dt()));
/*     */       }
/*  82 */       if (t37_pt_result.getModifydate() != null) {
/*  83 */         t37_pt_result.setModifydate_disp(DateUtils.dateToStringShort(t37_pt_result.getModifydate()));
/*     */       }
/*  85 */       if (t37_pt_result.getCreate_dt() != null) {
/*  86 */         t37_pt_result.setCreate_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getCreate_dt()));
/*     */       }
/*  88 */       t37_party_resultList.add(t37_pt_result);
/*     */     }
/*     */ 
/*  91 */     return t37_party_resultList;
/*     */   }
/*     */ 
/*     */   private String maojorLevel(SqlMapClient sqlMap, String fristappralevel, String emendationlevel) throws SQLException {
/*  95 */     ArrayList t31_risk_levelList = (ArrayList)sqlMap.queryForList("t31_risk_levelList");
/*  96 */     LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/*  97 */     String levelkey = "";
/*  98 */     if ((t87_sysparaMap.get("705") != null) && (t87_sysparaMap.get("705").equals("1"))) {
/*  99 */       double e = 0.0D;
/* 100 */       double f = 0.0D;
/* 101 */       if ((t31_risk_levelList != null) && (t31_risk_levelList.size() > 0)) {
/* 102 */         for (int i = 0; i < t31_risk_levelList.size(); i++) {
/* 103 */           T31_risk_level t31_risk_level = (T31_risk_level)t31_risk_levelList.get(i);
/* 104 */           if (t31_risk_level.getLevelkey().equals(emendationlevel))
/* 105 */             e = t31_risk_level.getLevelmin_d().doubleValue();
/* 106 */           else if (t31_risk_level.getLevelkey().equals(fristappralevel)) {
/* 107 */             f = t31_risk_level.getLevelmin_d().doubleValue();
/*     */           }
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 113 */       if (f > e)
/* 114 */         levelkey = fristappralevel;
/*     */       else
/* 116 */         levelkey = emendationlevel;
/*     */     }
/*     */     else {
/* 119 */       levelkey = emendationlevel;
/*     */     }
/*     */ 
/* 122 */     return levelkey;
/*     */   }
/*     */ 
/*     */   public int getT37_party_resultListCount(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException {
/* 126 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 127 */       "getT37_party_resultListCount", t37_party_result);
/* 128 */     if (iCount == null) {
/* 129 */       return 0;
/*     */     }
/* 131 */     return iCount.intValue();
/*     */   }
/*     */   public List getT37_party_result_uhList(SqlMapClient sqlMap, T37_party_result t37_party_result, int iStartRec, int iPageSize) throws SQLException {
/* 134 */     List list = sqlMap.queryForList("getT37_party_result_uhList", t37_party_result, iStartRec, iPageSize);
/* 135 */     ArrayList t37_party_resultList = new ArrayList();
/* 136 */     LinkedHashMap risk_levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 137 */     LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 138 */     LinkedHashMap granularitymap = this.cm.getMapFromCache("granularity");
/* 139 */     for (int i = 0; i < list.size(); i++) {
/* 140 */       T37_party_result t37_pt_result = (T37_party_result)list.get(i);
/* 141 */       if ((t37_pt_result.getTemptype() != null) && (!"".equals(t37_pt_result.getTemptype()))) {
/* 142 */         t37_pt_result.setTemptype_disp((String)temp_type_map.get(t37_pt_result.getTemptype()));
/*     */       }
/* 144 */       if ((t37_pt_result.getFristappralevel() != null) && (!"".equals(t37_pt_result.getFristappralevel()))) {
/* 145 */         t37_pt_result.setFristappralevel((String)risk_levelMap.get(t37_pt_result.getFristappralevel()));
/*     */       }
/* 147 */       if ((t37_pt_result.getEmendationlevel() != null) && (!"".equals(t37_pt_result.getEmendationlevel()))) {
/* 148 */         t37_pt_result.setEmendationlevel_disp((String)risk_levelMap.get(t37_pt_result.getEmendationlevel()));
/*     */       }
/* 150 */       if (t37_pt_result.getStatistic_dt() != null) {
/* 151 */         t37_pt_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_pt_result.getStatistic_dt()));
/*     */       }
/* 153 */       if ((t37_pt_result.getGranularity() != null) && (!"".equals(t37_pt_result.getGranularity()))) {
/* 154 */         t37_pt_result.setGranularity((String)granularitymap.get(t37_pt_result.getGranularity()));
/*     */       }
/* 156 */       if ((t37_pt_result.getLevelkey() != null) && (!"".equals(t37_pt_result.getLevelkey()))) {
/* 157 */         t37_pt_result.setLevelkey_disp((String)risk_levelMap.get(t37_pt_result.getLevelkey()));
/*     */       }
/* 159 */       t37_party_resultList.add(t37_pt_result);
/*     */     }
/*     */ 
/* 162 */     return t37_party_resultList;
/*     */   }
/*     */ 
/*     */   public int getT37_party_result_uhListCount(SqlMapClient sqlMap, T37_party_result t37_party_result)
/*     */     throws SQLException
/*     */   {
/* 168 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 169 */       "getT37_party_result_uhListCount", t37_party_result);
/* 170 */     if (iCount == null) {
/* 171 */       return 0;
/*     */     }
/* 173 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_bas_rsltList(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 178 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_bas_rsltList", 
/* 179 */       t37_appr_bas_rslt);
/* 180 */     ArrayList t37_appr_elem_rsltList = new ArrayList();
/* 181 */     for (int i = 0; i < list.size(); i++) {
/* 182 */       T37_appr_bas_rslt t37_appr_bas = (T37_appr_bas_rslt)list.get(i);
/* 183 */       if ((t37_appr_bas.getScore() == null) || (t37_appr_bas.getScore().equals(""))) {
/* 184 */         t37_appr_bas.setScore(t37_appr_bas.getOld_score());
/*     */       }
/* 186 */       if (t37_appr_bas.getOld_score() == null) {
/* 187 */         t37_appr_bas.setOld_score("0");
/*     */       }
/* 189 */       if (t37_appr_bas.getBase_score().indexOf(".") == 0) {
/* 190 */         t37_appr_bas.setBase_occ("0" + t37_appr_bas.getBase_score());
/*     */       }
/* 192 */       if (t37_appr_bas.getBasic_val().indexOf(".") == 0) {
/* 193 */         t37_appr_bas.setBasic_val("0" + t37_appr_bas.getBasic_val());
/*     */       }
/* 195 */       if (t37_appr_bas.getOld_score().indexOf(".") == 0) {
/* 196 */         t37_appr_bas.setOld_score("0" + t37_appr_bas.getOld_score());
/*     */       }
/* 198 */       if (t37_appr_bas.getScore().indexOf(".") == 0) {
/* 199 */         t37_appr_bas.setScore("0" + t37_appr_bas.getScore());
/*     */       }
/* 201 */       t37_appr_elem_rsltList.add(t37_appr_bas);
/*     */     }
/*     */ 
/* 204 */     return t37_appr_elem_rsltList;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_bas_rslt_uhList(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 209 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_bas_rslt_uhList", 
/* 210 */       t37_appr_bas_rslt);
/* 211 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_elem_rsltList(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 216 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_elem_rsltList", 
/* 217 */       t37_appr_bas_rslt);
/* 218 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_elem_rslt_dispList(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 223 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_elem_rslt_dispList", 
/* 224 */       t37_appr_bas_rslt);
/* 225 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_bas_rslt_dispList(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 230 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_bas_rslt_dispList", 
/* 231 */       t37_appr_bas_rslt);
/* 232 */     ArrayList t37_appr_elem_rsltList = new ArrayList();
/* 233 */     for (int i = 0; i < list.size(); i++) {
/* 234 */       T37_appr_bas_rslt t37_appr_bas = (T37_appr_bas_rslt)list.get(i);
/* 235 */       t37_appr_bas.setElement_score(Double.valueOf(t37_appr_bas.getScore_d()));
/* 236 */       t37_appr_elem_rsltList.add(t37_appr_bas);
/*     */     }
/* 238 */     return t37_appr_elem_rsltList;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_appr_elem_rsltList1(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException {
/* 242 */     LinkedHashMap newrisk_jf_js_type_map = this.cm.getMapFromCache("newrisk_jf_js_type");
/* 243 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT37_appr_elem_rsltList1", 
/* 244 */       t37_appr_bas_rslt);
/* 245 */     ArrayList t37_appr_elem_rsltList = new ArrayList();
/* 246 */     for (int i = 0; i < list.size(); i++) {
/* 247 */       T37_appr_bas_rslt t37_appr_bas = (T37_appr_bas_rslt)list.get(i);
/* 248 */       t37_appr_bas.setJs_type_disp((String)newrisk_jf_js_type_map.get(t37_appr_bas.getJs_type()));
/* 249 */       if (t37_appr_bas.getScore() == null) {
/* 250 */         t37_appr_bas.setScore("");
/*     */       }
/* 252 */       if (t37_appr_bas.getBase_occ().equals("0.00")) {
/* 253 */         t37_appr_bas.setBase_occ("");
/*     */       }
/* 255 */       t37_appr_elem_rsltList.add(t37_appr_bas);
/*     */     }
/* 257 */     return t37_appr_elem_rsltList;
/*     */   }
/*     */ 
/*     */   public int getMaxTreeLaye(SqlMapClient sqlMap, T37_appr_bas_rslt t37_appr_bas_rslt) throws SQLException
/*     */   {
/* 262 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 263 */       "getMaxTreeLaye", t37_appr_bas_rslt);
/* 264 */     if (iCount == null) {
/* 265 */       return 0;
/*     */     }
/* 267 */     return iCount.intValue() - 1;
/*     */   }
/*     */ 
/*     */   public ArrayList getT31_n_moveopRiskList(SqlMapClient sqlMap, String node_id) throws SQLException
/*     */   {
/* 272 */     ArrayList t31_n_moveList = this.cm.getListFromCache("t31_n_moveList");
/* 273 */     ArrayList list = new ArrayList();
/* 274 */     for (int i = 0; i < t31_n_moveList.size(); i++) {
/* 275 */       T31_n_move t31_n_move = (T31_n_move)t31_n_moveList.get(i);
/* 276 */       if (t31_n_move.getNode_id().equals(node_id)) {
/* 277 */         list.add(t31_n_move);
/*     */       }
/*     */     }
/* 280 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_level_auditList(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException
/*     */   {
/* 285 */     List t37_level_auditList = sqlMap.queryForList("getT37_level_auditList", t37_party_result);
/* 286 */     LinkedHashMap postid2name = this.cm.getMapFromCache("t31_node");
/* 287 */     LinkedHashMap riskLevelMap = this.cm.getMapFromCache("t31_risk_level");
/* 288 */     ArrayList list = new ArrayList();
/* 289 */     for (int i = 0; i < t37_level_auditList.size(); i++) {
/* 290 */       T37_level_audit t37_level_audit = (T37_level_audit)t37_level_auditList.get(i);
/* 291 */       if ((t37_level_audit.getLevel_before_adjust() != null) && (!"".equals(t37_level_audit.getLevel_before_adjust()))) {
/* 292 */         t37_level_audit.setLevel_before_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_before_adjust()));
/*     */       }
/* 294 */       if ((t37_level_audit.getLevel_after_adjust() != null) && (!"".equals(t37_level_audit.getLevel_after_adjust()))) {
/* 295 */         t37_level_audit.setLevel_after_adjust((String)riskLevelMap.get(t37_level_audit.getLevel_after_adjust()));
/*     */       }
/* 297 */       if (t37_level_audit.getLast_upd_dt() != null) {
/* 298 */         t37_level_audit.setLast_upd_dt_disp(DateUtils.dateToStringShort(t37_level_audit.getLast_upd_dt()));
/*     */       }
/* 300 */       if ((t37_level_audit.getRes_post_id() != null) && (!"".equals(t37_level_audit.getRes_post_id()))) {
/* 301 */         t37_level_audit.setRes_post_id((String)postid2name.get(t37_level_audit.getRes_post_id()));
/*     */       }
/*     */ 
/* 304 */       if ((t37_level_audit.getPost_id() != null) && (!"".equals(t37_level_audit.getPost_id()))) {
/* 305 */         t37_level_audit.setPost_id((String)postid2name.get(t37_level_audit.getPost_id()));
/*     */       }
/* 307 */       list.add(t37_level_audit);
/*     */     }
/* 309 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_level_audit_uhList(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException
/*     */   {
/* 314 */     List t37_level_auditList = sqlMap.queryForList(
/* 315 */       "getT37_level_audit_uhList", t37_party_result);
/* 316 */     LinkedHashMap postid2name = this.cm.getMapFromCache("t31_node");
/* 317 */     LinkedHashMap riskLevelMap = this.cm.getMapFromCache("t31_risk_level");
/* 318 */     ArrayList list = new ArrayList();
/* 319 */     for (int i = 0; i < t37_level_auditList.size(); i++) {
/* 320 */       T37_level_audit t37_level_audit = 
/* 321 */         (T37_level_audit)t37_level_auditList
/* 321 */         .get(i);
/* 322 */       if ((t37_level_audit.getLevel_before_adjust() != null) && 
/* 323 */         (!"".equals(t37_level_audit.getLevel_before_adjust()))) {
/* 324 */         t37_level_audit.setLevel_before_adjust(
/* 325 */           (String)riskLevelMap
/* 325 */           .get(t37_level_audit.getLevel_before_adjust()));
/*     */       }
/* 327 */       if ((t37_level_audit.getLevel_after_adjust() != null) && 
/* 328 */         (!"".equals(t37_level_audit.getLevel_after_adjust()))) {
/* 329 */         t37_level_audit.setLevel_after_adjust(
/* 330 */           (String)riskLevelMap
/* 330 */           .get(t37_level_audit.getLevel_after_adjust()));
/*     */       }
/* 332 */       if (t37_level_audit.getLast_upd_dt() != null) {
/* 333 */         t37_level_audit.setLast_upd_dt_disp(
/* 334 */           DateUtils.dateToStringShort(t37_level_audit.getLast_upd_dt()));
/*     */       }
/* 336 */       if ((t37_level_audit.getRes_post_id() != null) && 
/* 337 */         (!"".equals(t37_level_audit.getRes_post_id()))) {
/* 338 */         t37_level_audit.setRes_post_id(
/* 339 */           (String)postid2name
/* 339 */           .get(t37_level_audit.getRes_post_id()));
/*     */       }
/*     */ 
/* 342 */       if ((t37_level_audit.getPost_id() != null) && 
/* 343 */         (!"".equals(t37_level_audit.getPost_id()))) {
/* 344 */         t37_level_audit.setPost_id(
/* 345 */           (String)postid2name
/* 345 */           .get(t37_level_audit.getPost_id()));
/*     */       }
/* 347 */       list.add(t37_level_audit);
/*     */     }
/* 349 */     return list;
/*     */   }
/*     */ 
/*     */   public int modifyT37_appr_bas_rslt(SqlMapClient sqlMap, String sql) throws SQLException
/*     */   {
/* 354 */     int i = sqlMap.update("modifyT37_appr_bas_rslt", sql);
/* 355 */     return i;
/*     */   }
/*     */ 
/*     */   public T37_party_result getT37_party_resultDisp(SqlMapClient sqlMap, T37_party_result t37_party_result_temp)
/*     */     throws SQLException
/*     */   {
/* 368 */     T37_party_result t37_party_result = (T37_party_result)sqlMap.queryForObject("getT37_party_result_Disp", t37_party_result_temp);
/* 369 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 370 */     LinkedHashMap risk_gsnameMap = this.cm.getMapFromCache("risk_gs_name");
/* 371 */     LinkedHashMap risk_gsrmMap = this.cm.getMapFromCache("risk_gsrm");
/* 372 */     LinkedHashMap risk_templateMap = this.cm.getMapFromCache("risk_template_name");
/* 373 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*     */ 
/* 375 */     if (t37_party_result != null) {
/* 376 */       if ((t37_party_result.getParty_class_cd() != null) && (!"".equals(t37_party_result.getParty_class_cd()))) {
/* 377 */         t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
/*     */       }
/* 379 */       if ((t37_party_result.getFristappralevel() != null) && (!"".equals(t37_party_result.getFristappralevel()))) {
/* 380 */         t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
/*     */       }
/* 382 */       if ((t37_party_result.getEmendationlevel() != null) && (!"".equals(t37_party_result.getEmendationlevel()))) {
/* 383 */         t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
/*     */       }
/* 385 */       if ((t37_party_result.getLevelkey() != null) && (!"".equals(t37_party_result.getLevelkey()))) {
/* 386 */         t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
/*     */       }
/* 388 */       if ((t37_party_result.getGskey() != null) && (!"".equals(t37_party_result.getGskey()))) {
/* 389 */         t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
/* 390 */         t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
/*     */       }
/* 392 */       if ((t37_party_result.getTemplatekey() != null) && (!"".equals(t37_party_result.getTemplatekey()))) {
/* 393 */         t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
/*     */       }
/* 395 */       if (t37_party_result.getStatistic_dt() != null)
/* 396 */         t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
/*     */     }
/*     */     else {
/* 399 */       t37_party_result = new T37_party_result();
/*     */     }
/* 401 */     return t37_party_result;
/*     */   }
/*     */ 
/*     */   public T37_party_result getT37_party_result_uhDisp(SqlMapClient sqlMap, T37_party_result t37_party_result_temp)
/*     */     throws SQLException
/*     */   {
/* 407 */     T37_party_result t37_party_result = (T37_party_result)sqlMap.queryForObject("getT37_party_result_uhDisp1", t37_party_result_temp);
/* 408 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 409 */     LinkedHashMap risk_gsnameMap = this.cm.getMapFromCache("risk_gs_name");
/* 410 */     LinkedHashMap risk_gsrmMap = this.cm.getMapFromCache("risk_gsrm");
/* 411 */     LinkedHashMap risk_templateMap = this.cm.getMapFromCache("risk_template_name");
/* 412 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*     */ 
/* 414 */     if (t37_party_result != null) {
/* 415 */       if ((t37_party_result.getParty_class_cd() != null) && (!"".equals(t37_party_result.getParty_class_cd()))) {
/* 416 */         t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
/*     */       }
/* 418 */       if ((t37_party_result.getFristappralevel() != null) && (!"".equals(t37_party_result.getFristappralevel()))) {
/* 419 */         t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
/*     */       }
/* 421 */       if ((t37_party_result.getEmendationlevel() != null) && (!"".equals(t37_party_result.getEmendationlevel()))) {
/* 422 */         t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
/*     */       }
/* 424 */       if ((t37_party_result.getLevelkey() != null) && (!"".equals(t37_party_result.getLevelkey()))) {
/* 425 */         t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
/*     */       }
/* 427 */       if ((t37_party_result.getGskey() != null) && (!"".equals(t37_party_result.getGskey()))) {
/* 428 */         t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
/* 429 */         t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
/*     */       }
/* 431 */       if ((t37_party_result.getTemplatekey() != null) && (!"".equals(t37_party_result.getTemplatekey()))) {
/* 432 */         t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
/*     */       }
/* 434 */       if (t37_party_result.getStatistic_dt() != null)
/* 435 */         t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
/*     */     }
/*     */     else {
/* 438 */       t37_party_result = new T37_party_result();
/*     */     }
/* 440 */     return t37_party_result;
/*     */   }
/*     */ 
/*     */   public T37_party_result getT37_party_result_jfDisp(SqlMapClient sqlMap, T37_party_result t37_party_result_temp)
/*     */     throws SQLException
/*     */   {
/* 448 */     T37_party_result t37_party_result = (T37_party_result)sqlMap.queryForObject("getT37_party_result_Disp", t37_party_result_temp);
/* 449 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 450 */     LinkedHashMap risk_gsnameMap = this.cm.getMapFromCache("risk_gs_name");
/* 451 */     LinkedHashMap risk_gsrmMap = this.cm.getMapFromCache("risk_gsrm");
/* 452 */     LinkedHashMap risk_templateMap = this.cm.getMapFromCache("risk_template_name");
/* 453 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*     */ 
/* 455 */     if (t37_party_result != null) {
/* 456 */       if ((t37_party_result.getParty_class_cd() != null) && (!"".equals(t37_party_result.getParty_class_cd()))) {
/* 457 */         t37_party_result.setParty_class_cd((String)clienttypeMap.get(t37_party_result.getParty_class_cd()));
/*     */       }
/* 459 */       if ((t37_party_result.getFristappralevel() != null) && (!"".equals(t37_party_result.getFristappralevel()))) {
/* 460 */         t37_party_result.setFristappralevel_disp((String)levelMap.get(t37_party_result.getFristappralevel()));
/*     */       }
/* 462 */       if ((t37_party_result.getEmendationlevel() != null) && (!"".equals(t37_party_result.getEmendationlevel()))) {
/* 463 */         t37_party_result.setEmendationlevel_disp((String)levelMap.get(t37_party_result.getEmendationlevel()));
/*     */       }
/* 465 */       if ((t37_party_result.getLevelkey() != null) && (!"".equals(t37_party_result.getLevelkey()))) {
/* 466 */         t37_party_result.setLevelkey_disp((String)levelMap.get(t37_party_result.getLevelkey()));
/*     */       }
/* 468 */       if ((t37_party_result.getGskey() != null) && (!"".equals(t37_party_result.getGskey()))) {
/* 469 */         t37_party_result.setGsname((String)risk_gsnameMap.get(t37_party_result.getGskey()));
/* 470 */         t37_party_result.setGsrm((String)risk_gsrmMap.get(t37_party_result.getGskey()));
/*     */       }
/* 472 */       if ((t37_party_result.getTemplatekey() != null) && (!"".equals(t37_party_result.getTemplatekey()))) {
/* 473 */         t37_party_result.setTemplatename((String)risk_templateMap.get(t37_party_result.getTemplatekey()));
/*     */       }
/* 475 */       if (t37_party_result.getStatistic_dt() != null) {
/* 476 */         t37_party_result.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result.getStatistic_dt()));
/*     */       }
/* 478 */       if ((t37_party_result.getLastscore() == null) || (t37_party_result.getLastscore().equals(""))) {
/* 479 */         t37_party_result.setLastscore(t37_party_result.getScore());
/*     */       }
/* 481 */       if (t37_party_result.getTemptype().equals("1")) {
/* 482 */         T31_risk_level t31_risk_level_temp = new T31_risk_level();
/* 483 */         ArrayList t31_risk_levelList = (ArrayList)sqlMap.queryForList("t31_risk_levelList");
/* 484 */         if ((t37_party_result.getLastscore() != null) && (!"".equals(t37_party_result.getLastscore()))) {
/* 485 */           for (int i = 0; i < t31_risk_levelList.size(); i++) {
/* 486 */             T31_risk_level t31_risk_level = (T31_risk_level)t31_risk_levelList.get(i);
/* 487 */             double min = t31_risk_level.getLevelmin_d().doubleValue();
/* 488 */             double max = t31_risk_level.getLevelmax_d().doubleValue();
/* 489 */             double score = Double.parseDouble(String.valueOf(t37_party_result.getLastscore()));
/* 490 */             if ((t31_risk_level.getMinisclosed().equals("0")) && (t31_risk_level.getMaxisclosed().equals("0")) && 
/* 491 */               (min < score) && (score < max)) {
/* 492 */               t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
/* 493 */               t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
/*     */             }
/*     */ 
/* 496 */             if ((t31_risk_level.getMinisclosed().equals("1")) && (t31_risk_level.getMaxisclosed().equals("1")) && 
/* 497 */               (min <= score) && (score <= max)) {
/* 498 */               t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
/* 499 */               t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
/*     */             }
/*     */ 
/* 502 */             if ((t31_risk_level.getMinisclosed().equals("0")) && (t31_risk_level.getMaxisclosed().equals("1")) && 
/* 503 */               (min < score) && (score <= max)) {
/* 504 */               t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
/* 505 */               t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
/*     */             }
/*     */ 
/* 508 */             if ((t31_risk_level.getMinisclosed().equals("1")) && (t31_risk_level.getMaxisclosed().equals("0")) && 
/* 509 */               (min <= score) && (score < max)) {
/* 510 */               t37_party_result.setEmendationlevel(t31_risk_level.getLevelkey());
/* 511 */               t37_party_result.setEmendationlevel_disp((String)levelMap.get(t31_risk_level.getLevelkey()));
/*     */             }
/*     */           }
/*     */         }
/*     */       }
/*     */     }
/*     */     else
/*     */     {
/* 519 */       t37_party_result = new T37_party_result();
/*     */     }
/* 521 */     return t37_party_result;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_gs_indicValList(SqlMapClient sqlMap, T37_party_result t37_party_result_temp) throws SQLException {
/* 525 */     List t37_gs_indicValList = sqlMap.queryForList("getT37_gs_indicValList", t37_party_result_temp);
/* 526 */     ArrayList list = new ArrayList();
/* 527 */     LinkedHashMap indic_nameMap = this.cm.getMapFromCache("t21_indic_name");
/* 528 */     LinkedHashMap risk_gsnameMap = this.cm.getMapFromCache("risk_gs_name");
/* 529 */     for (int i = 0; i < t37_gs_indicValList.size(); i++) {
/* 530 */       T37_party_result t37_pt_result = (T37_party_result)t37_gs_indicValList.get(i);
/* 531 */       if ((t37_pt_result.getIndickey() != null) && (!"".equals(t37_pt_result.getIndickey()))) {
/* 532 */         t37_pt_result.setIndicname((String)indic_nameMap.get(t37_pt_result.getIndickey()));
/*     */       }
/* 534 */       if ((t37_pt_result.getGskey() != null) && (!"".equals(t37_pt_result.getGskey()))) {
/* 535 */         t37_pt_result.setGsname((String)risk_gsnameMap.get(t37_pt_result.getGskey()));
/*     */       }
/* 537 */       list.add(t37_pt_result);
/*     */     }
/* 539 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT37_gs_indicVal_uhList(SqlMapClient sqlMap, T37_party_result t37_party_result_temp) throws SQLException {
/* 543 */     List t37_gs_indicValList = sqlMap.queryForList("getT37_gs_indicVal_uhList", t37_party_result_temp);
/* 544 */     ArrayList list = new ArrayList();
/* 545 */     LinkedHashMap indic_nameMap = this.cm.getMapFromCache("t21_indic_name");
/* 546 */     LinkedHashMap risk_gsnameMap = this.cm.getMapFromCache("risk_gs_name");
/* 547 */     for (int i = 0; i < t37_gs_indicValList.size(); i++) {
/* 548 */       T37_party_result t37_pt_result = (T37_party_result)t37_gs_indicValList.get(i);
/* 549 */       if ((t37_pt_result.getIndickey() != null) && (!"".equals(t37_pt_result.getIndickey()))) {
/* 550 */         t37_pt_result.setIndicname((String)indic_nameMap.get(t37_pt_result.getIndickey()));
/*     */       }
/* 552 */       if ((t37_pt_result.getGskey() != null) && (!"".equals(t37_pt_result.getGskey()))) {
/* 553 */         t37_pt_result.setGsname((String)risk_gsnameMap.get(t37_pt_result.getGskey()));
/*     */       }
/* 555 */       list.add(t37_pt_result);
/*     */     }
/* 557 */     return list;
/*     */   }
/*     */ 
/*     */   public int modifyT37_party_resultStatusForReport(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException {
/* 561 */     int i = sqlMap.update("modifyT37_party_resultStatusForReport", t37_party_result);
/* 562 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT37_party_resultLastScore(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException
/*     */   {
/* 567 */     int i = sqlMap.update("modifyT37_party_resultLastScore", t37_party_result);
/* 568 */     return i;
/*     */   }
/*     */ 
/*     */   public int insertT37_level_audit(SqlMapClient sqlMap, T37_level_audit t37_level_audit) throws SQLException
/*     */   {
/* 573 */     int i = sqlMap.update("insertT37_level_audit", t37_level_audit);
/* 574 */     return i;
/*     */   }
/*     */ 
/*     */   public int modifyT37_party_resultStatus(SqlMapClient sqlMap, T37_party_result t37_party_result)
/*     */     throws SQLException
/*     */   {
/* 588 */     int i = sqlMap.update("modifyT37_party_resultStatus", t37_party_result);
/* 589 */     return i;
/*     */   }
/*     */ 
/*     */   public List<T37_appr_bas_rslt> getReCalList(SqlMapClient sqlMap, T37_party_result t37_party_result) throws SQLException
/*     */   {
/* 594 */     return sqlMap.queryForList("getReCalList", t37_party_result);
/*     */   }
/*     */ 
/*     */   public T37_party_result getT37_party_resultDispBy_party_id(SqlMapClient sqlMap, T37_party_result t37_party_result_temp) throws SQLException
/*     */   {
/* 599 */     T37_party_result t37_party_result = (T37_party_result)sqlMap.queryForObject("getT37_party_result_DispBy_party_id", t37_party_result_temp);
/* 600 */     if (t37_party_result == null) {
/* 601 */       t37_party_result = new T37_party_result();
/*     */     }
/* 603 */     return t37_party_result;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.dao.T37_party_resultDAO
 * JD-Core Version:    0.6.2
 */