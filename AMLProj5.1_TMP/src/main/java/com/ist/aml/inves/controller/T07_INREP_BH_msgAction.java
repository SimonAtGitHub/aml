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
 * <p>T07_INREP_BH_msgActoin.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import org.apache.struts.action.*;

import javax.servlet.http.*;

import java.util.*;

import com.ist.aml.inves.dao.*;
import com.ist.aml.inves.dto.T07_INREP_BH_msg;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.util.*;
import com.ist.impfile.aml.report.dto.Report_SearchObj;
import com.ist.util.DateUtils;

public class T07_INREP_BH_msgAction extends BaseAction {

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
		if ("getT07_INREP_BH_msgList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_INREP_BH_msgList(mapping, form, request,
					response);
		}
		// 导出交易报告
		else if ("export_T07_INREP_BH_msg".equalsIgnoreCase(myaction)) {
			myforward = export_T07_INREP_BH_msg(mapping, form, request,
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
	public ActionForward performGetT07_INREP_BH_msgList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		ArrayList t07_inrep_bh_msgList = new ArrayList();
		String pageInfo = "";
		//
		T07_INREP_BH_msgDAO t07_inrep_bh_msgDAO = (T07_INREP_BH_msgDAO) context
				.getBean("t07_inrep_bh_msgDAO");
		T07_INREP_BH_msg t07_inrep_bh_msg = new T07_INREP_BH_msg();
		try {
			T07_INREP_BH_msgActionForm form = (T07_INREP_BH_msgActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (!newsearchflag.equals("2")) {// 首次进入不查询
				if (newsearchflag.equals("1")) {// 新的查询
					MyBeanUtils.copyBean2Bean(t07_inrep_bh_msg, form);
					if (form.getReport_dt_disp() != null
							&& !"".equals(form.getReport_dt_disp())) {
						t07_inrep_bh_msg.setReport_dt_disp(DateUtils
								.stringToDateShort(form.getReport_dt_disp()));
					}
					if (form.getReport_dt_end() != null
							&& !"".equals(form.getReport_dt_end())) {
						t07_inrep_bh_msg.setReport_dt_end(DateUtils
								.stringToDateShort(form.getReport_dt_end()));
					}
					session.removeAttribute("t07_inrep_bh_msgSearchObj");
					session.setAttribute("t07_inrep_bh_msgSearchObj",
							t07_inrep_bh_msg);
				} else {// 翻页
					t07_inrep_bh_msg = (T07_INREP_BH_msg) session
							.getAttribute("t07_inrep_bh_msgSearchObj");
				}
				t07_inrep_bh_msg.setOrganStr(organStr);
				t07_inrep_bh_msgList = t07_inrep_bh_msgDAO
						.getT07_INREP_BH_msgList(sqlMap, t07_inrep_bh_msg, this
								.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t07_inrep_bh_msgDAO
						.getT07_inrep_bh_msgListCount(sqlMap, t07_inrep_bh_msg);
				String url = request.getContextPath() + "/inves"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("intPage", intPage + "");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_inrep_bh_msgList", t07_inrep_bh_msgList);
		request.setAttribute("pageInfo", pageInfo);
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
	public ActionForward export_T07_INREP_BH_msg(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_inrep_bh_msgList;
		T07_INREP_BH_msgDAO t07_inrep_bh_msgDAO = (T07_INREP_BH_msgDAO) context
				.getBean("t07_inrep_bh_msgDAO");
		T07_INREP_BH_msg t07_inrep_bh_msg = new T07_INREP_BH_msg();
		try {
			// 组织用户所属的机构ID
			// String dt_start = "", dt_end = "";
			t07_inrep_bh_msg = (T07_INREP_BH_msg) session
					.getAttribute("t07_inrep_bh_msgSearchObj");
			if (t07_inrep_bh_msg == null) {
				t07_inrep_bh_msgList = new ArrayList();
			} else {
				t07_inrep_bh_msgList = t07_inrep_bh_msgDAO
						.getT07_inrep_bh_msgList_bh(sqlMap, t07_inrep_bh_msg);

			}
			if (t07_inrep_bh_msgList.size() > 5000) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"一次导出交易不得超过5000条！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String excelName = DateUtils.getDate10to8(DateUtils.getCurrTime())
					+ "transbh";
			request.setAttribute("excelName", excelName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_inrep_bh_msg", t07_inrep_bh_msg);
		request.setAttribute("t07_inrep_bh_msgList", t07_inrep_bh_msgList);

		return actionMapping.findForward("success");

	}
}
