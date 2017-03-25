/*     */ package com.ist.aml.cust_identify.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty;
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
/*     */ public class T10_checkpartyDAO extends BaseDAO
/*     */ {
/*  29 */   private static Logger logger = LogUtils.getLogger(T10_checkpartyDAO.class.getName());
/*     */ 
/*     */   public ArrayList getT10_checkparty_newlist(SqlMapClient sqlMap, T10_checkparty t10_checkparty, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/*  48 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_checkparty_newList", t10_checkparty, startRec, intPageSize);
/*  49 */     LinkedHashMap party_class_cdMap = this.cm.getMapFromCache("clienttype");
/*  50 */     LinkedHashMap card_typeMap = this.cm.getMapFromCache("card_type");
/*  51 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  52 */     Iterator iter = list.iterator();
/*  53 */     ArrayList t10_checkparty_newlist = new ArrayList();
/*  54 */     while (iter.hasNext()) {
/*  55 */       T10_checkparty checkparty = (T10_checkparty)iter.next();
/*  56 */       if (checkparty.getParty_class_cd() != null) {
/*  57 */         checkparty.setParty_class_cd_disp((String)party_class_cdMap.get(checkparty.getParty_class_cd()));
/*     */       }
/*  59 */       if (checkparty.getOrgankey() != null) {
/*  60 */         checkparty.setOrganname((String)organMap.get(checkparty.getOrgankey()));
/*     */       }
/*  62 */       if (checkparty.getCard_type() != null) {
/*  63 */         String card_type = checkparty.getCard_type();
/*  64 */         if (card_type.length() > 2) {
/*  65 */           card_type = card_type.substring(0, 2);
/*     */         }
/*  67 */         checkparty.setCard_type_disp((String)card_typeMap.get(card_type));
/*     */       }
/*  69 */       t10_checkparty_newlist.add(checkparty);
/*     */     }
/*  71 */     return t10_checkparty_newlist;
/*     */   }
/*     */ 
/*     */   public int getT10_checkparty_newCount(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/*  75 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_checkparty_newCount", t10_checkparty);
/*  76 */     if (iCount == null) {
/*  77 */       return 0;
/*     */     }
/*  79 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_checkparty_relist(SqlMapClient sqlMap, T10_checkparty t10_checkparty, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/*  93 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_checkparty_reList", t10_checkparty, startRec, intPageSize);
/*  94 */     LinkedHashMap party_class_cdMap = this.cm.getMapFromCache("clienttype");
/*  95 */     LinkedHashMap card_typeMap = this.cm.getMapFromCache("card_type");
/*  96 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*  97 */     LinkedHashMap recheck_typeMap = this.cm.getMapFromCache("recheck_type");
/*  98 */     Iterator iter = list.iterator();
/*  99 */     ArrayList t10_checkparty_relist = new ArrayList();
/* 100 */     while (iter.hasNext()) {
/* 101 */       T10_checkparty checkparty = (T10_checkparty)iter.next();
/* 102 */       if (checkparty.getParty_class_cd() != null) {
/* 103 */         checkparty.setParty_class_cd_disp((String)party_class_cdMap.get(checkparty.getParty_class_cd()));
/*     */       }
/* 105 */       if (checkparty.getOrgankey() != null) {
/* 106 */         checkparty.setOrganname((String)organMap.get(checkparty.getOrgankey()));
/*     */       }
/* 108 */       if (checkparty.getRecheck_type() != null) {
/* 109 */         checkparty.setRecheck_type_disp((String)recheck_typeMap.get(checkparty.getRecheck_type()));
/*     */       }
/* 111 */       if (checkparty.getCard_type() != null) {
/* 112 */         String card_type = checkparty.getCard_type();
/* 113 */         if (card_type.length() > 2) {
/* 114 */           card_type = card_type.substring(0, 2);
/*     */         }
/* 116 */         checkparty.setCard_type_disp((String)card_typeMap.get(card_type));
/*     */       }
/* 118 */       t10_checkparty_relist.add(checkparty);
/*     */     }
/* 120 */     return t10_checkparty_relist;
/*     */   }
/*     */ 
/*     */   public int getT10_checkparty_reCount(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 124 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_checkparty_reCount", t10_checkparty);
/* 125 */     if (iCount == null) {
/* 126 */       return 0;
/*     */     }
/* 128 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_checkparty_alreadylist(SqlMapClient sqlMap, T10_checkparty t10_checkparty, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/* 134 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_checkparty_alreadyList", t10_checkparty, startRec, intPageSize);
/* 135 */     LinkedHashMap party_class_cdMap = this.cm.getMapFromCache("clienttype");
/* 136 */     LinkedHashMap card_typeMap = this.cm.getMapFromCache("card_type");
/* 137 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 138 */     LinkedHashMap recheck_typeMap = this.cm.getMapFromCache("recheck_type");
/* 139 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/* 140 */     Iterator iter = list.iterator();
/* 141 */     ArrayList t10_checkparty_relist = new ArrayList();
/* 142 */     while (iter.hasNext()) {
/* 143 */       T10_checkparty checkparty = (T10_checkparty)iter.next();
/* 144 */       if (checkparty.getParty_class_cd() != null) {
/* 145 */         checkparty.setParty_class_cd_disp((String)party_class_cdMap.get(checkparty.getParty_class_cd()));
/*     */       }
/* 147 */       if (checkparty.getOrgankey() != null) {
/* 148 */         checkparty.setOrganname((String)organMap.get(checkparty.getOrgankey()));
/*     */       }
/* 150 */       if (checkparty.getRecheck_type() != null) {
/* 151 */         checkparty.setRecheck_type_disp((String)recheck_typeMap.get(checkparty.getRecheck_type()));
/*     */       }
/* 153 */       if (checkparty.getCard_type() != null) {
/* 154 */         String card_type = checkparty.getCard_type();
/* 155 */         if (card_type.length() > 2) {
/* 156 */           card_type = card_type.substring(0, 2);
/*     */         }
/* 158 */         checkparty.setCard_type_disp((String)card_typeMap.get(card_type));
/*     */       }
/* 160 */       if ((checkparty.getCheck_result() != null) && (!checkparty.getCheck_result().equals(""))) {
/* 161 */         checkparty.setCheck_result_disp((String)check_resultMap.get(checkparty.getCheck_result()));
/*     */       }
/* 163 */       t10_checkparty_relist.add(checkparty);
/*     */     }
/* 165 */     return t10_checkparty_relist;
/*     */   }
/*     */ 
/*     */   public int getT10_checkparty_alreadyCount(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 169 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_checkparty_alreadyCount", t10_checkparty);
/* 170 */     if (iCount == null) {
/* 171 */       return 0;
/*     */     }
/* 173 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public ArrayList getT10_checkparty_uhlist(SqlMapClient sqlMap, T10_checkparty t10_checkparty, int startRec, int intPageSize)
/*     */     throws SQLException
/*     */   {
/* 187 */     ArrayList list = (ArrayList)sqlMap.queryForList("getT10_checkparty_uhList", t10_checkparty, startRec, intPageSize);
/* 188 */     LinkedHashMap cust_checktypeMap = this.cm.getMapFromCache("cust_checktype");
/* 189 */     LinkedHashMap party_class_cdMap = this.cm.getMapFromCache("clienttype");
/* 190 */     LinkedHashMap card_typeMap = this.cm.getMapFromCache("card_type");
/* 191 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/* 192 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 193 */     Iterator iter = list.iterator();
/* 194 */     ArrayList t10_checkparty_uhlist = new ArrayList();
/* 195 */     while (iter.hasNext()) {
/* 196 */       T10_checkparty checkparty = (T10_checkparty)iter.next();
/* 197 */       if (checkparty.getParty_class_cd() != null) {
/* 198 */         checkparty.setParty_class_cd_disp((String)party_class_cdMap.get(checkparty.getParty_class_cd()));
/*     */       }
/* 200 */       if (checkparty.getOrgankey() != null) {
/* 201 */         checkparty.setOrganname((String)organMap.get(checkparty.getOrgankey()));
/*     */       }
/*     */ 
/* 204 */       if (checkparty.getCheck_dt() != null) {
/* 205 */         checkparty.setCheck_dt_disp(DateUtils.dateToStringShort(checkparty.getCheck_dt()));
/*     */       }
/* 207 */       if (checkparty.getValid_dt() != null) {
/* 208 */         checkparty.setValid_dt_disp(DateUtils.dateToStringShort(checkparty.getValid_dt()));
/*     */       }
/* 210 */       if (checkparty.getCheck_result() != null) {
/* 211 */         checkparty.setCheck_result((String)check_resultMap.get(checkparty.getCheck_result()));
/*     */       }
/* 213 */       if (checkparty.getCheck_type() != null) {
/* 214 */         checkparty.setCheck_type_disp((String)cust_checktypeMap.get(checkparty.getCheck_type()));
/*     */       }
/* 216 */       t10_checkparty_uhlist.add(checkparty);
/*     */     }
/* 218 */     return t10_checkparty_uhlist;
/*     */   }
/*     */ 
/*     */   public int getT10_checkparty_uhCount(SqlMapClient sqlMap, T10_checkparty t10_checkparty)
/*     */     throws SQLException
/*     */   {
/* 228 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_checkparty_uhCount", t10_checkparty);
/* 229 */     if (iCount == null) {
/* 230 */       return 0;
/*     */     }
/* 232 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int getT10_checkparty_uhCount1(SqlMapClient sqlMap, T10_checkparty t10_checkparty)
/*     */     throws SQLException
/*     */   {
/* 242 */     Integer iCount = (Integer)sqlMap.queryForObject("getT10_checkparty_uhCount1", t10_checkparty);
/* 243 */     if (iCount == null) {
/* 244 */       return 0;
/*     */     }
/* 246 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int deleteT10_checkparty_new(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 258 */     Integer iCount = (Integer)sqlMap.queryForObject("deleteT10_checkparty_new", partyId);
/* 259 */     if (iCount == null) {
/* 260 */       return 0;
/*     */     }
/* 262 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyT10_checkparty_uh(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt)
/*     */     throws SQLException
/*     */   {
/* 275 */     Integer iCount = (Integer)sqlMap.queryForObject("modifyT10_checkparty_uh", t10PartyRelt);
/* 276 */     if (iCount == null) {
/* 277 */       return 0;
/*     */     }
/* 279 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_checkparty_uh(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt)
/*     */     throws SQLException
/*     */   {
/* 292 */     Integer iCount = (Integer)sqlMap.queryForObject("insertT10_checkparty_uh", t10PartyRelt);
/* 293 */     if (iCount == null) {
/* 294 */       return 0;
/*     */     }
/* 296 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public T10_checkparty getT10_checkparty_reDisp(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 309 */     T10_checkparty t10_checkparty = (T10_checkparty)sqlMap.queryForObject("getT10_checkparty_reDisp", partyId);
/*     */ 
/* 311 */     if (t10_checkparty == null) {
/* 312 */       t10_checkparty = new T10_checkparty();
/*     */     }
/* 314 */     return t10_checkparty;
/*     */   }
/*     */ 
/*     */   public int deleteT10_checkparty_re(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 327 */     Integer iCount = (Integer)sqlMap.queryForObject("deleteT10_checkparty_re", partyId);
/* 328 */     if (iCount == null) {
/* 329 */       return 0;
/*     */     }
/* 331 */     return iCount.intValue();
/*     */   }
/*     */   public int deleteT10_checkparty_re_byList(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 334 */     Integer iCount = Integer.valueOf(sqlMap.update("deleteT10_checkparty_re_byList", t10_checkparty));
/* 335 */     if (iCount == null) {
/* 336 */       return 0;
/*     */     }
/* 338 */     return iCount.intValue();
/*     */   }
/*     */   public int deleteT10_checkparty_reason_byList(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 341 */     Integer iCount = Integer.valueOf(sqlMap.update("deleteT10_checkparty_reason_byList", t10_checkparty));
/* 342 */     if (iCount == null) {
/* 343 */       return 0;
/*     */     }
/* 345 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyT10_checkparty_re_uh(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt)
/*     */     throws SQLException
/*     */   {
/* 357 */     Integer iCount = (Integer)sqlMap.queryForObject("modifyT10_checkparty_re_uh", t10PartyRelt);
/* 358 */     if (iCount == null) {
/* 359 */       return 0;
/*     */     }
/* 361 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_checkparty_re_uh(SqlMapClient sqlMap, T10_checkparty_fun t10PartyRelt)
/*     */     throws SQLException
/*     */   {
/* 373 */     Integer iCount = (Integer)sqlMap.queryForObject("insertT10_checkparty_re_uh", t10PartyRelt);
/* 374 */     if (iCount == null) {
/* 375 */       return 0;
/*     */     }
/* 377 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_checkparty_re(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 381 */     Integer iCount = Integer.valueOf(sqlMap.update("insertT10_checkparty_re", t10_checkparty));
/* 382 */     if (iCount == null) {
/* 383 */       return 0;
/*     */     }
/* 385 */     return iCount.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_checkparty_re_fromcase(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 389 */     Integer iCount = Integer.valueOf(sqlMap.update("insertT10_checkparty_re_fromcase", t10_checkparty));
/* 390 */     if (iCount == null) {
/* 391 */       return 0;
/*     */     }
/* 393 */     return iCount.intValue();
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dao.T10_checkpartyDAO
 * JD-Core Version:    0.6.2
 */