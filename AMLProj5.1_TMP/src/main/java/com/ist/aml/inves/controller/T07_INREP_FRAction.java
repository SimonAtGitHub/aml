/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2014-02-10] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.inves.controller;

/**
* <p>T07_INREP_FRActoin.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import org.apache.struts.action.*;

import javax.servlet.http.*;

import java.util.*;

import org.apache.commons.beanutils.PropertyUtils;
import com.ist.aml.inves.dao.*;
import com.ist.aml.inves.dto.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.util.*;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_INREP_FRAction  extends BaseAction{

/**
* Action执行入口
* @param mapping ActionMapping
* @param form ActionForm
* @param request HttpServletRequest
* @param response HttpServletResponse
* @return ActionForward
*/
public ActionForward execute(ActionMapping mapping, ActionForm form,HttpServletRequest request,HttpServletResponse response) {

ActionForward myforward = null;
String myaction = mapping.getParameter();
//预处理
myforward = this.preExecute(mapping, form, request, response);
//如预处理中强行跳出
if("false".equals(request.getAttribute("goWayFlag")))
    return myforward;

//查询大额
else if("getT07_INREP_FR_deList".equalsIgnoreCase(myaction)) {
myforward = performGetT07_INREP_FR_deList(mapping, form, request, response);
}
//查询可疑
else if("getT07_INREP_FR_kyList".equalsIgnoreCase(myaction)) {
	myforward = performGetT07_INREP_FR_kyList(mapping, form, request, response);
	}
//导出报表
else if("exportT07_inrep_fr".equalsIgnoreCase(myaction)) {
	myforward = performeExportT07_inrep_fr(mapping, form, request, response);
}
return myforward;

}

/**
* 查询大额
* @param mapping ActionMapping
* @param form ActionForm
* @param request HttpServletRequest
* @param response HttpServletResponse
* @return ActionForward
*/
public ActionForward performGetT07_INREP_FR_deList(ActionMapping actionMapping, ActionForm actionForm,
HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	ActionErrors errors = new ActionErrors();

	T07_INREP_FRDAO t07_inrep_frDAO = (T07_INREP_FRDAO)context.getBean("t07_inrep_frDAO");
	T07_INREP_FR t07_inrep_fr = new T07_INREP_FR();
try {
	T07_INREP_FRActionForm form = (T07_INREP_FRActionForm) actionForm;
	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
	Authorization auth = authBean.getAuthToken();
	
	String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
	List inrep_list=new ArrayList();
	int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
	String pageInfo="";
	if ("1".equals(newsearchflag)) {// 新的查询
		MyBeanUtils.copyBean2Bean(t07_inrep_fr, form);
		t07_inrep_fr.setCast_type("1");//大额
		t07_inrep_fr.setOrg_ids(auth.getOrganstr());
		t07_inrep_fr.setIntPage(0);
		if (form.getStart_time() != null
				&& !"".equals(form.getStart_time())) {
			t07_inrep_fr.setReport_dt_start(DateUtils.stringToDateShort(form
					.getStart_time()));
		}
		if (form.getEnd_time() != null
				&& !"".equals(form.getEnd_time())) {
			t07_inrep_fr.setReport_dt_end(DateUtils.stringToDateShort(form
					.getEnd_time()));
		}
		session.setAttribute("t07_inrep_frSearchObj", t07_inrep_fr);
	}else if("2".equals(newsearchflag)){
		
	}else{
		t07_inrep_fr=(T07_INREP_FR)session.getAttribute("t07_inrep_frSearchObj");
		if(t07_inrep_fr==null){
			t07_inrep_fr=new T07_INREP_FR();
		}
		MyBeanUtils.copyBean2Bean( form,t07_inrep_fr);
		if(intPage!=0){
			t07_inrep_fr.setIntPage(intPage);
		}else{
			intPage=t07_inrep_fr.getIntPage();
		}
	}
	if(form.getStart_time()==null || form.getStart_time().equals("")){
		form.setStart_time(DateUtils.dateToStringShort(new Date()));
	}
	if(form.getEnd_time()==null || form.getEnd_time().equals("")){
		form.setEnd_time(DateUtils.dateToStringShort(new Date()));
	}

String isExport="0";
	if(!"2".equals(newsearchflag)){
	inrep_list = t07_inrep_frDAO.getT07_INREP_FRList(sqlMap,
			t07_inrep_fr,this.getStartRec(intPage), this.getIntPageSize());
	int totalRow=t07_inrep_frDAO.getT07_INREP_FRListCount(sqlMap,
			t07_inrep_fr);
	String url = request.getContextPath() + "/inves"
	+ actionMapping.getPath() + ".do";
	pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
	if(inrep_list.size()>0){
		isExport="1";
	}
}
request.setAttribute("isExport", isExport);
request.setAttribute("pageInfo", pageInfo);
    request.setAttribute("inrep_list", inrep_list);
}
catch (Exception e) {
	e.printStackTrace();
	errors.add(errors.GLOBAL_ERROR, new ActionError(
			"error.pagertitle.default"));
	saveErrors(request, errors);
	return actionMapping.findForward("failure");
}
return actionMapping.findForward("success");
}
/**
* 查询可疑
* @param mapping ActionMapping
* @param form ActionForm
* @param request HttpServletRequest
* @param response HttpServletResponse
* @return ActionForward
*/
public ActionForward performGetT07_INREP_FR_kyList(ActionMapping actionMapping, ActionForm actionForm,
HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	ActionErrors errors = new ActionErrors();

	T07_INREP_FRDAO t07_inrep_frDAO = (T07_INREP_FRDAO)context.getBean("t07_inrep_frDAO");
	T07_INREP_FR t07_inrep_fr = new T07_INREP_FR();
try {
	T07_INREP_FRActionForm form = (T07_INREP_FRActionForm) actionForm;
	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
	Authorization auth = authBean.getAuthToken();
	
	String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
	List inrep_list=new ArrayList();
	int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
	String pageInfo="";
	if ("1".equals(newsearchflag)) {// 新的查询
		MyBeanUtils.copyBean2Bean(t07_inrep_fr, form);
		t07_inrep_fr.setCast_type("2");//可疑
		t07_inrep_fr.setOrg_ids(auth.getOrganstr());
		t07_inrep_fr.setIntPage(0);
		if (form.getStart_time() != null
				&& !"".equals(form.getStart_time())) {
			t07_inrep_fr.setReport_dt_start(DateUtils.stringToDateShort(form
					.getStart_time()));
		}
		if (form.getEnd_time() != null
				&& !"".equals(form.getEnd_time())) {
			t07_inrep_fr.setReport_dt_end(DateUtils.stringToDateShort(form
					.getEnd_time()));
		}
		session.setAttribute("t07_inrep_frSearchObj", t07_inrep_fr);
	}else if("2".equals(newsearchflag)){
		
	}else{
			t07_inrep_fr=(T07_INREP_FR)session.getAttribute("t07_inrep_frSearchObj");
			if(t07_inrep_fr==null){
				t07_inrep_fr=new T07_INREP_FR();
			}
			MyBeanUtils.copyBean2Bean( form,t07_inrep_fr);
			if(intPage!=0){
				t07_inrep_fr.setIntPage(intPage);
			}else{
				intPage=t07_inrep_fr.getIntPage();
			}
		}
		if(form.getStart_time()==null || form.getStart_time().equals("")){
			form.setStart_time(DateUtils.dateToStringShort(new Date()));
		}
		if(form.getEnd_time()==null || form.getEnd_time().equals("")){
			form.setEnd_time(DateUtils.dateToStringShort(new Date()));
		}

	String isExport="0";
		if(!"2".equals(newsearchflag)){
		inrep_list = t07_inrep_frDAO.getT07_INREP_FRList(sqlMap,
				t07_inrep_fr,this.getStartRec(intPage), this.getIntPageSize());
		int totalRow=t07_inrep_frDAO.getT07_INREP_FRListCount(sqlMap,
				t07_inrep_fr);
		String url = request.getContextPath() + "/inves"
		+ actionMapping.getPath() + ".do";
		pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		if(inrep_list.size()>0){
			isExport="1";
		}
	}
	request.setAttribute("isExport", isExport);
	request.setAttribute("pageInfo", pageInfo);
    request.setAttribute("inrep_list", inrep_list);
}
catch (Exception e) {
	e.printStackTrace();
	errors.add(errors.GLOBAL_ERROR, new ActionError(
			"error.pagertitle.default"));
	saveErrors(request, errors);
	return actionMapping.findForward("failure");
}
return actionMapping.findForward("success");
}
public ActionForward performeExportT07_inrep_fr(ActionMapping actionMapping, ActionForm actionForm,
		HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ActionErrors errors = new ActionErrors();

		T07_INREP_FRDAO t07_inrep_frDAO = (T07_INREP_FRDAO)context.getBean("t07_inrep_frDAO");
		T07_INREP_FR t07_inrep_fr = new T07_INREP_FR();
		List inrep_list=null;
	try {
		t07_inrep_fr=(T07_INREP_FR)session.getAttribute("t07_inrep_frSearchObj");
		inrep_list = t07_inrep_frDAO.getT07_INREP_FRSumByOrgan(sqlMap,
				t07_inrep_fr);
		if(inrep_list.size() > 5000){
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","一次导出不得超过5000条！"));
	        saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		String excelName = "t07_inrep_frExcel";
		request.setAttribute("excelName", excelName);
		request.setAttribute("inrep_list", inrep_list);
		request.setAttribute("reportDt", t07_inrep_fr.getStart_time()+"至"+t07_inrep_fr.getEnd_time());
		if("1".equals(t07_inrep_fr.getCast_type())){
			request.setAttribute("title", "大额补录考核表");
		}else{
			request.setAttribute("title", "可疑补录考核表");
		}
	}
	catch (Exception e) {
		e.printStackTrace();
		errors.add(errors.GLOBAL_ERROR, new ActionError(
				"error.pagertitle.default"));
		saveErrors(request, errors);
		return actionMapping.findForward("failure");
	}
	return actionMapping.findForward("success");
}

}

