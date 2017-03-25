/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dao.T10_checkpartyDAO;
/*     */ import com.ist.aml.cust_identify.dao.T10_newClientCheckDAO;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty;
/*     */ import com.ist.aml.cust_identify.dto.T10_newClientCheck;
/*     */ import com.ist.aml.report.dao.T07_ATTENTION_libDAO;
/*     */ import com.ist.aml.report.dao.T07_BlacklistDAO;
/*     */ import com.ist.aml.report.dao.T07_OBJ_RULEDAO;
/*     */ import com.ist.aml.report.dao.T07_pbcruleDAO;
/*     */ import com.ist.aml.report.dto.T07_ATTENTION_lib;
/*     */ import com.ist.aml.report.dto.T07_ATTENTION_log;
/*     */ import com.ist.aml.report.dto.T07_Blacklist;
/*     */ import com.ist.aml.report.dto.T07_OBJ_RULE;
/*     */ import com.ist.aml.report.dto.T07_pbcrule;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.LinkedHashMap;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import org.apache.log4j.Logger;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.apache.struts.action.ActionMessages;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T10_newClientCheckAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  69 */     ActionForward myforward = null;
/*  70 */     String myaction = mapping.getParameter();
/*     */ 
/*  72 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  73 */       return myforward;
/*     */     }
/*  75 */     if ("modifyNewClientCheck".equalsIgnoreCase(myaction)) {
/*  76 */       myforward = modifyNewClientCheck(mapping, form, request, response);
/*     */     }
/*  79 */     else if ("modifyNewClientCheck_do".equalsIgnoreCase(myaction)) {
/*  80 */       myforward = modifyNewClientCheck_do(mapping, form, request, response);
/*     */     }
/*  83 */     else if ("exportClientCheckInfo".equalsIgnoreCase(myaction)) {
/*  84 */       myforward = exportClientCheckInfo(mapping, form, request, response);
/*     */     }
/*  86 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward exportClientCheckInfo(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  99 */     LinkedHashMap checkStateMap = new LinkedHashMap();
/* 100 */     T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
/*     */ 
/* 102 */     T10_newClientCheck clientInfo = new T10_newClientCheck();
/*     */ 
/* 104 */     T10_newClientCheck checkState = new T10_newClientCheck();
/*     */ 
/* 106 */     T10_newClientCheck checkResult = new T10_newClientCheck();
/*     */ 
/* 110 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*     */ 
/* 112 */     LinkedHashMap nationalityMap = this.cm.getMapFromCache("country");
/* 113 */     request.setAttribute("nationalityMap", getOptionsListByMap(nationalityMap, null, true));
/*     */ 
/* 115 */     LinkedHashMap pbc_cttp2Map = this.cm.getMapFromCache("pbc_cttp2");
/* 116 */     request.setAttribute("pbc_cttp2Map", getOptionsListByMap(pbc_cttp2Map, null, true));
/*     */ 
/* 118 */     LinkedHashMap card_type_cMap = this.cm.getMapFromCache("card_type_c");
/* 119 */     request.setAttribute("card_type_cMap", getOptionsListByMap(card_type_cMap, null, true));
/*     */ 
/* 121 */     LinkedHashMap bitpMap = this.cm.getMapFromCache("BITP");
/* 122 */     request.setAttribute("bitpMap", getOptionsListByMap(bitpMap, null, true));
/*     */ 
/* 124 */     LinkedHashMap industryMap = this.cm.getMapFromCache("industryMap");
/* 125 */     request.setAttribute("industryMap", getOptionsListByMap(industryMap, null, true));
/*     */ 
/* 127 */     LinkedHashMap occupationMap = this.cm.getMapFromCache("pbc_ctvc_i");
/* 128 */     request.setAttribute("occupationMap", getOptionsListByMap(occupationMap, null, true));
/*     */ 
/* 130 */     LinkedHashMap dutyMap = this.cm.getMapFromCache("duty");
/* 131 */     request.setAttribute("dutyMap", getOptionsListByMap(dutyMap, null, true));
/*     */ 
/* 133 */     LinkedHashMap currencyMap = this.cm.getMapFromCache("currency");
/* 134 */     request.setAttribute("currencyMap", getOptionsListByMap(currencyMap, null, true));
/*     */ 
/* 136 */     LinkedHashMap rule_typeMap = this.cm.getMapFromCache("rule_type");
/* 137 */     request.setAttribute("rule_typeMap", getOptionsListByMap(rule_typeMap, null, true));
/*     */ 
/* 139 */     LinkedHashMap m_list_type_bMap = this.cm.getMapFromCache("m_list_type_b");
/* 140 */     request.setAttribute("m_list_type_bMap", getOptionsListByMap(m_list_type_bMap, null, true));
/*     */ 
/* 142 */     LinkedHashMap yesNoMap = this.cm.getMapFromCache("yesNo");
/* 143 */     request.setAttribute("yesNoMap", getOptionsListByMap(yesNoMap, null, true));
/*     */     try {
/* 145 */       T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
/* 146 */       String party_id = t10_newClientCheckActionForm.getParty_id() == null ? "" : t10_newClientCheckActionForm.getParty_id();
/* 147 */       String party_class_cd = t10_newClientCheckActionForm.getParty_class_cd() == null ? "" : t10_newClientCheckActionForm.getParty_class_cd();
/* 148 */       clientInfo.setParty_id(party_id);
/* 149 */       clientInfo.setParty_class_cd(party_class_cd);
/* 150 */       checkState.setParty_id(party_id);
/* 151 */       checkState.setTable_name("0");
/* 152 */       checkResult.setParty_id(party_id);
/* 153 */       checkResult.setTable_name("0");
/* 154 */       this.sqlMap.endTransaction();
/* 155 */       this.sqlMap.startTransaction();
/*     */ 
/* 157 */       clientInfo = t10_newClientCheckDAO.getT47_clientDisp(this.sqlMap, clientInfo);
/*     */ 
/* 159 */       if ((clientInfo.getCountry_cd() != null) && (!"".equals(clientInfo.getCountry_cd()))) {
/* 160 */         clientInfo.setCountry_cd_disp((String)nationalityMap.get(clientInfo.getCountry_cd()));
/*     */       }
/*     */ 
/* 163 */       if ((clientInfo.getIndustry() != null) && (!"".equals(clientInfo.getIndustry()))) {
/* 164 */         clientInfo.setIndustry_disp((String)industryMap.get(clientInfo.getIndustry()));
/*     */       }
/*     */ 
/* 167 */       if ((clientInfo.getCard_type() != null) && (!"".equals(clientInfo.getCard_type()))) {
/* 168 */         clientInfo.setCard_type_disp((String)bitpMap.get(clientInfo.getCard_type()));
/*     */       }
/*     */ 
/* 171 */       if ((clientInfo.getOccupation() != null) && (!"".equals(clientInfo.getOccupation()))) {
/* 172 */         clientInfo.setOccupation_disp((String)occupationMap.get(clientInfo.getOccupation()));
/*     */       }
/*     */ 
/* 175 */       if ((clientInfo.getDuty() != null) && (!"".equals(clientInfo.getDuty()))) {
/* 176 */         clientInfo.setDuty_disp((String)dutyMap.get(clientInfo.getDuty()));
/*     */       }
/*     */ 
/* 179 */       if ((clientInfo.getOrgankey() != null) && (!"".equals(clientInfo.getOrgankey()))) {
/* 180 */         clientInfo.setOrgan_name_disp((String)organMap.get(clientInfo.getOrgankey()));
/*     */       }
/*     */ 
/* 183 */       if ((clientInfo.getCard_type_c() != null) && (!"".equals(clientInfo.getCard_type_c()))) {
/* 184 */         clientInfo.setCard_type_c_disp((String)card_type_cMap.get(clientInfo.getCard_type_c()));
/*     */       }
/*     */ 
/* 187 */       if ((clientInfo.getAml2_type_cd() != null) && (!"".equals(clientInfo.getAml2_type_cd()))) {
/* 188 */         clientInfo.setAml2_type_cd_disp((String)pbc_cttp2Map.get(clientInfo.getAml2_type_cd()));
/*     */       }
/*     */ 
/* 191 */       if ((clientInfo.getEnrol_fund_currency_cd() != null) && (!"".equals(clientInfo.getEnrol_fund_currency_cd()))) {
/* 192 */         clientInfo.setEnrol_fund_currency_cd_disp((String)currencyMap.get(clientInfo.getEnrol_fund_currency_cd()));
/*     */       }
/*     */ 
/* 195 */       if ((clientInfo.getLegal_card_type() != null) && (!"".equals(clientInfo.getLegal_card_type()))) {
/* 196 */         clientInfo.setLegal_card_type_disp((String)bitpMap.get(clientInfo.getLegal_card_type()));
/*     */       }
/*     */ 
/* 199 */       if ((clientInfo.getStock_holder_card_type() != null) && (!"".equals(clientInfo.getStock_holder_card_type()))) {
/* 200 */         clientInfo.setStock_holder_card_type_disp((String)bitpMap.get(clientInfo.getStock_holder_card_type()));
/*     */       }
/* 202 */       MyBeanUtils.copyBean2Bean(form, clientInfo);
/*     */ 
/* 205 */       T10_newClientCheck listType = t10_newClientCheckDAO.getT10_newClientCheck_listType(this.sqlMap, party_id);
/* 206 */       if ((listType.getRule_type() != null) && (!"".equals(listType.getRule_type()))) {
/* 207 */         listType.setRule_type_disp((String)rule_typeMap.get(listType.getRule_type()));
/*     */       }
/* 209 */       if ((listType.getList_type() != null) && (!"".equals(listType.getList_type()))) {
/* 210 */         listType.setList_type_disp((String)m_list_type_bMap.get(listType.getList_type()));
/*     */       }
/* 212 */       request.setAttribute("listType", listType);
/*     */ 
/* 216 */       checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkedState(this.sqlMap, checkState);
/*     */ 
/* 218 */       checkResult = t10_newClientCheckDAO.getT10_newClientCheck_checkResult(this.sqlMap, checkResult);
/* 219 */       this.sqlMap.commitTransaction();
/* 220 */       this.sqlMap.endTransaction();
/*     */     } catch (Exception e) {
/* 222 */       e.printStackTrace();
/* 223 */       this.logger.error("寮傚父", e);
/* 224 */       return mapping.findForward("failure");
/*     */     }
/* 226 */     String downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "-瀹㈡埛璋冩煡淇℃伅";
/* 227 */     request.setAttribute("downloadname", downloadname);
/* 228 */     request.setAttribute("clientInfo", clientInfo);
/* 229 */     request.setAttribute("checkStateMap", checkStateMap);
/* 230 */     request.setAttribute("checkResult", checkResult);
/* 231 */     return mapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward modifyNewClientCheck(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 245 */     LinkedHashMap checkStateMap = new LinkedHashMap();
/* 246 */     T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
/*     */ 
/* 248 */     T10_newClientCheck clientInfo = new T10_newClientCheck();
/*     */ 
/* 250 */     T10_newClientCheck checkState = new T10_newClientCheck();
/*     */ 
/* 252 */     T10_newClientCheck checkResult = new T10_newClientCheck();
/*     */ 
/* 256 */     String ischecked = request.getParameter("ischecked") == null ? "" : request.getParameter("ischecked");
/* 257 */     String url = request.getParameter("url");
/* 258 */     request.setAttribute("url", url);
/*     */ 
/* 260 */     String table_name = request.getParameter("table_name") == null ? "" : request.getParameter("table_name");
/* 261 */     String check_no = request.getParameter("check_no") == null ? "" : request.getParameter("check_no");
/*     */ 
/* 263 */     String check_exist = request.getParameter("check_exist");
/*     */ 
/* 265 */     String showCheckReason = request.getParameter("showCheckReason") == null ? "" : request.getParameter("showCheckReason");
/*     */ 
/* 267 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*     */ 
/* 269 */     LinkedHashMap nationalityMap = this.cm.getMapFromCache("country");
/* 270 */     request.setAttribute("nationalityMap", getOptionsListByMap(nationalityMap, null, true));
/*     */ 
/* 272 */     LinkedHashMap pbc_cttp2Map = this.cm.getMapFromCache("pbc_cttp2");
/* 273 */     request.setAttribute("pbc_cttp2Map", getOptionsListByMap(pbc_cttp2Map, null, true));
/*     */ 
/* 275 */     LinkedHashMap card_type_cMap = this.cm.getMapFromCache("card_type_c");
/* 276 */     request.setAttribute("card_type_cMap", getOptionsListByMap(card_type_cMap, null, true));
/*     */ 
/* 278 */     LinkedHashMap bitpMap = this.cm.getMapFromCache("BITP");
/* 279 */     request.setAttribute("bitpMap", getOptionsListByMap(bitpMap, null, true));
/*     */ 
/* 281 */     LinkedHashMap industryMap = this.cm.getMapFromCache("industryMap");
/* 282 */     request.setAttribute("industryMap", getOptionsListByMap(industryMap, null, true));
/*     */ 
/* 284 */     LinkedHashMap occupationMap = this.cm.getMapFromCache("pbc_ctvc_i");
/* 285 */     request.setAttribute("occupationMap", getOptionsListByMap(occupationMap, null, true));
/*     */ 
/* 287 */     LinkedHashMap dutyMap = this.cm.getMapFromCache("duty");
/* 288 */     request.setAttribute("dutyMap", getOptionsListByMap(dutyMap, null, true));
/*     */ 
/* 290 */     LinkedHashMap currencyMap = this.cm.getMapFromCache("currency");
/* 291 */     request.setAttribute("currencyMap", getOptionsListByMap(currencyMap, null, true));
/*     */ 
/* 293 */     LinkedHashMap rule_typeMap = this.cm.getMapFromCache("rule_type");
/* 294 */     request.setAttribute("rule_typeMap", getOptionsListByMap(rule_typeMap, null, true));
/*     */ 
/* 296 */     LinkedHashMap m_list_type_bMap = this.cm.getMapFromCache("m_list_type_b");
/* 297 */     request.setAttribute("m_list_type_bMap", getOptionsListByMap(m_list_type_bMap, null, true));
/*     */ 
/* 299 */     LinkedHashMap yesNoMap = this.cm.getMapFromCache("yesNo");
/* 300 */     request.setAttribute("yesNoMap", getOptionsListByMap(yesNoMap, null, true));
				
			  LinkedHashMap genderMap = new LinkedHashMap();
			  genderMap.put("1", "男");
			  genderMap.put("2", "女");
			  request.setAttribute("genderMap", getOptionsListByMap(genderMap, null, true));
			  
/*     */     try {
/* 302 */       T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
/* 303 */       String party_id = "";
/* 304 */       String party_class_cd = "";
/* 305 */       String check_type = request.getParameter("check_type");
/* 306 */       request.setAttribute("check_type", check_type);
/* 307 */       if ((request.getParameter("party_id") != null) && (!"".equals(request.getParameter("party_id")))) {
/* 308 */         party_id = request.getParameter("party_id");
/*     */       }
/* 310 */       if ((request.getParameter("party_class_cd") != null) && (!"".equals(request.getParameter("party_class_cd")))) {
/* 311 */         party_class_cd = request.getParameter("party_class_cd");
/*     */       }
/* 313 */       clientInfo.setParty_id(party_id);
/* 314 */       clientInfo.setParty_class_cd(party_class_cd);
/* 315 */       checkState.setParty_id(party_id);
/* 316 */       checkResult.setParty_id(party_id);
/* 317 */       if (table_name.equals("0")) {
/* 318 */         checkState.setTable_name("0");
/* 319 */         checkResult.setTable_name("0");
/* 320 */       } else if (table_name.equals("1")) {
/* 321 */         checkState.setTable_name("1");
/* 322 */         checkResult.setTable_name("1");
/*     */       }
/* 324 */       this.sqlMap.endTransaction();
/* 325 */       this.sqlMap.startTransaction();
/*     */ 
/* 327 */       clientInfo = t10_newClientCheckDAO.getT47_clientDisp(this.sqlMap, clientInfo);
/*     */ 
/* 329 */       if ((clientInfo.getCountry_cd() != null) && (!"".equals(clientInfo.getCountry_cd()))) {
/* 330 */         clientInfo.setCountry_cd_disp((String)nationalityMap.get(clientInfo.getCountry_cd()));
/*     */       }
/*     */ 
/* 333 */       if ((clientInfo.getIndustry() != null) && (!"".equals(clientInfo.getIndustry()))) {
/* 334 */         clientInfo.setIndustry_disp((String)industryMap.get(clientInfo.getIndustry()));
/*     */       }
/*     */ 
/* 337 */       if ((clientInfo.getCard_type() != null) && (!"".equals(clientInfo.getCard_type()))) {
/* 338 */         clientInfo.setCard_type_disp((String)bitpMap.get(clientInfo.getCard_type()));
/*     */       }
/*     */ 
/* 341 */       if ((clientInfo.getOccupation() != null) && (!"".equals(clientInfo.getOccupation()))) {
/* 342 */         clientInfo.setOccupation_disp((String)occupationMap.get(clientInfo.getOccupation()));
/*     */       }
/*     */ 
/* 345 */       if ((clientInfo.getDuty() != null) && (!"".equals(clientInfo.getDuty()))) {
/* 346 */         clientInfo.setDuty_disp((String)dutyMap.get(clientInfo.getDuty()));
/*     */       }
/*     */ 
/* 349 */       if ((clientInfo.getOrgankey() != null) && (!"".equals(clientInfo.getOrgankey()))) {
/* 350 */         clientInfo.setOrgan_name_disp((String)organMap.get(clientInfo.getOrgankey()));
/*     */       }
/*     */ 
/* 353 */       if ((clientInfo.getCard_type_c() != null) && (!"".equals(clientInfo.getCard_type_c()))) {
/* 354 */         clientInfo.setCard_type_c_disp((String)card_type_cMap.get(clientInfo.getCard_type_c()));
/*     */       }
/*     */ 
/* 357 */       if ((clientInfo.getAml2_type_cd() != null) && (!"".equals(clientInfo.getAml2_type_cd()))) {
/* 358 */         clientInfo.setAml2_type_cd_disp((String)pbc_cttp2Map.get(clientInfo.getAml2_type_cd()));
/*     */       }
/*     */ 
/* 361 */       if ((clientInfo.getEnrol_fund_currency_cd() != null) && (!"".equals(clientInfo.getEnrol_fund_currency_cd()))) {
/* 362 */         clientInfo.setEnrol_fund_currency_cd_disp((String)currencyMap.get(clientInfo.getEnrol_fund_currency_cd()));
/*     */       }
/*     */ 
/* 365 */       if ((clientInfo.getLegal_card_type() != null) && (!"".equals(clientInfo.getLegal_card_type()))) {
/* 366 */         clientInfo.setLegal_card_type_disp((String)bitpMap.get(clientInfo.getLegal_card_type()));
/*     */       }
/*     */ 
/* 369 */       if ((clientInfo.getStock_holder_card_type() != null) && (!"".equals(clientInfo.getStock_holder_card_type()))) {
/* 370 */         clientInfo.setStock_holder_card_type_disp((String)bitpMap.get(clientInfo.getStock_holder_card_type()));
/*     */       }
				if ((clientInfo.getGender() != null) && (!"".equals(clientInfo.getGender()))) {
					clientInfo.setGender_disp((String)genderMap.get(clientInfo.getGender()));
				}
/* 372 */       MyBeanUtils.copyBean2Bean(form, clientInfo);
/*     */ 
/* 375 */       T10_newClientCheck listType = t10_newClientCheckDAO.getT10_newClientCheck_listType(this.sqlMap, party_id);
/* 376 */       if ((listType.getRule_type() != null) && (!"".equals(listType.getRule_type()))) {
/* 377 */         listType.setRule_type_disp((String)rule_typeMap.get(listType.getRule_type()));
/*     */       }
/* 379 */       if ((listType.getList_type() != null) && (!"".equals(listType.getList_type()))) {
/* 380 */         listType.setList_type_disp((String)m_list_type_bMap.get(listType.getList_type()));
/*     */       }
/* 382 */       request.setAttribute("listType", listType);
/*     */ 
/* 385 */       if (ischecked.equals("newclient")) {
/* 386 */         checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkState(this.sqlMap, party_id);
/*     */       }
/*     */       else {
/* 389 */         checkState.setCheck_no(check_no);
/* 390 */         checkStateMap = t10_newClientCheckDAO.getT10_newClientCheck_checkedState(this.sqlMap, checkState);
/*     */       }
/*     */ 
/* 393 */       checkResult.setCheck_no(check_no);
/* 394 */       checkResult = t10_newClientCheckDAO.getT10_newClientCheck_checkResult(this.sqlMap, checkResult);
/* 395 */       this.sqlMap.commitTransaction();
/* 396 */       this.sqlMap.endTransaction();
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 400 */       e.printStackTrace();
/* 401 */       this.logger.error("寮傚父", e);
/* 402 */       return mapping.findForward("failure");
/*     */     }
/* 404 */     request.setAttribute("clientInfo", clientInfo);
/* 405 */     request.setAttribute("checkStateMap", checkStateMap);
/* 406 */     request.setAttribute("checkResult", checkResult);
/* 407 */     request.setAttribute("ischecked", ischecked);
/* 408 */     request.setAttribute("showCheckReason", showCheckReason);
/* 409 */     if (ischecked.equals("already")) {
/* 410 */       return mapping.findForward("success_already");
/*     */     }
/* 412 */     request.setAttribute("check_exist", check_exist);
/* 413 */     return mapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward modifyNewClientCheck_do(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 427 */     T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
/* 428 */     T10_newClientCheck t10_newClientCheck = new T10_newClientCheck();
/* 429 */     String check_type = request.getParameter("check_type");
/*     */ 
/* 431 */     String check_exist = request.getParameter("check_exist");
/* 432 */     String url = request.getParameter("url");
/* 433 */     request.setAttribute("url", url);
/* 434 */     ActionMessages errors = new ActionMessages();
/*     */     try {
/* 436 */       T10_newClientCheckActionForm t10_newClientCheckActionForm = (T10_newClientCheckActionForm)form;
/* 437 */       MyBeanUtils.copyBean2Bean(t10_newClientCheck, t10_newClientCheckActionForm);
/* 438 */       HttpSession session = request.getSession();
/*     */ 
/* 440 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 441 */       Authorization auth = authBean.getAuthToken();
/*     */ 
/* 443 */       String party_id = "";
/* 444 */       String party_class_cd = "";
/* 445 */       String check_no = "";
/*     */ 
/* 447 */       if ((request.getParameter("party_id") != null) && (!"".equals(request.getParameter("party_id")))) {
/* 448 */         party_id = request.getParameter("party_id");
/*     */       }
/* 450 */       if ((request.getParameter("party_class_cd") != null) && (!"".equals(request.getParameter("party_class_cd")))) {
/* 451 */         party_class_cd = request.getParameter("party_class_cd");
/*     */       }
/* 453 */       t10_newClientCheck.setParty_id(party_id);
/* 454 */       t10_newClientCheck.setParty_class_cd(party_class_cd);
/*     */ 
/* 456 */       t10_newClientCheck.setCheck_org(auth.getT00_user().getOrgankey());
/* 457 */       t10_newClientCheck.setChecker(auth.getT00_user().getUsername());
/* 458 */       t10_newClientCheck.setCheck_dt(DateUtils.getCurrDateTime());
/* 459 */       this.sqlMap.endTransaction();
/* 460 */       this.sqlMap.startTransaction();
/*     */ 
/* 462 */       t10_newClientCheckDAO.insertT10_newClientCheck_clientInfo(this.sqlMap, t10_newClientCheck);
/*     */ 
/* 464 */       check_no = getSequenceNextVal("SEQ_T10_CHECKPARTY_RELT");
/* 465 */       t10_newClientCheck.setCheck_no(check_no);
/*     */ 
/* 467 */       performAddT10_checkResult(t10_newClientCheck, check_type, check_exist);
/*     */ 
/* 469 */       if (t10_newClientCheck.getAddwmenu_flag().equals("1")) {
/* 470 */         performAddT07_OBJ_RULEDo(t10_newClientCheck, request);
/*     */       }
/*     */ 
/* 473 */       if (t10_newClientCheck.getAddbmenu_flag().equals("1")) {
/* 474 */         performAddT07_BlacklistDo(t10_newClientCheck, request);
/*     */       }
/* 476 */       String[] checkboxes = new String[16];
/* 477 */       if (request.getParameterValues("checkbox") != null) {
/* 478 */         checkboxes = request.getParameterValues("checkbox");
/*     */       }
/*     */ 
/* 481 */       String[] elementids = request.getParameterValues("elementid");
/* 482 */       int len = elementids.length;
/* 483 */       ArrayList tmpList = new ArrayList();
/*     */       String elementid;
/* 484 */       for (int i = 0; i < len; i++) {
/* 485 */         String upcode = elementids[i].split(",")[0];
/* 486 */         elementid = elementids[i].split(",")[1];
/* 487 */         String elementname = elementids[i].split(",")[2];
/* 488 */         T10_newClientCheck tt = new T10_newClientCheck();
/* 489 */         tt.setParty_id(party_id);
/* 490 */         tt.setCheck_no(check_no);
/* 491 */         tt.setUpcode(upcode);
/* 492 */         tt.setElementid(elementid);
/* 493 */         tt.setElementname(elementname);
/* 494 */         String checkuser = request.getParameter("checkuser_" + elementid) == null ? "" : request.getParameter("checkuser_" + elementid);
/* 495 */         String checkdate_disp = request.getParameter("checkdate_disp_" + elementid) == null ? "" : request.getParameter("checkdate_disp_" + elementid);
/* 496 */         String context = request.getParameter("context_" + elementid) == null ? "" : request.getParameter("context_" + elementid);
/*     */ 
/* 498 */         if (upcode.equals("1")) {
/* 499 */           for (String boxelementid : checkboxes)
/* 500 */             if (elementid.equals(boxelementid)) {
/* 501 */               tt.setIstrue("1");
/* 502 */               tt.setCheckuser(checkuser);
/* 503 */               tt.setCheckdate_disp(checkdate_disp);
/* 504 */               tmpList.add(tt);
/*     */             }
/*     */         }
/* 507 */         else if (upcode.equals("2")) {
/* 508 */           if ((context != null) && (!"".equals(context))) {
/* 509 */             tt.setContext(context);
/* 510 */             tmpList.add(tt);
/*     */           }
/* 512 */         } else if (upcode.equals("3")) {
/* 513 */           for (String boxelementid : checkboxes) {
/* 514 */             if (elementid.equals(boxelementid)) {
/* 515 */               tt.setIstrue("1");
/* 516 */               tt.setContext(context);
/* 517 */               tmpList.add(tt);
/*     */             }
/*     */           }
/*     */         }
/* 521 */         else if ((context != null) && (!"".equals(context))) {
/* 522 */           tt.setContext(context);
/* 523 */           tmpList.add(tt);
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 528 */       boolean flag = t10_newClientCheckDAO.getT10_newClientCheck_checkStateCount(this.sqlMap, party_id);
/* 529 */       if (flag)
/*     */       {
/* 531 */         int k = t10_newClientCheckDAO.insertT10_newClientCheck_checkState_uh(this.sqlMap, party_id);
/*     */ 
/* 533 */         t10_newClientCheckDAO.deleteT10_newClientCheck_checkState_single(this.sqlMap, party_id);
/*     */       }
/*     */ 
/* 536 */       int h = t10_newClientCheckDAO.insertT10_newClientCheck_checkState(this.sqlMap, tmpList);
/* 537 */       this.sqlMap.commitTransaction();
/* 538 */       this.sqlMap.endTransaction();
/*     */     }
/*     */     catch (Exception e) {
/* 541 */       e.printStackTrace();
/* 542 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 543 */       saveMessages(request, errors);
/* 544 */       return mapping.findForward("failure");
/*     */     }
/* 546 */     return mapping.findForward("success");
/*     */   }
/*     */ 
/*     */   private void performAddT07_OBJ_RULEDo(T10_newClientCheck t10NewClientCheck, HttpServletRequest request)
/*     */     throws Exception
/*     */   {
/* 565 */     HttpSession session = request.getSession();
/* 566 */     T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO)this.context.getBean("t07_obj_ruleDAO");
/* 567 */     T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
/* 568 */     T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO)this.context.getBean("t07_tpbcruleDAO");
/* 569 */     T07_pbcrule t07_pbcrule = new T07_pbcrule();
/* 570 */     ArrayList t07_pbcruleList = new ArrayList();
/*     */ 
/* 572 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 573 */     Authorization auth = authBean.getAuthToken();
/*     */     try
/*     */     {
/* 576 */       t07_obj_rule.setParty_id(t10NewClientCheck.getParty_id());
/* 577 */       t07_obj_rule.setIsuse("0");
/* 578 */       t07_obj_rule.setOrgankey(t10NewClientCheck.getOrgankey());
/* 579 */       t07_obj_rule.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
/* 580 */       t07_obj_rule.setObj_name(t10NewClientCheck.getParty_chn_name());
/* 581 */       t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
/* 582 */       t07_obj_rule.setReason_create(t10NewClientCheck.getReason_create());
/* 583 */       t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
/* 584 */       t07_obj_rule.setRule_type(t10NewClientCheck.getRule_type());
/* 585 */       t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
/* 586 */       String check = "";
/* 587 */       if (auth.getT00_user().getOrganlevel().equals("0")) {
/* 588 */         check = "check";
/*     */       }
/* 590 */       if ("check".equals(check)) {
/* 591 */         t07_obj_rule.setIscheck("1");
/* 592 */         t07_obj_rule.setIsuse("0");
/*     */       } else {
/* 594 */         LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/* 595 */         if ("1".equals(t87_sysparaMap.get("404")))
/*     */         {
/* 597 */           t07_obj_rule.setIscheck("2");
/*     */         }
/*     */         else
/* 600 */           t07_obj_rule.setIscheck("4");
/*     */       }
/* 602 */       int row = t07_obj_ruleDAO.insertT07_OBJ_RULE(this.sqlMap, t07_obj_rule);
/* 603 */       if (row <= 0) {
/* 604 */         throw new Exception("");
/*     */       }
/*     */ 
/* 607 */       if (("check".equals(check)) && (t07_obj_rule.getIsuse().equals("0"))) {
/* 608 */         t07_obj_rule.setPbc_type_cd(t10NewClientCheck.getRule_type());
/* 609 */         if ("3".equals(t10NewClientCheck.getRule_type())) {
/* 610 */           t07_obj_rule.setPbc_type_cd("1");
/* 611 */           t07_obj_rule.setPbc_cd("2");
/*     */         }
/* 613 */         int i = t07_obj_ruleDAO.insertT07_OBJ_RULES(this.sqlMap, t07_obj_rule);
/*     */       }
/*     */     } catch (Exception e) {
/* 616 */       e.printStackTrace();
/*     */     }
/*     */   }
/*     */ 
/*     */   private void performAddT07_BlacklistDo(T10_newClientCheck t10NewClientCheck, HttpServletRequest request)
/*     */     throws Exception
/*     */   {
/* 635 */     HttpSession session = request.getSession();
/* 636 */     T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO)this.context.getBean("t07_blacklistDAO");
/* 637 */     T07_Blacklist t07_blacklist = new T07_Blacklist();
/* 638 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 639 */     Authorization auth = authBean.getAuthToken();
/* 640 */     t07_blacklist.setParty_id(t10NewClientCheck.getParty_id());
/* 641 */     t07_blacklist.setObjkey(t10NewClientCheck.getParty_id());
/* 642 */     t07_blacklist.setObj_name(t10NewClientCheck.getParty_chn_name());
/* 643 */     t07_blacklist.setList_type(t10NewClientCheck.getList_type());
/* 644 */     t07_blacklist.setIsuse("0");
/* 645 */     t07_blacklist.setReason_create(t10NewClientCheck.getB_reason_create());
/* 646 */     t07_blacklist.setCard_no(t10NewClientCheck.getCard_no());
/* 647 */     t07_blacklist.setCard_type(t10NewClientCheck.getCard_type());
/* 648 */     t07_blacklist.setOrgankey(auth.getT00_user().getOrgankey());
/* 649 */     t07_blacklist.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
/* 650 */     t07_blacklist.setCreate_user(auth.getT00_user().getUsername());
/* 651 */     t07_blacklist.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
/* 652 */     t07_blacklist.setModify_user(auth.getT00_user().getUsername());
/* 653 */     t07_blacklist.setModify_dt(new Date());
/* 654 */     String check = "";
/* 655 */     if (auth.getT00_user().getOrganlevel().equals("0")) {
/* 656 */       check = "check";
/*     */     }
/* 658 */     if ("check".equals(check)) {
/* 659 */       t07_blacklist.setIscheck("1");
/*     */     } else {
/* 661 */       LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/* 662 */       if ("1".equals(t87_sysparaMap.get("404")))
/*     */       {
/* 664 */         t07_blacklist.setIscheck("2");
/*     */       }
/*     */       else
/* 667 */         t07_blacklist.setIscheck("4");
/*     */     }
/* 669 */     int rows = t07_blacklistDAO.insertT07_Blacklist(this.sqlMap, t07_blacklist);
/*     */   }
/*     */ 
/*     */   private void performAddT10_checkResult(T10_newClientCheck t10NewClientCheck, String check_type, String check_exist) throws Exception
/*     */   {
/* 674 */     T10_newClientCheckDAO t10_newClientCheckDAO = (T10_newClientCheckDAO)this.context.getBean("t10_newClientCheckDAO");
/* 675 */     T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO)this.context.getBean("t07_attention_libDAO");
/* 676 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/* 677 */     String party_id = t10NewClientCheck.getParty_id();
/*     */ 
/* 679 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 680 */     t10_checkparty.setParty_id(party_id);
/* 681 */     t10_checkparty.setHost_cust_id(party_id);
/* 682 */     t10_checkparty.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
/* 683 */     t10_checkparty.setParty_chn_name(t10NewClientCheck.getParty_chn_name());
/* 684 */     t10_checkparty.setCard_type(t10NewClientCheck.getCard_type());
/* 685 */     t10_checkparty.setCard_no(t10NewClientCheck.getCard_no());
/* 686 */     t10_checkparty.setOrgankey(t10NewClientCheck.getOrgankey());
/* 687 */     t10_checkparty.setCreate_dt(DateUtils.getCurrDateTime());
/* 688 */     t10_checkparty.setParty_status_cd("0");
/* 689 */     t10_checkparty.setAml1_type_cd(t10NewClientCheck.getAml1_type_cd());
/* 690 */     t10_checkparty.setCheck_status("1");
/*     */ 
/* 692 */     if ((check_type != null) && (!"".equals(check_type))) {
/* 693 */       t10NewClientCheck.setCheck_type(check_type);
/*     */ 
/* 695 */       if (check_type.equals("1"))
/*     */       {
/* 697 */         if ("0".equals(check_exist))
/*     */         {
/* 699 */           boolean flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */           int i;
/* 700 */           if (flag)
/*     */           {
/* 702 */             i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */           }
/*     */           else {
/* 705 */             t10_newClientCheckDAO.insertT10_CHECKPARTY_NEW(this.sqlMap, t10_checkparty);
/*     */           }
/*     */         }
/*     */ 
/* 709 */         t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_NEW(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */       }
/*     */ 
/* 712 */       if (check_type.equals("2"))
/*     */       {
/* 714 */         if ("0".equals(check_exist))
/*     */         {
/* 716 */           boolean flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */           int i;
/* 717 */           if (flag)
/*     */           {
/* 719 */             i = t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */           }
/*     */           else
/*     */           {
/* 723 */             t10_checkparty.setRecheck_type("3");
/* 724 */             t10_checkparty.setCheck_reason(t10NewClientCheck.getCheck_reason());
/* 725 */             t10_checkpartyDAO.insertT10_checkparty_re(this.sqlMap, t10_checkparty);
/*     */           }
/*     */         }
/*     */ 
/* 729 */         t10_newClientCheckDAO.modifyStatusT10_CHECKPARTY_RE(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */       }
/*     */ 
/* 732 */       boolean flag = t10_newClientCheckDAO.isExistT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck.getParty_id());
/* 733 */       if (flag)
/*     */       {
/* 735 */         t10_newClientCheckDAO.insertT10_CHECKPARTY_RELT_UH(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */ 
/* 737 */         t10_newClientCheckDAO.deleteT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck.getParty_id());
/*     */       }
/*     */ 
/* 740 */       t10_newClientCheckDAO.insertT10_CHECKPARTY_RELT(this.sqlMap, t10NewClientCheck);
/*     */ 
/* 743 */       if ((t10NewClientCheck.getCheck_result() != null) && (!"".equals(t10NewClientCheck.getCheck_result())) && (!"0".equals(t10NewClientCheck.getCheck_result())))
/*     */       {
/* 745 */         boolean isExist = t07_attention_libDAO.isExistParty_id(this.sqlMap, t10NewClientCheck.getParty_id());
/* 746 */         if (!isExist)
/*     */         {
/* 748 */           String atten_id = getSequenceNextVal("SEQ_T07_ATTENTION_LIB");
/*     */ 
/* 750 */           T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
/*     */ 
/* 752 */           T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log();
/* 753 */           t07_attention_lib.setCreate_dt(DateUtils.dateToStringShort(new Date()));
/* 754 */           t07_attention_lib.setAtten_id(atten_id);
/* 755 */           t07_attention_lib.setParty_id(t10NewClientCheck.getParty_id());
/* 756 */           t07_attention_lib.setParty_chn_name(t10NewClientCheck.getParty_chn_name());
/* 757 */           t07_attention_lib.setParty_class_cd(t10NewClientCheck.getParty_class_cd());
/* 758 */           t07_attention_lib.setOrgankey(t10NewClientCheck.getOrgankey());
/* 759 */           t07_attention_lib.setAtten_type(t10NewClientCheck.getCheck_result());
/* 760 */           t07_attention_lib.setOp_result("1");
/* 761 */           t07_attention_lib.setInvalid_dt(t10NewClientCheck.getValid_dt_disp());
/* 762 */           if ("C".equals(t10NewClientCheck.getParty_class_cd()))
/* 763 */             t07_attention_lib.setCard_type(t10NewClientCheck.getCard_type_c());
/*     */           else {
/* 765 */             t07_attention_lib.setCard_type(t10NewClientCheck.getCard_type());
/*     */           }
/* 767 */           t07_attention_lib.setCard_no(t10NewClientCheck.getCard_no());
/* 768 */           t07_attention_lib.setAtten_source("4");
/* 769 */           t07_attention_lib.setTarget_post("P1");
/* 770 */           t07_attention_lib.setAdd_post("p");
/* 771 */           t07_attention_lib.setExtend_num(Integer.valueOf(0));
/* 772 */           int rows = t07_attention_libDAO.insertT07_ATTENTION_lib(this.sqlMap, t07_attention_lib);
/* 773 */           if (rows <= 0) {
/* 774 */             throw new Exception("");
/*     */           }
/* 776 */           t07_attention_log.setAtten_id("'" + atten_id + "'");
/* 777 */           t07_attention_log.setOp_time(DateUtils.getCurrTime());
/* 778 */           t07_attention_log.setOp_person(t10NewClientCheck.getChecker());
/* 779 */           t07_attention_log.setOp_type("1");
/* 780 */           t07_attention_log.setOp_reason("鐢辨柊澧炶皟鏌ョ粨璁烘坊鍔�");
/* 781 */           t07_attention_libDAO.insertT07_ATTENTION_log(this.sqlMap, t07_attention_log);
/*     */         }
/*     */       }
/*     */     }
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\闆呭畨寮�鍙戠▼搴廫istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_newClientCheckAction
 * JD-Core Version:    0.6.2
 */