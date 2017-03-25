/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ist.aml.newrisk.dao.T37_party_result_uhDAO;
/*     */ import com.ist.aml.newrisk.dto.T37_party_result_uh;
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
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.apache.struts.action.ActionMessages;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T37_party_result_uhAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  53 */     ActionForward myforward = null;
/*  54 */     String myaction = mapping.getParameter();
/*     */ 
/*  56 */     myforward = preExecute(mapping, form, request, response);
/*     */ 
/*  58 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  59 */       return myforward;
/*     */     }
/*  61 */     if ("getT37_party_resultList2".equalsIgnoreCase(myaction)) {
/*  62 */       myforward = performGetT37_party_resultList2(mapping, form, request, 
/*  63 */         response);
/*     */     }
/*  66 */     else if ("getT37_party_result2Export".equalsIgnoreCase(myaction)) {
/*  67 */       myforward = performExportT37_party_resultList2(mapping, form, request, 
/*  68 */         response);
/*     */     }
/*  70 */     else if ("getT37_party_result2ExportAll".equalsIgnoreCase(myaction)) {
/*  71 */       myforward = performExportT37_party_resultList2All(mapping, form, request, 
/*  72 */         response);
/*     */     }
/*  75 */     else if ("getT37_party_result_notransList".equalsIgnoreCase(myaction)) {
/*  76 */       myforward = performGetT37_party_result_notransList(mapping, form, request, 
/*  77 */         response);
/*     */     }
/*  79 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_party_resultList2(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  98 */     ActionMessages errors = new ActionMessages();
/*  99 */     HttpSession session = request.getSession();
/* 100 */     ArrayList tempList = new ArrayList();
/*     */ 
/* 102 */     T37_party_result_uhDAO t37_party_result_uhDAO = (T37_party_result_uhDAO)this.context.getBean("t37_party_result_uhDAO");
/* 103 */     T37_party_result_uh t37_party_result_uh = new T37_party_result_uh();
/* 104 */     String pageInfo = "";
/*     */     try {
/* 106 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 107 */       request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
/* 108 */       LinkedHashMap resultsortMap = this.cm.getMapFromCache("risk_resultsort");
/* 109 */       request.setAttribute("resultsortMap", getOptionsListByMap(resultsortMap, null, true));
/* 110 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 111 */       request.setAttribute("riskLevelMap", getOptionsListByMap(levelMap, null, true));
/* 112 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 113 */       request.setAttribute("temp_type_map", getOptionsListByMap(temp_type_map, null, true));
/*     */ 
/* 115 */       String marked = StringUtils.nullObject2String(request.getParameter("marked"));
/* 116 */       request.setAttribute("marked", marked);
/*     */ 
/* 118 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 119 */       Authorization auth = authBean.getAuthToken();
/* 120 */       String organStr = auth.getOrganstr();
/*     */ 
/* 122 */       T37_party_result_uhActionForm form = (T37_party_result_uhActionForm)actionForm;
/*     */ 
/* 125 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 126 */       int intPage = PageUtils.intPage(request, newsearchflag);
/* 127 */       if ("0".equals(newsearchflag)) {
/* 128 */         if (form.getOrgankey().equals("")) {
/* 129 */           form.setOrgankey(auth.getT00_user().getOrgankey());
/*     */         }
/* 131 */         session.removeAttribute("t37_party_result_uhSearchObj");
/*     */       }
/* 133 */       else if ("1".equals(newsearchflag)) {
/* 134 */         form.setOrganStr(organStr);
/* 135 */         form.setMarked(marked);
/* 136 */         String statistic_dt_disp = form.getStatistic_dt_disp();
/* 137 */         String statistic_dt_disp_end = form.getStatistic_dt_disp_end();
/* 138 */         String modifydate_disp = form.getModifydate_disp();
/* 139 */         String modifydate_disp_end = form.getModifydate_disp_end();
/* 140 */         String create_dt_disp = form.getCreate_dt_disp();
/* 141 */         String create_dt_disp_end = form.getCreate_dt_disp_end();
/* 142 */         if ((statistic_dt_disp != null) && (!"".equals(statistic_dt_disp))) {
/* 143 */           form.setStatistic_dt(DateUtils.stringToDateShort(statistic_dt_disp));
/*     */         }
/* 145 */         if ((statistic_dt_disp_end != null) && 
/* 146 */           (!"".equals(statistic_dt_disp_end))) {
/* 147 */           form.setStatistic_dt_end(DateUtils.stringToDateShort(statistic_dt_disp_end));
/*     */         }
/* 149 */         if ((modifydate_disp != null) && (!"".equals(modifydate_disp))) {
/* 150 */           form.setModifydate(DateUtils.stringToDateShort(modifydate_disp));
/*     */         }
/* 152 */         if ((modifydate_disp_end != null) && 
/* 153 */           (!"".equals(modifydate_disp_end))) {
/* 154 */           form.setModifydate_end(DateUtils.stringToDateShort(modifydate_disp_end));
/*     */         }
/* 156 */         if ((create_dt_disp != null) && (!"".equals(create_dt_disp))) {
/* 157 */           form.setCreate_dt(DateUtils.stringToDateShort(create_dt_disp));
/*     */         }
/* 159 */         if ((create_dt_disp_end != null) && 
/* 160 */           (!"".equals(create_dt_disp_end))) {
/* 161 */           form.setCreate_dt_end(DateUtils.stringToDateShort(create_dt_disp_end));
/*     */         }
/* 163 */         MyBeanUtils.copyBean2Bean(t37_party_result_uh, form);
/* 164 */         session.setAttribute("t37_party_result_uhSearchObj", t37_party_result_uh);
/*     */       } else {
/* 166 */         t37_party_result_uh = (T37_party_result_uh)session.getAttribute("t37_party_result_uhSearchObj");
/* 167 */         MyBeanUtils.copyBean2Bean(form, t37_party_result_uh);
/*     */       }
/* 169 */       if (!"0".equals(newsearchflag)) {
/* 170 */         tempList = t37_party_result_uhDAO.getT37_party_resultList2(this.sqlMap, t37_party_result_uh, getStartRec(intPage), getIntPageSize());
/* 171 */         int totalRow = t37_party_result_uhDAO.getT37_party_resultListCount2(this.sqlMap, t37_party_result_uh);
/* 172 */         String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/* 173 */         pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/* 174 */         MyBeanUtils.copyBean2Bean(form, t37_party_result_uh);
/*     */       }
/*     */     } catch (Exception e) {
/* 177 */       e.printStackTrace();
/* 178 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 179 */         "error.common", e.getMessage()));
/* 180 */       saveMessages(request, errors);
/* 181 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 184 */     request.setAttribute("tempList", tempList);
/* 185 */     request.setAttribute("pageInfo", pageInfo);
/*     */ 
/* 187 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performExportT37_party_resultList2(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 205 */     ActionMessages errors = new ActionMessages();
/*     */ 
/* 207 */     ArrayList tempList = new ArrayList();
/* 208 */     T37_party_result_uhDAO t37_party_result_uhDAO = (T37_party_result_uhDAO)this.context.getBean("t37_party_result_uhDAO");
/*     */     try
/*     */     {
/* 211 */       LinkedHashMap risk_levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 212 */       LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/* 213 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 214 */       LinkedHashMap modify_map = this.cm.getMapFromCache("yesNo");
/* 215 */       LinkedHashMap party_classMap = this.cm.getMapFromCache("clienttype");
/*     */ 
/* 217 */       T37_party_result_uhActionForm form = (T37_party_result_uhActionForm)actionForm;
/* 218 */       String mark = form.getMarked();
/* 219 */       String[] keys = form.getSelectedResulekey();
/* 220 */       for (int i = 0; i < keys.length; i++)
/*     */       {
/* 222 */         T37_party_result_uh t37_party_result_uh = new T37_party_result_uh();
/* 223 */         t37_party_result_uh.setMarked(mark);
/* 224 */         t37_party_result_uh.setResulekey(keys[i]);
/*     */ 
/* 226 */         t37_party_result_uh = t37_party_result_uhDAO.getT37_party_result_uhDisp(this.sqlMap, t37_party_result_uh);
/* 227 */         if ((t37_party_result_uh.getTemptype() != null) && (!"".equals(t37_party_result_uh.getTemptype()))) {
/* 228 */           t37_party_result_uh.setTemptype_disp((String)temp_type_map.get(t37_party_result_uh.getTemptype()));
/*     */         }
/* 230 */         if ((t37_party_result_uh.getOrgankey() != null) && (!"".equals(t37_party_result_uh.getOrgankey()))) {
/* 231 */           t37_party_result_uh.setOrgan_name((String)organMap.get(t37_party_result_uh.getOrgankey()));
/*     */         }
/* 233 */         if ((t37_party_result_uh.getFristappralevel() != null) && (!"".equals(t37_party_result_uh.getFristappralevel()))) {
/* 234 */           t37_party_result_uh.setFristappralevel_disp((String)risk_levelMap.get(t37_party_result_uh.getFristappralevel()));
/*     */         }
/* 236 */         if ((t37_party_result_uh.getLevelkey() != null) && (!"".equals(t37_party_result_uh.getLevelkey()))) {
/* 237 */           String levelkey = (String)risk_levelMap.get(t37_party_result_uh.getLevelkey());
/* 238 */           t37_party_result_uh.setLevelkey_disp(levelkey);
/*     */         }
/* 240 */         if ((t37_party_result_uh.getModify_cd() != null) && (!"".equals(t37_party_result_uh.getModify_cd()))) {
/* 241 */           t37_party_result_uh.setModify_cd_disp((String)modify_map.get(t37_party_result_uh.getModify_cd()));
/*     */         }
/* 243 */         if (t37_party_result_uh.getStatistic_dt() != null) {
/* 244 */           t37_party_result_uh.setStatistic_dt_disp(DateUtils.dateToStringShort(t37_party_result_uh.getStatistic_dt()));
/*     */         }
/* 246 */         if (t37_party_result_uh.getModifydate() != null) {
/* 247 */           t37_party_result_uh.setModifydate_disp(DateUtils.dateToStringShort(t37_party_result_uh.getModifydate()));
/*     */         }
/* 249 */         if (t37_party_result_uh.getCreate_dt() != null) {
/* 250 */           t37_party_result_uh.setCreate_dt_disp(DateUtils.dateToStringShort(t37_party_result_uh.getCreate_dt()));
/*     */         }
/* 252 */         if ((t37_party_result_uh.getParty_class_cd() != null) && (!"".equals(t37_party_result_uh.getParty_class_cd()))) {
/* 253 */           t37_party_result_uh.setParty_class_cd_disp((String)party_classMap.get(t37_party_result_uh.getParty_class_cd()));
/*     */         }
/* 255 */         tempList.add(t37_party_result_uh);
/*     */       }
/*     */ 
/* 258 */       String downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "客户风险信息";
/* 259 */       request.setAttribute("downloadname", downloadname);
/*     */     }
/*     */     catch (Exception e) {
/* 262 */       e.printStackTrace();
/* 263 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 264 */         "error.common", e.getMessage()));
/* 265 */       saveMessages(request, errors);
/* 266 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 269 */     request.setAttribute("tempList", tempList);
/* 270 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performExportT37_party_resultList2All(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 288 */     ActionMessages errors = new ActionMessages();
/* 289 */     HttpSession session = request.getSession();
/*     */ 
/* 291 */     ArrayList tempList = new ArrayList();
/*     */ 
/* 293 */     T37_party_result_uhDAO t37_party_result_uhDAO = (T37_party_result_uhDAO)this.context.getBean("t37_party_result_uhDAO");
/* 294 */     T37_party_result_uh t37_party_result_uh = new T37_party_result_uh();
/*     */     try {
/* 296 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 297 */       request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
/* 298 */       LinkedHashMap resultsortMap = this.cm.getMapFromCache("risk_resultsort");
/* 299 */       request.setAttribute("resultsortMap", getOptionsListByMap(resultsortMap, null, true));
/* 300 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 301 */       request.setAttribute("riskLevelMap", getOptionsListByMap(levelMap, null, true));
/* 302 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 303 */       request.setAttribute("temp_type_map", getOptionsListByMap(temp_type_map, null, true));
/*     */ 
/* 305 */       String marked = StringUtils.nullObject2String(request.getParameter("marked"));
/* 306 */       t37_party_result_uh.setMarked(marked);
/* 307 */       request.setAttribute("marked", marked);
/*     */ 
/* 309 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 310 */       Authorization auth = authBean.getAuthToken();
/* 311 */       String organStr = auth.getOrganstr();
/*     */ 
/* 315 */       T37_party_result_uhActionForm form = (T37_party_result_uhActionForm)actionForm;
/*     */ 
/* 317 */       MyBeanUtils.copyBean2Bean(t37_party_result_uh, form);
/* 318 */       String statistic_dt_disp = form.getStatistic_dt_disp();
/* 319 */       String statistic_dt_disp_end = form.getStatistic_dt_disp_end();
/* 320 */       String modifydate_disp = form.getModifydate_disp();
/* 321 */       String modifydate_disp_end = form.getModifydate_disp_end();
/* 322 */       String create_dt_disp = form.getCreate_dt_disp();
/* 323 */       String create_dt_disp_end = form.getCreate_dt_disp_end();
/* 324 */       if ((statistic_dt_disp != null) && (!"".equals(statistic_dt_disp))) {
/* 325 */         t37_party_result_uh.setStatistic_dt(DateUtils.stringToDateShort(statistic_dt_disp));
/*     */       }
/* 327 */       if ((statistic_dt_disp_end != null) && 
/* 328 */         (!"".equals(statistic_dt_disp_end))) {
/* 329 */         t37_party_result_uh.setStatistic_dt_end(DateUtils.stringToDateShort(statistic_dt_disp_end));
/*     */       }
/* 331 */       if ((modifydate_disp != null) && (!"".equals(modifydate_disp))) {
/* 332 */         t37_party_result_uh.setModifydate(DateUtils.stringToDateShort(modifydate_disp));
/*     */       }
/* 334 */       if ((modifydate_disp_end != null) && 
/* 335 */         (!"".equals(modifydate_disp_end))) {
/* 336 */         t37_party_result_uh.setModifydate_end(DateUtils.stringToDateShort(modifydate_disp_end));
/*     */       }
/* 338 */       if ((create_dt_disp != null) && (!"".equals(create_dt_disp))) {
/* 339 */         t37_party_result_uh.setCreate_dt(DateUtils.stringToDateShort(create_dt_disp));
/*     */       }
/* 341 */       if ((create_dt_disp_end != null) && 
/* 342 */         (!"".equals(create_dt_disp_end))) {
/* 343 */         t37_party_result_uh.setCreate_dt_end(DateUtils.stringToDateShort(create_dt_disp_end));
/*     */       }
/*     */ 
/* 346 */       String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/*     */ 
/* 353 */       tempList = t37_party_result_uhDAO.getT37_party_resultList2(this.sqlMap, t37_party_result_uh, getStartRec(t37_party_result_uh.getIntPage()), 5000);
/*     */ 
/* 355 */       String downloadname = "";
/* 356 */       if (marked.equals("0"))
/* 357 */         downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "客户当前评级结果风险信息";
/*     */       else
/* 359 */         downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "客户历史评级结果风险信息";
/* 360 */       request.setAttribute("downloadname", downloadname);
/*     */     } catch (Exception e) {
/* 362 */       e.printStackTrace();
/* 363 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 364 */         "error.common", e.getMessage()));
/* 365 */       saveMessages(request, errors);
/* 366 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 369 */     request.setAttribute("tempList", tempList);
/* 370 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_party_result_notransList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 388 */     ActionMessages errors = new ActionMessages();
/* 389 */     HttpSession session = request.getSession();
/* 390 */     ArrayList tempList = new ArrayList();
/*     */ 
/* 392 */     T37_party_result_uhDAO t37_party_result_uhDAO = (T37_party_result_uhDAO)this.context.getBean("t37_party_result_uhDAO");
/* 393 */     T37_party_result_uh t37_party_result_uh = new T37_party_result_uh();
/*     */     try {
/* 395 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 396 */       request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
/* 397 */       LinkedHashMap resultsortMap = this.cm.getMapFromCache("risk_resultsort");
/* 398 */       request.setAttribute("resultsortMap", getOptionsListByMap(resultsortMap, null, true));
/* 399 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 400 */       request.setAttribute("riskLevelMap", getOptionsListByMap(levelMap, null, true));
/* 401 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 402 */       request.setAttribute("temp_type_map", getOptionsListByMap(temp_type_map, null, true));
/*     */ 
/* 405 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 406 */       Authorization auth = authBean.getAuthToken();
/* 407 */       String organStr = auth.getOrganstr();
/*     */ 
/* 411 */       T37_party_result_uhActionForm form = (T37_party_result_uhActionForm)actionForm;
/* 412 */       form.setOrganStr(organStr);
/*     */ 
/* 414 */       String statistic_dt_disp = form.getStatistic_dt_disp();
/* 415 */       String statistic_dt_disp_end = form.getStatistic_dt_disp_end();
/* 416 */       String create_dt_disp = form.getCreate_dt_disp();
/* 417 */       String create_dt_disp_end = form.getCreate_dt_disp_end();
/* 418 */       if ((statistic_dt_disp != null) && (!"".equals(statistic_dt_disp))) {
/* 419 */         form.setStatistic_dt(DateUtils.stringToDateShort(statistic_dt_disp));
/*     */       }
/* 421 */       if ((statistic_dt_disp_end != null) && 
/* 422 */         (!"".equals(statistic_dt_disp_end))) {
/* 423 */         form.setStatistic_dt_end(DateUtils.stringToDateShort(statistic_dt_disp_end));
/*     */       }
/* 425 */       if ((create_dt_disp != null) && (!"".equals(create_dt_disp))) {
/* 426 */         form.setCreate_dt(DateUtils.stringToDateShort(create_dt_disp));
/*     */       }
/* 428 */       if ((create_dt_disp_end != null) && 
/* 429 */         (!"".equals(create_dt_disp_end))) {
/* 430 */         form.setCreate_dt_end(DateUtils.stringToDateShort(create_dt_disp_end));
/*     */       }
/*     */ 
/* 433 */       String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/* 434 */       t37_party_result_uh = (T37_party_result_uh)getSearchObject(t37_party_result_uh, request, form, "getT37_party_result_notransListCount", url);
/* 435 */       if (t37_party_result_uh.getNewsearchflag().equals("1"))
/*     */       {
/* 438 */         saveSearchObject(t37_party_result_uh, request);
/*     */       }
/*     */       else
/* 441 */         MyBeanUtils.copyBean2Bean(form, t37_party_result_uh);
/* 442 */       tempList = t37_party_result_uhDAO.getT37_party_result_notransList(this.sqlMap, t37_party_result_uh, getStartRec(t37_party_result_uh.getIntPage()), getIntPageSize());
/*     */     } catch (Exception e) {
/* 444 */       e.printStackTrace();
/* 445 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 446 */         "error.common", e.getMessage()));
/* 447 */       saveMessages(request, errors);
/* 448 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 451 */     request.setAttribute("tempList", tempList);
/*     */ 
/* 453 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_party_result_uhAction
 * JD-Core Version:    0.6.2
 */