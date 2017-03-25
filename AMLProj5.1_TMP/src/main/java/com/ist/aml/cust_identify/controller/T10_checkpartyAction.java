/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import com.ist.aml.cust_identify.dao.T10_checkpartyDAO;
/*     */ import com.ist.aml.cust_identify.dao.T10_checkparty_funDAO;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty;
/*     */ import com.ist.aml.cust_identify.dto.T10_checkparty_fun;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.PageUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import com.ist.util.StringUtils;
/*     */ import java.util.ArrayList;
/*     */ import java.util.LinkedHashMap;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import org.apache.log4j.Logger;
/*     */ import org.apache.struts.action.ActionError;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T10_checkpartyAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  63 */     ActionForward myforward = preExecute(mapping, form, request, response);
/*  64 */     String myaction = mapping.getParameter();
/*     */ 
/*  66 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  67 */       return myforward;
/*     */     }
/*  69 */     if ("getT10_checkparty_newlist".equalsIgnoreCase(myaction)) {
/*  70 */       myforward = performGetT10_checkparty_newlist(mapping, form, request, 
/*  71 */         response);
/*     */     }
/*  74 */     else if ("getT10_checkparty_relist".equalsIgnoreCase(myaction)) {
/*  75 */       myforward = performGetT10_checkparty_relist(mapping, form, request, 
/*  76 */         response);
/*     */     }
/*  79 */     else if ("getT10_checkparty_alreadylist".equalsIgnoreCase(myaction)) {
/*  80 */       myforward = performGetT10_checkparty_alreadylist(mapping, form, request, 
/*  81 */         response);
/*     */     }
/*  84 */     else if ("getT10_checkparty_uhlist".equalsIgnoreCase(myaction)) {
/*  85 */       myforward = performGetT10_checkparty_uhlist(mapping, form, request, 
/*  86 */         response);
/*     */     }
/*  89 */     else if ("addT10_checkparty_arti".equalsIgnoreCase(myaction)) {
/*  90 */       myforward = performAddT10_checkparty_arti(mapping, form, request, 
/*  91 */         response);
/*     */     }
/*  93 */     else if ("addT10_checkparty_artiDo".equalsIgnoreCase(myaction)) {
/*  94 */       myforward = performAddT10_checkparty_artiDo(mapping, form, request, 
/*  95 */         response);
/*     */     }
/*  98 */     else if ("add_t10_survey_partyDo".equalsIgnoreCase(myaction)) {
/*  99 */       myforward = performAddT10_survey_partyDo(mapping, form, request, 
/* 100 */         response);
/*     */     }
/* 103 */     else if ("deleteT10_checkparty_reByListDo".equalsIgnoreCase(myaction)) {
/* 104 */       myforward = performDeleteT10_checkparty_reByListDo(mapping, form, request, 
/* 105 */         response);
/*     */     }
/* 108 */     else if ("insertT10_checkparty_re_fromcaseDo".equalsIgnoreCase(myaction)) {
/* 109 */       myforward = performAddT10_checkparty_re_fromcaseDo(mapping, form, request, 
/* 110 */         response);
/*     */     }
/*     */ 
/* 113 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_checkparty_newlist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 132 */     ActionErrors errors = new ActionErrors();
/* 133 */     HttpSession session = request.getSession();
/* 134 */     ArrayList t10_checkparty_newlist = new ArrayList();
/* 135 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/* 136 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 137 */     String pageInfo = "";
/*     */     try {
/* 139 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/*     */ 
/* 141 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 142 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*     */ 
/* 144 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 145 */       Authorization auth = authBean.getAuthToken();
/* 146 */       String organStr = auth.getOrganstr();
/* 147 */       t10_checkparty.setOrganStr(organStr);
/* 148 */       if (newsearchflag.equals("1")) {
/* 149 */         MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/* 150 */         session.setAttribute("t10_checkparty_newSearchObj", t10_checkparty);
/*     */       } else {
/* 152 */         t10_checkparty = (T10_checkparty)session.getAttribute("t10_checkparty_newSearchObj");
/* 153 */         MyBeanUtils.copyBean2Bean(form, t10_checkparty);
/*     */       }
/* 155 */       t10_checkparty_newlist = t10_checkpartyDAO.getT10_checkparty_newlist(this.sqlMap, t10_checkparty, getStartRec(intPage), getIntPageSize());
/* 156 */       int totalRow = t10_checkpartyDAO.getT10_checkparty_newCount(this.sqlMap, t10_checkparty);
/* 157 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 158 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/* 159 */       String party_class_cd_str = this.cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(), "", true);
/* 160 */       request.setAttribute("party_class_cd_str", party_class_cd_str);
/*     */     } catch (Exception e) {
/* 162 */       e.printStackTrace();
/* 163 */       this.logger.error("异常", e);
/*     */ 
/* 165 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 166 */         "error.pagertitle.default", e.getMessage()));
/* 167 */       saveMessages(request, errors);
/* 168 */       return actionMapping.findForward("failure");
/*     */     }
/* 170 */     request.setAttribute("pageInfo", pageInfo);
/* 171 */     request.setAttribute("t10_checkparty_newlist", t10_checkparty_newlist);
/* 172 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_checkparty_uhlist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 185 */     ActionErrors errors = new ActionErrors();
/* 186 */     HttpSession session = request.getSession();
/* 187 */     ArrayList t10_checkparty_uhlist = new ArrayList();
/* 188 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/* 189 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 190 */     String pageInfo = "";
/*     */     try {
/* 192 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/*     */ 
/* 195 */       LinkedHashMap cust_checktypeMap = this.cm.getMapFromCache("cust_checktype");
/* 196 */       request.setAttribute("cust_checktypeMap", getOptionsListByMap(cust_checktypeMap, null, true));
/* 197 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 198 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*     */ 
/* 200 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 201 */       Authorization auth = authBean.getAuthToken();
/* 202 */       String organStr = auth.getOrganstr();
/* 203 */       t10_checkparty.setOrganStr(organStr);
/* 204 */       if (t10_checkparty.getCheck_type().equals("")) {
/* 205 */         t10_checkparty.setCheck_type("1");
/*     */       }
/*     */ 
/* 208 */       if (newsearchflag.equals("1")) {
/* 209 */         MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/* 210 */         if ((t10_checkparty.getCheck_dt_start_disp() != null) && (!t10_checkparty.getCheck_dt_start_disp().equals(""))) {
/* 211 */           t10_checkparty.setCheck_dt_start(DateUtils.stringToDateShort(form.getCheck_dt_start_disp()));
/*     */         }
/* 213 */         if ((t10_checkparty.getCheck_dt_end_disp() != null) && (!t10_checkparty.getCheck_dt_end_disp().equals(""))) {
/* 214 */           t10_checkparty.setCheck_dt_end(DateUtils.stringToDateShort(form.getCheck_dt_end_disp()));
/*     */         }
/* 216 */         if ((t10_checkparty.getValid_dt_start_disp() != null) && (!t10_checkparty.getValid_dt_start_disp().equals(""))) {
/* 217 */           t10_checkparty.setValid_dt_start(DateUtils.stringToDateShort(form.getValid_dt_start_disp()));
/*     */         }
/* 219 */         if ((t10_checkparty.getValid_dt_end_disp() != null) && (!t10_checkparty.getValid_dt_end_disp().equals(""))) {
/* 220 */           t10_checkparty.setValid_dt_end(DateUtils.stringToDateShort(form.getValid_dt_end_disp()));
/*     */         }
/* 222 */         session.setAttribute("t10_checkparty_uhSearchObj", t10_checkparty);
/*     */       } else {
/* 224 */         t10_checkparty = (T10_checkparty)session.getAttribute("t10_checkparty_uhSearchObj");
/* 225 */         MyBeanUtils.copyBean2Bean(form, t10_checkparty);
/*     */       }
/* 227 */       t10_checkparty_uhlist = t10_checkpartyDAO.getT10_checkparty_uhlist(this.sqlMap, t10_checkparty, getStartRec(intPage), getIntPageSize());
/* 228 */       int totalRow = t10_checkpartyDAO.getT10_checkparty_uhCount(this.sqlMap, t10_checkparty);
/* 229 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 230 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*     */ 
/* 232 */       String party_class_cd_str = this.cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(), "", true);
/* 233 */       request.setAttribute("party_class_cd_str", party_class_cd_str);
/*     */     } catch (Exception e) {
/* 235 */       e.printStackTrace();
/* 236 */       this.logger.error("异常", e);
/*     */ 
/* 238 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 239 */         "error.pagertitle.default", e.getMessage()));
/* 240 */       saveMessages(request, errors);
/* 241 */       return actionMapping.findForward("failure");
/*     */     }
/* 243 */     request.setAttribute("pageInfo", pageInfo);
/* 244 */     request.setAttribute("t10_checkparty_uhlist", t10_checkparty_uhlist);
/* 245 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_checkparty_relist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 258 */     ActionErrors errors = new ActionErrors();
/* 259 */     HttpSession session = request.getSession();
/* 260 */     ArrayList t10_checkparty_relist = new ArrayList();
/* 261 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/* 262 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 263 */     String pageInfo = "";
/*     */     try {
/* 265 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/*     */ 
/* 268 */       LinkedHashMap recheck_typeMap = this.cm.getMapFromCache("recheck_type");
/* 269 */       request.setAttribute("recheck_typeMap", getOptionsListByMap(recheck_typeMap, null, true));
/* 270 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 271 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*     */ 
/* 273 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 274 */       Authorization auth = authBean.getAuthToken();
/* 275 */       String organStr = auth.getOrganstr();
/* 276 */       t10_checkparty.setOrganStr(organStr);
/* 277 */       if (newsearchflag.equals("1")) {
/* 278 */         MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/* 279 */         session.setAttribute("t10_checkparty_reSearchObj", t10_checkparty);
/*     */       } else {
/* 281 */         t10_checkparty = (T10_checkparty)session.getAttribute("t10_checkparty_reSearchObj");
/* 282 */         MyBeanUtils.copyBean2Bean(form, t10_checkparty);
/*     */       }
/* 284 */       t10_checkparty_relist = t10_checkpartyDAO.getT10_checkparty_relist(this.sqlMap, t10_checkparty, getStartRec(intPage), getIntPageSize());
/* 285 */       int totalRow = t10_checkpartyDAO.getT10_checkparty_reCount(this.sqlMap, t10_checkparty);
/* 286 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 287 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/* 288 */       String party_class_cd_str = this.cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(), "", true);
/* 289 */       request.setAttribute("party_class_cd_str", party_class_cd_str);
/*     */     } catch (Exception e) {
/* 291 */       e.printStackTrace();
/* 292 */       this.logger.error("异常", e);
/*     */ 
/* 294 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 295 */         "error.pagertitle.default", e.getMessage()));
/* 296 */       saveMessages(request, errors);
/* 297 */       return actionMapping.findForward("failure");
/*     */     }
/* 299 */     request.setAttribute("pageInfo", pageInfo);
/* 300 */     request.setAttribute("t10_checkparty_relist", t10_checkparty_relist);
/* 301 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_checkparty_alreadylist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 314 */     ActionErrors errors = new ActionErrors();
/* 315 */     HttpSession session = request.getSession();
/* 316 */     ArrayList t10_checkparty_alreadylist = new ArrayList();
/* 317 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/* 318 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 319 */     String pageInfo = "";
/*     */     try {
/* 321 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/*     */ 
/* 324 */       LinkedHashMap alreadycheck_typeMap = this.cm.getMapFromCache("alreadycheck_type");
/* 325 */       request.setAttribute("alreadycheck_typeMap", getOptionsListByMap(alreadycheck_typeMap, null, true));
/* 326 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 327 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*     */ 
/* 329 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 330 */       Authorization auth = authBean.getAuthToken();
/* 331 */       String organStr = auth.getOrganstr();
/* 332 */       t10_checkparty.setOrganStr(organStr);
/* 333 */       if (newsearchflag.equals("1")) {
/* 334 */         MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/* 335 */         session.setAttribute("t10_checkparty_alreadySearchObj", t10_checkparty);
/*     */       } else {
/* 337 */         t10_checkparty = (T10_checkparty)session.getAttribute("t10_checkparty_alreadySearchObj");
/* 338 */         MyBeanUtils.copyBean2Bean(form, t10_checkparty);
/*     */       }
/* 340 */       t10_checkparty_alreadylist = t10_checkpartyDAO.getT10_checkparty_alreadylist(this.sqlMap, t10_checkparty, getStartRec(intPage), getIntPageSize());
/* 341 */       int totalRow = t10_checkpartyDAO.getT10_checkparty_alreadyCount(this.sqlMap, t10_checkparty);
/* 342 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 343 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/* 344 */       String party_class_cd_str = this.cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(), "", true);
/* 345 */       request.setAttribute("party_class_cd_str", party_class_cd_str);
/*     */     } catch (Exception e) {
/* 347 */       e.printStackTrace();
/* 348 */       this.logger.error("异常", e);
/*     */ 
/* 350 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 351 */         "error.pagertitle.default", e.getMessage()));
/* 352 */       saveMessages(request, errors);
/* 353 */       return actionMapping.findForward("failure");
/*     */     }
/* 355 */     request.setAttribute("pageInfo", pageInfo);
/* 356 */     request.setAttribute("t10_checkparty_alreadylist", t10_checkparty_alreadylist);
/* 357 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT10_checkparty_arti(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 376 */     ActionErrors errors = new ActionErrors();
/* 377 */     HttpSession session = request.getSession();
/* 378 */     T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/*     */ 
/* 381 */     LinkedHashMap check_typeMap = this.cm.getMapFromCache("cust_checktype");
/* 382 */     LinkedHashMap check_typeMap_temp = new LinkedHashMap();
/* 383 */     check_typeMap_temp.putAll(check_typeMap);
/*     */ 
/* 385 */     check_typeMap_temp.remove("5");
/* 386 */     request.setAttribute("check_typeMap", getOptionsListByMap(
/* 387 */       check_typeMap_temp, null, true));
/*     */ 
/* 390 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 391 */     request.setAttribute("clienttypeMap", getOptionsListByMap(
/* 392 */       clienttypeMap, null, true));
/*     */ 
/* 395 */     LinkedHashMap is_relalederMap = this.cm.getMapFromCache("yesNo");
/* 396 */     request.setAttribute("is_relalederMap", getOptionsListByMap(
/* 397 */       is_relalederMap, null, true));
/*     */ 
/* 400 */     LinkedHashMap aml1_typeMap = this.cm.getMapFromCache("aml1_indi");
/* 401 */     request.setAttribute("aml1_typeMap", getOptionsListByMap(
/* 402 */       aml1_typeMap, null, true));
/*     */ 
/* 405 */     LinkedHashMap card_typeMap = this.cm.getMapFromCache("card_type");
/* 406 */     request.setAttribute("card_typeMap", getOptionsListByMap(
/* 407 */       card_typeMap, null, true));
/*     */ 
/* 409 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT10_survey_partyDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 414 */     ActionErrors errors = new ActionErrors();
/* 415 */     HttpSession session = request.getSession();
/* 416 */     T10_checkparty_fun checkparty_arti = new T10_checkparty_fun();
/* 417 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 418 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/* 419 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/*     */     try
/*     */     {
/* 422 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/* 423 */       MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/* 424 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 425 */       Authorization auth = authBean.getAuthToken();
/*     */ 
/* 427 */       T10_checkparty checkparty = t10_checkpartyDAO.getT10_checkparty_reDisp(this.sqlMap, form.getParty_id());
/* 428 */       if ((checkparty != null) && (!checkparty.getParty_id().equals(""))) {
/* 429 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", "该客户已存在！"));
/* 430 */         saveErrors(request, errors);
/* 431 */         return actionMapping.findForward("failure");
/*     */       }
/* 433 */       t10_checkparty.setHost_cust_id(form.getParty_id());
/* 434 */       t10_checkparty.setParty_status_cd("0");
/* 435 */       t10_checkparty.setCheck_status("0");
/* 436 */       t10_checkparty.setRecheck_type("3");
/* 437 */       t10_checkpartyDAO.insertT10_checkparty_re(this.sqlMap, t10_checkparty);
/*     */     }
/*     */     catch (Exception e) {
/* 440 */       e.printStackTrace();
/* 441 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 442 */         "error.pagertitle.default"));
/* 443 */       saveErrors(request, errors);
/* 444 */       return actionMapping.findForward("failure");
/*     */     }
/* 446 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT10_checkparty_reByListDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 451 */     ActionErrors errors = new ActionErrors();
/* 452 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 453 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/*     */     try
/*     */     {
/* 456 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/* 457 */       String[] party_ids = form.getPartyIds();
/* 458 */       ArrayList list = new ArrayList();
/* 459 */       if ((party_ids != null) && (party_ids.length > 0)) {
/* 460 */         for (int i = 0; i < party_ids.length; i++) {
/* 461 */           list.add(party_ids[i]);
/*     */         }
/*     */       }
/* 464 */       t10_checkparty.setList(list);
/* 465 */       t10_checkpartyDAO.deleteT10_checkparty_re_byList(this.sqlMap, t10_checkparty);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 470 */       e.printStackTrace();
/* 471 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 472 */         "error.pagertitle.default"));
/* 473 */       saveErrors(request, errors);
/* 474 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 477 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT10_checkparty_artiDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 482 */     ActionErrors errors = new ActionErrors();
/* 483 */     HttpSession session = request.getSession();
/* 484 */     T10_checkparty_fun checkparty_arti = new T10_checkparty_fun();
/*     */     try
/*     */     {
/* 488 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/* 489 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 490 */       Authorization auth = authBean.getAuthToken();
/* 491 */       String organkey = auth.getT00_user().getOrgankey();
/*     */ 
/* 494 */       if ((form.getOrgankey() == null) || ("".equals(form.getOrgankey())))
/* 495 */         form.setOrgankey(organkey);
/* 496 */       MyBeanUtils.copyBean2Bean(checkparty_arti, form);
/*     */ 
/* 498 */       String partyrisk_no = getSequenceNextVal("SEQ_T10_PARTY_RISK");
/* 499 */       checkparty_arti.setPartyrisk_no(partyrisk_no);
/* 500 */       session.removeAttribute("checkparty_arti");
/* 501 */       session.setAttribute("checkparty_arti", checkparty_arti);
/*     */     }
/*     */     catch (Exception e) {
/* 504 */       e.printStackTrace();
/* 505 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 506 */         "error.pagertitle.default"));
/* 507 */       saveErrors(request, errors);
/* 508 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 511 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT10_checkparty_re_fromcaseDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 517 */     ActionErrors errors = new ActionErrors();
/*     */ 
/* 519 */     T10_checkparty t10_checkparty = new T10_checkparty();
/* 520 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/*     */     try
/*     */     {
/* 523 */       T10_checkpartyActionForm form = (T10_checkpartyActionForm)actionForm;
/* 524 */       MyBeanUtils.copyBean2Bean(t10_checkparty, form);
/*     */ 
/* 526 */       T10_checkparty checkparty = t10_checkpartyDAO.getT10_checkparty_reDisp(this.sqlMap, form.getParty_id());
/* 527 */       if ((checkparty != null) && (!checkparty.getParty_id().equals(""))) {
/* 528 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", "该客户已存在！"));
/* 529 */         saveErrors(request, errors);
/* 530 */         return actionMapping.findForward("failure");
/*     */       }
/*     */ 
/* 533 */       t10_checkparty.setCheck_status("0");
/* 534 */       t10_checkparty.setCheck_type("3");
/* 535 */       t10_checkpartyDAO.insertT10_checkparty_re_fromcase(this.sqlMap, t10_checkparty);
/*     */     }
/*     */     catch (Exception e) {
/* 538 */       e.printStackTrace();
/* 539 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 540 */         "error.pagertitle.default"));
/* 541 */       saveErrors(request, errors);
/* 542 */       return actionMapping.findForward("failure");
/*     */     }
/* 544 */     request.setAttribute("refresh", "1");
/* 545 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_checkpartyAction
 * JD-Core Version:    0.6.2
 */