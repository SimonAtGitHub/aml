/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ist.aml.newrisk.dao.T31_risk_levelDAO;
/*     */ import com.ist.aml.newrisk.dto.T31_risk_level;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.jcs.CatchManager;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import java.util.LinkedHashMap;
/*     */ import java.util.List;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import net.sf.json.JSONArray;
/*     */ import net.sf.json.JSONObject;
/*     */ import org.apache.commons.beanutils.PropertyUtils;
/*     */ import org.apache.struts.action.ActionError;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.action.ActionMessage;
/*     */ import org.apache.struts.action.ActionMessages;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T31_risk_levelAction extends BaseAction
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
/*  61 */     if ("getT31_risk_levelList".equalsIgnoreCase(myaction)) {
/*  62 */       myforward = performGetT31_risk_levelList(mapping, form, request, response);
/*     */     }
/*  65 */     else if ("addT31_risk_level".equalsIgnoreCase(myaction)) {
/*  66 */       myforward = performAddT31_risk_level(mapping, form, request, response);
/*     */     }
/*  69 */     else if ("addT31_risk_levelDo".equalsIgnoreCase(myaction)) {
/*  70 */       myforward = performAddT31_risk_levelDo(mapping, form, request, response);
/*     */     }
/*  73 */     else if ("modifyT31_risk_level".equalsIgnoreCase(myaction)) {
/*  74 */       myforward = performModifyT31_risk_level(mapping, form, request, response);
/*     */     }
/*  77 */     else if ("modifyT31_risk_levelDo".equalsIgnoreCase(myaction)) {
/*  78 */       myforward = performModifyT31_risk_levelDo(mapping, form, request, response);
/*     */     }
/*  81 */     else if ("deleteT31_risk_levelDo".equalsIgnoreCase(myaction)) {
/*  82 */       myforward = performDeleteT31_risk_levelDo(mapping, form, request, response);
/*     */     }
/*  85 */     else if ("getT31_risk_levelDisp".equalsIgnoreCase(myaction)) {
/*  86 */       myforward = performGetT31_risk_levelDisp(mapping, form, request, response);
/*     */     }
/*  88 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_risk_levelList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 101 */     ActionMessages errors = new ActionMessages();
/* 102 */     List t31_risk_levelList = null;
/*     */ 
/* 104 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 105 */     T31_risk_level t31_risk_level = new T31_risk_level();
/*     */     try {
/* 107 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/* 108 */       String url = request.getContextPath() + "/bmp" + actionMapping.getPath() + ".do";
/* 109 */       t31_risk_level = (T31_risk_level)getSearchObject(t31_risk_level, request, form, "getT31_risk_levelListCount", url);
/* 110 */       if (t31_risk_level.getNewsearchflag().equals("1"))
/*     */       {
/* 113 */         saveSearchObject(t31_risk_level, request);
/*     */       }
/* 115 */       t31_risk_levelList = t31_risk_levelDAO.getT31_risk_levelList(this.sqlMap, t31_risk_level, getStartRec(t31_risk_level.getIntPage()), getIntPageSize());
/*     */     }
/*     */     catch (Exception e) {
/* 118 */       e.printStackTrace();
/* 119 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 120 */       saveMessages(request, errors);
/* 121 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 124 */     request.setAttribute("t31_risk_levelList", t31_risk_levelList);
/*     */ 
/* 126 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_risk_level(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 138 */     ActionMessages errors = new ActionMessages();
/* 139 */     List t31_risk_levelList = null;
/*     */ 
/* 141 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 142 */     T31_risk_level t31_risk_level = new T31_risk_level();
/*     */     try {
/* 144 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/*     */ 
/* 146 */       t31_risk_levelList = t31_risk_levelDAO.getT31_risk_levelList(this.sqlMap, t31_risk_level);
/*     */     }
/*     */     catch (Exception e) {
/* 149 */       e.printStackTrace();
/* 150 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 151 */       saveMessages(request, errors);
/* 152 */       return actionMapping.findForward("failure");
/*     */     }
/* 154 */     String jsonStr = "";
/* 155 */     JSONArray jsonArray = new JSONArray();
/* 156 */     for (int i = 0; i < t31_risk_levelList.size(); i++)
/*     */     {
/* 158 */       JSONObject json = JSONObject.fromObject(t31_risk_levelList.get(i));
/* 159 */       jsonArray.add(json);
/*     */     }
/*     */ 
/* 162 */     jsonStr = jsonArray.toString();
/* 163 */     request.setAttribute("jsonStr", jsonStr);
/* 164 */     LinkedHashMap maxisclosedMap = this.cm.getMapFromCache("risk_maxisclosed");
/* 165 */     LinkedHashMap minisclosedMap = this.cm.getMapFromCache("risk_minisclosed");
/*     */ 
/* 167 */     request.setAttribute("maxisclosedMap", getOptionsListByMap(maxisclosedMap, null, true));
/* 168 */     request.setAttribute("minisclosedMap", getOptionsListByMap(minisclosedMap, null, true));
/*     */ 
/* 173 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT31_risk_levelDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 185 */     ActionMessages errors = new ActionMessages();
/*     */ 
/* 187 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 188 */     T31_risk_level t31_risk_level = new T31_risk_level();
/* 189 */     boolean isSucc = false;
/* 190 */     HttpSession session = request.getSession();
/* 191 */     AuthBean authBean = (AuthBean)session.getAttribute("authBean");
/* 192 */     Authorization auth = authBean.getAuthToken();
/*     */     try
/*     */     {
/* 196 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/*     */ 
/* 198 */       PropertyUtils.copyProperties(t31_risk_level, form);
/*     */ 
/* 200 */       t31_risk_level.setCreate_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
/* 201 */       t31_risk_level.setFlag("1");
/* 202 */       t31_risk_level.setCreate_user(auth.getT00_user().getUsername());
/* 203 */       t31_risk_level.setCreate_org(auth.getT00_user().getOrgankey());
/* 204 */       String levelkey = getSequenceNextVal("T31_RISK_LEVEL_SEQ");
/* 205 */       if (levelkey.equals("")) {
/* 206 */         errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionError(
/* 207 */           "error.pagertitle.common", "取角色主键错误！"));
/* 208 */         saveErrors(request, errors);
/* 209 */         return actionMapping.findForward("failure");
/*     */       }
/* 211 */       t31_risk_level.setLevelkey(levelkey);
/* 212 */       int rows = t31_risk_levelDAO.insertT31_risk_level(this.sqlMap, t31_risk_level);
/* 213 */       if (rows <= 0)
/* 214 */         throw new Exception("");
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 218 */       e.printStackTrace();
/* 219 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 220 */       saveMessages(request, errors);
/* 221 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 224 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_risk_level(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 236 */     ActionMessages errors = new ActionMessages();
/* 237 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 238 */     T31_risk_level t31_risk_level = new T31_risk_level();
/*     */     try {
/* 240 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/* 241 */       String create_dt = form.getCreate_dt();
/* 242 */       t31_risk_level = t31_risk_levelDAO.getT31_risk_levelDisp(this.sqlMap, create_dt);
/* 243 */       PropertyUtils.copyProperties(form, t31_risk_level);
/*     */     }
/*     */     catch (Exception e) {
/* 246 */       e.printStackTrace();
/* 247 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 248 */       saveMessages(request, errors);
/* 249 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 252 */     request.setAttribute("t31_risk_levelname", t31_risk_level.getCreate_dt());
/* 253 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performModifyT31_risk_levelDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 265 */     ActionMessages errors = new ActionMessages();
/* 266 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 267 */     T31_risk_level t31_risk_level = new T31_risk_level();
/*     */     try {
/* 269 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/* 270 */       PropertyUtils.copyProperties(t31_risk_level, form);
/*     */ 
/* 273 */       t31_risk_levelDAO.modifyT31_risk_level(this.sqlMap, t31_risk_level);
/*     */     }
/*     */     catch (Exception e) {
/* 276 */       e.printStackTrace();
/* 277 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 278 */       saveMessages(request, errors);
/* 279 */       return actionMapping.findForward("failure");
/*     */     }
/* 281 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT31_risk_levelDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 294 */     ActionMessages errors = new ActionMessages();
/* 295 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/*     */     try {
/* 297 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/*     */ 
/* 300 */       String[] levelKeys = form.getSelectedLevelkey();
/* 301 */       for (int i = 0; i < levelKeys.length; i++) {
/* 302 */         String levelKey = levelKeys[i];
/* 303 */         t31_risk_levelDAO.deleteT31_risk_level(this.sqlMap, levelKey);
/*     */       }
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 308 */       e.printStackTrace();
/* 309 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 310 */       saveMessages(request, errors);
/* 311 */       return actionMapping.findForward("failure");
/*     */     }
/* 313 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT31_risk_levelDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 325 */     ActionMessages errors = new ActionMessages();
/* 326 */     T31_risk_levelDAO t31_risk_levelDAO = (T31_risk_levelDAO)this.context.getBean("t31_risk_levelDAO");
/* 327 */     T31_risk_level t31_risk_level = new T31_risk_level();
/*     */     try {
/* 329 */       T31_risk_levelActionForm form = (T31_risk_levelActionForm)actionForm;
/* 330 */       String create_dt = form.getCreate_dt();
/* 331 */       t31_risk_level = t31_risk_levelDAO.getT31_risk_levelDisp(this.sqlMap, create_dt);
/*     */     }
/*     */     catch (Exception e) {
/* 334 */       e.printStackTrace();
/* 335 */       errors.add("org.apache.struts.action.GLOBAL_MESSAGE", new ActionMessage("error.common", e.getMessage()));
/* 336 */       saveMessages(request, errors);
/* 337 */       return actionMapping.findForward("failure");
/*     */     }
/* 339 */     request.setAttribute("t31_risk_level", t31_risk_level);
/*     */ 
/* 341 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T31_risk_levelAction
 * JD-Core Version:    0.6.2
 */