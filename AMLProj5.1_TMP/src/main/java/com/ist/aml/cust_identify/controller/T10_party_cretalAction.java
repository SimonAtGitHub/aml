/*     */ package com.ist.aml.cust_identify.controller;
/*     */ 
/*     */ import com.ibatis.sqlmap.client.SqlMapClient;
/*     */ import com.ist.aml.cust_identify.dao.T10_party_cretalDAO;
/*     */ import com.ist.aml.cust_identify.dto.T10_party_cretal;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import com.ist.util.StringUtils;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
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
/*     */ public class T10_party_cretalAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  34 */     ActionForward myforward = preExecute(mapping, form, request, 
/*  35 */       response);
/*  36 */     String myaction = mapping.getParameter();
/*     */ 
/*  38 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  39 */       return myforward;
/*     */     }
/*  41 */     if ("getT10_party_cretallist".equalsIgnoreCase(myaction)) {
/*  42 */       myforward = performGetT10_party_cretallist(mapping, form, request, 
/*  43 */         response);
/*     */     }
/*  46 */     else if ("export_t10_party_cretal".equalsIgnoreCase(myaction)) {
/*  47 */       myforward = performGetT10_party_cretalexport(mapping, form, request, 
/*  48 */         response);
/*     */     }
/*  51 */     else if ("t10_party_cretal_statistics".equalsIgnoreCase(myaction)) {
/*  52 */       myforward = performT10_party_cretal_statistics(mapping, form, request, 
/*  53 */         response);
/*     */     }
/*  56 */     else if ("export_party_cretal_statistics".equalsIgnoreCase(myaction)) {
/*  57 */       myforward = performT10_party_cretal_stsExport(mapping, form, request, 
/*  58 */         response);
/*     */     }
/*  61 */     else if ("add_modifyT10_party_cretal".equalsIgnoreCase(myaction)) {
/*  62 */       myforward = performAdd_modifyT10_party_cretal(mapping, form, request, 
/*  63 */         response);
/*     */     }
/*  66 */     else if ("addT10_party_cretalDo".equalsIgnoreCase(myaction)) {
/*  67 */       myforward = performAddT10_party_cretal(mapping, form, request, 
/*  68 */         response);
/*     */     }
/*  71 */     else if ("modifyT10_party_cretalDo".equalsIgnoreCase(myaction)) {
/*  72 */       myforward = performModifyT10_party_cretal(mapping, form, request, 
/*  73 */         response);
/*     */     }
/*  76 */     else if ("deleteT10_party_cretalDo".equalsIgnoreCase(myaction)) {
/*  77 */       myforward = performDeleteT10_party_cretal(mapping, form, request, 
/*  78 */         response);
/*     */     }
/*  81 */     else if ("getT10_party_cretal_managelist".equalsIgnoreCase(myaction)) {
/*  82 */       myforward = performGetT10_party_cretal_managelist(mapping, form, request, 
/*  83 */         response);
/*     */     }
/*  86 */     else if ("sub_retT10_party_cretalDo".equalsIgnoreCase(myaction)) {
/*  87 */       myforward = performSub_retT10_party_cretal(mapping, form, request, 
/*  88 */         response);
/*     */     }
/*  90 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_party_cretallist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 103 */     ActionErrors errors = new ActionErrors();
/* 104 */     HttpSession session = request.getSession();
/* 105 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 106 */     ArrayList t10_party_cretallist = new ArrayList();
/* 107 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/* 108 */     String pageInfo = "";
/*     */     try {
/* 110 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 111 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 112 */       int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
/*     */ 
/* 114 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 115 */       Authorization auth = authBean.getAuthToken();
/* 116 */       String organStr = auth.getOrganstr();
/* 117 */       t10_party_cretal.setOrganStr(organStr);
/* 118 */       if (newsearchflag.equals("1")) {
/* 119 */         MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 120 */         t10_party_cretal.setStatus_dist("'1','3'");
/*     */ 
/* 122 */         if ((t10_party_cretal.getStatistic_dt_start_disp() != null) && (!t10_party_cretal.getStatistic_dt_start_disp().equals(""))) {
/* 123 */           t10_party_cretal.setStatistic_dt_start(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_start_disp()));
/*     */         }
/* 125 */         if ((t10_party_cretal.getStatistic_dt_end_disp() != null) && (!t10_party_cretal.getStatistic_dt_end_disp().equals(""))) {
/* 126 */           t10_party_cretal.setStatistic_dt_end(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_end_disp()));
/*     */         }
/* 128 */         session.removeAttribute("t10_party_cretalSearchObj");
/* 129 */         session.setAttribute("t10_party_cretalSearchObj", t10_party_cretal);
/*     */       } else {
/* 131 */         t10_party_cretal = (T10_party_cretal)session.getAttribute("t10_party_cretalSearchObj");
/* 132 */         MyBeanUtils.copyBean2Bean(form, t10_party_cretal);
/*     */       }
/* 134 */       t10_party_cretallist = t10_party_cretalDAO.getT10_party_cretallist(this.sqlMap, t10_party_cretal, getStartRec(intPage), getIntPageSize());
/* 135 */       int totalRow = t10_party_cretalDAO.getT10_party_cretalCount(this.sqlMap, t10_party_cretal);
/* 136 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 137 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*     */     } catch (Exception e) {
/* 139 */       e.printStackTrace();
/* 140 */       this.logger.error("异常", e);
/*     */ 
/* 142 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 143 */         "error.pagertitle.default", e.getMessage()));
/* 144 */       saveMessages(request, errors);
/* 145 */       return actionMapping.findForward("failure");
/*     */     }
/* 147 */     request.setAttribute("pageInfo", pageInfo);
/* 148 */     request.setAttribute("t10_party_cretallist", t10_party_cretallist);
/* 149 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_party_cretalexport(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 162 */     ActionErrors errors = new ActionErrors();
/* 163 */     HttpSession session = request.getSession();
/* 164 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/*     */ 
/* 166 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/*     */     try {
/* 168 */       t10_party_cretal = (T10_party_cretal)session.getAttribute("t10_party_cretalSearchObj");
/*     */       ArrayList t10_party_cretallist;
/*     */       ArrayList t10_party_cretallist;
/* 169 */       if (t10_party_cretal == null) {
/* 170 */         t10_party_cretallist = new ArrayList();
/*     */       } else {
/* 172 */         t10_party_cretallist = t10_party_cretalDAO.getT10_party_cretallist(this.sqlMap, t10_party_cretal, 0, 5000);
/* 173 */         for (int i = 0; i < t10_party_cretallist.size(); i++) {
/* 174 */           T10_party_cretal party_cretal = (T10_party_cretal)t10_party_cretallist.get(i);
/* 175 */           party_cretal.setStatus_cd("3");
/* 176 */           t10_party_cretalDAO.sub_retT10_party_cretal(this.sqlMap, party_cretal);
/*     */         }
/*     */       }
/* 179 */       t10_party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/* 180 */       request.setAttribute("t10_party_cretal", t10_party_cretal);
/* 181 */       request.setAttribute("list", t10_party_cretallist);
/*     */     } catch (Exception e) {
/* 183 */       e.printStackTrace();
/* 184 */       this.logger.error("异常", e);
/*     */ 
/* 186 */       return actionMapping.findForward("failure");
/*     */     }
/*     */     ArrayList t10_party_cretallist;
/* 188 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAdd_modifyT10_party_cretal(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 193 */     ActionErrors errors = new ActionErrors();
/* 194 */     HttpSession session = request.getSession();
/* 195 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 196 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/* 197 */     String disType = request.getParameter("disType");
/* 198 */     String urlKey = "";
/* 199 */     if (disType.equals("add")) {
/* 200 */       urlKey = "successA";
/*     */     }
/* 202 */     if (disType.equals("mod")) {
/*     */       try {
/* 204 */         T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 205 */         String[] checkboxKeys = form.getCheckboxKeys()[0].split(",");
/* 206 */         t10_party_cretal.setOrgankey(checkboxKeys[0]);
/* 207 */         t10_party_cretal.setStatistic_dt(DateUtils.stringToDateShort(checkboxKeys[1]));
/* 208 */         t10_party_cretal = t10_party_cretalDAO.getT10_party_cretal_disp(this.sqlMap, t10_party_cretal);
/*     */       }
/*     */       catch (Exception e) {
/* 211 */         e.printStackTrace();
/* 212 */         this.logger.error("异常", e);
/*     */ 
/* 214 */         return actionMapping.findForward("failure");
/*     */       }
/* 216 */       urlKey = "successM";
/*     */     }
/* 218 */     request.setAttribute("t10_party_cretal", t10_party_cretal);
/* 219 */     return actionMapping.findForward(urlKey);
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT10_party_cretal(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 224 */     ActionErrors errors = new ActionErrors();
/* 225 */     HttpSession session = request.getSession();
/* 226 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 227 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/*     */     try
/*     */     {
/* 230 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 231 */       MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 232 */       Authorization auth = getAuthorization(request);
/* 233 */       String year = t10_party_cretal.getStatistic_dt_disp().substring(0, 4);
/* 234 */       String month = t10_party_cretal.getStatistic_dt_disp().substring(5, 7);
/* 235 */       t10_party_cretal.setStatistic_dt(DateUtils.stringToDateShort(DateUtils.getTime(year, month)));
/* 236 */       t10_party_cretal.setCreate_user(auth.getT00_user().getUsername());
/* 237 */       t10_party_cretal.setOrgankey(auth.getT00_user().getOrgankey());
/* 238 */       t10_party_cretal.setCreate_org(auth.getT00_user().getOrgankey());
/* 239 */       t10_party_cretal.setCreate_dt(DateUtils.getCurrDateTime());
/* 240 */       T10_party_cretal party_cretal = t10_party_cretalDAO.getT10_party_cretal_disp(this.sqlMap, t10_party_cretal);
/* 241 */       if ((party_cretal != null) && (party_cretal.getStatistic_dt().equals(t10_party_cretal.getStatistic_dt()))) {
/* 242 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", "该机构下，该月的机构信用代码已建立！"));
/* 243 */         saveErrors(request, errors);
/* 244 */         return actionMapping.findForward("failure");
/*     */       }
/* 246 */       t10_party_cretalDAO.addT10_party_cretal(this.sqlMap, t10_party_cretal);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 252 */       e.printStackTrace();
/* 253 */       this.logger.error("异常", e);
/*     */ 
/* 255 */       return actionMapping.findForward("failure");
/*     */     }
/* 257 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT10_party_cretal(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 262 */     ActionErrors errors = new ActionErrors();
/* 263 */     HttpSession session = request.getSession();
/* 264 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 265 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/*     */     try {
/* 267 */       this.sqlMap.endTransaction();
/* 268 */       this.sqlMap.startTransaction();
/* 269 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 270 */       MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 271 */       if ((t10_party_cretal.getStatistic_dt_disp() != null) && (!t10_party_cretal.getStatistic_dt_disp().equals(""))) {
/* 272 */         t10_party_cretal.setStatistic_dt(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_disp()));
/*     */       }
/* 274 */       t10_party_cretal.setStatus_cd("0");
/* 275 */       t10_party_cretalDAO.modifyT10_party_cretal(this.sqlMap, t10_party_cretal);
/* 276 */       this.sqlMap.commitTransaction();
/*     */     }
/*     */     catch (Exception e) {
/* 279 */       e.printStackTrace();
/* 280 */       this.logger.error("异常", e);
/*     */ 
/* 282 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     } finally {
/*     */       try {
/* 285 */         this.sqlMap.endTransaction();
/*     */       } catch (Exception e) {
/* 287 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 290 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT10_party_cretal(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 295 */     ActionErrors errors = new ActionErrors();
/* 296 */     HttpSession session = request.getSession();
/* 297 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 298 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/*     */     try {
/* 300 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 301 */       String[] checkboxKeys = form.getCheckboxKeys();
/* 302 */       for (int i = 0; i < checkboxKeys.length; i++) {
/* 303 */         String[] checkboxKey = checkboxKeys[i].split(",");
/* 304 */         t10_party_cretal.setOrgankey(checkboxKey[0]);
/* 305 */         t10_party_cretal.setStatistic_dt(DateUtils.stringToDateShort(checkboxKey[1]));
/* 306 */         t10_party_cretalDAO.deleteT10_party_cretal(this.sqlMap, t10_party_cretal);
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 310 */       e.printStackTrace();
/* 311 */       this.logger.error("异常", e);
/*     */ 
/* 313 */       return actionMapping.findForward("failure");
/*     */     }
/* 315 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performSub_retT10_party_cretal(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 321 */     ActionErrors errors = new ActionErrors();
/* 322 */     HttpSession session = request.getSession();
/* 323 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 324 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/*     */     try {
/* 326 */       this.sqlMap.endTransaction();
/* 327 */       this.sqlMap.startTransaction();
/* 328 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 329 */       String[] checkboxKeys = form.getCheckboxKeys();
/* 330 */       for (int i = 0; i < checkboxKeys.length; i++) {
/* 331 */         String[] checkboxKey = checkboxKeys[i].split(",");
/* 332 */         t10_party_cretal.setOrgankey(checkboxKey[0]);
/* 333 */         t10_party_cretal.setStatistic_dt(DateUtils.stringToDateShort(checkboxKey[1]));
/* 334 */         t10_party_cretal.setStatus_cd(form.getStatus_cd());
/*     */ 
/* 336 */         t10_party_cretalDAO.sub_retT10_party_cretal(this.sqlMap, t10_party_cretal);
/*     */       }
/*     */ 
/* 339 */       this.sqlMap.commitTransaction();
/*     */     }
/*     */     catch (Exception e) {
/* 342 */       e.printStackTrace();
/* 343 */       this.logger.error("异常", e);
/*     */ 
/* 345 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*     */     } finally {
/*     */       try {
/* 348 */         this.sqlMap.endTransaction();
/*     */       } catch (Exception e) {
/* 350 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 353 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performT10_party_cretal_statistics(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 358 */     ActionErrors errors = new ActionErrors();
/* 359 */     HttpSession session = request.getSession();
/* 360 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 361 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/* 362 */     T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/*     */     try {
/* 364 */       MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 365 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 366 */       Authorization auth = authBean.getAuthToken();
/* 367 */       String organStr = auth.getOrganstr();
/* 368 */       t10_party_cretal.setOrganStr(organStr);
/* 369 */       t10_party_cretal.setStatus_dist("'1','3'");
/*     */ 
/* 371 */       if ((t10_party_cretal.getStatistic_dt_start_disp() != null) && (!t10_party_cretal.getStatistic_dt_start_disp().equals(""))) {
/* 372 */         t10_party_cretal.setStatistic_dt_start(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_start_disp()));
/*     */       }
/* 374 */       if ((t10_party_cretal.getStatistic_dt_end_disp() != null) && (!t10_party_cretal.getStatistic_dt_end_disp().equals(""))) {
/* 375 */         t10_party_cretal.setStatistic_dt_end(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_end_disp()));
/*     */       }
/* 377 */       t10_party_cretal = t10_party_cretalDAO.getT10_party_cretal_statistics(this.sqlMap, t10_party_cretal);
/*     */     }
/*     */     catch (Exception e) {
/* 380 */       e.printStackTrace();
/* 381 */       this.logger.error("异常", e);
/*     */ 
/* 383 */       return actionMapping.findForward("failure");
/*     */     }
/* 385 */     request.setAttribute("organkey", form.getOrgankey());
/* 386 */     request.setAttribute("t10_party_cretal", t10_party_cretal);
/* 387 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performT10_party_cretal_stsExport(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 392 */     ActionErrors errors = new ActionErrors();
/* 393 */     ArrayList t10_party_cretallist = new ArrayList();
/* 394 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 395 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/* 396 */     LinkedHashMap organMap = this.cm.getMapFromCache("organ");
/*     */     try {
/* 398 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 399 */       MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 400 */       t10_party_cretal.setQuerycount_s(Long.valueOf(t10_party_cretal.getQuerycount_n().longValue() + t10_party_cretal.getQuerycount_r().longValue()));
/* 401 */       t10_party_cretal.setOrganname((String)organMap.get(t10_party_cretal.getOrgankey()));
/* 402 */       t10_party_cretal.setStatistic_dt_disp(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/* 403 */       t10_party_cretal.setStatus_dist("'1','3'");
/* 404 */       t10_party_cretallist = t10_party_cretalDAO.getT10_party_cretal_statisticslist(this.sqlMap, t10_party_cretal);
/* 405 */       for (int i = 0; i < t10_party_cretallist.size(); i++) {
/* 406 */         T10_party_cretal party_cretal = (T10_party_cretal)t10_party_cretallist.get(i);
/* 407 */         party_cretal.setStatus_cd("3");
/* 408 */         t10_party_cretalDAO.sub_retT10_party_cretal(this.sqlMap, party_cretal);
/*     */       }
/*     */     } catch (Exception e) {
/* 411 */       e.printStackTrace();
/* 412 */       this.logger.error("异常", e);
/*     */ 
/* 414 */       return actionMapping.findForward("failure");
/*     */     }
/* 416 */     request.setAttribute("party_cretal", t10_party_cretal);
/* 417 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT10_party_cretal_managelist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 422 */     ActionErrors errors = new ActionErrors();
/* 423 */     HttpSession session = request.getSession();
/* 424 */     T10_party_cretal t10_party_cretal = new T10_party_cretal();
/* 425 */     ArrayList t10_party_cretallist = new ArrayList();
/* 426 */     T10_party_cretalDAO t10_party_cretalDAO = (T10_party_cretalDAO)this.context.getBean("t10_party_cretalDAO");
/* 427 */     String pageInfo = "";
/*     */     try {
/* 429 */       T10_party_cretalActionForm form = (T10_party_cretalActionForm)actionForm;
/* 430 */       LinkedHashMap cretal_status_cdMap = this.cm.getMapFromCache("cretal_status_cd");
/* 431 */       request.setAttribute("cretal_status_cdMap", getOptionsListByMap(cretal_status_cdMap, null, true));
/* 432 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 433 */       int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
/*     */ 
/* 435 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 436 */       Authorization auth = authBean.getAuthToken();
/* 437 */       String organStr = auth.getOrganstr();
/* 438 */       t10_party_cretal.setOrganStr(organStr);
/* 439 */       if (newsearchflag.equals("1")) {
/* 440 */         MyBeanUtils.copyBean2Bean(t10_party_cretal, form);
/* 441 */         t10_party_cretal.setStatus_dist("'0','1','2','3'");
/*     */ 
/* 443 */         if ((t10_party_cretal.getStatistic_dt_start_disp() != null) && (!t10_party_cretal.getStatistic_dt_start_disp().equals(""))) {
/* 444 */           t10_party_cretal.setStatistic_dt_start(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_start_disp()));
/*     */         }
/* 446 */         if ((t10_party_cretal.getStatistic_dt_end_disp() != null) && (!t10_party_cretal.getStatistic_dt_end_disp().equals(""))) {
/* 447 */           t10_party_cretal.setStatistic_dt_end(DateUtils.stringToDateShort(t10_party_cretal.getStatistic_dt_end_disp()));
/*     */         }
/* 449 */         session.removeAttribute("t10_party_cretalSearchObj");
/* 450 */         session.setAttribute("t10_party_cretalSearchObj", t10_party_cretal);
/*     */       } else {
/* 452 */         t10_party_cretal = (T10_party_cretal)session.getAttribute("t10_party_cretalSearchObj");
/* 453 */         MyBeanUtils.copyBean2Bean(form, t10_party_cretal);
/*     */       }
/* 455 */       t10_party_cretallist = t10_party_cretalDAO.getT10_party_cretallist(this.sqlMap, t10_party_cretal, getStartRec(intPage), getIntPageSize());
/* 456 */       int totalRow = t10_party_cretalDAO.getT10_party_cretalCount(this.sqlMap, t10_party_cretal);
/* 457 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/* 458 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*     */     } catch (Exception e) {
/* 460 */       e.printStackTrace();
/* 461 */       this.logger.error("异常", e);
/*     */ 
/* 463 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 464 */         "error.pagertitle.default", e.getMessage()));
/* 465 */       saveMessages(request, errors);
/* 466 */       return actionMapping.findForward("failure");
/*     */     }
/* 468 */     request.setAttribute("pageInfo", pageInfo);
/* 469 */     request.setAttribute("t10_party_cretallist", t10_party_cretallist);
/* 470 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_party_cretalAction
 * JD-Core Version:    0.6.2
 */