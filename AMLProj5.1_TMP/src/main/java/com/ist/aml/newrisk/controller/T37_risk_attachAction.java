/*     */ package com.ist.aml.newrisk.controller;
/*     */ 
/*     */ import com.ist.aml.newrisk.dao.T37_risk_attachDAO;
/*     */ import com.ist.aml.newrisk.dto.T37_risk_attach;
/*     */ import com.ist.common.AuthBean;
/*     */ import com.ist.common.Authorization;
/*     */ import com.ist.common.FileUpload;
/*     */ import com.ist.common.LogUtils;
/*     */ import com.ist.common.MyBeanUtils;
/*     */ import com.ist.common.base.BaseAction;
/*     */ import com.ist.common.properties.XMLProperties;
/*     */ import com.ist.impfile.bmp.platform.dto.T00_user;
/*     */ import com.ist.util.DateUtils;
/*     */ import com.ist.util.FileUtils;
/*     */ import com.ist.util.StringUtils;
/*     */ import java.io.File;
/*     */ import java.io.InputStream;
/*     */ import java.util.ArrayList;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import org.apache.log4j.Logger;
/*     */ import org.apache.struts.action.ActionError;
/*     */ import org.apache.struts.action.ActionErrors;
/*     */ import org.apache.struts.action.ActionForm;
/*     */ import org.apache.struts.action.ActionForward;
/*     */ import org.apache.struts.action.ActionMapping;
/*     */ import org.apache.struts.upload.FormFile;
/*     */ import org.springframework.context.ApplicationContext;
/*     */ 
/*     */ public class T37_risk_attachAction extends BaseAction
/*     */ {
/*  60 */   private static Logger logger = LogUtils.getLogger(T37_risk_attachAction.class.getName());
/*     */ 
/*     */   public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/*  78 */     ActionForward myforward = null;
/*  79 */     String myaction = mapping.getParameter();
/*     */ 
/*  81 */     myforward = preExecute(mapping, form, request, 
/*  82 */       response);
/*  83 */     if ("false".equals(request.getAttribute("goWayFlag")))
/*  84 */       return myforward;
/*  85 */     if ("getT37_risk_attachList".equalsIgnoreCase(myaction)) {
/*  86 */       myforward = performGetT37_risk_attachList(mapping, form, request, 
/*  87 */         response);
/*     */     }
/*  90 */     else if ("addT37_risk_attach".equalsIgnoreCase(myaction)) {
/*  91 */       myforward = performAddT37_risk_attach(mapping, form, request, 
/*  92 */         response);
/*     */     }
/*  95 */     else if ("addT37_risk_attachDo".equalsIgnoreCase(myaction)) {
/*  96 */       myforward = performAddT37_risk_attachDo(mapping, form, request, 
/*  97 */         response);
/*     */     }
/* 101 */     else if ("deleteT37_risk_attachDo".equalsIgnoreCase(myaction)) {
/* 102 */       myforward = performDeleteT37_risk_attachDo(mapping, form, request, 
/* 103 */         response);
/*     */     }
/* 106 */     else if ("getT37_risk_attachDisp".equalsIgnoreCase(myaction)) {
/* 107 */       myforward = performGetT37_risk_attachDisp(mapping, form, request, 
/* 108 */         response);
/*     */     }
/* 110 */     return myforward;
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_risk_attachList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 131 */     ActionErrors errors = new ActionErrors();
/* 132 */     HttpSession session = request.getSession();
/* 133 */     ArrayList t37_risk_attachList = new ArrayList();
/* 134 */     String pageInfo = "";
/*     */ 
/* 136 */     T37_risk_attachDAO t37_risk_attachDAO = (T37_risk_attachDAO)this.context.getBean("t37_risk_attachDAO");
/* 137 */     T37_risk_attach t37_risk_attach = new T37_risk_attach();
/*     */     try {
/* 139 */       T37_risk_attachActionForm form = (T37_risk_attachActionForm)actionForm;
/* 140 */       String newsearchflag = StringUtils.nullObject2String(request
/* 141 */         .getParameter("newsearchflag"));
/* 142 */       int intPage = StringUtils.nullObject2int(request
/* 143 */         .getParameter("intPage"), 0);
/* 144 */       if (newsearchflag.equals("1")) {
/* 145 */         MyBeanUtils.copyBean2Bean(t37_risk_attach, form);
/*     */ 
/* 147 */         t37_risk_attach.setInt_page(intPage);
/* 148 */         session.setAttribute("t37_risk_attachSearchObj", 
/* 149 */           t37_risk_attach);
/*     */       } else {
/* 151 */         t37_risk_attach = (T37_risk_attach)session
/* 152 */           .getAttribute("t37_risk_attachSearchObj");
/*     */       }
/*     */ 
/* 155 */       t37_risk_attachList = t37_risk_attachDAO.getT37_risk_attachList(
/* 156 */         this.sqlMap, t37_risk_attach, getStartRec(intPage), 
/* 157 */         getIntPageSize(), this.context);
/* 158 */       int totalRow = t37_risk_attachDAO.getT37_risk_attachListCount(
/* 159 */         this.sqlMap, t37_risk_attach);
/* 160 */       String url = request.getContextPath() + "/risk" + 
/* 161 */         actionMapping.getPath() + ".do";
/*     */ 
/* 163 */       pageInfo = getPageInfoStr(totalRow, intPage, url, "");
/*     */     } catch (Exception e) {
/* 165 */       e.printStackTrace();
/* 166 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 167 */         "error.pagertitle.default"));
/* 168 */       saveErrors(request, errors);
/* 169 */       return actionMapping.findForward("failure");
/*     */     }
/* 171 */     request.setAttribute("resulekey", t37_risk_attach.getResulekey());
/* 172 */     request.setAttribute("pageInfo", pageInfo);
/* 173 */     request.setAttribute("t37_risk_attachList", t37_risk_attachList);
/*     */ 
/* 176 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT37_risk_attach(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 194 */     ActionErrors errors = new ActionErrors();
/* 195 */     T37_risk_attachActionForm form = (T37_risk_attachActionForm)actionForm;
/*     */ 
/* 197 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performAddT37_risk_attachDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 215 */     ActionErrors errors = new ActionErrors();
/*     */ 
/* 217 */     T37_risk_attachDAO t37_risk_attachDAO = (T37_risk_attachDAO)this.context.getBean("t37_risk_attachDAO");
/*     */ 
/* 219 */     FileUpload fileUpload = (FileUpload)this.context.getBean("fileUpload");
/* 220 */     boolean isSucc = false;
/* 221 */     HttpSession session = request.getSession();
/*     */     try {
/* 223 */       T37_risk_attachActionForm form = (T37_risk_attachActionForm)actionForm;
/* 224 */       String attachkey = DateUtils.FormatDate(DateUtils.getCurrDateTime(), "yyyymmdd") + 
/* 225 */         getSequenceNextVal("T37_RISK_TATTCH_SEQ");
/* 226 */       FormFile file = form.getFilename();
/* 227 */       XMLProperties business_config = (XMLProperties)this.context.getBean("busiConfig");
/* 228 */       String i = business_config
/* 229 */         .getProperty("reportXML.attachMaxSize");
/* 230 */       if (file.getFileSize() > Integer.parseInt(i)) {
/* 231 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", 
/* 232 */           "文件大小不能超过2M!"));
/* 233 */         saveErrors(request, errors);
/* 234 */         return actionMapping.findForward("failure");
/*     */       }
/*     */ 
/* 237 */       String fname = file.getFileName();
/* 238 */       InputStream streamIn = file.getInputStream();
/* 239 */       FileUtils fileUtils = new FileUtils();
/* 240 */       String newfname = fileUtils.makeSaveFileName("aml_", attachkey, fname);
/* 241 */       String newFilePathAndPath = fileUpload.uploadFile(newfname, 
/* 242 */         streamIn, "amlattach", "month");
/* 243 */       if ((fname.equals("")) || (fname == null)) {
/* 244 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 245 */           "error.attach.isnull"));
/* 246 */         saveErrors(request, errors);
/* 247 */         return actionMapping.findForward("failure");
/*     */       }
/* 249 */       if ((newFilePathAndPath.equals("")) || (newFilePathAndPath == null)) {
/* 250 */         errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError("error.common", 
/* 251 */           "上传失败!"));
/* 252 */         saveErrors(request, errors);
/* 253 */         return actionMapping.findForward("failure");
/*     */       }
/*     */ 
/* 256 */       AuthBean authBean = new AuthBean();
/* 257 */       Authorization auth = new Authorization();
/* 258 */       authBean = (AuthBean)session.getAttribute("authBean");
/* 259 */       auth = authBean.getAuthToken();
/* 260 */       if ((fname != null) && (!"".equals(fname))) {
/* 261 */         T37_risk_attach ba_aml_attach = new T37_risk_attach();
/* 262 */         ba_aml_attach.setAttach_name(newFilePathAndPath);
/* 263 */         ba_aml_attach.setAttach_realname(fname);
/* 264 */         ba_aml_attach.setResulekey(form.getResulekey());
/* 265 */         ba_aml_attach.setLoad_user(auth.getT00_user().getUsername());
/* 266 */         ba_aml_attach.setLoad_date(DateUtils.getCurrDateTime());
/* 267 */         ba_aml_attach.setAttachkey(attachkey);
/* 268 */         int rows = t37_risk_attachDAO.insertT37_risk_attach(this.sqlMap, 
/* 269 */           ba_aml_attach);
/* 270 */         if (rows <= 0)
/* 271 */           throw new Exception("");
/*     */       }
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 276 */       e.printStackTrace();
/* 277 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 278 */         "error.pagertitle.default"));
/* 279 */       saveErrors(request, errors);
/* 280 */       return actionMapping.findForward("failure");
/*     */     }
/*     */ 
/* 283 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performDeleteT37_risk_attachDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 305 */     ActionErrors errors = new ActionErrors();
/*     */ 
/* 307 */     T37_risk_attachDAO t37_risk_attachDAO = new T37_risk_attachDAO();
/*     */     try {
/* 309 */       T37_risk_attachActionForm form = (T37_risk_attachActionForm)actionForm;
/* 310 */       String attachkey = form.getAttachkey();
/* 311 */       T37_risk_attach attach = t37_risk_attachDAO.getT37_risk_attachDispByAttachkey(this.sqlMap, attachkey);
/*     */ 
/* 313 */       XMLProperties sysConfig = (XMLProperties)this.context.getBean("sysConfig");
/* 314 */       String root = sysConfig.getProperty("data.import");
/*     */ 
/* 316 */       String path = root + attach.getAttach_name();
/* 317 */       File storeFile = new File(path);
/* 318 */       if (storeFile.exists()) {
/* 319 */         storeFile.delete();
/*     */       }
/* 321 */       rows = t37_risk_attachDAO.deleteT37_risk_attach(this.sqlMap, 
/* 322 */         attachkey);
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/*     */       int rows;
/* 324 */       e.printStackTrace();
/* 325 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 326 */         "error.pagertitle.default"));
/* 327 */       saveErrors(request, errors);
/* 328 */       return actionMapping.findForward("failure");
/*     */     }
/* 330 */     return actionMapping.findForward("success");
/*     */   }
/*     */ 
/*     */   public ActionForward performGetT37_risk_attachDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request, HttpServletResponse response)
/*     */   {
/* 348 */     ActionErrors errors = new ActionErrors();
/*     */ 
/* 350 */     T37_risk_attachDAO t37_risk_attachDAO = new T37_risk_attachDAO();
/* 351 */     T37_risk_attach t37_risk_attach = new T37_risk_attach();
/*     */     try {
/* 353 */       T37_risk_attachActionForm form = (T37_risk_attachActionForm)actionForm;
/* 354 */       String resulekey = form.getResulekey();
/* 355 */       t37_risk_attach = t37_risk_attachDAO.getT37_risk_attachDisp(this.sqlMap, 
/* 356 */         resulekey);
/*     */     } catch (Exception e) {
/* 358 */       e.printStackTrace();
/* 359 */       errors.add("org.apache.struts.action.GLOBAL_ERROR", new ActionError(
/* 360 */         "error.pagertitle.default"));
/* 361 */       saveErrors(request, errors);
/* 362 */       return actionMapping.findForward("failure");
/*     */     }
/* 364 */     request.setAttribute("t37_risk_attach", t37_risk_attach);
/*     */ 
/* 366 */     return actionMapping.findForward("success");
/*     */   }
/*     */ }

/* Location:           C:\Users\alca\Desktop\雅安开发程序\istNewrisk.jar
 * Qualified Name:     com.ist.aml.newrisk.controller.T37_risk_attachAction
 * JD-Core Version:    0.6.2
 */