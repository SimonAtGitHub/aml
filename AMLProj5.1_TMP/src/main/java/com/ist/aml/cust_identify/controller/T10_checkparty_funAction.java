/*      */ package com.ist.aml.cust_identify.controller;
/*      */ 
/*      */ import com.ibatis.sqlmap.client.SqlMapClient;
/*      */ import com.ist.aml.cust_identify.dao.T10_checkpartyDAO;
/*      */ import com.ist.aml.cust_identify.dao.T10_checkparty_funDAO;
/*      */ import com.ist.aml.cust_identify.dto.T10_checkparty;
/*      */ import com.ist.aml.cust_identify.dto.T10_checkparty_fun;
/*      */ import com.ist.aml.newrisk.dao.T37_party_resultDAO;
/*      */ import com.ist.aml.newrisk.dto.T37_party_result;
/*      */ import com.ist.aml.report.dao.T07_BlacklistDAO;
/*      */ import com.ist.aml.report.dao.T07_OBJ_RULEDAO;
/*      */ import com.ist.aml.report.dao.T07_pbcruleDAO;
/*      */ import com.ist.aml.report.dao.T47_partyDAO;
/*      */ import com.ist.aml.report.dto.T07_Blacklist;
/*      */ import com.ist.aml.report.dto.T07_OBJ_RULE;
/*      */ import com.ist.aml.report.dto.T07_pbcrule;
/*      */ import com.ist.aml.report.dto.T47_party;
/*      */ import com.ist.common.AuthBean;
/*      */ import com.ist.common.Authorization;
/*      */ import com.ist.common.MyBeanUtils;
/*      */ import com.ist.common.PageUtils;
/*      */ import com.ist.common.base.BaseAction;
/*      */ import com.ist.common.jcs.CatchManager;
/*      */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*      */ import com.ist.util.DateUtils;
/*      */ import com.ist.util.StringUtils;
/*      */ import java.io.PrintWriter;
/*      */ import java.sql.SQLException;
/*      */ import java.util.ArrayList;
/*      */ import java.util.Date;
/*      */ import java.util.LinkedHashMap;
/*      */ import javax.servlet.http.HttpServletRequest;
/*      */ import javax.servlet.http.HttpServletResponse;
/*      */ import javax.servlet.http.HttpSession;
/*      */ import org.apache.log4j.Logger;
/*      */ import org.apache.struts.action.ActionError;
/*      */ import org.apache.struts.action.ActionErrors;
/*      */ import org.apache.struts.action.ActionForm;
/*      */ import org.apache.struts.action.ActionForward;
/*      */ import org.apache.struts.action.ActionMapping;
/*      */ import org.springframework.context.ApplicationContext;
/*      */ 
/*      */ public class T10_checkparty_funAction extends BaseAction
/*      */ {
/*      */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  102 */     ActionForward myforward = null;
/*  103 */     String myaction = mapping.getParameter();
/*      */ 
/*  105 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  106 */       return myforward;
/*      */     }
/*  108 */     if ("getT10_party_risklist".equalsIgnoreCase(myaction)) {
/*  109 */       myforward = performGetT10_party_risklist(mapping, form, request, 
/*  110 */         response);
/*      */     }
/*  113 */     else if ("getT10_party_riskdisp".equalsIgnoreCase(myaction)) {
/*  114 */       myforward = performGetT10_party_riskdisp(mapping, form, request, 
/*  115 */         response);
/*      */     }
/*  118 */     else if ("addT10_party_risk".equalsIgnoreCase(myaction)) {
/*  119 */       myforward = performAddT10_party_risk(mapping, form, request, 
/*  120 */         response);
/*      */     }
/*  123 */     else if ("addT10_party_risk_do".equalsIgnoreCase(myaction)) {
/*  124 */       myforward = performAddT10_party_riskDo(mapping, form, request, 
/*  125 */         response);
/*      */     }
/*  128 */     else if ("modifyT10_party_risk".equalsIgnoreCase(myaction)) {
/*  129 */       myforward = performModifyT10_party_risk(mapping, form, request, 
/*  130 */         response);
/*      */     }
/*  133 */     else if ("modifyT10_party_risk_do".equalsIgnoreCase(myaction)) {
/*  134 */       myforward = performModifyT10_party_riskDo(mapping, form, request, 
/*  135 */         response);
/*      */     }
/*  138 */     else if ("delT10_party_risk".equalsIgnoreCase(myaction)) {
/*  139 */       myforward = performDelT10_party_risk(mapping, form, request, 
/*  140 */         response);
/*      */     }
/*  143 */     else if ("getT10_checkparty_resultlist".equalsIgnoreCase(myaction)) {
/*  144 */       myforward = performGetT10_checkparty_reltlist(mapping, form, request, 
/*  145 */         response);
/*      */     }
/*  148 */     else if ("getT10_checkparty_result_viewlist".equalsIgnoreCase(myaction)) {
/*  149 */       myforward = performGetT10_checkparty_relt_viewlist(mapping, form, request, 
/*  150 */         response);
/*      */     }
/*  153 */     else if ("getT10_checkparty_reltdisp".equalsIgnoreCase(myaction)) {
/*  154 */       myforward = performGetT10_checkparty_reltdisp(mapping, form, request, 
/*  155 */         response);
/*      */     }
/*  158 */     else if ("modT10_checkparty_reltdisp".equalsIgnoreCase(myaction)) {
/*  159 */       myforward = performModT10_checkparty_reltdisp(mapping, form, request, 
/*  160 */         response);
/*      */     }
/*  162 */     else if ("modT10_checkparty_reltdisp_do".equalsIgnoreCase(myaction)) {
/*  163 */       myforward = performModT10_checkparty_reltdispDo(mapping, form, request, 
/*  164 */         response);
/*      */     }
/*  167 */     else if ("getT10_checkparty_main".equalsIgnoreCase(myaction)) {
/*  168 */       myforward = performGetT10_checkparty_main(mapping, form, request, 
/*  169 */         response);
/*      */     }
/*  172 */     else if ("getT10_checkparty_uh_main".equalsIgnoreCase(myaction)) {
/*  173 */       myforward = performGetT10_checkparty_uh_main(mapping, form, request, 
/*  174 */         response);
/*      */     }
/*  177 */     else if ("getcheck_reasonList".equalsIgnoreCase(myaction)) {
/*  178 */       myforward = performGetcheck_reasonList(mapping, form, request, 
/*  179 */         response);
/*      */     }
/*  182 */     else if ("Deter_w_bList".equalsIgnoreCase(myaction)) {
/*  183 */       myforward = performDeter_w_bList(mapping, form, request, 
/*  184 */         response);
/*      */     }
/*      */ 
/*  188 */     return myforward;
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_party_risklist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  207 */     ActionErrors errors = new ActionErrors();
/*  208 */     HttpSession session = request.getSession();
/*  209 */     ArrayList t10_party_riskList = new ArrayList();
/*  210 */     String pageInfo = "";
/*  211 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  212 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */     try {
/*  214 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  215 */       String newsearchflag = StringUtils.nullObject2String(request
/*  216 */         .getParameter("newsearchflag"));
/*  217 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*      */ 
/*  219 */       request.getSession().setAttribute("intPage", intPage);
/*      */ 
/*  221 */       request.setAttribute("party_id", form.getParty_id());
/*      */ 
/*  225 */       LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*  226 */       request.setAttribute("risk_typeMap", getOptionsListByMap(
/*  227 */         risk_typeMap, null, true));
/*      */ 
/*  232 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  233 */       Authorization auth = authBean.getAuthToken();
/*      */ 
/*  236 */       if (newsearchflag.equals("1")) {
/*  237 */         MyBeanUtils.copyBean2Bean(t10_party_risk, form);
/*      */ 
/*  241 */         if ((t10_party_risk.getRisk_create_dt_start_disp() != null) && (!"".equals(t10_party_risk.getRisk_create_dt_start_disp()))) {
/*  242 */           t10_party_risk.setRisk_create_dt_start(DateUtils.stringToDateShort(form
/*  243 */             .getRisk_create_dt_start_disp()));
/*      */         }
/*  245 */         if ((t10_party_risk.getRisk_create_dt_end_disp() != null) && (!"".equals(t10_party_risk.getRisk_create_dt_end_disp()))) {
/*  246 */           t10_party_risk.setRisk_create_dt_end(DateUtils.stringToDateShort(form
/*  247 */             .getRisk_create_dt_end_disp()));
/*      */         }
/*      */ 
/*  250 */         if ((t10_party_risk.getRisk_validite_dt_start_disp() != null) && (!"".equals(t10_party_risk.getRisk_validite_dt_start_disp()))) {
/*  251 */           t10_party_risk.setRisk_validite_dt_start(DateUtils.stringToDateShort(form
/*  252 */             .getRisk_validite_dt_start_disp()));
/*      */         }
/*  254 */         if ((t10_party_risk.getRisk_validite_dt_end_disp() != null) && (!"".equals(form.getRisk_validite_dt_end_disp()))) {
/*  255 */           t10_party_risk.setRisk_validite_dt_end(DateUtils.stringToDateShort(form
/*  256 */             .getRisk_validite_dt_end_disp()));
/*      */         }
/*  258 */         t10_party_risk.setRisk_create_org(auth.getOrganstr());
/*  259 */         session.setAttribute("t10_party_riskSearchObj", t10_party_risk);
/*      */       } else {
/*  261 */         t10_party_risk = (T10_checkparty_fun)session
/*  262 */           .getAttribute("t10_party_riskSearchObj");
/*  263 */         MyBeanUtils.copyBean2Bean(form, t10_party_risk);
/*      */       }
/*  265 */       if (!newsearchflag.equals("2")) {
/*  266 */         if (t10_party_risk == null) {
/*  267 */           t10_party_risk = new T10_checkparty_fun();
/*      */         }
/*      */ 
/*  270 */         t10_party_riskList = t10_checkparty_funDAO.getT10_party_riskList(
/*  271 */           this.sqlMap, t10_party_risk, getStartRec(intPage), 
/*  272 */           getIntPageSize());
/*  273 */         int totalRow = t10_checkparty_funDAO.getT10_party_riskListCount(
/*  274 */           this.sqlMap, t10_party_risk);
/*  275 */         String url = request.getContextPath() + "/report" + 
/*  276 */           actionMapping.getPath() + ".do";
/*  277 */         pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*      */       }
/*      */     } catch (Exception e) {
/*  280 */       e.printStackTrace();
/*  281 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  282 */         "error.pagertitle.default"));
/*  283 */       saveErrors(request, errors);
/*  284 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  287 */     request.setAttribute("pageInfo", pageInfo);
/*  288 */     request.setAttribute("t10_party_risk", t10_party_risk);
/*  289 */     request.setAttribute("t10_party_riskList", t10_party_riskList);
/*  290 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_party_riskdisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  309 */     ActionErrors errors = new ActionErrors();
/*  310 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  311 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */ 
/*  313 */     LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*  314 */     request.setAttribute("risk_typeMap", getOptionsListByMap(
/*  315 */       risk_typeMap, null, true));
/*      */     try {
/*  317 */       String partyrisk_no = request.getParameter("partyrisk_no");
/*  318 */       request.setAttribute("partyrisk_no", partyrisk_no);
/*      */ 
/*  320 */       t10_party_risk = t10_checkparty_funDAO.getT10_party_riskDisp(this.sqlMap, partyrisk_no);
/*  321 */       LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/*  322 */       String isnewrisk = "0";
/*  323 */       if ("1".equals(t87_sysparaMap.get("701"))) {
/*  324 */         isnewrisk = "1";
/*      */       }
/*  326 */       request.setAttribute("isnewrisk", isnewrisk);
/*      */     } catch (Exception e) {
/*  328 */       e.printStackTrace();
/*  329 */       this.logger.error(e);
/*  330 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  331 */         "error.pagertitle.default"));
/*  332 */       saveErrors(request, errors);
/*  333 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  336 */     request.setAttribute("t10_party_risk", t10_party_risk);
/*  337 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT10_party_risk(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  359 */     String party_id = request.getParameter("party_id");
/*  360 */     request.setAttribute("party_id", party_id);
/*  361 */     T47_partyDAO t47_partyDAO = (T47_partyDAO)this.context.getBean("t47_partyDAO");
/*      */     try {
/*  363 */       T47_party t47_party = t47_partyDAO.getT47_partyDisp(this.sqlMap, party_id);
/*  364 */       request.setAttribute("party_chn_name", t47_party.getParty_chn_name());
/*      */     }
/*      */     catch (SQLException e) {
/*  367 */       e.printStackTrace();
/*      */     }
/*      */ 
/*  371 */     LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*  372 */     request.setAttribute("risk_typeMap", getOptionsListByMap(
/*  373 */       risk_typeMap, null, true));
/*  374 */     LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/*  375 */     String isnewrisk = "0";
/*  376 */     if ("1".equals(t87_sysparaMap.get("701"))) {
/*  377 */       isnewrisk = "1";
/*      */     }
/*  379 */     request.setAttribute("isnewrisk", isnewrisk);
/*  380 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT10_party_risk(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  386 */     ActionErrors errors = new ActionErrors();
/*      */ 
/*  388 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  389 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */     try {
/*  391 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  392 */       String[] partyrisk_keys = form.getSelectedPartyrisk_No();
/*  393 */       t10_party_risk = t10_checkparty_funDAO.getT10_party_riskDisp(this.sqlMap, partyrisk_keys[0]);
/*  394 */       MyBeanUtils.copyBean2Bean(form, t10_party_risk);
/*  395 */       LinkedHashMap risk_typeMap = this.cm.getMapFromCache("risk_type");
/*  396 */       LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/*  397 */       request.setAttribute("risk_typeMap", getOptionsListByMap(
/*  398 */         risk_typeMap, null, true));
/*  399 */       String isnewrisk = "0";
/*  400 */       if ("1".equals(t87_sysparaMap.get("701"))) {
/*  401 */         isnewrisk = "1";
/*      */       }
/*  403 */       request.setAttribute("isnewrisk", isnewrisk);
/*      */     } catch (Exception e) {
/*  405 */       e.printStackTrace();
/*  406 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  407 */         "error.pagertitle.default"));
/*  408 */       saveErrors(request, errors);
/*  409 */       return actionMapping.findForward("failure");
/*      */     }
/*  411 */     request.setAttribute("t10_party_risk", t10_party_risk);
/*  412 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT10_party_riskDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  417 */     ActionErrors errors = new ActionErrors();
/*      */ 
/*  419 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  420 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */     try {
/*  422 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  423 */       MyBeanUtils.copyBean2Bean(t10_party_risk, form);
/*  424 */       if (!"".equals(t10_party_risk.getElement_score()))
/*      */       {
/*  426 */         t10_party_risk.setElement_score_d(Double.valueOf(Double.parseDouble(t10_party_risk.getElement_score())));
/*      */       }
/*  428 */       t10_party_risk.setRisk_validite_dt(DateUtils.stringToDateShort(t10_party_risk.getRisk_validite_dt_disp()));
/*  429 */       t10_checkparty_funDAO.modifyT10_party_risk(this.sqlMap, t10_party_risk);
/*      */     } catch (Exception e) {
/*  431 */       e.printStackTrace();
/*  432 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  433 */         "error.pagertitle.default"));
/*  434 */       saveErrors(request, errors);
/*  435 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  438 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT10_party_riskDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  443 */     ActionErrors errors = new ActionErrors();
/*  444 */     HttpSession session = request.getSession();
/*  445 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  446 */     Authorization auth = authBean.getAuthToken();
/*      */ 
/*  448 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  449 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */     try
/*      */     {
/*  452 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  453 */       MyBeanUtils.copyBean2Bean(t10_party_risk, form);
/*      */ 
/*  455 */       t10_party_risk.setRisk_create_user(auth.getT00_user().getUsername());
/*  456 */       t10_party_risk.setRisk_create_org(auth.getT00_user().getOrgankey());
/*  457 */       t10_party_risk.setRisk_create_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
/*  458 */       if (!"".equals(t10_party_risk.getElement_score()))
/*      */       {
/*  460 */         t10_party_risk.setElement_score_d(Double.valueOf(Double.parseDouble(t10_party_risk.getElement_score())));
/*      */       }
/*      */ 
/*  463 */       t10_party_risk.setRisk_validite_dt(DateUtils.stringToDateShort(t10_party_risk.getRisk_validite_dt_disp()));
/*  464 */       String partyrisk_no = getSequenceNextVal("SEQ_T10_PARTY_RISK");
/*  465 */       t10_party_risk.setPartyrisk_no(partyrisk_no);
/*      */ 
/*  467 */       row = t10_checkparty_funDAO.insertT10_party_risk(this.sqlMap, t10_party_risk);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*      */       int row;
/*  470 */       e.printStackTrace();
/*  471 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  472 */         "error.pagertitle.default"));
/*  473 */       saveErrors(request, errors);
/*  474 */       return actionMapping.findForward("failure");
/*      */     }
/*  476 */     request.setAttribute("party_id", t10_party_risk.getParty_id());
/*  477 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performDelT10_party_risk(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  496 */     ActionErrors errors = new ActionErrors();
/*  497 */     HttpSession session = request.getSession();
/*      */ 
/*  499 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  500 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*  501 */     int row = 0;
/*      */     try {
/*  503 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*      */ 
/*  505 */       String party_id = request.getParameter("party_id");
/*  506 */       request.setAttribute("party_id", party_id);
/*      */ 
/*  508 */       String[] partyrisk_keys = form.getSelectedPartyrisk_No();
/*  509 */       for (int i = 0; i < partyrisk_keys.length; i++) {
/*  510 */         String partyrisk_key = partyrisk_keys[i];
/*  511 */         row = t10_checkparty_funDAO.deleteT10_party_risk(this.sqlMap, partyrisk_key);
/*      */       }
/*      */ 
/*  516 */       if (row < 0) {
/*  517 */         throw new Exception("删除失败");
/*      */       }
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  522 */       e.printStackTrace();
/*  523 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  524 */         "error.pagertitle.default"));
/*  525 */       saveErrors(request, errors);
/*  526 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  529 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_reltlist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  547 */     ActionErrors errors = new ActionErrors();
/*  548 */     HttpSession session = request.getSession();
/*  549 */     ArrayList t10_party_reltlist = new ArrayList();
/*  550 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  551 */     T10_checkparty_fun t10_party_relt = new T10_checkparty_fun();
/*  552 */     String pageInfo = "";
/*      */     try
/*      */     {
/*  555 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  556 */       String newsearchflag = StringUtils.nullObject2String(request
/*  557 */         .getParameter("newsearchflag"));
/*  558 */       int intPage = StringUtils.nullObject2int(request
/*  559 */         .getParameter("intPage"), 0);
/*      */ 
/*  561 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  562 */       Authorization auth = authBean.getAuthToken();
/*  563 */       String organStr = auth.getOrganstr();
/*  564 */       t10_party_relt.setOrganStr(organStr);
/*  565 */       if (newsearchflag.equals("1")) {
/*  566 */         MyBeanUtils.copyBean2Bean(t10_party_relt, form);
/*      */ 
/*  568 */         session.setAttribute("t10_party_reltSearchObj", t10_party_relt);
/*      */       } else {
/*  570 */         t10_party_relt = (T10_checkparty_fun)session.getAttribute("t10_party_reltSearchObj");
/*      */       }
/*  572 */       t10_party_reltlist = t10_checkparty_funDAO.getT10_party_reltList(this.sqlMap, t10_party_relt, getStartRec(intPage), getIntPageSize());
/*  573 */       int totalRow = t10_checkparty_funDAO.getT10_party_reltCount(this.sqlMap, t10_party_relt);
/*  574 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/*  575 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*      */     }
/*      */     catch (Exception e) {
/*  578 */       e.printStackTrace();
/*      */     }
/*  580 */     request.setAttribute("pageInfo", pageInfo);
/*  581 */     request.setAttribute("t10_party_reltlist", t10_party_reltlist);
/*  582 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_relt_viewlist(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  595 */     ActionErrors errors = new ActionErrors();
/*  596 */     HttpSession session = request.getSession();
/*  597 */     ArrayList t10_party_reltlist = new ArrayList();
/*  598 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  599 */     T10_checkparty_fun t10_party_relt = new T10_checkparty_fun();
/*  600 */     String pageInfo = "";
/*      */     try
/*      */     {
/*  603 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  604 */       String newsearchflag = StringUtils.nullObject2String(request
/*  605 */         .getParameter("newsearchflag"));
/*  606 */       int intPage = StringUtils.nullObject2int(request
/*  607 */         .getParameter("intPage"), 0);
/*      */ 
/*  609 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  610 */       Authorization auth = authBean.getAuthToken();
/*  611 */       String organStr = auth.getOrganstr();
/*  612 */       t10_party_relt.setOrganStr(organStr);
/*  613 */       if (newsearchflag.equals("1")) {
/*  614 */         MyBeanUtils.copyBean2Bean(t10_party_relt, form);
/*      */ 
/*  616 */         session.setAttribute("t10_party_reltviewSearchObj", t10_party_relt);
/*      */       } else {
/*  618 */         t10_party_relt = (T10_checkparty_fun)session.getAttribute("t10_party_reltviewSearchObj");
/*      */       }
/*  620 */       t10_party_reltlist = t10_checkparty_funDAO.getT10_party_relt_viewList(this.sqlMap, t10_party_relt, getStartRec(intPage), getIntPageSize());
/*  621 */       int totalRow = t10_checkparty_funDAO.getT10_party_relt_viewCount(this.sqlMap, t10_party_relt);
/*  622 */       String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
/*  623 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*      */     }
/*      */     catch (Exception e) {
/*  626 */       e.printStackTrace();
/*      */     }
/*  628 */     request.setAttribute("pageInfo", pageInfo);
/*  629 */     request.setAttribute("t10_party_reltlist", t10_party_reltlist);
/*  630 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModT10_checkparty_reltdisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  648 */     ActionErrors errors = new ActionErrors();
/*      */ 
/*  651 */     LinkedHashMap check_methodMap = this.cm.getMapFromCache("check_method");
/*  652 */     request.setAttribute("check_methodMap", getOptionsListByMap(
/*  653 */       check_methodMap, null, true));
/*      */ 
/*  656 */     LinkedHashMap agent_flagMap = this.cm.getMapFromCache("yesNo");
/*  657 */     request.setAttribute("agent_flagMap", getOptionsListByMap(
/*  658 */       agent_flagMap, null, true));
/*      */ 
/*  661 */     LinkedHashMap auditlevel_flagMap = this.cm.getMapFromCache("yesNo");
/*  662 */     request.setAttribute("auditlevel_flagMap", getOptionsListByMap(
/*  663 */       auditlevel_flagMap, null, true));
/*      */ 
/*  666 */     LinkedHashMap auditlevel_Map = this.cm.getMapFromCache("risk_level");
/*  667 */     request.setAttribute("auditlevel_Map", getOptionsListByMap(
/*  668 */       auditlevel_Map, null, true));
/*      */ 
/*  671 */     LinkedHashMap lian_flagMap = this.cm.getMapFromCache("yesNo");
/*  672 */     request.setAttribute("lian_flagMap", getOptionsListByMap(
/*  673 */       lian_flagMap, null, true));
/*      */ 
/*  676 */     LinkedHashMap check_resultMap = this.cm.getMapFromCache("check_result");
/*  677 */     request.setAttribute("check_resultMap", getOptionsListByMap(
/*  678 */       check_resultMap, null, true));
/*      */ 
/*  681 */     LinkedHashMap w_Map = this.cm.getMapFromCache("yesNo");
/*  682 */     request.setAttribute("w_Map", getOptionsListByMap(
/*  683 */       w_Map, null, true));
/*      */ 
/*  686 */     LinkedHashMap w_rule_typeMap = this.cm.getMapFromCache("rule_type");
/*  687 */     request.setAttribute("w_rule_typeMap", getOptionsListByMap(
/*  688 */       w_rule_typeMap, null, true));
/*      */ 
/*  691 */     LinkedHashMap b_Map = this.cm.getMapFromCache("yesNo");
/*  692 */     request.setAttribute("b_Map", getOptionsListByMap(
/*  693 */       b_Map, null, true));
/*  694 */     LinkedHashMap m_list_typeMap = this.cm.getMapFromCache("m_list_type_b");
/*  695 */     request.setAttribute("m_list_typeMap", getOptionsListByMap(
/*  696 */       m_list_typeMap, null, true));
/*      */ 
/*  699 */     LinkedHashMap credit_flag = this.cm.getMapFromCache("yesNo");
/*  700 */     request.setAttribute("credit_flag", getOptionsListByMap(
/*  701 */       credit_flag, null, true));
/*      */ 
/*  703 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModT10_checkparty_reltdispDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  722 */     ActionErrors errors = new ActionErrors();
/*  723 */     HttpSession session = request.getSession();
/*      */ 
/*  726 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  727 */     Authorization auth = authBean.getAuthToken();
/*      */ 
/*  729 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/*  730 */     T10_checkpartyDAO t10_checkpartyDAO = (T10_checkpartyDAO)this.context.getBean("t10_checkpartyDAO");
/*  731 */     T10_checkparty_fun t10_party_relt = new T10_checkparty_fun();
/*      */ 
/*  733 */     T47_partyDAO t47_partyDAO = (T47_partyDAO)this.context.getBean("t47_partyDAO");
/*  734 */     T47_party t47_party = new T47_party();
/*      */     try {
/*  736 */       T10_checkparty_funActionForm form = (T10_checkparty_funActionForm)actionForm;
/*  737 */       MyBeanUtils.copyBean2Bean(t10_party_relt, form);
/*  738 */       t10_party_relt.setChecker(auth.getT00_user().getUsername());
/*  739 */       t10_party_relt.setChecker_org(auth.getT00_user().getOrgankey());
/*  740 */       t10_party_relt.setValid_dt(DateUtils.stringToDateShort(form.getValid_dt_disp()));
/*  741 */       t10_party_relt.setCheck_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
/*      */ 
/*  744 */       if (t10_party_relt.getLeader_num().intValue() == 0) {
/*  745 */         t10_party_relt.setLeader_num(Integer.valueOf(Integer.valueOf("0").intValue()));
/*      */       }
/*  747 */       int i = 0;
/*  748 */       int row1 = 0;
/*  749 */       int row2 = 0;
/*  750 */       String check_type = t10_party_relt.getCheck_type();
/*      */ 
/*  752 */       String list_type = t10_party_relt.getList_type();
/*      */ 
/*  754 */       String W_flag = t10_party_relt.getAddw_flag();
/*      */ 
/*  756 */       String B_flag = t10_party_relt.getAddb_flag();
/*      */ 
/*  758 */       String level_flag = t10_party_relt.getAuditlevel_flag();
/*      */ 
/*  760 */       String changeflag = StringUtils.nullObject2String(request.getParameter("changeflag"));
/*      */ 
/*  762 */       String party_id = t10_party_relt.getParty_id();
/*  763 */       if ((party_id == null) || ("".equals(party_id)))
/*      */       {
/*  765 */         party_id = "A" + getSequenceNextVal("SEQ_T10_CHECK_ARTI_id");
/*  766 */         t10_party_relt.setParty_id(party_id);
/*      */       }
/*  768 */       this.sqlMap.endTransaction();
/*  769 */       this.sqlMap.startTransaction();
/*      */ 
/*  771 */       String check_no = getSequenceNextVal("SEQ_T10_CHECKPARTY_RELT");
/*  772 */       t10_party_relt.setCheck_no(check_no);
/*      */ 
/*  774 */       if ((changeflag != null) && (!"".equals(changeflag)))
/*      */       {
/*  777 */         if ((!changeflag.equals("2")) && 
/*  778 */           (check_type != null) && (!"".equals(check_type)))
/*      */         {
/*  781 */           if (check_type.equals("1")) {
/*  782 */             row1 = t10_checkpartyDAO.deleteT10_checkparty_new(this.sqlMap, party_id);
/*      */ 
/*  784 */             t47_party = t47_partyDAO.getT47_partyDisp(this.sqlMap, party_id);
/*      */ 
/*  786 */             T10_checkparty t10_checkparty = new T10_checkparty();
/*  787 */             t10_checkparty.setParty_id(party_id);
/*  788 */             t10_checkparty.setCheck_type(check_type);
/*      */ 
/*  790 */             t10_party_relt.setAml1_type_cd(StringUtils.null2String(t47_party.getAml1_type_cd()));
/*  791 */             t10_party_relt.setParty_status_cd(StringUtils.null2String(t47_party.getParty_status_cd()));
/*  792 */             t10_party_relt.setOrgankey(StringUtils.null2String(t47_party.getOrgankey()));
/*  793 */             t10_party_relt.setCard_type(StringUtils.null2String(t47_party.getCard_type()));
/*  794 */             t10_party_relt.setCard_no(StringUtils.null2String(t47_party.getCard_no()));
/*  795 */             t10_party_relt.setHost_cust_id(StringUtils.null2String(t47_party.getHost_cust_id()));
/*  796 */             t10_party_relt.setParty_chn_name(StringUtils.null2String(t47_party.getParty_chn_name()));
/*      */ 
/*  798 */             i = t10_checkparty_funDAO.insertT10_checkparty_relt(this.sqlMap, t10_party_relt);
/*      */ 
/*  800 */             if (t10_checkpartyDAO.getT10_checkparty_uhCount1(this.sqlMap, t10_checkparty) > 0)
/*  801 */               row2 = t10_checkpartyDAO.modifyT10_checkparty_uh(this.sqlMap, t10_party_relt);
/*      */             else {
/*  803 */               row2 = t10_checkpartyDAO.insertT10_checkparty_uh(this.sqlMap, t10_party_relt);
/*      */             }
/*      */           }
/*      */ 
/*  807 */           if (check_type.equals("5"))
/*      */           {
/*  810 */             T10_checkparty t10_checkparty = new T10_checkparty();
/*  811 */             t10_checkparty.setParty_id(party_id);
/*  812 */             t10_checkparty = t10_checkpartyDAO.getT10_checkparty_reDisp(this.sqlMap, party_id);
/*      */ 
/*  814 */             row1 = t10_checkpartyDAO.deleteT10_checkparty_re(this.sqlMap, t10_party_relt.getParty_id());
/*  815 */             if (!"".equals(t10_checkparty.getParty_id())) {
/*  816 */               t10_party_relt.setParty_chn_name(StringUtils.null2String(t10_checkparty.getParty_chn_name()));
/*  817 */               t10_party_relt.setHost_cust_id(StringUtils.null2String(t10_checkparty.getHost_cust_id()));
/*      */ 
/*  819 */               t10_party_relt.setCard_no(StringUtils.null2String(t10_checkparty.getCard_no()));
/*  820 */               t10_party_relt.setCard_type(StringUtils.null2String(t10_checkparty.getCard_type()));
/*  821 */               t10_party_relt.setOrgankey(StringUtils.null2String(t10_checkparty.getOrgankey()));
/*      */             } else {
/*  823 */               t47_party = t47_partyDAO.getT47_partyDisp(this.sqlMap, party_id);
/*      */ 
/*  825 */               t10_party_relt.setParty_chn_name(StringUtils.null2String(t47_party.getParty_chn_name()));
/*  826 */               t10_party_relt.setHost_cust_id(StringUtils.null2String(t47_party.getHost_cust_id()));
/*      */ 
/*  828 */               t10_party_relt.setCard_no(StringUtils.null2String(t47_party.getCard_no()));
/*  829 */               t10_party_relt.setCard_type(StringUtils.null2String(t47_party.getCard_type()));
/*  830 */               t10_party_relt.setOrgankey(StringUtils.null2String(t47_party.getOrgankey()));
/*      */             }
/*      */ 
/*  834 */             i = t10_checkparty_funDAO.insertT10_checkparty_relt(this.sqlMap, t10_party_relt);
/*  835 */             t10_checkparty.setParty_id(party_id);
/*  836 */             t10_checkparty.setCheck_type(check_type);
/*  837 */             if (t10_checkpartyDAO.getT10_checkparty_uhCount1(this.sqlMap, t10_checkparty) > 0)
/*  838 */               row2 = t10_checkpartyDAO.modifyT10_checkparty_re_uh(this.sqlMap, t10_party_relt);
/*      */             else {
/*  840 */               row2 = t10_checkpartyDAO.insertT10_checkparty_re_uh(this.sqlMap, t10_party_relt);
/*      */             }
/*      */ 
/*      */           }
/*      */ 
/*      */         }
/*      */ 
/*  847 */         if (changeflag.equals("2")) {
/*  848 */           i = t10_checkparty_funDAO.insertT10_checkparty_relt(this.sqlMap, t10_party_relt);
/*      */ 
/*  850 */           T10_checkparty_fun checkparty_arti = new T10_checkparty_fun();
/*  851 */           checkparty_arti = (T10_checkparty_fun)session
/*  852 */             .getAttribute("checkparty_arti");
/*  853 */           checkparty_arti.setParty_id(party_id);
/*      */ 
/*  855 */           check_type = checkparty_arti.getCheck_type();
/*  856 */           String str = checkparty_arti.getRisk_type_str();
/*  857 */           String[] array = str.split("--");
/*      */ 
/*  859 */           for (int k = 0; k < array.length - 1; k++)
/*      */           {
/*  861 */             String temp1 = array[k];
/*  862 */             String temp2 = temp1.substring(array[k].indexOf("F"), array[k].indexOf("F") + 3);
/*  863 */             checkparty_arti.setRisk_type(temp2);
/*      */ 
/*  865 */             String check_reason_no = getSequenceNextVal("SEQ_T10_CHECK_PARTY_REASON");
/*  866 */             checkparty_arti.setCheck_reason_no(check_reason_no);
/*  867 */             checkparty_arti.setCheck_no(check_no);
/*  868 */             checkparty_arti.setChecker(t10_party_relt.getChecker());
/*  869 */             checkparty_arti.setCheck_dt(t10_party_relt.getCheck_dt());
/*  870 */             checkparty_arti.setChecker_org(t10_party_relt.getChecker_org());
/*      */ 
/*  874 */             t10_checkparty_funDAO.insertT10_check_party_reason(this.sqlMap, checkparty_arti);
/*      */           }
/*      */ 
/*  880 */           if ((check_type != null) && (!"".equals(check_type)))
/*      */           {
/*  882 */             T10_checkparty t10_checkparty = new T10_checkparty();
/*  883 */             t10_checkparty.setParty_id(t10_party_relt.getParty_id());
/*  884 */             t10_party_relt.setCheck_type(check_type);
/*  885 */             t10_party_relt.setAml1_type_cd(StringUtils.null2String(checkparty_arti.getAml1_type_cd()));
/*      */ 
/*  887 */             t10_party_relt.setOrgankey(StringUtils.null2String(checkparty_arti.getOrgankey()));
/*  888 */             t10_party_relt.setCard_type(StringUtils.null2String(checkparty_arti.getCard_type()));
/*  889 */             t10_party_relt.setCard_no(StringUtils.null2String(checkparty_arti.getCard_no()));
/*  890 */             t10_party_relt.setHost_cust_id(StringUtils.null2String(checkparty_arti.getHost_cust_id()));
/*  891 */             t10_party_relt.setParty_chn_name(StringUtils.null2String(checkparty_arti.getParty_chn_name()));
/*      */ 
/*  893 */             t10_checkparty.setCheck_type(check_type);
/*  894 */             if (!"2".equals(check_type))
/*      */             {
/*  898 */               if (t10_checkpartyDAO.getT10_checkparty_uhCount1(this.sqlMap, t10_checkparty) > 0)
/*  899 */                 row2 = t10_checkpartyDAO.modifyT10_checkparty_uh(this.sqlMap, t10_party_relt);
/*      */               else {
/*  901 */                 row2 = t10_checkpartyDAO.insertT10_checkparty_uh(this.sqlMap, t10_party_relt);
/*      */               }
/*      */             }
/*  904 */             if (check_type.equals("2"))
/*      */             {
/*  907 */               if (t10_checkpartyDAO.getT10_checkparty_uhCount1(this.sqlMap, t10_checkparty) > 0)
/*  908 */                 row2 = t10_checkpartyDAO.modifyT10_checkparty_re_uh(this.sqlMap, t10_party_relt);
/*      */               else
/*  910 */                 row2 = t10_checkpartyDAO.insertT10_checkparty_re_uh(this.sqlMap, t10_party_relt);
/*      */             }
/*  912 */             session.removeAttribute("checkparty_arti");
/*      */           }
/*      */ 
/*      */         }
/*      */ 
/*      */       }
/*      */       else
/*      */       {
/*  920 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  921 */           "error.pagertitle.common", "新建调查结论失败！"));
/*  922 */         saveErrors(request, errors);
/*  923 */         return actionMapping.findForward("failure");
/*      */       }
/*      */       String check_no;
/*      */       String party_id;
/*      */       String changeflag;
/*      */       String level_flag;
/*      */       String B_flag;
/*      */       String W_flag;
/*      */       String list_type;
/*      */       String check_type;
/*      */       int row2;
/*      */       int row1;
/*      */       int i;
/*      */       T10_checkparty_funActionForm form;
/*  930 */       if ((list_type != null) && (!"".equals(list_type)))
/*      */       {
/*  932 */         if ((W_flag != null) && ("1".equals(W_flag))) {
/*  933 */           if (list_type.equals("3")) {
/*  934 */             performAddT07_OBJ_RULEDo(t10_party_relt, request);
/*      */           }
/*      */ 
/*      */         }
/*  938 */         else if ((B_flag != null) && ("1".equals(B_flag)) && 
/*  939 */           (list_type.equals("3"))) {
/*  940 */           performAddT07_BlacklistDo(t10_party_relt, request);
/*      */         }
/*      */ 
/*      */       }
/*      */ 
/*  949 */       if ("1".equals(changeflag)) {
/*  950 */         request.setAttribute("url", "t10_checkparty_newlist.do?intPage=" + 
/*  951 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  953 */       if ("2".equals(changeflag)) {
/*  954 */         request.setAttribute("url", "t10_checkparty_arti.do?intPage=" + 
/*  955 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  957 */       if ("3".equals(changeflag)) {
/*  958 */         request.setAttribute("url", "t10_checkparty_relist.do?intPage=" + 
/*  959 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  961 */       if ("4".equals(changeflag)) {
/*  962 */         request.setAttribute("url", request.getContextPath() + "/newrisk/result/t37_party_result_list.do?intPage=" + 
/*  963 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  965 */       if ("7".equals(changeflag)) {
/*  966 */         request.setAttribute("url", "t10_checkparty_rateRiskList.do?intPage=" + 
/*  967 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  969 */       if ("8".equals(changeflag)) {
/*  970 */         request.setAttribute("url", request.getContextPath() + "/risk_rate/result/t37_party_result_surveyList.do?intPage=" + 
/*  971 */           request.getSession().getAttribute("intPage"));
/*      */       }
/*  973 */       if ("9".equals(changeflag))
/*  974 */         request.setAttribute("url", request.getContextPath() + "/risk_rate/result/t37_party_result_list.do?intPage=" + 
/*  975 */           request.getSession().getAttribute("intPage"));
/*  976 */       this.sqlMap.commitTransaction();
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*      */       ActionForward localActionForward;
/*  979 */       e.printStackTrace();
/*  980 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  981 */         "error.pagertitle.default"));
/*  982 */       saveErrors(request, errors);
/*  983 */       return actionMapping.findForward("failure");
/*      */     } finally {
/*      */       try {
/*  986 */         this.sqlMap.endTransaction();
/*      */       } catch (Exception e) {
/*  988 */         e.printStackTrace();
/*      */       }
/*      */     }
/*      */     try
/*      */     {
/*  986 */       this.sqlMap.endTransaction();
/*      */     } catch (Exception e) {
/*  988 */       e.printStackTrace();
/*      */     }
/*      */ 
/*  992 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_main(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*      */     try
/*      */     {
/* 1011 */       String party_id = request.getParameter("party_id");
/* 1012 */       String party_class_cd = request.getParameter("party_class_cd");
/*      */ 
/* 1014 */       String check_type = request.getParameter("check_type");
/*      */ 
/* 1016 */       String ischecked = request.getParameter("ischecked");
/*      */ 
/* 1021 */       String check_no = request.getParameter("check_no") == null ? "" : request.getParameter("check_no");
/*      */ 
/* 1023 */       String check_exist = request.getParameter("check_exist") == null ? "" : request.getParameter("check_exist");
/*      */ 
/* 1025 */       String showCheckReason = request.getParameter("showCheckReason") == null ? "" : request.getParameter("showCheckReason");
/* 1026 */       request.setAttribute("party_id", party_id);
/* 1027 */       request.setAttribute("party_class_cd", party_class_cd);
/* 1028 */       request.setAttribute("check_type", check_type);
/* 1029 */       request.setAttribute("ischecked", ischecked);
/* 1030 */       request.setAttribute("check_no", check_no);
/* 1031 */       request.setAttribute("check_exist", check_exist);
/* 1032 */       request.setAttribute("showCheckReason", showCheckReason);
/* 1033 */       String url = request.getParameter("url");
/* 1034 */       request.setAttribute("url", url);
/*      */ 
/* 1036 */       isNewrisk(this.sqlMap, request, party_id);
/*      */     } catch (Exception e) {
/* 1038 */       e.printStackTrace();
/* 1039 */       this.logger.error("异常", e);
/* 1040 */       return actionMapping.findForward("failure");
/*      */     }
/* 1042 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_uh_main(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1047 */     T37_party_result t37_party_result = new T37_party_result();
/* 1048 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/*      */     try
/*      */     {
/* 1051 */       String backurl = request.getParameter("backurl");
/* 1052 */       String party_id = request.getParameter("party_id");
/* 1053 */       String party_class_cd = request.getParameter("party_class_cd");
/* 1054 */       request.setAttribute("party_id", party_id);
/* 1055 */       request.setAttribute("party_class_cd", party_class_cd);
/* 1056 */       request.setAttribute("backurl", backurl);
/*      */ 
/* 1059 */       isNewrisk(this.sqlMap, request, party_id);
/*      */     }
/*      */     catch (Exception e) {
/* 1062 */       e.printStackTrace();
/* 1063 */       this.logger.error("异常", e);
/* 1064 */       return actionMapping.findForward("failure");
/*      */     }
/* 1066 */     return actionMapping.findForward("success");
/*      */   }
/*      */   public void isNewrisk(SqlMapClient sqlMap, HttpServletRequest request, String party_id) throws SQLException {
/* 1069 */     LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/* 1070 */     String isnewrisk = "0";
/* 1071 */     T37_party_result t37_party_result = new T37_party_result();
/* 1072 */     if ("1".equals(t87_sysparaMap.get("701"))) {
/* 1073 */       isnewrisk = "1";
/* 1074 */       T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/* 1075 */         .getBean("t37_party_resultDAO");
/* 1076 */       t37_party_result.setParty_id(party_id);
/* 1077 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDispBy_party_id(sqlMap, t37_party_result);
/*      */     }
/* 1079 */     request.setAttribute("t37_party_result", t37_party_result);
/* 1080 */     request.setAttribute("resulekey", t37_party_result.getResulekey());
/* 1081 */     request.setAttribute("isnewrisk", isnewrisk);
/*      */   }
/*      */ 
/*      */   public ActionForward performGetcheck_reasonList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1095 */     ActionErrors errors = new ActionErrors();
/* 1096 */     ArrayList t10_check_reasonList = null;
/* 1097 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/* 1098 */     T10_checkparty_fun t10_party_risk = new T10_checkparty_fun();
/*      */     try
/*      */     {
/* 1101 */       t10_check_reasonList = t10_checkparty_funDAO.getT10_check_reasonList(this.sqlMap, t10_party_risk);
/*      */     }
/*      */     catch (Exception e) {
/* 1104 */       e.printStackTrace();
/* 1105 */       this.logger.error("异常", e);
/* 1106 */       return actionMapping.findForward("failure");
/*      */     }
/* 1108 */     request.setAttribute("t10_check_reasonList", t10_check_reasonList);
/* 1109 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_reltdisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1122 */     ActionErrors errors = new ActionErrors();
/* 1123 */     T10_checkparty_funDAO t10_checkparty_funDAO = (T10_checkparty_funDAO)this.context.getBean("t10_checkparty_funDAO");
/* 1124 */     T10_checkparty_fun checkparty_relt = new T10_checkparty_fun();
/*      */     try {
/* 1126 */       String check_no = StringUtils.nullObject2String(request.getParameter("check_no"));
/* 1127 */       checkparty_relt = t10_checkparty_funDAO.getT10_checkparty_relt_disp(this.sqlMap, check_no);
/*      */     }
/*      */     catch (Exception e) {
/* 1130 */       e.printStackTrace();
/* 1131 */       this.logger.error("异常", e);
/* 1132 */       return actionMapping.findForward("failure");
/*      */     }
/* 1134 */     request.setAttribute("checkparty_relt", checkparty_relt);
/* 1135 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performDeter_w_bList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1149 */     ActionErrors errors = new ActionErrors();
/* 1150 */     T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO)this.context.getBean("t07_obj_ruleDAO");
/* 1151 */     T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
/*      */ 
/* 1153 */     T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO)this.context.getBean("t07_blacklistDAO");
/* 1154 */     T07_Blacklist t07_blacklist = new T07_Blacklist();
/*      */     try
/*      */     {
/* 1157 */       String party_id = StringUtils.nullObject2String(request.getParameter("party_id"));
/* 1158 */       String list_type = "3";
/*      */ 
/* 1160 */       t07_obj_rule.setParty_id(party_id);
/* 1161 */       t07_blacklist.setParty_id(party_id);
/*      */ 
/* 1164 */       if (!t07_obj_ruleDAO.getT07_OBJ_RULElist(this.sqlMap, t07_obj_rule))
/*      */       {
/* 1166 */         list_type = "1";
/*      */       }
/* 1170 */       else if (!t07_blacklistDAO.getT07_BlacklistB(this.sqlMap, t07_blacklist))
/*      */       {
/* 1172 */         list_type = "2";
/*      */       }
/* 1174 */       request.setAttribute("list_type", list_type);
/* 1175 */       response.getWriter().print(list_type);
/* 1176 */       response.getWriter().close();
/*      */     } catch (Exception e) {
/* 1178 */       e.printStackTrace();
/* 1179 */       this.logger.error("异常", e);
/* 1180 */       return actionMapping.findForward("failure");
/*      */     }
/* 1182 */     return null;
/*      */   }
/*      */ 
/*      */   public void performAddT07_OBJ_RULEDo(T10_checkparty_fun t10_party_relt, HttpServletRequest request)
/*      */     throws Exception
/*      */   {
/* 1201 */     HttpSession session = request.getSession();
/* 1202 */     T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO)this.context.getBean("t07_obj_ruleDAO");
/* 1203 */     T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
/* 1204 */     T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO)this.context.getBean("t07_tpbcruleDAO");
/* 1205 */     T07_pbcrule t07_pbcrule = new T07_pbcrule();
/* 1206 */     ArrayList t07_pbcruleList = new ArrayList();
/*      */ 
/* 1208 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 1209 */     Authorization auth = authBean.getAuthToken();
/*      */     try
/*      */     {
/* 1213 */       t07_obj_rule.setParty_id(t10_party_relt.getParty_id());
/* 1214 */       t07_obj_rule.setIsuse("0");
/* 1215 */       t07_obj_rule.setOrgankey(t10_party_relt.getOrgankey());
/* 1216 */       t07_obj_rule.setParty_class_cd(t10_party_relt.getParty_class_cd());
/* 1217 */       t07_obj_rule.setObj_name(t10_party_relt.getParty_chn_name());
/* 1218 */       t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
/* 1219 */       t07_obj_rule.setReason_create(t10_party_relt.getW_reason());
/* 1220 */       t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(
/* 1221 */         DateUtils.getCurrTime()));
/* 1222 */       t07_obj_rule.setRule_type(t10_party_relt.getW_rule_type());
/* 1223 */       t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
/* 1224 */       String check = "";
/* 1225 */       if (auth.getT00_user().getOrganlevel().equals("0")) {
/* 1226 */         check = "check";
/*      */       }
/* 1228 */       if ("check".equals(check)) {
/* 1229 */         t07_obj_rule.setIscheck("1");
/* 1230 */         t07_obj_rule.setIsuse("0");
/*      */       } else {
/* 1232 */         LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/* 1233 */         if ("1".equals(t87_sysparaMap.get("404")))
/*      */         {
/* 1235 */           t07_obj_rule.setIscheck("2");
/*      */         }
/*      */         else {
/* 1238 */           t07_obj_rule.setIscheck("4");
/*      */         }
/*      */       }
/*      */ 
/* 1242 */       int row = t07_obj_ruleDAO.insertT07_OBJ_RULE(this.sqlMap, t07_obj_rule);
/* 1243 */       if (row <= 0) {
/* 1244 */         throw new Exception("");
/*      */       }
/*      */ 
/* 1247 */       if (("check".equals(check)) && (t07_obj_rule.getIsuse().equals("0"))) {
/* 1248 */         t07_obj_rule.setPbc_type_cd(t10_party_relt.getW_rule_type());
/* 1249 */         if ("3".equals(t10_party_relt.getW_rule_type())) {
/* 1250 */           t07_obj_rule.setPbc_type_cd("1");
/* 1251 */           t07_obj_rule.setPbc_cd("2");
/*      */         }
/* 1253 */         int i = t07_obj_ruleDAO.insertT07_OBJ_RULES(this.sqlMap, 
/* 1254 */           t07_obj_rule);
/*      */       }
/*      */     }
/*      */     catch (Exception e) {
/* 1258 */       e.printStackTrace();
/*      */     }
/*      */   }
/*      */ 
/*      */   public void performAddT07_BlacklistDo(T10_checkparty_fun t10_party_relt, HttpServletRequest request)
/*      */     throws Exception
/*      */   {
/* 1277 */     ActionErrors errors = new ActionErrors();
/* 1278 */     HttpSession session = request.getSession();
/* 1279 */     T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO)this.context.getBean("t07_blacklistDAO");
/* 1280 */     T07_Blacklist t07_blacklist = new T07_Blacklist();
/*      */ 
/* 1282 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 1283 */     Authorization auth = authBean.getAuthToken();
/* 1284 */     t07_blacklist.setParty_id(t10_party_relt.getParty_id());
/* 1285 */     t07_blacklist.setObjkey(t10_party_relt.getParty_id());
/* 1286 */     t07_blacklist.setObj_name(t10_party_relt.getParty_chn_name());
/* 1287 */     t07_blacklist.setM_list_type(t10_party_relt.getM_list_type());
/* 1288 */     t07_blacklist.setIsuse("0");
/* 1289 */     t07_blacklist.setReason_create(t10_party_relt.getB_reason());
/* 1290 */     t07_blacklist.setCard_no(t10_party_relt.getCard_no());
/* 1291 */     t07_blacklist.setCard_type(t10_party_relt.getCard_type());
/*      */ 
/* 1293 */     t07_blacklist.setOrgankey(auth.getT00_user().getOrgankey());
/* 1294 */     t07_blacklist.setParty_class_cd(t10_party_relt.getParty_class_cd());
/* 1295 */     t07_blacklist.setCreate_user(auth.getT00_user().getUsername());
/* 1296 */     t07_blacklist.setCreate_dt(DateUtils.stringToDateShort(
/* 1297 */       DateUtils.getCurrTime()));
/* 1298 */     t07_blacklist.setModify_user(auth.getT00_user().getUsername());
/* 1299 */     t07_blacklist.setModify_dt(new Date());
/*      */ 
/* 1301 */     String check = "";
/*      */ 
/* 1303 */     if (auth.getT00_user().getOrganlevel().equals("0")) {
/* 1304 */       check = "check";
/*      */     }
/*      */ 
/* 1307 */     if ("check".equals(check)) {
/* 1308 */       t07_blacklist.setIscheck("1");
/*      */     } else {
/* 1310 */       LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/* 1311 */       if ("1".equals(t87_sysparaMap.get("404")))
/*      */       {
/* 1313 */         t07_blacklist.setIscheck("2");
/*      */       }
/*      */       else
/* 1316 */         t07_blacklist.setIscheck("4");
/*      */     }
/* 1318 */     int rows = t07_blacklistDAO.insertT07_Blacklist(this.sqlMap, t07_blacklist);
/*      */   }
/*      */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.cust_identify.controller.T10_checkparty_funAction
 * JD-Core Version:    0.6.2
 */