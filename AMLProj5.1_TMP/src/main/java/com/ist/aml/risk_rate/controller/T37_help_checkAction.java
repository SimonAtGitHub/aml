package com.ist.aml.risk_rate.controller;

import java.io.InputStream;
import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import java.util.LinkedHashMap;
import java.util.TreeMap;

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

import com.ist.aml.risk_rate.dao.T37_help_checkDAO;
import com.ist.aml.risk_rate.dao.T37_party_resultDAO;
import com.ist.aml.risk_rate.dto.T37_help_check;
import com.ist.aml.risk_rate.dto.T37_helpcheck_attach;
import com.ist.aml.risk_rate.dto.T37_party_result;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dto.T00_organ;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;
/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */
public class T37_help_checkAction extends BaseAction{

	private static Logger logger = LogUtils.getLogger(T37_help_checkAction.class.getName());
	
	/**
	 * Action执行入口
	 * 
	 * @param mapping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);//如预处理中强行跳出
		if("false".equals(request.getAttribute("goWayFlag"))){
			return myforward;//查询界面
		}
		//评级协查查询列表页面
		else if ("getT37_help_checkList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_help_checkList(mapping, form, request,
					response);
		}//点击客户号时进入详细信息页面
		else if("getT37_help_checkDisp".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_checkDisp(mapping,form,request,response);
		}//点击协查原因时进入详细信息页面
		else if("getT37_help_check_reasonDisp".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_check_reasonDisp(mapping,form,request,response);
		}//点击退回状态时进入详细信息页面
		else if("getT37_help_check_statusDisp".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_check_statusDisp(mapping,form,request,response);
		}//点击客户号详细页面中协查信息展示
		else if("getT37_help_caseDisp".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_caseDisp(mapping,form,request,response);
		}//点击协查信息提交时动作
		else if("updateT37_help_caseDisp".equalsIgnoreCase(myaction)){
			myforward = updateT37_help_caseDisp(mapping,form,request,response);
		}//点击附件信息查询列表
		else if("getT37_help_check_attachList".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_check_attachList(mapping,form,request,response);
		}//删除上传附件
		else if("deleteT37_help_check_attach".equalsIgnoreCase(myaction)){
			myforward = performDeleteT37_help_check_attach(mapping,form,request,response);
		}//上传附件页面
		else if("addT37_help_check_attach".equalsIgnoreCase(myaction)){
			myforward = performAddT37_help_check_attach(mapping,form,request,response);
		}//上传附件动作
		else if("addT37_help_check_attach_do".equalsIgnoreCase(myaction)){
			myforward = performAddT37_help_check_attachDo(mapping,form,request,response);
		}
		////评级协查复核查询列表页面
		else if("getT37_help_recheckList".equalsIgnoreCase(myaction)){
			myforward = performGetT37_help_recheckList(mapping,form,request,response);
		}//评级协查复核通过
		else if("passT37_help_recheck".equalsIgnoreCase(myaction)){
			myforward = performPassT37_help_recheck(mapping,form,request,response);
		}//评级协查复核退回页面
		else if("untreadT37_help_recheck".equalsIgnoreCase(myaction)){
			myforward = performUntreadT37_help_recheck(mapping,form,request,response);
		}//评级协查复核退回动作
		else if("untreadT37_help_recheck_do".equalsIgnoreCase(myaction)){
			myforward = performUntreadT37_help_recheck_do(mapping,form,request,response);
		}
		//lzb startT37_HELPCHECK
	    else if("t37_helpcheck".equalsIgnoreCase(myaction)){
	      myforward = performT37_helpcheck(mapping,form,request,response);
	    }
	    else if("t37_helpcheckDo".equalsIgnoreCase(myaction)){
	      myforward = performT37_helpcheckDo(mapping,form,request,response);
	    }
	    //lzb end
		return myforward;
	}
	
	/**
	 * 评级协查复核退回动作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performUntreadT37_help_recheck_do(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)context.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		T37_help_check t37_help_check = new T37_help_check();
		HttpSession session = request.getSession();
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			
			String check_no = form.getCheck_no();
			String return_reason = form.getReturn_reason();
			String resultkey = request.getParameter("resultkey");
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String userName = auth.getT00_user().getUsername();
			
			t37_help_check.setCheck_no(check_no);
			t37_help_check.setReturn_reason(return_reason);
			t37_help_check.setReturn_user(userName);
			t37_party_result.setHcheck_status("4");
			t37_party_result.setResulekey(resultkey);
			String data_source = form.getData_source();
			if("1".equals(data_source)){
				t37_party_result.setTable_name("T37_PARTY_RESULT");
			}else if("2".equals(data_source)){
				t37_party_result.setTable_name("T37_PRESULT_AUDIT");
			}
			
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			t37_help_checkDAO.updateUntreadT37_help_check_recheck(sqlMap, t37_help_check);
			t37_party_resultDAO.modifyT37_party_resultLastHcheckStatus(sqlMap, t37_party_result);
			
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mapping.findForward("success");
	}

	/**
	 * 评级协查复核退回页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performUntreadT37_help_recheck(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			String check_no = form.getCheck_no();
			request.setAttribute("check_no", check_no);
			request.setAttribute("resultkey", form.getResultkey());
			request.setAttribute("data_source", form.getData_source());
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		return mapping.findForward("success");
	}
	/**
	 * 评级协查复核通过
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performPassT37_help_recheck(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)context.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		T37_help_check thc = new T37_help_check();
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			
			ArrayList<String> list = new ArrayList<String>();
			String[] check_noArr = form.getCheck_noArr();
			for (int i = 0; i < check_noArr.length; i++) {
				String resultKey = check_noArr[i].split(",")[1];
				t37_party_result.setResulekey(resultKey);
				String organKey = check_noArr[i].split(",")[3];
				t37_party_result.setOrgankey(organKey);
				t37_party_result.setHcheck_status("3");
				String data_source = check_noArr[i].split(",")[2];
				if("1".equals(data_source)){
					t37_party_result.setTable_name("T37_PARTY_RESULT");
				}else if("2".equals(data_source)){
					t37_party_result.setTable_name("T37_PRESULT_AUDIT");
				}
				list.add(check_noArr[i].split(",")[0]);
				t37_party_resultDAO.modifyT37_party_resultLastHcheckStatus(sqlMap, t37_party_result);
			}
			thc.setCheck_noList(list);
			int j = t37_help_checkDAO.updateT37_help_recheck(sqlMap,thc);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapping.findForward("success");
	}

	/**
	 * 上传附件动作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performAddT37_help_check_attachDo(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T37_help_checkDAO t37_help_checkDAO =(T37_help_checkDAO)context.getBean("t37_help_checkDAO");
		
		FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
		HttpSession session = request.getSession();
		try {
			T37_helpcheck_attachActionForm form = (T37_helpcheck_attachActionForm) actionForm;
			String attachkey = DateUtils.FormatDate(DateUtils.getCurrDateTime(), "yyyymmdd")
					+ this.getSequenceNextVal("T37_HELPCHECK_ATTACH_SEQ");
			FormFile file = form.getFilename();
			XMLProperties business_config=(XMLProperties)context.getBean("busiConfig");
			String i = business_config
					.getProperty("reportXML.attachMaxSize");
			if (file.getFileSize() > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"文件大小不能超过2M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// 获取文件名称和文件大小
			String fname = file.getFileName();
			InputStream streamIn = file.getInputStream();
			FileUtils fileUtils = new FileUtils();
			String newfname = fileUtils.makeSaveFileName("aml_",attachkey,fname);
			String newFilePathAndPath = fileUpload.uploadFile(newfname,
					streamIn, "amlattach", "month");
			if (fname.equals("") || fname == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.attach.isnull"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			if (newFilePathAndPath.equals("") || newFilePathAndPath == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"上传失败!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// 组织用户所属的机构ID
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			if (fname != null && !"".equals(fname)) {
				T37_helpcheck_attach tha = new T37_helpcheck_attach();
				tha.setAttach_name(newFilePathAndPath);
				tha.setAttach_realName(fname);
				tha.setCheck_no(form.getCheck_no());
				tha.setLoad_user(auth.getT00_user().getUsername());
				tha.setLoad_date(DateUtils.getCurrDateTime());
				tha.setAttachKey(attachkey);
				int rows = t37_help_checkDAO.insertT37_risk_attach(sqlMap,
						tha);
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
	 * 上传附件页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performAddT37_help_check_attach(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_helpcheck_attachActionForm form = (T37_helpcheck_attachActionForm) actionForm;
		return mapping.findForward("success");
	}
	/**
	 * 删除上传附件动作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performDeleteT37_help_check_attach(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		try {
			T37_helpcheck_attachActionForm form = (T37_helpcheck_attachActionForm) actionForm;
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			int i = t37_help_checkDAO.deleteT37_help_check_attach(sqlMap,form.getAttachKey());
			
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return mapping.findForward("success");
	}

	/**
	 * 点击协查信息提交时动作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward updateT37_help_caseDisp(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO)context.getBean("t37_party_result_rateDAO");
		T37_help_check t37_help_check = new T37_help_check();
		T37_party_result t37_party_result = new T37_party_result();
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_help_check, form);
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			if(t37_help_check != null){
				String status_cd = "3";//默认不走流程更改状态为已协查
				if(t87_sysparaMap.get("709").equals("1")){//如果走流程就更改状态为待复核
					status_cd = "2";
				}
				t37_help_check.setStatus_cd(status_cd);
			}
			
			t37_party_result.setResulekey(t37_help_check.getResultkey());
			t37_party_result.setOrgankey(t37_help_check.getOrgankey());
			String data_source = t37_help_check.getData_source();
			t37_party_result.setHcheck_status("2");
			if("1".equals(data_source)){
				t37_party_result.setTable_name("T37_PARTY_RESULT");
			}else if("2".equals(data_source)){
				t37_party_result.setTable_name("T37_PRESULT_AUDIT");
			}
			t37_party_resultDAO.modifyT37_party_resultLastHcheckStatus(sqlMap, t37_party_result);
			
			t37_help_checkDAO.updateT37_help_check_case(sqlMap,t37_help_check);
			
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	/**
	 * 点击客户号详细页面中协查信息展示
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_help_caseDisp(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		T37_helpcheck_attach t37_helpcheck_attach = new T37_helpcheck_attach();
		ArrayList t37_helpcheck_attachList = new ArrayList();
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			t37_help_check = (T37_help_check) t37_help_checkDAO.getT37_help_checkDisp(sqlMap,form.getCheck_no());
			
			t37_helpcheck_attach.setCheck_no(form.getCheck_no());
			
			t37_helpcheck_attachList = t37_help_checkDAO.getT37_help_check_attachList(sqlMap, t37_helpcheck_attach, this.getStartRec(intPage), this.getIntPageSize(), context);
			request.setAttribute("t37_helpcheck_attachList", t37_helpcheck_attachList);
			
			if(form.getPageType()!=null && !"".equals(form.getPageType())){
				t37_help_check.setPageType("1");
			}else{
				t37_help_check.setPageType("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		request.setAttribute("t37_help_check", t37_help_check);
		return mapping.findForward("success");
	}
	/**
	 * 点击退回状态时进入详细信息页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_help_check_statusDisp(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			request.setAttribute("check_no", form.getCheck_no());
			t37_help_check = (T37_help_check) t37_help_checkDAO.getT37_help_check_statusDisp(sqlMap,form.getCheck_no());
			
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		request.setAttribute("t37_help_check", t37_help_check);
		return mapping.findForward("success");
	}
	/**
	 * 点击协查原因时进入详细信息页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_help_check_reasonDisp(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			request.setAttribute("check_no", form.getCheck_no());
			t37_help_check = (T37_help_check) t37_help_checkDAO.getT37_help_check_reasonDisp(sqlMap,form.getCheck_no());
			
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		request.setAttribute("t37_help_check", t37_help_check);
		return mapping.findForward("success");
	}
	/**
	 * 点击客户号时进入详细信息页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_help_checkDisp(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			request.setAttribute("check_no", form.getCheck_no());
			request.setAttribute("party_id", form.getParty_id());
			request.setAttribute("party_class_cd", form.getParty_class_cd());
			t37_help_check = (T37_help_check) t37_help_checkDAO.getT37_help_checkDisp(sqlMap,form.getCheck_no());
			if(form.getPageType() != null && !"".equals(form.getPageType())){
				t37_help_check.setPageType(form.getPageType());
			}else{
				t37_help_check.setPageType("0");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		request.setAttribute("t37_help_check", t37_help_check);
		return mapping.findForward("success");
	}
	/**
	 * 评级协查查询列表页面
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT37_help_checkList(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t37_help_checkList = new ArrayList();
		String pageInfo = "";
		
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			LinkedHashMap statusMap = cm.getMapFromCache("check_help_status");
			request.setAttribute("statusMap", this.getOptionsListByMap(statusMap, null, true));
			LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
			request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
			
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organKey = auth.getT00_user().getOrgankey();
			String organStr = auth.getOrganstr();
			String party_class_cd=form.getParty_class_cd();
			if ("0".equals(newsearchflag)) {
				if("".equals(form.getOrgankey())){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t37_help_checkSearchObj");
			}else if ("1".equals(newsearchflag)) {// 新的查询
				MyBeanUtils.copyBean2Bean(t37_help_check, form);
				t37_help_check.setOrgankey(organKey);
				t37_help_check.setOrganstr(organStr);
				if(form.getStatus_cd()!=null && !"".equals(form.getStatus_cd())){
					t37_help_check.setStatus_cd(form.getStatus_cd());
				}
				if(form.getSend_date_disp() != null && !"".equals(form.getSend_date_disp())){
					String tmp = form.getSend_date_disp();
					t37_help_check.setSend_date_disp(tmp);
					t37_help_check.setSend_date(DateUtils.stringToDateShort(tmp));
				}
				if(form.getSend_date_end_disp() != null && !"".equals(form.getSend_date_end_disp())){
					String tmp = form.getSend_date_end_disp();
					t37_help_check.setSend_date_end_disp(tmp);
					t37_help_check.setSend_date_end(DateUtils.stringToDateShort(tmp));
				}
				if (party_class_cd != null
						&& !"".equals(party_class_cd.trim())) {
					t37_help_check.setParty_class_cd(party_class_cd);
				}
				
				t37_help_check.setInt_page(intPage);
				session.setAttribute("t37_help_checkSearchObj",t37_help_check);
			} else {// 翻页
				t37_help_check = (T37_help_check) session.getAttribute("t37_help_checkSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_help_check);
			}
			if(!"0".equals(newsearchflag)){
				int totalRow = 0;
				t37_help_checkList = t37_help_checkDAO.getT37_help_checkList(sqlMap, t37_help_check, this.getStartRec(intPage), this
					.getIntPageSize());
				totalRow = t37_help_checkDAO.getT37_help_checkListCount(sqlMap, t37_help_check);
				String url = request.getContextPath() + "/risk_rate" + mapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t37_help_checkList", t37_help_checkList);

		//
		return mapping.findForward("success");
	}
	
	/**
	 * 评级协查复核查询列表页面
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT37_help_recheckList(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t37_help_checkList = new ArrayList();
		String pageInfo = "";
		
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			LinkedHashMap clienttypeMap = this.cm.getMapFromCache("clienttype");
			request.setAttribute("clienttypeMap", getOptionsListByMap(clienttypeMap, null, true));
			
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			String party_class_cd=form.getParty_class_cd();
			
			if ("0".equals(newsearchflag)) {
				if("".equals(form.getOrgankey())){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t37_help_checkSearchObj");
			}else if ("1".equals(newsearchflag)) {// 新的查询
				MyBeanUtils.copyBean2Bean(t37_help_check, form);
				t37_help_check.setOrgankey(auth.getT00_user().getUsername());
				t37_help_check.setOrganstr(organStr);
				if(form.getSend_date_disp() != null && !"".equals(form.getSend_date_disp())){
					String tmp = form.getSend_date_disp();
					t37_help_check.setSend_date_disp(tmp);
					t37_help_check.setSend_date(DateUtils.stringToDateShort(tmp));
				}
				if(form.getSend_date_end_disp() != null && !"".equals(form.getSend_date_end_disp())){
					String tmp = form.getSend_date_end_disp();
					t37_help_check.setSend_date_end_disp(tmp);
					t37_help_check.setSend_date_end(DateUtils.stringToDateShort(tmp));
				}
				if (party_class_cd != null
						&& !"".equals(party_class_cd.trim())) {
					t37_help_check.setParty_class_cd(party_class_cd);
				}
				
				t37_help_check.setInt_page(intPage);
				session.setAttribute("t37_help_checkSearchObj",t37_help_check);
			} else {// 翻页
				t37_help_check = (T37_help_check) session.getAttribute("t37_help_checkSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_help_check);
			}
			if(!"0".equals(newsearchflag)){
				int totalRow = 0;
				t37_help_checkList = t37_help_checkDAO.getT37_help_recheckList(sqlMap, t37_help_check, this.getStartRec(intPage), this
					.getIntPageSize());
				totalRow = t37_help_checkDAO.getT37_help_checkListCount(sqlMap, t37_help_check);
				String url = request.getContextPath() + "/risk_rate" + mapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t37_help_checkList", t37_help_checkList);

		//
		return mapping.findForward("success");
	}
	
	/**
	 * 点击附件信息查询列表
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_help_check_attachList(
			ActionMapping mapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ArrayList t37_helpcheck_attachList = new ArrayList();
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_helpcheck_attach t37_helpcheck_attach = new T37_helpcheck_attach();
		HttpSession session = request.getSession();
		String pageInfo = "";
		T37_help_check t37_help_check = new T37_help_check();
		try {
			T37_helpcheck_attachActionForm form = (T37_helpcheck_attachActionForm) actionForm;
			t37_help_check = (T37_help_check) t37_help_checkDAO.getT37_help_checkDisp(sqlMap,form.getCheck_no());
			request.setAttribute("t37_help_check", t37_help_check);
			MyBeanUtils.copyBean2Bean(t37_helpcheck_attach, form);
			session.setAttribute("t37_helpcheck_attachSearchObj", t37_helpcheck_attach);
			
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			t37_helpcheck_attachList = t37_help_checkDAO.getT37_help_check_attachList(sqlMap, t37_helpcheck_attach, this.getStartRec(intPage), this.getIntPageSize(), context);
			int totalRow = t37_help_checkDAO.getT37_help_check_attachListCount(sqlMap, t37_helpcheck_attach);
			String url = request.getContextPath() + "/risk_rate" + mapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t37_helpcheck_attachList", t37_helpcheck_attachList);
		return mapping.findForward("success");
	}
	/**
	 * 发起协查页面
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performT37_helpcheck(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			String party_id=form.getParty_id();
			String party_chn_name=URLDecoder.decode(form.getParty_chn_name(),"UTF-8");
			TreeMap leftHash=new TreeMap();
			ArrayList organList=t37_help_checkDAO.getRisk_party_acctOrganList(sqlMap, party_id);
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			for(int i=0;i<organList.size();i++){
	    		T00_organ t00_organ=(T00_organ)organList.get(i);
	    		if(t00_organ.getOrgankey()!=null && !leftHash.containsKey(t00_organ.getOrgankey()) && organMap.get(t00_organ.getOrgankey())!=null){
	    		leftHash.put(t00_organ.getOrgankey(), (String)organMap.get(t00_organ.getOrgankey()));
	    		}
	    	}
	    	TreeMap  rightHash= new TreeMap();
	        String multiSeHTMLStr = StaticMethod.getMultiSelHTML("list1", "list2", "hi", leftHash, rightHash, 8);
            request.setAttribute("multiSeHTMLStr", multiSeHTMLStr);
            request.setAttribute("party_chn_name", party_chn_name);
            String backurl=StringUtils.null2String(request.getParameter("backurl"));
            String tempcategory=StringUtils.null2String(request.getParameter("tempcategory"));
            String rate_source=StringUtils.null2String(request.getParameter("rate_source"));
            backurl=backurl+"&tempcategory="+tempcategory+"&rate_source="+rate_source;
			request.setAttribute("backurl", backurl);
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}
		return mapping.findForward("success");
	}
	/**
	 * 发起协查动作
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performT37_helpcheckDo(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
		T37_help_check t37_help_check= new T37_help_check();
		T37_party_result t37_party_result = new T37_party_result();
		try {
			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth =authBean.getAuthToken();
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_help_check, form);
			String hcheck_status="1"; //待协查
			String[] list=request.getParameterValues("list2");
			t37_party_result.setResulekey(form.getResultkey());
			t37_party_result.setOrgankey(form.getOrgankey());
			t37_party_result.setHcheck_status(hcheck_status);
			String table_name="T37_PARTY_RESULT";
			if(form.getRate_source().equals("2")){
				table_name="T37_PRESULT_AUDIT";
			}
			t37_party_result.setTable_name(table_name);
			sqlMap.startTransaction();
			t37_party_resultDAO.modifyT37_party_resultLastHcheckStatus(sqlMap, t37_party_result);
			for(int i=0;i<list.length;i++){
				String organkey=(String)list[i];
				String check_no=DateUtils.getDate10to8(DateUtils.getCurrTime())
				+this.getSequenceNextVal("T37_HELPCHECK_SEQ");
				t37_help_check.setCheck_no(check_no);
				t37_help_check.setOrgankey(form.getOrgankey());//发起协查时，ORGANKEY应该设置为客户的归属机构
				t37_help_check.setSend_org(auth.getT00_user().getOrgankey());
				t37_help_check.setSend_date(DateUtils.getCurrDateTime());
				t37_help_check.setSend_user(auth.getT00_user().getUsername());
				t37_help_check.setCheck_org(organkey);
				t37_help_check.setStatus_cd(hcheck_status);
				t37_help_check.setData_source(form.getRate_source());
				t37_help_checkDAO.insertT37_help_check(sqlMap, t37_help_check);
				
			}
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			return mapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		request.setAttribute("backurl", backurl);
		return mapping.findForward("success");
	}
	
	
	
	
	
	
	
	
	
	
	
	
}