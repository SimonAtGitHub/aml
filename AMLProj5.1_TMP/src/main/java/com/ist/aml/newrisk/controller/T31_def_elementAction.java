/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.newrisk.dao.T31_def_elementDAO;
/*     */ import com.ist.aml.newrisk.dto.T31_def_element;
/*     */ import com.ist.aml.newrisk.dto.T31_def_elementscore;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.util.StringUtils;
/*     */ import java.sql.SQLException;
/*     */ import java.util.ArrayList;
/*     */ import java.util.HashMap;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ import java.util.Map;
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
/*     */ public class T31_def_elementAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  54 */     ActionForward myforward = null;
/*  55 */     String myaction = mapping.getParameter();
/*     */ 
/*  57 */     myforward = preExecute(mapping, form, request, response);
/*     */ 
/*  59 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  60 */       return myforward;
/*     */     }
/*  62 */     if ("getT31_def_elementList".equalsIgnoreCase(myaction)) {
/*  63 */       myforward = performGetT31_def_elementList(mapping, form, request, 
/*  64 */         response);
/*     */     }
/*  67 */     else if ("addT31_def_element".equalsIgnoreCase(myaction)) {
/*  68 */       myforward = performAddT31_def_element(mapping, form, request, 
/*  69 */         response);
/*     */     }
/*  72 */     else if ("addT31_def_elementDo".equalsIgnoreCase(myaction)) {
/*  73 */       myforward = performAddT31_def_elementDo(mapping, form, request, 
/*  74 */         response);
/*     */     }
/*  77 */     else if ("modifyT31_def_element".equalsIgnoreCase(myaction)) {
/*  78 */       myforward = performModifyT31_def_element(mapping, form, request, 
/*  79 */         response);
/*     */     }
/*  82 */     else if ("modifyT31_def_elementDo".equalsIgnoreCase(myaction)) {
/*  83 */       myforward = performModifyT31_def_elementDo(mapping, form, request, 
/*  84 */         response);
/*     */     }
/*  87 */     else if ("deleteT31_def_elementDo".equalsIgnoreCase(myaction)) {
/*  88 */       myforward = performDeleteT31_def_elementDo(mapping, form, request, 
/*  89 */         response);
/*     */     }
/*  92 */     else if ("getT31_def_elementDisp".equalsIgnoreCase(myaction)) {
/*  93 */       myforward = performGetT31_def_elementDisp(mapping, form, request, 
/*  94 */         response);
/*     */     }
/*  96 */     else if ("getT31_def_elementLocate".equalsIgnoreCase(myaction)) {
/*  97 */       myforward = performGetT31_def_elementLocate(mapping, form, request, 
/*  98 */         response);
/*     */     }
/* 101 */     else if ("editRange".equalsIgnoreCase(myaction)) {
/* 102 */       myforward = performEditRange(mapping, form, request, 
/* 103 */         response);
/*     */     }
/* 105 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_def_elementList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 124 */     ActionMessages errors = new ActionMessages();
/* 125 */     List t31_def_elementList = null;
/*     */ 
/* 127 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 128 */       .getBean("t31_def_elementDAO");
/* 129 */     T31_def_element t31_def_element = new T31_def_element();
/* 130 */     T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/*     */     try
/*     */     {
/* 133 */       String url = request.getContextPath() + "/newrisk" + 
/* 134 */         actionMapping.getPath() + ".do";
/* 135 */       t31_def_element = (T31_def_element)getSearchObject(
/* 136 */         t31_def_element, request, form, 
/* 137 */         "getT31_def_elementListCount", url);
/* 138 */       if (t31_def_element.getNewsearchflag().equals("1"))
/*     */       {
/* 141 */         saveSearchObject(t31_def_element, request);
/*     */       }
/*     */       else {
/* 144 */         MyBeanUtils.copyBean2Bean(form, t31_def_element);
/*     */       }
/*     */ 
/* 148 */       t31_def_elementList = t31_def_elementDAO.getT31_def_elementList(
/* 149 */         this.sqlMap, t31_def_element, getStartRec(t31_def_element
/* 150 */         .getIntPage()), getIntPageSize());
/*     */ 
/* 154 */       String elementkey = t31_def_element.getUpelementkey();
/* 155 */       if ("-1".equals(elementkey))
/*     */       {
/* 157 */         form.setTreelaye("1");
/* 158 */         form.setIs_last("0");
/*     */ 
/* 160 */         if (t31_def_elementList.size() > 0)
/*     */         {
/* 162 */           T31_def_element element = (T31_def_element)t31_def_elementList.get(0);
/* 163 */           form.setUpelementkey(element.getElementkey());
/*     */         }
/*     */ 
/*     */       }
/*     */       else
/*     */       {
/* 170 */         String treelaye = t31_def_elementDAO.getTreelaye(this.sqlMap, elementkey);
/* 171 */         form.setTreelaye(Integer.parseInt(treelaye) + 1);
/*     */       }
/*     */ 
/* 176 */       String js_type = t31_def_elementDAO.getT31_def_element_jsType(this.sqlMap, t31_def_element);
/* 177 */       form.setJs_type(js_type);
/* 178 */       Map js_typeMap = this.cm.getMapFromCache("newrisk_jf_js_type");
/* 179 */       request.setAttribute("js_type_disp", (String)js_typeMap.get(js_type));
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 183 */       e.printStackTrace();
/* 184 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 185 */         "error.common", e.getMessage()));
/* 186 */       saveMessages(request, errors);
/* 187 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 190 */     request.setAttribute("t31_def_elementList", t31_def_elementList);
/*     */ 
/* 192 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_def_element(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 210 */     ActionMessages errors = new ActionMessages();
/* 211 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 212 */       .getBean("t31_def_elementDAO");
/* 213 */     T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/* 214 */     if ("1".equals(form.getIs_last()))
/*     */     {
/* 216 */       return actionMapping.findForward("success1");
/*     */     }
/*     */ 
/* 219 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_def_elementDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 241 */     ActionMessages errors = new ActionMessages();
/* 242 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 243 */       .getBean("t31_def_elementDAO");
/* 244 */     T31_def_element t31_def_element = new T31_def_element();
/*     */     try
/*     */     {
/* 247 */       T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/*     */ 
/* 249 */       PropertyUtils.copyProperties(t31_def_element, form);
/*     */ 
/* 251 */       String[] elementnames = request.getParameterValues("elementname");
/* 252 */       String[] base_occs = request.getParameterValues("base_occ");
/* 253 */       String[] dess = request.getParameterValues("des");
/* 254 */       String[] indickeys = (String[])null;
/* 255 */       String[] valnums = (String[])null;
/* 256 */       String[] base_scores = (String[])null;
/* 257 */       String[] element_scores = (String[])null;
/* 258 */       String[] riskcaltypes = (String[])null;
/* 259 */       String[] is_sums = (String[])null;
/* 260 */       String[] is_audits = (String[])null;
/* 261 */       String[] caltypes = (String[])null;
/* 262 */       String[] randomChars = (String[])null;
/*     */ 
/* 264 */       this.sqlMap.startTransaction();
/*     */ 
/* 266 */       if ("1".equals(form.getIs_last()))
/*     */       {
/* 268 */         indickeys = request.getParameterValues("indickey");
/* 269 */         valnums = request.getParameterValues("valnum");
/* 270 */         base_scores = request.getParameterValues("base_score");
/* 271 */         element_scores = request.getParameterValues("element_score");
/* 272 */         riskcaltypes = request.getParameterValues("riskcaltype");
/* 273 */         is_sums = request.getParameterValues("is_sum");
/* 274 */         is_audits = request.getParameterValues("is_audit");
/* 275 */         caltypes = request.getParameterValues("caltype");
/* 276 */         randomChars = request.getParameterValues("randomChar");
/*     */       }
/*     */ 
/* 280 */       t31_def_elementDAO.updateT31_def_element_jsType(this.sqlMap, t31_def_element);
/*     */ 
/* 283 */       for (int i = 0; i < elementnames.length; i++)
/*     */       {
/* 285 */         t31_def_element.setElementname(elementnames[i]);
/* 286 */         t31_def_element.setBase_occ_d(StringUtils.null2double(base_occs[i]));
/* 287 */         t31_def_element.setDes(dess[i]);
/* 288 */         if ("1".equals(form.getIs_last()))
/*     */         {
/* 290 */           t31_def_element.setIndickey(indickeys[i]);
/* 291 */           t31_def_element.setValnum(valnums[i]);
/* 292 */           t31_def_element.setBase_score_d(Double.parseDouble(base_scores[i]));
/* 293 */           t31_def_element.setElement_score_d(Double.parseDouble(element_scores[i]));
/* 294 */           t31_def_element.setRiskcaltype(riskcaltypes[i]);
/* 295 */           t31_def_element.setIs_sum(is_sums[i]);
/* 296 */           t31_def_element.setIs_audit(is_audits[i]);
/* 297 */           t31_def_element.setCaltype(caltypes[i]);
/*     */         }
/* 299 */         String elementkey = "E" + getSequenceNextVal("SEQ_T31_DEF_ELEMENT");
/* 300 */         t31_def_element.setElementkey(elementkey);
/* 301 */         int rows = t31_def_elementDAO.insertT31_def_element(this.sqlMap, 
/* 302 */           t31_def_element);
/* 303 */         if (rows <= 0) {
/* 304 */           throw new Exception("");
/*     */         }
/* 306 */         if ("5".equals(t31_def_element.getCaltype()))
/*     */         {
/* 308 */           Map t31_def_elementscoreMap = (HashMap)request.getSession().getAttribute("t31_def_elementscoreMap");
/* 309 */           List t31_def_elementscoreList = (ArrayList)t31_def_elementscoreMap.get(randomChars[i]);
/*     */ 
/* 311 */           for (T31_def_elementscore score : t31_def_elementscoreList)
/*     */           {
/* 313 */             score.setElementkey(t31_def_element.getElementkey());
/* 314 */             String scoreid = "S" + getSequenceNextVal("SEQ_T31_DEF_ELEMENTSCORE");
/* 315 */             score.setScoreid(scoreid);
/* 316 */             int scoreRow = t31_def_elementDAO.insertT31_def_elementscore(this.sqlMap, score);
/* 317 */             if (scoreRow <= 0) {
/* 318 */               throw new Exception("");
/*     */             }
/*     */           }
/*     */ 
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 326 */       this.sqlMap.commitTransaction();
/* 327 */       request.getSession().removeAttribute("t31_def_elementscoreMap");
/* 328 */       request.setAttribute("refresh", "1");
/*     */     }
/*     */     catch (Exception e) {
/* 331 */       e.printStackTrace();
/* 332 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 333 */         "error.common", e.getMessage()));
/* 334 */       saveMessages(request, errors);
/* 335 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     }
/*     */     finally
/*     */     {
/*     */       try {
/* 340 */         this.sqlMap.endTransaction();
/*     */       }
/*     */       catch (SQLException e) {
/* 343 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 346 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_def_element(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 364 */     ActionMessages errors = new ActionMessages();
/* 365 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 366 */       .getBean("t31_def_elementDAO");
/* 367 */     T31_def_element t31_def_element = new T31_def_element();
/* 368 */     List t31_def_elementList = new ArrayList();
/* 369 */     T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/*     */     try
/*     */     {
/* 373 */       LinkedHashMap is_sumMap = this.cm.getMapFromCache("sum_type");
/* 374 */       request.setAttribute("is_sumMap", getOptionsListByMap(
/* 375 */         is_sumMap, null, false));
/*     */ 
/* 377 */       LinkedHashMap is_auditMap = this.cm.getMapFromCache("is_audit");
/* 378 */       request.setAttribute("is_auditMap", getOptionsListByMap(
/* 379 */         is_auditMap, null, false));
/*     */ 
/* 381 */       PropertyUtils.copyProperties(t31_def_element, form);
/* 382 */       t31_def_elementList = t31_def_elementDAO.getT31_def_elementList(this.sqlMap, 
/* 383 */         t31_def_element);
/*     */ 
/* 386 */       request.setAttribute("t31_def_elementList", t31_def_elementList);
/*     */ 
/* 388 */       String is_last = ((T31_def_element)t31_def_elementList.get(0)).getIs_last();
/* 389 */       form.setIs_last(is_last);
/*     */ 
/* 392 */       String js_type = t31_def_elementDAO.getT31_def_element_jsType(this.sqlMap, t31_def_element);
/* 393 */       form.setJs_type(js_type);
/* 394 */       Map map = this.cm.getMapFromCache("newrisk_jf_js_type");
/* 395 */       request.setAttribute("js_typeMap", getOptionsListByMap(map, null, false));
/*     */ 
/* 398 */       if ("1".equals(is_last))
/*     */       {
/* 400 */         Map t31_def_elementscoreMap = t31_def_elementDAO.getT31_def_elementscoreMap(this.sqlMap, t31_def_element);
/* 401 */         request.getSession().setAttribute("t31_def_elementscoreMap", t31_def_elementscoreMap);
/* 402 */         return actionMapping.findForward("success1");
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 406 */       e.printStackTrace();
/* 407 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 408 */         "error.common", e.getMessage()));
/* 409 */       saveMessages(request, errors);
/* 410 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 414 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_def_elementDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 432 */     ActionMessages errors = new ActionMessages();
/* 433 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 434 */       .getBean("t31_def_elementDAO");
/* 435 */     T31_def_element t31_def_element = new T31_def_element();
/*     */     try {
/* 437 */       T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/*     */ 
/* 439 */       PropertyUtils.copyProperties(t31_def_element, form);
/*     */ 
/* 441 */       String[] elementkeys = request.getParameterValues("elementkey");
/* 442 */       String[] elementnames = request.getParameterValues("elementname");
/* 443 */       String[] base_occs = request.getParameterValues("base_occ");
/* 444 */       String[] dess = request.getParameterValues("des");
/* 445 */       String[] indickeys = (String[])null;
/* 446 */       String[] valnums = (String[])null;
/* 447 */       String[] base_scores = (String[])null;
/* 448 */       String[] element_scores = (String[])null;
/* 449 */       String[] riskcaltypes = (String[])null;
/* 450 */       String[] is_sums = (String[])null;
/* 451 */       String[] is_audits = (String[])null;
/* 452 */       String[] caltypes = (String[])null;
/* 453 */       String[] randomChars = (String[])null;
/* 454 */       if ("1".equals(form.getIs_last()))
/*     */       {
/* 456 */         indickeys = request.getParameterValues("indickey");
/* 457 */         valnums = request.getParameterValues("valnum");
/* 458 */         base_scores = request.getParameterValues("base_score");
/* 459 */         element_scores = request.getParameterValues("element_score");
/* 460 */         riskcaltypes = request.getParameterValues("riskcaltype");
/* 461 */         is_sums = request.getParameterValues("is_sum");
/* 462 */         is_audits = request.getParameterValues("is_audit");
/* 463 */         caltypes = request.getParameterValues("caltype");
/* 464 */         randomChars = request.getParameterValues("randomChar");
/*     */       }
/*     */ 
/* 467 */       t31_def_element.setElementkeys(elementkeys);
/*     */ 
/* 469 */       this.sqlMap.startTransaction();
/* 470 */       List notInList = t31_def_elementDAO.getT31_def_elementList(this.sqlMap, t31_def_element);
/*     */ 
/* 472 */       ArrayList allList = new ArrayList();
/*     */ 
/* 474 */       if (notInList.size() > 0)
/*     */       {
/* 476 */         allList = t31_def_elementDAO.getELementList_for_cascade_del(this.sqlMap, t31_def_element);
/*     */       }
/*     */ 
/* 479 */       String subkeys = "";
/* 480 */       for (T31_def_element element : notInList)
/*     */       {
/* 483 */         subkeys = subkeys + "'" + element.getElementkey() + "'," + getDelElementkey(element.getElementkey(), allList);
/*     */       }
/*     */ 
/* 487 */       if ("1".equals(form.getIs_last()))
/*     */       {
/* 489 */         t31_def_elementDAO.deleteT31_def_elementscoreByElementkeys(this.sqlMap, elementkeys);
/*     */       }
/*     */ 
/* 492 */       t31_def_elementDAO.updateT31_def_element_jsType(this.sqlMap, t31_def_element);
/*     */ 
/* 495 */       if (!"".equals(subkeys))
/*     */       {
/* 497 */         subkeys = subkeys.substring(0, subkeys.length() - 1);
/*     */ 
/* 499 */         t31_def_elementDAO.deleteT31_def_elementscore(this.sqlMap, subkeys);
/*     */ 
/* 501 */         t31_def_elementDAO.deleteT31_def_element(this.sqlMap, subkeys);
/*     */       }
/*     */ 
/* 505 */       for (int i = 0; i < elementkeys.length; i++)
/*     */       {
/* 507 */         t31_def_element.setElementname(elementnames[i]);
/* 508 */         t31_def_element.setBase_occ_d(StringUtils.null2double(base_occs[i]));
/* 509 */         t31_def_element.setDes(dess[i]);
/* 510 */         if ("1".equals(form.getIs_last()))
/*     */         {
/* 512 */           t31_def_element.setIndickey(indickeys[i]);
/* 513 */           t31_def_element.setValnum(valnums[i]);
/* 514 */           t31_def_element.setBase_score_d(StringUtils.null2int(base_scores[i]));
/* 515 */           t31_def_element.setElement_score_d(Double.parseDouble(element_scores[i]));
/* 516 */           t31_def_element.setRiskcaltype(riskcaltypes[i]);
/* 517 */           t31_def_element.setIs_sum(is_sums[i]);
/* 518 */           t31_def_element.setIs_audit(is_audits[i]);
/* 519 */           t31_def_element.setCaltype(caltypes[i]);
/*     */         }
/*     */ 
/* 522 */         String elementkey = elementkeys[i];
/* 523 */         if ("".equals(elementkey))
/*     */         {
/* 525 */           elementkey = "E" + getSequenceNextVal("SEQ_T31_DEF_ELEMENT");
/* 526 */           t31_def_element.setElementkey(elementkey);
/* 527 */           int rows = t31_def_elementDAO.insertT31_def_element(this.sqlMap, 
/* 528 */             t31_def_element);
/* 529 */           if (rows <= 0) {
/* 530 */             throw new Exception("");
/*     */           }
/*     */ 
/*     */         }
/*     */         else
/*     */         {
/* 536 */           t31_def_element.setElementkey(elementkey);
/* 537 */           int rows = t31_def_elementDAO.modifyT31_def_element(this.sqlMap, t31_def_element);
/* 538 */           if (rows <= 0) {
/* 539 */             throw new Exception("");
/*     */           }
/*     */         }
/* 542 */         if (("1".equals(form.getIs_last())) && ("5".equals(t31_def_element.getCaltype())))
/*     */         {
/* 546 */           Map t31_def_elementscoreMap = (HashMap)request.getSession().getAttribute("t31_def_elementscoreMap");
/* 547 */           List t31_def_elementscoreList = (ArrayList)t31_def_elementscoreMap.get(randomChars[i]);
/*     */ 
/* 549 */           for (T31_def_elementscore score : t31_def_elementscoreList)
/*     */           {
/* 551 */             score.setElementkey(t31_def_element.getElementkey());
/* 552 */             String scoreid = "S" + getSequenceNextVal("SEQ_T31_DEF_ELEMENTSCORE");
/* 553 */             score.setScoreid(scoreid);
/* 554 */             int scoreRow = t31_def_elementDAO.insertT31_def_elementscore(this.sqlMap, score);
/* 555 */             if (scoreRow <= 0) {
/* 556 */               throw new Exception("");
/*     */             }
/*     */           }
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/* 563 */       this.sqlMap.commitTransaction();
/*     */ 
/* 565 */       request.getSession().removeAttribute("t31_def_elementscoreMap");
/* 566 */       request.setAttribute("refresh", "1");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 571 */       e.printStackTrace();
/* 572 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 573 */         "error.common", e.getMessage()));
/* 574 */       saveMessages(request, errors);
/* 575 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     } finally {
/*     */       try {
/* 578 */         this.sqlMap.endTransaction();
/*     */       }
/*     */       catch (SQLException e) {
/* 581 */         e.printStackTrace();
/*     */       }
/*     */     }
/*     */ 
/* 585 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT31_def_elementDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 603 */     ActionMessages errors = new ActionMessages();
/* 604 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 605 */       .getBean("t31_def_elementDAO");
/* 606 */     T31_def_element t31_def_element = new T31_def_element();
/*     */     try {
/* 608 */       T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/* 609 */       MyBeanUtils.copyBean2Bean(t31_def_element, form);
/*     */ 
/* 611 */       ArrayList list = t31_def_elementDAO.getELementList_for_cascade_del(this.sqlMap, t31_def_element);
/*     */ 
/* 613 */       String elementkeys = getDelElementkey(t31_def_element.getUpelementkey(), list);
/*     */ 
/* 615 */       if (!"".equals(elementkeys))
/*     */       {
/* 617 */         elementkeys = elementkeys.substring(0, elementkeys.length() - 1);
/*     */       }
/*     */ 
/* 620 */       t31_def_elementDAO.deleteT31_def_element(this.sqlMap, elementkeys);
/* 621 */       t31_def_elementDAO.deleteT31_def_elementscore(this.sqlMap, elementkeys);
/* 622 */       request.setAttribute("refresh", "1");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 628 */       e.printStackTrace();
/* 629 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 630 */         "error.common", e.getMessage()));
/* 631 */       saveMessages(request, errors);
/* 632 */       return actionMapping.findForward("failure");
/*     */     }
/* 634 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_def_elementDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 652 */     ActionMessages errors = new ActionMessages();
/* 653 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 654 */       .getBean("t31_def_elementDAO");
/* 655 */     T31_def_element t31_def_element = new T31_def_element();
/*     */     try {
/* 657 */       T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/* 658 */       MyBeanUtils.copyBean2Bean(t31_def_element, form);
/*     */ 
/* 661 */       t31_def_element = t31_def_elementDAO.getT31_def_elementDisp(this.sqlMap, 
/* 662 */         t31_def_element);
/* 663 */       Map t31_def_elementscoreMap = t31_def_elementDAO.getT31_def_elementscoreMap(this.sqlMap, t31_def_element);
/* 664 */       request.getSession().setAttribute("t31_def_elementscoreMap", t31_def_elementscoreMap);
/* 665 */       if (!"1".equals(t31_def_element.getIs_last()))
/*     */       {
/* 667 */         String turnUrl = "/newrisk/t31_def_element/t31_def_element_list.do?newsearchflag=1&templatekey=" + form.getTemplatekey() + 
/* 668 */           "&upelementkey=" + form.getUpelementkey();
/* 669 */         response.sendRedirect(request.getContextPath() + turnUrl);
/* 670 */         return null;
/*     */       }
/*     */ 
/* 674 */       String js_type = t31_def_elementDAO.getT31_def_element_jsType(this.sqlMap, t31_def_element);
/* 675 */       t31_def_element.setJs_type(js_type);
/*     */     } catch (Exception e) {
/* 677 */       e.printStackTrace();
/* 678 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 679 */         "error.common", e.getMessage()));
/* 680 */       saveMessages(request, errors);
/* 681 */       return actionMapping.findForward("failure");
/*     */     }
/* 683 */     request.setAttribute("t31_def_element", t31_def_element);
/*     */ 
/* 685 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   private String getDelElementkey(String upelement, List<T31_def_element> list)
/*     */   {
/* 690 */     String elementkey = "";
/* 691 */     for (T31_def_element e : list)
/*     */     {
/* 694 */       if (e.getUpelementkey().equals(upelement))
/*     */       {
/* 696 */         elementkey = elementkey + "'" + e.getElementkey() + "',";
/*     */ 
/* 698 */         String element = getDelElementkey(e.getElementkey(), list);
/*     */ 
/* 700 */         if (!"".equals(element))
/*     */         {
/* 702 */           elementkey = elementkey + element;
/*     */         }
/*     */ 
/*     */       }
/*     */ 
/*     */     }
/*     */ 
/* 711 */     return elementkey;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_def_elementLocate(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 717 */     ActionMessages errors = new ActionMessages();
/* 718 */     List t31_def_elementList = null;
/*     */ 
/* 720 */     T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context
/* 721 */       .getBean("t31_def_elementDAO");
/* 722 */     T31_def_element t31_def_element = new T31_def_element();
/* 723 */     T31_def_elementActionForm form = (T31_def_elementActionForm)actionForm;
/*     */     try
/*     */     {
/* 726 */       String url = request.getContextPath() + "/newrisk" + 
/* 727 */         actionMapping.getPath() + ".do";
/* 728 */       t31_def_element = (T31_def_element)getSearchObject(
/* 729 */         t31_def_element, request, form, 
/* 730 */         "getT31_def_elementLocateCount", url);
/* 731 */       if (t31_def_element.getNewsearchflag().equals("1"))
/*     */       {
/* 734 */         saveSearchObject(t31_def_element, request);
/*     */       }
/*     */ 
/* 737 */       t31_def_elementList = t31_def_elementDAO.getT31_def_elementLocate(
/* 738 */         this.sqlMap, t31_def_element, getStartRec(t31_def_element
/* 739 */         .getIntPage()), getIntPageSize());
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 743 */       e.printStackTrace();
/* 744 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 745 */         "error.common", e.getMessage()));
/* 746 */       saveMessages(request, errors);
/* 747 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 750 */     request.setAttribute("t31_def_elementList", t31_def_elementList);
/*     */ 
/* 752 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performEditRange(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 770 */     String index = request.getParameter("index");
/* 771 */     String type = request.getParameter("type");
/* 772 */     HttpSession session = request.getSession();
/*     */ 
/* 774 */     List list = new ArrayList();
/* 775 */     HashMap map = (HashMap)session.getAttribute("t31_def_elementscoreMap");
/* 776 */     if (map == null)
/*     */     {
/* 778 */       map = new HashMap();
/*     */     }
/*     */ 
/* 781 */     if (type.equals("save"))
/*     */     {
/* 783 */       String[] deses = request.getParameterValues("des");
/* 784 */       String[] min_scores = request.getParameterValues("min_score");
/* 785 */       String[] max_scores = request.getParameterValues("max_score");
/* 786 */       String[] scores = request.getParameterValues("score");
/*     */ 
/* 788 */       for (int i = 0; i < deses.length; i++)
/*     */       {
/* 790 */         T31_def_elementscore temp = new T31_def_elementscore();
/* 791 */         temp.setDes(deses[i]);
/* 792 */         temp.setMin_score(min_scores[i]);
/* 793 */         if (!"".equals(min_scores[i].trim()))
/*     */         {
/* 795 */           temp.setMin_score_d(Double.valueOf(Double.parseDouble(min_scores[i])));
/*     */         }
/* 797 */         temp.setMax_score(max_scores[i]);
/* 798 */         if (!"".equals(max_scores[i].trim()))
/*     */         {
/* 800 */           temp.setMax_score_d(Double.valueOf(Double.parseDouble(max_scores[i])));
/*     */         }
/*     */ 
/* 803 */         temp.setScore(scores[i]);
/* 804 */         temp.setScore_d(Double.parseDouble(scores[i]));
/* 805 */         list.add(temp);
/*     */       }
/* 807 */       map.put(index, list);
/* 808 */     } else if (type.equals("edit"))
/*     */     {
/* 810 */       request.setAttribute("index", index);
/*     */     }
/* 812 */     session.setAttribute("t31_def_elementscoreMap", map);
/* 813 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_elementAction
 * JD-Core Version:    0.6.2
 */