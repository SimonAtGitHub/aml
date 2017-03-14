

package com.ist.aml.report.controller;

/**
 * <p>T07_report_organActoin.java</p>
 * <p>Description: </p>

 */

import org.apache.struts.action.*;

import javax.servlet.http.*;

import java.util.*;

import org.apache.commons.beanutils.PropertyUtils;
import com.ist.aml.report.dao.*;
import com.ist.aml.report.dto.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.util.*;
import com.ist.util.StringUtils;

public class T07_report_organAction extends BaseAction {

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
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		// 查询结果
		if ("getT07_report_organList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_report_organList(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT07_report_organ".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_report_organ(mapping, form, request,
					response);
		}
		// 添加动作
		else if ("addT07_report_organDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_report_organDo(mapping, form, request,
					response);
		}
		// 修改界面
		else if ("modifyT07_report_organ".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_report_organ(mapping, form, request,
					response);
		}
		// 修改动作
		else if ("modifyT07_report_organDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_report_organDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT07_report_organDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_report_organDo(mapping, form, request,
					response);
		}
		// 选择复选框删除动作
		else if ("deleteCheckBoxT07_report_organDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteCheckBoxT07_report_organDo(mapping, form, request,
					response);
		}
		// 查询详细信息
		else if ("getT07_report_organDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_report_organDisp(mapping, form, request,
					response);
		}
		
		
		//添加界面map
		else if ("addT07_report_organ_map".equalsIgnoreCase(myaction)) {
		myforward = performAddT07_report_organ_map(mapping, form, request, response);
		}
		//添加动作map
		else if ("addT07_report_organ_mapDo".equalsIgnoreCase(myaction)) {
		myforward = performAddT07_report_organ_mapDo(mapping, form, request, response);
		}
		//修改界面map
		else if ("modifyT07_report_organ_map".equalsIgnoreCase(myaction)) {
		myforward = performModifyT07_report_organ_map(mapping,form,request,response);
		}
		 //修改动作map
		else if ("modifyT07_report_organ_mapDo".equalsIgnoreCase(myaction)) {
		myforward = performModifyT07_report_organ_mapDo(mapping, form, request, response);
		}
		//删除动作map
		else if ("deleteT07_report_organ_mapDo".equalsIgnoreCase(myaction)) {
		myforward = performDeleteT07_report_organ_mapDo(mapping, form, request, response);
		}
		
		//复选框删除动作map
		else if ("deleteCheckBoxT07_report_organ_mapDo".equalsIgnoreCase(myaction)) {
		myforward = performDeleteCheckBoxT07_report_organ_mapDo(mapping, form, request, response);
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
	public ActionForward performGetT07_report_organList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t07_report_organList = null;
		String pageInfo="";
		//
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t07_report_organ, form);
				t07_report_organ.setInner_organkey(organStr);
				session.setAttribute("t07_report_organSearchObj",t07_report_organ);
			}else{
				t07_report_organ=(T07_report_organ)session.getAttribute("t07_report_organSearchObj");
				MyBeanUtils.copyBean2Bean(form, t07_report_organ);
			}
			t07_report_organList = t07_report_organDAO.getT07_report_organList(
					sqlMap, t07_report_organ, this.getStartRec(intPage), this.getIntPageSize());
			int totalRow=t07_report_organDAO.getT07_report_organListCount(sqlMap, t07_report_organ);
			String url = request.getContextPath()+"/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
		} catch (Exception e) {
			e.printStackTrace();
            logger.error("异常",e);
			
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_report_organList", t07_report_organList);
		request.setAttribute("pageInfo", pageInfo);
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
	public ActionForward performAddT07_report_organ(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();

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
	public ActionForward performAddT07_report_organDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			Authorization auth = this.getAuthorization(request);
			t07_report_organ.setInner_organkey(auth.getT00_user().getOrgankey());
			T07_report_organ report_organ=t07_report_organDAO.getT07_report_organDisp(sqlMap,form.getReport_organkey());
			int seq_tCount=t07_report_organDAO.getT07_report_organCount_BySeq_tablename(sqlMap, form.getSeq_tablename());
			if(report_organ!=null&&report_organ.getReport_organkey().equals(form.getReport_organkey())){
    			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","该人行机构编号已存在，不能重复建立！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}else if(seq_tCount>0){
    			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","该机构序列表已存在，不能重复建立！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			else{
				t07_report_organDAO.insertT07_report_organ(sqlMap,t07_report_organ);
			}
			
			
		} catch (Exception e) {
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
	public ActionForward performModifyT07_report_organ(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String report_organkey = form.getReport_organkey();
			t07_report_organ = t07_report_organDAO.getT07_report_organDisp(
					sqlMap, report_organkey);
			MyBeanUtils.copyBean2Bean(form, t07_report_organ);
		} catch (Exception e) {
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
	public ActionForward performModifyT07_report_organDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			T07_report_organ report_organ=t07_report_organDAO.getT07_report_organBySeq_tablename(sqlMap,form.getSeq_tablename());
			int seq_tCount=t07_report_organDAO.getT07_report_organCount_BySeq_tablename(sqlMap, form.getSeq_tablename());
			if(seq_tCount>0&&!report_organ.getReport_organkey().equals(form.getReport_organkey())){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","该机构序列表已存在，请重新填写！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}else{
				t07_report_organDAO.modifyT07_report_organ(sqlMap, t07_report_organ);
			}
			
		} catch (Exception e) {
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
	public ActionForward performDeleteT07_report_organDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String report_organkey = form.getReport_organkey();
			t07_report_organDAO.deleteT07_report_organ(sqlMap, report_organkey);
			t07_report_organ.setReport_organkey(report_organkey);
			t07_report_organDAO.deleteT07_report_organ_map(sqlMap, t07_report_organ);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	public ActionForward performDeleteCheckBoxT07_report_organDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String[] report_organkeys = form.getSelectedReport_organkey();
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			for(int i=0;i<report_organkeys.length;i++){
				String report_organkey=report_organkeys[i];
				t07_report_organDAO.deleteT07_report_organ(sqlMap, report_organkey);
				
				t07_report_organ.setReport_organkey(report_organkey);
				t07_report_organDAO.deleteT07_report_organ_map(sqlMap, t07_report_organ);
			}
			sqlMap.commitTransaction();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
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
	public ActionForward performGetT07_report_organDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t07_report_organ_mapList = null;
		String pageInfo="";
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
		
			
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t07_report_organ, form);
				session.setAttribute("t07_report_organ_mapSearchObj",t07_report_organ);
			}else{
				t07_report_organ=(T07_report_organ)session.getAttribute("t07_report_organ_mapSearchObj");
				MyBeanUtils.copyBean2Bean(form, t07_report_organ);
			}
			t07_report_organ_mapList = t07_report_organDAO.getT07_report_organ_mapList(
					sqlMap, t07_report_organ, this.getStartRec(intPage), this.getIntPageSize());
			int totalRow=t07_report_organDAO.getT07_report_organ_mapListCount(sqlMap, t07_report_organ);
			String url = request.getContextPath()+"/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_report_organ", t07_report_organ);
		request.setAttribute("t07_report_organ_mapList", t07_report_organ_mapList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performDeleteT07_report_organ_mapDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			t07_report_organDAO.deleteT07_report_organ_map(sqlMap, t07_report_organ);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performDeleteCheckBoxT07_report_organ_mapDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			String[] organkeys = form.getSelectedOrgankey();
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			for(int i=0;i<organkeys.length;i++){
				String organkey=organkeys[i];
				t07_report_organ.setOrgankey(organkey);
				t07_report_organDAO.deleteT07_report_organ_map(sqlMap, t07_report_organ);
			}
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performModifyT07_report_organ_map(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_report_organ,form);
			
			t07_report_organ.setOrgan_mapkey(t07_report_organ.getOrgankey());
			t07_report_organ.setOrganname((String)organMap.get(t07_report_organ.getOrgankey()));
			MyBeanUtils.copyBean2Bean(form, t07_report_organ);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performModifyT07_report_organ_mapDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			int count=t07_report_organDAO.getT07_report_organ_mapListCountValue(sqlMap, form.getOrgankey());
			if(count>0){
    			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","该机构已存在，请重新选择其他机构！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}else{
				t07_report_organDAO.modifyT07_report_organ_map(sqlMap, t07_report_organ);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_report_organ_map(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
        T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
		return actionMapping.findForward("success");
	}
	public ActionForward performAddT07_report_organ_mapDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_report_organDAO t07_report_organDAO = (T07_report_organDAO) context
				.getBean("t07_report_organDAO");
		T07_report_organ t07_report_organ = new T07_report_organ();
		try {
			T07_report_organActionForm form = (T07_report_organActionForm) actionForm;
			
			MyBeanUtils.copyBean2Bean(t07_report_organ, form);
			int count=t07_report_organDAO.getT07_report_organ_mapListCountValue(sqlMap, form.getOrgankey());
			if(count>0){
    			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","该机构已存在，请重新选择机构！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}else{
				t07_report_organDAO.insertT07_report_organ_map(sqlMap,t07_report_organ);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward("success");
	}
}
