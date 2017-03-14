/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2014-01-21] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.report.controller;

/**
 * <p>T07_ATTENTION_libActoin.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import org.apache.struts.action.*;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.beanutils.PropertyUtils;
import org.directwebremoting.annotations.Auth;

import com.ist.aml.report.dao.*;
import com.ist.aml.report.dto.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.jcs.CatchManager;
import com.ist.common.util.*;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_ATTENTION_libAction extends BaseAction {
	private Authorization auth=null;

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

		HttpSession session=request.getSession();
		AuthBean authBean=(AuthBean)session.getAttribute("authBean");
		auth=authBean.getAuthToken();
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		// 查询结果
		if ("getT07_ATTENTION_libList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_ATTENTION_libList(mapping, form, request,
					response);
		}// 修改状态
		else if ("modify_status".equalsIgnoreCase(myaction)) {
			myforward = performModify_status(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT07_ATTENTION_lib".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_ATTENTION_lib(mapping, form, request,
					response);
		}
		// 添加动作
		else if ("addT07_ATTENTION_libDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_ATTENTION_libDo(mapping, form, request,
					response);
		}
		// 修改界面
		else if ("modifyT07_ATTENTION_lib".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_ATTENTION_lib(mapping, form, request,
					response);
		}
		// 修改动作
		else if ("modifyT07_ATTENTION_libDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_ATTENTION_libDo(mapping, form,
					request, response);
		}
		// 删除动作
		else if ("deleteT07_ATTENTION_libDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_ATTENTION_libDo(mapping, form,
					request, response);
		}
		// 查询详细信息
		else if ("getT07_ATTENTION_libDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_ATTENTION_libDisp(mapping, form, request,
					response);
		}// ajax 根据关注类型动态取失效日期
		else if ("change_inValidDt".equalsIgnoreCase(myaction)) {
			myforward = change_inValidDt(mapping, form, request,
					response);
		}//延期
		else if ("extend".equalsIgnoreCase(myaction)) {
			myforward = performExtend(mapping, form, request,
					response);
		}
		//排除
		else if ("remove".equalsIgnoreCase(myaction)) {
			myforward = performRemove(mapping, form, request,
					response);
		}
		//从案例添加
		else if ("add_attention_lib_form_case".equalsIgnoreCase(myaction)) {
			myforward = performAdd_attention_lib_form_case(mapping, form, request,
					response);
		}
		//从案例添加
		else if ("add_attention_lib_form_case_do".equalsIgnoreCase(myaction)) {
			myforward = performAdd_attention_lib_form_case_do(mapping, form, request,
					response);
		}
		
		return myforward;

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
	public ActionForward performGetT07_ATTENTION_libList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		List t07_attention_libList = null;
		
		
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		
		try {
			T07_ATTENTION_libActionForm form=(T07_ATTENTION_libActionForm) actionForm; 			
			String organStr=auth.getOrganstr();
			form.setOrganStr(organStr);
			
			form.setCurr_dt(DateUtils.dateToStringShort(new Date()));
			
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";
			t07_attention_lib = (T07_ATTENTION_lib) this.getSearchObject(
					t07_attention_lib, request, form,
					"getT07_ATTENTION_libListCount", url);
			
			MyBeanUtils.copyBean2Bean(form, t07_attention_lib);
			if (t07_attention_lib.getNewsearchflag().equals("1")) {
				
				
				// 个性化的查询条件				
				saveSearchObject(t07_attention_lib, request);
			}
			t07_attention_libList = t07_attention_libDAO
					.getT07_ATTENTION_libList(sqlMap, t07_attention_lib, this
							.getStartRec(t07_attention_lib.getIntPage()), this
							.getIntPageSize());
			
		    //取得页面的操作按钮			
		    ArrayList<T07_ATTENTION_swith> swithList=cm.getListFromCache("t07_attention_swith");
		    request.setAttribute("buttons", this.getCurrPostButtons(t07_attention_lib.getAtten_post(),swithList));
			
			//客户类型
			String party_class_cdStr=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cdStr", party_class_cdStr);
			//关注类型
			LinkedHashMap atten_typeMap =cm.getMapFromCache("atten_type");
			request.setAttribute("atten_typeMap", this.getOptionsListByMap(
					atten_typeMap, null, true));
			//关注状态
			LinkedHashMap statusMap =cm.getMapFromCache("atten_status");
			request.setAttribute("statusMap", this.getOptionsListByMap(
					statusMap, null, true));
			
			//关注来源
			LinkedHashMap atten_sourceMap =cm.getMapFromCache("atten_source");
			request.setAttribute("atten_sourceMap", this.getOptionsListByMap(
					atten_sourceMap, null, true));
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		
		
		request.setAttribute("t07_attention_libList", t07_attention_libList);
		
		Map<String, String> atten_postMap=cm.getMapFromCache("atten_post");
		
		
		String atten_post=request.getParameter("atten_post");
		
		//为空说明是不需要添加原因的动作跳转过来的
		if(org.apache.commons.lang.StringUtils.isEmpty(atten_post))
		{
			atten_post=(String)request.getAttribute("atten_post");
		
		}
		
		request.setAttribute("atten_post",atten_post );			
		request.setAttribute("atten_post_name", atten_postMap.get(atten_post));
		
		//客户统一视图中 关注库查询所有的
		if("all".equals(request.getParameter("is_his")))
		{
			return actionMapping.findForward("success2");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 
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
	public ActionForward performAddT07_ATTENTION_lib(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		
		T07_ATTENTION_libActionForm form =(T07_ATTENTION_libActionForm)actionForm;
		
		//添加动作中如果客户号存在会返回到添加页面，此时需清空这三个值
		form.setParty_class_cd("");
		form.setAtten_type("");
		form.setCard_type("");
		
		//客户类型
		LinkedHashMap party_class_cdMap=cm.getMapFromCache("clienttype");
		request.setAttribute("party_class_cdMap",  this.getOptionsListByMap(
				party_class_cdMap, null, true));
		//关注类型
		LinkedHashMap atten_typeMap =cm.getMapFromCache("atten_type");
		request.setAttribute("atten_typeMap", this.getOptionsListByMap(
				atten_typeMap, null, true));
		//证件类型
		LinkedHashMap card_typeMap =cm.getMapFromCache("card_type");
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));

		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
		
		return actionMapping.findForward("success");
	}
	
	
	public ActionForward performAdd_attention_lib_form_case(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		
	  
		Map<String,String> purviewMap=new HashMap();
		
		List<T07_ATTENTION_purview>  purviewList=cm.getListFromCache("t07_attention_purview");
		CreditTask credittask = (CreditTask) request.getSession().getAttribute("credittask");
		String curr_post=credittask.getPost_id();
		
		for(T07_ATTENTION_purview purview: purviewList)
		{
			if(purview.getAdd_post().equals(curr_post))
			{
				purviewMap.put(purview.getAtten_type(),"");
			}
		}		
		
		//关注类型
		LinkedHashMap<String,String> atten_typeMap =cm.getMapFromCache("atten_type");
		
		LinkedHashMap<String,String> atten_typeMap2=new LinkedHashMap<String,String>(atten_typeMap);
		for(String key : atten_typeMap.keySet())
		{
			if(!purviewMap.containsKey(key))
			{
				atten_typeMap2.remove(key);
			}
		}
		
		request.setAttribute("atten_typeMap", this.getOptionsListByMap(
				atten_typeMap2, null, true));
		request.setAttribute("curr_post", curr_post);
		
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
	public ActionForward performAddT07_ATTENTION_libDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			
			PropertyUtils.copyProperties(t07_attention_lib, form);
			
			boolean isExist= t07_attention_libDAO.isExistParty_id(sqlMap, t07_attention_lib.getParty_id());
			
			if(isExist)
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "该客户已存在！"));
				saveMessages(request, errors);
				
				return actionMapping.findForward("failure");
			}
			t07_attention_lib.setCreate_dt(DateUtils.dateToStringShort(new Date()));
			String atten_id= this.getSequenceNextVal("SEQ_T07_ATTENTION_LIB");
			t07_attention_lib.setAtten_id(atten_id);
			t07_attention_lib.setAdd_post("P");//非案例来源的岗位默认P
			t07_attention_lib.setExtend_num(0);
			
			T07_ATTENTION_log t07_attention_log=new T07_ATTENTION_log();
			t07_attention_log.setAtten_id("'"+atten_id+"'");
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(form.getOp_type());			
            sqlMap.startTransaction();
			
            int rows = t07_attention_libDAO.insertT07_ATTENTION_lib(sqlMap,
					t07_attention_lib);
        	if (rows <= 0) {
				throw new Exception("");
			}
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,
					t07_attention_log);
			sqlMap.commitTransaction();
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		}finally{
			
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
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
	public ActionForward performModifyT07_ATTENTION_lib(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log(); 
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			
			String atten_id=request.getParameter("keys");
			t07_attention_lib.setAtten_id(atten_id);
			t07_attention_lib.setIs_his(form.getIs_his());
			t07_attention_lib = t07_attention_libDAO.getT07_ATTENTION_libDisp(
					sqlMap, t07_attention_lib);
			
			request.setAttribute("t07_attention_lib",t07_attention_lib);
			
			t07_attention_log.setAtten_id(atten_id);
			t07_attention_log.setOp_type("'1','2'");			
			t07_attention_log = t07_attention_libDAO.getOp_reason(
					sqlMap, t07_attention_log);
			
			request.setAttribute("op_reason", t07_attention_log.getOp_reason());
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		//客户类型
		LinkedHashMap party_class_cdMap=cm.getMapFromCache("clienttype");
		request.setAttribute("party_class_cdMap",  this.getOptionsListByMap(
				party_class_cdMap, null, true));
		//关注类型
		LinkedHashMap atten_typeMap =cm.getMapFromCache("atten_type");
		request.setAttribute("atten_typeMap", this.getOptionsListByMap(
				atten_typeMap, null, true));
		//证件类型
		LinkedHashMap card_typeMap =cm.getMapFromCache("card_type");
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));
		
		
		
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
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
	public ActionForward performModifyT07_ATTENTION_libDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			PropertyUtils.copyProperties(t07_attention_lib, form);
			
			T07_ATTENTION_log t07_attention_log=new T07_ATTENTION_log();
			t07_attention_log.setAtten_id("'"+t07_attention_lib.getAtten_id()+"'");
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(form.getOp_type());
			
			sqlMap.startTransaction();
			t07_attention_libDAO.modifyT07_ATTENTION_lib(sqlMap,
					t07_attention_lib);
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,
					t07_attention_log);
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
	public ActionForward performDeleteT07_ATTENTION_libDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			String selectkeys=request.getParameter("keys");
			String[] keys=selectkeys.split(",");
			String atten_ids="";
			for(String atten_id: keys)
			{
				atten_ids+="'"+atten_id+"',";
			}
			if(!"".equals(atten_ids))
			{
				atten_ids=atten_ids.substring(0,atten_ids.length()-1);
			}
			
			T07_ATTENTION_log t07_attention_log=new T07_ATTENTION_log();
			t07_attention_log.setAtten_id(atten_ids);
			t07_attention_log.setOp_reason(StringUtils.null2String(request.getParameter("op_reason")));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(form.getOp_type());
			
			T07_ATTENTION_lib t07_attention_lib= new T07_ATTENTION_lib();
			t07_attention_lib.setAtten_id(atten_ids);
			t07_attention_lib.setDelete_dt(DateUtils.dateToStringShort(new Date()));
			t07_attention_lib.setStatus(StringUtils.null2String(request.getParameter("op_result")));
			t07_attention_lib.setAtten_post(StringUtils.null2String(request.getParameter("target_post")));
			sqlMap.startTransaction();
			t07_attention_libDAO.insertT07_ATTENTION_lib_uh(sqlMap, t07_attention_lib);
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,t07_attention_log);
			t07_attention_libDAO.deleteT07_ATTENTION_lib(sqlMap, atten_ids);
			
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
		if("1".equals(request.getParameter("is_add_reason")))
		{
			request.setAttribute("refresh", "1");
			return actionMapping.findForward("success");
		}else
		{
			
			return actionMapping.findForward("success2");
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
	public ActionForward performGetT07_ATTENTION_libDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		List t07_attention_libList=new ArrayList();
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			String atten_id = form.getAtten_id();
			MyBeanUtils.copyBean2Bean(t07_attention_lib, form);
			t07_attention_lib = t07_attention_libDAO.getT07_ATTENTION_libDisp(
					sqlMap, t07_attention_lib);
			t07_attention_libList = t07_attention_libDAO.getT07_ATTENTION_logList(
					sqlMap, atten_id);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_attention_lib", t07_attention_lib);
		request.setAttribute("t07_attention_libList", t07_attention_libList);
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
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
	public ActionForward performModify_status(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log();
		try {
			//T07_ATTENTION_logActionForm form = (T07_ATTENTION_logActionForm) actionForm;			
			//PropertyUtils.copyProperties(t07_attention_log, form);
			
			String selectkeys=request.getParameter("keys");
			String[] keys=selectkeys.split(",");
			String atten_ids="";
			for(String atten_id: keys)
			{
				atten_ids+="'"+atten_id+"',";
			}
			if(!"".equals(atten_ids))
			{
				atten_ids=atten_ids.substring(0,atten_ids.length()-1);
			}
			
			t07_attention_lib.setAtten_id(atten_ids);
			t07_attention_lib.setAtten_post(request.getParameter("target_post"));
			t07_attention_lib.setStatus(request.getParameter("op_result"));
			
			t07_attention_log.setAtten_id(atten_ids);
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(request.getParameter("op_type"));
		
			sqlMap.startTransaction();
			
			t07_attention_libDAO.modifyT07_ATTENTION_lib_status(sqlMap,
					t07_attention_lib);
			
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,
					t07_attention_log);
			sqlMap.commitTransaction();
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
		if("1".equals(request.getParameter("is_add_reason")))
		{
			request.setAttribute("refresh", "1");
			return actionMapping.findForward("success");
		}else
		{
			
			return actionMapping.findForward("success2");
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
	public ActionForward change_inValidDt(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		 String atten_type = StringUtils.nullObject2String(request.getParameter("atten_type"));
		 T07_ATTENTION_lib t07_attention_lib=new T07_ATTENTION_lib();
		 t07_attention_lib.setAtten_type(atten_type);
		 t07_attention_lib.setAdd_post(request.getParameter("add_post"));
		 Map returnMap=  isHasPurview(auth, cm,t07_attention_lib , "add");
		 
		 long days= Long.parseLong((String)returnMap.get("add_day")) ;
		 
		 long invalid_num=new Date().getTime()+days*24*60*60*1000;
	     
		 String invalid_dt=DateUtils.dateToStringShort(new Date(invalid_num));
		 try {
			 response.getWriter().print(invalid_dt);
			 response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	    
		 return null;
	}
	
	public ArrayList getCurrPostButtons(String currPost, ArrayList<T07_ATTENTION_swith> allButtons)
	{
		ArrayList list= new ArrayList<T07_ATTENTION_swith>();
		for(T07_ATTENTION_swith swith: allButtons)
		{
			if(swith.getAtten_post().equals(currPost))
			{
				list.add(swith);
			}
		}
		return list;
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
	public ActionForward performExtend(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log();
		
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
		String forwardStr="noReason";
		if("1".equals(request.getParameter("is_add_reason")))
		{
			forwardStr="hasReason";
		}
		
		try {
			//T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;			
			//PropertyUtils.copyProperties(t07_attention_log, form);
			
			String atten_id=request.getParameter("keys").split(",")[0];
			
			t07_attention_lib.setAtten_id(atten_id);
			t07_attention_lib=t07_attention_libDAO.getT07_ATTENTION_libDisp(sqlMap, t07_attention_lib);
			
			Map returnMap=this.isHasPurview(auth,cm,t07_attention_lib,"extend");
			
			
			if(!(Boolean)returnMap.get("extend"))
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "无延期权限或已达到延期次数限制!"));
				saveMessages(request, errors);
				
				return actionMapping.findForward(forwardStr);
			
			}
			
			T07_ATTENTION_lib t07_attention_lib1=new T07_ATTENTION_lib();
			t07_attention_lib1.setAtten_id(t07_attention_lib.getAtten_id());
			Date invalid_dt=DateUtils.stringToDateShort(t07_attention_lib.getInvalid_dt());
			Long extend_day=Long.parseLong((String)returnMap.get("extend_day"));
			Date extend_dt=new Date(invalid_dt.getTime()+extend_day*24*60*60*1000);
			t07_attention_lib1.setInvalid_dt(DateUtils.dateToStringShort(extend_dt));
			t07_attention_lib1.setExtend_num(t07_attention_lib.getExtend_num()+1);
			
			t07_attention_log.setAtten_id("'"+atten_id+"'");
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(request.getParameter("op_type"));
		
			sqlMap.startTransaction();
			
			t07_attention_libDAO.modifyT07_ATTENTION_lib(sqlMap,
					t07_attention_lib1);
			
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,
					t07_attention_log);
			sqlMap.commitTransaction();
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward(forwardStr);
		}finally{
			
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
				"error.common", "已延期!"));
		saveMessages(request, errors);
		request.setAttribute("refresh", "1");
		return actionMapping.findForward(forwardStr);
		
		
		
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
	public ActionForward performRemove(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO) context
		.getBean("t07_case_applicationDAO");
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO) context
		.getBean("t47_transactionDAO");
		
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		T07_ATTENTION_log t07_attention_log = new T07_ATTENTION_log();
		
		request.setAttribute("atten_post", request.getParameter("atten_post"));
		
		String forwardStr="noReason";
		if("1".equals(request.getParameter("is_add_reason")))
		{
			forwardStr="hasReason";
		}
		
		try {
			//T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;			
			//PropertyUtils.copyProperties(t07_attention_log, form);
			
			String atten_id=request.getParameter("keys").split(",")[0];
			
			t07_attention_lib.setAtten_id(atten_id);
			t07_attention_lib=t07_attention_libDAO.getT07_ATTENTION_libDisp(sqlMap, t07_attention_lib);
			
			Map returnMap=this.isHasPurview(auth,cm,t07_attention_lib,"remove");
			
			
			if(!(Boolean)returnMap.get("remove"))
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "无排除权限！"));
				saveMessages(request, errors);
				
				return actionMapping.findForward(forwardStr);
			
			}
			String atten_id_query="'"+atten_id+"'";
			
			t07_attention_lib.setAtten_id(atten_id_query);
			t07_attention_lib.setDelete_dt(DateUtils.dateToStringShort(new Date()));
			t07_attention_lib.setStatus(StringUtils.null2String(request.getParameter("op_result")));
			t07_attention_lib.setAtten_post(StringUtils.null2String(request.getParameter("target_post")));
			
			t07_attention_log.setAtten_id(atten_id_query);
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type(request.getParameter("op_type"));
		    //取最后一个案例的案例编号
			T07_case_application t07_case_application=new T07_case_application();
			t07_case_application.setParty_id(t07_attention_lib.getParty_id());
			t07_case_application.setCase_date_start(DateUtils.stringToDateShort(t07_attention_lib.getCreate_dt()));
		    t07_case_application.setCase_date_end(new Date());
		    String app_num=t07_case_applicationDAO.getMax_app_num(sqlMap, t07_case_application);
		 
    	    
		    t07_case_application.setApplication_num(app_num);
		    t07_case_application.setApp_state_cd("1");//处理中
		    
		   // int updateAppCount=0; 
		   
			sqlMap.startTransaction();
			
			t07_attention_libDAO.insertT07_ATTENTION_lib_uh(sqlMap, t07_attention_lib);			
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,t07_attention_log);
			t07_attention_libDAO.deleteT07_ATTENTION_lib(sqlMap, atten_id_query);
			
			if(!"".equals(app_num))
		    {   
				//恢复最后一个案例的状态
				t07_case_applicationDAO.modifyT07_case_appstatus_by_app_num
				             (sqlMap, t07_case_application);
				//恢复案例下的特征
				T07_case_stcr stcr=new T07_case_stcr();
				stcr.setApplication_num(app_num);
				stcr.setCase_type("2");//可疑
				stcr.setStatus("1");//处理中
				t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, stcr);
				//恢复案例下的交易
				T07_case_transaction t07_case_trans=new T07_case_transaction();
				t07_case_trans.setCase_type("2");//可疑
				t07_case_trans.setApplication_num(app_num);
				t07_case_trans.setStatus_cd("1");//处理中
				t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
				//恢复UC表
				StringBuffer sql=new StringBuffer();
				sql.append("  update t47_transaction_uc t                             ");
				sql.append("     set t.handle_status_cd = '1'                         ");
				sql.append("   where t.handle_status_cd = '4'                         ");
				sql.append("     and exists (select 1                                 ");
				sql.append("            from t07_case_transaction_ky a                ");
				sql.append("           where a.application_num = '"+app_num+"'        ");
				sql.append("             and a.transactionkey = t.transactionkey)     ");
				sqlMap.update("updateSQL", sql.toString());
				
		    }
			
			sqlMap.commitTransaction();
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward(forwardStr);
		}finally{
			
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		request.setAttribute("refresh", "1");
		return actionMapping.findForward(forwardStr);
		
		
		
	}
	
	/**
	 * 
	 * @param infoMap 
	 * @param purviewList
	 * @param type
	 * @return
	 */
	private Map isHasPurview(Authorization auth,CatchManager cm,T07_ATTENTION_lib t07_attention_lib,String type)
	{
		Map returnMap=new HashMap();
		boolean isHasPurview=false;
		String atten_type=t07_attention_lib.getAtten_type();
		String add_post=t07_attention_lib.getAdd_post();
		int extendNum=StringUtils.nullObject2int(t07_attention_lib.getExtend_num());
		
		String[] currUserPost=auth.getPostStr().replace("'", "").split(",");
		List<T07_ATTENTION_purview>  purviewList=cm.getListFromCache("t07_attention_purview");
		int extend_day=0;
		String add_result=""; 
		int add_day=0;
		
		for(T07_ATTENTION_purview purview:purviewList)
		{
			if(atten_type.equals(purview.getAtten_type())&&add_post.equals(purview.getAdd_post()))
			{
				if("extend".equals(type))//延期
				{
					
					String extend_type= purview.getExtend_type();
						   extend_day=purview.getExtend_day();
					if("1".equals(extend_type)) //1哪个岗位放哪个岗位延期
					{
						for(String post:currUserPost)
						{
							if(add_post.equals(post)&&extendNum<purview.getExtend_num())
							{
								isHasPurview=true;
								break;
							}
						}
					}else if("2".equals(extend_type))//某些岗位可延期
					{
						for(String post:currUserPost)
						{
							if(purview.getExtend_post().indexOf(post)!=-1&&extendNum<purview.getExtend_num())
							{
								isHasPurview=true;								
								break;
							}
						}
					}else if ("4".equals(extend_type))//直接可延期
					{
						isHasPurview=true;
						
					}
				}else if("remove".equals(type))//排除
				{
					String remove_type= purview.getRemove_type();
					if("1".equals(remove_type)) //1哪个岗位放哪个岗位排除
					{
						for(String post:currUserPost)
						{
							if(add_post.equals(post))
							{
								isHasPurview=true;								
								break;
							}
						}
					}else if("2".equals(remove_type))//某些岗位可排除
					{
						for(String post:currUserPost)
						{
							if(purview.getRemove_post().indexOf(post)!=-1)
							{
								isHasPurview=true;								
								break;
							}
						}
					}else if("4".equals(remove_type))//直接可排除
					{
						isHasPurview=true;	
					}
				}else if("add".equals(type))//添加
				{
					isHasPurview=true;
					add_day=purview.getAdd_day();
					add_result=purview.getAdd_result();
						
				}
				
			}
		}
		returnMap.put(type, isHasPurview);
		returnMap.put("add_result", add_result);
		returnMap.put("add_day", add_day+"");
		returnMap.put("extend_day", extend_day+"");
		
		return returnMap;
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
	public ActionForward performAdd_attention_lib_form_case_do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_ATTENTION_libDAO t07_attention_libDAO = (T07_ATTENTION_libDAO) context
				.getBean("t07_attention_libDAO");
		T07_ATTENTION_lib t07_attention_lib = new T07_ATTENTION_lib();
		
		try {
			T07_ATTENTION_libActionForm form = (T07_ATTENTION_libActionForm) actionForm;
			
			PropertyUtils.copyProperties(t07_attention_lib, form);
			//案例所属岗位
			CreditTask credittask = (CreditTask) request.getSession().getAttribute("credittask");
			t07_attention_lib.setAdd_post(credittask.getPost_id());
			
			Map returnMap=this.isHasPurview(auth, cm, t07_attention_lib, "add");
			
			if(!(Boolean)returnMap.get("add"))
			{
				
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "无添加权限！"));
				saveMessages(request, errors);
				
				return actionMapping.findForward("failure");
			}
			
			boolean isExist= t07_attention_libDAO.isExistParty_id(sqlMap, t07_attention_lib.getParty_id());
			if(isExist)
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "此客户已存在！"));
				saveMessages(request, errors);
				
				return actionMapping.findForward("failure");
			}
			
			String op_result=(String)returnMap.get("add_result");
			String target_post="";
			ArrayList<T07_ATTENTION_swith> swithList=cm.getListFromCache("t07_attention_swith");
			for(T07_ATTENTION_swith  swith :swithList)
			{
				if(op_result.equals(swith.getOp_result()))
				{
					target_post=swith.getTarget_post();
					break;
				}
			}
			
			t07_attention_lib.setCreate_dt(DateUtils.dateToStringShort(new Date()));
			t07_attention_lib.setOp_result(op_result);
			t07_attention_lib.setTarget_post(target_post);
			t07_attention_lib.setAtten_source("2");//来自案例			
			t07_attention_lib.setExtend_num(0);
			
			String atten_id= this.getSequenceNextVal("SEQ_T07_ATTENTION_LIB");
			t07_attention_lib.setAtten_id(atten_id);
			T07_ATTENTION_log t07_attention_log=new T07_ATTENTION_log();
			t07_attention_log.setAtten_id("'"+atten_id+"'");
			t07_attention_log.setOp_reason(request.getParameter("op_reason"));
			t07_attention_log.setOp_person(auth.getT00_user().getUsername());
			t07_attention_log.setOp_time(DateUtils.getCurrTime());
			t07_attention_log.setOp_type("1");//添加
			
            sqlMap.startTransaction();
			
            int rows = t07_attention_libDAO.insertT07_ATTENTION_lib_from_case(sqlMap,
					t07_attention_lib);
        	if (rows <= 0) {
				throw new Exception("");
			}
			t07_attention_libDAO.insertT07_ATTENTION_log(sqlMap,
					t07_attention_log);
			sqlMap.commitTransaction();
			
			
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		}finally{
			
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		request.setAttribute("refresh", "1");
		return actionMapping.findForward("success");
	}
	
}
