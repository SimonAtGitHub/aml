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
* <p>T07_INREP_BH_cny_repActoin.java</p>
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
import com.ist.aml.pbcreport.dto.T07_nbs_rbif;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.util.*;
import com.ist.impfile.aml.report.dto.Report_SearchObj;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_INREP_BH_cny_repAction  extends BaseAction{

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
//查询结果
if ("getT07_INREP_BH_cny_repList".equalsIgnoreCase(myaction)) {
myforward = performGetT07_INREP_BH_cny_repList(mapping, form, request, response);
}
//导出excel
else if("exportT07_inrep_bh_cny_rep".equalsIgnoreCase(myaction)) {
myforward = performExportT07_inrep_bh_cny_rep(mapping, form, request, response);
}

return myforward;

}
/**
* 查询人民币大额报送情况统计
* @param mapping ActionMapping
* @param form ActionForm
* @param request HttpServletRequest
* @param response HttpServletResponse
* @return ActionForward
*/
public ActionForward performGetT07_INREP_BH_cny_repList(ActionMapping actionMapping, ActionForm actionForm,
	HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	ActionErrors errors = new ActionErrors();
	
	T07_INREP_BH_cny_repDAO t07_inrep_bh_cny_repDAO = (T07_INREP_BH_cny_repDAO)context.getBean("t07_inrep_bh_cny_repDAO");
	T07_INREP_BH_cny_rep t07_inrep_bh_cny_rep = new T07_INREP_BH_cny_rep();
	try {
	T07_INREP_BH_cny_repActionForm form = (T07_INREP_BH_cny_repActionForm) actionForm;
	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
	Authorization auth = authBean.getAuthToken();
	
	String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
	int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
	String pageInfo="";
	List inrep_list=new ArrayList();
	if ("1".equals(newsearchflag)) {// 新的查询
		MyBeanUtils.copyBean2Bean(t07_inrep_bh_cny_rep, form);
		t07_inrep_bh_cny_rep.setOrg_ids(auth.getOrganstr());
		t07_inrep_bh_cny_rep.setIntPage(0);
		if (form.getStart_time() != null
				&& !"".equals(form.getStart_time())) {
			t07_inrep_bh_cny_rep.setReport_dt_start(DateUtils.stringToDateShort(form
					.getStart_time()));
		}
		if (form.getEnd_time() != null
				&& !"".equals(form.getEnd_time())) {
			t07_inrep_bh_cny_rep.setReport_dt_end(DateUtils.stringToDateShort(form
					.getEnd_time()));
		}
		session.setAttribute("t07_inrep_bh_cny_repSearchObj", t07_inrep_bh_cny_rep);
	}else if("2".equals(newsearchflag)){
		
	}else{
		t07_inrep_bh_cny_rep=(T07_INREP_BH_cny_rep)session.getAttribute("t07_inrep_bh_cny_repSearchObj");
		if(t07_inrep_bh_cny_rep==null){
			t07_inrep_bh_cny_rep=new T07_INREP_BH_cny_rep();
		}
		MyBeanUtils.copyBean2Bean(form,t07_inrep_bh_cny_rep);
		if(intPage!=0){
			t07_inrep_bh_cny_rep.setIntPage(intPage);
		}else{
			intPage=t07_inrep_bh_cny_rep.getIntPage();
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
		inrep_list=t07_inrep_bh_cny_repDAO.getT07_INREP_BH_cny_repList(sqlMap, t07_inrep_bh_cny_rep,
				this.getStartRec(intPage), this.getIntPageSize());
		int totalRow=t07_inrep_bh_cny_repDAO.getT07_INREP_BH_cny_repListCount(sqlMap, t07_inrep_bh_cny_rep);
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
 * 导出报表
 * @param actionMapping
 * @param actionForm
 * @param request
 * @param response
 * @return
 */
public ActionForward performExportT07_inrep_bh_cny_rep(ActionMapping actionMapping,
		ActionForm actionForm, HttpServletRequest request,
		HttpServletResponse response) {
	ActionErrors errors = new ActionErrors();
	HttpSession session = request.getSession();
	
	T07_INREP_BH_cny_repDAO t07_inrep_bh_cny_repDAO = (T07_INREP_BH_cny_repDAO)context.getBean("t07_inrep_bh_cny_repDAO");
	T07_INREP_BH_cny_rep t07_inrep_bh_cny_rep = new T07_INREP_BH_cny_rep();
	List inrep_list;
	try {
		t07_inrep_bh_cny_rep=(T07_INREP_BH_cny_rep)session.getAttribute("t07_inrep_bh_cny_repSearchObj");
		inrep_list = t07_inrep_bh_cny_repDAO.getT07_INREP_BH_cny_repSumByOrgan(sqlMap,
				t07_inrep_bh_cny_rep);
		if(inrep_list.size() > 5000){
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","一次导出不得超过5000条！"));
	        saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		String excelName = "t07_inrep_bh_cny_repExcel";
		request.setAttribute("excelName", excelName);
		request.setAttribute("inrep_list", inrep_list);
		request.setAttribute("reportDt", t07_inrep_bh_cny_rep.getStart_time()+"至"+t07_inrep_bh_cny_rep.getEnd_time());
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


}

