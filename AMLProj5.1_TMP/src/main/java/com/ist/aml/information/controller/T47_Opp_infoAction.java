package com.ist.aml.information.controller;

/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组-lijie
 * @version 4.0.1
 */
import java.util.ArrayList;
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

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.information.dao.T47_Opp_infoDAO;
import com.ist.aml.information.dto.T47_Opp_info;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.util.Constans;
import com.ist.util.StringUtils;


public class T47_Opp_infoAction extends BaseAction{

	private static Logger logger = LogUtils.getLogger(
			T47_Opp_infoAction.class.getName()).getLogger(Constans.LOGGERNAMEA);

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
		//预处理
		myforward = this.preExecute(mapping, form, request, response);
		//如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;//查询界面
		if ("searchT47_Opp_info".equalsIgnoreCase(myaction)) {
			myforward = performSearchT47_Opp_info(mapping, form, request,
					response);
		}
		//查询结果
		else if ("getT47_Opp_infoList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_Opp_infoList(mapping, form, request,
					response);
		}
		//案例中交易补录选择对手信息
		else if ("getT47case_Opp_infoList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47case_Opp_infoList(mapping, form, request,
					response);
		}
		//添加界面
		else if ("addT47_Opp_info".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_Opp_info(mapping, form, request, response);
		}

		//添加动作
		else if ("addT47_Opp_infoDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_Opp_infoDo(mapping, form, request,
					response);
		}
		//修改界面
		else if ("modifyT47_Opp_info".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_Opp_info(mapping, form, request,
					response);
		}
		//修改动作
		else if ("modifyT47_Opp_infoDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_Opp_infoDo(mapping, form, request,
					response);
		}
		//删除动作
		else if ("deleteT47_Opp_infoDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT47_Opp_infoDo(mapping, form, request,
					response);
		}
		//查询详细信息
		else if ("getT47_Opp_infoDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_Opp_infoDisp(mapping, form, request,
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
	public ActionForward performSearchT47_Opp_info(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_Opp_info t47_opp_info = (T47_Opp_info) session
				.getAttribute("t47_opp_infoSearchObj");
		if (t47_opp_info == null) {
			t47_opp_info = new T47_Opp_info();
		}
		T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t47_opp_info);
			//模糊匹配，需要特殊处理一下
			//form.setRealname(StringUtils.replaceString(t47_opp_info.getRealname(), "%", ""));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		return actionMapping.findForward("success");
	}

	/**
	* add by dingke
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performGetT47_Opp_infoList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_opp_infoList = new ArrayList();
		String pageInfo = "";
		//
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info = new T47_Opp_info();
		try {

			LinkedHashMap  clienttypeMap = cm.getMapFromCache("pbc_cttp"); //客户类型
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));
			LinkedHashMap  accttypeMap = cm.getMapFromCache("pbc_catp"); //帐户类型
			request.setAttribute("accttypeMap", this.getOptionsListByMap(
					accttypeMap, null, true));
			LinkedHashMap  card_typeMap = cm.getMapFromCache("card_type"); //证件类型
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			LinkedHashMap  oppsortMap = cm.getMapFromCache("oppsort"); //对手信息
			request.setAttribute("oppsortMap", this.getOptionsListByMap(
					oppsortMap, null, true));
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			/*	String sflag = StringUtils.nullObject2String( request.getParameter("sflag") );*/
			String newenterflag = StringUtils.nullObject2String(request
					.getParameter("newenterflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);

			logger.debug(":::::::111:::" + form.getOpp_acct_type_cd_s());
			if (newsearchflag.equals("1") || newenterflag.equals("1")) {//新的查询
				MyBeanUtils.copyBean2Bean(t47_opp_info, form);
				//	模糊匹配，需要特殊处理一下
				logger.debug("::::::::::" + form.getOpp_acct_type_cd_s());
				t47_opp_info
						.setOpp_acct_type_cd_s(form.getOpp_acct_type_cd_s());
				t47_opp_info.setOpp_card_type_s(form.getOpp_card_type_s());
				if (!form.getOpp_name_s().equals("")) {
					t47_opp_info.setOpp_name("%" + form.getOpp_name_s() + "%");
				}
				intPage = 0;
				t47_opp_info.setIntPage("0"); //
				session.setAttribute("t47_opp_infoSearchObj", t47_opp_info); //
			} else {//翻页
				t47_opp_info = (T47_Opp_info) session
						.getAttribute("t47_opp_infoSearchObj");
				intPage = StringUtils.nullObject2int(request
						.getParameter("intPage"), 0);
				if (intPage == 0) {//如果是从其他页面返回（从其他页面返回时不能带inpPage参数）
					intPage = StringUtils.nullObject2int(t47_opp_info
							.getIntPage());
				}
				t47_opp_info.setIntPage("" + intPage);
				session.setAttribute("t07_alertSearchObj", t47_opp_info);
			}
			int totalRow = 0;
			if (!newenterflag.equals("1")) {
				t47_opp_infoList = t47_opp_infoDAO.getT47_Opp_infoList(sqlMap,
						t47_opp_info, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_opp_infoDAO.getT47_Opp_infoListCount(sqlMap,
						t47_opp_info);
			}
			String url = request.getContextPath() + "/information"
					+ actionMapping.getPath() + ".do?sflag=1";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_opp_info", t47_opp_info);
		request.setAttribute("t47_opp_infoList", t47_opp_infoList);

		return actionMapping.findForward("success");
	}

	/**
	*add by dingke  案例中交易补录选择对手信息
	* @param mapping ActionMapping
	* @param form ActionForm
	* @param request HttpServletRequest
	* @param response HttpServletResponse
	* @return ActionForward
	*/
	public ActionForward performGetT47case_Opp_infoList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_opp_infoList = new ArrayList();
		String pageInfo = "";
		//
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info = new T47_Opp_info();
		try {


			LinkedHashMap  clienttypeMap = cm.getMapFromCache("pbc_cttp"); //客户类型
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));
			LinkedHashMap  accttypeMap = cm.getMapFromCache("pbc_catp"); //帐户类型
			request.setAttribute("accttypeMap", this.getOptionsListByMap(
					accttypeMap, null, true));
			LinkedHashMap  card_typeMap = cm.getMapFromCache("card_type"); //证件类型
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			LinkedHashMap  oppsortMap = cm.getMapFromCache("oppsort"); //对手信息
			request.setAttribute("oppsortMap", this.getOptionsListByMap(
					oppsortMap, null, true));
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);
			int totalRow = 0;
		if(newsearchflag.equals("2")){
			intPage=0;
		}else{
			if (newsearchflag.equals("1")) {//新的查询
				MyBeanUtils.copyBean2Bean(t47_opp_info, form);
				//	模糊匹配，需要特殊处理一下

				if (!t47_opp_info.getOpp_name_s().equals("")) {
					t47_opp_info.setOpp_name("%" + t47_opp_info.getOpp_name_s()
							+ "%");
				}
				session.setAttribute("t47_opp_infoSearchObj", t47_opp_info);
			} else  {//翻页
				t47_opp_info = (T47_Opp_info) session
						.getAttribute("t47_opp_infoSearchObj");
			}
				t47_opp_infoList = t47_opp_infoDAO.getT47_Opp_infoList(sqlMap,
						t47_opp_info, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_opp_infoDAO.getT47_Opp_infoListCount(sqlMap,
						t47_opp_info);
				
			
		}
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_opp_infoList", t47_opp_infoList);

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
	public ActionForward performAddT47_Opp_info(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		LinkedHashMap  clienttypeMap = cm.getMapFromCache("pbc_cttp"); //客户类型
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));
		LinkedHashMap  accttypeMap = cm.getMapFromCache("pbc_catp"); //帐户类型
		request.setAttribute("accttypeMap", this.getOptionsListByMap(
				accttypeMap, null, true));
		LinkedHashMap  card_typeMap = cm.getMapFromCache("card_type"); //证件类型
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));
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
	public ActionForward performAddT47_Opp_infoDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info = new T47_Opp_info();
		boolean isSucc = false;
		try {
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_opp_info, form);
			String id = this.getSequenceNextVal("t07_opp_info");
			System.out.print("==========================" + id);
			t47_opp_info.setOpp_sys_id(id);
			if("19".equals(t47_opp_info.getOpp_card_type())||"29".equals(t47_opp_info.getOpp_card_type()))
			{
				t47_opp_info.setOpp_card_type(t47_opp_info.getOpp_card_type()+t47_opp_info.getOpp_card_type_inf());
			}
			int rows = t47_opp_infoDAO.insertT47_Opp_info(sqlMap, t47_opp_info);
			if (rows <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	public ActionForward performModifyT47_Opp_info(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info;
		try {
			LinkedHashMap  clienttypeMap = cm.getMapFromCache("pbc_cttp"); //客户类型
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));
			LinkedHashMap  accttypeMap = cm.getMapFromCache("pbc_catp"); //帐户类型
			request.setAttribute("accttypeMap", this.getOptionsListByMap(
					accttypeMap, null, true));
			LinkedHashMap  card_typeMap = cm.getMapFromCache("card_type"); //证件类型
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));

			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			String[] opp_sys_ids = form.getOpp_sys_ids();
			t47_opp_info = t47_opp_infoDAO.getT47_Opp_infoDisp(sqlMap,
					opp_sys_ids[0]);
			String cardtype= t47_opp_info.getOpp_card_type();
			if(cardtype.startsWith("19")||cardtype.startsWith("29"))
			{
				
				t47_opp_info.setOpp_card_type(cardtype.substring(0,2));
				t47_opp_info.setOpp_card_type_inf(cardtype.substring(2));
			}
			MyBeanUtils.copyBean2Bean(form, t47_opp_info);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request.setAttribute("t47_opp_infoname", t47_opp_info.getOpp_sys_id());
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
	public ActionForward performModifyT47_Opp_infoDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info = new T47_Opp_info();
		try {
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_opp_info, form);
			if("19".equals(t47_opp_info.getOpp_card_type())||"29".equals(t47_opp_info.getOpp_card_type()))
			{
				t47_opp_info.setOpp_card_type(t47_opp_info.getOpp_card_type()+t47_opp_info.getOpp_card_type_inf());
			}
			int rows = t47_opp_infoDAO.modifyT47_Opp_info(sqlMap, t47_opp_info);
			if (rows <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	public ActionForward performDeleteT47_Opp_infoDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		try {
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			String[] opp_sys_ids = form.getOpp_sys_ids();
			for (int i = 0; i < opp_sys_ids.length; i++) {
				String opp_sys_id = opp_sys_ids[i];
				int rows = t47_opp_infoDAO.deleteT47_Opp_info(sqlMap,
						opp_sys_id);
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	public ActionForward performGetT47_Opp_infoDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_Opp_info t47_opp_info;
		try {
			T47_Opp_infoActionForm form = (T47_Opp_infoActionForm) actionForm;
			String opp_sys_id = form.getOpp_sys_id();
			t47_opp_info = t47_opp_infoDAO.getT47_Opp_infoDisp(sqlMap,
					opp_sys_id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_opp_info", t47_opp_info);
		//
		return actionMapping.findForward("success");
	}

}
