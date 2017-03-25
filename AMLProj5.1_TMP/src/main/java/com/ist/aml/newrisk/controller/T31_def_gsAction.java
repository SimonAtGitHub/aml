/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dao.T31_def_gsDAO;
/*     */ import com.ist.aml.newrisk.dao.T31_def_tempDAO;
/*     */ import com.ist.aml.newrisk.dto.T31_def_gs;
/*     */ import com.ist.aml.newrisk.dto.T31_def_temp;
/*     */ import com.ist.aml.rule.dao.T21_indicDAO;
/*     */ import com.ist.aml.rule.dto.T21_indic;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import com.ist.util.StringUtils;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import org.apache.commons.beanutils.PropertyUtils;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.apache.struts.action.ActionMessages;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T31_def_gsAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  55 */     ActionForward myforward = null;
/*  56 */     String myaction = mapping.getParameter();
/*     */ 
/*  58 */     myforward = preExecute(mapping, form, request, response);
/*     */ 
/*  60 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  61 */       return myforward;
/*     */     }
/*  63 */     if ("getT31_def_gsList".equalsIgnoreCase(myaction)) {
/*  64 */       myforward = performGetT31_def_gsList(mapping, form, request, 
/*  65 */         response);
/*     */     }
/*  68 */     else if ("addT31_def_gs".equalsIgnoreCase(myaction)) {
/*  69 */       myforward = performAddT31_def_gs(mapping, form, request, response);
/*     */     }
/*  72 */     else if ("addT31_def_gsDo".equalsIgnoreCase(myaction)) {
/*  73 */       myforward = performAddT31_def_gsDo(mapping, form, request, response);
/*     */     }
/*  76 */     else if ("modifyT31_def_gs".equalsIgnoreCase(myaction)) {
/*  77 */       myforward = performModifyT31_def_gs(mapping, form, request, 
/*  78 */         response);
/*     */     }
/*  81 */     else if ("modifyT31_def_gsDo".equalsIgnoreCase(myaction)) {
/*  82 */       myforward = performModifyT31_def_gsDo(mapping, form, request, 
/*  83 */         response);
/*     */     }
/*  86 */     else if ("deleteT31_def_gsDo".equalsIgnoreCase(myaction)) {
/*  87 */       myforward = performDeleteT31_def_gsDo(mapping, form, request, 
/*  88 */         response);
/*     */     }
/*  91 */     else if ("getT31_def_gsDisp".equalsIgnoreCase(myaction)) {
/*  92 */       myforward = performGetT31_def_gsDisp(mapping, form, request, 
/*  93 */         response);
/*     */     }
/*  95 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_def_gsList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 114 */     ActionMessages errors = new ActionMessages();
/* 115 */     List t31_def_gsList = null;
/*     */ 
/* 117 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/* 118 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/* 119 */     T31_def_gs t31_def_gs = new T31_def_gs();
/*     */     try
/*     */     {
/* 122 */       LinkedHashMap flagMap = this.cm.getMapFromCache("yesNo");
/* 123 */       request.setAttribute("flagMap", getOptionsListByMap(
/* 124 */         flagMap, null, true));
/*     */ 
/* 126 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 127 */       request.setAttribute("levelMap", getOptionsListByMap(
/* 128 */         levelMap, null, true));
/*     */ 
/* 130 */       String templatekey = StringUtils.null2String(request.getParameter("templatekey"));
/* 131 */       request.setAttribute("templatekey", templatekey);
/*     */ 
/* 134 */       T31_def_temp t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, templatekey);
/* 135 */       String templatename = t31_def_temp.getTemplatename();
/* 136 */       request.setAttribute("templatename", templatename);
/*     */ 
/* 138 */       String granularity = StringUtils.null2String(request.getParameter("granularity"));
/* 139 */       request.setAttribute("granularity", granularity);
/* 140 */       String party_class_cd = StringUtils.null2String(request.getParameter("party_class_cd"));
/* 141 */       request.setAttribute("party_class_cd", party_class_cd);
/*     */ 
/* 143 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/*     */ 
/* 145 */       String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/* 146 */       form.setTemplatekey(templatekey);
/* 147 */       form.setTemplatename(templatename);
/* 148 */       form.setGranularity(granularity);
/*     */ 
/* 151 */       t31_def_gs = (T31_def_gs)getSearchObject(t31_def_gs, request, form, "getT31_def_gsListCount", url);
/* 152 */       if (t31_def_gs.getNewsearchflag().equals("1"))
/*     */       {
/* 155 */         saveSearchObject(t31_def_gs, request);
/*     */       }
/*     */       else
/* 158 */         MyBeanUtils.copyBean2Bean(form, t31_def_gs);
/* 159 */       t31_def_gsList = t31_def_gsDAO.getT31_def_gsList(this.sqlMap, t31_def_gs, getStartRec(t31_def_gs.getIntPage()), getIntPageSize());
/*     */     } catch (Exception e) {
/* 161 */       e.printStackTrace();
/* 162 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 163 */         "error.common", e.getMessage()));
/* 164 */       saveMessages(request, errors);
/* 165 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 168 */     request.setAttribute("t31_def_gsList", t31_def_gsList);
/*     */ 
/* 170 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_def_gs(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 188 */     ActionMessages errors = new ActionMessages();
/*     */ 
/* 191 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/* 192 */     request.setAttribute("clienttypeMap", getOptionsListByMap(
/* 193 */       clienttypeMap, null, false));
/*     */ 
/* 195 */     LinkedHashMap is_sumMap = this.cm.getMapFromCache("sum_type");
/* 196 */     request.setAttribute("is_sumMap", getOptionsListByMap(
/* 197 */       is_sumMap, null, false));
/*     */ 
/* 199 */     LinkedHashMap granularityMap = this.cm.getMapFromCache("risk_granularitys");
/* 200 */     request.setAttribute("granularityMap", getOptionsListByMap(
/* 201 */       granularityMap, null, true));
/*     */ 
/* 203 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 204 */     request.setAttribute("levelMap", getOptionsListByMap(
/* 205 */       levelMap, null, true));
/*     */ 
/* 207 */     LinkedHashMap valtypeMap = this.cm.getMapFromCache("compare_operator");
/* 208 */     request.setAttribute("valtypeMap", getOptionsListByMap(
/* 209 */       valtypeMap, null, true));
/*     */     try {
/* 211 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*     */       T31_def_gsActionForm form;
/* 214 */       e.printStackTrace();
/* 215 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 216 */         "error.common", e.getMessage()));
/* 217 */       saveMessages(request, errors);
/* 218 */       return actionMapping.findForward("failure");
/*     */     }
/* 220 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_def_gsDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 238 */     ActionMessages errors = new ActionMessages();
/* 239 */     HttpSession session = request.getSession();
/* 240 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 241 */     Authorization auth = authBean.getAuthToken();
/* 242 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/* 243 */     T31_def_gs t31_def_gs = new T31_def_gs();
/*     */     try {
/* 245 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/* 246 */       String key = "PKG" + getSequenceNextVal("SEQ_T31_DEF_GS");
/* 247 */       form.setGskey(key);
/*     */ 
/* 249 */       PropertyUtils.copyProperties(t31_def_gs, form);
/*     */ 
/* 251 */       t31_def_gs.setCreate_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/* 252 */       t31_def_gs.setCreate_user(auth.getT00_user().getUsername());
/* 253 */       t31_def_gs.setCreate_org(auth.getT00_user().getOrgankey());
/* 254 */       t31_def_gs.setFlag("1");
/* 255 */       String str = form.getCalseq_str();
/* 256 */       if ((str == null) || ("".equals(str)))
/* 257 */         t31_def_gs.setCalseq(Integer.valueOf(Integer.parseInt("1")));
/*     */       else {
/* 259 */         t31_def_gs.setCalseq(Integer.valueOf(Integer.parseInt(str)));
/*     */       }
/* 261 */       this.sqlMap.endTransaction();
/* 262 */       this.sqlMap.startTransaction();
/*     */ 
/* 264 */       String indickey = form.getIndickey();
/* 265 */       if ((indickey != null) && (!indickey.equals("")))
/*     */       {
/* 267 */         String indicname = form.getIndicname();
/* 268 */         String val = form.getValtype();
/* 269 */         String min_str = form.getValparamin().toString();
/* 270 */         String max_str = form.getValparamax().toString();
/* 271 */         String gsrm = "";
/* 272 */         if ("BETWEEN".equals(val))
/*     */         {
/* 274 */           String min_str1 = form.getValparamin1().toString();
/* 275 */           t31_def_gs.setValparamin(form.getValparamin1());
/* 276 */           t31_def_gs.setValparamax(form.getValparamax());
/* 277 */           gsrm = indicname + " " + val + " " + "(" + min_str1 + ", " + max_str + ")";
/*     */         }
/*     */         else
/*     */         {
/* 281 */           gsrm = indicname + " " + val + " " + min_str;
/* 282 */           t31_def_gs.setValparamax(Long.valueOf(Long.parseLong("0")));
/*     */         }
/*     */ 
/* 285 */         t31_def_gsDAO.deleteT31_def_gs_indic(this.sqlMap, key);
/* 286 */         int row2 = t31_def_gsDAO.insertT31_def_gs_indic(this.sqlMap, t31_def_gs);
/*     */ 
/* 288 */         t31_def_gs.setGsrm(gsrm);
/*     */       }
/*     */ 
/* 292 */       int row1 = t31_def_gsDAO.insertT31_def_gs(this.sqlMap, t31_def_gs);
/*     */ 
/* 294 */       this.sqlMap.commitTransaction();
/*     */     } catch (Exception e) {
/* 296 */       e.printStackTrace();
/* 297 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 298 */         "error.common", e.getMessage()));
/* 299 */       saveMessages(request, errors);
/* 300 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     }
/*     */     finally
/*     */     {
/*     */       try {
/* 305 */         this.sqlMap.endTransaction();
/*     */       } catch (Exception e) {
/* 307 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 310 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_def_gs(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 328 */     ActionMessages errors = new ActionMessages();
/* 329 */     T21_indicDAO t21_indicDAO = (T21_indicDAO)this.context.getBean("t21_indicDAO");
/* 330 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/* 331 */     T31_def_gs t31_def_gs = new T31_def_gs();
/*     */     try
/*     */     {
/* 334 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/* 335 */       request.setAttribute("clienttypeMap", getOptionsListByMap(
/* 336 */         clienttypeMap, null, false));
/*     */ 
/* 338 */       LinkedHashMap is_sumMap = this.cm.getMapFromCache("sum_type");
/* 339 */       request.setAttribute("is_sumMap", getOptionsListByMap(
/* 340 */         is_sumMap, null, false));
/*     */ 
/* 342 */       LinkedHashMap flagMap = this.cm.getMapFromCache("yesNo");
/* 343 */       request.setAttribute("flagMap", getOptionsListByMap(
/* 344 */         flagMap, null, false));
/*     */ 
/* 346 */       LinkedHashMap granularityMap = this.cm.getMapFromCache("risk_granularitys");
/* 347 */       request.setAttribute("granularityMap", getOptionsListByMap(
/* 348 */         granularityMap, null, true));
/*     */ 
/* 350 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 351 */       request.setAttribute("levelMap", getOptionsListByMap(
/* 352 */         levelMap, null, true));
/*     */ 
/* 354 */       LinkedHashMap valtypeMap = this.cm.getMapFromCache("compare_operator");
/* 355 */       request.setAttribute("valtypeMap", getOptionsListByMap(
/* 356 */         valtypeMap, null, true));
/*     */ 
/* 358 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/* 359 */       String templatename = form.getTemplatename();
/* 360 */       String gskey = form.getGskeys()[0];
/*     */ 
/* 362 */       t31_def_gs = t31_def_gsDAO.getT31_def_gsDisp(this.sqlMap, gskey);
/* 363 */       T31_def_gs t31_def_gs_indic = t31_def_gsDAO.getT31_def_gs_indicDisp(this.sqlMap, gskey);
/* 364 */       t31_def_gs.setIs_sum(t31_def_gs_indic.getIs_sum());
/* 365 */       t31_def_gs.setValtype(t31_def_gs_indic.getValtype());
/* 366 */       t31_def_gs.setValnum(t31_def_gs_indic.getValnum());
/* 367 */       t31_def_gs.setValparamin(t31_def_gs_indic.getValparamin());
/* 368 */       t31_def_gs.setValparamin1(t31_def_gs_indic.getValparamin1());
/* 369 */       t31_def_gs.setValparamax(t31_def_gs_indic.getValparamax());
/* 370 */       t31_def_gs.setCalseq_str(String.valueOf(t31_def_gs.getCalseq()));
/*     */ 
/* 372 */       PropertyUtils.copyProperties(form, t31_def_gs);
/* 373 */       form.setTemplatename(templatename);
/*     */ 
/* 375 */       String indickey = t31_def_gs_indic.getIndickey();
/* 376 */       if ((indickey != null) && (!"".equals(indickey)))
/*     */       {
/* 378 */         t31_def_gs.setIndickey(indickey);
/* 379 */         T21_indic t21_indic = t21_indicDAO.getT21_indicDisp(this.sqlMap, t31_def_gs.getIndickey());
/* 380 */         String indicname = t21_indic.getIndicname();
/* 381 */         form.setIndickey(indickey);
/* 382 */         form.setIndicname(indicname);
/*     */       }
/*     */ 
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 388 */       e.printStackTrace();
/* 389 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 390 */         "error.common", e.getMessage()));
/* 391 */       saveMessages(request, errors);
/* 392 */       return actionMapping.findForward("failure");
/*     */     }
/* 394 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_def_gsDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 412 */     ActionMessages errors = new ActionMessages();
/* 413 */     HttpSession session = request.getSession();
/* 414 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 415 */     Authorization auth = authBean.getAuthToken();
/*     */ 
/* 417 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/* 418 */     T31_def_gs t31_def_gs = new T31_def_gs();
/*     */     try {
/* 420 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/* 421 */       PropertyUtils.copyProperties(t31_def_gs, form);
/*     */ 
/* 423 */       String gskey = form.getGskey();
/*     */ 
/* 425 */       this.sqlMap.endTransaction();
/* 426 */       this.sqlMap.startTransaction();
/*     */ 
/* 428 */       String indickey = form.getIndickey();
/* 429 */       if ((indickey != null) && (!indickey.equals("")))
/*     */       {
/* 431 */         String indicname = form.getIndicname();
/* 432 */         String val = form.getValtype();
/* 433 */         String min_str = form.getValparamin().toString();
/* 434 */         String max_str = form.getValparamax().toString();
/* 435 */         String gsrm = "";
/* 436 */         if ("BETWEEN".equals(val))
/*     */         {
/* 438 */           t31_def_gs.setValparamin(form.getValparamin1());
/* 439 */           t31_def_gs.setValparamax(form.getValparamax());
/* 440 */           min_str = form.getValparamin1().toString();
/* 441 */           gsrm = indicname + " " + val + " " + "(" + min_str + ", " + max_str + ")";
/*     */         }
/*     */         else
/*     */         {
/* 446 */           gsrm = indicname + " " + val + " " + min_str;
/* 447 */           t31_def_gs.setValparamax(Long.valueOf(Long.parseLong("0")));
/*     */         }
/*     */ 
/* 450 */         t31_def_gs.setGsrm(gsrm);
/* 451 */         t31_def_gsDAO.deleteT31_def_gs_indic(this.sqlMap, gskey);
/* 452 */         t31_def_gsDAO.insertT31_def_gs_indic(this.sqlMap, t31_def_gs);
/*     */       }
/*     */ 
/* 455 */       t31_def_gs.setModify_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/* 456 */       t31_def_gs.setModify_user(auth.getT00_user().getUsername());
/* 457 */       String str = form.getCalseq_str();
/* 458 */       if ((str == null) || ("".equals(str)))
/* 459 */         t31_def_gs.setCalseq(Integer.valueOf(Integer.parseInt("1")));
/*     */       else
/* 461 */         t31_def_gs.setCalseq(Integer.valueOf(Integer.parseInt(str)));
/* 462 */       t31_def_gsDAO.modifyT31_def_gs(this.sqlMap, t31_def_gs);
/* 463 */       this.sqlMap.commitTransaction();
/*     */     } catch (Exception e) {
/* 465 */       e.printStackTrace();
/* 466 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 467 */         "error.common", e.getMessage()));
/* 468 */       saveMessages(request, errors);
/* 469 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     }
/*     */     finally {
/*     */       try {
/* 473 */         this.sqlMap.endTransaction();
/*     */       } catch (Exception e) {
/* 475 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 478 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT31_def_gsDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 496 */     ActionMessages errors = new ActionMessages();
/* 497 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/*     */     try {
/* 499 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/* 500 */       String[] gskey_array = form.getGskeys();
/* 501 */       for (int i = 0; i < gskey_array.length; i++) {
/* 502 */         String gskey = gskey_array[i];
/* 503 */         int row = t31_def_gsDAO.deleteT31_def_gs(this.sqlMap, gskey);
/* 504 */         int result_row = t31_def_gsDAO.deleteT31_def_gs_indic(this.sqlMap, gskey);
/*     */       }
/*     */ 
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 510 */       e.printStackTrace();
/* 511 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 512 */         "error.common", e.getMessage()));
/* 513 */       saveMessages(request, errors);
/* 514 */       return actionMapping.findForward("failure");
/*     */     }
/* 516 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_def_gsDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 534 */     ActionMessages errors = new ActionMessages();
/* 535 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/* 536 */     T31_def_gs t31_def_gs = new T31_def_gs();
/*     */     try {
/* 538 */       T31_def_gsActionForm form = (T31_def_gsActionForm)actionForm;
/* 539 */       String gskey = StringUtils.null2String(request.getParameter("gskey"));
/* 540 */       t31_def_gs = t31_def_gsDAO.getT31_def_gsDisp(this.sqlMap, gskey);
/* 541 */       T31_def_gs t31_def_gs_indic = t31_def_gsDAO.getT31_def_gs_indicDisp(this.sqlMap, gskey);
/*     */ 
/* 543 */       t31_def_gs.setIs_sum(t31_def_gs_indic.getIs_sum());
/* 544 */       t31_def_gs.setValnum(t31_def_gs_indic.getValnum());
/*     */ 
/* 546 */       PropertyUtils.copyProperties(form, t31_def_gs);
/* 547 */       String templatename = request.getParameter("templatename");
/* 548 */       form.setTemplatename(templatename);
/*     */     }
/*     */     catch (Exception e) {
/* 551 */       e.printStackTrace();
/* 552 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 553 */         "error.common", e.getMessage()));
/* 554 */       saveMessages(request, errors);
/* 555 */       return actionMapping.findForward("failure");
/*     */     }
/* 557 */     request.setAttribute("t31_def_gs", t31_def_gs);
/*     */ 
/* 559 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\闆呭畨寮�鍙戠▼搴廫istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_gsAction
 * JD-Core Version:    0.6.2
 */