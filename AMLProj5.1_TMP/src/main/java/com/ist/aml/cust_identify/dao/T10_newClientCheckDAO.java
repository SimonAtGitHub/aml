/*     */ package com.ist.aml.cust_identify.dao;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty;
/*     */ import com.ist.aml.cust_identify.dto.T10_newClientCheck;
/*     */ import com.ist.common.base.BaseDAO;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ 
/*     */ public class T10_newClientCheckDAO extends BaseDAO
/*     */ {
/*     */   public T10_newClientCheck getT47_clientDisp(SqlMapClient sqlMap, T10_newClientCheck t10_newClientCheck)
/*     */     throws SQLException
/*     */   {
/*  29 */     if ((t10_newClientCheck != null) && (t10_newClientCheck.getParty_class_cd() != null) && 
/*  30 */       (t10_newClientCheck.getParty_class_cd().trim().equalsIgnoreCase("I")))
/*  31 */       t10_newClientCheck = getT47_i_clientDisp(sqlMap, t10_newClientCheck.getParty_id());
/*     */     else {
/*  33 */       t10_newClientCheck = getT47_c_clientDisp(sqlMap, t10_newClientCheck.getParty_id());
/*     */     }
/*  35 */     return t10_newClientCheck;
/*     */   }
/*     */ 
/*     */   private T10_newClientCheck getT47_i_clientDisp(SqlMapClient sqlMap, String party_id) throws SQLException {
/*  39 */     T10_newClientCheck t10_newClientCheck = (T10_newClientCheck)sqlMap.queryForObject("getT47_i_newClientDisp", party_id);
/*  40 */     if (t10_newClientCheck == null) {
/*  41 */       t10_newClientCheck = new T10_newClientCheck();
/*     */     }
/*     */     else {
/*  44 */       if (t10_newClientCheck.getCard_end_dt() != null) {
/*  45 */         t10_newClientCheck.setCard_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getCard_end_dt()));
/*     */       }
/*  47 */       if ((t10_newClientCheck.getCard_type() != null) && (t10_newClientCheck.getCard_type().contains(";"))) {
/*  48 */         t10_newClientCheck.setCard_typeinfo(t10_newClientCheck.getCard_type().split(";")[1]);
/*  49 */         t10_newClientCheck.setCard_type(t10_newClientCheck.getCard_type().split(";")[0]);
/*     */       }
/*     */     }
/*  52 */     return t10_newClientCheck;
/*     */   }
/*     */ 
/*     */   private T10_newClientCheck getT47_c_clientDisp(SqlMapClient sqlMap, String party_id) throws SQLException {
/*  56 */     T10_newClientCheck t10_newClientCheck = (T10_newClientCheck)sqlMap.queryForObject("getT47_c_newClientDisp", party_id);
/*     */ 
/*  58 */     if (t10_newClientCheck == null) {
/*  59 */       t10_newClientCheck = new T10_newClientCheck();
/*     */     }
/*     */     else {
/*  62 */       if (t10_newClientCheck.getLegal_card_no_end_dt() != null) {
/*  63 */         t10_newClientCheck.setLegal_card_no_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getLegal_card_no_end_dt()));
/*     */       }
/*     */ 
/*  66 */       if (t10_newClientCheck.getStock_holder_card_no_end_dt() != null) {
/*  67 */         t10_newClientCheck.setStock_holder_card_no_end_dt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getStock_holder_card_no_end_dt()));
/*     */       }
/*     */ 
/*  70 */       if (t10_newClientCheck.getOrg_credit_vt() != null) {
/*  71 */         t10_newClientCheck.setOrg_credit_vt_disp(DateUtils.dateToStringShort(t10_newClientCheck.getOrg_credit_vt()));
/*     */       }
/*  73 */       if ((t10_newClientCheck.getCard_type_c() != null) && (t10_newClientCheck.getCard_type_c().contains(";"))) {
/*  74 */         t10_newClientCheck.setCard_type_cinfo(t10_newClientCheck.getCard_type_c().split(";")[1]);
/*  75 */         t10_newClientCheck.setCard_type_c(t10_newClientCheck.getCard_type_c().split(";")[0]);
/*     */       }
/*  77 */       if ((t10_newClientCheck.getLegal_card_type() != null) && (t10_newClientCheck.getLegal_card_type().contains(";"))) {
/*  78 */         t10_newClientCheck.setLegal_card_typeinfo(t10_newClientCheck.getLegal_card_type().split(";")[1]);
/*  79 */         t10_newClientCheck.setLegal_card_type(t10_newClientCheck.getLegal_card_type().split(";")[0]);
/*     */       }
/*     */     }
/*  82 */     return t10_newClientCheck;
/*     */   }
/*     */ 
/*     */   public LinkedHashMap getT10_newClientCheck_checkState(SqlMapClient sqlMap, String party_id)
/*     */     throws SQLException
/*     */   {
/*  95 */     LinkedHashMap checkStateMap = new LinkedHashMap();
/*  96 */     ArrayList checkStateList = (ArrayList)sqlMap.queryForList("getCheckStateList", party_id);
/*  97 */     int len = checkStateList.size();
/*  98 */     for (int i = 0; i < len; i++) {
/*  99 */       T10_newClientCheck tmp = (T10_newClientCheck)checkStateList.get(i);
/* 100 */       String upcode = tmp.getUpcode();
/* 101 */       if (checkStateMap.containsKey(upcode)) {
/* 102 */         ArrayList subList = (ArrayList)checkStateMap.get(upcode);
/* 103 */         subList.add(tmp);
/*     */       } else {
/* 105 */         tmp.setParty_id(party_id);
/* 106 */         ArrayList subList = new ArrayList();
/* 107 */         subList.add(tmp);
/* 108 */         checkStateMap.put(upcode, subList);
/*     */       }
/*     */     }
/* 111 */     return checkStateMap;
/*     */   }
/*     */ 
/*     */   public void insertT10_newClientCheck_clientInfo(SqlMapClient sqlMap, T10_newClientCheck t10NewClientCheck)
/*     */     throws SQLException
/*     */   {
/* 122 */     if (t10NewClientCheck != null)
/*     */     {
/* 124 */       if ((t10NewClientCheck.getCard_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getCard_end_dt_disp()))) {
/* 125 */         t10NewClientCheck.setCard_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getCard_end_dt_disp()));
/*     */       }
/*     */ 
/* 128 */       if ((t10NewClientCheck.getLegal_card_no_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getLegal_card_no_end_dt_disp()))) {
/* 129 */         t10NewClientCheck.setLegal_card_no_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getLegal_card_no_end_dt_disp()));
/*     */       }
/*     */ 
/* 132 */       if ((t10NewClientCheck.getStock_holder_card_no_end_dt_disp() != null) && (!"".equals(t10NewClientCheck.getStock_holder_card_no_end_dt_disp()))) {
/* 133 */         t10NewClientCheck.setStock_holder_card_no_end_dt(DateUtils.stringToDateShort(t10NewClientCheck.getStock_holder_card_no_end_dt_disp()));
/*     */       }
/*     */ 
/* 136 */       if ((t10NewClientCheck.getOrg_credit_vt_disp() != null) && (!"".equals(t10NewClientCheck.getOrg_credit_vt_disp()))) {
/* 137 */         t10NewClientCheck.setOrg_credit_vt(DateUtils.stringToDateShort(t10NewClientCheck.getOrg_credit_vt_disp()));
/*     */       }
/* 139 */       if ((t10NewClientCheck.getParty_class_cd() != null) && (!"".equals(t10NewClientCheck.getParty_class_cd())))
/* 140 */         if ("C".equals(t10NewClientCheck.getParty_class_cd())) {
/* 141 */           if (!"".equals(t10NewClientCheck.getCard_type_cinfo())) {
/* 142 */             t10NewClientCheck.setCard_type_c(t10NewClientCheck.getCard_type_c() + ";" + t10NewClientCheck.getCard_type_cinfo());
/*     */           }
/* 144 */           if (!"".equals(t10NewClientCheck.getLegal_card_typeinfo())) {
/* 145 */             t10NewClientCheck.setLegal_card_type(t10NewClientCheck.getLegal_card_type() + ";" + t10NewClientCheck.getLegal_card_typeinfo());
/*     */           }
/* 147 */           sqlMap.update("modifyClientInfo_C_t47_PARTY", t10NewClientCheck);
/* 148 */           sqlMap.update("modifyClientInfo_C_t47_CORPORATION", t10NewClientCheck);
/*     */         } else {
/* 150 */           if (!"".equals(t10NewClientCheck.getCard_typeinfo())) {
/* 151 */             t10NewClientCheck.setCard_type(t10NewClientCheck.getCard_type() + ";" + t10NewClientCheck.getCard_typeinfo());
/*     */           }
/* 153 */           sqlMap.update("modifyClientInfo_I_t47_PARTY", t10NewClientCheck);
/* 154 */           sqlMap.update("modifyClientInfo_I_t47_INDIVIDUAL", t10NewClientCheck);
/*     */         }
/*     */     }
/*     */   }
/*     */ 
/*     */   public int insertT10_newClientCheck_checkState(SqlMapClient sqlMap, ArrayList<T10_newClientCheck> checkStateList)
/*     */     throws SQLException
/*     */   {
/* 169 */     Integer i = null;
/* 170 */     if ((checkStateList != null) && (checkStateList.size() > 0)) {
/* 171 */       for (T10_newClientCheck tt : checkStateList) {
/* 172 */         if ((tt.getCheckdate_disp() != null) && (!"".equals(tt.getCheckdate_disp()))) {
/* 173 */           tt.setCheckdate(DateUtils.stringToDateShort(tt.getCheckdate_disp()));
/*     */         }
/* 175 */         if (tt.getIstrue() == null) {
/* 176 */           tt.setIstrue("0");
/*     */         }
/* 178 */         i = (Integer)sqlMap.insert("insertT10_SURVEYPARTY_TEXT", tt);
/*     */       }
/*     */     }
/* 181 */     if (i != null) {
/* 182 */       return i.intValue();
/*     */     }
/* 184 */     return -1;
/*     */   }
/*     */ 
/*     */   public boolean getT10_newClientCheck_checkStateCount(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 196 */     Integer i = null;
/* 197 */     i = (Integer)sqlMap.queryForObject("getT10_newClientCheck_checkStateCount", partyId);
/* 198 */     if (i == null) {
/* 199 */       return false;
/*     */     }
/* 201 */     if (i.intValue() > 1) {
/* 202 */       return true;
/*     */     }
/* 204 */     return false;
/*     */   }
/*     */ 
/*     */   public ArrayList<T10_newClientCheck> getT10_newClientCheck_checkState_singleList(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 216 */     ArrayList tt = new ArrayList();
/* 217 */     tt = (ArrayList)sqlMap.queryForList("getT10_newClientCheck_checkState_singleList", partyId);
/* 218 */     if (tt == null)
/* 219 */       return new ArrayList();
/* 220 */     return tt;
/*     */   }
/*     */ 
/*     */   public int deleteT10_newClientCheck_checkState_single(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 232 */     Integer i = null;
/* 233 */     if ((partyId != null) && (!"".equals(partyId))) {
/* 234 */       i = Integer.valueOf(sqlMap.delete("deleteT10_newClientCheck_checkState_single", partyId));
/*     */     }
/* 236 */     if (i == null) {
/* 237 */       return -1;
/*     */     }
/* 239 */     return i.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_newClientCheck_checkState_uh(SqlMapClient sqlMap, String party_id)
/*     */     throws SQLException
/*     */   {
/* 251 */     Integer i = null;
/* 252 */     i = (Integer)sqlMap.insert("insertT10_SURVEYPARTY_TEXT_UH", party_id);
/* 253 */     if (i != null) {
/* 254 */       return i.intValue();
/*     */     }
/* 256 */     return -1;
/*     */   }
/*     */ 
/*     */   public int insertT10_CHECKPARTY_RELT(SqlMapClient sqlMap, T10_newClientCheck t10NewClientCheck)
/*     */     throws SQLException
/*     */   {
/* 268 */     Integer i = null;
/* 269 */     if (t10NewClientCheck != null) {
/* 270 */       if ((t10NewClientCheck.getCheck_dt_disp() != null) && (!"".equals(t10NewClientCheck.getCheck_dt_disp()))) {
/* 271 */         t10NewClientCheck.setCheck_dt(DateUtils.stringToDateShort(t10NewClientCheck.getCheck_dt_disp()));
/*     */       }
/* 273 */       if ((t10NewClientCheck.getValid_dt_disp() != null) && (!"".equals(t10NewClientCheck.getValid_dt_disp()))) {
/* 274 */         t10NewClientCheck.setValid_dt(DateUtils.stringToDateShort(t10NewClientCheck.getValid_dt_disp()));
/*     */       }
/* 276 */       i = (Integer)sqlMap.insert("insertT10_CHECKPARTY_RELT", t10NewClientCheck);
/*     */     }
/* 278 */     if (i == null) {
/* 279 */       return 0;
/*     */     }
/* 281 */     return i.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyStatusT10_CHECKPARTY_NEW(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 293 */     Integer i = null;
/* 294 */     i = Integer.valueOf(sqlMap.delete("modifyStatusT10_CHECKPARTY_NEW", partyId));
/* 295 */     if (i == null) {
/* 296 */       return 0;
/*     */     }
/* 298 */     return i.intValue();
/*     */   }
/*     */ 
/*     */   public int insertT10_CHECKPARTY_UH(SqlMapClient sqlMap, T10_newClientCheck tt)
/*     */     throws SQLException
/*     */   {
/* 311 */     Integer i = null;
/* 312 */     if (tt != null) {
/* 313 */       if ((tt.getCheck_dt_disp() != null) && (!"".equals(tt.getCheck_dt_disp()))) {
/* 314 */         tt.setCheck_dt(DateUtils.stringToDateShort(tt.getCheck_dt_disp()));
/*     */       }
/* 316 */       if ((tt.getValid_dt_disp() != null) && (!"".equals(tt.getValid_dt_disp()))) {
/* 317 */         tt.setValid_dt(DateUtils.stringToDateShort(tt.getValid_dt_disp()));
/*     */       }
/* 319 */       i = (Integer)sqlMap.insert("insertT10_CHECKPARTY_UH", tt);
/*     */     }
/* 321 */     if (i == null) {
/* 322 */       return 0;
/*     */     }
/* 324 */     return i.intValue();
/*     */   }
/*     */ 
/*     */   public int modifyStatusT10_CHECKPARTY_RE(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 336 */     Integer i = null;
/* 337 */     i = Integer.valueOf(sqlMap.delete("modifyStatusT10_CHECKPARTY_RE", partyId));
/* 338 */     if (i == null) {
/* 339 */       return 0;
/*     */     }
/* 341 */     return i.intValue();
/*     */   }
/*     */ 
/*     */   public LinkedHashMap getT10_newClientCheck_checkedState(SqlMapClient sqlMap, T10_newClientCheck tt)
/*     */     throws SQLException
/*     */   {
/* 378 */     LinkedHashMap checkStateMap = new LinkedHashMap();
/* 379 */     ArrayList checkStateList = (ArrayList)sqlMap.queryForList("getCheckedStateList", tt);
/* 380 */     int len = checkStateList.size();
/* 381 */     for (int i = 0; i < len; i++) {
/* 382 */       T10_newClientCheck tmp = (T10_newClientCheck)checkStateList.get(i);
/* 383 */       String upcode = tmp.getUpcode();
/*     */ 
/* 385 */       if ((tmp.getIstrue() != null) && (!"".equals(tmp.getIstrue()))) {
/* 386 */         if ("0".equals(tmp.getIstrue()))
/* 387 */           tmp.setIstrue_disp("否");
/*     */         else
/* 389 */           tmp.setIstrue_disp("是");
/*     */       }
/*     */       else {
/* 392 */         tmp.setIstrue_disp("否");
/*     */       }
/*     */ 
/* 395 */       if ((tmp.getCheckdate() != null) && (!"".equals(tmp.getCheckdate()))) {
/* 396 */         tmp.setCheckdate_disp(DateUtils.dateToStringShort(tmp.getCheckdate()));
/*     */       }
/*     */ 
/* 399 */       if (tmp.getContext() == null) {
/* 400 */         tmp.setContext("");
/*     */       }
/* 402 */       if (checkStateMap.containsKey(upcode)) {
/* 403 */         ArrayList subList = (ArrayList)checkStateMap.get(upcode);
/* 404 */         subList.add(tmp);
/*     */       } else {
/* 406 */         tmp.setParty_id(tt.getParty_id());
/* 407 */         ArrayList subList = new ArrayList();
/* 408 */         subList.add(tmp);
/* 409 */         checkStateMap.put(upcode, subList);
/*     */       }
/*     */     }
/* 412 */     return checkStateMap;
/*     */   }
/*     */ 
/*     */   public T10_newClientCheck getT10_newClientCheck_checkResult(SqlMapClient sqlMap, T10_newClientCheck t)
/*     */     throws SQLException
/*     */   {
/* 424 */     T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT10_CHECKPARTY_RELT", t);
/* 425 */     String check_reason = (String)sqlMap.queryForObject("getCheck_reason", t.getParty_id());
/* 426 */     if (tt != null) {
/* 427 */       if ((tt.getCheck_dt() != null) && (!"".equals(tt.getCheck_dt()))) {
/* 428 */         tt.setCheck_dt_disp(DateUtils.dateToStringShort(tt.getCheck_dt()));
/*     */       }
/* 430 */       if ((tt.getValid_dt() != null) && (!"".equals(tt.getValid_dt()))) {
/* 431 */         tt.setValid_dt_disp(DateUtils.dateToStringShort(tt.getValid_dt()));
/*     */       }
/* 433 */       if ((tt.getCheck_result() != null) && (!"".equals(tt.getCheck_result()))) {
/* 434 */         if ("0".equals(tt.getCheck_result()))
/* 435 */           tt.setCheck_result_disp("无需关注");
/* 436 */         else if ("1".equals(tt.getCheck_result()))
/* 437 */           tt.setCheck_result_disp("一般关注");
/* 438 */         else if ("2".equals(tt.getCheck_result()))
/* 439 */           tt.setCheck_result_disp("持续关注");
/* 440 */         else if ("3".equals(tt.getCheck_result())) {
/* 441 */           tt.setCheck_result_disp("重点关注");
/*     */         }
/*     */       }
/* 444 */       tt.setCheck_reason(check_reason == null ? "" : check_reason);
/* 445 */       return tt;
/*     */     }
/* 447 */     tt = new T10_newClientCheck();
/* 448 */     tt.setCheck_reason(check_reason == null ? "" : check_reason);
/*     */ 
/* 450 */     return tt;
/*     */   }
/*     */ 
/*     */   public T10_newClientCheck getT10_newClientCheck_listType(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 463 */     int w = ((Integer)sqlMap.queryForObject("getWhiteCount", partyId)).intValue();
/* 464 */     int b = ((Integer)sqlMap.queryForObject("getBlackCount", partyId)).intValue();
/* 465 */     if (w > 0) {
/* 466 */       return getT07_WHITELIST_INFO_single(sqlMap, partyId);
/*     */     }
/* 468 */     if (b > 0) {
/* 469 */       return getT07_BLACKLIST_single(sqlMap, partyId);
/*     */     }
/* 471 */     if ((w < 1) && (b < 1)) {
/* 472 */       T10_newClientCheck tt = new T10_newClientCheck();
/* 473 */       tt.setAddbmenu_flag_disp("否");
/* 474 */       tt.setAddwmenu_flag_disp("否");
/* 475 */       return tt;
/*     */     }
/* 477 */     return new T10_newClientCheck();
/*     */   }
/*     */ 
/*     */   private T10_newClientCheck getT07_WHITELIST_INFO_single(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 481 */     T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT07_WHITELIST_INFO_single", partyId);
/* 482 */     tt.setAddwmenu_flag("1");
/* 483 */     tt.setAddwmenu_flag_disp("是");
/* 484 */     tt.setAddbmenu_flag("0");
/* 485 */     tt.setAddbmenu_flag_disp("否");
/* 486 */     return tt;
/*     */   }
/*     */ 
/*     */   private T10_newClientCheck getT07_BLACKLIST_single(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 490 */     T10_newClientCheck tt = (T10_newClientCheck)sqlMap.queryForObject("getT07_BLACKLIST_single", partyId);
/* 491 */     tt.setAddwmenu_flag("0");
/* 492 */     tt.setAddwmenu_flag_disp("否");
/* 493 */     tt.setAddbmenu_flag("1");
/* 494 */     tt.setAddbmenu_flag_disp("是");
/* 495 */     return tt;
/*     */   }
/*     */ 
/*     */   public boolean isExistT10_CHECKPARTY_RELT(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 499 */     Integer i = null;
/* 500 */     i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_RELT", partyId);
/* 501 */     if ((i != null) && (i.intValue() > 0)) {
/* 502 */       return true;
/*     */     }
/* 504 */     return false;
/*     */   }
/*     */ 
/*     */   public void insertT10_CHECKPARTY_RELT_UH(SqlMapClient sqlMap, String partyId)
/*     */     throws SQLException
/*     */   {
/* 516 */     if ((partyId != null) && (!"".equals(partyId)))
/*     */     {
/* 523 */       sqlMap.insert("insertT10_CHECKPARTY_RELT_UH", partyId);
/*     */     }
/*     */   }
/*     */ 
/*     */   public void deleteT10_CHECKPARTY_RELT(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 528 */     sqlMap.delete("deleteT10_CHECKPARTY_RELT", partyId);
/*     */   }
/*     */ 
/*     */   public boolean isExistT10_CHECKPARTY_NEW(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 532 */     Integer i = null;
/* 533 */     i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_NEW", partyId);
/* 534 */     if ((i == null) || (i.intValue() < 1)) {
/* 535 */       return false;
/*     */     }
/* 537 */     return true;
/*     */   }
/*     */ 
/*     */   public void insertT10_CHECKPARTY_NEW(SqlMapClient sqlMap, T10_checkparty t10_checkparty) throws SQLException {
/* 541 */     sqlMap.insert("insertT10_CHECKPARTY_NEW", t10_checkparty);
/*     */   }
/*     */ 
/*     */   public boolean isExistT10_CHECKPARTY_RE(SqlMapClient sqlMap, String partyId) throws SQLException {
/* 545 */     Integer i = null;
/* 546 */     i = (Integer)sqlMap.queryForObject("isExistT10_CHECKPARTY_RE", partyId);
/* 547 */     if ((i == null) || (i.intValue() < 1)) {
/* 548 */       return false;
/*     */     }
/* 550 */     return true;
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.dao.T10_newClientCheckDAO
 * JD-Core Version:    0.6.2
 */