package com.ist.aml.risk_rate.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T37_party_resultCurrAction extends BaseAction {
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
		// 当前评级结果查询列表
		if ("getT37_curr_rate_resultList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_curr_rate_resultList(mapping, form, request,
					response);
		}
		//发起调整校验
		if ("t37_result_currToAuditDoVerify".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_resultVerify(mapping, form, request,
					response);
		}
		//发起调整动作
		if ("t37_result_currToAuditDo".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_result_currToAudit(mapping, form, request,
					response);
		}
		//删除再调整表
		if ("t37_result_deleteAuditDo".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_result_deleteAudit(mapping, form, request,
					response);
		}
		//导出客户风险信息
		if ("exportT37_curr_rate_result".equalsIgnoreCase(myaction)) {
			myforward = performExportT37_curr_rate_result(mapping, form, request,response);
		}
		//全部导出客户风险信息
		if ("exportT37_curr_rate_resultAll".equalsIgnoreCase(myaction)) {
			myforward = performExportT37_curr_rate_result(mapping, form, request,response);
		}
		//等级调整进度查询
		if("getT37_level_adjust_progressList".equals(myaction)){
			myforward = performGetT37_level_adjust_progressList(mapping, form, request,response);
		}
		
		return myforward;
	}
	/**
	 * 等级调整进度列表查询
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_level_adjust_progressList(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_resultList = null;
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			//来源 1系统 2再调整
			LinkedHashMap rateSourceMap = cm.getMapFromCache("rate_source");
			request.setAttribute("rate_source_map", this.getOptionsListByMap(rateSourceMap, null, true));
			//新开存量客户审查状态1:待处理;2:待审核 3：待审批 4：审核退回 5：审批退回 6：审批通过  
			LinkedHashMap rate_status_cdMap = cm.getMapFromCache("rate_status_cd");//状态
			request.setAttribute("rate_status_cdMap", this.getOptionsListByMap(rate_status_cdMap, null, true));
			//模板类型 1积分 2公式
			LinkedHashMap temp_type_map = cm.getMapFromCache("temp_type");
			request.setAttribute("temp_type_map", this.getOptionsListByMap(temp_type_map, null, true));
			//模板
			LinkedHashMap tempcategoryMap = cm.getMapFromCache("getT37_level_adjust_progressTemp");
			request.setAttribute("tempcategoryMap", this.getOptionsListByMap(tempcategoryMap, null, true));
			//协查状态'未处理'待协查'待复核'已协查'退回
			LinkedHashMap hcheck_statusMap = cm.getMapFromCache("helpcheckstatus");
			request.setAttribute("hcheck_statusMap", this.getOptionsListByMap(hcheck_statusMap, null, true));
			//排序
			LinkedHashMap resultsortMap = cm.getMapFromCache("risk_ratesort");
			request.setAttribute("resultsortMap", this.getOptionsListByMap(resultsortMap, null, true));
			// 风险等级/低风险/较低风险/一般风险/高风险/较高风险
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level");
			request.setAttribute("riskLevelMap", this.getOptionsListByMap(levelMap, null, true));
			// 客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(clienttypeMap, null, true));
			//模板公式
			LinkedHashMap gskeyMap = cm.getMapFromCache("getT31_DEF_GS");
			request.setAttribute("gskeyMap", this.getOptionsListByMap(gskeyMap, null, true));
			if ("0".equals(newsearchflag)) {
//				if(form.getOrgankey().equals("")){
//					form.setOrgankey(auth.getT00_user().getOrgankey());
//				}
				t37_party_result.setOrganStr(auth.getOrganstr());
				t37_party_result.setOrgankey(form.getOrgankey());
				t37_party_resultList = t37_party_resultDAO.getT37_level_adjust_progressList(sqlMap, t37_party_result,this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO.getT37_level_adjust_progressListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/risk_rate"+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
				//session.removeAttribute("t37_level_adjust_progressSearchObj");
				session.setAttribute("t37_level_adjust_progressSearchObj",t37_party_result);
			}
			else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				String statistic_dt_disp=form.getStatistic_dt_disp();
				String statistic_dt_disp_end=form.getStatistic_dt_disp_end();
				String create_dt = form.getCreate_dt_disp();
				String create_dt_end = form.getCreate_dt_disp_end();
				if (statistic_dt_disp != null && !"".equals(statistic_dt_disp)) {
					t37_party_result.setStatistic_dt(DateUtils.stringToDateShort(statistic_dt_disp));
				}
				if (statistic_dt_disp_end != null && !"".equals(statistic_dt_disp_end)) {
					t37_party_result.setStatistic_dt_end(DateUtils.stringToDateShort(statistic_dt_disp_end));
				}
				if(create_dt !=null && !"".equals(create_dt)){
					t37_party_result.setCreate_dt(DateUtils.stringToDateShort(create_dt));
				}
				if(create_dt_end != null && !"".equals(create_dt_end)){
					t37_party_result.setCreate_dt_end(DateUtils.stringToDateShort(create_dt_end));
				}
				if(t37_party_result.getTempcategory()!=null&&!"".equals(t37_party_result.getTempcategory())){
					t37_party_result.setTempcategory_c(surroundSymbol(t37_party_result.getTempcategory(),",","'"));
				}
				session.setAttribute("t37_level_adjust_progressSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_level_adjust_progressSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
			if (!"0".equals(newsearchflag) ) {
				t37_party_resultList = t37_party_resultDAO.getT37_level_adjust_progressList(sqlMap, t37_party_result,this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO.getT37_level_adjust_progressListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/risk_rate"+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_party_resultList", t37_party_resultList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	/**
	 * 导出客户风险信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performExportT37_curr_rate_result(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		ArrayList tempList = new ArrayList();
		HttpSession session = request.getSession();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_result_rateDAO");
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			
			T37_party_result t37_party_result = new T37_party_result();
			String exportType = form.getExportType();
			if("select".equals(exportType)){
				String[] keys = form.getSelectedResulekey();
				ArrayList<String> resultKeyList = new ArrayList<String>();
				ArrayList<String> organKeyList = new ArrayList<String>();
				for(int i=0;i<keys.length;i++){   
					String[] str=keys[i].split(",");
					resultKeyList.add(str[0]);
					organKeyList.add(str[1]);
				}
				t37_party_result.setList(resultKeyList);
				t37_party_result.setOrganKeyList(organKeyList);
			}else if("all".equals(exportType)){
				t37_party_result = (T37_party_result)session.getAttribute("t37_party_result_currSearchObj");
			}
			t37_party_result.setExportType(exportType);
			t37_party_result.setTable_name("T37_PARTY_RESULT_CURR");
			tempList = t37_party_resultDAO.getT37_export_curr_rate_resultDisp(sqlMap, t37_party_result);
			
			String downloadname = DateUtils.dateToStringShort(DateUtils.getCurrDateTime()) + "客户风险信息";
			request.setAttribute("downloadname", downloadname);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		}
		request.setAttribute("tempList", tempList);
		return actionMapping.findForward("success");
	}
	/**
	 * 当前评级结果查询列表
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetT37_curr_rate_resultList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_resultList = null;
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//取的当前用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			
//			LinkedHashMap rate_status_cdMap = cm.getMapFromCache("rate_status_cd");//状态
//			request.setAttribute("rate_status_cdMap", this.getOptionsListByMap(rate_status_cdMap, null, true));
			//模板类型
			LinkedHashMap temp_type_map = cm.getMapFromCache("temp_type");
			request.setAttribute("temp_type_map", this.getOptionsListByMap(temp_type_map, null, true));
			LinkedHashMap hcheck_statusMap = cm.getMapFromCache("helpcheckstatus");//协查状态'未处理'待协查'待复核'已协查'退回
			request.setAttribute("hcheck_statusMap", this.getOptionsListByMap(hcheck_statusMap, null, true));
			LinkedHashMap resultsortMap = cm.getMapFromCache("risk_ratesort");//排序
			request.setAttribute("resultsortMap", this.getOptionsListByMap(resultsortMap, null, true));
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // 风险等级/低风险/较低风险/一般风险/高风险/较高风险
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); // 客户类型
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(clienttypeMap, null, true));
			request.setAttribute("riskLevelMap", this.getOptionsListByMap(levelMap, null, true));
			LinkedHashMap gskeyMap = cm.getMapFromCache("getT31_DEF_GS"); //模板公式
			request.setAttribute("gskeyMap", this.getOptionsListByMap(gskeyMap, null, true));
			if ("0".equals(newsearchflag)) {
				if(form.getOrgankey().equals("")){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t37_party_result_currSearchObj");
			}
			else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				String statistic_dt_disp=form.getStatistic_dt_disp();
				String statistic_dt_disp_end=form.getStatistic_dt_disp_end();
				String rcheck_dt_disp = form.getRcheck_dt_disp();
				String rcheck_dt_disp_end = form.getRcheck_dt_disp_end();
				String create_dt = form.getCreate_dt_disp();
				String create_dt_end = form.getCreate_dt_disp_end();
				if (statistic_dt_disp != null && !"".equals(statistic_dt_disp)) {
					t37_party_result.setStatistic_dt(DateUtils.stringToDateShort(statistic_dt_disp));
				}
				if (statistic_dt_disp_end != null && !"".equals(statistic_dt_disp_end)) {
					t37_party_result.setStatistic_dt_end(DateUtils.stringToDateShort(statistic_dt_disp_end));
				}
				if(rcheck_dt_disp != null && !"".equals(rcheck_dt_disp)){
					t37_party_result.setRcheck_dt(DateUtils.stringToDateShort(rcheck_dt_disp));
				}
				if(rcheck_dt_disp_end != null && !"".equals(rcheck_dt_disp_end)){
					t37_party_result.setRcheck_dt_end(DateUtils.stringToDateShort(rcheck_dt_disp_end));
				}
				if(create_dt !=null && !"".equals(create_dt)){
					t37_party_result.setCreate_dt(DateUtils.stringToDateShort(create_dt));
				}
				if(create_dt_end != null && !"".equals(create_dt_end)){
					t37_party_result.setCreate_dt_end(DateUtils.stringToDateShort(create_dt_end));
				}
				if(t37_party_result.getTempcategory()!=null&&!"".equals(t37_party_result.getTempcategory())){
					t37_party_result.setTempcategory_c(surroundSymbol(t37_party_result.getTempcategory(),",","'"));
				}
				session.setAttribute("t37_party_result_currSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_party_result_currSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
			if (!"0".equals(newsearchflag) ) {
				t37_party_resultList = t37_party_resultDAO
						.getT37_curr_rate_resultList(sqlMap, t37_party_result, this
								.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO
						.getT37_curr_rate_resultListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/risk_rate"
						+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_party_resultList", t37_party_resultList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	/**
     * 符号环绕
     * 将例如string=a,b,c regex=，symbol=‘  返回形式为'a','b','c'
     * @param string  要换换的字符串
     * @param regex   分隔符
     * @param symbol  需要环绕的符号
     * @return
     */
    private static String surroundSymbol(String string ,String regex,String symbol){
        String[] array = string.split(regex);
        StringBuilder stringBuilder = new StringBuilder();
        for(String s:array){
            stringBuilder.append(symbol).append(s).append(symbol).append(regex);
        }
        if(stringBuilder.indexOf(",")!=-1)
            stringBuilder.deleteCharAt(stringBuilder.length()-1);
        return stringBuilder.toString();
    }
    public ActionForward performT37_party_resultVerify(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		T37_party_result t37_party_result = new T37_party_result();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String errors_info="";
			/*edit by helong 2015/4/13 再调整resulekey='R' || resulekey*/
			t37_party_result.setResulekey("R"+form.getResulekey());
			t37_party_result.setOrgankey(form.getOrgankey());
			t37_party_result.setTable_name("T37_PRESULT_AUDIT");
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			if(!t37_party_result.getResulekey().equals("")){
				errors_info = "再调整表中已存在该数据,不能发起再调整！";
			}
			request.setAttribute("errors_info", errors_info);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(errors_info);
			response.getWriter().close();
			
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return null;
	}
    public ActionForward performT37_party_result_currToAudit(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		T37_party_result t37_party_result = new T37_party_result();
		T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
		try {
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String currentOrgan=auth.getT00_user().getOrgankey();
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String[] resultKeys = form.getRkeys();
			String resultkey="";
			String temptype="";
			String organkey="";
			if (resultKeys != null && resultKeys.length > 0){
				for(int i=0;i<resultKeys.length;i++){
					String str=resultKeys[i];
					String[] strs=str.split(",");
					resultkey=strs[0];
					temptype=strs[1];
					organkey=strs[2];
				}
			}
			sqlMap.startTransaction();
			t37_party_result.setResulekey(resultkey);
			t37_party_result.setOrgankey(organkey);
			//流程id
			//是否根据模板走流程
			LinkedHashMap map=cm.getMapFromCache("t87_syspara");
			String flag=StringUtils.null2String((String)map.get("702"));
			if(flag.equals("0")){
				t37_party_result.setFlow_id("03");
			}else{
				t37_party_result.setFlow_id("Y");
			}
			
			t37_party_resultDAO.insertT37_party_result_currToAudit(sqlMap, t37_party_result); //评级结果表 当前-->再调整
			t37_appr_bas_rslt.setResulekey(resultkey);
			t37_appr_bas_rslt.setOrgankey(organkey);
			if(temptype.equals("1")){  //积分
				t37_party_resultDAO.insertT37_appr_bas_rslt_currToAudit(sqlMap, t37_appr_bas_rslt);  //客户要点分值表 当前-->再调整
			}else{ //公式
				//
				t37_party_resultDAO.insertT37_gs_indic_val_currToAudit(sqlMap, t37_appr_bas_rslt); //客户公式指标值表 当前-->再调整
			}
			//t37_party_resultDAO.insertT37_level_audit_currToAudit(sqlMap, t37_appr_bas_rslt); //客户等级调整表  当前-->再调整
			sqlMap.commitTransaction();
			String return_url="t37_result_auditList.do?post_id=P2001&rate_source=2";
			request.setAttribute("return_url",return_url);
			
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}
    public ActionForward performT37_party_result_deleteAudit(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		T37_party_result t37_party_result = new T37_party_result();
		T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String[] resultKeys = form.getRkeys();
			String organkey=form.getOrgankey();
			ArrayList list=new ArrayList();
			if (resultKeys != null && resultKeys.length > 0){
				for(int i=0;i<resultKeys.length;i++){
					String str=resultKeys[i];
					list.add(str);
				}
			}
			t37_party_result.setList(list);
			t37_party_result.setOrgankey(organkey);
			t37_party_result.setTable_name("T37_PRESULT_AUDIT");
			t37_party_resultDAO.deleteT37_party_result_audit(sqlMap, t37_party_result);
			//删除公式表删除积分表
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
}

