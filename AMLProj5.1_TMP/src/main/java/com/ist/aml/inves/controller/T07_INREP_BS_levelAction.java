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
 * <p>T07_INREP_BS_levelActoin.java</p>
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

public class T07_INREP_BS_levelAction extends BaseAction {

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
		if ("getT07_INREP_BS_levelList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_INREP_BS_levelList(mapping, form,
					request, response);
		}
		// 导出交易报告
		else if ("export_T07_INREP_BS_level".equalsIgnoreCase(myaction)) {
			myforward = export_T07_INREP_BS_level(mapping, form, request,
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
	public ActionForward performGetT07_INREP_BS_levelList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		ArrayList t07_inrep_bs_levelList = new ArrayList();
		String pageInfo = "";
		//
		T07_INREP_BS_levelDAO t07_inrep_bs_levelDAO = (T07_INREP_BS_levelDAO) context
				.getBean("t07_inrep_bs_levelDAO");
		T07_INREP_BS_level t07_inrep_bs_level = new T07_INREP_BS_level();
		try {
			T07_INREP_BS_levelActionForm form = (T07_INREP_BS_levelActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (!newsearchflag.equals("2")) {// 首次进入不查询
				if (newsearchflag.equals("1")) {// 新的查询
					MyBeanUtils.copyBean2Bean(t07_inrep_bs_level, form);
					if (form.getStatistic_dt_start() != null
							&& !"".equals(form.getStatistic_dt_start())) {
						t07_inrep_bs_level
								.setStatistic_dt_start(DateUtils
										.stringToDateShort(form
												.getStatistic_dt_start()));
					}
					if (form.getStatistic_dt_end() != null
							&& !"".equals(form.getStatistic_dt_end())) {
						t07_inrep_bs_level.setStatistic_dt_end(DateUtils
								.stringToDateShort(form.getStatistic_dt_end()));
					}
					session.removeAttribute("t07_inrep_bs_levelSearchObj");
					session.setAttribute("t07_inrep_bs_levelSearchObj",
							t07_inrep_bs_level);
				} else {// 翻页
					t07_inrep_bs_level = (T07_INREP_BS_level) session
							.getAttribute("t07_inrep_bs_levelSearchObj");
				}
				t07_inrep_bs_level.setOrganStr(organStr);
				t07_inrep_bs_levelList = t07_inrep_bs_levelDAO
						.getT07_INREP_BS_levelList(sqlMap, t07_inrep_bs_level,
								this.getStartRec(intPage), this
										.getIntPageSize());
				int totalRow = t07_inrep_bs_levelDAO
						.getT07_INREP_BS_levelListCount(sqlMap,
								t07_inrep_bs_level);
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

		request.setAttribute("t07_inrep_bs_levelList", t07_inrep_bs_levelList);
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
	public ActionForward export_T07_INREP_BS_level(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_inrep_bs_levelList;
		T07_INREP_BS_levelDAO t07_inrep_bs_levelDAO = (T07_INREP_BS_levelDAO) context
				.getBean("t07_inrep_bs_levelDAO");
		T07_INREP_BS_level t07_inrep_bs_level = new T07_INREP_BS_level();
		try {
			// 组织用户所属的机构ID
			// String dt_start = "", dt_end = "";
			t07_inrep_bs_level = (T07_INREP_BS_level) session
					.getAttribute("t07_inrep_bs_levelSearchObj");
			if (t07_inrep_bs_level == null) {
				t07_inrep_bs_levelList = new ArrayList();
			} else {
				t07_inrep_bs_levelList = t07_inrep_bs_levelDAO
						.getT07_inrep_bs_levelList_bs(sqlMap,
								t07_inrep_bs_level);

			}
			if (t07_inrep_bs_levelList.size() > 5000) {
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

		request.setAttribute("t07_inrep_bs_level", t07_inrep_bs_level);
		request.setAttribute("t07_inrep_bs_levelList", t07_inrep_bs_levelList);

		return actionMapping.findForward("success");

	}
}
