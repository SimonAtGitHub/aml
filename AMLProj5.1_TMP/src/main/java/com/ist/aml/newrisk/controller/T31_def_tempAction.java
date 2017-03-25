/*      */ package com.ist.aml.newrisk.controller;
/*      */ 
/*      */ import com.ibatis.sqlmap.client.SqlMapClient;
/*      */ import com.ist.aml.newrisk.dao.T31_def_elementDAO;
/*      */ import com.ist.aml.newrisk.dao.T31_def_gsDAO;
/*      */ import com.ist.aml.newrisk.dao.T31_def_tempDAO;
/*      */ import com.ist.aml.newrisk.dto.T31_def_element;
/*      */ import com.ist.aml.newrisk.dto.T31_def_temp;
/*      */ import com.ist.common.AuthBean;
/*      */ import com.ist.common.Authorization;
/*      */ import com.ist.common.MyBeanUtils;
/*      */ import com.ist.common.base.BaseAction;
/*      */ import com.ist.common.jcs.CatchManager;
/*      */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*      */ import com.ist.util.DateUtils;
/*      */ import com.ist.util.StringUtils;
/*      */ import java.util.ArrayList;
/*      */ import java.util.LinkedHashMap;
/*      */ import javax.servlet.http.HttpServletRequest;
/*      */ import javax.servlet.http.HttpServletResponse;
/*      */ import javax.servlet.http.HttpSession;
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
/*      */ public class T31_def_tempAction extends BaseAction
/*      */ {
/*      */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*   57 */     ActionForward myforward = null;
/*   58 */     String myaction = mapping.getParameter();
/*      */ 
/*   60 */     myforward = preExecute(mapping, form, request, response);
/*      */ 
/*   62 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*   63 */       return myforward;
/*      */     }
/*   65 */     if ("getT31_def_tempList".equalsIgnoreCase(myaction)) {
/*   66 */       myforward = performGetT31_def_tempList(mapping, form, request, 
/*   67 */         response);
/*      */     }
/*   70 */     else if ("addT31_def_temp".equalsIgnoreCase(myaction)) {
/*   71 */       myforward = performAddT31_def_temp(mapping, form, request, response);
/*      */     }
/*   74 */     else if ("addT31_def_tempDo".equalsIgnoreCase(myaction)) {
/*   75 */       myforward = performAddT31_def_tempDo(mapping, form, request, 
/*   76 */         response);
/*      */     }
/*   79 */     else if ("modifyT31_def_temp".equalsIgnoreCase(myaction)) {
/*   80 */       myforward = performModifyT31_def_temp(mapping, form, request, 
/*   81 */         response);
/*      */     }
/*   84 */     else if ("modifyT31_def_tempDo".equalsIgnoreCase(myaction)) {
/*   85 */       myforward = performModifyT31_def_tempDo(mapping, form, request, 
/*   86 */         response);
/*      */     }
/*   89 */     else if ("deleteT31_def_tempDo".equalsIgnoreCase(myaction)) {
/*   90 */       myforward = performDeleteT31_def_tempDo(mapping, form, request, 
/*   91 */         response);
/*      */     }
/*   94 */     else if ("getT31_def_tempDisp".equalsIgnoreCase(myaction)) {
/*   95 */       myforward = performGetT31_def_tempDisp(mapping, form, request, 
/*   96 */         response);
/*      */     }
/*   99 */     else if ("modifyT31_def_temp_main".equalsIgnoreCase(myaction)) {
/*  100 */       myforward = performModifyT31_def_temp_main(mapping, form, request, 
/*  101 */         response);
/*      */     }
/*  104 */     else if ("getT31_def_temp_granList".equalsIgnoreCase(myaction)) {
/*  105 */       myforward = performGetT31_def_temp_granList(mapping, form, request, 
/*  106 */         response);
/*      */     }
/*  109 */     else if ("addT31_def_temp_gran".equalsIgnoreCase(myaction)) {
/*  110 */       myforward = performAddT31_def_temp_gran(mapping, form, request, 
/*  111 */         response);
/*      */     }
/*  113 */     else if ("addT31_def_temp_granDo".equalsIgnoreCase(myaction)) {
/*  114 */       myforward = performAddT31_def_temp_granDo(mapping, form, request, 
/*  115 */         response);
/*      */     }
/*  118 */     else if ("modT31_def_temp_gran".equalsIgnoreCase(myaction)) {
/*  119 */       myforward = performModT31_def_temp_gran(mapping, form, request, 
/*  120 */         response);
/*      */     }
/*  122 */     else if ("modT31_def_temp_granDo".equalsIgnoreCase(myaction)) {
/*  123 */       myforward = performModT31_def_temp_granDo(mapping, form, request, 
/*  124 */         response);
/*      */     }
/*  127 */     else if ("delT31_def_temp_gran".equalsIgnoreCase(myaction)) {
/*  128 */       myforward = performDelT31_def_temp_gran(mapping, form, request, 
/*  129 */         response);
/*      */     }
/*  132 */     else if ("getT31_def_temp_sqlList".equalsIgnoreCase(myaction)) {
/*  133 */       myforward = performGetT31_def_temp_sqlList(mapping, form, request, 
/*  134 */         response);
/*      */     }
/*  140 */     else if ("getT31_def_tempDisp_gs".equalsIgnoreCase(myaction)) {
/*  141 */       myforward = performGetT31_def_tempDisp_gs(mapping, form, request, 
/*  142 */         response);
/*      */     }
/*  145 */     else if ("changeT31_def_tempFlag".equalsIgnoreCase(myaction)) {
/*  146 */       myforward = performChangeT31_def_tempFlag(mapping, form, request, 
/*  147 */         response);
/*      */     }
/*  150 */     else if ("copyT31_def_temp".equalsIgnoreCase(myaction)) {
/*  151 */       myforward = performCopyT31_def_temp(mapping, form, request, 
/*  152 */         response);
/*      */     }
/*  154 */     return myforward;
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_def_tempList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  173 */     ActionMessages errors = new ActionMessages();
/*  174 */     HttpSession session = request.getSession();
/*  175 */     ArrayList t31_def_tempList = null;
/*      */ 
/*  177 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  178 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try
/*      */     {
/*  181 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/*  182 */       request.setAttribute("clienttypeMap", getOptionsListByMap(
/*  183 */         clienttypeMap, null, true));
/*      */ 
/*  185 */       LinkedHashMap tflagMap = this.cm.getMapFromCache("flag");
/*  186 */       request.setAttribute("tflagMap", getOptionsListByMap(
/*  187 */         tflagMap, null, true));
/*      */ 
/*  189 */       LinkedHashMap granularityMap = this.cm.getMapFromCache("risk_granularitys");
/*  190 */       request.setAttribute("granularityMap", getOptionsListByMap(
/*  191 */         granularityMap, null, true));
/*      */ 
/*  193 */       LinkedHashMap tcategoryMap = this.cm.getMapFromCache("template_category");
/*  194 */       request.setAttribute("tcategoryMap", getOptionsListByMap(
/*  195 */         tcategoryMap, null, true));
/*      */ 
/*  197 */       LinkedHashMap coverMap = this.cm.getMapFromCache("yesNo");
/*  198 */       request.setAttribute("coverMap", getOptionsListByMap(
/*  199 */         coverMap, null, true));
/*      */ 
/*  205 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  206 */       form.setTemplatename(form.getTemplatename_s());
/*      */ 
/*  208 */       String temptype = StringUtils.nullObject2String(request
/*  209 */         .getParameter("temptype"));
/*  210 */       request.setAttribute("temptype", temptype);
/*      */ 
/*  212 */       AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  213 */       Authorization auth = authBean.getAuthToken();
/*  214 */       t31_def_temp.setOrgankeystr(auth.getOrganstr());
/*      */ 
/*  216 */       String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/*  217 */       t31_def_temp = (T31_def_temp)getSearchObject(t31_def_temp, 
/*  218 */         request, form, "getT31_def_tempListCount", url);
/*  219 */       if (t31_def_temp.getNewsearchflag().equals("1"))
/*      */       {
/*  222 */         saveSearchObject(t31_def_temp, request);
/*      */       }
/*      */       else
/*  225 */         MyBeanUtils.copyBean2Bean(form, t31_def_temp);
/*  226 */       t31_def_tempList = t31_def_tempDAO.getT31_def_tempList(this.sqlMap, 
/*  227 */         t31_def_temp, getStartRec(t31_def_temp.getIntPage()), 
/*  228 */         getIntPageSize());
/*      */     }
/*      */     catch (Exception e) {
/*  231 */       e.printStackTrace();
/*  232 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  233 */         "error.common", e.getMessage()));
/*  234 */       saveMessages(request, errors);
/*  235 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  238 */     request.setAttribute("t31_def_tempList", t31_def_tempList);
/*      */ 
/*  240 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT31_def_temp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  258 */     ActionMessages errors = new ActionMessages();
/*      */ 
/*  261 */     LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/*  262 */     request.setAttribute("clienttypeMap", getOptionsListByMap(
/*  263 */       clienttypeMap, null, true));
/*      */ 
/*  265 */     LinkedHashMap temptypeMap = this.cm.getMapFromCache("temptype");
/*  266 */     request.setAttribute("temptypeMap", getOptionsListByMap(
/*  267 */       temptypeMap, null, true));
/*      */ 
/*  269 */     LinkedHashMap tagMap = this.cm.getMapFromCache("yesNo");
/*  270 */     request.setAttribute("tagMap", getOptionsListByMap(
/*  271 */       tagMap, null, true));
/*      */ 
/*  273 */     LinkedHashMap granularityMap = this.cm.getMapFromCache("risk_granularitys");
/*  274 */     request.setAttribute("granularityMap", getOptionsListByMap(
/*  275 */       granularityMap, null, true));
/*      */ 
/*  277 */     LinkedHashMap tcategoryMap = this.cm.getMapFromCache("template_category");
/*  278 */     request.setAttribute("tcategoryMap", getOptionsListByMap(
/*  279 */       tcategoryMap, null, true));
/*      */ 
/*  281 */     LinkedHashMap coverMap = this.cm.getMapFromCache("yesNo");
/*  282 */     request.setAttribute("coverMap", getOptionsListByMap(
/*  283 */       coverMap, null, true));
/*      */ 
/*  289 */     return actionMapping.findForward("success"); } 
/*      */   // ERROR //
/*      */   public ActionForward performAddT31_def_tempDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) { // Byte code:
/*      */     //   0: new 147	org/apache/struts/action/ActionMessages
/*      */     //   3: dup
/*      */     //   4: invokespecial 149	org/apache/struts/action/ActionMessages:<init>	()V
/*      */     //   7: astore 5
/*      */     //   9: aload_3
/*      */     //   10: invokeinterface 150 1 0
/*      */     //   15: astore 6
/*      */     //   17: aload 6
/*      */     //   19: ldc 228
/*      */     //   21: invokeinterface 230 2 0
/*      */     //   26: checkcast 233	com/ist/common/AuthBean
/*      */     //   29: astore 7
/*      */     //   31: aload 7
/*      */     //   33: invokevirtual 235	com/ist/common/AuthBean:getAuthToken	()Lcom/ist/common/Authorization;
/*      */     //   36: astore 8
/*      */     //   38: aload_0
/*      */     //   39: getfield 154	com/ist/aml/newrisk/controller/T31_def_tempAction:context	Lorg/springframework/context/ApplicationContext;
/*      */     //   42: ldc 158
/*      */     //   44: invokeinterface 160 2 0
/*      */     //   49: checkcast 165	com/ist/aml/newrisk/dao/T31_def_tempDAO
/*      */     //   52: astore 9
/*      */     //   54: new 167	com/ist/aml/newrisk/dto/T31_def_temp
/*      */     //   57: dup
/*      */     //   58: invokespecial 169	com/ist/aml/newrisk/dto/T31_def_temp:<init>	()V
/*      */     //   61: astore 10
/*      */     //   63: aload_2
/*      */     //   64: checkcast 208	com/ist/aml/newrisk/controller/T31_def_tempActionForm
/*      */     //   67: astore 11
/*      */     //   69: new 247	java/lang/StringBuilder
/*      */     //   72: dup
/*      */     //   73: ldc_w 366
/*      */     //   76: invokespecial 255	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/*      */     //   79: aload_0
/*      */     //   80: ldc_w 368
/*      */     //   83: invokevirtual 370	com/ist/aml/newrisk/controller/T31_def_tempAction:getSequenceNextVal	(Ljava/lang/String;)Ljava/lang/String;
/*      */     //   86: invokevirtual 259	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*      */     //   89: invokevirtual 268	java/lang/StringBuilder:toString	()Ljava/lang/String;
/*      */     //   92: astore 12
/*      */     //   94: aload 11
/*      */     //   96: aload 12
/*      */     //   98: invokevirtual 373	com/ist/aml/newrisk/controller/T31_def_tempActionForm:setTemplatekey	(Ljava/lang/String;)V
/*      */     //   101: aload 10
/*      */     //   103: aload 11
/*      */     //   105: invokestatic 376	org/apache/commons/beanutils/PropertyUtils:copyProperties	(Ljava/lang/Object;Ljava/lang/Object;)V
/*      */     //   108: aload 10
/*      */     //   110: aload 12
/*      */     //   112: invokevirtual 381	com/ist/aml/newrisk/dto/T31_def_temp:setTemplatekey	(Ljava/lang/String;)V
/*      */     //   115: aload 10
/*      */     //   117: ldc_w 382
/*      */     //   120: invokevirtual 384	com/ist/aml/newrisk/dto/T31_def_temp:setFlag	(Ljava/lang/String;)V
/*      */     //   123: aload 10
/*      */     //   125: ldc_w 382
/*      */     //   128: invokevirtual 387	com/ist/aml/newrisk/dto/T31_def_temp:setIs_build	(Ljava/lang/String;)V
/*      */     //   131: aload 10
/*      */     //   133: aload 8
/*      */     //   135: invokevirtual 390	com/ist/common/Authorization:getT00_user	()Lcom/ist/impfile/bmp/platform/dto/T00_user;
/*      */     //   138: invokevirtual 394	com/ist/impfile/bmp/platform/dto/T00_user:getUsername	()Ljava/lang/String;
/*      */     //   141: invokevirtual 399	com/ist/aml/newrisk/dto/T31_def_temp:setCreate_user	(Ljava/lang/String;)V
/*      */     //   144: aload 10
/*      */     //   146: aload 8
/*      */     //   148: invokevirtual 390	com/ist/common/Authorization:getT00_user	()Lcom/ist/impfile/bmp/platform/dto/T00_user;
/*      */     //   151: invokevirtual 402	com/ist/impfile/bmp/platform/dto/T00_user:getOrgankey	()Ljava/lang/String;
/*      */     //   154: invokevirtual 405	com/ist/aml/newrisk/dto/T31_def_temp:setCreate_org	(Ljava/lang/String;)V
/*      */     //   157: aload 10
/*      */     //   159: invokestatic 408	com/ist/util/DateUtils:getCurrDateTime	()Ljava/util/Date;
/*      */     //   162: invokestatic 414	com/ist/util/DateUtils:dateToStringShort	(Ljava/util/Date;)Ljava/lang/String;
/*      */     //   165: invokevirtual 418	com/ist/aml/newrisk/dto/T31_def_temp:setCreate_dt	(Ljava/lang/String;)V
/*      */     //   168: aload 10
/*      */     //   170: aload 8
/*      */     //   172: invokevirtual 390	com/ist/common/Authorization:getT00_user	()Lcom/ist/impfile/bmp/platform/dto/T00_user;
/*      */     //   175: invokevirtual 394	com/ist/impfile/bmp/platform/dto/T00_user:getUsername	()Ljava/lang/String;
/*      */     //   178: invokevirtual 421	com/ist/aml/newrisk/dto/T31_def_temp:setModify_user	(Ljava/lang/String;)V
/*      */     //   181: aload 10
/*      */     //   183: invokestatic 408	com/ist/util/DateUtils:getCurrDateTime	()Ljava/util/Date;
/*      */     //   186: invokestatic 414	com/ist/util/DateUtils:dateToStringShort	(Ljava/util/Date;)Ljava/lang/String;
/*      */     //   189: invokevirtual 424	com/ist/aml/newrisk/dto/T31_def_temp:setModify_dt	(Ljava/lang/String;)V
/*      */     //   192: aload 11
/*      */     //   194: invokevirtual 427	com/ist/aml/newrisk/controller/T31_def_tempActionForm:getCalculateseq_str	()Ljava/lang/String;
/*      */     //   197: astore 13
/*      */     //   199: aload 13
/*      */     //   201: ldc_w 430
/*      */     //   204: invokevirtual 35	java/lang/String:equals	(Ljava/lang/Object;)Z
/*      */     //   207: ifne +8 -> 215
/*      */     //   210: aload 13
/*      */     //   212: ifnonnull +23 -> 235
/*      */     //   215: aload 10
/*      */     //   217: ldc_w 280
/*      */     //   220: invokestatic 432	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
/*      */     //   223: invokevirtual 437	java/lang/Integer:intValue	()I
/*      */     //   226: invokestatic 440	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
/*      */     //   229: invokevirtual 443	com/ist/aml/newrisk/dto/T31_def_temp:setCalculateseq	(Ljava/lang/Integer;)V
/*      */     //   232: goto +16 -> 248
/*      */     //   235: aload 10
/*      */     //   237: aload 13
/*      */     //   239: invokestatic 447	java/lang/Integer:parseInt	(Ljava/lang/String;)I
/*      */     //   242: invokestatic 440	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
/*      */     //   245: invokevirtual 443	com/ist/aml/newrisk/dto/T31_def_temp:setCalculateseq	(Ljava/lang/Integer;)V
/*      */     //   248: aload_0
/*      */     //   249: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   252: invokeinterface 451 1 0
/*      */     //   257: aload_0
/*      */     //   258: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   261: invokeinterface 456 1 0
/*      */     //   266: aload 9
/*      */     //   268: aload_0
/*      */     //   269: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   272: aload 10
/*      */     //   274: invokevirtual 459	com/ist/aml/newrisk/dao/T31_def_tempDAO:insertT31_def_temp	(Lcom/ibatis/sqlmap/client/SqlMapClient;Lcom/ist/aml/newrisk/dto/T31_def_temp;)I
/*      */     //   277: istore 14
/*      */     //   279: ldc_w 280
/*      */     //   282: aload 10
/*      */     //   284: invokevirtual 463	com/ist/aml/newrisk/dto/T31_def_temp:getTemptype	()Ljava/lang/String;
/*      */     //   287: invokevirtual 35	java/lang/String:equals	(Ljava/lang/Object;)Z
/*      */     //   290: ifeq +118 -> 408
/*      */     //   293: aload_0
/*      */     //   294: getfield 154	com/ist/aml/newrisk/controller/T31_def_tempAction:context	Lorg/springframework/context/ApplicationContext;
/*      */     //   297: ldc_w 466
/*      */     //   300: invokeinterface 160 2 0
/*      */     //   305: checkcast 468	com/ist/aml/newrisk/dao/T31_def_elementDAO
/*      */     //   308: astore 15
/*      */     //   310: new 470	com/ist/aml/newrisk/dto/T31_def_element
/*      */     //   313: dup
/*      */     //   314: invokespecial 472	com/ist/aml/newrisk/dto/T31_def_element:<init>	()V
/*      */     //   317: astore 16
/*      */     //   319: aload 16
/*      */     //   321: new 247	java/lang/StringBuilder
/*      */     //   324: dup
/*      */     //   325: ldc_w 473
/*      */     //   328: invokespecial 255	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
/*      */     //   331: aload_0
/*      */     //   332: ldc_w 475
/*      */     //   335: invokevirtual 370	com/ist/aml/newrisk/controller/T31_def_tempAction:getSequenceNextVal	(Ljava/lang/String;)Ljava/lang/String;
/*      */     //   338: invokevirtual 259	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
/*      */     //   341: invokevirtual 268	java/lang/StringBuilder:toString	()Ljava/lang/String;
/*      */     //   344: invokevirtual 477	com/ist/aml/newrisk/dto/T31_def_element:setElementkey	(Ljava/lang/String;)V
/*      */     //   347: aload 16
/*      */     //   349: aload 12
/*      */     //   351: invokevirtual 480	com/ist/aml/newrisk/dto/T31_def_element:setTemplatekey	(Ljava/lang/String;)V
/*      */     //   354: aload 16
/*      */     //   356: aload 11
/*      */     //   358: invokevirtual 481	com/ist/aml/newrisk/controller/T31_def_tempActionForm:getTemplatename	()Ljava/lang/String;
/*      */     //   361: invokevirtual 484	com/ist/aml/newrisk/dto/T31_def_element:setElementname	(Ljava/lang/String;)V
/*      */     //   364: aload 16
/*      */     //   366: ldc_w 382
/*      */     //   369: invokevirtual 487	com/ist/aml/newrisk/dto/T31_def_element:setTreelaye	(Ljava/lang/String;)V
/*      */     //   372: aload 16
/*      */     //   374: ldc_w 490
/*      */     //   377: invokevirtual 492	com/ist/aml/newrisk/dto/T31_def_element:setUpelementkey	(Ljava/lang/String;)V
/*      */     //   380: aload 16
/*      */     //   382: ldc2_w 495
/*      */     //   385: invokevirtual 497	com/ist/aml/newrisk/dto/T31_def_element:setBase_occ_d	(D)V
/*      */     //   388: aload 16
/*      */     //   390: ldc_w 382
/*      */     //   393: invokevirtual 501	com/ist/aml/newrisk/dto/T31_def_element:setIs_last	(Ljava/lang/String;)V
/*      */     //   396: aload 15
/*      */     //   398: aload_0
/*      */     //   399: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   402: aload 16
/*      */     //   404: invokevirtual 504	com/ist/aml/newrisk/dao/T31_def_elementDAO:insertT31_def_element	(Lcom/ibatis/sqlmap/client/SqlMapClient;Lcom/ist/aml/newrisk/dto/T31_def_element;)I
/*      */     //   407: pop
/*      */     //   408: aload_0
/*      */     //   409: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   412: invokeinterface 508 1 0
/*      */     //   417: iload 14
/*      */     //   419: ifgt +106 -> 525
/*      */     //   422: new 311	java/lang/Exception
/*      */     //   425: dup
/*      */     //   426: ldc_w 511
/*      */     //   429: invokespecial 513	java/lang/Exception:<init>	(Ljava/lang/String;)V
/*      */     //   432: athrow
/*      */     //   433: astore 11
/*      */     //   435: aload 11
/*      */     //   437: invokevirtual 310	java/lang/Exception:printStackTrace	()V
/*      */     //   440: aload 5
/*      */     //   442: ldc_w 315
/*      */     //   445: new 317	org/apache/struts/action/ActionMessage
/*      */     //   448: dup
/*      */     //   449: ldc_w 319
/*      */     //   452: aload 11
/*      */     //   454: invokevirtual 321	java/lang/Exception:getMessage	()Ljava/lang/String;
/*      */     //   457: invokespecial 324	org/apache/struts/action/ActionMessage:<init>	(Ljava/lang/String;Ljava/lang/Object;)V
/*      */     //   460: invokevirtual 326	org/apache/struts/action/ActionMessages:add	(Ljava/lang/String;Lorg/apache/struts/action/ActionMessage;)V
/*      */     //   463: aload_0
/*      */     //   464: aload_3
/*      */     //   465: aload 5
/*      */     //   467: invokevirtual 330	com/ist/aml/newrisk/controller/T31_def_tempAction:saveMessages	(Ljavax/servlet/http/HttpServletRequest;Lorg/apache/struts/action/ActionMessages;)V
/*      */     //   470: aload_1
/*      */     //   471: ldc_w 334
/*      */     //   474: invokevirtual 336	org/apache/struts/action/ActionMapping:findForward	(Ljava/lang/String;)Lorg/apache/struts/action/ActionForward;
/*      */     //   477: astore 18
/*      */     //   479: aload_0
/*      */     //   480: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   483: invokeinterface 451 1 0
/*      */     //   488: goto +10 -> 498
/*      */     //   491: astore 19
/*      */     //   493: aload 19
/*      */     //   495: invokevirtual 310	java/lang/Exception:printStackTrace	()V
/*      */     //   498: aload 18
/*      */     //   500: areturn
/*      */     //   501: astore 17
/*      */     //   503: aload_0
/*      */     //   504: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   507: invokeinterface 451 1 0
/*      */     //   512: goto +10 -> 522
/*      */     //   515: astore 19
/*      */     //   517: aload 19
/*      */     //   519: invokevirtual 310	java/lang/Exception:printStackTrace	()V
/*      */     //   522: aload 17
/*      */     //   524: athrow
/*      */     //   525: aload_0
/*      */     //   526: getfield 292	com/ist/aml/newrisk/controller/T31_def_tempAction:sqlMap	Lcom/ibatis/sqlmap/client/SqlMapClient;
/*      */     //   529: invokeinterface 451 1 0
/*      */     //   534: goto +10 -> 544
/*      */     //   537: astore 19
/*      */     //   539: aload 19
/*      */     //   541: invokevirtual 310	java/lang/Exception:printStackTrace	()V
/*      */     //   544: aload_1
/*      */     //   545: ldc_w 342
/*      */     //   548: invokevirtual 336	org/apache/struts/action/ActionMapping:findForward	(Ljava/lang/String;)Lorg/apache/struts/action/ActionForward;
/*      */     //   551: areturn
/*      */     //
/*      */     // Exception table:
/*      */     //   from	to	target	type
/*      */     //   63	433	433	java/lang/Exception
/*      */     //   479	488	491	java/lang/Exception
/*      */     //   63	479	501	finally
/*      */     //   503	512	515	java/lang/Exception
/*      */     //   525	534	537	java/lang/Exception } 
/*  378 */   public ActionForward performModifyT31_def_temp_main(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response) { ActionErrors errors = new ActionErrors();
/*  379 */     HttpSession session = request.getSession();
/*  380 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  381 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  383 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*      */ 
/*  385 */       String key = form.getTemplatekey();
/*  386 */       t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, key);
/*      */ 
/*  388 */       PropertyUtils.copyProperties(form, t31_def_temp);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  392 */       e.printStackTrace();
/*  393 */       this.logger.error("异常", e);
/*  394 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/*  395 */         "error.pagertitle.default"));
/*  396 */       saveErrors(request, errors);
/*  397 */       return actionMapping.findForward("failure");
/*      */     }
/*  399 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT31_def_temp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  416 */     ActionMessages errors = new ActionMessages();
/*  417 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context
/*  418 */       .getBean("t31_def_tempDAO");
/*  419 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*  420 */     ArrayList granList = new ArrayList();
/*      */     try
/*      */     {
/*  423 */       LinkedHashMap clienttypeMap = this.cm.getMapFromCache("temp_clienttype");
/*  424 */       request.setAttribute("clienttypeMap", getOptionsListByMap(
/*  425 */         clienttypeMap, null, true));
/*      */ 
/*  427 */       LinkedHashMap temptypeMap = this.cm.getMapFromCache("temptype");
/*  428 */       request.setAttribute("temptypeMap", getOptionsListByMap(
/*  429 */         temptypeMap, null, true));
/*      */ 
/*  431 */       LinkedHashMap tagMap = this.cm.getMapFromCache("yesNo");
/*  432 */       request.setAttribute("tagMap", getOptionsListByMap(
/*  433 */         tagMap, null, true));
/*      */ 
/*  435 */       LinkedHashMap granularityMap = this.cm.getMapFromCache("risk_granularitys");
/*  436 */       request.setAttribute("granularityMap", getOptionsListByMap(
/*  437 */         granularityMap, null, true));
/*      */ 
/*  439 */       LinkedHashMap tcategoryMap = this.cm.getMapFromCache("template_category");
/*  440 */       request.setAttribute("tcategoryMap", getOptionsListByMap(
/*  441 */         tcategoryMap, null, true));
/*      */ 
/*  443 */       LinkedHashMap coverMap = this.cm.getMapFromCache("yesNo");
/*  444 */       request.setAttribute("coverMap", getOptionsListByMap(
/*  445 */         coverMap, null, true));
/*      */ 
/*  447 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  448 */       String key = form.getTemplatekey();
/*  449 */       t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, key);
/*      */ 
/*  451 */       PropertyUtils.copyProperties(form, t31_def_temp);
/*      */     } catch (Exception e) {
/*  453 */       e.printStackTrace();
/*  454 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  455 */         "error.common", e.getMessage()));
/*  456 */       saveMessages(request, errors);
/*  457 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  460 */     request.setAttribute("t31_def_tempname", t31_def_temp.getTemplatekey());
/*      */ 
/*  462 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModifyT31_def_tempDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  480 */     ActionMessages errors = new ActionMessages();
/*  481 */     HttpSession session = request.getSession();
/*  482 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  483 */     Authorization auth = authBean.getAuthToken();
/*      */ 
/*  485 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  486 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  488 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  489 */       PropertyUtils.copyProperties(t31_def_temp, form);
/*  490 */       String key = form.getTemplatekey();
/*      */ 
/*  493 */       t31_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/*  494 */       t31_def_temp.setModify_user(auth.getT00_user().getUsername());
/*  495 */       t31_def_tempDAO.modifyT31_def_temp(this.sqlMap, t31_def_temp);
/*  496 */       if ("1".equals(form.getTemptype()))
/*      */       {
/*  498 */         T31_def_elementDAO t31_def_elementDAO = (T31_def_elementDAO)this.context.getBean("t31_def_elementDAO");
/*  499 */         T31_def_element t31_def_element = new T31_def_element();
/*  500 */         t31_def_element.setTemplatekey(t31_def_temp.getTemplatekey());
/*  501 */         t31_def_element.setElementname(t31_def_temp.getTemplatename());
/*  502 */         t31_def_elementDAO.updateT31_def_element_name(this.sqlMap, t31_def_element);
/*      */       }
/*      */     }
/*      */     catch (Exception e) {
/*  506 */       e.printStackTrace();
/*  507 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  508 */         "error.common", e.getMessage()));
/*  509 */       saveMessages(request, errors);
/*  510 */       return actionMapping.findForward("failure");
/*      */     }
/*  512 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_def_temp_granList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  517 */     ActionMessages errors = new ActionMessages();
/*  518 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  519 */     ArrayList granList = new ArrayList();
/*      */     try {
/*  521 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  522 */       String key = form.getTemplatekey();
/*  523 */       granList = t31_def_tempDAO.getT31_def_temp_granList(this.sqlMap, key);
/*      */     }
/*      */     catch (Exception e) {
/*  526 */       e.printStackTrace();
/*  527 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  528 */         "error.common", e.getMessage()));
/*  529 */       saveMessages(request, errors);
/*  530 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  533 */     request.setAttribute("granList", granList);
/*  534 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT31_def_temp_gran(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  540 */     ActionMessages errors = new ActionMessages();
/*  541 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context
/*  542 */       .getBean("t31_def_tempDAO");
/*      */     try {
/*  544 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*      */ 
/*  546 */       LinkedHashMap data_granularityMap = this.cm.getMapFromCache("data_granularity");
/*  547 */       request.setAttribute("data_granularityMap", getOptionsListByMap(
/*  548 */         data_granularityMap, null, true));
/*      */ 
/*  550 */       String templatekey = StringUtils.null2String(request.getParameter("templatekey"));
/*  551 */       request.setAttribute("templatekey", templatekey);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  555 */       e.printStackTrace();
/*  556 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  557 */         "error.common", e.getMessage()));
/*  558 */       saveMessages(request, errors);
/*  559 */       return actionMapping.findForward("failure");
/*      */     }
/*  561 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performAddT31_def_temp_granDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  567 */     ActionMessages errors = new ActionMessages();
/*  568 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  569 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try
/*      */     {
/*  572 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*      */ 
/*  574 */       this.sqlMap.endTransaction();
/*  575 */       this.sqlMap.startTransaction();
/*      */ 
/*  577 */       String sqlkey = getSequenceNextVal("SEQ_T31_DEF_TEMP_SQL");
/*  578 */       t31_def_temp.setSqlkey(sqlkey);
/*  579 */       t31_def_temp.setTemplatekey(form.getTemplatekey());
/*  580 */       t31_def_temp.setDatagranularity(form.getDatagranularity());
/*  581 */       t31_def_temp.setSqlgranularity(form.getSqlgranularity());
/*  582 */       t31_def_temp.setRisk_table(form.getRisk_table());
/*  583 */       int row1 = t31_def_tempDAO.insertT31_def_temp_gran(this.sqlMap, t31_def_temp);
/*      */ 
/*  586 */       String totalSize = request.getParameter("totalSize");
/*  587 */       int length = Integer.parseInt(totalSize);
/*      */ 
/*  589 */       int row2 = t31_def_tempDAO.delT31_def_temp_sql(this.sqlMap, sqlkey);
/*  590 */       for (int i = 1; i <= length; i++) {
/*  591 */         String gsSql = request.getParameter("selsql" + i);
/*  592 */         if ((gsSql != null) && (!gsSql.equals(""))) {
/*  593 */           String gsSqlNum = request.getParameter("exeseq" + i);
/*      */ 
/*  595 */           t31_def_temp.setSql_str(gsSql.trim());
/*  596 */           t31_def_temp.setCalsql(gsSqlNum);
/*  597 */           t31_def_tempDAO.insertT31_def_temp_sql(this.sqlMap, t31_def_temp);
/*      */         }
/*      */       }
/*  600 */       this.sqlMap.commitTransaction();
/*      */     }
/*      */     catch (Exception e) {
/*  603 */       e.printStackTrace();
/*  604 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  605 */         "error.common", e.getMessage()));
/*  606 */       saveMessages(request, errors);
/*  607 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*      */     } finally {
/*      */       try {
/*  610 */         this.sqlMap.endTransaction();
/*      */       } catch (Exception e) {
/*  612 */         e.printStackTrace();
/*      */       }
/*      */     }
/*  615 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModT31_def_temp_gran(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  621 */     ActionMessages errors = new ActionMessages();
/*  622 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  623 */     T31_def_temp t31_def_temp_gran = new T31_def_temp();
/*  624 */     ArrayList sqlList = new ArrayList();
/*      */     try
/*      */     {
/*  628 */       LinkedHashMap data_granularityMap = this.cm.getMapFromCache("data_granularity");
/*  629 */       request.setAttribute("data_granularityMap", getOptionsListByMap(
/*  630 */         data_granularityMap, null, true));
/*      */ 
/*  632 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  633 */       String sqlkey = form.getSqlkeys()[0];
/*      */ 
/*  635 */       t31_def_temp_gran = t31_def_tempDAO.getT31_def_temp_granDisp(this.sqlMap, sqlkey);
/*  636 */       sqlList = t31_def_tempDAO.getT31_def_temp_sqlList(this.sqlMap, sqlkey);
/*      */ 
/*  638 */       PropertyUtils.copyProperties(form, t31_def_temp_gran);
/*      */     }
/*      */     catch (Exception e) {
/*  641 */       e.printStackTrace();
/*  642 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  643 */         "error.common", e.getMessage()));
/*  644 */       saveMessages(request, errors);
/*  645 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  648 */     request.setAttribute("sqlList", sqlList);
/*  649 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performModT31_def_temp_granDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  655 */     ActionMessages errors = new ActionMessages();
/*  656 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  657 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  659 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  660 */       String sqlkey = form.getSqlkey();
/*      */ 
/*  662 */       this.sqlMap.endTransaction();
/*  663 */       this.sqlMap.startTransaction();
/*      */ 
/*  665 */       t31_def_temp.setSqlkey(sqlkey);
/*  666 */       t31_def_temp.setTemplatekey(form.getTemplatekey());
/*  667 */       t31_def_temp.setDatagranularity(form.getDatagranularity());
/*  668 */       t31_def_temp.setSqlgranularity(form.getSqlgranularity());
/*  669 */       t31_def_temp.setRisk_table(form.getRisk_table());
/*  670 */       int row1 = t31_def_tempDAO.modifyT31_def_temp_gran(this.sqlMap, t31_def_temp);
/*      */ 
/*  673 */       String totalSize = request.getParameter("totalSize");
/*  674 */       int length = Integer.parseInt(totalSize);
/*      */ 
/*  676 */       int row2 = t31_def_tempDAO.delT31_def_temp_sql(this.sqlMap, sqlkey);
/*  677 */       for (int i = 1; i <= length; i++) {
/*  678 */         String gsSql = request.getParameter("selsql" + i);
/*  679 */         if ((gsSql != null) && (!gsSql.equals(""))) {
/*  680 */           String gsSqlNum = request.getParameter("exeseq" + i);
/*      */ 
/*  682 */           t31_def_temp.setSql_str(gsSql.trim());
/*  683 */           t31_def_temp.setCalsql(gsSqlNum);
/*  684 */           t31_def_tempDAO.insertT31_def_temp_sql(this.sqlMap, t31_def_temp);
/*      */         }
/*      */       }
/*  687 */       this.sqlMap.commitTransaction();
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  692 */       e.printStackTrace();
/*  693 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  694 */         "error.common", e.getMessage()));
/*  695 */       saveMessages(request, errors);
/*  696 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*      */     } finally {
/*      */       try {
/*  699 */         this.sqlMap.endTransaction();
/*      */       } catch (Exception e) {
/*  701 */         e.printStackTrace();
/*      */       }
/*      */     }
/*  704 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performDelT31_def_temp_gran(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  710 */     ActionMessages errors = new ActionMessages();
/*  711 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*      */     try {
/*  713 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  714 */       String[] sqlkey_array = form.getSqlkeys();
/*  715 */       for (int i = 0; i < sqlkey_array.length; i++) {
/*  716 */         String sqlkey = sqlkey_array[i];
/*  717 */         int row = t31_def_tempDAO.deleteT31_def_temp_gran(this.sqlMap, sqlkey);
/*  718 */         int i = t31_def_tempDAO.delT31_def_temp_sql(this.sqlMap, sqlkey);
/*      */       }
/*      */ 
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  724 */       e.printStackTrace();
/*  725 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  726 */         "error.common", e.getMessage()));
/*  727 */       saveMessages(request, errors);
/*  728 */       return actionMapping.findForward("failure");
/*      */     }
/*  730 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_def_temp_sqlList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  736 */     ActionMessages errors = new ActionMessages();
/*  737 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  738 */     ArrayList sqlList = new ArrayList();
/*      */     try {
/*  740 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  741 */       String sqlkey = StringUtils.null2String(request.getParameter("sqlkey"));
/*      */ 
/*  743 */       sqlList = t31_def_tempDAO.getT31_def_temp_sqlList(this.sqlMap, sqlkey);
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  748 */       e.printStackTrace();
/*  749 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  750 */         "error.common", e.getMessage()));
/*  751 */       saveMessages(request, errors);
/*  752 */       return actionMapping.findForward("failure");
/*      */     }
/*      */ 
/*  755 */     request.setAttribute("sqlList", sqlList);
/*  756 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performDeleteT31_def_tempDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  774 */     ActionMessages errors = new ActionMessages();
/*  775 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context
/*  776 */       .getBean("t31_def_tempDAO");
/*      */     try {
/*  778 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  779 */       String calculateseq = form.getTemplatekey();
/*  780 */       t31_def_tempDAO.deleteT31_def_temp(this.sqlMap, calculateseq);
/*      */     } catch (Exception e) {
/*  782 */       e.printStackTrace();
/*  783 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  784 */         "error.common", e.getMessage()));
/*  785 */       saveMessages(request, errors);
/*  786 */       return actionMapping.findForward("failure");
/*      */     }
/*  788 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_def_tempDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  806 */     ActionMessages errors = new ActionMessages();
/*  807 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context
/*  808 */       .getBean("t31_def_tempDAO");
/*  809 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  811 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  812 */       String calculateseq = form.getTemplatekey();
/*  813 */       t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, 
/*  814 */         calculateseq);
/*      */     } catch (Exception e) {
/*  816 */       e.printStackTrace();
/*  817 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  818 */         "error.common", e.getMessage()));
/*  819 */       saveMessages(request, errors);
/*  820 */       return actionMapping.findForward("failure");
/*      */     }
/*  822 */     request.setAttribute("t31_def_temp", t31_def_temp);
/*      */ 
/*  824 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performGetT31_def_tempDisp_gs(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  841 */     ActionMessages errors = new ActionMessages();
/*  842 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context
/*  843 */       .getBean("t31_def_tempDAO");
/*  844 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  846 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  847 */       String calculateseq = form.getTemplatekey();
/*  848 */       t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, 
/*  849 */         calculateseq);
/*      */     } catch (Exception e) {
/*  851 */       e.printStackTrace();
/*  852 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  853 */         "error.common", e.getMessage()));
/*  854 */       saveMessages(request, errors);
/*  855 */       return actionMapping.findForward("failure");
/*      */     }
/*  857 */     request.setAttribute("t31_def_temp", t31_def_temp);
/*      */ 
/*  859 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performChangeT31_def_tempFlag(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  876 */     ActionMessages errors = new ActionMessages();
/*  877 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  878 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */     try {
/*  880 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  881 */       String flag = request.getParameter("flag");
/*  882 */       String[] key_array = form.getTemplatekeys();
/*      */ 
/*  884 */       for (int i = 0; i < key_array.length; i++)
/*      */       {
/*  886 */         t31_def_temp.setFlag(flag);
/*  887 */         t31_def_temp.setTemplatekey(key_array[i]);
/*  888 */         t31_def_tempDAO.modifyT31_def_temp_flag(this.sqlMap, t31_def_temp);
/*      */       }
/*      */     }
/*      */     catch (Exception e) {
/*  892 */       e.printStackTrace();
/*  893 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  894 */         "error.common", e.getMessage()));
/*  895 */       saveMessages(request, errors);
/*  896 */       return actionMapping.findForward("failure");
/*      */     }
/*  898 */     return actionMapping.findForward("success");
/*      */   }
/*      */ 
/*      */   public ActionForward performCopyT31_def_temp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*      */   {
/*  915 */     ActionMessages errors = new ActionMessages();
/*  916 */     HttpSession session = request.getSession();
/*  917 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/*  918 */     Authorization auth = authBean.getAuthToken();
/*      */ 
/*  920 */     T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO)this.context.getBean("t31_def_tempDAO");
/*  921 */     T31_def_gsDAO t31_def_gsDAO = (T31_def_gsDAO)this.context.getBean("t31_def_gsDAO");
/*  922 */     T31_def_temp t31_def_temp = new T31_def_temp();
/*      */ 
/*  924 */     ArrayList list = new ArrayList();
/*  925 */     ArrayList list1 = new ArrayList();
/*      */     try {
/*  927 */       T31_def_tempActionForm form = (T31_def_tempActionForm)actionForm;
/*  928 */       String temptype = form.getTemptype();
/*  929 */       String templatekey = form.getTemplatekeys()[0];
/*      */ 
/*  931 */       String templatekey1 = "PKT" + getSequenceNextVal("SEQ_T31_DEF_TEMP");
/*  932 */       this.sqlMap.endTransaction();
/*  933 */       this.sqlMap.startTransaction();
/*      */ 
/*  935 */       t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(this.sqlMap, templatekey);
/*  936 */       t31_def_temp.setCreate_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/*  937 */       t31_def_temp.setCreate_user(auth.getT00_user().getUsername());
/*  938 */       t31_def_temp.setCreate_org(auth.getT00_user().getOrgankey());
/*  939 */       t31_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/*  940 */       t31_def_temp.setModify_user(auth.getT00_user().getUsername());
/*  941 */       t31_def_temp.setTemplatekey(templatekey1);
/*  942 */       t31_def_temp.setTemplatename(t31_def_temp.getTemplatename() + "(副本)");
/*  943 */       t31_def_temp.setTag("0");
/*  944 */       int row1 = t31_def_tempDAO.insertT31_def_temp(this.sqlMap, t31_def_temp);
/*      */ 
/*  947 */       T31_def_temp temp1 = new T31_def_temp();
/*  948 */       temp1.setTemplatekey(templatekey1);
/*  949 */       temp1.setTemplatekey_temp(templatekey);
/*      */ 
/*  951 */       int row2 = t31_def_tempDAO.copyT31_def_temp_gran(this.sqlMap, temp1);
/*      */ 
/*  954 */       T31_def_temp temp = new T31_def_temp();
/*  955 */       temp.setTemplatekey(templatekey1);
/*  956 */       temp.setTemplatekey_temp(templatekey);
/*  957 */       int row3 = t31_def_tempDAO.copyT31_def_temp_sql(this.sqlMap, temp);
/*      */ 
/*  961 */       if ((temptype != null) && (!"".equals(temptype)))
/*      */       {
/*      */         T31_def_elementDAO t31_def_elementDAO;
/*  963 */         if ("1".equals(temptype))
/*      */         {
/*  965 */           String copy_key = "C" + getSequenceNextVal("SEQ_T31_DEF_ELEMENT_COPY");
/*  966 */           temp.setCopy_key(copy_key);
/*  967 */           t31_def_elementDAO = (T31_def_elementDAO)this.context.getBean("t31_def_elementDAO");
/*      */ 
/*  969 */           t31_def_elementDAO.copyT31_def_elementscore(this.sqlMap, temp);
/*  970 */           t31_def_elementDAO.copyT31_def_element(this.sqlMap, temp);
/*      */ 
/*  972 */           T31_def_element t31_def_element = new T31_def_element();
/*  973 */           t31_def_element.setTemplatekey(t31_def_temp.getTemplatekey());
/*  974 */           t31_def_element.setElementname(t31_def_temp.getTemplatename());
/*  975 */           t31_def_elementDAO.updateT31_def_element_name(this.sqlMap, t31_def_element);
/*      */         }
/*  977 */         else if ("2".equals(temptype))
/*      */         {
/*  981 */           t31_def_temp.setTemplatekey_temp(templatekey);
/*  982 */           t31_def_temp.setTemplatekey(templatekey1);
/*      */ 
/*  984 */           int row4 = t31_def_gsDAO.copyT31_def_gs(this.sqlMap, t31_def_temp);
/*      */ 
/*  986 */           t31_def_elementDAO = t31_def_gsDAO.copyT31_def_gs_indic(this.sqlMap, t31_def_temp);
/*      */         }
/*      */       }
/*  989 */       this.sqlMap.commitTransaction();
/*      */     }
/*      */     catch (Exception e)
/*      */     {
/*  993 */       e.printStackTrace();
/*  994 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage(
/*  995 */         "error.common", e.getMessage()));
/*  996 */       saveMessages(request, errors);
/*  997 */       ActionForward localActionForward = actionMapping.findForward("failure"); return localActionForward;
/*      */     } finally {
/*      */       try {
/* 1000 */         this.sqlMap.endTransaction();
/*      */       } catch (Exception e) {
/* 1002 */         e.printStackTrace();
/*      */       }
/*      */     }
/* 1005 */     return actionMapping.findForward("success");
/*      */   }
/*      */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_def_tempAction
 * JD-Core Version:    0.6.2
 */