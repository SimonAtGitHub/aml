/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2012-08-30] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.blacklist.controller;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ist.aml.blacklist.dao.T52_def_tempDAO;
import com.ist.aml.blacklist.dto.T52_def_temp;
import com.ist.aml.newrisk.dao.T31_def_tempDAO;
import com.ist.aml.newrisk.dto.T31_def_temp;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

/**
 * 道琼斯模板Action
 * @author liuzp
 *
 */
public class T52_def_tempAction extends BaseAction
{

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
			HttpServletRequest request, HttpServletResponse response)
	{
		
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		
		
		if ("getT52_def_tempList".equalsIgnoreCase(myaction))				// 查询结果
		{
			myforward = performGetT52_def_tempList(mapping, form, request,
					response);
		}
		
		
		else if ("addT52_def_temp".equalsIgnoreCase(myaction))				// 添加界面
		{
			myforward = performAddT52_def_temp(mapping, form, request, response);
		}
		
		
		
		else if ("addT52_def_tempDo".equalsIgnoreCase(myaction))			// 回溯添加动作
		{
			myforward = performAddT52_def_tempDo(mapping, form, request,
					response, true);
		}
		
		else if ("md_addT52_def_tempDo".equalsIgnoreCase(myaction))			// 名单添加动作
		{
			myforward = performAddT52_def_tempDo(mapping, form, request,
					response, false);
		}
		
		
		else if ("modifyT52_def_temp_main".equalsIgnoreCase(myaction))		// 修改主界面
		{
			myforward = performModifyT52_def_temp_main(mapping, form, request,
					response);
		}
		
		else if ("modifyT52_def_temp".equalsIgnoreCase(myaction))			// 修改基本属性界面
		{
			myforward = performModifyT52_def_temp(mapping, form, request,
					response);
		}
		
		else if ("modifyT52_def_tempDo".equalsIgnoreCase(myaction))			// 基本属性界面修改动作
		{
			myforward = performModifyT52_def_tempDo(mapping, form, request,
					response);
		}
		
		
		/* 模板执行粒度表操作 */
		
		else if ("getT52_def_temp_granList".equalsIgnoreCase(myaction))		// 页签：模板执行粒度表List
		{
			myforward = performGetT52_def_temp_granList(mapping, form, request,
					response);
		}
		
		else if ("addT52_def_temp_gran".equalsIgnoreCase(myaction))			// 添加模板执行粒度
		{
			myforward = performAddT52_def_temp_gran(mapping, form, request,
					response);
		} else if ("addT52_def_temp_granDo".equalsIgnoreCase(myaction))		// 添加模板执行粒度提交
		{
			myforward = performAddT52_def_temp_granDo(mapping, form, request,
					response);
		}
		
		else if ("modT52_def_temp_gran".equalsIgnoreCase(myaction))			// 修改模板执行粒度
		{
			myforward = performModT52_def_temp_gran(mapping, form, request,
					response);
		} else if ("modT52_def_temp_granDo".equalsIgnoreCase(myaction))		// 修改模板执行粒度提交
		{
			myforward = performModT52_def_temp_granDo(mapping, form, request,
					response);
		}
		
		else if ("delT52_def_temp_gran".equalsIgnoreCase(myaction))			// 删除模板执行粒度
		{
			myforward = performDelT52_def_temp_gran(mapping, form, request,
					response);
		}
		
		
		else if ("getT52_def_temp_sqlList".equalsIgnoreCase(myaction))		// 查询模板SQL列表
		{
			myforward = performGetT52_def_temp_sqlList(mapping, form, request,
					response);
		}
		
		
		else if ("changeT52_def_tempFlag".equalsIgnoreCase(myaction))		// 修改模板启禁用状态
		{
			myforward = performChangeT52_def_tempFlag(mapping, form, request,
					response);
		}
		
		
		else if ("copyT52_def_temp".equalsIgnoreCase(myaction))				// 复制模板
		{
			myforward = performCopyT52_def_temp(mapping, form, request,
					response);
		}
		
		// 删除动作
		else if ("deleteT52_def_tempDo".equalsIgnoreCase(myaction))
		{
			myforward = performDeleteT52_def_tempDo(mapping, form, request,
					response);
		}
		
		
		
		// 查询详细信息jf
		else if ("getT31_def_tempDisp".equalsIgnoreCase(myaction))
		{
			myforward = performGetT31_def_tempDisp(mapping, form, request,
					response);
		}
		
		// 查询详细信息gs
		else if ("getT31_def_tempDisp_gs".equalsIgnoreCase(myaction))
		{
			myforward = performGetT31_def_tempDisp_gs(mapping, form, request,
					response);
		}
		
		
		return myforward;

	}

	/**
	 * 模型列表页面
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
	public ActionForward performGetT52_def_tempList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		ArrayList t52_def_tempList = null;
		
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO)context.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			// 客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
			request.setAttribute("clienttypeMap",
					this.getOptionsListByMap(clienttypeMap, null, true));
			// 模板状态
			LinkedHashMap tflagMap = cm.getMapFromCache("flag");
			request.setAttribute("tflagMap",
					this.getOptionsListByMap(tflagMap, null, true));
			// 评级周期
			LinkedHashMap granularityMap = cm
					.getMapFromCache("risk_granularitys");
			request.setAttribute("granularityMap",
					this.getOptionsListByMap(granularityMap, null, true));
			// 模板类别
			LinkedHashMap tcategoryMap = cm
					.getMapFromCache("template_category");
			request.setAttribute("tcategoryMap",
					this.getOptionsListByMap(tcategoryMap, null, true));
			// 是否覆盖
			LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
			request.setAttribute("coverMap",
					this.getOptionsListByMap(coverMap, null, true));
			// 数据粒度
			// LinkedHashMap data_granularityMap =
			// cm.getMapFromCache("data_granularity");
			// request.setAttribute("data_granularityMap",
			// this.getOptionsListByMap(
			// data_granularityMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			form.setTemplatename(form.getTemplatename_s());

			String temptype = StringUtils.nullObject2String(request
					.getParameter("temptype"));
			request.setAttribute("temptype", temptype);
			// 获取用户登录信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();

//			t52_def_temp.setOrgankeystr(auth.getOrganstr());				// 机构信息

			String url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do";
																			// 分页
			t52_def_temp = (T52_def_temp) this.getSearchObject(t52_def_temp,
					request, form, "getT52_def_tempListCount", url);
			if (t52_def_temp.getNewsearchflag().equals("1"))
			{
				// 个性化的查询条件

				saveSearchObject(t52_def_temp, request);
			} else{				
				MyBeanUtils.copyBean2Bean(form, t52_def_temp);
			}
			t52_def_tempList = t52_def_tempDAO.getT52_def_tempList(sqlMap,
					t52_def_temp, this.getStartRec(t52_def_temp.getIntPage()),
					this.getIntPageSize());
			logger.info(t52_def_tempList);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t52_def_tempList", t52_def_tempList);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * 模型添加
	 * @param mpping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performAddT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();

		// 客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		// 模板类型
		LinkedHashMap temptypeMap = cm.getMapFromCache("temptype");
		request.setAttribute("temptypeMap",
				this.getOptionsListByMap(temptypeMap, null, true));
		// 是否已使用
		LinkedHashMap tagMap = cm.getMapFromCache("yesNo");
		request.setAttribute("tagMap",
				this.getOptionsListByMap(tagMap, null, true));
		// 模板粒度
		LinkedHashMap granularityMap = cm.getMapFromCache("risk_granularitys");
		request.setAttribute("granularityMap",
				this.getOptionsListByMap(granularityMap, null, true));
		// 模板类别
		LinkedHashMap tcategoryMap = cm.getMapFromCache("template_category");
		request.setAttribute("tcategoryMap",
				this.getOptionsListByMap(tcategoryMap, null, true));
		// 是否覆盖
		LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
		request.setAttribute("coverMap",
				this.getOptionsListByMap(coverMap, null, true));
		// 数据粒度
		// LinkedHashMap data_granularityMap =
		// cm.getMapFromCache("data_granularity");
		// request.setAttribute("data_granularityMap", this.getOptionsListByMap(
		// data_granularityMap, null, true));

		return actionMapping.findForward("success");
	}

	/**
	 * 添加模型确认
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
	public ActionForward performAddT52_def_tempDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response, boolean flag)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = "PKT_T52" + this.getSequenceNextVal("SEQ_T31_DEF_TEMP");
			form.setTemplatekey(key);
			// 属性赋值
			PropertyUtils.copyProperties(t52_def_temp, form);
			
			// 设置匹配条件
			String card_no_str = form.getCard_no();
			String name = form.getName();
			String country_cd = form.getCountry_cd();
			if(flag)									// 回溯添加提交
			{				
				Map<String, String> matchconditionMap = new HashMap<String, String>();
				matchconditionMap.put("card_no", card_no_str);
				matchconditionMap.put("name", name);
				matchconditionMap.put("country_cd", country_cd);
				
				JSONObject matchconditionMapJson = JSONObject.fromObject(matchconditionMap);
				t52_def_temp.setMatchcondition(matchconditionMapJson.toString());
				t52_def_temp.setModuletype("1");
			} else 										// 名单添加提交
			{
				t52_def_temp.setMatchcondition(null);
				t52_def_temp.setModuletype("0");
			}
			
			t52_def_temp.setTemplatekey(key);
			t52_def_temp.setParty_class_cd(form.getParty_class_cd());
			t52_def_temp.setFlag("0");
			t52_def_temp.setIs_build("0");
			t52_def_temp.setCreate_user(auth.getT00_user().getUsername());
			t52_def_temp.setCreate_org(auth.getT00_user().getOrgankey());
			t52_def_temp.setCreate_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			String str = form.getCalculateseq_str();
			if (str.equals("") || str == null)
				t52_def_temp.setCalculateseq(Integer.valueOf("1").intValue());
			else
				t52_def_temp.setCalculateseq(Integer.parseInt(str));
			sqlMap.endTransaction();
			sqlMap.startTransaction();

			/**** add模板t52_b_def_temp ******/
			int rows = t52_def_tempDAO.insertT52_b_def_temp(sqlMap, t52_def_temp);
			

			sqlMap.commitTransaction();
			if (rows <= 0)
			{
				throw new Exception("模板添加失败！");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	/**
	 * 修改主界面
	 */
	public ActionForward performModifyT52_def_temp_main(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			// 获取操作明细
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);

			PropertyUtils.copyProperties(form, t52_def_temp);

		} catch (Exception e)
		{
			e.printStackTrace();
			logger.error("异常", e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 基本属性修改
	 */
	public ActionForward performModifyT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		ArrayList granList = new ArrayList();
		boolean flag = false;
		try
		{
			// 客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
			request.setAttribute("clienttypeMap",
					this.getOptionsListByMap(clienttypeMap, null, true));
			// 模板类型
			LinkedHashMap temptypeMap = cm.getMapFromCache("temptype");
			request.setAttribute("temptypeMap",
					this.getOptionsListByMap(temptypeMap, null, true));
			// 是否已使用
			LinkedHashMap tagMap = cm.getMapFromCache("yesNo");
			request.setAttribute("tagMap",
					this.getOptionsListByMap(tagMap, null, true));
			// 模板粒度
			LinkedHashMap granularityMap = cm
					.getMapFromCache("risk_granularitys");
			request.setAttribute("granularityMap",
					this.getOptionsListByMap(granularityMap, null, true));
			// 模板类别
			LinkedHashMap tcategoryMap = cm
					.getMapFromCache("template_category");
			request.setAttribute("tcategoryMap",
					this.getOptionsListByMap(tcategoryMap, null, true));
			// 是否覆盖
			LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
			request.setAttribute("coverMap",
					this.getOptionsListByMap(coverMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			// 设置查询条件
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);
			if("1".equalsIgnoreCase(t52_def_temp.getModuletype()))		// 回溯模板
			{
				String matchconditionStr = t52_def_temp.getMatchcondition();
				JSONObject mdJson = JSONObject.fromObject(matchconditionStr);
				
				form.setCard_no(StringUtils.null2String(mdJson.getString("card_no")));				
				form.setName(StringUtils.null2String(mdJson.getString("name")));
				form.setCountry_cd(StringUtils.null2String(mdJson.getString("country_cd")));
				flag = true;
			} 
			
			
			PropertyUtils.copyProperties(form, t52_def_temp);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t52_def_tempname", t52_def_temp.getTemplatekey());
		if(flag){
			return actionMapping.findForward("success");			
		} else {
			return actionMapping.findForward("namelist");
		}
	}

	/**
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
	public ActionForward performModifyT52_def_tempDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		// 客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			PropertyUtils.copyProperties(t52_def_temp, form);
			String key = form.getTemplatekey();

			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			// 设置匹配条件
			String card_no_str = form.getCard_no();
			String name = form.getName();
			String country_cd = form.getCountry_cd();
			Map<String, String> matchconditionMap = new HashMap<String, String>();
			matchconditionMap.put("card_no", card_no_str);
			matchconditionMap.put("name", name);
			matchconditionMap.put("country_cd", country_cd);
			JSONObject matchconditionMapJson = JSONObject.fromObject(matchconditionMap);
			t52_def_temp.setMatchcondition(matchconditionMapJson.toString());
			
			t52_def_tempDAO.modifyT52_def_temp(sqlMap, t52_def_temp);
			
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/** 页签：模板执行粒度表List */
	public ActionForward performGetT52_def_temp_granList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		ArrayList granList = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			granList = t52_def_tempDAO.getT52_def_temp_granList(sqlMap, key);
//			// 获取操作明细
//			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);
			
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("granList", granList);
		
			return actionMapping.findForward("success");
	}

	/** 添加模板执行粒度 */
	public ActionForward performAddT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		boolean flag = false;
		
		// 客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			// 数据粒度，SQL执行粒度
			LinkedHashMap data_granularityMap = cm
					.getMapFromCache("data_granularity");
			request.setAttribute("data_granularityMap",
					this.getOptionsListByMap(data_granularityMap, null, true));

			String templatekey = StringUtils.null2String(request
					.getParameter("templatekey"));
			request.setAttribute("templatekey", templatekey);
			
			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp.getModuletype()))
			{
				flag = true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if(flag){			
			return actionMapping.findForward("success_hs");
		} else {
			return actionMapping.findForward("success_md");
		}
	}

	
	/** 添加模板执行粒度提交 */
	public ActionForward performAddT52_def_temp_granDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		boolean flag = false;
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;

			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/**** 1. add模板执行粒度表T31_DEF_TEMP_GRAN ******/
			String sqlkey = this.getSequenceNextVal("SEQ_T31_DEF_TEMP_SQL");
			t52_def_temp.setSqlkey(sqlkey);
			t52_def_temp.setTemplatekey(form.getTemplatekey());
			t52_def_temp.setDatagranularity(form.getDatagranularity());
			t52_def_temp.setSqlgranularity(form.getSqlgranularity());
			
			int row1 = t52_def_tempDAO.insertT52_b_def_temp_gran(sqlMap, t52_def_temp);
			
			T52_def_temp t52_def_temp2 = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp2.getModuletype()))
			{
				flag = true;
			}

			/**** 2. add模板数据sql表T52_B_DEF_TEMP_SQL ******/
			String totalSize = request.getParameter("totalSize");
			int length = Integer.parseInt(totalSize);

			String message = "";
			
			//int row2 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			for (int i = 1; i <= length; i++)
			{
				String gsSql = request.getParameter("selsql" + i);
				if (gsSql != null && !gsSql.equals(""))
				{
					
					// 关键子信息
					if(gsSql.toLowerCase().contains("delete")||gsSql.toLowerCase().contains("insert")||gsSql.toLowerCase().contains("update"))
					{
						message = "第"+i+"条sql  不能存在delete，insert， update关键字";
					} else if (!sqlHasAs(gsSql))
					{
						message = "第"+i+"条sql 必须用as做别名";
					} 
					/*else if(!t52_def_tempDAO.validateSql(sqlMap, gsSql))
					{
						message = "第"+i+"条sql 语法不正确";
					}*/
					
					
					if (!"".equalsIgnoreCase(message)){
						ArrayList sqlList = new ArrayList();
						sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
						request.setAttribute("sqlList", sqlList);
						request.setAttribute("err", message);
						if(flag){
							return actionMapping.findForward("failure_hs");
						} else {
							return actionMapping.findForward("failure_md");
						}
					}
					
					String gsSqlNum = request.getParameter("exeseq" + i);
					logger.info(t52_def_temp.getSqlkey());
					logger.info(t52_def_temp.getTemplatekey());
					t52_def_temp.setSql_str(gsSql.trim());
					t52_def_temp.setCalsql(gsSqlNum);
					t52_def_tempDAO.t52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}
			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	/** 修改模板执行粒度 */
	public ActionForward performModT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp_gran = new T52_def_temp();
		ArrayList sqlList = new ArrayList();
		boolean flag = false;
		try
		{
			// 数据粒度，SQL执行粒度
			LinkedHashMap data_granularityMap = cm
					.getMapFromCache("data_granularity");
			request.setAttribute("data_granularityMap",
					this.getOptionsListByMap(data_granularityMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = form.getSqlkeys()[0];

			t52_def_temp_gran = t52_def_tempDAO.getT52_def_temp_granDisp(
					sqlMap, sqlkey);
			sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
			
			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp.getModuletype()))
			{
				flag = true;
			}
			
			PropertyUtils.copyProperties(form, t52_def_temp_gran);

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("sqlList", sqlList);
		if(flag)
		{
			return actionMapping.findForward("success_hs");
		} else {			
			return actionMapping.findForward("success_md");
		}
	}

	public ActionForward performModT52_def_temp_granDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		boolean flag = false;
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = form.getSqlkey();

			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/**** 1. mod模板执行粒度表T52_B_DEF_TEMP_GRAN ******/
			t52_def_temp.setSqlkey(sqlkey);
			t52_def_temp.setTemplatekey(form.getTemplatekey());
			t52_def_temp.setDatagranularity(form.getDatagranularity());
			t52_def_temp.setSqlgranularity(form.getSqlgranularity());
			
			T52_def_temp t52_def_temp2 = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp2.getModuletype()))
			{
				flag = true;
			}
			
			
			// 修改模板执行粒度表
			int row1 = t52_def_tempDAO.modifyT52_def_temp_gran(sqlMap, t52_def_temp);

			/**** 2. add模板数据sql表T52_B_DEF_TEMP_SQL ******/
			String totalSize = request.getParameter("totalSize");
			int length = Integer.parseInt(totalSize);
			
			int row2 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			for(int i=1;i<=length;i++){
				String gsSql=request.getParameter("selsql"+i);
				if(gsSql!=null && !gsSql.equals("")){
				String gsSqlNum=request.getParameter("exeseq"+i);
				
				t52_def_temp.setSql_str(gsSql.trim());
				t52_def_temp.setCalsql(gsSqlNum);
				t52_def_tempDAO.t52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}
			
			/*String message = "";
			for (int i = 1; i <= length; i++)
			{
				String gsSql = request.getParameter("selsql" + i);
				
				
				if (gsSql != null && !gsSql.equals(""))
				{
					// 关键子信息
					if(gsSql.toLowerCase().contains("delete")||gsSql.toLowerCase().contains("insert")||gsSql.toLowerCase().contains("update"))
					{
						message = "第"+i+"条sql  不能存在delete，insert， update关键字";
					} else if (!sqlHasAs(gsSql))
					{
						message = "第"+i+"条sql 必须用as做别名";
					} 
					else if(!t52_def_tempDAO.validateSql(sqlMap, gsSql))
					{
						message = "第"+i+"条sql 语法不正确";
					}
					
					
					if (!"".equalsIgnoreCase(message)){
						ArrayList sqlList = new ArrayList();
						sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
						request.setAttribute("sqlList", sqlList);
						request.setAttribute("err", message);
						if(flag){
							return actionMapping.findForward("failure_hs");
						} else {
							return actionMapping.findForward("failure_md");
						}
					}
					String gsSqlNum = request.getParameter("exeseq" + i);

					t52_def_temp.setSql_str(gsSql.trim());
					t52_def_temp.setCalsql(gsSqlNum);
					t52_def_tempDAO.updateT52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}*/
			
			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			
			saveMessages(request, errors);
			
			return actionMapping.findForward("failure");
			
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	public ActionForward performDelT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String[] sqlkey_array = form.getSqlkeys();
			for (int i = 0; i < sqlkey_array.length; i++)
			{
				String sqlkey = sqlkey_array[i];
				int row = t52_def_tempDAO.deleteT52_b_def_temp_gran(sqlMap,
						sqlkey);
				int row1 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	
	/** 查看sql */
	public ActionForward performGetT52_def_temp_sqlList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		ArrayList sqlList = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = StringUtils.null2String(request
					.getParameter("sqlkey"));

			sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("sqlList", sqlList);
		return actionMapping.findForward("success");
	}

	/**
	 * 删除
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
	public ActionForward performDeleteT52_def_tempDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t52_def_tempDAO.deleteT52_def_temp(sqlMap, calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
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
	public ActionForward performGetT31_def_tempDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO) context
				.getBean("t31_def_tempDAO");
		T31_def_temp t31_def_temp = new T31_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(sqlMap,
					calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t31_def_temp", t31_def_temp);
		//
		return actionMapping.findForward("success");
	}

	/**
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
	public ActionForward performGetT31_def_tempDisp_gs(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO) context
				.getBean("t31_def_tempDAO");
		T31_def_temp t31_def_temp = new T31_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(sqlMap,
					calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t31_def_temp", t31_def_temp);
		//
		return actionMapping.findForward("success");
	}

	/**
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
	public ActionForward performChangeT52_def_tempFlag(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String flag = request.getParameter("flag");
			String[] key_array = form.getTemplatekeys();

			for (int i = 0; i < key_array.length; i++)
			{
				t52_def_temp.setFlag(flag);
				t52_def_temp.setTemplatekey(key_array[i]);
				t52_def_tempDAO.modifyT52_def_temp_flag(sqlMap, t52_def_temp);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 复制模板
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
	public ActionForward performCopyT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();

		ArrayList list = new ArrayList();
		ArrayList list1 = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
//			String temptype = form.getTemptype();
			String templatekey = form.getTemplatekeys()[0];

			String templatekey1 = "PKT"
					+ this.getSequenceNextVal("SEQ_T31_DEF_TEMP");
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/***** 复制T31_DEF_TEMP记录 ****/
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap,
					templatekey);
			t52_def_temp.setCreate_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setCreate_user(auth.getT00_user().getUsername());
			t52_def_temp.setCreate_org(auth.getT00_user().getOrgankey());
			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			t52_def_temp.setTemplatekey(templatekey1);
			t52_def_temp.setTemplatename(t52_def_temp.getTemplatename()
					+ "(副本)");
			t52_def_temp.setTag("0");
			int row1 = t52_def_tempDAO.insertT52_b_def_temp(sqlMap, t52_def_temp);

			/***** 复制T52_B_DEF_TEMP_GRAN记录 ****/
			T52_def_temp temp1 = new T52_def_temp();
			temp1.setTemplatekey(templatekey1);
			temp1.setTemplatekey_temp(templatekey);

			int row2 = t52_def_tempDAO.copyT52_b_def_temp_gran(sqlMap, temp1);

			/***** 复制T31_B_DEF_TEMP_SQL记录 ****/
			T52_def_temp temp = new T52_def_temp();
			temp.setTemplatekey(templatekey1);
			temp.setTemplatekey_temp(templatekey);
			int row3 = t52_def_tempDAO.copyT52_b_def_temp_sql(sqlMap, temp);


			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}
	
	/** 校验sql是否存在as关键字 */
	private boolean sqlHasAs(String sql)
	{
		sql = sql.toLowerCase();
		
		try {
			
			String rowStr = sql.substring(sql.indexOf("select")+6, sql.indexOf("from"));
			String icols = "";
			String[] colsArr = rowStr.split(",");
			for (String colsStr : colsArr)
			{
				String [] colArr = colsStr.split("as");
				
				for (int i=0;i<colArr.length; i++)
				{
					if(i%2!=0)
					{
						
						icols+=colArr[i]+",";
					}
				}
			}
		} catch(Exception e)
		{
			return false;			
		}
		return true;
	}
	
}
