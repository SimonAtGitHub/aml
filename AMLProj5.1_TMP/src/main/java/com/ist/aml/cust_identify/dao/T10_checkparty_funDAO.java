/*     */ package com.ist.aml.cust_identify.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty_fun;
/*     */ import com.ist.common.LogUtils;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Iterator;
/*     */ import java.util.LinkedHashMap;
/*     */ import org.apache.log4j.Logger;
/*     */ 
/*     */ public class T10_checkparty_funDAO extends BaseDAO
/*     */ {
/*  33 */   private static Logger logger = LogUtils.getLogger(T10_checkparty_funDAO.class.getName());
/*     */ 
/*     */   public ArrayList getT10_party_riskList(SqlMapClient sqlMap, T10_checkparty_fun t10_PartyRisk, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/*  43 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_party_riskList", 
/*  44 */       t10_PartyRisk, startRec, intPageSize);
/*  45 */     ArrayList t10_party_riskList = new ArrayList();
/*     */ 
/*  47 */     LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*     */ 
/*  50 */     Iterator iter = list.iterator();
/*  51 */     while (iter.hasNext()) {
/*  52 */       T10_checkparty_fun t10_PartyRisk1 = (T10_checkparty_fun)iter.next();
/*  53 */       if (t10_PartyRisk1.getRisk_type() != null) {
/*  54 */         t10_PartyRisk1.setRisk_type(
/*  55 */           (String)risk_typeMap
/*  55 */           .get(t10_PartyRisk1.getRisk_type()));
/*     */       }
/*  57 */       if (t10_PartyRisk1.getRisk_validite_dt() != null) {
/*  58 */         t10_PartyRisk1.setRisk_validite_dt_disp(DateUtils.dateToStringShort(t10_PartyRisk1.getRisk_validite_dt()));
/*     */       }
/*  60 */       if (t10_PartyRisk1.getRisk_create_dt() != null) {
/*  61 */         t10_PartyRisk1.setRisk_create_dt_disp(DateUtils.dateToStringShort(t10_PartyRisk1.getRisk_create_dt()));
/*     */       }
/*     */ 
/*  64 */       t10_party_riskList.add(t10_PartyRisk1);
/*     */     }
/*  66 */     return t10_party_riskList;
/*     */   }
/*     */ 
/*     */   public int getT10_party_riskListCount(SqlMapClient sqlMap, T10_checkparty_fun t10_PartyRisk) throws SQLException {
/*  70 */     Integer iCount = (Integer)sqlMap.queryForObject(
/*  71 */       "getT10_party_riskListCount", t10_PartyRisk);
/*  72 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_party_risk(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRisk)
/*     */     throws SQLException
/*     */   {
/*  83 */     Integer iCount = Integer.valueOf(sqlMap.update(
/*  84 */       "insertT10_party_risk", t10PartyRisk));
/*  85 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyT10_party_risk(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRisk)
/*     */     throws SQLException
/*     */   {
/*  95 */     Integer iCount = Integer.valueOf(sqlMap.update(
/*  96 */       "modifyT10_party_risk", t10PartyRisk));
/*  97 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int deleteT10_party_risk(SqlMapClient sqlMap, String partyrisk_no)
/*     */     throws SQLException
/*     */   {
/* 107 */     Integer iCount = Integer.valueOf(sqlMap.update(
/* 108 */       "deleteT10_party_risk", partyrisk_no));
/* 109 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T10_checkparty_fun getT10_party_riskDisp(SqlMapClient sqlMap, String partyriskNo)
/*     */     throws SQLException
/*     */   {
/* 121 */     T10_checkparty_fun t10_checkparty_fun = (T10_checkparty_fun)sqlMap.queryForObject("getT10_party_riskDisp", partyriskNo);
/*     */ 
/* 123 */     LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*     */ 
/* 125 */     if (t10_checkparty_fun == null) {
/* 126 */       t10_checkparty_fun = new T10_checkparty_fun();
/*     */     }
/* 128 */     t10_checkparty_fun.setRisk_validite_dt_disp(DateUtils.dateToStringShort(t10_checkparty_fun
/* 129 */       .getRisk_validite_dt()));
/* 130 */     if (t10_checkparty_fun.getRisk_type() != null) {
/* 131 */       t10_checkparty_fun.setRisk_type_disp((String)risk_typeMap.get(t10_checkparty_fun
/* 132 */         .getRisk_type()));
/*     */     }
/* 134 */     if (t10_checkparty_fun.getElement_score() != null) {
/* 135 */       String elementscor = t10_checkparty_fun.getElement_score();
/* 136 */       if (elementscor.substring(0, 1).equals(".")) {
/* 137 */         elementscor = "0" + elementscor;
/*     */       }
/* 139 */       t10_checkparty_fun.setElement_score(elementscor);
/*     */     }
/*     */ 
/* 142 */     return t10_checkparty_fun;
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_check_reasonList(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRisk)
/*     */     throws SQLException
/*     */   {
/* 153 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_check_reasonList", t10PartyRisk);
/* 154 */     return list;
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_party_reltList(SqlMapClient sqlMap, T10_checkparty_fun t10_party_relt, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/* 167 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_party_reltList", 
/* 168 */       t10_party_relt, startRec, intPageSize);
/* 169 */     ArrayList t10_party_reltList = new ArrayList();
/*     */ 
/* 171 */     LinkedHashMap check_typeMap = this.cm.getMapFromCache("cust_checktype");
/* 172 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 173 */     LinkedHashMap check_methodMap = this.cm.getMapFromCache("check_method");
/* 174 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/* 175 */     Iterator iter = list.iterator();
/* 176 */     while (iter.hasNext()) {
/* 177 */       T10_checkparty_fun party_relt = (T10_checkparty_fun)iter.next();
/* 178 */       if (party_relt.getCheck_type() != null) {
/* 179 */         party_relt.setCheck_type_disp(
/* 180 */           (String)check_typeMap
/* 180 */           .get(party_relt.getCheck_type()));
/*     */       }
/* 182 */       if (party_relt.getChecker_org() != null) {
/* 183 */         party_relt.setChecker_org_name((String)organMap.get(party_relt.getChecker_org()));
/*     */       }
/* 185 */       if (party_relt.getCheck_method() != null) {
/* 186 */         party_relt.setCheck_method_disp((String)check_methodMap.get(party_relt.getCheck_method()));
/*     */       }
/* 188 */       if (party_relt.getCheck_result() != null) {
/* 189 */         party_relt.setCheck_result_disp((String)check_resultMap.get(party_relt.getCheck_result()));
/*     */       }
/* 191 */       if (party_relt.getCheck_dt() != null) {
/* 192 */         party_relt.setCheck_dt_disp(DateUtils.dateToStringShort(party_relt.getCheck_dt()));
/*     */       }
/* 194 */       if (party_relt.getValid_dt() != null) {
/* 195 */         party_relt.setValid_dt_disp(DateUtils.dateToStringShort(party_relt.getValid_dt()));
/*     */       }
/*     */ 
/* 198 */       t10_party_reltList.add(party_relt);
/*     */     }
/* 200 */     return t10_party_reltList;
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_party_relt_viewList(SqlMapClient sqlMap, T10_checkparty_fun t10_party_relt, int startRec, int intPageSize) throws SQLException {
/* 204 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_party_relt_viewList", 
/* 205 */       t10_party_relt, startRec, intPageSize);
/* 206 */     ArrayList t10_party_reltList = new ArrayList();
/*     */ 
/* 208 */     LinkedHashMap check_typeMap = this.cm.getMapFromCache("alreadycheck_type");
/* 209 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 210 */     LinkedHashMap check_methodMap = this.cm.getMapFromCache("check_method");
/* 211 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/* 212 */     Iterator iter = list.iterator();
/* 213 */     while (iter.hasNext()) {
/* 214 */       T10_checkparty_fun party_relt = (T10_checkparty_fun)iter.next();
/* 215 */       if (party_relt.getCheck_type() != null) {
/* 216 */         party_relt.setCheck_type_disp(
/* 217 */           (String)check_typeMap
/* 217 */           .get(party_relt.getCheck_type()));
/*     */       }
/* 219 */       if (party_relt.getChecker_org() != null) {
/* 220 */         party_relt.setChecker_org_name((String)organMap.get(party_relt.getChecker_org()));
/*     */       }
/* 222 */       if (party_relt.getCheck_method() != null) {
/* 223 */         party_relt.setCheck_method_disp((String)check_methodMap.get(party_relt.getCheck_method()));
/*     */       }
/* 225 */       if (party_relt.getCheck_result() != null) {
/* 226 */         party_relt.setCheck_result_disp((String)check_resultMap.get(party_relt.getCheck_result()));
/*     */       }
/* 228 */       if (party_relt.getCheck_dt() != null) {
/* 229 */         party_relt.setCheck_dt_disp(DateUtils.dateToStringShort(party_relt.getCheck_dt()));
/*     */       }
/* 231 */       if (party_relt.getValid_dt() != null) {
/* 232 */         party_relt.setValid_dt_disp(DateUtils.dateToStringShort(party_relt.getValid_dt()));
/*     */       }
/*     */ 
/* 235 */       t10_party_reltList.add(party_relt);
/*     */     }
/* 237 */     return t10_party_reltList;
/*     */   }
/*     */   public int getT10_party_relt_viewCount(SqlMapClient sqlMap, T10_checkparty_fun t10_party_relt) throws SQLException {
/* 240 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 241 */       "getT10_party_relt_viewCount", t10_party_relt);
/* 242 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int getT10_party_reltCount(SqlMapClient sqlMap, T10_checkparty_fun t10_party_relt)
/*     */     throws SQLException
/*     */   {
/* 254 */     Integer iCount = (Integer)sqlMap.queryForObject(
/* 255 */       "getT10_party_reltCount", t10_party_relt);
/* 256 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T10_checkparty_fun getT10_checkparty_reltDisp(SqlMapClient sqlMap, String checkNo)
/*     */     throws SQLException
/*     */   {
/* 267 */     T10_checkparty_fun t10_checkparty_fun = (T10_checkparty_fun)sqlMap.queryForObject("getT10_checkparty_reltDisp", checkNo);
/*     */ 
/* 269 */     return t10_checkparty_fun;
/*     */   }
/*     */ 
/*     */   public int modifyT10_checkparty_relt(SqlMapClient sqlMap, T10_checkparty_fun t10_party_relt)
/*     */     throws SQLException
/*     */   {
/* 280 */     Integer iCount = Integer.valueOf(sqlMap.update("modifyT10_checkparty_relt", t10_party_relt));
/* 281 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_checkparty_relt(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt)
/*     */     throws SQLException
/*     */   {
/* 293 */     Integer iCount = Integer.valueOf(sqlMap.update("insertT10_checkparty_relt", t10PartyRelt));
/* 294 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T10_checkparty_fun getT10_checkparty_relt_disp(SqlMapClient sqlMap, String checkNo) throws SQLException {
/* 298 */     LinkedHashMap check_methodMap = this.cm.getMapFromCache("check_method");
/*     */ 
/* 300 */     LinkedHashMap agent_flagMap = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 302 */     LinkedHashMap lian_flagMap = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 304 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/*     */ 
/* 306 */     LinkedHashMap w_Map = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 308 */     LinkedHashMap b_Map = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 310 */     LinkedHashMap credit_flag = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 312 */     LinkedHashMap check_typeMap = this.cm.getMapFromCache("cust_checktype");
/*     */ 
/* 314 */     LinkedHashMap recheck_typeMap = this.cm.getMapFromCache("recheck_type");
/*     */ 
/* 316 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/*     */ 
/* 318 */     LinkedHashMap auditlevel_flagMap = this.cm.getMapFromCache("yesNo");
/*     */ 
/* 320 */     LinkedHashMap auditlevel_Map = this.cm.getMapFromCache("risk_level");
/* 321 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 322 */     T10_checkparty_fun checkparty_relt = (T10_checkparty_fun)sqlMap.queryForObject("getT10_checkparty_reltDisp", checkNo);
/* 323 */     if (checkparty_relt.getCheck_method() != null) {
/* 324 */       checkparty_relt.setCheck_method_disp((String)check_methodMap.get(checkparty_relt.getCheck_method()));
/*     */     }
/* 326 */     if (checkparty_relt.getAgent_flag() != null) {
/* 327 */       checkparty_relt.setAgent_flag_disp((String)agent_flagMap.get(checkparty_relt.getAgent_flag()));
/*     */     }
/* 329 */     if (checkparty_relt.getLian_flag() != null) {
/* 330 */       checkparty_relt.setLian_flag_disp((String)lian_flagMap.get(checkparty_relt.getLian_flag()));
/*     */     }
/* 332 */     if (checkparty_relt.getAddw_flag() != null) {
/* 333 */       checkparty_relt.setAddw_flag((String)w_Map.get(checkparty_relt.getAddw_flag()));
/*     */     }
/* 335 */     if (checkparty_relt.getAddb_flag() != null) {
/* 336 */       checkparty_relt.setAddb_flag((String)b_Map.get(checkparty_relt.getAddb_flag()));
/*     */     }
/* 338 */     if (checkparty_relt.getCredit_flag() != null) {
/* 339 */       checkparty_relt.setCredit_flag_disp((String)credit_flag.get(checkparty_relt.getCredit_flag()));
/*     */     }
/* 341 */     if (checkparty_relt.getCheck_result() != null) {
/* 342 */       checkparty_relt.setCheck_result_disp((String)check_resultMap.get(checkparty_relt.getCheck_result()));
/*     */     }
/* 344 */     if (checkparty_relt.getCheck_type() != null) {
/* 345 */       checkparty_relt.setCheck_type_disp((String)check_typeMap.get(checkparty_relt.getCheck_type()));
/*     */     }
/* 347 */     if (checkparty_relt.getRecheck_type() != null) {
/* 348 */       checkparty_relt.setRecheck_type_disp((String)recheck_typeMap.get(checkparty_relt.getRecheck_type()));
/*     */     }
/* 350 */     if (checkparty_relt.getValid_dt() != null) {
/* 351 */       checkparty_relt.setValid_dt_disp(DateUtils.dateToStringShort(checkparty_relt.getValid_dt()));
/*     */     }
/* 353 */     if (checkparty_relt.getCheck_dt() != null) {
/* 354 */       checkparty_relt.setCheck_dt_disp(DateUtils.dateToStringShort(checkparty_relt.getCheck_dt()));
/*     */     }
/* 356 */     if (checkparty_relt.getParty_class_cd() != null) {
/* 357 */       checkparty_relt.setParty_class_cd_disp((String)clienttypeMap.get(checkparty_relt.getParty_class_cd()));
/*     */     }
/* 359 */     if (checkparty_relt.getAuditlevel_flag() != null) {
/* 360 */       checkparty_relt.setAuditlevel_flag((String)auditlevel_flagMap.get(checkparty_relt.getAuditlevel_flag()));
/*     */     }
/* 362 */     if (checkparty_relt.getChecker_org() != null) {
/* 363 */       checkparty_relt.setChecker_org_name((String)organMap.get(checkparty_relt.getChecker_org()));
/*     */     }
/* 365 */     if (checkparty_relt.getAuditlevel() != null) {
/* 366 */       checkparty_relt.setAuditlevel((String)auditlevel_Map.get(checkparty_relt.getAuditlevel()));
/*     */     }
/* 368 */     return checkparty_relt;
/*     */   }
/*     */ 
/*     */   public int insertT10_check_party_reason(SqlMapClient sqlMap, T10_checkparty_fun checkpartyArti) throws SQLException
/*     */   {
/* 373 */     Integer iCount = Integer.valueOf(sqlMap.update("insertT10_check_party_reason", checkpartyArti));
/* 374 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int updateT08_party_result(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt) throws SQLException
/*     */   {
/* 379 */     Integer iCount = Integer.valueOf(sqlMap.update("updateT08_party_result", t10PartyRelt));
/* 380 */     return iCount.intValue();
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dao.T10_checkparty_funDAO
 * JD-Core Version:    0.6.2
 */