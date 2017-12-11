package com.ist.aml.report.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.inves.controller.T47_cp_depositActionForm;
import com.ist.aml.inves.dto.T47_cp_deposit;
import com.ist.aml.report.dao.T10_check_custDAO;
import com.ist.aml.report.dao.T10_survey_custDAO;
import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dao.T47_transactionDAO;

import com.ist.aml.report.controller.T07_case_applicationActionForm;
import com.ist.aml.report.dto.CreditTask;

import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T10_check_cust_card;
import com.ist.aml.report.dto.T10_check_cust_clue;
import com.ist.aml.report.dto.T10_check_cust_ke;
import com.ist.aml.report.dto.T10_check_cust_result;
import com.ist.aml.report.dto.T10_survey_cust;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.Template;
import com.ist.common.base.BaseAction;

import com.ist.common.jcs.CatchManager;
import com.ist.impfile.aml.report.dto.Report_SearchObj;

import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;
import com.opensymphony.util.BeanUtils;

public class T10_check_custAction extends BaseAction {
	private static final long serialVersionUID = -1149982052134005907L;
	private static Logger logger = LogUtils.getLogger(T10_check_custAction.class.getName()).getLogger(Constans.LOGGERNAMEA);

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		// 显示客户基本信息
		if ("get_survey_cust_info".equalsIgnoreCase(myaction)) {
			myforward = performGet_survey_cust_info(mapping, form, request, response);
		} else if ("get_check_acctlist".equalsIgnoreCase(myaction)) {
			myforward = perform_get_check_acctlist(mapping, form, request, response);
		} else if ("get_check_cust_caselist".equalsIgnoreCase(myaction)) {
			myforward = perform_get_check_cust_caselist(mapping, form, request, response);
		} else // 查询可疑客户列表
		if ("t10_check_cust_kelist".equalsIgnoreCase(myaction)) {
			myforward = performSearchtT10_check_cust_kelist(mapping, form, request, response);
		} else if ("t10_cust_risk_main".equalsIgnoreCase(myaction)) {
			myforward = show_t10_cust_risk_main(mapping, form, request, response);
		} else if ("get_check_cust_infolist".equalsIgnoreCase(myaction)) {
			myforward = perform_get_check_cust_infolist(mapping, form, request, response);
		} else if ("modifyT10_coluall".equalsIgnoreCase(myaction)) {
			myforward = performModifyT10_coluall(mapping, form, request, response);
		} else if ("delT10_coluall".equalsIgnoreCase(myaction)) {//add by zhanjin 2013-07-26
			myforward = performDelT10_coluall(mapping, form, request, response);
		} else if ("t47_client_modify_do".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_risk_clientDo(mapping, form, request, response);
		} else if ("t10_add_cust_do".equalsIgnoreCase(myaction)) {
			myforward = performT10_add_cust_do(mapping, form, request, response);
		} else if ("modifyT10_check_info_result".equalsIgnoreCase(myaction)) {
			myforward = modifyT10_check_info_result(mapping, form, request, response);
		} else if ("modifyT10_colu_result".equalsIgnoreCase(myaction)) {
			myforward = modifyT10_colu_result(mapping, form, request, response);
		} else if ("t47_client_blackorwhite_do".equalsIgnoreCase(myaction)) {
			myforward = t47_client_blackorwhite_do(mapping, form, request, response);
		} else if ("t10_check_cust_cardlist".equalsIgnoreCase(myaction)) {
			myforward = performSearchtT10_check_cust_cardlist(mapping, form, request, response);
		} else if ("get_check_cust_resultlist".equalsIgnoreCase(myaction)) {
			myforward = perform_get_check_cust_resultlist(mapping, form, request, response);
		}// 查询客户调查详情
		else if ("t10_check_cust_detail".equalsIgnoreCase(myaction)) {
			myforward = show_t10_check_cust_detail(mapping, form, request, response);
		} else if ("get_check_cust_translist".equalsIgnoreCase(myaction)) {
			myforward = perform_get_check_cust_translist(mapping, form, request, response);
		} else if ("get_cust_survey_result".equalsIgnoreCase(myaction)) {
			myforward = performGet_cust_survey_result(mapping, form, request, response);
		} else if ("show_t10_check_cust_resulinfo".equalsIgnoreCase(myaction)) {
			myforward = show_t10_check_cust_resulinfo(mapping, form, request, response);
		} else if ("t10_check_cust_report".equals(myaction)) {
			myforward = t10_check_cust_report(mapping, form, request, response);
		} else if ("show_t10_check_cust_acct".equals(myaction)) {
			myforward = show_t10_check_cust_acct(mapping, form, request, response);
		}

		return myforward;
	}

	private ActionForward performGet_survey_cust_info(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_survey_cust t10_survey_cust = new T10_survey_cust();
		String forward = "";

		ArrayList list_typeList = new ArrayList();

		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			String party_id = StringUtils.null2String(form.getParty_id());
			// System.out.println("partyid::::"+request.getParameter("party_id"));
			String party_class_cd = (String) request.getParameter("party_class_cd");

			String id_flag = request.getParameter("id_flag");// 判断调用 1 已识别客户调用 2
			// 案例处理-->客户识别调用
			if ("2".equals(id_flag)) {
				CreditTask credittask = (CreditTask) session.getAttribute("credittask");
				party_id = credittask.getParty_id();
				party_class_cd = credittask.getParty_class_cd();
				if ("".equals(party_class_cd) || party_class_cd == null) {
					T47_partyDAO t47_partyDAO = (T47_partyDAO) context.getBean("t47_partyDAO");
					com.ist.aml.report.dto.T47_party t47_party = t47_partyDAO.getT47_partyDisp(sqlMap, party_id);
					if (t47_party != null)
						party_class_cd = t47_party.getParty_class_cd();
				}
			}

			if (party_id == null || "".equals(party_id)) {
				throw new Exception("发现客户号为空");
			}
			if (party_class_cd == null || "".equals(party_class_cd)) {
				throw new Exception("发现客户类型为空");
			}
			if ("C".equalsIgnoreCase(party_class_cd)) {
				forward = "successC";
			} else if ("I".equalsIgnoreCase(party_class_cd)) {
				forward = "successI";
			}
			t10_survey_cust.setParty_id(party_id);
			t10_survey_cust.setParty_class_cd(party_class_cd);
			list_typeList = t10_check_custdao.getT10_survey_cust_list_typeList(sqlMap, t10_survey_cust);
			t10_survey_cust = t10_check_custdao.getT10_survey_cust_info(sqlMap, t10_survey_cust);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t10_survey_cust", t10_survey_cust);
		request.setAttribute("list_typeList", list_typeList);
		return actionMapping.findForward(forward);
	}

	private ActionForward perform_get_check_acctlist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		String party_id = (String) request.getParameter("party_id");
		String party_class_cd = (String) request.getParameter("party_class_cd");
		String id_flag = StringUtils.null2String(request.getParameter("id_flag"));// 判断调用
		// 1
		// 已识别客户调用
		// 2
		// 案例处理-->客户识别调用
		if ("2".equals(id_flag)) {
			CreditTask credittask = (CreditTask) session.getAttribute("credittask");
			party_id = credittask.getParty_id();
			party_class_cd = credittask.getParty_class_cd();
		}
		ArrayList acctList = new ArrayList();
		String pageInfo = "";

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T47_cp_deposit t47_cp_deposit = new T47_cp_deposit();

		try {
			T47_cp_depositActionForm form = (T47_cp_depositActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			String tablename = "";
			if (party_class_cd != null && "I".equalsIgnoreCase(party_class_cd)) {
				tablename = "T47_ID_DEPOSIT";
			}
			if (party_class_cd != null && "C".equalsIgnoreCase(party_class_cd)) {
				tablename = "T47_CP_DEPOSIT";
			}

			// 获取查询页面下拉列表信息

			LinkedHashMap order_nameMap = cm.getMapFromCache("order_name");
			request.setAttribute("order_nameMap", this.getOptionsListByMap(order_nameMap, null, true));
			LinkedHashMap acctstatuscdMap = cm.getMapFromCache("acctstatuscdmap");// 案例种类
			request.setAttribute("acctstatuscdMap", this.getOptionsListByMap(acctstatuscdMap, null, true));
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_cp_deposit, form);
				t47_cp_deposit.setParty_id(party_id);
				t47_cp_deposit.setParty_class_cd(party_class_cd);
				t47_cp_deposit.setTablename(tablename);
				t47_cp_deposit.setOpen_dt_start(DateUtils.stringToDateShort(t47_cp_deposit.getOpen_dt_start_disp()));
				t47_cp_deposit.setOpen_dt_end(DateUtils.stringToDateShort(t47_cp_deposit.getOpen_dt_end_disp()));
				t47_cp_deposit.setOrder_name(t47_cp_deposit.getOrder_name().toUpperCase());
				t47_cp_deposit.setAcct_status_cd(form.getAcct_status_cd());
				session.setAttribute("t47_cp_depositSearchObj", t47_cp_deposit);
			} else {// 翻页
				t47_cp_deposit = (T47_cp_deposit) session.getAttribute("t47_cp_depositSearchObj");
			}
			acctList = t10_check_custdao.getT10_check_acctList(sqlMap, t47_cp_deposit, this.getStartRec(intPage), this
					.getIntPageSize());
			int totalRow = t10_check_custdao.getT10_check_acctListCount(sqlMap, t47_cp_deposit);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_cp_depositList", acctList);
		request.setAttribute("t47_cp_deposit", t47_cp_deposit);
		return actionMapping.findForward("success");
	}

	private ActionForward perform_get_check_cust_caselist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		String pageInfo = "";
		ArrayList case_list = new ArrayList();
		String party_id = (String) request.getParameter("party_id");
		T07_case_application t07_case_app = new T07_case_application();
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");

		T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;

		try {
			String id_flag = StringUtils.null2String(request.getParameter("id_flag"));// 判断调用
			// 1
			// 已识别客户调用
			// 2
			// 案例处理-->客户识别调用
			if ("2".equals(id_flag)) {
				CreditTask credittask = (CreditTask) session.getAttribute("credittask");
				party_id = credittask.getParty_id();

			}
			// T07_case_applicationActionForm form =
			// (T07_case_applicationActionForm) actionForm;
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();
			LinkedHashMap case_typeMap = cm.getMapFromCache("casetype");// 案例类型
			LinkedHashMap case_statusMap = cm.getMapFromCache("casestatus"); // 案例状态
			LinkedHashMap order_map = cm.getMapFromCache("order_case");// 案例排序
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(case_typeMap, null, true));
			request.setAttribute("casestatusMap", this.getOptionsListByMap(case_statusMap, null, true));
			request.setAttribute("casesorderMap", this.getOptionsListByMap(order_map, null, true));

			// 报送状态
			LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
			request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(casesearchtimeMap, null, false));
			if (form.getCasesearchtime() == null || "".equals(form.getCasesearchtime()))
				form.setCasesearchtime("0");

			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);

			if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t07_case_app, form);
				if (form.getParty_id() == null || "".equals(form.getParty_id())) {
					t07_case_app.setParty_id(party_id);
				}
				if (form.getCase_date_start_disp() != null && !"".equals(form.getCase_date_start_disp())) {
					t07_case_app.setCase_date_start(DateUtils.stringToDateShort(form.getCase_date_start_disp()));
				}
				if (form.getCase_date_end_disp() != null && !"".equals(form.getCase_date_end_disp())) {
					t07_case_app.setCase_date_end(DateUtils.stringToDateShort(form.getCase_date_end_disp()));
				}
				t07_case_app.setOrganStr(org_id);
				session.setAttribute("t07_case_appSearchObj", t07_case_app);
			} else {
				t07_case_app = (T07_case_application) session.getAttribute("t07_case_appSearchObj");
				if (t07_case_app == null)
					t07_case_app = new T07_case_application();
			}
			case_list = t10_check_custdao.get_check_cust_appList(sqlMap, t07_case_app, this.getStartRec(intPage), this
					.getIntPageSize());
			int totalRow = t10_check_custdao.get_check_cust_appsCount(sqlMap, t07_case_app);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

			request.setAttribute("casesearchtime", form.getCasesearchtime());

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("party_id", t07_case_app.getParty_id());
		request.setAttribute("t10_check_cust_caselist", case_list);
		return actionMapping.findForward("success");
	}

	/**
	 * 查询可疑客户列表
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performSearchtT10_check_cust_kelist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t10_check_partylist = new ArrayList();
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_ke t10_check_cust_ke = new T10_check_cust_ke();
		T10_check_cust_keActionForm form = (T10_check_cust_keActionForm) actionForm;
		String pageInfo = "";
		try {
			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype"); // 客户类型
			LinkedHashMap order_check_map = cm.getMapFromCache("order_check_ke");
			LinkedHashMap check_status_map = cm.getMapFromCache("check_status");
			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(party_class_cdMap, null, true));
			request.setAttribute("check_status_map", this.getOptionsListByMap(check_status_map, null, true));
			request.setAttribute("order_check_map", this.getOptionsListByMap(order_check_map, null, true));
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			session.setAttribute("custtype", "2");
			// 取的当前用户
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			t10_check_cust_ke.setOrganStr(organStr);

			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t10_check_cust_ke, form);
				session.setAttribute("t10_check_cust_keSearchObj", t10_check_cust_ke);
			} else {// 翻页
				t10_check_cust_ke = (T10_check_cust_ke) session.getAttribute("t10_check_cust_keSearchObj");
				if (intPage != 0) {
					t10_check_cust_ke.setIntPage(intPage);
					session.setAttribute("t10_check_cust_keSearchObj", t10_check_cust_ke);
				} else if (t10_check_cust_ke != null)
					intPage = t10_check_cust_ke.getIntPage();
			}
			t10_check_cust_ke.setCurr_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t10_check_partylist = t10_check_custdao.getT10_check_custkeList(sqlMap, t10_check_cust_ke, this.getStartRec(intPage),
					this.getIntPageSize());
			int totalRow = t10_check_custdao.getT10_check_custkeListCount(sqlMap, t10_check_cust_ke);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t10_check_partylist", t10_check_partylist);
		return actionMapping.findForward("success");
	}

	private ActionForward show_t10_cust_risk_main(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			String party_id = StringUtils.null2String(form.getParty_id());
			String party_class_cd = StringUtils.null2String(form.getParty_class_cd());
			String flag = StringUtils.null2String(request.getParameter("flag")); // 1:客户识别
			// 2证件到期客户识别；客户号链接时1:显示案例信息和风险评级信息
			request.setAttribute("flag", flag);
			request.setAttribute("party_id", party_id);
			request.setAttribute("party_class_cd", party_class_cd);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	private ActionForward perform_get_check_cust_infolist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		StringBuffer error = new StringBuffer("");
		String forward = "";
		ArrayList list_typeList = new ArrayList();
		T10_survey_custDAO t10_survey_custdao = (T10_survey_custDAO) context.getBean("t10_survey_custDAO");
		T10_survey_cust t10_survey_cust = new T10_survey_cust();
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			String party_class_cd = StringUtils.null2String(request.getParameter("party_class_cd"));
			if (request.getParameter("party_id") != null && !"".equals(request.getParameter("party_id"))) {
				party_id = request.getParameter("party_id");
			}
			if (request.getParameter("party_class_cd") != null && !"".equals(request.getParameter("party_class_cd"))) {
				party_class_cd = request.getParameter("party_class_cd");
			}
			t47_client.setParty_id(party_id);
			t47_client.setParty_class_cd(party_class_cd);
			if (party_class_cd != null && party_class_cd.equals("I")) {
				forward = "successI";
			} else {
				forward = "successC";
			}
			if (party_class_cd != null && party_class_cd.equals("I") && request.getParameter("party_class_cdresult") != null
					&& !"".equals(request.getParameter("party_class_cdresult"))) {
				request.setAttribute("flag_disp", "I");

			} else if (party_class_cd != null && party_class_cd.equals("C")
					&& request.getParameter("party_class_cdresult") != null
					&& !"".equals(request.getParameter("party_class_cdresult"))) {
				request.setAttribute("flag_disp", "C");

			}
			if (party_id == null || party_id.trim().equals("") || party_class_cd == null || party_class_cd.trim().equals("")) {
				error.append("发现客户号为空！");
			}
			t47_client = t10_check_custdao.getT47_clientDisp(sqlMap, t47_client);
			// if(t47_client!=null){
			// session.setAttribute("custNamet47",
			// t47_client.getParty_chn_name());
			//			
			// }

			if (t47_client == null)
				t47_client = new T10_check_cust_clue();

			t47_client.setParty_class_cd(party_class_cd);
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			t47_client.setOrganname((String) organMap.get(StringUtils.null2String(t47_client.getOrgankey())));
			// 国籍
			LinkedHashMap nationalityMap = cm.getMapFromCache("country");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(nationalityMap, null, true));
			// 国内地区
			LinkedHashMap risk_pbcareaMap = cm.getMapFromCache("pbcarea");
			request.setAttribute("risk_pbcareaMap", this.getOptionsListByMap(risk_pbcareaMap, null, true));
			// 对公行业、对私职业
			LinkedHashMap industryMap = cm.getMapFromCache("industryMap");

			if (t47_client.getCard_end_dt() != null) {// 证件到期日
				t47_client.setCard_end_dt_disp(DateUtils.dateToStringShort(t47_client.getCard_end_dt()));
			}
			if (t47_client.getLicence_end_dt() != null) {// 证件到期日
				t47_client.setLicence_end_dt_disp(DateUtils.dateToStringShort(t47_client.getLicence_end_dt()));
			}
			if (t47_client.getLegal_card_no_end_dt() != null) {// 证件到期日
				t47_client.setLegal_card_no_end_dt_disp(DateUtils.dateToStringShort(t47_client.getLegal_card_no_end_dt()));
			}
			if (t47_client.getLocal_affair_end_dt() != null) {// 证件到期日
				t47_client.setLocal_affair_end_dt_disp(DateUtils.dateToStringShort(t47_client.getLocal_affair_end_dt()));
			}
			if (t47_client.getNation_affair_end_dt() != null) {// 证件到期日
				t47_client.setNation_affair_end_dt_disp(DateUtils.dateToStringShort(t47_client.getNation_affair_end_dt()));
			}
			if (t47_client.getOrgan_code_end_dt() != null) {// 证件到期日
				t47_client.setOrgan_code_end_dt_disp(DateUtils.dateToStringShort(t47_client.getOrgan_code_end_dt()));
			}
			if (t47_client.getOrg_credit_vt() != null) {// 机构信用代码有效期
				t47_client.setOrg_credit_vt_disp(DateUtils.dateToStringShort(t47_client.getOrg_credit_vt()));
			}
			if (t47_client.getCountry_cd() == null) {
				t47_client.setCountry_cd("CHN");
			}
			if (t47_client.getCountry_residence() != null && t47_client.getCountry_cd() != null
					&& !"".equals(t47_client.getCountry_residence())) {// 根据行政区划代码获取地区的中文描述
				if (!"CHN".equals(t47_client.getCountry_cd())) {
					t47_client.setCountry_residence("000000");
				} else if ("CHN".equals(t47_client.getCountry_cd()) && t47_client.getCountry_residence().length() == 6) {
					if (risk_pbcareaMap.get(t47_client.getCountry_residence()) != null) {
						t47_client.setArea_no_disp("中国"
								+ (String) risk_pbcareaMap.get(t47_client.getCountry_residence().substring(0, 4) + "00")
								+ (String) risk_pbcareaMap.get(t47_client.getCountry_residence().substring(0, 6)));
					}
				}
				t47_client.setCountry_residence(t47_client.getCountry_cd() + t47_client.getCountry_residence());
			}

			if (party_class_cd != null) {
				if (party_class_cd.equalsIgnoreCase("i")) {
					if (t47_client.getProfession() != null) {
						t47_client.setProfession_disp(StringUtils.null2String((String) industryMap
								.get(t47_client.getProfession())));
					}
				} else if (party_class_cd.equalsIgnoreCase("c")) {
					if (t47_client.getIndustrykey() != null) {
						t47_client.setIndustrykey_disp(StringUtils.null2String((String) industryMap.get(t47_client
								.getIndustrykey())));
					}
				}
			}
			
			String card_type08 = t47_client.getCard_type().substring(0, 2);
			String card_type_inf08 = t47_client.getCard_type().substring(2);
			t47_client.setCard_type(card_type08);
			t47_client.setCard_type_inf(card_type_inf08);
			if (party_class_cd != null && party_class_cd.equals("C")) {
				if(t47_client.getLegal_card_type()!=null){
				String card_type = t47_client.getLegal_card_type().substring(0, 2);
				String card_type_inf = t47_client.getLegal_card_type().substring(2);
				t47_client.setLegal_card_type(card_type);
				t47_client.setLegal_card_type_inf(card_type_inf);
				}
			}

			PropertyUtils.copyProperties(form, t47_client);
			this.setOptionsList(request, party_class_cd);

			t10_survey_cust.setParty_id(party_id);
			list_typeList = t10_survey_custdao.getT10_survey_cust_list_typeList(sqlMap, t10_survey_cust);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			request.setAttribute("error", error.toString());
		}
		request.setAttribute("list_typeList", list_typeList);
		return actionMapping.findForward(forward);
	}

	public void setOptionsList(HttpServletRequest request, String type) throws Exception {
		// 获取页面上需要的下拉菜单信息

		// 客户状态
		LinkedHashMap party_statusMap = cm.getMapFromCache("clientstatus");
		request.setAttribute("party_statusMap", this.getOptionsListByMap(party_statusMap, null, true));
		// 客户证件类型
		if (type.equalsIgnoreCase("I")) {
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type_i");

			request.setAttribute("card_typeMap", this.getOptionsListByMap(card_typeMap, null, true));
			LinkedHashMap zhiyeMap = cm.getMapFromCache("pbc_ctvc_i");
			request.setAttribute("zhiyeMap", this.getOptionsListByMap(zhiyeMap, null, true));
		} else if (type.equalsIgnoreCase("C")) {// 查询情况
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type_c");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(card_typeMap, null, true));
			LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c");
			LinkedHashMap company_typeMap = cm.getMapFromCache("company_type_cd");
			request.setAttribute("company_typeMap", this.getOptionsListByMap(company_typeMap, null, true));
			request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(pbc_ctvc_cMap, null, true));
			LinkedHashMap card_typeMap2 = cm.getMapFromCache("card_type_i");

			request.setAttribute("card_typeMap2", this.getOptionsListByMap(card_typeMap2, null, true));
			// 币种
			LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");
			request.setAttribute("pbc_currencyMap", this.getOptionsListByMap(pbc_currencyMap, null, true));
		} else {
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(card_typeMap, null, true));
		}
		// 归属机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		request.setAttribute("organMap", this.getOptionsListByMap(organMap, null, true));

		if (type == null)
			type = "";
		if (type.equalsIgnoreCase("search")) {// 查询情况
			// 客户类型
			LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
			request.setAttribute("party_classMap", this.getOptionsListByMap(party_classMap, null, true));
			// 客户排序
			LinkedHashMap customerorderMap = cm.getMapFromCache("customerorder");
			request.setAttribute("customerorderMap", this.getOptionsListByMap(customerorderMap, null, true));
		} else if (type.equalsIgnoreCase("I")) {// 添加对私客户
			// 性别
			LinkedHashMap sexMap = cm.getMapFromCache("sex");
			request.setAttribute("sexMap", this.getOptionsListByMap(sexMap, null, true));
			// 职业
			LinkedHashMap professionMap = cm.getMapFromCache("pbc_ctvc_i");
			request.setAttribute("professionMap", this.getOptionsListByMap(professionMap, null, true));
		}

		if (!type.equalsIgnoreCase("search")) {// 不是查询情况
			// 国籍
			LinkedHashMap nationalityMap = cm.getMapFromCache("country");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(nationalityMap, null, true));
			// 启用标志
			LinkedHashMap flagMap = cm.getMapFromCache("risk_flag");
			request.setAttribute("flagMap", this.getOptionsListByMap(flagMap, null, false));
			// 客户类别
			// LinkedHashMap temp1Map = cm.getMapFromCache("temp1", true);
			// request.setAttribute("temp1Map",
			// this.getOptionsListByMap(temp1Map,
			// null, true));
			// // 识别类别
			// LinkedHashMap temp2Map = cm.getMapFromCache("temp2", true);
			// request.setAttribute("temp2Map",
			// this.getOptionsListByMap(temp2Map,
			// null, true));
		}
	}

	public ActionForward performModifyT10_coluall(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_id = (String) request.getParameter("party_id");
		String party_class_cd = (String) request.getParameter("party_class_cd");
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype"); // 客户类型
		request.setAttribute("party_class_cdMap", this.getOptionsListByMap(party_class_cdMap, null, true));
		LinkedHashMap card_typeMap2 = cm.getMapFromCache("card_type");
		request.setAttribute("card_typeMap2", this.getOptionsListByMap(card_typeMap2, null, true));
		request.setAttribute("party_id", party_id);
		request.setAttribute("party_class_cd", party_class_cd);
		t47_client.setParty_id(party_id);
		t47_client.setParty_class_cd(party_class_cd);
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;

			ArrayList tList1 = t10_check_custdao.getT10_BUSINESSINFO(sqlMap, t47_client);
			ArrayList tList2 = t10_check_custdao.getT10_ECONOMYINFO(sqlMap, t47_client);
			ArrayList tList3 = t10_check_custdao.getT10_CONTROLLERINFO(sqlMap, t47_client);
			ArrayList tList4 = t10_check_custdao.getT10_DAIBANPERINFO(sqlMap, t47_client);
			ArrayList tList5 = t10_check_custdao.getT10_OPPCUSTINFO(sqlMap, t47_client);
			// 将页面拼成字符串
			request.setAttribute("tList1", tList1);
			request.setAttribute("tList2", tList2);
			request.setAttribute("tList3", tList3);
			request.setAttribute("tList4", tList4);
			request.setAttribute("tList5", tList5);
			form.reset(actionMapping, request);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	/**
	 * 删除客户调查项中的选中项
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performDelT10_coluall(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
		T10_check_cust_clue checkCustClue = new T10_check_cust_clue();
		org.springframework.beans.BeanUtils.copyProperties(form, checkCustClue);
		int index = Integer.valueOf(request.getParameter("index"));
		try {
			t10_check_custdao.delete(sqlMap, checkCustClue, index);
			String redirect = "modifyT10_colu.do?newsearchflag=1&party_id=%s+&party_class_cd=%s";
			response.sendRedirect(String.format(redirect, form.getParty_id(), form.getParty_class_cd()));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public ActionForward performModifyT47_risk_clientDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_class_cd = (String) request.getParameter("party_class_cd");
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			PropertyUtils.copyProperties(t47_client, form);
			AuthBean authBean = new AuthBean();
			authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			t47_client.setLast_upd_user(auth.getT00_user().getUsername());
			t47_client.setLast_upd_dt(DateUtils.getCurrDateTime());
			if (t47_client.getCountry_residence() != null && t47_client.getCountry_residence().length() > 3) {
				t47_client.setCountry_residence(t47_client.getCountry_residence().substring(3));
			}
			if (t47_client.getLicence_end_dt_disp() != null && !t47_client.getLicence_end_dt_disp().trim().equals("")) {// 营业执照到期日
				t47_client.setLicence_end_dt(DateUtils.stringToDateShort(t47_client.getLicence_end_dt_disp()));
			}
			if (t47_client.getLegal_card_no_end_dt_disp() != null && !t47_client.getLegal_card_no_end_dt_disp().trim().equals("")) {// 
				t47_client.setLegal_card_no_end_dt(DateUtils.stringToDateShort(t47_client.getLegal_card_no_end_dt_disp()));
			}
			if (t47_client.getLocal_affair_end_dt_disp() != null && !t47_client.getLocal_affair_end_dt_disp().trim().equals("")) {// 
				t47_client.setLocal_affair_end_dt(DateUtils.stringToDateShort(t47_client.getLocal_affair_end_dt_disp()));
			}
			if (t47_client.getNation_affair_end_dt_disp() != null && !t47_client.getNation_affair_end_dt_disp().trim().equals("")) {// 
				t47_client.setNation_affair_end_dt(DateUtils.stringToDateShort(t47_client.getNation_affair_end_dt_disp()));
			}
			if (t47_client.getCard_end_dt_disp() != null && !t47_client.getCard_end_dt_disp().trim().equals("")) {// 
				t47_client.setCard_end_dt(DateUtils.stringToDateShort(t47_client.getCard_end_dt_disp()));
			}

			if (t47_client.getOrgan_code_end_dt_disp() != null && !t47_client.getOrgan_code_end_dt_disp().trim().equals("")) {// 
				t47_client.setOrgan_code_end_dt(DateUtils.stringToDateShort(t47_client.getOrgan_code_end_dt_disp()));
			}
			if (t47_client.getCountry_residence() != null && !"".equals(t47_client.getCountry_residence())
					&& t47_client.getCountry_residence().trim().length() == 9) {// 行政区划代码
				t47_client.setCountry_cd(t47_client.getCountry_residence().substring(0, 3));
				t47_client.setCountry_cd(t47_client.getCountry_residence().substring(3, 9));
			}
			if (t47_client.getOrg_credit_vt_disp() != null && !t47_client.getOrg_credit_vt_disp().trim().equals("")) {// 
				t47_client.setOrg_credit_vt(DateUtils.stringToDateShort(t47_client.getOrg_credit_vt_disp()));
			}
			
			if(t47_client.getCard_type()!=null&&(t47_client.getCard_type().equals("19")||t47_client.getCard_type().equals("29"))){
				t47_client.setCard_type(t47_client.getCard_type()+t47_client.getCard_type_inf());
			}
			if(t47_client.getLegal_card_type()!=null&&(t47_client.getLegal_card_type().equals("19")||t47_client.getLegal_card_type().equals("29"))){
				t47_client.setLegal_card_type(t47_client.getLegal_card_type()+t47_client.getLegal_card_type_inf());
			}
			
			// sqlMap.startTransaction();
			t47_client.setParty_class_cd(party_class_cd);
			int i = t10_check_custdao.modifyT47_client(sqlMap, t47_client);
			int j = t10_check_custdao.modifyT47_client2(sqlMap, t47_client);
			if (i > 0 && j > 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.common", "客户信息修改成功！"));
				saveErrors(request, errors);
			}
			// sqlMap.commitTransaction();
			// sqlMap.endTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

	public ActionForward performT10_add_cust_do(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();

		String party_id = (String) request.getParameter("party_id");
		String party_class_cd = (String) request.getParameter("party_class_cd");
		String tablename = request.getParameter("tablename");

		t47_client.setParty_class_cd(party_class_cd);
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_client, form);
			if (form.getIncome_dt_disp() != null && !"".equals(form.getIncome_dt_disp())) {
				t47_client.setCard_due_dt(DateUtils.stringToDateShort(form.getIncome_dt_disp()));
			}
			if (form.getParty_name_agent() != null && !"".equals(form.getParty_name_agent())) {
				t47_client.setParty_name(form.getParty_name_agent());
			}
			if (form.getParty_name_opp() != null && !"".equals(form.getParty_name_opp())) {
				t47_client.setParty_name(form.getParty_name_opp());
			}
			if (form.getCard_no_agent() != null && !"".equals(form.getCard_no_agent())) {
				t47_client.setCard_no(form.getCard_no_agent());
			}
			if (form.getCard_no_opp() != null && !"".equals(form.getCard_no_opp())) {
				t47_client.setCard_no(form.getCard_no_opp());
			}
			if (form.getCard_type_agent() != null && !"".equals(form.getCard_type_agent())) {
				t47_client.setCard_type(form.getCard_type_agent());
			}
			if (form.getCard_type_opp() != null && !"".equals(form.getCard_type_opp())) {
				t47_client.setCard_type(form.getCard_type_opp());
			}
			if (form.getLinkmode_agent() != null && !"".equals(form.getLinkmode_agent())) {
				t47_client.setLinkmode(form.getLinkmode_agent());
			}
			// if(form.getAmt()!=null&&!"".equals(form.getAmt())){
			// t47_client.setAmt(form.getAmt());
			// }

			if (!"".equals(form.getAmt())) {
				double amt = Double.parseDouble(form.getAmt());
				Double temp_amt = new Double(amt);
				t47_client.setAmt_m(temp_amt);

			}
			t47_client.setParty_id(party_id);
			if (form.getCard_due_dt_disp() != null && !"".equals(form.getCard_due_dt_disp())) {
				t47_client.setCard_due_dt(DateUtils.stringToDateShort(form.getCard_due_dt_disp()));
			}
			t10_check_custdao.insert_cust_table(sqlMap, t47_client, tablename);
			form.reset(actionMapping, request);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	public ActionForward modifyT10_check_info_result(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_id = (String) request.getParameter("party_id");
		String flag = (String) request.getParameter("flag");
		if (flag == null) {
			flag = "1";
		}
		request.setAttribute("flag", flag);
		LinkedHashMap check_resultMap = cm.getMapFromCache("check_result");
		request.setAttribute("check_resultMap", this.getOptionsListByMap(check_resultMap, null, true));
		String backflag = StringUtils.null2String((String) request.getAttribute("backflag"));
		if (backflag.equals(""))
			backflag = "0";
		request.setAttribute("backflag", backflag);
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			t47_client.setParty_id(party_id);

			if (backflag.equals("0")) {
				t47_client = t10_check_custdao.getT10_CHECK_CUST_RESULT(sqlMap, t47_client);

				if (t47_client == null) {
					t47_client = new T10_check_cust_clue();
				}
			}

			MyBeanUtils.copyBean2Bean(form, t47_client);
			form.setParty_id(party_id);
			form.setFlag(flag);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	public ActionForward modifyT10_colu_result(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_id = (String) request.getParameter("party_id");

		String isback = request.getParameter("isback");
		String result = "";

		String tablename = request.getParameter("tablename");

		LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
		request.setAttribute("party_classMap", this.getOptionsListByMap(party_classMap, null, true));
		// 黑名单类型
		LinkedHashMap m_list_type_bMap = cm.getMapFromCache("m_list_type_b");
		request.setAttribute("m_list_type_bMap", this.getOptionsListByMap(m_list_type_bMap, null, true));
		// 是否启用
		LinkedHashMap isuse_typeMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuse_typeMap", this.getOptionsListByMap(isuse_typeMap, null, true));
		LinkedHashMap check_resultMap = cm.getMapFromCache("check_result");

		// 免检测类型
		LinkedHashMap rule_typeMap = cm.getMapFromCache("rule_type");
		request.setAttribute("rule_typeMap", this.getOptionsListByMap(rule_typeMap, null, true));

		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();
		authBean = (AuthBean) session.getAttribute("authBean");
		auth = authBean.getAuthToken();
		String usename = auth.getT00_user().getUsername();
		String organkey = auth.getT00_user().getOrgankey();

		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_client, form);
			if ("1".equals(isback)) {
				return actionMapping.findForward("success");
			}
			T47_party t47_party = t10_check_custdao.getT47_partyDisp(sqlMap, party_id);
			t47_client.setParty_class_cd(t47_party.getParty_class_cd());
			t47_client.setParty_id(party_id);
			t47_client.setParty_name(t47_party.getParty_chn_name());
			t47_client.setOrgankey(t47_party.getOrgankey());
			t47_client.setChecker_org(organkey);
			t47_client.setCheck_type(form.getFlag());

			t47_client.setCheck_dt(DateUtils.getCurrDateTime());
			t47_client.setChecker(usename);
			if (form.getValid_dt_disp() != null && !"".equals(form.getValid_dt_disp())) {
				t47_client.setValid_dt(DateUtils.stringToDateShort(form.getValid_dt_disp()));
			}
			t10_check_custdao.dmlT10_CHECK_CUST_RESULT(sqlMap, t47_client);

			T10_check_cust_clue resultcust = null;
			if (tablename != null && !"".equals(tablename)) {
				resultcust = t10_check_custdao.getnametablebyPartyid(sqlMap, t47_client, tablename);

			}

			if (resultcust != null) {
				MyBeanUtils.copyBean2Bean(form, resultcust);

			}
			form.setParty_id(party_id);
			form.setParty_class_cd(t47_party.getParty_class_cd());
			form.setObj_name(t47_party.getParty_chn_name());

			if ("T07_WHITELIST_INFO".equals(tablename)) {
				result = "white";
			} else if ("T07_BLACKLIST".equals(tablename)) {
				result = "black";
			} else {
				result = "success";
			}
			request.setAttribute("backflag", "1");
			sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward(result);
	}

	public ActionForward t47_client_blackorwhite_do(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_id = (String) request.getParameter("party_id");
		String party_class_cd = (String) request.getParameter("party_class_cd");

		String tablename = request.getParameter("tablename");
		t47_client.setParty_class_cd(party_class_cd);
		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();
		authBean = (AuthBean) session.getAttribute("authBean");
		auth = authBean.getAuthToken();
		String usename = auth.getT00_user().getUsername();
		String organkey = auth.getT00_user().getOrgankey();

		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_client, form);
			if (t47_client.getValidate_dt_new_disp() != null) {
				t47_client.setValidate_dt_new(DateUtils.stringToDateShort(t47_client.getValidate_dt_new_disp()));
			}
			if (t47_client.getInvalidate_dt_new_disp() != null) {
				t47_client.setInvalidate_dt_new(DateUtils.stringToDateShort(t47_client.getInvalidate_dt_new_disp()));
			}
			t47_client.setParty_class_cd(party_class_cd);
			t47_client.setParty_id(party_id);
			t47_client.setCheck_dt(DateUtils.getCurrDateTime());
			t47_client.setChecker(usename);
			t47_client.setOrgankey(organkey);
			T10_check_cust_clue resultcust = null;
			if ("T07_WHITELIST_INFO".equals(tablename)) {
				resultcust = t10_check_custdao.getnametablebyPartyid(sqlMap, t47_client, "T07_WHITELIST_INFO");
				if (resultcust != null) {
					// t10_check_custdao.updateT07_WHITELIST_INFO(sqlMap,t47_client);
				} else {
					t10_check_custdao.insertT07_WHITELIST_INFO(sqlMap, t47_client);
				}

			} else if ("T07_BLACKLIST".equals(tablename)) {

				resultcust = t10_check_custdao.getnametablebyPartyid(sqlMap, t47_client, "T07_BLACKLIST");
				if (resultcust != null) {
					// t10_check_custdao.updateT07_BLACKLIST(sqlMap,t47_client);
				} else {
					String id = this.getSequenceNextVal("T87_BLSKLIST");
					t47_client.setOther_info("'" + id + "'");
					t10_check_custdao.insertT07_BLACKLIST(sqlMap, t47_client);

				}
			}
			request.setAttribute("backflag", "1");
		}

		catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	private ActionForward performSearchtT10_check_cust_cardlist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t10_check_partylist = new ArrayList();
		String pageInfo = "";
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_card t10_check_cust_card = new T10_check_cust_card();
		// 取得查询下拉列表信息
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		LinkedHashMap order_check_map = cm.getMapFromCache("order_check_card");
		LinkedHashMap check_status_map = cm.getMapFromCache("check_status");
		request.setAttribute("party_class_cdMap", this.getOptionsListByMap(party_class_cdMap, null, true));
		request.setAttribute("check_status_map", this.getOptionsListByMap(check_status_map, null, true));
		request.setAttribute("order_check_map", this.getOptionsListByMap(order_check_map, null, true));
		// 取得当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organStr = auth.getOrganstr();
		t10_check_cust_card.setOrganStr(organStr);
		session.setAttribute("custtype", "2");
		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t10_check_cust_card, form);
				if (form.getCard_due_start() != null && !"".equals(form.getCard_due_start())) {
					t10_check_cust_card.setCard_due_start_dt(DateUtils.stringToDateShort(form.getCard_due_start()));
				}
				if (form.getCard_due_end() != null && !"".equals(form.getCard_due_end())) {
					t10_check_cust_card.setCard_due_end_dt(DateUtils.stringToDateShort(form.getCard_due_end()));
				}
				session.setAttribute("t10_check_cust_cardSearchObj", t10_check_cust_card);
			} else {
				t10_check_cust_card = (T10_check_cust_card) session.getAttribute("t10_check_cust_cardSearchObj");
			}
			t10_check_partylist = t10_check_custdao.getT10_check_custcardList(sqlMap, t10_check_cust_card, this
					.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t10_check_custdao.getT10_check_custcardListCount(sqlMap, t10_check_cust_card);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t10_check_partylist", t10_check_partylist);
		return actionMapping.findForward("success");
	}

	/**
	 * 查询已识别客户列表
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward perform_get_check_cust_resultlist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList result_list = new ArrayList();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_result t10_check_cust_result = new T10_check_cust_result();
		// 下拉列表信息
		LinkedHashMap party_class_cd_map = cm.getMapFromCache("clienttype"); // 客户类型
		LinkedHashMap check_type_map = cm.getMapFromCache("check_type");// 案例种类
		LinkedHashMap check_result_map = cm.getMapFromCache("check_result");
		LinkedHashMap check_result_order = cm.getMapFromCache("check_result_order");
		request.setAttribute("party_class_cd_map", this.getOptionsListByMap(party_class_cd_map, null, true));
		request.setAttribute("check_type_map", this.getOptionsListByMap(check_type_map, null, true));
		request.setAttribute("check_result_map", this.getOptionsListByMap(check_result_map, null, true));
		request.setAttribute("order_check_map", this.getOptionsListByMap(check_result_order, null, true));
		String pageInfo = "";
		T10_check_cust_resultActionForm form = (T10_check_cust_resultActionForm) actionForm;
		String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
		// 取的当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organStr = auth.getOrganstr();
		t10_check_cust_result.setOrganStr(organStr);
		try {
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t10_check_cust_result, form);
				if (form.getCheck_start_dt() != null && !"".equals(form.getCheck_start_dt())) {
					t10_check_cust_result.setCheck_start_dt_disp(DateUtils.stringToDateShort(form.getCheck_start_dt()));
				}
				if (form.getCheck_end_dt() != null && !"".equals(form.getCheck_end_dt())) {
					t10_check_cust_result.setCheck_end_dt_disp(DateUtils.stringToDateShort(form.getCheck_end_dt()));
				}
				session.setAttribute("t10_check_cust_resultSearchObj", t10_check_cust_result);
			} else {// 翻页
				t10_check_cust_result = (T10_check_cust_result) session.getAttribute("t10_check_cust_resultSearchObj");
			}
			result_list = t10_check_custdao.getT10_check_resultList(sqlMap, t10_check_cust_result, this.getStartRec(intPage),
					this.getIntPageSize());
			int totalRow = t10_check_custdao.getT10_check_resultListCount(sqlMap, t10_check_cust_result);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t10_check_cust_resultlist", result_list);
		return actionMapping.findForward("success");
	}

	private ActionForward show_t10_check_cust_detail(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T10_check_custDAO t10_check_custdao = new T10_check_custDAO();
		String id_flag = request.getParameter("id_flag");// 判断调用 1 已识别客户调用 2
		// 案例处理-->客户识别调用
		String party_id = "";
		String party_class_cd = "";
		try {
			if ("1".equals(id_flag)) {
				party_id = request.getParameter("party_id");
				party_class_cd = request.getParameter("party_class_cd");
			} else if ("2".equals(id_flag)) {
				CreditTask credittask = (CreditTask) session.getAttribute("credittask");
				party_id = credittask.getParty_id();
				party_class_cd = credittask.getParty_class_cd();
			}
			request.setAttribute("id_flag", id_flag);
			if (party_id == null) {
				throw new Exception("发现客户号为空");
			}
			request.setAttribute("party_id", party_id);
			request.setAttribute("party_class_cd", party_class_cd);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	private ActionForward perform_get_check_cust_translist(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";
		try {

			// 机构信息
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			T47_transactionDAO t47_transactionDAO = (T47_transactionDAO) context.getBean("t47_transactionDAO");
			T47_transaction t47_transaction = new T47_transaction();

			// 借贷标志
			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
			LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
			// 交易渠道
			LinkedHashMap channelMap = cm.getMapFromCache("channel");
			// 结算方式
			LinkedHashMap jsMap = cm.getMapFromCache("tstp_hash");

			LinkedHashMap ordernameMap = cm.getMapFromCache("tradesort");
			request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap, null, true));
			request.setAttribute("trackflagMap", this.getOptionsListByMap(trackflagMap, null, true));

			request.setAttribute("ordernameMap", this.getOptionsListByMap(ordernameMap, null, true));
			request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));
			request.setAttribute("jsMap", this.getOptionsListByMap(jsMap, null, true));

			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			String party_id = StringUtils.nullObject2String(request.getParameter("party_id"));
			String id_flag = StringUtils.null2String(request.getParameter("id_flag"));
			// if("2".equals(id_flag)){ //modify 20130712
			// CreditTask credittask =
			// (CreditTask)session.getAttribute("credittask");
			// party_id = credittask.getParty_id();
			// }
			if ("0".equals(newsearchflag)) {
				session.removeAttribute("t47_transactionSearch");
			} else if (newsearchflag.equals("1")) {// 新的查询
				if (form.getAmt_start_search() != null && !"".equals(form.getAmt_start_search())) {
					form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
				} else {
					form.setAmt_start(null);
				}
				if (form.getAmt_end_search() != null && !"".equals(form.getAmt_end_search())) {
					form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
				} else {
					form.setAmt_end(null);
				}
				form.setParty_id(party_id);
				form.setCal_ind("1");
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setTx_dt_start(DateUtils.stringToDateShort(form.getTx_dt_start_disp()));
				t47_transaction.setTx_dt_end(DateUtils.stringToDateShort(form.getTx_dt_end_disp()));
				t47_transaction.setOrgankeystr(org_id);

				session.setAttribute("t47_transactionSearch", t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session.getAttribute("t47_transactionSearch");
			}
			if (t47_transaction != null && !"0".equals(newsearchflag)) {
				party_id = t47_transaction.getParty_id();
			}
			request.setAttribute("party_id", party_id);
			if (!"0".equals(newsearchflag)) {
				t47_transactionList = t47_transactionDAO.getT47M_transactionList(sqlMap, t47_transaction, this
						.getStartRec(intPage), this.getIntPageSize());
				if (t47_transactionList == null)
					t47_transactionList = new ArrayList();
				int totalRow = t47_transactionDAO.getT47M_transactionListCount(sqlMap, t47_transaction);
				String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);
		return actionMapping.findForward("success");
	}

	private ActionForward performGet_cust_survey_result(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_result t10_check_cust_result = new T10_check_cust_result();
		try {
			String party_id = (String) request.getParameter("party_id");
			String id_flag = StringUtils.null2String(request.getParameter("id_flag"));
			// if("2".equals(id_flag)){modify 20130712
			// CreditTask credittask =
			// (CreditTask)session.getAttribute("credittask");
			// party_id = credittask.getParty_id();
			// }
			if (party_id == null && "".equals(party_id)) {
				throw new Exception("客户号位空");
			}
			t10_check_cust_result = t10_check_custdao.getCheckCustResult(sqlMap, party_id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t10_check_cust_result", t10_check_cust_result);
		return actionMapping.findForward("success");
	}

	public ActionForward show_t10_check_cust_resulinfo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_clue t47_client = new T10_check_cust_clue();
		HttpSession session = request.getSession();
		String party_id = request.getParameter("party_id");

		try {
			T10_check_cust_cardActionForm form = (T10_check_cust_cardActionForm) actionForm;

			t47_client.setParty_id(party_id);
			ArrayList list = t10_check_custdao.getT10_CHECK_CUST_RESULT_his(sqlMap, t47_client);
			request.setAttribute("t47_clientList", list);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		// request.setAttribute("t10_checkfield_infoname",t10_checkfield_info.getFieldno());
		return actionMapping.findForward("success");
	}

	public ActionForward t10_check_cust_report(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t10_check_partylist = new ArrayList();

		T10_check_custDAO t10_check_custDAO = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T10_check_cust_ke t10_check_cust_ke = new T10_check_cust_ke();
		T10_check_cust_card cust_card = new T10_check_cust_card();
		T10_check_cust_result cust_result = new T10_check_cust_result();
		// 识别统计类型
		String custtype = request.getParameter("custType");
		try {
			Report_SearchObj export_SearchObj = new Report_SearchObj();
			HashMap taglist1Hash = new HashMap();
			ArrayList list = new ArrayList();
			// 导可疑客户
			if ("keyi".equals(custtype)) {
				t10_check_cust_ke = (T10_check_cust_ke) session.getAttribute("t10_check_cust_keSearchObj");
				t10_check_partylist = t10_check_custDAO.getT10_check_custkeList(sqlMap, t10_check_cust_ke);
				taglist1Hash.put("<#title#>", "可疑识别客户");
				taglist1Hash.put("<#title1#>", "交易总数");
				taglist1Hash.put("<#title2#>", "上报交易");
				taglist1Hash.put("<#title3#>", "排除交易");
				// taglist1Hash.put("<#title4#>", "识别状态");
				// taglist1Hash.put("<#title5#>", "调差结论");
				taglist1Hash.put("<#title4#>", "");
				taglist1Hash.put("<#title5#>", "");
				for (int i = 0; i < t10_check_partylist.size(); i++) {
					T10_check_cust_ke t10_cust = (T10_check_cust_ke) t10_check_partylist.get(i);
					HashMap rpdihash = new HashMap();
					rpdihash.put("<#A#>", t10_cust.getParty_id());
					rpdihash.put("<#B#>", t10_cust.getParty_name());
					rpdihash.put("<#C#>", t10_cust.getParty_class_cd_display());
					rpdihash.put("<#D#>", t10_cust.getOrganName());
					rpdihash.put("<#E#>", t10_cust.getTrans_all());
					rpdihash.put("<#F#>", t10_cust.getTrans_rep());
					rpdihash.put("<#G#>", t10_cust.getTrans_del());
					// if("0".equals(t10_cust.getCheck_status())){
					// rpdihash.put("<#H#>","未识别");
					// }else if("1".equals(t10_cust.getCheck_status())){
					// rpdihash.put("<#H#>","已识别");
					// }else if("2".equals(t10_cust.getCheck_status())){
					// rpdihash.put("<#H#>","已失效");
					// }
					// rpdihash.put("<#I#>",t10_cust.getCheck_result());
					rpdihash.put("<#H#>", "");
					rpdihash.put("<#I#>", "");
					list.add(rpdihash);
				}
			} else if ("card".equals(custtype)) {
				cust_card = (T10_check_cust_card) session.getAttribute("t10_check_cust_cardSearchObj");
				t10_check_partylist = t10_check_custDAO.getT10_check_custcardList(sqlMap, cust_card);
				taglist1Hash.put("<#title#>", "证件到期客户");
				taglist1Hash.put("<#title1#>", "证件号码");
				taglist1Hash.put("<#title2#>", "证件类型");
				taglist1Hash.put("<#title3#>", "证件到期日");
				taglist1Hash.put("<#title4#>", "识别状态");
				taglist1Hash.put("<#title5#>", "调差结论");
				for (int i = 0; i < t10_check_partylist.size(); i++) {
					T10_check_cust_card t10_cust = (T10_check_cust_card) t10_check_partylist.get(i);
					HashMap rpdihash = new HashMap();
					rpdihash.put("<#A#>", t10_cust.getParty_id());
					rpdihash.put("<#B#>", t10_cust.getParty_name());
					rpdihash.put("<#C#>", t10_cust.getParty_class_cd_display());
					rpdihash.put("<#D#>", t10_cust.getOrgan_display());
					rpdihash.put("<#E#>", t10_cust.getCard_no());
					rpdihash.put("<#F#>", t10_cust.getCard_type_display());
					rpdihash.put("<#G#>", t10_cust.getCard_due_dt_display());
					if ("0".equals(t10_cust.getCheck_status())) {
						rpdihash.put("<#H#>", "未识别");
					} else if ("1".equals(t10_cust.getCheck_status())) {
						rpdihash.put("<#H#>", "已识别");
					} else if ("2".equals(t10_cust.getCheck_status())) {
						rpdihash.put("<#H#>", "已失效");
					}
					rpdihash.put("<#I#>", t10_cust.getCheck_result());
					list.add(rpdihash);
				}
			} else if ("resultparty".equals(custtype)) {
				cust_result = (T10_check_cust_result) session.getAttribute("t10_check_cust_resultSearchObj");
				t10_check_partylist = t10_check_custDAO.getT10_check_resultList(sqlMap, cust_result);
				taglist1Hash.put("<#title#>", "已识别客户");
				taglist1Hash.put("<#title1#>", "调查日期");
				taglist1Hash.put("<#title2#>", "调查结论");
				taglist1Hash.put("<#title3#>", "结论有效期");
				taglist1Hash.put("<#title4#>", "调查人");
				taglist1Hash.put("<#title5#>", "调查人机构");
				for (int i = 0; i < t10_check_partylist.size(); i++) {
					T10_check_cust_result t10_cust = (T10_check_cust_result) t10_check_partylist.get(i);
					HashMap rpdihash = new HashMap();
					rpdihash.put("<#A#>", t10_cust.getParty_id());
					rpdihash.put("<#B#>", t10_cust.getParty_name());
					rpdihash.put("<#C#>", t10_cust.getParty_class_cd_display());
					rpdihash.put("<#D#>", t10_cust.getOrganName());
					rpdihash.put("<#E#>", t10_cust.getCheck_dt_display());
					rpdihash.put("<#F#>", t10_cust.getCheck_result());
					rpdihash.put("<#G#>", t10_cust.getValid_dt_display());
					rpdihash.put("<#H#>", t10_cust.getChecker());
					rpdihash.put("<#I#>", t10_cust.getChecker_org());
					list.add(rpdihash);
				}
			}
			export_SearchObj.setHash(taglist1Hash);
			export_SearchObj.setList(list);

			// 设置模板名称
			export_SearchObj.setTemplatechileFileName("t10_cust_reportlist.htm");
			export_SearchObj.setTemplatebaseFileName("t10_cust_report.htm");
			// export_SearchObj.setTempPath(auth.getT00_user().getUsername());
			export_SearchObj.setTargetFileName(DateUtils.getDate10to8(DateUtils.getCurrTime()) + "t10_cust_export.xls");
			// 导出文件
			Template template = (Template) context.getBean("template");
			String[] tempPath = template.exportReport(export_SearchObj);
			String url = tempPath[0];
			// 跳转到下载页面
			String backurl = "/common/download_attach.jsp?downloadtype=attach&url=" + url + "";
			response.sendRedirect(request.getContextPath() + backurl);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
	}

	public ActionForward show_t10_check_cust_acct(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_check_custDAO t10_check_custdao = (T10_check_custDAO) context.getBean("t10_check_custDAO");
		T47_cp_deposit t47_client = new T47_cp_deposit();
		HttpSession session = request.getSession();
		String acct_num = request.getParameter("acct_num");

		try {
			t47_client.setAcct_num(acct_num);
			T47_cp_deposit result = t10_check_custdao.getacctinfobyaccnum(sqlMap, t47_client);
			request.setAttribute("t47_client", result);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

}
