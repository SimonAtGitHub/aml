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

package com.ist.aml.risk_rate.controller;

/**
 * <p>T37_party_resultActoin.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.risk_rate.dao.T37_party_resultDAO;
import com.ist.aml.risk_rate.dto.T37_appr_bas_rslt;
import com.ist.aml.risk_rate.dto.T37_party_result;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.util.StringUtils;
import com.ist.util.Constans;
import com.ist.util.DateUtils;

public class T37_party_result_uhAction extends BaseAction {

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
		//历史评级信息
		if ("getT37_party_result_uhList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_result_uhList(mapping, form, request,
					response);
		}
		//详细评级信息（公式）
		else if ("getT37_party_gs_resultDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_gs_resultDisp(mapping, form, request,
					response);
		}
		//详细评级信息（积分）
		else if ("getT37_party_jf_resultDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_jf_result_rateDisp(mapping, form, request,
					response);
		}
		return myforward;

	}

	public ActionForward performGetT37_party_result_uhList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_result_uhList = null;
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			 if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				
				session.setAttribute("t37_party_result_uh_rateSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_party_result_uh_rateSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
			 t37_party_result_uhList = t37_party_resultDAO
					.getT37_party_result_uhList(sqlMap, t37_party_result, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t37_party_resultDAO
					.getT37_party_result_uhListCount(sqlMap, t37_party_result);
			String url = request.getContextPath() + "/risk_rate"
					+ actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form, t37_party_result);
		
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_party_result_uhList", t37_party_result_uhList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT37_party_gs_resultDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		ArrayList  t37_gs_indicValList = new ArrayList();
		String forward="success";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm; 
        	  t37_party_result.setOrgankey(form.getOrgankey());
		    if(form.getStatistic_dt_disp()!=null && !"".equals(form.getStatistic_dt_disp())){
		    	t37_party_result.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
		    }
		  
		    
		
			
			String result_table="T37_PARTY_RESULT"; //评级结果表
			String appr_table="T37_GS_INDIC_VAL";  //要点分值表
			if(form.getRate_source().equals("2")){ //再调整相关表
				result_table="T37_PRESULT_AUDIT";
				appr_table="T37_GS_INDIC_VAL_AUDIT";
			}
			if(form.getRate_source().equals("uh")){ //历史相关表
				result_table="T37_PARTY_RESULT_UH";
				appr_table="T37_GS_INDIC_VAL_UH";
			}
			if(form.getRate_source().equals("curr")){
				result_table="T37_PARTY_RESULT_CURR";
				appr_table="T37_GS_INDIC_VAL_CURR";
				
			}
			
		    	t37_party_result.setResulekey(form.getResulekey());
		    	t37_party_result.setTable_name(result_table);
		    t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
		    if(t37_party_result.getResulekey()!=null && !"".equals(t37_party_result.getResulekey())){
		    	t37_party_result.setTable_name(appr_table);
				  
				t37_gs_indicValList=t37_party_resultDAO.getT37_gs_indicVal_rateList(sqlMap, t37_party_result);
		    }else{
	    	    errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","评级信息不存在！"));
		        saveErrors(request, errors);
		        forward="failure";
	       }
         
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_gs_indicValList",t37_gs_indicValList);
		request.setAttribute("t37_level_auditList",t37_level_auditList);
		request.setAttribute("t37_party_result",t37_party_result );
		return actionMapping.findForward(forward);
	}
	public ActionForward performGetT37_party_jf_result_rateDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList t37_appr_bas_rsltList=new ArrayList();
        ArrayList t37_appr_elem_rsltList1=new ArrayList();
		T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
		Integer maxTreeLaye=Integer.parseInt("0");
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		request.setAttribute("is_showCheck", t87_sysparaMap.get(Constans.IS_SHOW_CHECK));
		Map<String,List<T37_appr_bas_rslt>> map=new LinkedHashMap<String,List<T37_appr_bas_rslt>>();
		String forward="success";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			
			
			String result_table="T37_PARTY_RESULT"; //评级结果表
			String appr_table="T37_APPR_BAS_RSLT";  //要点分值表
			if(form.getRate_source().equals("2")){ //再调整相关表
				result_table="T37_PRESULT_AUDIT";
				appr_table="T37_APPR_BAS_RSLT_AUDIT";
			}
			if(form.getRate_source().equals("uh")){ //历史相关表
				result_table="T37_PARTY_RESULT_UH";
				appr_table="T37_APPR_BAS_RSLT_UH";
			}
			if(form.getRate_source().equals("curr")){
				result_table="T37_PARTY_RESULT_CURR";
				appr_table="T37_APPR_BAS_RSLT_CURR";
				
			}
	    	t37_party_result.setResulekey(form.getResulekey());
	    	t37_party_result.setTable_name(result_table);
	       t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
	       if(t37_party_result.getResulekey()!=null && !"".equals(t37_party_result.getResulekey())){
	    	   t37_party_result.setRate_source(form.getRate_source());
				t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());

				 maxTreeLaye=t37_party_resultDAO.getMaxTreeLaye(sqlMap, t37_appr_bas_rslt);
				 if(t37_party_result.getScoremodi_flag()!=null&&t37_party_result.getScoremodi_flag().equals("1")){
						appr_table="T37_APPR_BAS_RSLT_MODI";
					}
				    if(!form.getResulekey().equals("")){
				    	t37_appr_bas_rslt.setResulekey(form.getResulekey());
						t37_appr_bas_rslt.setTemplatekey(form.getTemplatekey());
						t37_appr_bas_rslt.setOrgankey(form.getOrgankey());
					    t37_appr_bas_rslt.setTable_name(appr_table);
						//客户要点分值列表（列表的最后一层数据）
						t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
						//客户子项列表
						t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(sqlMap, t37_appr_bas_rslt);
				    }
					for(int i=0;i<t37_appr_elem_rsltList1.size();i++){
						T37_appr_bas_rslt t37_appr_elem=(T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
						String upElementkey=t37_appr_elem.getUpelementkey();
						
						if(map.get(upElementkey)==null){
							List list=new ArrayList();
							list.add(t37_appr_elem);
							map.put(upElementkey, list);
						}else{
							
							List list=(ArrayList)map.get(upElementkey);
							
							list.add(t37_appr_elem);
							map.put(upElementkey, list);
						}
					} 
	       }else{
	    	    errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","评级信息不存在！"));
		        saveErrors(request, errors);
		        forward="failure";
	       }
	       
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward(forward);
		}
		request.setAttribute("map", map);
		request.setAttribute("maxTreeLaye", maxTreeLaye);
		request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
		request.setAttribute("t37_party_result",t37_party_result );
		return actionMapping.findForward(forward);
	}
	
}
