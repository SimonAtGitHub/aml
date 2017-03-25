/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ist.aml.newrisk.dao.T31_count_ruleDAO;
/*     */ import com.ist.aml.newrisk.dto.T31_count_rule;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.apache.commons.beanutils.PropertyUtils;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.apache.struts.action.ActionMessages;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T31_count_ruleAction extends BaseAction
/*     */ {
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  44 */     ActionForward myforward = null;
/*  45 */     String myaction = mapping.getParameter();
/*     */ 
/*  47 */     myforward = preExecute(mapping, form, request, response);
/*     */ 
/*  49 */     if ("false".equals(request.getAttribute("goWayFlag"))) {
/*  50 */       return myforward;
/*     */     }
/*  52 */     if ("getT31_count_ruleList".equalsIgnoreCase(myaction)) {
/*  53 */       myforward = performGetT31_count_ruleList(mapping, form, request, response);
/*     */     }
/*  56 */     else if ("addT31_count_rule".equalsIgnoreCase(myaction)) {
/*  57 */       myforward = performAddT31_count_rule(mapping, form, request, response);
/*     */     }
/*  60 */     else if ("addT31_count_ruleDo".equalsIgnoreCase(myaction)) {
/*  61 */       myforward = performAddT31_count_ruleDo(mapping, form, request, response);
/*     */     }
/*  64 */     else if ("modifyT31_count_rule".equalsIgnoreCase(myaction)) {
/*  65 */       myforward = performModifyT31_count_rule(mapping, form, request, response);
/*     */     }
/*  68 */     else if ("modifyT31_count_ruleDo".equalsIgnoreCase(myaction)) {
/*  69 */       myforward = performModifyT31_count_ruleDo(mapping, form, request, response);
/*     */     }
/*  72 */     else if ("deleteT31_count_ruleDo".equalsIgnoreCase(myaction)) {
/*  73 */       myforward = performDeleteT31_count_ruleDo(mapping, form, request, response);
/*     */     }
/*  76 */     else if ("getT31_count_ruleDisp".equalsIgnoreCase(myaction)) {
/*  77 */       myforward = performGetT31_count_ruleDisp(mapping, form, request, response);
/*     */     }
/*  79 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_count_ruleList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  92 */     ActionMessages errors = new ActionMessages();
/*  93 */     List t31_count_ruleList = null;
/*     */ 
/*  95 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/*  96 */     T31_count_rule t31_count_rule = new T31_count_rule();
/*     */     try {
/*  98 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/*  99 */       String url = request.getContextPath() + "/newrisk" + actionMapping.getPath() + ".do";
/* 100 */       t31_count_rule = (T31_count_rule)getSearchObject(t31_count_rule, request, form, 
/* 101 */         "getT31_count_ruleListCount", url);
/* 102 */       if (t31_count_rule.getNewsearchflag().equals("1"))
/*     */       {
/* 105 */         saveSearchObject(t31_count_rule, request);
/*     */       }
/* 107 */       t31_count_ruleList = t31_count_ruleDAO.getT31_count_ruleList(this.sqlMap, t31_count_rule, 
/* 108 */         getStartRec(t31_count_rule.getIntPage()), getIntPageSize());
/*     */     }
/*     */     catch (Exception e) {
/* 111 */       e.printStackTrace();
/* 112 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 113 */       saveMessages(request, errors);
/* 114 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 117 */     request.setAttribute("t31_count_ruleList", t31_count_ruleList);
/*     */ 
/* 119 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_count_rule(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 131 */     ActionMessages errors = new ActionMessages();
/*     */ 
/* 133 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_count_ruleDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 145 */     ActionMessages errors = new ActionMessages();
/* 146 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/* 147 */     T31_count_rule t31_count_rule = new T31_count_rule();
/* 148 */     boolean isSucc = false;
/*     */     try {
/* 150 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/*     */ 
/* 152 */       PropertyUtils.copyProperties(t31_count_rule, form);
/*     */ 
/* 154 */       int rows = t31_count_ruleDAO.insertT31_count_rule(this.sqlMap, t31_count_rule);
/* 155 */       if (rows <= 0)
/* 156 */         throw new Exception("");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 160 */       e.printStackTrace();
/* 161 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 162 */       saveMessages(request, errors);
/* 163 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 166 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_count_rule(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 178 */     ActionMessages errors = new ActionMessages();
/* 179 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/* 180 */     T31_count_rule t31_count_rule = new T31_count_rule();
/*     */     try {
/* 182 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/* 183 */       String create_dt = form.getCreate_dt();
/* 184 */       t31_count_rule = t31_count_ruleDAO.getT31_count_ruleDisp(this.sqlMap, create_dt);
/* 185 */       PropertyUtils.copyProperties(form, t31_count_rule);
/*     */     }
/*     */     catch (Exception e) {
/* 188 */       e.printStackTrace();
/* 189 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 190 */       saveMessages(request, errors);
/* 191 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 194 */     request.setAttribute("t31_count_rulename", t31_count_rule.getCreate_dt());
/* 195 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_count_ruleDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 207 */     ActionMessages errors = new ActionMessages();
/* 208 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/* 209 */     T31_count_rule t31_count_rule = new T31_count_rule();
/*     */     try {
/* 211 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/* 212 */       PropertyUtils.copyProperties(t31_count_rule, form);
/*     */ 
/* 215 */       t31_count_ruleDAO.modifyT31_count_rule(this.sqlMap, t31_count_rule);
/*     */     }
/*     */     catch (Exception e) {
/* 218 */       e.printStackTrace();
/* 219 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 220 */       saveMessages(request, errors);
/* 221 */       return actionMapping.findForward("failure");
/*     */     }
/* 223 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT31_count_ruleDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 235 */     ActionMessages errors = new ActionMessages();
/* 236 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/*     */     try {
/* 238 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/* 239 */       String create_dt = form.getCreate_dt();
/* 240 */       t31_count_ruleDAO.deleteT31_count_rule(this.sqlMap, create_dt);
/*     */     }
/*     */     catch (Exception e) {
/* 243 */       e.printStackTrace();
/* 244 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 245 */       saveMessages(request, errors);
/* 246 */       return actionMapping.findForward("failure");
/*     */     }
/* 248 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_count_ruleDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 260 */     ActionMessages errors = new ActionMessages();
/* 261 */     T31_count_ruleDAO t31_count_ruleDAO = (T31_count_ruleDAO)this.context.getBean("t31_count_ruleDAO");
/* 262 */     T31_count_rule t31_count_rule = new T31_count_rule();
/*     */     try {
/* 264 */       T31_count_ruleActionForm form = (T31_count_ruleActionForm)actionForm;
/* 265 */       String create_dt = form.getCreate_dt();
/* 266 */       t31_count_rule = t31_count_ruleDAO.getT31_count_ruleDisp(this.sqlMap, create_dt);
/*     */     }
/*     */     catch (Exception e) {
/* 269 */       e.printStackTrace();
/* 270 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 271 */       saveMessages(request, errors);
/* 272 */       return actionMapping.findForward("failure");
/*     */     }
/* 274 */     request.setAttribute("t31_count_rule", t31_count_rule);
/*     */ 
/* 276 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_count_ruleAction
 * JD-Core Version:    0.6.2
 */