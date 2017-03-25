/*      */ package com.ist.aml.newrisk.controller;
/*      */ 
/*      */ import com.ibatis.sqlmap.client.SqlMapClient;
/*      */ import com.ist.aml.newrisk.dao.T37_party_resultDAO;
/*      */ import com.ist.aml.newrisk.dto.T31_risk_level;
/*      */ import com.ist.aml.newrisk.dto.T31_swith;
/*      */ import com.ist.aml.newrisk.dto.T37_appr_bas_rslt;
/*      */ import com.ist.aml.newrisk.dto.T37_level_audit;
/*      */ import com.ist.aml.newrisk.dto.T37_party_result;
/*      */ import com.ist.aml.report.dao.T10_check_custDAO;
/*      */ import com.ist.aml.report.dto.T10_survey_cust;
/*      */ import com.ist.common.AuthBean;
/*      */ import com.ist.common.Authorization;
/*      */ import com.ist.common.MyBeanUtils;
/*      */ import com.ist.common.PageUtils;
/*      */ import com.ist.common.Template;
/*      */ import com.ist.common.base.BaseAction;
/*      */ import com.ist.common.jcs.CatchManager;
/*      */ import com.ist.common.properties.XMLProperties;
/*      */ import com.ist.impfile.aml.report.dto.Report_SearchObj;
/*      */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*      */ import com.ist.util.StringUtils;
/*      */ import com.ist.util.ZipUtils;
/*      */ import java.io.File;
/*      */ import java.io.FileInputStream;
/*      */ import java.io.OutputStream;
/*      */ import java.io.PrintWriter;
/*      */ import java.util.ArrayList;
/*      */ import java.util.HashMap;
/*      */ import java.util.Iterator;
/*      */ import java.util.LinkedHashMap;
/*      */ import java.util.List;
/*      */ import java.util.Map;
/*      */ import java.util.Set;
/*      */ import javax.servlet.http.HttpServletRequest;
/*      */ import javax.servlet.http.HttpServletResponse;
/*      */ import javax.servlet.http.HttpSession;
/*      */ import net.sf.json.JSONArray;
/*      */ import net.sf.json.JSONObject;
/*      */ import org.apache.commons.beanutils.PropertyUtils;
/*      */ import org.apache.log4j.Logger;
/*      */ import org.apache.struts.action.ActionError;
/*      */ import org.apache.struts.action.ActionErrors;
/*      */ import org.apache.struts.action.ActionForm;
/*      */ import org.apache.struts.action.ActionForward;
/*      */ import org.apache.struts.action.ActionMapping;
/*      */ import org.apache.struts.action.ActionMessage;
/*      */ import org.apache.struts.action.ActionMessages;
/*      */ import org.springframework.context.ApplicationContext;
/*      */ 
/*      */ public class T37_party_resultAction extends BaseAction
/*      */ {
/*      */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*   67 */     ActionForward myforward = null;
/*   68 */     String myaction = mapping.getParameter();
/*      */ 
/*   70 */     myforward = preExecute(mapping, form, request, response);
/*      */ 
/*   72 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*   73 */       return myforward;
/*      */     }
/*   75 */     if ("getT37_party_resultList".equalsIgnoreCase(myaction)) {
/*   76 */       myforward = performGetT37_party_resultList(mapping, form, request, 
/*   77 */         response);
/*      */     }
/*      */ 
/*   80 */     if ("getT37_appr_bas_rsltList".equalsIgnoreCase(myaction)) {
/*   81 */       myforward = performGetT37_appr_bas_rsltList(mapping, form, request, 
/*   82 */         response);
/*      */     }
/*   86 */     else if ("modifyT37_party_gs_result".equalsIgnoreCase(myaction)) {
/*   87 */       myforward = performModifyT37_party_gs_result(mapping, form, request, 
/*   88 */         response);
/*      */     }
/*   92 */     else if ("modifyT37_party_jf_result".equalsIgnoreCase(myaction)) {
/*   93 */       myforward = performModifyT37_party_jf_result(mapping, form, request, 
/*   94 */         response);
/*      */     }
/*   97 */     else if ("getT37_appr_elem_rslt_dispList".equalsIgnoreCase(myaction)) {
/*   98 */       myforward = performGetT37_appr_elem_rslt_dispList(mapping, form, request, 
/*   99 */         response);
/*      */     }
/*  102 */     else if ("modifyT37_party_resultDo".equalsIgnoreCase(myaction)) {
/*  103 */       myforward = performModifyT37_party_resultDo(mapping, form, request, 
/*  104 */         response);
/*      */     }
/*  107 */     else if ("getT10_checkparty_main".equalsIgnoreCase(myaction)) {
/*  108 */       myforward = performGetT10_checkparty_main(mapping, form, request, 
/*  109 */         response);
/*      */     }
/*  112 */     else if ("getCurrentT37_party_result".equalsIgnoreCase(myaction)) {
/*  113 */       myforward = performGetCurrentT37_party_result(mapping, form, request, 
/*  114 */         response);
/*      */     }
/*  117 */     else if ("getT37_party_gs_resultDisp".equalsIgnoreCase(myaction)) {
/*  118 */       myforward = performGetT37_party_gs_resultDisp(mapping, form, request, 
/*  119 */         response);
/*      */     }
/*  122 */     else if ("getT37_party_jf_resultDisp".equalsIgnoreCase(myaction)) {
/*  123 */       myforward = performGetT37_party_jf_resultDisp(mapping, form, request, 
/*  124 */         response);
/*      */     }
/*  127 */     else if ("getT37_party_gsjf_resultDisp".equalsIgnoreCase(myaction)) {
/*  128 */       myforward = performGetT37_party_gsjf_resultDisp(mapping, form, request, 
/*  129 */         response);
/*      */     }
/*  132 */     else if ("getT37_party_result_uhList".equalsIgnoreCase(myaction)) {
/*  133 */       myforward = performGetT37_party_result_uhList(mapping, form, request, 
/*  134 */         response);
/*      */     }
/*  137 */     else if ("getT37_party_gs_result_uhDisp".equalsIgnoreCase(myaction)) {
/*  138 */       myforward = performGetT37_party_gs_result_uhDisp(mapping, form, request, 
/*  139 */         response);
/*      */     }
/*  142 */     else if ("getT37_party_jf_result_uhDisp".equalsIgnoreCase(myaction)) {
/*  143 */       myforward = performGetT37_party_jf_result_uhDisp(mapping, form, request, 
/*  144 */         response);
/*      */     }
/*  147 */     else if ("recountT37_party_result".equalsIgnoreCase(myaction)) {
/*  148 */       myforward = performRecountT37_party_result(mapping, form, request, 
/*  149 */         response);
/*      */     }
/*  152 */     else if ("flow_workbench_oper".equalsIgnoreCase(myaction)) {
/*  153 */       myforward = performAddT37_operDo(mapping, form, request, response);
/*      */     }
/*  156 */     else if ("getT37_party_resultList1".equalsIgnoreCase(myaction)) {
/*  157 */       myforward = performGetT37_party_resultList1(mapping, form, request, 
/*  158 */         response);
/*      */     }
/*  161 */     else if ("getT31_party_result_BExcel".equalsIgnoreCase(myaction)) {
/*  162 */       myforward = performGetT31_party_result_BExcel(mapping, form, request, 
/*  163 */         response);
/*      */     }
/*  166 */     else if ("getT31_party_result_SExcel".equalsIgnoreCase(myaction)) {
/*  167 */       myforward = performGetT31_party_result_SExcel(mapping, form, request, 
/*  168 */         response);
/*      */     }
/*  171 */     else if ("ReturnT37_party_result".equalsIgnoreCase(myaction)) {
/*  172 */       myforward = performReturnT37_party_result(mapping, form, request, 
/*  173 */         response);
/*      */     }
/*  176 */     else if ("ReturnT37_party_resultDo".equalsIgnoreCase(myaction)) {
/*  177 */       myforward = performReturnT37_party_resultDo(mapping, form, request, 
/*  178 */         response);
/*      */     }
/*  181 */     else if ("changeLevelByLastscore".equalsIgnoreCase(myaction)) {
/*  182 */       myforward = performChangeLevelByLastscore(mapping, form, request, 
/*  183 */         response);
/*      */     }
/*      */ 
/*  186 */     return myforward;
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_resultList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  205 */     ActionMessages errors = new ActionMessages();
/*  206 */     HttpSession session = request.getSession();
/*  207 */     List t37_party_resultList = null;
/*  208 */     ArrayList operlist = new ArrayList();
/*  209 */     String pageInfo = "";
/*  210 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  211 */       .getBean("t37_party_resultDAO");
/*  212 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/*  214 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  215 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/*  216 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*      */ 
/*  218 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  219 */       Authorization auth = authBean.getAuthToken();
/*  220 */       String organStr = auth.getOrganstr();
/*      */ 
/*  222 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/*  223 */       request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
/*  224 */       LinkedHashMap resultsortMap = this.cm.getMapFromCache("risk_resultsort");
/*  225 */       request.setAttribute("resultsortMap", getOptionsListByMap(resultsortMap, null, true));
/*  226 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*  227 */       request.setAttribute("riskLevelMap", getOptionsListByMap(levelMap, null, true));
/*  228 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/*  229 */       request.setAttribute("temp_type_map", getOptionsListByMap(temp_type_map, null, true));
/*  230 */       if ("0".equals(newsearchflag)) {
/*  231 */         if (form.getOrgankey().equals("")) {
/*  232 */           form.setOrgankey(auth.getT00_user().getOrgankey());
/*      */         }
/*  234 */         session.removeAttribute("t37_party_resultSearchObj");
/*      */       }
/*  236 */       else if ("1".equals(newsearchflag)) {
/*  237 */         MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  238 */         t37_party_result.setOrganStr(organStr);
/*  239 */         String statistic_dt_disp = form.getStatistic_dt_disp();
/*  240 */         String statistic_dt_disp_end = form.getStatistic_dt_disp_end();
/*  241 */         String modifydate_disp = form.getModifydate_disp();
/*  242 */         String modifydate_disp_end = form.getModifydate_disp_end();
/*  243 */         String create_dt_disp = form.getCreate_dt_disp();
/*  244 */         String create_dt_disp_end = form.getCreate_dt_disp_end();
/*  245 */         if ((statistic_dt_disp != null) && (!"".equals(statistic_dt_disp))) {
/*  246 */           t37_party_result.setStatistic_dt(
/*  247 */             com.ist.util.DateUtils.stringToDateShort(statistic_dt_disp));
/*      */         }
/*  249 */         if ((statistic_dt_disp_end != null) && 
/*  250 */           (!"".equals(statistic_dt_disp_end))) {
/*  251 */           t37_party_result.setStatistic_dt_end(
/*  252 */             com.ist.util.DateUtils.stringToDateShort(statistic_dt_disp_end));
/*      */         }
/*  254 */         if ((modifydate_disp != null) && (!"".equals(modifydate_disp))) {
/*  255 */           t37_party_result.setModifydate(
/*  256 */             com.ist.util.DateUtils.stringToDateShort(modifydate_disp));
/*      */         }
/*  258 */         if ((modifydate_disp_end != null) && 
/*  259 */           (!"".equals(modifydate_disp_end))) {
/*  260 */           t37_party_result.setModifydate_end(
/*  261 */             com.ist.util.DateUtils.stringToDateShort(modifydate_disp_end));
/*      */         }
/*  263 */         if ((create_dt_disp != null) && (!"".equals(create_dt_disp))) {
/*  264 */           t37_party_result.setCreate_dt(
/*  265 */             com.ist.util.DateUtils.stringToDateShort(create_dt_disp));
/*      */         }
/*  267 */         if ((create_dt_disp_end != null) && 
/*  268 */           (!"".equals(create_dt_disp_end))) {
/*  269 */           t37_party_result.setCreate_dt_end(
/*  270 */             com.ist.util.DateUtils.stringToDateShort(create_dt_disp_end));
/*      */         }
/*  272 */         if ((t37_party_result.getTempcategory() != null) && (!"".equals(t37_party_result.getTempcategory()))) {
/*  273 */           t37_party_result.setTempcategory_c(surroundSymbol(t37_party_result.getTempcategory(), ",", "'"));
/*      */         }
/*  275 */         session.setAttribute("t37_party_resultSearchObj", t37_party_result);
/*      */       }
/*      */       else {
/*  278 */         t37_party_result = (T37_party_result)session.getAttribute("t37_party_resultSearchObj");
/*  279 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */       }
/*  281 */       LinkedHashMap node_postMap = this.cm.getMapFromCache("t31_node_postid");
/*  282 */       String node_id = (String)node_postMap.get(t37_party_result.getPost_id());
/*  283 */       t37_party_result.setNode_id(node_id);
/*  284 */       operlist = t37_party_resultDAO.getT31_n_moveopRiskList(this.sqlMap, node_id);
/*  285 */       if (!"0".equals(newsearchflag)) {
/*  286 */         t37_party_resultList = t37_party_resultDAO
/*  287 */           .getT37_party_resultList(this.sqlMap, t37_party_result, 
/*  288 */           getStartRec(intPage), getIntPageSize());
/*  289 */         int totalRow = t37_party_resultDAO
/*  290 */           .getT37_party_resultListCount(this.sqlMap, t37_party_result);
/*  291 */         String url = request.getContextPath() + "/newrisk" + 
/*  292 */           actionMapping.getPath() + ".do";
/*  293 */         pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*  294 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */       }
/*      */     } catch (Exception e) {
/*  297 */       e.printStackTrace();
/*  298 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  299 */         "error.common", e.getMessage()));
/*  300 */       saveMessages(request, errors);
/*  301 */       return actionMapping.findForward("failure");
/*      */     }
/*  303 */     request.setAttribute("workbench_operlist", operlist);
/*  304 */     request.setAttribute("t37_party_resultList", t37_party_resultList);
/*  305 */     request.setAttribute("pageInfo", pageInfo);
/*  306 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public static String surroundSymbol(String string, String regex, String symbol)
/*      */   {
/*  317 */     String[] array = string.split(regex);
/*  318 */     StringBuilder stringBuilder = new StringBuilder();
/*  319 */     for (String s : array) {
/*  320 */       stringBuilder.append(symbol).append(s).append(symbol).append(regex);
/*      */     }
/*  322 */     if (stringBuilder.indexOf(",") != -1)
/*  323 */       stringBuilder.deleteCharAt(stringBuilder.length() - 1);
/*  324 */     return stringBuilder.toString();
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_appr_bas_rsltList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  329 */     ActionMessages errors = new ActionMessages();
/*  330 */     ArrayList t37_appr_bas_rsltList = new ArrayList();
/*  331 */     ArrayList t37_appr_elem_rsltList1 = new ArrayList();
/*  332 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/*  333 */     T37_party_result t37_party_result = new T37_party_result();
/*  334 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  335 */       .getBean("t37_party_resultDAO");
/*      */ 
/*  337 */     Map map = new LinkedHashMap();
/*      */     try {
/*  339 */       String backurl = StringUtils.null2String(request.getParameter("backurl"));
/*  340 */       String tempcategory = StringUtils.null2String(request.getParameter("tempcategory"));
/*  341 */       request.setAttribute("backurl", backurl + "&tempcategory=" + tempcategory);
/*  342 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  343 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  344 */       t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/*  345 */       t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/*  346 */       t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/*  347 */       if ((t37_party_result.getStatistic_dt_disp() != null) && (!"".equals(t37_party_result.getStatistic_dt_disp()))) {
/*  348 */         t37_appr_bas_rslt.setStatistic_dt(com.ist.util.DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
/*      */       }
/*  350 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*  351 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */ 
/*  353 */       Integer maxTreeLaye = Integer.valueOf(t37_party_resultDAO.getMaxTreeLaye(this.sqlMap, t37_appr_bas_rslt));
/*      */ 
/*  355 */       t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(this.sqlMap, t37_appr_bas_rslt);
/*      */ 
/*  357 */       t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(this.sqlMap, t37_appr_bas_rslt);
/*      */ 
/*  361 */       for (int i = 0; i < t37_appr_elem_rsltList1.size(); i++) {
/*  362 */         T37_appr_bas_rslt t37_appr_elem = (T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
/*  363 */         String upElementkey = t37_appr_elem.getUpelementkey();
/*      */ 
/*  365 */         if (map.get(upElementkey) == null) {
/*  366 */           List list = new ArrayList();
/*  367 */           list.add(t37_appr_elem);
/*  368 */           map.put(upElementkey, list);
/*      */         } else {
/*  370 */           List list = (ArrayList)map.get(upElementkey);
/*      */ 
/*  372 */           list.add(t37_appr_elem);
/*  373 */           map.put(upElementkey, list);
/*      */         }
/*      */       }
/*      */     }
/*      */     catch (Exception e) {
/*  378 */       e.printStackTrace();
/*  379 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  380 */         "error.common", e.getMessage()));
/*  381 */       saveMessages(request, errors);
/*  382 */       return actionMapping.findForward("failure");
/*      */     }
/*      */     Integer maxTreeLaye;
/*  386 */     request.setAttribute("map", map);
/*  387 */     request.setAttribute("maxTreeLaye", maxTreeLaye);
/*  388 */     request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
/*  389 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT10_checkparty_main(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  394 */     ActionMessages errors = new ActionMessages();
/*  395 */     T37_party_result t37_party_result = new T37_party_result();
/*  396 */     String backurl = StringUtils.null2String(request.getParameter("backurl"));
/*  397 */     String dispatcher = StringUtils.null2String(request.getParameter("dispatcher"));
/*  398 */     request.setAttribute("backurl", backurl);
/*  399 */     String forward = "";
/*      */     try {
/*  401 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  402 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  403 */       String party_id = form.getParty_id();
/*  404 */       if (dispatcher.equals("_view")) {
/*  405 */         forward = "success1";
/*      */       }
/*      */       else {
/*  408 */         t37_party_result.setChangeflag("4");
/*  409 */         if (t37_party_result.getTempcategory().equals("1")) {
/*  410 */           t37_party_result.setCheck_type("1");
/*      */         }
/*      */         else {
/*  413 */           t37_party_result.setCheck_type("5");
/*      */         }
/*  415 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*  416 */         forward = "success";
/*      */       }
/*  418 */       request.setAttribute("party_id", party_id);
/*  419 */       request.setAttribute("resulekey", form.getResulekey());
/*      */     } catch (Exception e) {
/*  421 */       e.printStackTrace();
/*  422 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  423 */         "error.common", e.getMessage()));
/*  424 */       saveMessages(request, errors);
/*  425 */       return actionMapping.findForward("failure");
/*      */     }
/*  427 */     return actionMapping.findForward(forward);
/*      */   }
/*      */ 
/*      */   public ActionForward performRecountT37_party_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  432 */     ActionMessages errors = new ActionMessages();
/*  433 */     T37_party_result t37_party_result = new T37_party_result();
/*  434 */     String backurl = StringUtils.null2String(request.getParameter("backurl"));
/*  435 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  436 */       .getBean("t37_party_resultDAO");
/*  437 */     request.setAttribute("backurl", backurl);
/*      */     try {
/*  439 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  440 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  441 */       String[] elementkeys = request.getParameterValues("elementkey");
/*  442 */       String[] scores = request.getParameterValues("score");
/*  443 */       StringBuilder builder = new StringBuilder();
/*  444 */       this.sqlMap.startTransaction();
/*  445 */       builder.append("UPDATE T37_APPR_BAS_RSLT t SET t.SCORE=CASE t.ELEMENTKEY");
/*  446 */       if (elementkeys.length > 0) {
/*  447 */         for (int i = 0; i < elementkeys.length; i++) {
/*  448 */           builder.append(" WHEN ");
/*  449 */           builder.append("'");
/*  450 */           builder.append(elementkeys[i]);
/*  451 */           builder.append("'");
/*  452 */           builder.append(" THEN ");
/*  453 */           builder.append("'");
/*  454 */           builder.append(scores[i]);
/*  455 */           builder.append("'");
/*      */         }
/*      */       }
/*  458 */       builder.append(" END WHERE t.RESULEKEY='" + t37_party_result.getResulekey() + "'");
/*  459 */       if ((t37_party_result.getOrgankey() != null) && (!"".equals(t37_party_result.getOrgankey()))) {
/*  460 */         builder.append(" AND t.ORGANKEY='" + t37_party_result.getOrgankey() + "'");
/*      */       }
/*  462 */       t37_party_resultDAO.modifyT37_appr_bas_rslt(this.sqlMap, builder.toString());
/*      */ 
/*  464 */       List reCalList = t37_party_resultDAO.getReCalList(this.sqlMap, t37_party_result);
/*  465 */       String root = "";
/*  466 */       String js_type = "";
/*  467 */       for (int i = 0; i < reCalList.size(); i++) {
/*  468 */         T37_appr_bas_rslt t37_appr_bas_rslt = (T37_appr_bas_rslt)reCalList.get(i);
/*  469 */         if (t37_appr_bas_rslt.getUpelementkey().equals("-1")) {
/*  470 */           root = t37_appr_bas_rslt.getElementkey();
/*  471 */           js_type = t37_appr_bas_rslt.getJs_type();
/*      */         }
/*      */       }
/*  474 */       double lastscore = reCal(root, js_type, reCalList) * 20.0D;
/*      */ 
/*  476 */       t37_party_result.setLastscore(lastscore);
/*  477 */       t37_party_resultDAO.modifyT37_party_resultLastScore(this.sqlMap, t37_party_result);
/*  478 */       this.sqlMap.commitTransaction();
/*  479 */       this.sqlMap.endTransaction();
/*      */     }
/*      */     catch (Exception e) {
/*  482 */       e.printStackTrace();
/*  483 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  484 */         "error.common", e.getMessage()));
/*  485 */       saveMessages(request, errors);
/*  486 */       return actionMapping.findForward("failure");
/*      */     }
/*  488 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT37_party_gs_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  506 */     ActionMessages errors = new ActionMessages();
/*  507 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  508 */       .getBean("t37_party_resultDAO");
/*  509 */     T37_party_result t37_party_result = new T37_party_result();
/*  510 */     ArrayList t37_level_auditList = new ArrayList();
/*  511 */     String forward = "";
/*      */     try {
/*  513 */       String backurl = StringUtils.null2String(request.getParameter("backurl"));
/*  514 */       request.setAttribute("backurl", backurl);
/*  515 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/*  516 */       request.setAttribute("levelMap", getOptionsListByMap(levelMap, null, false));
/*  517 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  518 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  519 */       if (t37_party_result.getTemptype().equals("1")) {
/*  520 */         forward = "main";
/*      */       }
/*  522 */       else if (t37_party_result.getTemptype().equals("2")) {
/*  523 */         t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*  524 */         t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
/*      */ 
/*  526 */         t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*  527 */         PropertyUtils.copyProperties(form, t37_party_result);
/*  528 */         request.setAttribute("curr_post", t37_party_result.getCurr_post());
/*      */ 
/*  530 */         forward = "success";
/*      */       }
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  535 */       e.printStackTrace();
/*  536 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  537 */         "error.common", e.getMessage()));
/*  538 */       saveMessages(request, errors);
/*  539 */       return actionMapping.findForward("failure");
/*      */     }
/*  541 */     request.setAttribute("resulekey", t37_party_result.getResulekey());
/*  542 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  543 */     return actionMapping.findForward(forward);
/*      */   }
/*      */ 
/*      */   public ActionForward performGetCurrentT37_party_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  548 */     ActionMessages errors = new ActionMessages();
/*  549 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  550 */       .getBean("t37_party_resultDAO");
/*  551 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/*  553 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  554 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*      */ 
/*  556 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*  557 */       PropertyUtils.copyProperties(form, t37_party_result);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  561 */       e.printStackTrace();
/*  562 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  563 */         "error.common", e.getMessage()));
/*  564 */       saveMessages(request, errors);
/*  565 */       return actionMapping.findForward("failure");
/*      */     }
/*  567 */     request.setAttribute("resulekey", t37_party_result.getResulekey());
/*  568 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_gs_resultDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  573 */     ActionMessages errors = new ActionMessages();
/*  574 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  575 */       .getBean("t37_party_resultDAO");
/*  576 */     T37_party_result t37_party_result = new T37_party_result();
/*  577 */     ArrayList t37_level_auditList = new ArrayList();
/*  578 */     ArrayList t37_gs_indicValList = new ArrayList();
/*      */     try
/*      */     {
/*  581 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  582 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  583 */       if ((t37_party_result.getStatistic_dt_disp() != null) && (!"".equals(t37_party_result.getStatistic_dt_disp()))) {
/*  584 */         t37_party_result.setStatistic_dt(com.ist.util.DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
/*      */       }
/*  586 */       t37_gs_indicValList = t37_party_resultDAO.getT37_gs_indicValList(this.sqlMap, t37_party_result);
/*  587 */       t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  591 */       e.printStackTrace();
/*  592 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  593 */         "error.common", e.getMessage()));
/*  594 */       saveMessages(request, errors);
/*  595 */       return actionMapping.findForward("failure");
/*      */     }
/*  597 */     request.setAttribute("t37_gs_indicValList", t37_gs_indicValList);
/*  598 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  599 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_gs_result_uhDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  604 */     ActionMessages errors = new ActionMessages();
/*  605 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  606 */       .getBean("t37_party_resultDAO");
/*  607 */     T37_party_result t37_party_result = new T37_party_result();
/*  608 */     ArrayList t37_level_auditList = new ArrayList();
/*  609 */     ArrayList t37_gs_indicValList = new ArrayList();
/*      */     try
/*      */     {
/*  612 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  613 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  614 */       if ((t37_party_result.getStatistic_dt_disp() != null) && (!"".equals(t37_party_result.getStatistic_dt_disp()))) {
/*  615 */         t37_party_result.setStatistic_dt(com.ist.util.DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
/*      */       }
/*  617 */       t37_gs_indicValList = t37_party_resultDAO.getT37_gs_indicVal_uhList(this.sqlMap, t37_party_result);
/*  618 */       t37_level_auditList = t37_party_resultDAO.getT37_level_audit_uhList(this.sqlMap, t37_party_result);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  622 */       e.printStackTrace();
/*  623 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  624 */         "error.common", e.getMessage()));
/*  625 */       saveMessages(request, errors);
/*  626 */       return actionMapping.findForward("failure");
/*      */     }
/*  628 */     request.setAttribute("t37_gs_indicValList", t37_gs_indicValList);
/*  629 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  630 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_jf_resultDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  635 */     ActionMessages errors = new ActionMessages();
/*  636 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  637 */       .getBean("t37_party_resultDAO");
/*  638 */     T37_party_result t37_party_result = new T37_party_result();
/*  639 */     ArrayList t37_level_auditList = new ArrayList();
/*  640 */     ArrayList t37_appr_bas_rsltList = new ArrayList();
/*  641 */     ArrayList t37_appr_elem_rsltList1 = new ArrayList();
/*  642 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/*      */ 
/*  644 */     Map map = new LinkedHashMap();
/*      */     try {
/*  646 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  647 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  648 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*      */ 
/*  650 */       t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/*  651 */       t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/*  652 */       t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/*  653 */       t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
/*  654 */       Integer maxTreeLaye = Integer.valueOf(t37_party_resultDAO.getMaxTreeLaye(this.sqlMap, t37_appr_bas_rslt));
/*  655 */       t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(this.sqlMap, t37_appr_bas_rslt);
/*  656 */       t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(this.sqlMap, t37_appr_bas_rslt);
/*  657 */       t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*  658 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */ 
/*  660 */       for (int i = 0; i < t37_appr_elem_rsltList1.size(); i++) {
/*  661 */         T37_appr_bas_rslt t37_appr_elem = (T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
/*  662 */         String upElementkey = t37_appr_elem.getUpelementkey();
/*      */ 
/*  664 */         if (map.get(upElementkey) == null) {
/*  665 */           List list = new ArrayList();
/*  666 */           list.add(t37_appr_elem);
/*  667 */           map.put(upElementkey, list);
/*      */         }
/*      */         else {
/*  670 */           List list = (ArrayList)map.get(upElementkey);
/*      */ 
/*  672 */           list.add(t37_appr_elem);
/*  673 */           map.put(upElementkey, list);
/*      */         }
/*      */       }
/*      */     } catch (Exception e) {
/*  677 */       e.printStackTrace();
/*  678 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  679 */         "error.common", e.getMessage()));
/*  680 */       saveMessages(request, errors);
/*  681 */       return actionMapping.findForward("failure");
/*      */     }
/*      */     Integer maxTreeLaye;
/*  683 */     request.setAttribute("map", map);
/*  684 */     request.setAttribute("maxTreeLaye", maxTreeLaye);
/*  685 */     request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
/*  686 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  687 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_gsjf_resultDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  693 */     ActionErrors errors = new ActionErrors();
/*  694 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  695 */       .getBean("t37_party_resultDAO");
/*  696 */     T37_party_result t37_party_result = new T37_party_result();
/*  697 */     ArrayList t37_level_auditList = new ArrayList();
/*  698 */     ArrayList t37_appr_bas_rsltList = new ArrayList();
/*  699 */     ArrayList t37_appr_elem_rsltList1 = new ArrayList();
/*  700 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/*      */ 
/*  702 */     String forward = "success";
/*  703 */     Map map = new LinkedHashMap();
/*      */     try {
/*  705 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*      */ 
/*  707 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  708 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*  709 */       if ((form.getResulekey() != null) && (!"".equals(form.getResulekey()))) {
/*  710 */         if (t37_party_result.getTemptype().equals("1"))
/*      */         {
/*  712 */           t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/*  713 */           t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/*  714 */           t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/*  715 */           t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
/*  716 */           Integer maxTreeLaye = Integer.valueOf(t37_party_resultDAO.getMaxTreeLaye(this.sqlMap, t37_appr_bas_rslt));
/*  717 */           t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(this.sqlMap, t37_appr_bas_rslt);
/*  718 */           t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(this.sqlMap, t37_appr_bas_rslt);
/*  719 */           t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*      */ 
/*  721 */           for (int i = 0; i < t37_appr_elem_rsltList1.size(); i++) {
/*  722 */             T37_appr_bas_rslt t37_appr_elem = (T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
/*  723 */             String upElementkey = t37_appr_elem.getUpelementkey();
/*      */ 
/*  725 */             if (map.get(upElementkey) == null) {
/*  726 */               List list = new ArrayList();
/*  727 */               list.add(t37_appr_elem);
/*  728 */               map.put(upElementkey, list);
/*      */             }
/*      */             else {
/*  731 */               List list = (ArrayList)map.get(upElementkey);
/*      */ 
/*  733 */               list.add(t37_appr_elem);
/*  734 */               map.put(upElementkey, list);
/*      */             }
/*      */           }
/*      */ 
/*  738 */           request.setAttribute("map", map);
/*  739 */           request.setAttribute("maxTreeLaye", maxTreeLaye);
/*  740 */           request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
/*  741 */           request.setAttribute("t37_level_auditList", t37_level_auditList);
/*      */         }
/*  743 */         else if (t37_party_result.getTemptype().equals("2")) {
/*  744 */           ArrayList t37_gs_indicValList = new ArrayList();
/*      */ 
/*  746 */           t37_gs_indicValList = t37_party_resultDAO.getT37_gs_indicValList(this.sqlMap, t37_party_result);
/*  747 */           t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*  748 */           request.setAttribute("t37_gs_indicValList", t37_gs_indicValList);
/*  749 */           request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  750 */           forward = "success1";
/*      */         }
/*      */       } else {
/*  753 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", "该客户还没进行风险评级！"));
/*  754 */         saveErrors(request, errors);
/*  755 */         forward = "failure";
/*      */       }
/*  757 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */     }
/*      */     catch (Exception e) {
/*  760 */       e.printStackTrace();
/*  761 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  762 */         "error.common", e.getMessage()));
/*  763 */       saveMessages(request, errors);
/*  764 */       return actionMapping.findForward("failure");
/*      */     }
/*  766 */     request.setAttribute("resulekey", t37_party_result.getResulekey());
/*  767 */     return actionMapping.findForward(forward);
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_jf_result_uhDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  772 */     ActionMessages errors = new ActionMessages();
/*  773 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  774 */       .getBean("t37_party_resultDAO");
/*  775 */     T37_party_result t37_party_result = new T37_party_result();
/*  776 */     ArrayList t37_level_auditList = new ArrayList();
/*  777 */     ArrayList t37_appr_bas_rsltList = new ArrayList();
/*  778 */     ArrayList t37_appr_elem_rsltList1 = new ArrayList();
/*  779 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/*      */ 
/*  781 */     Map map = new LinkedHashMap();
/*      */     try {
/*  783 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  784 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  785 */       t37_party_result = t37_party_resultDAO.getT37_party_result_uhDisp(this.sqlMap, t37_party_result);
/*      */ 
/*  787 */       t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/*  788 */       t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/*  789 */       t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/*  790 */       t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
/*  791 */       Integer maxTreeLaye = Integer.valueOf(t37_party_resultDAO.getMaxTreeLaye(this.sqlMap, t37_appr_bas_rslt));
/*  792 */       t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rslt_uhList(this.sqlMap, t37_appr_bas_rslt);
/*  793 */       if (t37_appr_bas_rsltList.size() > 0) {
/*  794 */         t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(this.sqlMap, t37_appr_bas_rslt);
/*      */       }
/*      */ 
/*  797 */       t37_level_auditList = t37_party_resultDAO.getT37_level_audit_uhList(this.sqlMap, t37_party_result);
/*  798 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */ 
/*  800 */       for (int i = 0; i < t37_appr_elem_rsltList1.size(); i++) {
/*  801 */         T37_appr_bas_rslt t37_appr_elem = (T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
/*  802 */         String upElementkey = t37_appr_elem.getUpelementkey();
/*      */ 
/*  804 */         if (map.get(upElementkey) == null) {
/*  805 */           List list = new ArrayList();
/*  806 */           list.add(t37_appr_elem);
/*  807 */           map.put(upElementkey, list);
/*      */         }
/*      */         else {
/*  810 */           List list = (ArrayList)map.get(upElementkey);
/*      */ 
/*  812 */           list.add(t37_appr_elem);
/*  813 */           map.put(upElementkey, list);
/*      */         }
/*      */       }
/*      */     } catch (Exception e) {
/*  817 */       e.printStackTrace();
/*  818 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  819 */         "error.common", e.getMessage()));
/*  820 */       saveMessages(request, errors);
/*  821 */       return actionMapping.findForward("failure");
/*      */     }
/*      */     Integer maxTreeLaye;
/*  823 */     request.setAttribute("map", map);
/*  824 */     request.setAttribute("maxTreeLaye", maxTreeLaye);
/*  825 */     request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
/*  826 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*  827 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_result_uhList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  833 */     ActionMessages errors = new ActionMessages();
/*  834 */     HttpSession session = request.getSession();
/*  835 */     List t37_party_result_uhList = null;
/*  836 */     String pageInfo = "";
/*  837 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  838 */       .getBean("t37_party_resultDAO");
/*  839 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/*  841 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  842 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/*  843 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*      */ 
/*  845 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  846 */       Authorization auth = authBean.getAuthToken();
/*  847 */       String organStr = auth.getOrganstr();
/*  848 */       if ("1".equals(newsearchflag)) {
/*  849 */         MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  850 */         t37_party_result.setOrganStr(organStr);
/*      */ 
/*  852 */         session.setAttribute("t37_party_result_uh_innerSearchObj", t37_party_result);
/*      */       }
/*      */       else {
/*  855 */         t37_party_result = (T37_party_result)session.getAttribute("t37_party_result_uh_innerSearchObj");
/*  856 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */       }
/*  858 */       t37_party_result_uhList = t37_party_resultDAO
/*  859 */         .getT37_party_result_uhList(this.sqlMap, t37_party_result, 
/*  860 */         getStartRec(intPage), getIntPageSize());
/*  861 */       int totalRow = t37_party_resultDAO
/*  862 */         .getT37_party_result_uhListCount(this.sqlMap, t37_party_result);
/*  863 */       String url = request.getContextPath() + "/newrisk" + 
/*  864 */         actionMapping.getPath() + ".do";
/*  865 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*  866 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */     }
/*      */     catch (Exception e) {
/*  869 */       e.printStackTrace();
/*  870 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  871 */         "error.common", e.getMessage()));
/*  872 */       saveMessages(request, errors);
/*  873 */       return actionMapping.findForward("failure");
/*      */     }
/*  875 */     request.setAttribute("t37_party_result_uhList", t37_party_result_uhList);
/*  876 */     request.setAttribute("pageInfo", pageInfo);
/*  877 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT37_party_resultDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  894 */     ActionMessages errors = new ActionMessages();
/*  895 */     HttpSession session = request.getSession();
/*  896 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  897 */     Authorization auth = authBean.getAuthToken();
/*  898 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/*  899 */       .getBean("t37_party_resultDAO");
/*  900 */     String backurl = StringUtils.null2String(request.getParameter("backurl"));
/*  901 */     T37_party_result t37_party_result = new T37_party_result();
/*  902 */     LinkedHashMap t87_sysparaMap = this.cm.getMapFromCache("t87_syspara");
/*  903 */     String forward = "";
/*      */     try {
/*  905 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*  906 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*  907 */       ArrayList t31_risk_levelList = (ArrayList)this.sqlMap.queryForList("t31_risk_levelList");
/*  908 */       if ((t37_party_result.getResulekey() == null) || ("".equals(t37_party_result.getResulekey())))
/*      */       {
/*  910 */         return actionMapping.findForward("failure");
/*      */       }
/*  912 */       String curr_post = form.getCurr_post();
/*  913 */       String node_id = form.getNode_id();
/*  914 */       String oper_id = form.getOper_id();
/*  915 */       String levelkey = "";
/*  916 */       String emendationlevel = form.getEmendationlevel();
/*  917 */       String fristappralevel = form.getFristappralevel();
/*  918 */       if (t87_sysparaMap.get("705").equals("1")) {
/*  919 */         double e = 0.0D;
/*  920 */         double f = 0.0D;
/*  921 */         if ((t31_risk_levelList != null) && (t31_risk_levelList.size() > 0)) {
/*  922 */           for (int i = 0; i < t31_risk_levelList.size(); i++) {
/*  923 */             T31_risk_level t31_risk_level = (T31_risk_level)t31_risk_levelList.get(i);
/*  924 */             if (t31_risk_level.getLevelkey().equals(emendationlevel))
/*  925 */               e = t31_risk_level.getLevelmin_d().doubleValue();
/*  926 */             else if (t31_risk_level.getLevelkey().equals(fristappralevel)) {
/*  927 */               f = t31_risk_level.getLevelmin_d().doubleValue();
/*      */             }
/*      */           }
/*      */ 
/*      */         }
/*      */ 
/*  933 */         if (f > e)
/*  934 */           levelkey = fristappralevel;
/*      */         else
/*  936 */           levelkey = emendationlevel;
/*      */       }
/*      */       else {
/*  939 */         levelkey = emendationlevel;
/*      */       }
/*      */ 
/*  942 */       String status = "";
/*  943 */       String is_report = "";
/*  944 */       String next_post = "";
/*  945 */       ArrayList t31_switchList = this.cm.getListFromCache("t31_switchList");
/*      */ 
/*  947 */       for (int i = 0; i < t31_switchList.size(); i++) {
/*  948 */         T31_swith t31_switch = (T31_swith)t31_switchList.get(i);
/*  949 */         if ((node_id.equals(t31_switch.getOrig_node())) && (oper_id.equals(t31_switch.getOper_id())) && (levelkey.equals(t31_switch.getLevelkey()))) {
/*  950 */           status = t31_switch.getStatus();
/*  951 */           is_report = t31_switch.getIs_report();
/*  952 */           String next_node = t31_switch.getTarget_node();
/*  953 */           LinkedHashMap nodeMap = this.cm.getMapFromCache("t31_nodeid");
/*  954 */           next_post = StringUtils.null2String((String)nodeMap.get(next_node));
/*  955 */           break;
/*      */         }
/*      */       }
/*  958 */       String resulekey = t37_party_result.getResulekey();
/*  959 */       t37_party_result.setCurr_post(next_post);
/*  960 */       t37_party_result.setStatus_cd(status);
/*  961 */       if (next_post.equals("")) {
/*  962 */         t37_party_result.setCurr_post("P9999");
/*  963 */         t37_party_result.setLevelkey(levelkey);
/*  964 */         t37_party_result.setStatus_cd("6");
/*  965 */         is_report = "1";
/*      */       }
/*  967 */       t37_party_result.setModify_cd("1");
/*  968 */       t37_party_result.setModifier(authBean.getAuthToken().getT00_user().getUsername());
/*  969 */       t37_party_result.setModifydate(com.ist.util.DateUtils.getCurrDateTime());
/*  970 */       t37_party_result.setResulekey("'" + resulekey + "'");
/*  971 */       if (is_report.equals("1")) {
/*  972 */         t37_party_result.setStatus_cd("7");
/*      */       }
/*      */ 
/*  976 */       isModify_fields(oper_id, curr_post, levelkey, t37_party_result, authBean);
/*      */ 
/*  979 */       int row = t37_party_resultDAO.modifyT37_party_resultStatusForReport(this.sqlMap, t37_party_result);
/*  980 */       if (row > 0) {
/*  981 */         T37_level_audit t37_level_audit = new T37_level_audit();
/*  982 */         t37_level_audit.setAudit_no(getSequenceNextVal("T37_LEVEL_AUDIT_SEQ"));
/*  983 */         t37_level_audit.setRsltkey(resulekey);
/*  984 */         t37_level_audit.setParty_id(t37_party_result.getParty_id());
/*  985 */         t37_level_audit.setOrgankey(t37_party_result.getOrgankey());
/*  986 */         t37_level_audit.setStatistic_dt(com.ist.util.DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
/*  987 */         t37_level_audit.setLast_upd_dt(com.ist.util.DateUtils.getCurrDateTime());
/*  988 */         t37_level_audit.setLast_upd_user(authBean.getAuthToken().getT00_user().getUsername());
/*  989 */         t37_level_audit.setLevel_before_adjust(t37_party_result.getLevel_before_adjust());
/*  990 */         t37_level_audit.setLevel_after_adjust(t37_party_result.getEmendationlevel());
/*  991 */         t37_level_audit.setAdjust_reason(t37_party_result.getReason());
/*  992 */         t37_level_audit.setGranularity(t37_party_result.getGranularity());
/*  993 */         t37_level_audit.setRes_post_id(next_post);
/*  994 */         t37_level_audit.setPost_id(curr_post);
/*  995 */         t37_party_resultDAO.insertT37_level_audit(this.sqlMap, t37_level_audit);
/*      */       }
/*  997 */       if (t37_party_result.getTemptype().equals("1")) {
/*  998 */         request.setAttribute("url", backurl);
/*  999 */         forward = "success1";
/*      */       } else {
/* 1001 */         forward = "success";
/*      */       }
/*      */     } catch (Exception e) {
/* 1004 */       e.printStackTrace();
/* 1005 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1006 */         "error.common", e.getMessage()));
/* 1007 */       saveMessages(request, errors);
/* 1008 */       return actionMapping.findForward("failure");
/*      */     }
/* 1010 */     return actionMapping.findForward(forward);
/*      */   }
/*      */ 
/*      */   private String isModify_fields(String oper_id, String curr_post, String levelkey, T37_party_result t37_party_result, AuthBean authBean)
/*      */   {
/* 1015 */     if ((oper_id.equals("B20011")) || (oper_id.equals("B20021")) || (oper_id.equals("B20031"))) {
/* 1016 */       if (curr_post.equals("P2001")) {
/* 1017 */         t37_party_result.setAudit_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1018 */         t37_party_result.setAudit_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1019 */       } else if (curr_post.equals("P2002")) {
/* 1020 */         t37_party_result.setCheck_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1021 */         t37_party_result.setCheck_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1022 */       } else if (curr_post.equals("P2003")) {
/* 1023 */         t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1024 */         t37_party_result.setRcheck_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1025 */         com.ist.common.util.DateUtils dateUtils = new com.ist.common.util.DateUtils();
/* 1026 */         LinkedHashMap new_clientMap = this.cm.getMapFromCache("new_client");
/* 1027 */         LinkedHashMap client_proMap = this.cm.getMapFromCache("client_pro");
/* 1028 */         LinkedHashMap level_dateMap = this.cm.getMapFromCache("level_date");
/* 1029 */         String dateString = "";
/*      */ 
/* 1031 */         if (new_clientMap.get(t37_party_result.getTemplatekey()) != null)
/* 1032 */           dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), (String)new_clientMap.get(t37_party_result.getTemplatekey()), 1);
/* 1033 */         else if (client_proMap.get(t37_party_result.getTemplatekey()) != null) {
/* 1034 */           dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), (String)client_proMap.get(t37_party_result.getTemplatekey()), 1);
/*      */         }
/* 1036 */         else if (level_dateMap.get(levelkey) != null) {
/* 1037 */           dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), "4", Integer.parseInt((String)level_dateMap.get(levelkey)));
/*      */         }
/*      */ 
/* 1040 */         if (!"".equals(dateString)) {
/* 1041 */           t37_party_result.setNextstatistic_dt(com.ist.util.DateUtils.stringToDateShort(dateString));
/*      */         }
/*      */       }
/*      */     }
/*      */ 
/* 1046 */     return null;
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT37_party_jf_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1063 */     ActionMessages errors = new ActionMessages();
/* 1064 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/* 1065 */       .getBean("t37_party_resultDAO");
/* 1066 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 1067 */     request.setAttribute("levelMap", getOptionsListByMap(levelMap, null, false));
/* 1068 */     T37_party_result t37_party_result = new T37_party_result();
/* 1069 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/* 1070 */     ArrayList t37_level_auditList = new ArrayList();
/* 1071 */     List t37_appr_bas_rsltList = new ArrayList();
/* 1072 */     String jsonStr = "";
/* 1073 */     String jsonFlag = "";
/*      */     try {
/* 1075 */       String backurl = StringUtils.null2String(request.getParameter("backurl"));
/* 1076 */       String tempcategory = StringUtils.null2String(request.getParameter("tempcategory"));
/* 1077 */       request.setAttribute("backurl", backurl + "&tempcategory=" + tempcategory);
/* 1078 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1079 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*      */ 
/* 1081 */       t37_party_result = t37_party_resultDAO.getT37_party_result_jfDisp(this.sqlMap, t37_party_result);
/* 1082 */       t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
/* 1083 */       t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/* 1084 */       t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/* 1085 */       t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/* 1086 */       t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
/* 1087 */       t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_elem_rsltList(this.sqlMap, t37_appr_bas_rslt);
/* 1088 */       t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/* 1089 */       PropertyUtils.copyProperties(form, t37_party_result);
/* 1090 */       request.setAttribute("curr_post", t37_party_result.getCurr_post());
/*      */ 
/* 1092 */       JSONArray jsonArray = new JSONArray();
/* 1093 */       for (int i = 0; i < t37_appr_bas_rsltList.size(); i++)
/*      */       {
/* 1095 */         T37_appr_bas_rslt t37_appr_bas = (T37_appr_bas_rslt)t37_appr_bas_rsltList.get(i);
/* 1096 */         JSONObject json = JSONObject.fromObject(t37_appr_bas);
/* 1097 */         jsonArray.add(json);
/*      */       }
/*      */ 
/* 1100 */       jsonStr = jsonArray.toString();
/* 1101 */       jsonFlag = "0";
/*      */     } catch (Exception e) {
/* 1103 */       e.printStackTrace();
/* 1104 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1105 */         "error.common", e.getMessage()));
/* 1106 */       saveMessages(request, errors);
/* 1107 */       return actionMapping.findForward("failure");
/*      */     }
/* 1109 */     request.setAttribute("jsonStr", jsonStr);
/* 1110 */     request.setAttribute("jsonFlag", jsonFlag);
/* 1111 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/* 1112 */     request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
/* 1113 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_appr_elem_rslt_dispList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1120 */     ActionMessages errors = new ActionMessages();
/* 1121 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/* 1122 */       .getBean("t37_party_resultDAO");
/* 1123 */     LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 1124 */     request.setAttribute("levelMap", getOptionsListByMap(levelMap, null, false));
/* 1125 */     T37_party_result t37_party_result = new T37_party_result();
/* 1126 */     T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
/* 1127 */     ArrayList t37_level_auditList = new ArrayList();
/* 1128 */     List t37_appr_bas_rslt_dispList = new ArrayList();
/* 1129 */     String jsonStr = "";
/* 1130 */     String jsonFlag = "0";
/*      */     try {
/* 1132 */       String backurl = StringUtils.null2String(request.getParameter("backurl"));
/* 1133 */       request.setAttribute("backurl", backurl);
/* 1134 */       LinkedHashMap radarMap = this.cm.getMapFromCache("radar_name");
/* 1135 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1136 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/* 1137 */       String elementkey = StringUtils.nullObject2String(request.getParameter("elementkey"));
/* 1138 */       String resulekey = StringUtils.nullObject2String(request.getParameter("resulekey"));
/*      */ 
/* 1141 */       t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
/* 1142 */       if ((t37_party_result.getStatistic_dt_disp() != null) && (!"".equals(t37_party_result.getStatistic_dt_disp()))) {
/* 1143 */         t37_appr_bas_rslt.setStatistic_dt(com.ist.util.DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
/*      */       }
/* 1145 */       if (elementkey.equals("fristList"))
/*      */       {
/* 1147 */         t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
/* 1148 */         t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
/*      */ 
/* 1150 */         t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_elem_rsltList(this.sqlMap, t37_appr_bas_rslt);
/*      */       }
/*      */       else {
/* 1153 */         t37_appr_bas_rslt.setElementkey(elementkey);
/* 1154 */         t37_appr_bas_rslt.setResulekey(resulekey);
/* 1155 */         t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_elem_rslt_dispList(this.sqlMap, t37_appr_bas_rslt);
/* 1156 */         if (t37_appr_bas_rslt_dispList.size() == 0) {
/* 1157 */           t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_bas_rslt_dispList(this.sqlMap, t37_appr_bas_rslt);
/* 1158 */           jsonFlag = "1";
/*      */         }
/*      */       }
/*      */ 
/* 1162 */       t37_party_result = t37_party_resultDAO.getT37_party_result_jfDisp(this.sqlMap, t37_party_result);
/* 1163 */       t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
/*      */ 
/* 1165 */       t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/* 1166 */       PropertyUtils.copyProperties(form, t37_party_result);
/* 1167 */       request.setAttribute("curr_post", t37_party_result.getCurr_post());
/*      */ 
/* 1170 */       JSONArray jsonArray = new JSONArray();
/* 1171 */       for (int i = 0; i < t37_appr_bas_rslt_dispList.size(); i++)
/*      */       {
/* 1173 */         T37_appr_bas_rslt t37_appr_bas = (T37_appr_bas_rslt)t37_appr_bas_rslt_dispList.get(i);
/* 1174 */         t37_appr_bas.setElementname((String)radarMap.get(t37_appr_bas.getElementkey()));
/* 1175 */         JSONObject json = JSONObject.fromObject(t37_appr_bas);
/* 1176 */         jsonArray.add(json);
/*      */       }
/*      */ 
/* 1179 */       jsonStr = jsonArray.toString();
/*      */     }
/*      */     catch (Exception e) {
/* 1182 */       e.printStackTrace();
/* 1183 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1184 */         "error.common", e.getMessage()));
/* 1185 */       saveMessages(request, errors);
/* 1186 */       return actionMapping.findForward("failure");
/*      */     }
/* 1188 */     request.setAttribute("jsonStr", jsonStr);
/* 1189 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/* 1190 */     request.setAttribute("jsonFlag", jsonFlag);
/* 1191 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT37_operDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1196 */     ActionMessages errors = new ActionMessages();
/* 1197 */     HttpSession session = request.getSession();
/* 1198 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 1199 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context
/* 1200 */       .getBean("t37_party_resultDAO");
/* 1201 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/* 1203 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1204 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/* 1205 */       ArrayList t31_risk_levelList = (ArrayList)this.sqlMap.queryForList("t31_risk_levelList");
/* 1206 */       String node_id = form.getNode_id();
/* 1207 */       String oper_id = StringUtils.null2String(form.getOper_id());
/* 1208 */       String levelkey = "";
/* 1209 */       String[] resultKeys = form.getRkeys();
/* 1210 */       String keys = "";
/* 1211 */       String organkeys = "";
/* 1212 */       String key_temps = "";
/* 1213 */       if ((resultKeys != null) && (resultKeys.length > 0)) {
/* 1214 */         for (int i = 0; i < resultKeys.length; i++) {
/* 1215 */           String str = resultKeys[i];
/* 1216 */           String[] strs = str.split(",");
/* 1217 */           keys = keys + ",'" + strs[0] + "'";
/* 1218 */           organkeys = organkeys + ",'" + strs[3] + "'";
/* 1219 */           key_temps = key_temps + ";" + "'" + strs[0] + "'" + "," + strs[2];
/* 1220 */           if (i == 0) {
/* 1221 */             levelkey = strs[1];
/*      */           }
/*      */ 
/*      */         }
/*      */ 
/*      */       }
/*      */ 
/* 1228 */       String status = "";
/* 1229 */       String is_report = "";
/* 1230 */       String next_post = "";
/* 1231 */       if (!keys.equals("")) {
/* 1232 */         keys = keys.substring(1);
/* 1233 */         ArrayList t31_switchList = this.cm.getListFromCache("t31_switchList");
/*      */ 
/* 1235 */         for (int i = 0; i < t31_switchList.size(); i++) {
/* 1236 */           T31_swith t31_switch = (T31_swith)t31_switchList.get(i);
/* 1237 */           if ((node_id.equals(t31_switch.getOrig_node())) && (oper_id.equals(t31_switch.getOper_id())) && (levelkey.equals(t31_switch.getLevelkey()))) {
/* 1238 */             status = t31_switch.getStatus();
/* 1239 */             is_report = t31_switch.getIs_report();
/* 1240 */             String next_node = t31_switch.getTarget_node();
/* 1241 */             LinkedHashMap nodeMap = this.cm.getMapFromCache("t31_nodeid");
/* 1242 */             next_post = StringUtils.null2String((String)nodeMap.get(next_node));
/* 1243 */             break;
/*      */           }
/*      */         }
/* 1246 */         t37_party_result.setResulekey(keys);
/* 1247 */         t37_party_result.setCurr_post(next_post);
/* 1248 */         t37_party_result.setStatus_cd(status);
/* 1249 */         if (!"".equals(organkeys)) {
/* 1250 */           organkeys = organkeys.substring(1);
/* 1251 */           t37_party_result.setOrgankey_s(organkeys);
/*      */         }
/* 1253 */         if (next_post.equals("")) {
/* 1254 */           t37_party_result.setCurr_post("P9999");
/* 1255 */           t37_party_result.setLevelkey(levelkey);
/* 1256 */           t37_party_result.setEmendationlevel(levelkey);
/* 1257 */           t37_party_result.setStatus_cd("6");
/* 1258 */           is_report = "1";
/*      */         }
/* 1260 */         if (is_report.equals("1")) {
/* 1261 */           t37_party_result.setStatus_cd("7");
/*      */         }
/*      */ 
/* 1264 */         modifyT37_operDo(oper_id, key_temps, levelkey, t37_party_result, request);
/*      */       }
/*      */     } catch (Exception e) {
/* 1267 */       e.printStackTrace();
/* 1268 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1269 */         "error.common", e.getMessage()));
/* 1270 */       saveMessages(request, errors);
/* 1271 */       return actionMapping.findForward("failure");
/*      */     }
/* 1273 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   private String modifyT37_operDo(String oper_id, String key_temps, String levelkey, T37_party_result t37_party_result, HttpServletRequest request)
/*      */   {
/* 1278 */     HttpSession session = request.getSession();
/* 1279 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 1280 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/*      */     try {
/* 1282 */       String post_id = t37_party_result.getPost_id();
/*      */ 
/* 1284 */       if ((oper_id.equals("B20011")) || (oper_id.equals("B20021")) || (oper_id.equals("B20031"))) {
/* 1285 */         if (post_id.equals("P2001")) {
/* 1286 */           t37_party_result.setAudit_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1287 */           t37_party_result.setAudit_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1288 */           t37_party_resultDAO.modifyT37_party_resultStatusForReport(this.sqlMap, t37_party_result);
/* 1289 */         } else if (post_id.equals("P2002")) {
/* 1290 */           t37_party_result.setCheck_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1291 */           t37_party_result.setCheck_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1292 */           t37_party_resultDAO.modifyT37_party_resultStatusForReport(this.sqlMap, t37_party_result);
/* 1293 */         } else if (post_id.equals("P2003")) {
/* 1294 */           t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
/* 1295 */           t37_party_result.setRcheck_dt(com.ist.util.DateUtils.getCurrDateTime());
/* 1296 */           com.ist.common.util.DateUtils dateUtils = new com.ist.common.util.DateUtils();
/* 1297 */           LinkedHashMap new_clientMap = this.cm.getMapFromCache("new_client");
/* 1298 */           LinkedHashMap client_proMap = this.cm.getMapFromCache("client_pro");
/* 1299 */           LinkedHashMap level_dateMap = this.cm.getMapFromCache("level_date");
/* 1300 */           String[] key_temp = key_temps.substring(1).split(";");
/*      */ 
/* 1303 */           String dateString = "";
/* 1304 */           Map map = new LinkedHashMap();
/* 1305 */           for (int i = 0; i < key_temp.length; i++) {
/* 1306 */             String[] tems = key_temp[i].split(",");
/* 1307 */             if ((!"".equals(tems[0])) && (!"".equals(tems[1]))) {
/* 1308 */               if (new_clientMap.get(tems[1]) != null)
/* 1309 */                 dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), (String)new_clientMap.get(tems[1]), 1);
/* 1310 */               else if (client_proMap.get(tems[1]) != null) {
/* 1311 */                 dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), (String)client_proMap.get(tems[1]), 1);
/*      */               }
/* 1313 */               else if (level_dateMap.get(levelkey) != null) {
/* 1314 */                 dateString = dateUtils.getDateChangeALL(com.ist.util.DateUtils.getCurrTime(), "4", Integer.parseInt((String)level_dateMap.get(levelkey)));
/*      */               }
/*      */ 
/* 1317 */               if (map.get(dateString) == null) {
/* 1318 */                 List list = new ArrayList();
/* 1319 */                 list.add(tems[0]);
/* 1320 */                 map.put(dateString, list);
/*      */               } else {
/* 1322 */                 List list = (ArrayList)map.get(dateString);
/*      */ 
/* 1324 */                 list.add(tems[0]);
/* 1325 */                 map.put(dateString, list);
/*      */               }
/*      */             }
/*      */           }
/*      */ 
/* 1330 */           Iterator it = map.keySet().iterator();
/*      */ 
/* 1333 */           String resultkeys = "";
/* 1334 */           while (it.hasNext()) {
/* 1335 */             String key = it.next().toString();
/* 1336 */             List valueList = (List)map.get(key);
/* 1337 */             t37_party_result.setNextstatistic_dt(com.ist.util.DateUtils.stringToDateShort(key));
/* 1338 */             for (int i = 0; i < valueList.size(); i++) {
/* 1339 */               resultkeys = resultkeys + "," + valueList.get(i);
/*      */             }
/* 1341 */             t37_party_result.setResulekey(resultkeys.substring(1));
/* 1342 */             t37_party_resultDAO.modifyT37_party_resultStatusForReport(this.sqlMap, t37_party_result);
/*      */           }
/*      */         }
/*      */       }
/* 1346 */       else t37_party_resultDAO.modifyT37_party_resultStatusForReport(this.sqlMap, t37_party_result); 
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/* 1349 */       e.printStackTrace();
/*      */     }
/*      */ 
/* 1352 */     return null;
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT37_party_resultList1(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1369 */     ActionMessages errors = new ActionMessages();
/* 1370 */     HttpSession session = request.getSession();
/* 1371 */     List t37_party_resultList = null;
/* 1372 */     ArrayList operlist = new ArrayList();
/* 1373 */     String pageInfo = "";
/* 1374 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/* 1375 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/* 1377 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1378 */       String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
/* 1379 */       int intPage = PageUtils.intPage(request, newsearchflag);
/*      */ 
/* 1381 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 1382 */       Authorization auth = authBean.getAuthToken();
/* 1383 */       String organStr = auth.getOrganstr();
/*      */ 
/* 1385 */       String marked = StringUtils.nullObject2String(request.getParameter("marked"));
/* 1386 */       request.setAttribute("marked", marked);
/* 1387 */       String status = "6";
/*      */ 
/* 1389 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 1390 */       request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
/* 1391 */       LinkedHashMap resultsortMap = this.cm.getMapFromCache("risk_resultsort");
/* 1392 */       request.setAttribute("resultsortMap", getOptionsListByMap(resultsortMap, null, true));
/* 1393 */       LinkedHashMap levelMap = this.cm.getMapFromCache("t31_risk_level");
/* 1394 */       request.setAttribute("riskLevelMap", getOptionsListByMap(levelMap, null, true));
/* 1395 */       LinkedHashMap temp_type_map = this.cm.getMapFromCache("temp_type");
/* 1396 */       request.setAttribute("temp_type_map", getOptionsListByMap(temp_type_map, null, true));
/* 1397 */       LinkedHashMap tempcategory_map = this.cm.getMapFromCache("tempcategory");
/* 1398 */       request.setAttribute("tempcategory_map", getOptionsListByMap(tempcategory_map, null, true));
/*      */ 
/* 1400 */       if ("0".equals(newsearchflag)) {
/* 1401 */         if (form.getOrgankey().equals("")) {
/* 1402 */           form.setOrgankey(auth.getT00_user().getOrgankey());
/*      */         }
/* 1404 */         session.removeAttribute("t37_party_result_nextSearchObj");
/*      */       }
/* 1406 */       else if ("1".equals(newsearchflag)) {
/* 1407 */         MyBeanUtils.copyBean2Bean(t37_party_result, form);
/* 1408 */         t37_party_result.setOrganStr(organStr);
/* 1409 */         String statistic_dt_disp = form.getStatistic_dt_disp();
/* 1410 */         String statistic_dt_disp_end = form.getStatistic_dt_disp_end();
/* 1411 */         String modifydate_disp = form.getModifydate_disp();
/* 1412 */         String modifydate_disp_end = form.getModifydate_disp_end();
/* 1413 */         String create_dt_disp = form.getCreate_dt_disp();
/* 1414 */         String create_dt_disp_end = form.getCreate_dt_disp_end();
/* 1415 */         if ((statistic_dt_disp != null) && (!"".equals(statistic_dt_disp))) {
/* 1416 */           t37_party_result.setStatistic_dt(
/* 1417 */             com.ist.util.DateUtils.stringToDateShort(statistic_dt_disp));
/*      */         }
/* 1419 */         if ((statistic_dt_disp_end != null) && 
/* 1420 */           (!"".equals(statistic_dt_disp_end))) {
/* 1421 */           t37_party_result.setStatistic_dt_end(
/* 1422 */             com.ist.util.DateUtils.stringToDateShort(statistic_dt_disp_end));
/*      */         }
/* 1424 */         if ((modifydate_disp != null) && (!"".equals(modifydate_disp))) {
/* 1425 */           t37_party_result.setModifydate(
/* 1426 */             com.ist.util.DateUtils.stringToDateShort(modifydate_disp));
/*      */         }
/* 1428 */         if ((modifydate_disp_end != null) && 
/* 1429 */           (!"".equals(modifydate_disp_end))) {
/* 1430 */           t37_party_result.setModifydate_end(
/* 1431 */             com.ist.util.DateUtils.stringToDateShort(modifydate_disp_end));
/*      */         }
/* 1433 */         if ((create_dt_disp != null) && (!"".equals(create_dt_disp))) {
/* 1434 */           t37_party_result.setCreate_dt(
/* 1435 */             com.ist.util.DateUtils.stringToDateShort(create_dt_disp));
/*      */         }
/* 1437 */         if ((create_dt_disp_end != null) && 
/* 1438 */           (!"".equals(create_dt_disp_end))) {
/* 1439 */           t37_party_result.setCreate_dt_end(
/* 1440 */             com.ist.util.DateUtils.stringToDateShort(create_dt_disp_end));
/*      */         }
/* 1442 */         session.setAttribute("t37_party_result_nextSearchObj", t37_party_result);
/*      */       }
/*      */       else {
/* 1445 */         t37_party_result = (T37_party_result)session.getAttribute("t37_party_result_nextSearchObj");
/* 1446 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */       }
/* 1448 */       if (!"0".equals(newsearchflag)) {
/* 1449 */         t37_party_resultList = t37_party_resultDAO.getT37_party_resultList(this.sqlMap, t37_party_result, getStartRec(intPage), getIntPageSize());
/* 1450 */         int totalRow = t37_party_resultDAO.getT37_party_resultListCount(this.sqlMap, t37_party_result);
/* 1451 */         String url = request.getContextPath() + "/newrisk" + 
/* 1452 */           actionMapping.getPath() + ".do";
/* 1453 */         pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/* 1454 */         MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */       }
/*      */     } catch (Exception e) {
/* 1457 */       e.printStackTrace();
/* 1458 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1459 */         "error.common", e.getMessage()));
/* 1460 */       saveMessages(request, errors);
/* 1461 */       return actionMapping.findForward("failure");
/*      */     }
/* 1463 */     request.setAttribute("t37_party_resultList", t37_party_resultList);
/* 1464 */     request.setAttribute("pageInfo", pageInfo);
/* 1465 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_party_result_BExcel(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1483 */     ActionMessages errors = new ActionMessages();
/* 1484 */     HttpSession session = request.getSession();
/* 1485 */     XMLProperties sysConfig = (XMLProperties)this.context.getBean("sysConfig");
/* 1486 */     ArrayList t37_party_resultList = new ArrayList();
/* 1487 */     ArrayList t37_level_auditList = new ArrayList();
/* 1488 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/* 1489 */     T37_party_result t37_party_result = new T37_party_result();
/* 1490 */     T10_check_custDAO t10_check_custdao = (T10_check_custDAO)this.context.getBean("t10_check_custDAO");
/* 1491 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/* 1492 */     T10_survey_cust t10_survey_cust = new T10_survey_cust();
/* 1493 */     ArrayList exportlist = new ArrayList();
/* 1494 */     Report_SearchObj export_SearchObj = new Report_SearchObj();
/*      */     try {
/* 1496 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1497 */       String[] results = form.getRkeys();
/* 1498 */       String resultKeys = "";
/* 1499 */       for (int i = 0; i < results.length; i++) {
/* 1500 */         String str = results[i];
/* 1501 */         String[] strs = str.split(",");
/* 1502 */         String party_class_cd = strs[2];
/* 1503 */         String party_id = strs[1];
/* 1504 */         String resulekey = strs[0];
/* 1505 */         String organkey = strs[3];
/* 1506 */         t10_survey_cust.setParty_id(party_id);
/* 1507 */         t10_survey_cust.setParty_class_cd(party_class_cd);
/* 1508 */         t37_party_result.setResulekey(resulekey);
/* 1509 */         t37_party_result.setOrgankey(organkey);
/*      */ 
/* 1513 */         t10_survey_cust = t10_check_custdao.getT10_survey_cust_info(this.sqlMap, t10_survey_cust);
/* 1514 */         t10_survey_cust.setParty_class_cd(party_class_cd);
/*      */ 
/* 1516 */         t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*      */ 
/* 1518 */         t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*      */ 
/* 1520 */         HashMap rpdihash = new HashMap();
/* 1521 */         StringBuffer sb_c = new StringBuffer();
/* 1522 */         StringBuffer sb_I = new StringBuffer();
/* 1523 */         rpdihash.put("<#a1#>", t10_survey_cust.getOrgankey());
/* 1524 */         rpdihash.put("<#a2#>", t10_survey_cust.getOrganname());
/* 1525 */         rpdihash.put("<#a3#>", t37_party_result.getResulekey());
/* 1526 */         rpdihash.put("<#a4#>", party_id);
/* 1527 */         rpdihash.put("<#a5#>", t10_survey_cust.getParty_chn_name());
/* 1528 */         rpdihash.put("<#a6#>", (String)clienttypeMap.get(party_class_cd));
/*      */ 
/* 1530 */         if (party_class_cd.equals("C"))
/*      */         {
/* 1532 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1533 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1534 */           sb_c.append("营业执照号");
/* 1535 */           sb_c.append("</td>");
/* 1536 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1537 */           sb_c.append(t10_survey_cust.getBusiness_licence());
/* 1538 */           sb_c.append("</td>");
/* 1539 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1540 */           sb_c.append("营业执照到期日");
/* 1541 */           sb_c.append("</td>");
/* 1542 */           sb_c.append("<td  class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1543 */           sb_c.append(t10_survey_cust.getLicence_end_dt_disp());
/* 1544 */           sb_c.append("</td>");
/* 1545 */           sb_c.append("</tr>");
/*      */ 
/* 1547 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1548 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1549 */           sb_c.append("组织机构代码");
/* 1550 */           sb_c.append("</td>");
/* 1551 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1552 */           sb_c.append(t10_survey_cust.getOrgan_code());
/* 1553 */           sb_c.append("</td>");
/* 1554 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1555 */           sb_c.append("组织机构代码到期日期");
/* 1556 */           sb_c.append("</td>");
/* 1557 */           sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1558 */           sb_c.append(t10_survey_cust.getOrgan_code_end_dt_disp());
/* 1559 */           sb_c.append("</td>");
/* 1560 */           sb_c.append("</tr>");
/*      */ 
/* 1562 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1563 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1564 */           sb_c.append("信用机构代码");
/* 1565 */           sb_c.append("</td>");
/* 1566 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1567 */           sb_c.append(t10_survey_cust.getOrg_credit_no());
/* 1568 */           sb_c.append("</td>");
/* 1569 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1570 */           sb_c.append("信用机构代码到期日期");
/* 1571 */           sb_c.append("<</td>>");
/* 1572 */           sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1573 */           sb_c.append(t10_survey_cust.getOrg_credit_vt_disp());
/* 1574 */           sb_c.append("</td>");
/* 1575 */           sb_c.append("</tr>");
/*      */ 
/* 1577 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1578 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1579 */           sb_c.append("通讯地址");
/* 1580 */           sb_c.append("</td>");
/* 1581 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1582 */           sb_c.append(t10_survey_cust.getAddr1());
/* 1583 */           sb_c.append("<</td>>");
/* 1584 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1585 */           sb_c.append("联系电话");
/* 1586 */           sb_c.append("</td>");
/* 1587 */           sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1588 */           sb_c.append(t10_survey_cust.getTel_no());
/* 1589 */           sb_c.append("</td>");
/* 1590 */           sb_c.append("</tr>");
/*      */ 
/* 1592 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1593 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1594 */           sb_c.append("法人代表证件类型");
/* 1595 */           sb_c.append("</td>");
/* 1596 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1597 */           sb_c.append(t10_survey_cust.getLegal_card_type());
/* 1598 */           sb_c.append("</td>");
/* 1599 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1600 */           sb_c.append("法人代表证件号码");
/* 1601 */           sb_c.append("</td>");
/* 1602 */           sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1603 */           sb_c.append(t10_survey_cust.getLegal_card_no());
/* 1604 */           sb_c.append("</td>");
/* 1605 */           sb_c.append("</tr>");
/*      */ 
/* 1607 */           sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1608 */           sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1609 */           sb_c.append("法人居住地");
/* 1610 */           sb_c.append("</td>");
/* 1611 */           sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1612 */           sb_c.append(t10_survey_cust.getLegal_addr());
/* 1613 */           sb_c.append("</td>");
/* 1614 */           sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1615 */           sb_c.append("法人联系方式");
/* 1616 */           sb_c.append("</td>");
/* 1617 */           sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1618 */           sb_c.append(t10_survey_cust.getLegal_tel());
/* 1619 */           sb_c.append("</td>");
/* 1620 */           sb_c.append("</tr>");
/*      */         }
/*      */         else {
/* 1623 */           sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1624 */           sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1625 */           sb_I.append("客户证件类型");
/* 1626 */           sb_I.append("</td>");
/* 1627 */           sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\"> ");
/* 1628 */           sb_I.append(t10_survey_cust.getCard_type());
/* 1629 */           sb_I.append("</td>");
/* 1630 */           sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1631 */           sb_I.append("证件到期日");
/* 1632 */           sb_I.append("</td>");
/* 1633 */           sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\"> ");
/* 1634 */           sb_I.append(t10_survey_cust.getCard_end_dt_disp());
/* 1635 */           sb_I.append("</td>");
/* 1636 */           sb_I.append("</tr>");
/*      */ 
/* 1638 */           sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1639 */           sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1640 */           sb_I.append("客户证件号");
/* 1641 */           sb_I.append("</td>");
/* 1642 */           sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1643 */           sb_I.append(t10_survey_cust.getCard_no());
/* 1644 */           sb_I.append("</td>");
/* 1645 */           sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1646 */           sb_I.append("客户状态");
/* 1647 */           sb_I.append("</td>");
/* 1648 */           sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1649 */           sb_I.append(t10_survey_cust.getParty_status_cd_disp());
/* 1650 */           sb_I.append("</td>");
/* 1651 */           sb_I.append("</tr>");
/*      */ 
/* 1653 */           sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1654 */           sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1655 */           sb_I.append("客户职业");
/* 1656 */           sb_I.append("</td>");
/* 1657 */           sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1658 */           sb_I.append(t10_survey_cust.getOccupation());
/* 1659 */           sb_I.append("</td>");
/* 1660 */           sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1661 */           sb_I.append("客户国籍");
/* 1662 */           sb_I.append("</td>");
/* 1663 */           sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1664 */           sb_I.append(t10_survey_cust.getCountry_cd());
/* 1665 */           sb_I.append("</td>");
/* 1666 */           sb_I.append("</tr>");
/*      */ 
/* 1668 */           sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1669 */           sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
/* 1670 */           sb_I.append("通讯地址");
/* 1671 */           sb_I.append("</td>");
/* 1672 */           sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1673 */           sb_I.append(t10_survey_cust.getAddr1() == null ? "" : t10_survey_cust.getAddr1());
/* 1674 */           sb_I.append("</td>");
/* 1675 */           sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1676 */           sb_I.append("联系电话");
/* 1677 */           sb_I.append("</td>");
/* 1678 */           sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/* 1679 */           sb_I.append(t10_survey_cust.getTel_no());
/* 1680 */           sb_I.append("</td>");
/* 1681 */           sb_I.append("</tr>");
/*      */ 
/* 1683 */           sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
/* 1684 */           sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\"> ");
/* 1685 */           sb_I.append("工作单位");
/* 1686 */           sb_I.append("</td>");
/* 1687 */           sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
/* 1688 */           sb_I.append(t10_survey_cust.getCompany());
/* 1689 */           sb_I.append("</td>");
/* 1690 */           sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
/* 1691 */           sb_I.append("备忘录");
/* 1692 */           sb_I.append("</td>");
/* 1693 */           sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
/*      */ 
/* 1695 */           sb_I.append("</td>");
/* 1696 */           sb_I.append("</tr>");
/*      */         }
/* 1698 */         rpdihash.put("<#sb_C_Info#>", sb_c.toString());
/* 1699 */         rpdihash.put("<#sb_I_Info#>", sb_I.toString());
/* 1700 */         rpdihash.put("<#a17#>", t37_party_result.getFristappralevel_disp());
/* 1701 */         rpdihash.put("<#a18#>", t37_party_result.getEmendationlevel_disp());
/* 1702 */         rpdihash.put("<#a19#>", t37_party_result.getLevelkey_disp());
/* 1703 */         rpdihash.put("<#a20#>", com.ist.util.DateUtils.getCurrTime().substring(0, 10));
/* 1704 */         rpdihash.put("<#a21#>", com.ist.util.DateUtils.getCurrTime().substring(0, 10));
/*      */ 
/* 1706 */         String downloadname = "";
/* 1707 */         ArrayList list = new ArrayList();
/* 1708 */         StringBuffer sb = new StringBuffer();
/* 1709 */         for (int j = 0; j < t37_level_auditList.size(); j++) {
/* 1710 */           T37_level_audit t37_level_audit = (T37_level_audit)t37_level_auditList.get(j);
/*      */ 
/* 1712 */           sb.append("<tr>");
/* 1713 */           sb.append("<td class=\"xl29\" style=\"height:14.25pt\">");
/* 1714 */           sb.append(t37_level_audit.getLast_upd_dt_disp());
/* 1715 */           sb.append("</td>");
/*      */ 
/* 1717 */           sb.append("<td colspan=\"6\" class=\"xl56\" style=\"border-right:.5pt solid black;border-left:none\">");
/* 1718 */           sb.append(t37_level_audit.getLevel_after_adjust());
/* 1719 */           sb.append("</td>");
/*      */ 
/* 1721 */           sb.append("<td colspan=\"3\" class=\"xl59\" style=\"border-right:.5pt solid black;border-left:none\">");
/* 1722 */           sb.append(t37_level_audit.getAdjust_reason());
/* 1723 */           sb.append("</td>");
/* 1724 */           sb.append("</tr>");
/*      */         }
/*      */ 
/* 1727 */         rpdihash.put("<#level_auditList#>", sb.toString());
/*      */ 
/* 1729 */         downloadname = t37_party_result.getResulekey();
/* 1730 */         request.setAttribute("downloadname", downloadname);
/*      */ 
/* 1732 */         export_SearchObj.setHash(rpdihash);
/* 1733 */         export_SearchObj.setTargetFileName(downloadname);
/*      */ 
/* 1735 */         Template template = (Template)this.context.getBean("template");
/* 1736 */         export_SearchObj.setTemplateFileName("t37_party_result_Excel.htm");
/* 1737 */         export_SearchObj.setTempPath(party_id);
/*      */ 
/* 1739 */         String[] tempPath = template.export_risk_snx(export_SearchObj);
/* 1740 */         for (int l = 0; l < tempPath.length; l++) {
/* 1741 */           exportlist.add(tempPath[l]);
/*      */         }
/*      */       }
/* 1744 */       ZipUtils zipUtils = new ZipUtils();
/*      */ 
/* 1746 */       String targetRootPath = sysConfig.getProperty("data.import");
/* 1747 */       String zipName = File.separator + 
/* 1748 */         "template" + 
/* 1749 */         File.separator + 
/* 1750 */         com.ist.util.DateUtils.getDate10to8(
/* 1751 */         com.ist.util.DateUtils.dateToStringShort(com.ist.util.DateUtils.getCurrDateTime())) + 
/* 1752 */         ".zip";
/* 1753 */       String zipTempPathName = targetRootPath + zipName;
/* 1754 */       zipUtils.zip(zipTempPathName, exportlist, "");
/* 1755 */       File zipFile = new File(zipTempPathName);
/* 1756 */       this.logger.debug("数据包的大小：" + zipFile.length());
/* 1757 */       this.logger.debug("数据包的大小：" + zipTempPathName);
/* 1758 */       request.setAttribute("zipTempPathName", zipTempPathName);
/* 1759 */       FileInputStream fileIn = new FileInputStream(zipTempPathName);
/* 1760 */       byte[] b = new byte[1024];
/* 1761 */       String m_contentDisposition = "attachment;";
/* 1762 */       response.setHeader("Content-Disposition", 
/* 1763 */         String.valueOf(new StringBuffer(
/* 1764 */         String.valueOf(m_contentDisposition)).append(
/* 1765 */         " filename=").append(
/* 1766 */         com.ist.util.DateUtils.dateToStringShort(
/* 1767 */         com.ist.util.DateUtils.getCurrDateTime())).append(".zip")));
/* 1768 */       OutputStream out = response.getOutputStream();
/* 1769 */       while (fileIn.read(b, 0, 1024) > 0) {
/* 1770 */         out.write(b);
/*      */       }
/* 1772 */       return null;
/*      */     } catch (Exception e) {
/* 1774 */       e.printStackTrace();
/* 1775 */       this.logger.error(e);
/*      */     }
/* 1777 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_party_result_SExcel(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1795 */     ActionMessages errors = new ActionMessages();
/* 1796 */     HttpSession session = request.getSession();
/* 1797 */     ArrayList t37_party_resultList = new ArrayList();
/* 1798 */     ArrayList t37_level_auditList = new ArrayList();
/* 1799 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/* 1800 */     T37_party_result t37_party_result = new T37_party_result();
/* 1801 */     T10_check_custDAO t10_check_custdao = (T10_check_custDAO)this.context.getBean("t10_check_custDAO");
/* 1802 */     T10_survey_cust t10_survey_cust = new T10_survey_cust();
/* 1803 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
/*      */     try
/*      */     {
/* 1806 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/*      */ 
/* 1808 */       String party_class_cd = request.getParameter("party_class_cd");
/* 1809 */       String party_id = request.getParameter("party_id");
/* 1810 */       String resulekey = request.getParameter("resulekey");
/* 1811 */       t10_survey_cust.setParty_id(party_id);
/* 1812 */       t10_survey_cust.setParty_class_cd(party_class_cd);
/* 1813 */       t37_party_result.setResulekey(resulekey);
/* 1814 */       t37_party_result.setOrgankey(form.getOrgankey());
/*      */ 
/* 1817 */       t10_survey_cust = t10_check_custdao.getT10_survey_cust_info(this.sqlMap, t10_survey_cust);
/* 1818 */       t10_survey_cust.setParty_class_cd(party_class_cd);
/* 1819 */       t10_survey_cust.setParty_class_cd_disp((String)clienttypeMap.get(party_class_cd));
/*      */ 
/* 1821 */       t37_level_auditList = t37_party_resultDAO.getT37_level_auditList(this.sqlMap, t37_party_result);
/*      */ 
/* 1823 */       t37_party_result = t37_party_resultDAO.getT37_party_resultDisp(this.sqlMap, t37_party_result);
/*      */ 
/* 1827 */       String downloadname = "";
/*      */ 
/* 1829 */       downloadname = t37_party_result.getResulekey();
/* 1830 */       request.setAttribute("downloadname", downloadname);
/*      */ 
/* 1832 */       String curr_time = com.ist.util.DateUtils.getCurrTime().substring(0, 10);
/* 1833 */       request.setAttribute("curr_time", curr_time);
/*      */     } catch (Exception e) {
/* 1835 */       e.printStackTrace();
/* 1836 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1837 */         "error.common", e.getMessage()));
/* 1838 */       saveMessages(request, errors);
/* 1839 */       return actionMapping.findForward("failure");
/*      */     }
/* 1841 */     request.setAttribute("t10_survey_cust", t10_survey_cust);
/* 1842 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/* 1843 */     request.setAttribute("t37_party_result", t37_party_result);
/* 1844 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performReturnT37_party_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1851 */     ActionMessages errors = new ActionMessages();
/* 1852 */     HttpSession session = request.getSession();
/* 1853 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/* 1854 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/* 1856 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1857 */       String rkeys = StringUtils.nullObject2String(request.getParameter("rkeys"));
/* 1858 */       String organkeys = StringUtils.nullObject2String(request.getParameter("organkeys"));
/* 1859 */       String[] resultKeys = rkeys.split(",");
/* 1860 */       String[] orgKeys = organkeys.split(",");
/* 1861 */       String resultKey = "";
/* 1862 */       String organkey_s = "";
/* 1863 */       for (int i = 0; i < resultKeys.length; i++)
/*      */       {
/* 1865 */         resultKey = resultKey + ",'" + resultKeys[i] + "'";
/*      */       }
/* 1867 */       for (int i = 0; i < orgKeys.length; i++)
/*      */       {
/* 1869 */         organkey_s = organkey_s + ",'" + orgKeys[i] + "'";
/*      */       }
/*      */ 
/* 1872 */       if (resultKey.length() > 0) {
/* 1873 */         resultKey = resultKey.substring(1);
/*      */       }
/* 1875 */       if (organkey_s.length() > 0) {
/* 1876 */         organkey_s = organkey_s.substring(1);
/*      */       }
/* 1878 */       t37_party_result.setResulekey(resultKey);
/* 1879 */       t37_party_result.setOrgankey_s(organkey_s);
/*      */ 
/* 1881 */       String status = StringUtils.nullObject2String(request.getParameter("status"));
/*      */ 
/* 1884 */       t37_party_result.setStatus_cd(status);
/* 1885 */       t37_party_result.setCurr_post("P2001");
/* 1886 */       MyBeanUtils.copyBean2Bean(form, t37_party_result);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/* 1890 */       e.printStackTrace();
/* 1891 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1892 */         "error.common", e.getMessage()));
/* 1893 */       saveMessages(request, errors);
/* 1894 */       return actionMapping.findForward("failure");
/*      */     }
/* 1896 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performReturnT37_party_resultDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1913 */     ActionMessages errors = new ActionMessages();
/* 1914 */     HttpSession session = request.getSession();
/* 1915 */     T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)this.context.getBean("t37_party_resultDAO");
/* 1916 */     T37_party_result t37_party_result = new T37_party_result();
/*      */     try {
/* 1918 */       T37_party_resultActionForm form = (T37_party_resultActionForm)actionForm;
/* 1919 */       MyBeanUtils.copyBean2Bean(t37_party_result, form);
/*      */ 
/* 1921 */       rows = t37_party_resultDAO.modifyT37_party_resultStatus(this.sqlMap, t37_party_result);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*      */       int rows;
/* 1925 */       e.printStackTrace();
/* 1926 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1927 */         "error.common", e.getMessage()));
/* 1928 */       saveMessages(request, errors);
/* 1929 */       return actionMapping.findForward("failure");
/*      */     }
/* 1931 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performChangeLevelByLastscore(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/* 1936 */     ActionMessages errors = new ActionMessages();
/* 1937 */     HttpSession session = request.getSession();
/*      */ 
/* 1939 */     String lastscore = StringUtils.nullObject2String(request.getParameter("lastscore"));
/* 1940 */     double score = Double.parseDouble(String.valueOf(lastscore));
/* 1941 */     String emendationlevel = "";
/*      */     try {
/* 1943 */       ArrayList t31_risk_levelList = (ArrayList)this.sqlMap.queryForList("t31_risk_levelList");
/* 1944 */       for (int i = 0; i < t31_risk_levelList.size(); i++) {
/* 1945 */         T31_risk_level t31_risk_level = (T31_risk_level)t31_risk_levelList.get(i);
/* 1946 */         double min = t31_risk_level.getLevelmin_d().doubleValue();
/* 1947 */         double max = t31_risk_level.getLevelmax_d().doubleValue();
/*      */ 
/* 1949 */         if ((t31_risk_level.getMinisclosed().equals("0")) && (t31_risk_level.getMaxisclosed().equals("0")) && 
/* 1950 */           (min < score) && (score < max)) {
/* 1951 */           emendationlevel = t31_risk_level.getLevelkey();
/*      */         }
/*      */ 
/* 1954 */         if ((t31_risk_level.getMinisclosed().equals("1")) && (t31_risk_level.getMaxisclosed().equals("1")) && 
/* 1955 */           (min <= score) && (score <= max)) {
/* 1956 */           emendationlevel = t31_risk_level.getLevelkey();
/*      */         }
/* 1958 */         if ((t31_risk_level.getMinisclosed().equals("0")) && (t31_risk_level.getMaxisclosed().equals("1")) && 
/* 1959 */           (min < score) && (score <= max)) {
/* 1960 */           emendationlevel = t31_risk_level.getLevelkey();
/*      */         }
/* 1962 */         if ((t31_risk_level.getMinisclosed().equals("1")) && (t31_risk_level.getMaxisclosed().equals("0")) && 
/* 1963 */           (min <= score) && (score < max)) {
/* 1964 */           emendationlevel = t31_risk_level.getLevelkey();
/*      */         }
/*      */       }
/*      */ 
/* 1968 */       request.setAttribute("emendationlevel", emendationlevel);
/* 1969 */       response.getWriter().print(emendationlevel);
/* 1970 */       response.getWriter().close();
/*      */     } catch (Exception e) {
/* 1972 */       e.printStackTrace();
/* 1973 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/* 1974 */         "error.common", e.getMessage()));
/* 1975 */       saveMessages(request, errors);
/* 1976 */       return actionMapping.findForward("failure");
/*      */     }
/* 1978 */     return null;
/*      */   }
/*      */ 
/*      */   private double reCal(String root, String js_type, List<T37_appr_bas_rslt> reCalList)
/*      */   {
/* 1985 */     double sumscore = 0.0D; double sumbase_occ = 0.0D; double max = 0.0D; double min = 5.0D;
/*      */ 
/* 1987 */     for (T37_appr_bas_rslt rslt : reCalList)
/*      */     {
/* 1990 */       if ((root.equals(rslt.getElementkey())) && 
/* 1991 */         ("1".equals(rslt.getIs_last())))
/*      */       {
/* 1993 */         return rslt.getScore_d();
/*      */       }
/*      */ 
/* 1997 */       if (root.equals(rslt.getUpelementkey()))
/*      */       {
/* 1999 */         String elementkey = rslt.getElementkey();
/*      */ 
/* 2001 */         double score = 0.0D;
/* 2002 */         double base_occ = rslt.getBase_occ_d();
/*      */ 
/* 2005 */         score = reCal(elementkey, rslt.getJs_type(), reCalList);
/*      */ 
/* 2008 */         if (js_type.equals("1"))
/*      */         {
/* 2011 */           if (score == 0.0D)
/*      */           {
/* 2013 */             score = rslt.getScore_d();
/*      */           }
/* 2015 */           if (score != 0.0D)
/*      */           {
/* 2017 */             sumscore += score * base_occ;
/*      */ 
/* 2019 */             sumbase_occ += base_occ;
/*      */           }
/*      */ 
/*      */         }
/* 2025 */         else if (js_type.equals("2"))
/*      */         {
/* 2027 */           max = score > max ? score : max;
/*      */         }
/* 2029 */         else if (js_type.equals("3"))
/*      */         {
/* 2031 */           min = score < min ? score : min;
/*      */         }
/*      */ 
/*      */       }
/*      */ 
/*      */     }
/*      */ 
/* 2040 */     if (js_type.equals("1")) {
/* 2041 */       if (sumbase_occ != 0.0D) {
/* 2042 */         return sumscore / sumbase_occ;
/*      */       }
/* 2044 */       return 0.0D;
/*      */     }
/* 2046 */     if (js_type.equals("2"))
/* 2047 */       return max;
/* 2048 */     if (js_type.equals("3")) {
/* 2049 */       return min;
/*      */     }
/* 2051 */     return 0.0D;
/*      */   }
/*      */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_party_resultAction
 * JD-Core Version:    0.6.2
 */