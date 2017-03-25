/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ist.aml.newrisk.dao.T37_level_auditDAO;
/*     */ import com.ist.aml.newrisk.dto.T37_level_audit;
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
/*     */ public class T37_level_auditAction extends BaseAction
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
/*  52 */     if ("getT37_level_auditList".equalsIgnoreCase(myaction)) {
/*  53 */       myforward = performGetT37_level_auditList(mapping, form, request, response);
/*     */     }
/*  56 */     else if ("addT37_level_audit".equalsIgnoreCase(myaction)) {
/*  57 */       myforward = performAddT37_level_audit(mapping, form, request, response);
/*     */     }
/*  60 */     else if ("addT37_level_auditDo".equalsIgnoreCase(myaction)) {
/*  61 */       myforward = performAddT37_level_auditDo(mapping, form, request, response);
/*     */     }
/*  64 */     else if ("modifyT37_level_audit".equalsIgnoreCase(myaction)) {
/*  65 */       myforward = performModifyT37_level_audit(mapping, form, request, response);
/*     */     }
/*  68 */     else if ("modifyT37_level_auditDo".equalsIgnoreCase(myaction)) {
/*  69 */       myforward = performModifyT37_level_auditDo(mapping, form, request, response);
/*     */     }
/*  72 */     else if ("deleteT37_level_auditDo".equalsIgnoreCase(myaction)) {
/*  73 */       myforward = performDeleteT37_level_auditDo(mapping, form, request, response);
/*     */     }
/*  76 */     else if ("getT37_level_auditDisp".equalsIgnoreCase(myaction)) {
/*  77 */       myforward = performGetT37_level_auditDisp(mapping, form, request, response);
/*     */     }
/*  79 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_level_auditList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  92 */     ActionMessages errors = new ActionMessages();
/*  93 */     List t37_level_auditList = null;
/*     */ 
/*  95 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/*  96 */     T37_level_audit t37_level_audit = new T37_level_audit();
/*     */     try {
/*  98 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/*  99 */       String url = request.getContextPath() + "/bmp" + actionMapping.getPath() + ".do";
/* 100 */       t37_level_audit = (T37_level_audit)getSearchObject(t37_level_audit, request, form, "getT37_level_auditListCount", url);
/* 101 */       if (t37_level_audit.getNewsearchflag().equals("1"))
/*     */       {
/* 104 */         saveSearchObject(t37_level_audit, request);
/*     */       }
/* 106 */       t37_level_auditList = t37_level_auditDAO.getT37_level_auditList(this.sqlMap, t37_level_audit, getStartRec(t37_level_audit.getIntPage()), getIntPageSize());
/*     */     }
/*     */     catch (Exception e) {
/* 109 */       e.printStackTrace();
/* 110 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 111 */       saveMessages(request, errors);
/* 112 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 115 */     request.setAttribute("t37_level_auditList", t37_level_auditList);
/*     */ 
/* 117 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT37_level_audit(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 129 */     ActionMessages errors = new ActionMessages();
/*     */ 
/* 131 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT37_level_auditDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 143 */     ActionMessages errors = new ActionMessages();
/* 144 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/* 145 */     T37_level_audit t37_level_audit = new T37_level_audit();
/* 146 */     boolean isSucc = false;
/*     */     try {
/* 148 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/*     */ 
/* 150 */       PropertyUtils.copyProperties(t37_level_audit, form);
/*     */ 
/* 152 */       int rows = t37_level_auditDAO.insertT37_level_audit(this.sqlMap, t37_level_audit);
/* 153 */       if (rows <= 0)
/* 154 */         throw new Exception("");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 158 */       e.printStackTrace();
/* 159 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 160 */       saveMessages(request, errors);
/* 161 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 164 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT37_level_audit(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 176 */     ActionMessages errors = new ActionMessages();
/* 177 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/* 178 */     T37_level_audit t37_level_audit = new T37_level_audit();
/*     */     try {
/* 180 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/* 181 */       String adjust_reason = form.getAdjust_reason();
/* 182 */       t37_level_audit = t37_level_auditDAO.getT37_level_auditDisp(this.sqlMap, adjust_reason);
/* 183 */       PropertyUtils.copyProperties(form, t37_level_audit);
/*     */     }
/*     */     catch (Exception e) {
/* 186 */       e.printStackTrace();
/* 187 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 188 */       saveMessages(request, errors);
/* 189 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 192 */     request.setAttribute("t37_level_auditname", t37_level_audit.getAdjust_reason());
/* 193 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT37_level_auditDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 205 */     ActionMessages errors = new ActionMessages();
/* 206 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/* 207 */     T37_level_audit t37_level_audit = new T37_level_audit();
/*     */     try {
/* 209 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/* 210 */       PropertyUtils.copyProperties(t37_level_audit, form);
/*     */ 
/* 213 */       t37_level_auditDAO.modifyT37_level_audit(this.sqlMap, t37_level_audit);
/*     */     }
/*     */     catch (Exception e) {
/* 216 */       e.printStackTrace();
/* 217 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 218 */       saveMessages(request, errors);
/* 219 */       return actionMapping.findForward("failure");
/*     */     }
/* 221 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT37_level_auditDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 233 */     ActionMessages errors = new ActionMessages();
/* 234 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/*     */     try {
/* 236 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/* 237 */       String adjust_reason = form.getAdjust_reason();
/* 238 */       t37_level_auditDAO.deleteT37_level_audit(this.sqlMap, adjust_reason);
/*     */     }
/*     */     catch (Exception e) {
/* 241 */       e.printStackTrace();
/* 242 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 243 */       saveMessages(request, errors);
/* 244 */       return actionMapping.findForward("failure");
/*     */     }
/* 246 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_level_auditDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 258 */     ActionMessages errors = new ActionMessages();
/* 259 */     T37_level_auditDAO t37_level_auditDAO = (T37_level_auditDAO)this.context.getBean("t37_level_auditDAO");
/* 260 */     T37_level_audit t37_level_audit = new T37_level_audit();
/*     */     try {
/* 262 */       T37_level_auditActionForm form = (T37_level_auditActionForm)actionForm;
/* 263 */       String adjust_reason = form.getAdjust_reason();
/* 264 */       t37_level_audit = t37_level_auditDAO.getT37_level_auditDisp(this.sqlMap, adjust_reason);
/*     */     }
/*     */     catch (Exception e) {
/* 267 */       e.printStackTrace();
/* 268 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 269 */       saveMessages(request, errors);
/* 270 */       return actionMapping.findForward("failure");
/*     */     }
/* 272 */     request.setAttribute("t37_level_audit", t37_level_audit);
/*     */ 
/* 274 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_level_auditAction
 * JD-Core Version:    0.6.2
 */