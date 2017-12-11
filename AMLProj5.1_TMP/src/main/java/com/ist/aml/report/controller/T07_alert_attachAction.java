/**
* Create by makecode program v2.0
* 日期             作者 		动作
* 2007-04-03   青蛙		创建
*/

package com.ist.aml.report.controller;

/**
* <p>Title: INFO SENCE AUDIT SYSTEM</p>
* <p>Description: </p>
* <p>Copyright: Copyright (c) 2003 - 2006</p>
* <p>Company: 北京银丰新融科技开发有限公司</p>
* @author 研发组
* @version 1.0
*/

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dao.T07_alert_attachDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_alert_attach;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.properties.XMLProperties;

import com.ist.platform.dto.T00_operate_log;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;

public class T07_alert_attachAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 709934654625602717L;
	private static Logger logger = LogUtils
			.getLogger(T07_alert_attachAction.class.getName());

	/**
	* Action执行入口
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		//预处理myforward = this.preExecute(mapping, form, request, response);//如预处理中强行跳出if("false".equals(request.getAttribute("goWayFlag")))    return myforward;//查询界面
		if ("searchT07_alert_attach".equalsIgnoreCase(myaction)) {
			myforward = performSearchT07_alert_attach(mapping, form, request,
					response);
		}
		//查询结果
		else if ("getT07_alert_attachList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_alert_attachList(mapping, form, request,
					response);
		} else if ("getT07_risk_attachList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_risk_attachList(mapping, form, request,
					response);
		}
		//添加界面
		else if ("addT07_alert_attach".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_alert_attach(mapping, form, request,
					response);
		} else if ("addT07_risk_attach".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_risk_attach(mapping, form, request,
					response);
		}
		//添加动作
		else if ("addT07_alert_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_alert_attachDo(mapping, form, request,
					response);
		} else if ("addT07_risk_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_risk_attachDo(mapping, form, request,
					response);
		}
		//修改界面
		else if ("modifyT07_alert_attach".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_alert_attach(mapping, form, request,
					response);
		}
		//修改动作
		else if ("modifyT07_alert_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_alert_attachDo(mapping, form, request,
					response);
		}
		//删除动作
		else if ("deleteT07_alert_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_alert_attachDo(mapping, form, request,
					response);
		}
		//查询详细信息
		else if ("getT07_alert_attachDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_alert_attachDisp(mapping, form, request,
					response);
		}
		return myforward;

	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performSearchT07_alert_attach(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_alert_attach t07_alert_attach = (T07_alert_attach) session
				.getAttribute("t07_alert_attachSearchObj");
		if (t07_alert_attach == null) {
			t07_alert_attach = new T07_alert_attach();
		}
		T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t07_alert_attach);
			//模糊匹配，需要特殊处理一下
			//form.setRealname(StringUtils.replaceString(t07_alert_attach.getRealname(), "%", ""));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performGetT07_alert_attachList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_alert_attachList;
		String pageInfo = "";
		//
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String alertkey = request.getParameter("alertkey");
			request.setAttribute("alertkey", alertkey);
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			CreditTask creditTask = (CreditTask) session
					.getAttribute("credittask");
			request.setAttribute("application_num", creditTask
					.getApplication_num());
			if (newsearchflag.equals("1")) {//新的查询
				MyBeanUtils.copyBean2Bean(t07_alert_attach, form);
				//模糊匹配，需要特殊处理一下

				t07_alert_attach.setInt_page(intPage);
				t07_alert_attach.setApplication_num(creditTask
						.getApplication_num());
				session.setAttribute("t07_alert_attachSearchObj",
						t07_alert_attach);
			} else {//翻页
				t07_alert_attach = (T07_alert_attach) session
						.getAttribute("t07_alert_attachSearchObj");
			}

			t07_alert_attachList = t07_alert_attachDAO.getT07_alert_attachList(
					sqlMap, t07_alert_attach, this.getStartRec(intPage), this
							.getIntPageSize(),context);
			int totalRow = t07_alert_attachDAO.getT07_alert_attachListCount(
					sqlMap, t07_alert_attach);
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_alert_attachList", t07_alert_attachList);

		//
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performGetT07_risk_attachList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_alert_attachList;
		String pageInfo = "";
		//
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);

			if (newsearchflag.equals("1")) {//新的查询
				MyBeanUtils.copyBean2Bean(t07_alert_attach, form);
				//模糊匹配，需要特殊处理一下
				//if (t07_alert_attach.getRealname() != null) {
				//    t07_alert_attach.setRealname("%" + t07_alert_attach.getRealname() + "%");
				//}
				//t07_alert_attach.setAlertkey(alertkey);
				t07_alert_attach.setInt_page(intPage);
				t07_alert_attach.setApplication_num(request
						.getParameter("resulekey"));

				session.setAttribute("t09_risk_result_key", request
						.getParameter("resulekey"));

				session.setAttribute("t07_alert_attachSearchObj",
						t07_alert_attach);
			} else {//翻页
				t07_alert_attach = (T07_alert_attach) session
						.getAttribute("t07_alert_attachSearchObj");
			}

			t07_alert_attachList = t07_alert_attachDAO.getT07_alert_attachList(
					sqlMap, t07_alert_attach, this.getStartRec(intPage), this
							.getIntPageSize(),context);
			int totalRow = t07_alert_attachDAO.getT07_alert_attachListCount(
					sqlMap, t07_alert_attach);
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("application_num", session
				.getAttribute("t09_risk_result_key"));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_alert_attachList", t07_alert_attachList);

		//
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mpping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performAddT07_alert_attach(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		String alertkey = request.getParameter("alertkey");
		request.setAttribute("alertkey", alertkey);
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mpping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performAddT07_risk_attach(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		String alertkey = request.getParameter("alertkey");
		request.setAttribute("alertkey", alertkey);
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performAddT07_alert_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		XMLProperties busiConfig =(XMLProperties)context.getBean("busiConfig");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
		boolean isSucc = false;
		HttpSession session = request.getSession();
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			//
			MyBeanUtils.copyBean2Bean(t07_alert_attach, form);
			String attachkey = DateUtils.FormatDate(DateUtils.getCurrDateTime(), "yyyymmdd")
					+ this.getSequenceNextVal("T07_ALERT_TATTCH_SEQ");
			CreditTask creditTask = (CreditTask) session
					.getAttribute("credittask");
			FormFile file = form.getFilename();
			String i = busiConfig
					.getProperty("reportXML.attachMaxSize");
			if (file.getFileSize() > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"文件大小不能超过2M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			//获取文件名称和文件大小
			String fname = file.getFileName();
		
			if (fname == null || fname.equals("")) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.attach.isnull"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String newFilePathAndPath=this.uplodeFile(fname, file, attachkey);
			if (newFilePathAndPath.equals("") || newFilePathAndPath == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"上传失败!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			//组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			if (fname != null && !"".equals(fname)) {
				T07_alert_attach ba_aml_attach = new T07_alert_attach();
				ba_aml_attach.setAttach_name(newFilePathAndPath);
				ba_aml_attach.setAttach_realname(fname);
				//    ba_aml_attach.setAlertkey(alertkey);
				ba_aml_attach.setApplication_num(creditTask
						.getApplication_num());
				ba_aml_attach.setLoad_user(auth.getT00_user().getUsername());
				ba_aml_attach.setLoad_date(DateUtils.getCurrDateTime());
				ba_aml_attach.setAttachkey(attachkey);
				int rows = t07_alert_attachDAO.insertT07_alert_attach(sqlMap,
						ba_aml_attach);
				// 1.初始化日志对象
				T00_operate_log t00_operate_log=new T00_operate_log();
				t00_operate_log.setModule_key_sub1("添加案例附件");//子功能点1级
				t00_operate_log.setModule_key_sub2("");//子功能点2级
				t00_operate_log.setOperate_obj1(creditTask.getApplication_num());//操作对象1级
				t00_operate_log.setOperate_obj2("");//操作对象2级
				t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ(String.valueOf(rows));//操作结果 1：成功0：失败
				t00_operate_log.setOperate_desc(fname);//操作描述(操作的表名，用"；"分割)
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);
				if (rows <= 0) {
					throw new Exception("");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward("success");
	}
	public String  uplodeFile(String fname,FormFile file,String attachkey) throws Exception{
		InputStream streamIn = null;
		String newFilePathAndPath =""; 
		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			 streamIn = file.getInputStream();
			FileUtils fileUtils = new FileUtils();
			String newfname = fileUtils.makeSaveFileName("aml_",attachkey, fname);
			 newFilePathAndPath = fileUpload.uploadFile(newfname,
					streamIn, "amlattach", "month");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
		}
		return  newFilePathAndPath;
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performAddT07_risk_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		XMLProperties busiConfig =(XMLProperties)context.getBean("busiConfig");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		FileUpload fileUpload = new FileUpload();
		boolean isSucc = false;
		HttpSession session = request.getSession();
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			//
			MyBeanUtils.copyBean2Bean(t07_alert_attach, form);
			String attachkey = DateUtils.FormatDate(DateUtils.getCurrDateTime(), "yyyymmdd")
					+ this.getSequenceNextVal("T07_ALERT_TATTCH_SEQ");
			FormFile file = form.getFilename();
			
			String i = busiConfig
					.getProperty("business_config.reportXML.attachMaxSize");
			if (file.getFileSize() > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"文件大小不能超过2M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			//获取文件名称和文件大小
			String fname = file.getFileName();
			/*InputStream streamIn = file.getInputStream();
			FileUtils fileUtils = new FileUtils();
			String newfname = fileUtils.makeSaveFileName("aml_",attachkey,fname);
			String newFilePathAndPath = fileUpload.uploadFile(newfname,
					streamIn, "amlattach", "month");*/
			if (fname == null || fname.equals("")) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.attach.isnull"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String newFilePathAndPath =this.uplodeFile(fname, file, attachkey);
			
			if (newFilePathAndPath.equals("") || newFilePathAndPath == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"上传失败!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			//组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			if (fname != null && !"".equals(fname)) {
				T07_alert_attach ba_aml_attach = new T07_alert_attach();
				ba_aml_attach.setAttach_name(newFilePathAndPath);
				ba_aml_attach.setAttach_realname(fname);
				//    ba_aml_attach.setAlertkey(alertkey);
				ba_aml_attach.setApplication_num((String) session
						.getAttribute("t09_risk_result_key"));
				ba_aml_attach.setLoad_user(auth.getT00_user().getUsername());
				ba_aml_attach.setLoad_date(DateUtils.getCurrDateTime());
				ba_aml_attach.setAttachkey(attachkey);
				int rows = t07_alert_attachDAO.insertT07_alert_attach(sqlMap,
						ba_aml_attach);
				if (rows <= 0) {
					throw new Exception("");

				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performModifyT07_alert_attach(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach;
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			String application_num = form.getApplication_num();
			t07_alert_attach = t07_alert_attachDAO.getT07_alert_attachDisp(
					sqlMap, application_num);
			MyBeanUtils.copyBean2Bean(form, t07_alert_attach);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request.setAttribute("t07_alert_attachname", t07_alert_attach
				.getApplication_num());
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performModifyT07_alert_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_alert_attach, form);
			//t07_alert_attach.setModifydate( DateUtils.stringToDateShort( form.getModifydate_disp() ) );
			//
			int rows = t07_alert_attachDAO.modifyT07_alert_attach(sqlMap,
					t07_alert_attach);
			if (rows <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performDeleteT07_alert_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			String attachkey = form.getAttachkey();
			T07_alert_attach t07_alert_attach = new T07_alert_attach();
			String application_num=StringUtils.null2String(form.getApplication_num());
			t07_alert_attach.setApplication_num(application_num);
			t07_alert_attach.setAttachkey(attachkey);
			T07_alert_attach attach=t07_alert_attachDAO.getT07_alert_attachDisp(sqlMap, t07_alert_attach);
			// 取得根路径
			XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
			String root = sysConfig.getProperty("data.import");
			
			String path=root+attach.getAttach_name();
			File storeFile = new File(path);
			if(storeFile.exists()){
				storeFile.delete();   //删除服务器上的文件
			}
			t07_alert_attachDAO.deleteT07_alert_attach(sqlMap, attach);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	*
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performGetT07_alert_attachDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach;
		try {
			T07_alert_attachActionForm form = (T07_alert_attachActionForm) actionForm;
			String application_num = form.getApplication_num();
			t07_alert_attach = t07_alert_attachDAO.getT07_alert_attachDisp(
					sqlMap, application_num);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_alert_attach", t07_alert_attach);
		//
		return actionMapping.findForward("success");
	}
}
