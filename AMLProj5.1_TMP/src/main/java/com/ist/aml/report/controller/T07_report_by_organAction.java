package com.ist.aml.report.controller;

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
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
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
import com.ist.aml.pbcreport.dto.T07_nbh_tsdt;
import com.ist.aml.report.dao.T07_report_by_organDAO;

import com.ist.aml.report.dto.T07_report_by_organ;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.StaticMethod;
import com.ist.common.StaticVariable;
import com.ist.common.Template;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.impfile.aml.report.dto.Report_SearchObj;
import com.ist.platform.dto.T00_organ;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_report_by_organAction extends BaseAction {

	private static Logger logger = LogUtils.getLogger(
			T07_report_by_organAction.class.getName()).getLogger(
			Constans.LOGGERNAMEA);

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
		myforward = this.preExecute(mapping, form, request, response);// 如预处理中强行跳出if("false".equals(request.getAttribute("goWayFlag")))
		// 统计交易报告
		if ("getT07_sz_trans_report".equalsIgnoreCase(myaction)) {
			myforward = getT07_sz_trans_report(mapping, form, request, response);
		}
		// 导出交易报告
		else if ("export_sz_trans_report".equalsIgnoreCase(myaction)) {
			myforward = export_sz_trans_report(mapping, form, request, response);
		}
		// 上报交易查询
		else if ("getT07_detrans_report".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_detrans_report_List(mapping, form,
					request, response);
		}
		// 导出上报交易
		else if ("export_detrans_report".equalsIgnoreCase(myaction)) {
			myforward = export_t07_detrans_report(mapping, form, request,
					response);
		}
		return myforward;

	}

	public ActionForward getT07_sz_trans_report(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_report_by_organList = new ArrayList();
		ArrayList org_list;
		T07_report_by_organDAO t07_report_by_organDAO = (T07_report_by_organDAO) context
				.getBean("t07_report_by_organDAO");
		T07_report_by_organ t07_report_by_organ = new T07_report_by_organ();
		TreeMap map = new TreeMap();
		try {
			// 获取页面上需要的下拉菜单信息

			// 机构
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			LinkedHashMap typeMap = cm.getMapFromCache("alertkind");
			request.setAttribute("typeMap", this.getOptionsListByMap(typeMap,
					null, false));
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");

			t07_report_by_organ.setOrganstrs(authBean.getAuthToken()
					.getOrganstr());

			org_list = authBean.getAuthToken().getOrganList();
			for (int i = 0; i < org_list.size(); i++) {
				T00_organ t00_organ = (T00_organ) org_list.get(i);
				t00_organ.setOrganname((String) organMap.get(t00_organ
						.getOrgankey()));
				// org_list.add(t00_organ);
			}

			T07_report_by_organActionForm form = (T07_report_by_organActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String newenterflag = StringUtils.nullObject2String(request
					.getParameter("newenterflag"));
			/*
			 * int intPage = StringUtils.nullObject2int(request
			 * .getParameter("intPage"), 0);
			 */
			String type = request.getParameter("type");
			if (type == null || "".equals(type)) {
				type = "1";
				form.setType(type);
			}

			String dt_start = request.getParameter("dt_start_disp");
			String dt_end = request.getParameter("dt_end_disp");
			String[] strs = request.getParameterValues("list2");
			String value = "";
			HashMap hash = new HashMap();
			if (strs != null) {
				for (int i = 0; i < strs.length; i++) {
					hash.put(strs[i], organMap.get(strs[i]));
				}
				ArrayList selectList = new ArrayList();

				for (int i = 0; i < strs.length; i++) {
					String str = strs[i];
					selectList.add(str);
					value = (String) organMap.get(str);
					map.put(str, value);
				}

				t07_report_by_organ.setSelectList(selectList);
			}
			// 机构封装页面显示信息
			String uporgankey = StringUtils.null2String(
					(String) request.getParameter("uporgankey")).trim();
			// String organMultiSelHTMLStr =
			// StaticMethod.getOrganMultiSelHTMLByRight(
			// request, uporgankey, hash, 10);
			String organMultiSelHTMLStr = StaticMethod.getOrganMultiSelHTML(
					request, uporgankey, hash, 10, cm);
			request.setAttribute("organMultiSelHTMLStr", organMultiSelHTMLStr);
			if (newsearchflag.equals("1")) {// 新的查询
				// MyBeanUtils.copyBean2Bean(t07_report_by_organ, form);
				if (dt_start != null && !dt_start.trim().equals("")) {
					t07_report_by_organ.setDt_start(DateUtils
							.stringToDateShort(dt_start));
				}
				if (dt_end != null && !dt_end.trim().equals("")) {
					t07_report_by_organ.setDt_end(DateUtils
							.stringToDateShort(dt_end));
				}
				session.removeAttribute("t07_report_by_organsearch");
				session.setAttribute("t07_report_by_organsearch",
						t07_report_by_organ);
				if ("1".equals((String) t87_sysparaMap.get("05")))
					t07_report_by_organList = t07_report_by_organDAO
							.getT07_sz_trans_report_List2(sqlMap,
									t07_report_by_organ);
				else
					t07_report_by_organList = t07_report_by_organDAO
							.getT07_sz_trans_report_List(sqlMap,
									t07_report_by_organ);
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request
				.setAttribute("t07_report_by_organList",
						t07_report_by_organList);

		//
		return actionMapping.findForward("success");
	}

	/**
	 * 导出交易报告信息
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward export_sz_trans_report(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_report_by_organList;
		T07_report_by_organDAO t07_report_by_organDAO = (T07_report_by_organDAO) context
				.getBean("t07_report_by_organDAO");
		T07_report_by_organ t07_report_by_organ;
		try {
			// 组织用户所属的机构ID
			// String dt_start = "", dt_end = "";
			String type = "";
			t07_report_by_organ = (T07_report_by_organ) session
					.getAttribute("t07_report_by_organsearch");
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			if (t07_report_by_organ != null) {
				/*
				 * dt_start = DateUtils.dateToStringShort(t07_report_by_organ
				 * .getDt_start()); dt_end =
				 * DateUtils.dateToStringShort(t07_report_by_organ
				 * .getDt_end());
				 */
				type = t07_report_by_organ.getType();
			} else
				t07_report_by_organ = new T07_report_by_organ();

			if ("1".equals((String) t87_sysparaMap.get("05")))
				t07_report_by_organList = t07_report_by_organDAO
						.getT07_sz_trans_report_List2(sqlMap,
								t07_report_by_organ);
			else
				t07_report_by_organList = t07_report_by_organDAO
						.getT07_sz_trans_report_List(sqlMap,
								t07_report_by_organ);
			Report_SearchObj export_SearchObj = new Report_SearchObj();
			// 设置报表基本信息
			// 设置报表统计结果
			ArrayList list = new ArrayList();
			for (int i = 0; i < t07_report_by_organList.size(); i++) {
				T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) t07_report_by_organList
						.get(i);
				HashMap rpdihash = new HashMap<String, String>();
				rpdihash.put("<#A#>", t07_report_by_organ1.getOrganname());
				rpdihash.put("<#B#>", String.valueOf(StringUtils
						.nullObject2int(t07_report_by_organ1.getTotal_num())));
				String c = t07_report_by_organ1.getTotal_val_string();
				if (!StringUtils.isNullOrEmpt(c)) {
					c = "0";
				}
				rpdihash.put("<#C#>", c);
				rpdihash.put("<#D#>", String.valueOf(StringUtils
						.nullObject2int(t07_report_by_organ1.getAlert_num())));
				rpdihash
						.put("<#E#>", String.valueOf(StringUtils
								.nullObject2int(t07_report_by_organ1
										.getSuccess_num())));
				String f = t07_report_by_organ1.getAlert_val_string();
				if (!StringUtils.isNullOrEmpt(f)) {
					f = "0";
				}
				rpdihash.put("<#F#>", f);
				rpdihash
						.put("<#G#>", String.valueOf(StringUtils
								.nullObject2int(t07_report_by_organ1
										.getHandout_num())));
				list.add(rpdihash);
			}
			export_SearchObj.setList(list);

			// 设置模板名称
			export_SearchObj.setTemplatechileFileName("sz_trans_List.htm");
			export_SearchObj.setTemplatebaseFileName("sz_trans_base.htm");
			export_SearchObj.setTargetFileName(DateUtils.getDate10to8(DateUtils
					.getCurrTime())
					+ "report_trans.xls");
			// 导出文件
			Template template = (Template) context.getBean("template");
			String[] tempPath = template.exportReport(export_SearchObj);
			String url = tempPath[0];
			// 跳转到下载页面
			String backurl = "/common/download_attach.jsp?downloadtype=attach&url="
					+ url + "";
			response.sendRedirect(request.getContextPath() + backurl);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
	}

	public ActionForward performGetT07_detrans_report_List(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		List t07_report_by_organList = new ArrayList();
		ArrayList org_list;
		String pageInfo = "";
		T07_report_by_organDAO t07_report_by_organDAO = (T07_report_by_organDAO) context
				.getBean("t07_report_by_organDAO");
		T07_report_by_organ t07_report_by_organ = new T07_report_by_organ();

		// 报送状态
		LinkedHashMap casesearchtimeMap = cm
				.getMapFromCache("repoetsearch_state");
		request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
				casesearchtimeMap, null, false));
		// 报文类型
		LinkedHashMap msg_type_cdMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("msg_type_cdMap", this.getOptionsListByMap(
				msg_type_cdMap, null, false));
		// 预警类型
		LinkedHashMap alert_typeMap = cm.getMapFromCache("deky");
		request.setAttribute("alert_typeMap", this.getOptionsListByMap(
				alert_typeMap, null, false));
		// 币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
				null, true));
		// 客户类型
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
				party_class_cdMap, null, true));

		try {
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			String organstrs = authBean.getAuthToken().getOrganstr();

			T07_report_by_organActionForm form = (T07_report_by_organActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			String type = request.getParameter("type");
			/*if (type == null || "".equals(type)) {
				type = "DE";
				form.setType(type);
			}*/
			/*
			 * if(form.getMsg_type_cd().equals("")){ form.setMsg_type_cd("N"); }
			 */
			String today = DateUtils.getCurrTime();
			DateUtils dateUtils = new DateUtils();
			String tendaybefor = dateUtils.getDateChangeTime(today, "d", -5);
			tendaybefor = tendaybefor.substring(0, 10);
			today = today.substring(0, 10);
			if (form.getSenddate_ch() == null
					|| "".equals(form.getSenddate_ch())) {
				form.setSenddate_ch(tendaybefor);
			}

			if (form.getSenddate_ch_b() == null
					|| "".equals(form.getSenddate_ch_b())) {
				form.setSenddate_ch_b(today);
			}
			session.removeAttribute("t07_report_by_organsearch");
			if (newsearchflag.equals("1")) {// 新的查询

				MyBeanUtils.copyBean2Bean(t07_report_by_organ, form);
				t07_report_by_organ.setDt_start(DateUtils
						.stringToDateShort(t07_report_by_organ
								.getDt_start_disp()));
				t07_report_by_organ
						.setDt_end(DateUtils
								.stringToDateShort(t07_report_by_organ
										.getDt_end_disp()));
				t07_report_by_organ.setSenddate_ch_s(t07_report_by_organ
						.getSenddate_ch().replaceAll("-", ""));
				t07_report_by_organ.setSenddate_ch_e(t07_report_by_organ
						.getSenddate_ch_b().replaceAll("-", ""));

				String cash_trans_flag = StringUtils.null2String(request
						.getParameter("cash_trans_flag"));
				t07_report_by_organ.setCash_trans_flag(cash_trans_flag);
				session.removeAttribute("t07_report_by_organsearch");
				session.setAttribute("t07_report_by_organsearch",
						t07_report_by_organ);
			} else {
				t07_report_by_organ = (T07_report_by_organ) session
						.getAttribute("t07_report_by_organsearch");

			}
			if (t07_report_by_organ != null) {
				request.setAttribute("casesearchtime", t07_report_by_organ
						.getCasesearchtime());
				request
						.setAttribute("alerttype", t07_report_by_organ
								.getType());
				request.setAttribute("msg_type_cd", t07_report_by_organ
						.getMsg_type_cd());
			}
			if (!"2".equals(newsearchflag)) {
				t07_report_by_organ.setOrganstrs(organstrs);
				t07_report_by_organList = t07_report_by_organDAO
						.getT07_detrans_report_List(sqlMap,
								t07_report_by_organ, this.getStartRec(intPage),
								this.getIntPageSize());

				int totalRow = t07_report_by_organDAO
						.getT07_detrans_report_ListCount(sqlMap,
								t07_report_by_organ);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			request.setAttribute("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request
				.setAttribute("t07_report_by_organList",
						t07_report_by_organList);
		return actionMapping.findForward("success");
	}

	public ActionForward export_t07_detrans_report(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		ArrayList t07_report_by_organList;

		T07_report_by_organDAO t07_report_by_organDAO = (T07_report_by_organDAO) context
				.getBean("t07_report_by_organDAO");
		T07_report_by_organ t07_report_by_organ;

		try {
			t07_report_by_organ = (T07_report_by_organ) session
					.getAttribute("t07_report_by_organsearch");
			if (t07_report_by_organ == null) {
				t07_report_by_organList = new ArrayList();
			} else {
				t07_report_by_organList = t07_report_by_organDAO
						.getT07_detrans_report_List(sqlMap,
								t07_report_by_organ, 0, 5000);

			}
			request.setAttribute("list", t07_report_by_organList);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

}
