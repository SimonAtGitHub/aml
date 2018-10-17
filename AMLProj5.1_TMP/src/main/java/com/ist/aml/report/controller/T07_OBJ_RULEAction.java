/**
 *  孙日朋 2009-6-26	创建
 */

package com.ist.aml.report.controller;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组
 * @version 1.0
 */

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dao.T07_BlacklistDAO;
import com.ist.aml.report.dao.T07_OBJ_RULEDAO;
import com.ist.aml.report.dao.T07_pbcruleDAO;
import com.ist.aml.report.dto.T07_Blacklist;
import com.ist.aml.report.dto.T07_OBJ_RULE;
import com.ist.aml.report.dto.T07_pbcrule;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dto.T00_role;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_OBJ_RULEAction extends BaseAction {
	private static Logger logger = LogUtils.getLogger(T07_OBJ_RULEAction.class
			.getName());

	/**
	 * Action执行入口 孙日朋 2009-6-26
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
		// 查询界面
		if ("searchT07_OBJ_RULE".equalsIgnoreCase(myaction)) {
			myforward = performSearchT07_OBJ_RULE(mapping, form, request,
					response);
		}
		// 查询结果
		else if ("getT07_OBJ_RULEList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_OBJ_RULEList(mapping, form, request,
					response);
		}
		//联网核查查询结果
		else if ("getT07_OBJ_RULECheck".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_OBJ_RULECheck(mapping, form, request,
					response);
		}
		// 灰名单
		else if ("getT07_grey_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_greyList(mapping, form, request, response);
		}
		// 查询详细信息
		else if ("getT07_OBJ_RULEDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_OBJ_RULEDisp(mapping, form, request,
					response);
		}
		//联网核查详细信息
		// 查询详细信息
		else if ("getT07_OBJ_RULEDispCheck".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_OBJ_RULEDispCheck(mapping, form, request,
					response);
				}
		//联网核查添加页面
		else if ("addT07_OBJ_RULECheck".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_OBJ_RULECheck(mapping, form, request, response);
		}
		// 添加界面
		else if ("addT07_OBJ_RULE".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_OBJ_RULE(mapping, form, request, response);
		} else if ("addT07_grey".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_grey(mapping, form, request, response);
		}
		// 添加动作
		else if ("addT07_OBJ_RULEDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_OBJ_RULEDo(mapping, form, request,
					response);
		}
		//联网核查 添加动作
		else if ("addT07_OBJ_RULEDoCheck".equalsIgnoreCase(myaction)) {
		    myforward = performAddT07_OBJ_RULEDoCheck(mapping, form, request,
						response);
		} else if ("addT07_greyDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_greyDo(mapping, form, request, response);
		}
		// 修改界面
		else if ("modifyT07_OBJ_RULE".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULE(mapping, form, request,
					response);
		}
		// 联网核查修改界面
	    else if ("modifyT07_OBJ_RULECheck".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULECheck(mapping, form, request,
					response);
		}
		else if ("modifyT07_grey".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_grey(mapping, form, request, response);
		}
		// 联网核查修改提交动作
		else if ("modifyT07_OBJ_RULEDoCheck".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULEDoCheck(mapping, form, request,
				    response);
		}
		// 修改动作
		else if ("modifyT07_OBJ_RULEDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULEDo(mapping, form, request,
					response);
		} else if ("modifyT07_greyDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_greyDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT07_OBJ_RULEDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_OBJ_RULEDo(mapping, form, request,
					response);
		}
		//联网核查删除动作
	    else if ("deleteT07_OBJ_RULEDoCheck".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_OBJ_RULEDoCheck(mapping, form, request,
					response);
				}
		// 导入名单 modfiy by shichao 2011-8-24
		else if ("inportT07_OBJ_RULEDo".equalsIgnoreCase(myaction)) {
			myforward = performInportT07_OBJ_RULEDo(mapping, form, request,
					response);
		}
		// 流程添加是否有审核操作
		else if ("getT07_OBJ_RULE_CHECKList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_OBJ_RULE_CHECKList(mapping, form,
					request, response);
		} else if ("modifyT07_OBJ_RULEDo_check0".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULEDo_check0(mapping, form,
					request, response);
		}
		else if ("modifyT07_OBJ_RULEDo_check".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_OBJ_RULEDo_check(mapping, form,
					request, response);
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
	public ActionForward performSearchT07_OBJ_RULE(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULE t07_obj_rule = (T07_OBJ_RULE) session
				.getAttribute("t07_obj_ruleSearchObj");
		if (t07_obj_rule == null) {
			t07_obj_rule = new T07_OBJ_RULE();
		}
		T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		return actionMapping.findForward("success");
	}

	/**
	 * 
	 * 列表查询
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
	public ActionForward performGetT07_OBJ_RULEList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_obj_ruleList = new ArrayList();
		String pageInfo = "";
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			
			
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			// 客户类型
//			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
//					party_class_cdMap, null, true));
			
			
			

			LinkedHashMap list_typeMap = cm.getMapFromCache("list_type2");
			request.setAttribute("list_typeMap", this.getOptionsListByMap(
					list_typeMap, null, false));
			// 查询排序
			LinkedHashMap listsearch_typeMap = cm
					.getMapFromCache("listsearch_type");
			request.setAttribute("listsearch_typeMap", this
					.getOptionsListByMap(listsearch_typeMap, null, true));

			LinkedHashMap ischeckforpartyMap = new LinkedHashMap();
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			if ("1".equals(t87_sysparaMap.get("404"))) {
				ischeckforpartyMap = cm.getMapFromCache("ischeckforparty0");
			} else {
				ischeckforpartyMap = cm.getMapFromCache("ischeckforparty");
			}

			// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			request.setAttribute("ischeckforpartyMap", this
					.getOptionsListByMap(ischeckforpartyMap, null, true));
			LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
			request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
					null, true));

			// 获取用户登录信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organlevel = auth.getT00_user().getOrganlevel();
			request.setAttribute("organlevel", organlevel);
            if(newsearchflag.equals("2")){
            	session.removeAttribute("t07_obj_ruleSearchObj");
            }
			// 新的查询
			if (newsearchflag.equals("1")) {
				MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
				t07_obj_rule.setOrgankeystr(auth.getOrganstr());
				if (form.getOrgankey() != null
						&& !"".equals(form.getOrgankey().trim())) {
					t07_obj_rule.setOrgankey(form.getOrgankey());
				}
				if (form.getParty_class_cd() != null
						&& !"".equals(form.getParty_class_cd().trim())) {
					t07_obj_rule.setParty_class_cd(form.getParty_class_cd());
				}
				if (form.getObj_name() != null
						&& !"".equals(form.getObj_name().trim())) {
					t07_obj_rule.setObj_name(form.getObj_name());
				}
				if (form.getParty_id() != null
						&& !"".equals(form.getParty_id().trim())) {
					t07_obj_rule.setParty_id(form.getParty_id());
				}
				if (t07_obj_rule.getListsearch_type() != null
						&& !"".equals(form.getListsearch_type().trim())) {
					t07_obj_rule.setListsearch_type(form.getListsearch_type());
				}
				if (form.getFashion() != null
						&& !"".equals(form.getFashion().trim())) {
					t07_obj_rule.setFashion(form.getFashion());
				}
				// 日期型数据的转换
				if (form.getCreate_dt_disp() != null
						&& !"".equals(form.getCreate_dt_disp())) {
					t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(form
							.getCreate_dt_disp()));
				}
				if (form.getCreate1_dt_disp() != null
						&& !"".equals(form.getCreate1_dt_disp())) {
					Date date = DateUtils.stringToDateShort(form
							.getCreate1_dt_disp());
					DateUtils d = new DateUtils();
					t07_obj_rule.setCreate1_dt(date);
				}
				session.setAttribute("t07_obj_ruleSearchObj", t07_obj_rule);
			} else {// 翻页
				t07_obj_rule = (T07_OBJ_RULE) session
						.getAttribute("t07_obj_ruleSearchObj");
				if (t07_obj_rule == null) {
					t07_obj_rule = new T07_OBJ_RULE();
				}
				MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
				
			}
			if (!newsearchflag.equals("2")) {
				if (t07_obj_rule == null) {
					t07_obj_rule = new T07_OBJ_RULE();
				}
				if (t07_obj_rule.getList_type() != null
						&& (t07_obj_rule.getList_type().equals("2")
								|| t07_obj_rule.getList_type().equals("3") || t07_obj_rule
								.getList_type().equals("4"))) {
					if (t07_obj_rule.getList_type().equals("2")) {
						t07_obj_rule.setTablename("t07_blacklist");
					} else if (t07_obj_rule.getList_type().equals("3")) {
						t07_obj_rule.setTablename("t07_greylist_info");
					} else if (t07_obj_rule.getList_type().equals("4")) {
						t07_obj_rule.setTablename("t07_stafflist_info");
					}
					t07_obj_ruleList = t07_obj_ruleDAO
							.getT07_OBJ_RULE_blackList(sqlMap, t07_obj_rule,
									this.getStartRec(intPage), this
											.getIntPageSize());
					int totalRow = t07_obj_ruleDAO
							.getT07_OBJ_RULEList_blackCount(sqlMap,
									t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				} else {
					t07_obj_ruleList = t07_obj_ruleDAO.getT07_OBJ_RULEList(
							sqlMap, t07_obj_rule, this.getStartRec(intPage),
							this.getIntPageSize());
					int totalRow = t07_obj_ruleDAO.getT07_OBJ_RULEListCount(
							sqlMap, t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				}
			}
			
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_str", party_class_str);
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_obj_ruleList", t07_obj_ruleList);
		return actionMapping.findForward("success");
	}
/**
 * 联网核查列表显示
 * */
	public ActionForward performGetT07_OBJ_RULECheck(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_obj_ruleList = new ArrayList();
		String pageInfo = "";
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));		
			int intPage = PageUtils.intPage(request, newsearchflag);
			LinkedHashMap checkresultMap = cm.getMapFromCache("checkresults");
			request.setAttribute("checkresultMap", this.getOptionsListByMap(checkresultMap,
					null, true));
			LinkedHashMap is_instMap = cm.getMapFromCache("is_inst");
			request.setAttribute("is_instMap", this.getOptionsListByMap(is_instMap,
					null, true));			// 新的查询
			if (newsearchflag.equals("1")){
				String checkdate = form.getCheckdate();
				String checkdate1 = form.getCheckdate1();
				String qcheckdate = null;
				String qcheckdate1 = null;
				if(!"".equals(checkdate)&&!"".equals(checkdate1)){
					qcheckdate = checkdate.substring(0, 4)+checkdate.substring(5, 7)+checkdate.substring(8, 10);
					qcheckdate1 = checkdate1.substring(0, 4)+checkdate1.substring(5, 7)+checkdate1.substring(8, 10);
					form.setCheckdate(qcheckdate);
					form.setCheckdate1(qcheckdate1);
				}
				
				if (form.getBank_code2() != null
						&& !"".equals(form.getBank_code2().trim())) {
					t07_obj_rule.setBank_code2(form.getBank_code2());
				}
				if (form.getResult() != null
						&& !"".equals(form.getResult().trim())) {
					t07_obj_rule.setResult(form.getResult());
				}
				if (form.getCheckmode() != null
						&& !"".equals(form.getCheckmode().trim())) {
					t07_obj_rule.setCheckmode(form.getCheckmode());
				}
				if (form.getCheckdate() != null
						&& !"".equals(form.getCheckdate().trim())) {
					t07_obj_rule.setCheckdate(form.getCheckdate());
				}
				
				form.setCheckdate(checkdate);
				form.setCheckdate1(checkdate1);
				MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
				session.setAttribute("t07_obj_ruleSearchObj", t07_obj_rule);
			} else {// 翻页
				t07_obj_rule = (T07_OBJ_RULE) session
						.getAttribute("t07_obj_ruleSearchObj");
				if (t07_obj_rule == null) {
					t07_obj_rule = new T07_OBJ_RULE();
				}
				MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
				
			}
			if (!newsearchflag.equals("2")) {
				if (t07_obj_rule == null) {
					t07_obj_rule = new T07_OBJ_RULE();
				}
					t07_obj_ruleList = t07_obj_ruleDAO
							.getT07_OBJ_RULECheck(sqlMap, t07_obj_rule,
									this.getStartRec(intPage), this
											.getIntPageSize());
					int totalRow = t07_obj_ruleDAO
							.getT07_OBJ_RULECheckCount(sqlMap,
									t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				} else {
					t07_obj_ruleList = t07_obj_ruleDAO.getT07_OBJ_RULECheck(
							sqlMap, t07_obj_rule, this.getStartRec(intPage),
							this.getIntPageSize());
					int totalRow = t07_obj_ruleDAO.getT07_OBJ_RULECheckCount(
							sqlMap, t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_obj_ruleList", t07_obj_ruleList);
		return actionMapping.findForward("success");
	}

	public ActionForward performGetT07_greyList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_greyList = new ArrayList();
		String pageInfo = "";
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			// 把页码放入，方便其他返回使用
			request.getSession().setAttribute("intPage", intPage + "");
			// 客户类型
			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
					party_class_cdMap, null, true));
			LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
			request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
					null, true));
			// 审批状态
			LinkedHashMap ischeckforpartyMap = cm
					.getMapFromCache("ischeckforparty");
			request.setAttribute("ischeckforpartyMap", this
					.getOptionsListByMap(ischeckforpartyMap, null, true));
			// 获取用户登录信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// 新的查询
			if (newsearchflag.equals("1")) {
				MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
				t07_obj_rule.setOrgankeystr(auth.getOrganstr());
				if (form.getOrgankey() != null
						&& !"".equals(form.getOrgankey().trim())) {
					t07_obj_rule.setOrgankey(form.getOrgankey());
				}
				if (form.getParty_class_cd() != null
						&& !"".equals(form.getParty_class_cd().trim())) {
					t07_obj_rule.setParty_class_cd(form.getParty_class_cd());
				}
				if (form.getObj_name() != null
						&& !"".equals(form.getObj_name().trim())) {
					t07_obj_rule.setObj_name("%" + form.getObj_name() + "%");
				}
				if (form.getParty_id() != null
						&& !"".equals(form.getParty_id().trim())) {
					t07_obj_rule.setParty_id(form.getParty_id());
				}

				// 日期型数据的转换
				if (form.getCreate_dt_disp() != null
						&& !"".equals(form.getCreate_dt_disp())) {
					t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(form
							.getCreate_dt_disp()));
				}
				if (form.getCreate1_dt_disp() != null
						&& !"".equals(form.getCreate1_dt_disp())) {
					Date date = DateUtils.stringToDateShort(form
							.getCreate1_dt_disp());
					t07_obj_rule.setCreate1_dt(date);
				}
				session.setAttribute("t07_gery_listSearchObj", t07_obj_rule);
			} else {// 翻页
				t07_obj_rule = (T07_OBJ_RULE) session
						.getAttribute("t07_gery_listSearchObj");
			}

			t07_greyList = t07_obj_ruleDAO.getT07_greyList(sqlMap,
					t07_obj_rule, this.getStartRec(intPage), this
							.getIntPageSize());
			int totalRow = t07_obj_ruleDAO.getT07_greyListCount(sqlMap,
					t07_obj_rule);
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_greyList", t07_greyList);

		return actionMapping.findForward("success");
	}
    /**
     * 联网核查详细页面
     * */
	public ActionForward performGetT07_OBJ_RULEDispCheck(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		String changeflag = StringUtils.nullObject2String(request
				.getParameter("changeflag"));
		// 管理页面
		if ("1".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_check.do?intPage="
					+ request.getSession().getAttribute("intPage"));
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		//by  zyd 修复内江联网核查一对多
		ArrayList<T07_OBJ_RULE> t07_obj_rule = new ArrayList<T07_OBJ_RULE>();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			T07_OBJ_RULE t07_obj_rule1 = new T07_OBJ_RULE();
			String id_no = form.getId_no();
			t07_obj_rule1.setId_no(id_no);
			t07_obj_rule = t07_obj_ruleDAO
					.getT07_OBJ_RULEDispCheck(sqlMap, t07_obj_rule1);
			// 获取机构
//			LinkedHashMap organMap = cm.getMapFromCache("organ");
//			t07_obj_rule.setBank_code2((String) organMap.get(t07_obj_rule
//					.getOrgankey()));

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_obj_rule_list", t07_obj_rule);
		
		return actionMapping.findForward("success");
	}
	/**
	 * 详细信息 孙日朋 2009-6-26
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
	public ActionForward performGetT07_OBJ_RULEDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		String changeflag = StringUtils.nullObject2String(request
				.getParameter("changeflag"));
		// 管理页面
		if ("1".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list.do?intPage="
					+ request.getSession().getAttribute("intPage"));
		// 查询页面
		if ("2".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list_look.do?intPage="
					+ request.getSession().getAttribute("intPage"));
		// 审核页面
		if ("3".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list_check0.do?list_type=1&intPage="
					+ request.getSession().getAttribute("intPage"));
		if ("4".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list_check.do?list_type=1&intPage="
					+ request.getSession().getAttribute("intPage"));
		
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			T07_OBJ_RULE t07_obj_rule1 = new T07_OBJ_RULE();
			String party_id = form.getParty_id();
			t07_obj_rule1.setParty_id(party_id);
			t07_obj_rule = t07_obj_ruleDAO
					.getT07_OBJ_RULEDisp(sqlMap, t07_obj_rule1);
			// 获取机构
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			t07_obj_rule.setOrgankey((String) organMap.get(t07_obj_rule
					.getOrgankey()));

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t07_obj_rule", t07_obj_rule);
		//
		return actionMapping.findForward("success");
	}
    /**
     * 联网核查添加页面
     * */
	public ActionForward performAddT07_OBJ_RULECheck(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
		// 客户类别
		LinkedHashMap checkresultMap = cm.getMapFromCache("checkresults");		
		request.setAttribute("checkresultMap", this.getOptionsListByMap(
				checkresultMap, null, true));
		// 免检测类型
		LinkedHashMap checkmethodMap = cm.getMapFromCache("checkmethod");
		request.setAttribute("checkmethodMap", this.getOptionsListByMap(
				checkmethodMap, null, true));
		// 是否启用
		LinkedHashMap is_instMap = cm.getMapFromCache("is_inst");
		request.setAttribute("is_instMap", this.getOptionsListByMap(is_instMap,
				null, true));
		return actionMapping.findForward("success");
	}

	/**
	 * 添加页面 孙日朋 2009-6-26
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
	public ActionForward performAddT07_OBJ_RULE(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
		String type = form.getParty_class_cd();
		// 客户类别
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
//		
//		LinkedHashMap clienttypeMapI = new LinkedHashMap();
//		clienttypeMap.put("I", "对私");
//		LinkedHashMap clienttypeMapC = new LinkedHashMap();
//		clienttypeMap.put("C", "对公");
//		
//		if(type.equals("I"))
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMapI, null, true));
//		else if(type.equals("C"))
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMapC, null, true));
//		else
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
		
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));
		// 免检测类型
		LinkedHashMap rule_typeMap = cm.getMapFromCache("rule_type");
		request.setAttribute("rule_typeMap", this.getOptionsListByMap(
				rule_typeMap, null, true));
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
				null, true));
		String check = StringUtils.null2String(request.getParameter("check"));
		request.setAttribute("check", check);

		return actionMapping.findForward("success");
	}

	public ActionForward performAddT07_grey(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

		// 客户类别
		LinkedHashMap list_typeMap = cm.getMapFromCache("list_type");
		request.setAttribute("list_typeMap", this.getOptionsListByMap(
				list_typeMap, null, true));

		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
				null, true));

		return actionMapping.findForward("success");
	}
    /**
     * 联网核查新建提交
     * */
	public ActionForward performAddT07_OBJ_RULEDoCheck(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		// 获取当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String success = "";
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			// 插入名单
			t07_obj_rule.setIs_inst("1");
			t07_obj_rule.setBank_name(form.getBank_name());
			t07_obj_rule.setBank_code2(form.getBank_code2());
			if(!"".equals(form.getCheckdate())){
				String checkdate= form.getCheckdate();
				checkdate=checkdate.substring(0, 4)+checkdate.substring(5, 7)+checkdate.substring(8, 10);
				t07_obj_rule.setCheckdate(checkdate);
			}
			if(!"".equals(form.getChecktime())){
			t07_obj_rule.setChecktime(form.getChecktime());
			}
			if(!"".equals(form.getName())){
			t07_obj_rule.setName(form.getName());
			}
			//zyd  2018-0810内江联网核查去空格
			t07_obj_rule.setId_no(form.getId_no().trim());
			t07_obj_rule.setResult(form.getResult());
			if(!"".equals(form.getCounter_no())){
			t07_obj_rule.setCounter_no(form.getCounter_no());
			}
			if(!"".equals(form.getOpe_line())){
			t07_obj_rule.setOpe_line(form.getOpe_line());
			}
			t07_obj_rule.setCheckmode(form.getCheckmode());
			if(!"".equals(form.getPurpose())){
			t07_obj_rule.setPurpose(form.getPurpose());
			}
			if(!"".equals(form.getTb_id())){
			t07_obj_rule.setTb_id(form.getTb_id());
			}
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			int row = t07_obj_ruleDAO.insertT07_OBJ_RULECheck(sqlMap, t07_obj_rule);
			if (row <= 0) {
				throw new Exception("");
			}
			sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 
	 * 新建操作
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
	public ActionForward performAddT07_OBJ_RULEDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
		.getBean("t07_blacklistDAO");
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		// 获取当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String success = "";
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			// 重复处理
			t07_obj_rule.setParty_id(form.getParty_id());
			// 查询该客户是否是黑、白名单客户
			boolean tag = t07_blacklistDAO.getT07_Listrealy(sqlMap, form.getParty_id());
			if (tag) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common", "客户已在黑白名单中，不允许添加！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// 插入名单
			t07_obj_rule.setParty_id(form.getParty_id());
			t07_obj_rule.setIsuse("0");
			t07_obj_rule.setOrgankey(auth.getT00_user().getOrgankey());
			t07_obj_rule.setParty_class_cd(t07_obj_rule.getParty_class_cd());
			t07_obj_rule.setObj_name(t07_obj_rule.getObj_name());
			t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
			t07_obj_rule.setReason_create(t07_obj_rule.getReason_create());
			t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
			t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			String check = "";

			
			if(auth.getT00_user().getOrganlevel().equals("0")) {
				check = "check";
			}
			if ("check".equals(check)) {
				t07_obj_rule.setIscheck("1");// 直接审批通过
				t07_obj_rule.setIsuse("0");  //0 启用;1 禁用
			}
			else {
				LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
				if ("1".equals(t87_sysparaMap.get("404"))) {
					//包含审核环节
					t07_obj_rule.setIscheck("2");
				}
				else
					//待审批
					t07_obj_rule.setIscheck("4");
			}
			//
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			int row = t07_obj_ruleDAO.insertT07_OBJ_RULE(sqlMap, t07_obj_rule);
			if (row <= 0) {
				throw new Exception("");
			}
			// 查询入行规则
			if ("check".equals(check) && t07_obj_rule.getIsuse().equals("0")) {
				t07_obj_rule.setPbc_type_cd(form.getRule_type());
				if ("3".equals(form.getRule_type())) {
					t07_obj_rule.setPbc_type_cd("1");
					t07_obj_rule.setPbc_cd("2");
				}
				
				int rows = t07_obj_ruleDAO.insertT07_OBJ_RULES(sqlMap, t07_obj_rule);
				if (rows <= 0) {
					throw new Exception("");
				}
			}
			sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return actionMapping.findForward("success");
	}

	public ActionForward performAddT07_greyDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		// 获取当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			// 重复处理
			t07_obj_rule.setParty_id(form.getParty_id());
			int count = t07_obj_ruleDAO.getT07_greyListCount(sqlMap,
					t07_obj_rule);
			if (count > 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common", "客户已存在此名单中！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String check = "";

			for (int i = 0; i < auth.getRoleList().size(); i++) {
				T00_role t00_role = (T00_role) auth.getRoleList().get(i);
				if (t00_role.getRolelevel() != null
						&& t00_role.getRolelevel().equals("0")) {
					check = "check";
					break;
				}
			}
			if ("check".equals(check)) {
				t07_obj_rule.setIscheck("1");// 直接审批通过
			} else {
				t07_obj_rule.setIscheck("2");
			}
			// 插入名单
			t07_obj_rule.setParty_id(form.getParty_id());
			t07_obj_rule.setOrgankey(auth.getT00_user().getOrgankey());
			t07_obj_rule.setParty_class_cd(t07_obj_rule.getParty_class_cd());
			t07_obj_rule.setObj_name(t07_obj_rule.getObj_name());
			t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
			t07_obj_rule.setReason_create(t07_obj_rule.getReason_create());
			t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));

			int row = t07_obj_ruleDAO.insertT07_grey(sqlMap, t07_obj_rule);
			if (row <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward("success");
	}

	/**
	 * 修改名单 孙日朋 2009-6-26
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
	public ActionForward performModifyT07_OBJ_RULE(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		HttpSession session = request.getSession();
		
		try {
			// 免检测类型
			LinkedHashMap rule_typeMap = cm.getMapFromCache("rule_type");
			request.setAttribute("rule_typeMap", this.getOptionsListByMap(
					rule_typeMap, null, true));
			// 是否启用
			LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
			request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
					null, true));
			
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String selectedPartyId = form.getSelectedPartyId()[0];
			T07_OBJ_RULE t07_obj_rule_temp = new T07_OBJ_RULE();
			t07_obj_rule_temp.setParty_id(selectedPartyId);
			
			t07_obj_rule = t07_obj_ruleDAO.getT07_OBJ_RULEDisp(sqlMap,
					t07_obj_rule_temp);
			MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
			String ischeck = t07_obj_rule.getIscheck();
			request.setAttribute("ischeck", ischeck);
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		String check = "";

		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		if(auth.getT00_user().getOrganlevel().equals("0")) {
			check = "check";
		}
		
		request.setAttribute("check", check);
		request.setAttribute("t07_obj_rulename", t07_obj_rule.getParty_id());
		return actionMapping.findForward("success");
	}
/**
 * 联网核查修改
 * */
	public ActionForward performModifyT07_OBJ_RULECheck(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		HttpSession session = request.getSession();
		
		try {
			LinkedHashMap checkresultMap = cm.getMapFromCache("checkresults");
			request.setAttribute("checkresultMap", this.getOptionsListByMap(
					checkresultMap, null, true));
			LinkedHashMap checkmethodMap = cm.getMapFromCache("checkmethod");
			request.setAttribute("checkmethodMap", this.getOptionsListByMap(checkmethodMap,
					null, true));
			LinkedHashMap is_instMap = cm.getMapFromCache("is_inst");
			request.setAttribute("is_instMap", this.getOptionsListByMap(is_instMap,
					null, true));
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String selectedPartyId = form.getSelectedPartyId()[0];
			T07_OBJ_RULE t07_obj_rule_temp = new T07_OBJ_RULE();
			t07_obj_rule_temp.setId_no(selectedPartyId);
			t07_obj_rule = t07_obj_ruleDAO.getT07_OBJ_RULEDispCheck0(sqlMap,
					t07_obj_rule_temp);
			MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
//			form.setCheckmode(t07_obj_rule.getCheckmode());
//			form.setResult(t07_obj_rule.getResult());
			request.setAttribute("t07_obj_rule",t07_obj_rule);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_obj_rulename", t07_obj_rule.getId_no());
		return actionMapping.findForward("success");
	}
	public ActionForward performModifyT07_grey(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
				null, true));
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String selectedPartyId = form.getSelectedPartyId()[0];
			String[] party_ids = selectedPartyId.split("-");
			t07_obj_rule = t07_obj_ruleDAO
					.getT07_greyDisp(sqlMap, party_ids[0]);
			MyBeanUtils.copyBean2Bean(form, t07_obj_rule);
			request.setAttribute("check", party_ids[1]);
			form.setParty_id(party_ids[0]);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_obj_rule", t07_obj_rule);
		return actionMapping.findForward("success");
	}

	/**
	 * 
	 * 修改操作 孙日朋 2009-6-26
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
	public ActionForward performModifyT07_OBJ_RULEDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO) context
				.getBean("t07_tpbcruleDAO");
		T07_pbcrule t07_pbcrule = new T07_pbcrule();
		ArrayList t07_pbcruleList = new ArrayList();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String mdifyuser = auth.getT00_user().getUsername();
		String success = "success";
		
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			// 修改操作  这里的入口只有出于2待审核状态的白名单方可进入
			t07_obj_rule.setParty_id(form.getParty_id());
			t07_obj_rule.setIsuse("0");
			t07_obj_rule.setReason_create(form.getReason_create());
			t07_obj_rule.setRule_type(form.getRule_type());
			t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
			t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));
			t07_obj_rule.setValidate_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));
			t07_obj_rule.setInvalidate_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));
			String ischeck = (String)request.getParameter("ischeck");
			t07_obj_rule.setIscheck(ischeck);
				
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			String check = request.getParameter("check");
			if ("check".equals(check)) {
				t07_obj_rule.setIscheck("1");
				t07_obj_ruleDAO.modifyT07_OBJ_RULE(sqlMap, t07_obj_rule);
				// 删除入行规则表中记录
				t07_obj_ruleDAO.deleteT07_OBJ_RULES(sqlMap, form.getParty_id());
				// 重新插入
				// 查询入行规则
				if (t07_obj_rule.getIsuse().equals("0")) {
					t07_obj_rule.setPbc_type_cd(form.getRule_type());
					if ("3".equals(form.getRule_type())) {
						t07_obj_rule.setPbc_type_cd("1");
						t07_obj_rule.setPbc_cd("2");
					}
					
					int rows = t07_obj_ruleDAO.insertT07_OBJ_RULES(sqlMap, t07_obj_rule);
					if (rows <= 0) {
						throw new Exception("");
					}
				}
				//success = "success1";
			} else {
				if("5".equals(ischeck))
					if ("1".equals(t87_sysparaMap.get("404"))) {  //包含审核环节
						t07_obj_rule.setIscheck("2");
					}
					else
						t07_obj_rule.setIscheck("4");
				t07_obj_ruleDAO.modifyT07_OBJ_RULE(sqlMap, t07_obj_rule);
				//success = "success";
			}
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return actionMapping.findForward(success);
	}
    /**
     * 联网核查修改提交动作
     * */
	public ActionForward performModifyT07_OBJ_RULEDoCheck(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String mdifyuser = auth.getT00_user().getUsername();
		String success = "success";
		
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			if(!"".equals(form.getCheckdate())){
				String checkdate= form.getCheckdate();
				checkdate=checkdate.substring(0, 4)+checkdate.substring(5, 7)+checkdate.substring(8, 10);
				t07_obj_rule.setCheckdate(checkdate);
			}
			if(!"".equals(form.getChecktime())){
			t07_obj_rule.setChecktime(form.getChecktime());
			}
			if(!"".equals(form.getName())){
			t07_obj_rule.setName(form.getName());
			}
			t07_obj_rule.setResult(form.getResult());
			if(!"".equals(form.getCounter_no())){
			t07_obj_rule.setCounter_no(form.getCounter_no());
			}
			if(!"".equals(form.getOpe_line())){
			t07_obj_rule.setOpe_line(form.getOpe_line());
			}
			t07_obj_rule.setCheckmode(form.getCheckmode());
			if(!"".equals(form.getPurpose())){
			t07_obj_rule.setPurpose(form.getPurpose());
			}
			if(!"".equals(form.getTb_id())){
			t07_obj_rule.setTb_id(form.getTb_id());
			}		
			sqlMap.endTransaction();
			sqlMap.startTransaction();
				t07_obj_ruleDAO.modifyT07_OBJ_RULECheck(sqlMap, t07_obj_rule);
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return actionMapping.findForward(success);
	}

	public ActionForward performModifyT07_greyDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();

		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String success = "";
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			String party_id = form.getParty_id();
			String check = request.getParameter("check");
			// if("1".equals(check)) {
			// t07_obj_rule.setIscheck("1");
			// }else{
			t07_obj_rule.setIscheck("3");
			// }
			// 修改操作
			t07_obj_rule.setParty_id(party_id);
			t07_obj_rule.setReason_create(form.getReason_create());
			t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
			t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));

			t07_obj_ruleDAO.modifyT07__grey(sqlMap, t07_obj_rule);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
		// return new
		// ActionForward("/listmanager/t07_obj_rule_list.do?intPage="+request.getSession().getAttribute("intPage"));
	}

	/**
	 * 
	 * 删除操作 孙日朋 2009-6-26
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
	public ActionForward performDeleteT07_OBJ_RULEDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String[] selectedPartyIds = form.getSelectedPartyId();
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			for (int i = 0; i < selectedPartyIds.length; i++) {
				String selectedPartyId = selectedPartyIds[i];
				t07_obj_ruleDAO.deleteT07_OBJ_RULE(sqlMap, selectedPartyId);
				t07_obj_ruleDAO.deleteT07_OBJ_RULES(sqlMap, selectedPartyId);
			}
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}
    /**
     * 联网核查删除动作
     * */
	public ActionForward performDeleteT07_OBJ_RULEDoCheck(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String[] selectedPartyIds = form.getSelectedPartyId();
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			for (int i = 0; i < selectedPartyIds.length; i++) {
				String selectedPartyId = selectedPartyIds[i];
				t07_obj_ruleDAO.deleteT07_OBJ_RULECheck(sqlMap, selectedPartyId);
			}
			MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	/**
	 * modify by shichao 2011-8-24
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
	public ActionForward performInportT07_OBJ_RULEDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = new T07_OBJ_RULEDAO();
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		HttpSession session = request.getSession();
		ArrayList t07_pbcruleList = new ArrayList();
		// 获取当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		try {
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			String type = StringUtils.nullObject2String(request
					.getParameter("type"));
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			FormFile file = form.getFilename();
			// 获取文件名称
			String fname = file.getFileName();
			HSSFWorkbook workbook=this.uplodeFile(fname, file);
			HSSFSheet sheet = workbook.getSheetAt(0);
			// 获取excel中的值并放到对象中
			System.out.println("sheeeeeeeeeeeet num=" + sheet.getLastRowNum());
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				// 循环读一行的列
				// 表格是从零开始算的
				// 客户号
				HSSFCell cell = row.getCell((short) 0);
				String cellValue = "";
				cellValue = this.getCellValue(cell);
				if (cellValue == "") {
					break;
				}
				t07_obj_rule.setParty_id(cellValue);
				// 客户名称
				cell = row.getCell((short) 1);
				cellValue = this.getCellValue(cell);
				if (cell != null) {
					cellValue = this.getCellValue(cell);
				}
				t07_obj_rule.setObj_name(cellValue);
				// 客户类型
				cell = row.getCell((short) 2);
				cellValue = this.getCellValue(cell);
				if (cellValue.equals("对公")) {
					t07_obj_rule.setParty_class_cd("C");
				} else {
					t07_obj_rule.setParty_class_cd("I");
				}
				// 免检测类型
				cell = row.getCell((short) 3);
				cellValue = this.getCellValue(cell);
				if (cellValue.equals("大额")) {
					t07_obj_rule.setRule_type("1");
				} else if (cellValue.equals("可疑")) {
					t07_obj_rule.setRule_type("2");
				} else {
					t07_obj_rule.setRule_type("3");
				}
				// 是否启用
				cell = row.getCell((short) 4);
				cellValue = this.getCellValue(cell);
				if (cellValue.equals("是"))
					t07_obj_rule.setIsuse("0");
				else
					t07_obj_rule.setIsuse("1");
				// 生效日期
				cell = row.getCell((short) 5);
				cellValue = this.getCellValue(cell);
				t07_obj_rule.setValidate_dt(DateUtils
						.stringToDateShort(cellValue));
				// 失效日期
				cell = row.getCell((short) 6);
				cellValue = this.getCellValue(cell);
				t07_obj_rule.setInvalidate_dt(DateUtils
						.stringToDateShort(cellValue));

				t07_obj_rule.setParty_id(t07_obj_rule.getParty_id());
				// 创建的当前时间
				t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(DateUtils
						.getCurrTime()));
				// 创建机构
				t07_obj_rule.setOrgankey(auth.getT00_user().getOrgankey());
				// 创建用户
				t07_obj_rule.setCreate_user(auth.getT00_user().getUsername());
				
				
				String check = "";
				if(auth.getT00_user().getOrganlevel().equals("0")) {
					check = "check";
				}
				if ("check".equals(check)) {
					t07_obj_rule.setIscheck("1");// 直接审批通过
					t07_obj_rule.setIsuse("0");
				}
				else {
					LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
					if ("1".equals(t87_sysparaMap.get("404"))) {
						//包含审核环节
						t07_obj_rule.setIscheck("2");
					}
					else
						//待审批
						t07_obj_rule.setIscheck("4");
				}
				
				System.out.println("t07_obj_rule.getIscheck()="
						+ t07_obj_rule.getIscheck());
				// if (cellValue.indexOf('.') > 0)
				// t07_obj_rule.setPbc_rule_key((String) cellValue.substring(
				// 0, cellValue.indexOf('.')));
				// else
				// t07_obj_rule.setPbc_rule_key((String) cellValue);
				System.out.println("rownum===========" + i);
				// 存在就先删再插，不存在直接插入
				if (!t07_obj_ruleDAO.getT07_OBJ_RULElist(sqlMap, t07_obj_rule)) {
					t07_obj_ruleDAO.deleteT07_OBJ_RULE(sqlMap, t07_obj_rule
							.getParty_id());
				}
				int rows = t07_obj_ruleDAO.insertT07_OBJ_RULE(sqlMap,
						t07_obj_rule);
				if (rows <= 0) {
					throw new Exception("");
				}
				
				// 查询入行规则
				int row1 = t07_obj_ruleDAO.deleteT07_OBJ_RULES(sqlMap, t07_obj_rule.getParty_id());
				
				if ("check".equals(check) && t07_obj_rule.getIsuse().equals("0")) {
					t07_obj_rule.setPbc_type_cd(t07_obj_rule.getRule_type());
					if ("3".equals(t07_obj_rule.getRule_type())) {
						t07_obj_rule.setPbc_type_cd("1");
						t07_obj_rule.setPbc_cd("2");
					}
					
					int row2 = t07_obj_ruleDAO.insertT07_OBJ_RULES(sqlMap, t07_obj_rule);
					if (row2 <= 0) {
						throw new Exception("");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	public HSSFWorkbook  uplodeFile(String fname,FormFile file) throws Exception{
		InputStream streamIn = null;
		InputStream stream = null;
		HSSFWorkbook workbook=null;

		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			 streamIn = file.getInputStream();
			String path = "whitelist";
			// 保存文件的主目录
			String fileName = fileUpload.uploadFile(fname, streamIn, path,
					"day");
			XMLProperties SysConfig = (XMLProperties) context
					.getBean("sysConfig");
			String attachDir = SysConfig.getProperty("data.import");
			fileName = attachDir + fileName;
			 workbook = new HSSFWorkbook(new FileInputStream(
					fileName));
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
			if(stream!=null){
				stream.close();
			}
		}
		return  workbook;
	}
	public String getCellValue(HSSFCell cell) throws Exception {

		String cellvalue = "";
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_NUMERIC: {
			if (HSSFDateUtil.isCellDateFormatted(cell)) {
				cellvalue = DateUtils
						.dateToStringShort(cell.getDateCellValue());
			} else {
				double numcell = cell.getNumericCellValue();
				String formatstr = "########.# ";
				java.text.DecimalFormat formatter = new java.text.DecimalFormat(
						formatstr);
				cellvalue = formatter.format(numcell);
				// System.out.println("num::"+cellvalue);

			}
			break;
		}
		case HSSFCell.CELL_TYPE_STRING: {
			cellvalue = cell.getStringCellValue().trim();
			break;
		}

		default:
			cellvalue = "";
		}
		cellvalue = cellvalue.replaceAll(" ", "");
		if (cellvalue.indexOf('.') > 0)
			cellvalue = cellvalue.substring(0, cellvalue.indexOf('.'));

		return cellvalue;
	}

	/**
	 * 
	 * 列表查询
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
	public ActionForward performGetT07_OBJ_RULE_CHECKList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_obj_ruleList = new ArrayList();
		String pageInfo = "";
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		try {
			T07_OBJ_RULEActionForm form = (T07_OBJ_RULEActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			request.getSession().setAttribute("intPage", intPage + "");// 把页码放入，方便其他返回使用
			// 客户类型
//			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
//					party_class_cdMap, null, true));
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true); //客户类型
			request.setAttribute("party_class_str", party_class_str);

//			LinkedHashMap list_typeMap = cm.getMapFromCache("list_type2");
//			request.setAttribute("list_typeMap", this.getOptionsListByMap(
//					list_typeMap, null, false));
			if(form.getList_type() == null || "".equals(form.getList_type()))
				form.setList_type("1");
			String list_type_str=cm.getMapFromCacheToStr("list_type2", "list_type", form.getList_type(),"", false); //客户类型
			request.setAttribute("list_type_str", list_type_str);

			// 查询排序
			LinkedHashMap listsearch_typeMap = cm
					.getMapFromCache("listsearch_type");
			request.setAttribute("listsearch_typeMap", this
					.getOptionsListByMap(listsearch_typeMap, null, true));
			// 是否启用

			//
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			if ("1".equals(t87_sysparaMap.get("404"))) {  //包含审核环节
				String checkflag = request.getParameter("checkflag"); // 是否为审核操作
//				form.setCheckflag(checkflag);
				if (checkflag != null && !checkflag.equals("")
						&& checkflag.equals("check0")) {
					// 审核状态
					TreeMap noischeckforpartyMap = new TreeMap();
					noischeckforpartyMap.put("2", "待审核");
					noischeckforpartyMap.put("3", "审核未通过");
					request.setAttribute("ischeckforpartyMap", this.getOptionsListByMap(noischeckforpartyMap, null, true));
					form.setCheckflag("0");
				} else {
					// 审批状态
					TreeMap noischeckforpartyMap = new TreeMap();
					noischeckforpartyMap.put("4", "待审批");
					noischeckforpartyMap.put("3", "审核未通过");
					noischeckforpartyMap.put("1", "审批通过");
					request.setAttribute("ischeckforpartyMap", this.getOptionsListByMap(noischeckforpartyMap, null, true));
					form.setCheckflag("1");
				}
				request.setAttribute("checkflag", "0");
			} else {  //不包含审核环节
				// 审批状态
				LinkedHashMap ischeckforpartyMap = cm
						.getMapFromCache("ischeckforparty");
				request.setAttribute("ischeckforpartyMap", this
						.getOptionsListByMap(ischeckforpartyMap, null, true));
			}

			// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
			request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
					null, true));

			// 获取用户登录信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();

			// 新的查询
			if (newsearchflag.equals("1")) {
				MyBeanUtils.copyBean2Bean(t07_obj_rule, form);
				t07_obj_rule.setOrgankeystr(auth.getOrganstr());
				if (form.getOrgankey() != null
						&& !"".equals(form.getOrgankey().trim())) {
					t07_obj_rule.setOrgankey(form.getOrgankey());
				}
				if (form.getParty_class_cd() != null
						&& !"".equals(form.getParty_class_cd().trim())) {
					t07_obj_rule.setParty_class_cd(form.getParty_class_cd());
				}
				if (form.getObj_name() != null
						&& !"".equals(form.getObj_name().trim())) {
					t07_obj_rule.setObj_name("%" + form.getObj_name() + "%");
				}
				if (form.getParty_id() != null
						&& !"".equals(form.getParty_id().trim())) {
					t07_obj_rule.setParty_id(form.getParty_id());
				}
				if (t07_obj_rule.getListsearch_type() != null
						&& !"".equals(form.getListsearch_type().trim())) {
					t07_obj_rule.setListsearch_type(form.getListsearch_type());
				}
				if (form.getFashion() != null
						&& !"".equals(form.getFashion().trim())) {
					t07_obj_rule.setFashion(form.getFashion());
				}
				// 日期型数据的转换
				if (form.getCreate_dt_disp() != null
						&& !"".equals(form.getCreate_dt_disp())) {
					t07_obj_rule.setCreate_dt(DateUtils.stringToDateShort(form
							.getCreate_dt_disp()));
				}
				if (form.getCreate1_dt_disp() != null
						&& !"".equals(form.getCreate1_dt_disp())) {
					Date date = DateUtils.stringToDateShort(form
							.getCreate1_dt_disp());
					DateUtils d = new DateUtils();
					t07_obj_rule.setCreate1_dt(date);
				}
				session.setAttribute("t07_obj_ruleSearchObj", t07_obj_rule);
			} else {// 翻页
				t07_obj_rule = (T07_OBJ_RULE) session
						.getAttribute("t07_obj_ruleSearchObj");
			}
			if (!newsearchflag.equals("2")) {
				if (t07_obj_rule == null) {
					t07_obj_rule = new T07_OBJ_RULE();
				}

				if (t07_obj_rule.getList_type() != null
						&& (t07_obj_rule.getList_type().equals("2")
								|| t07_obj_rule.getList_type().equals("3") || t07_obj_rule
								.getList_type().equals("4"))) {
					if (t07_obj_rule.getList_type().equals("2")) {
						t07_obj_rule.setTablename("t07_blacklist");
					} else if (t07_obj_rule.getList_type().equals("3")) {
						t07_obj_rule.setTablename("t07_greylist_info");
					} else if (t07_obj_rule.getList_type().equals("4")) {
						t07_obj_rule.setTablename("t07_stafflist_info");
					}
					t07_obj_ruleList = t07_obj_ruleDAO
							.getT07_OBJ_RULE_blackList(sqlMap, t07_obj_rule,
									this.getStartRec(intPage), this
											.getIntPageSize());
					int totalRow = t07_obj_ruleDAO
							.getT07_OBJ_RULEList_blackCount(sqlMap,
									t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				} else {
					t07_obj_ruleList = t07_obj_ruleDAO.getT07_OBJ_RULEList(
							sqlMap, t07_obj_rule, this.getStartRec(intPage),
							this.getIntPageSize());
					int totalRow = t07_obj_ruleDAO.getT07_OBJ_RULEListCount(
							sqlMap, t07_obj_rule);
					String url = request.getContextPath() + "/report"
							+ actionMapping.getPath() + ".do";
					pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_obj_ruleList", t07_obj_ruleList);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * 
	 * 审核操作
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
	public ActionForward performModifyT07_OBJ_RULEDo_check0(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO) context
				.getBean("t07_tpbcruleDAO");
		T07_pbcrule t07_pbcrule = new T07_pbcrule();
		ArrayList t07_pbcruleList = new ArrayList();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			String[] party_ids = request.getParameterValues("selectedPartyId");
			String ischeck = request.getParameter("is_check");// 是否通过
			// yes：通过，no：不通过
			//只考虑黑白名单
			String isblack = request.getParameter("list_type");
			if (isblack.equals("1")) { //white
				if ("yes".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule = t07_obj_ruleDAO.getT07_OBJ_RULEDisp(
								sqlMap, t07_obj_rule);
						
							t07_obj_rule.setIscheck("4");  //添加待审批
							t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
							t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
							
							t07_obj_ruleDAO.modifyT07_OBJ_RULE_ischeck0(sqlMap,t07_obj_rule);
					}
				} else if ("no".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
							t07_obj_rule.setIscheck("3"); //审核不通过
							t07_obj_rule.setIsuse("1");
							t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
							t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
							t07_obj_ruleDAO.modifyT07_OBJ_RULE_ischeckaddno(sqlMap, t07_obj_rule);
					}
				}
			} else if (isblack.equals("2")) { //black
				if ("yes".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule.setTablename("t07_blacklist");
							t07_obj_rule.setIscheck("4");  //添加待审批
							t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
							t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
							t07_obj_ruleDAO.modifyT07_OBJ_RULE_black_ischeck0(sqlMap, t07_obj_rule);
					}
				} else if ("no".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule.setTablename("t07_blacklist");
							t07_obj_rule = t07_obj_ruleDAO
									.getT07_OBJ_RULE_blackDisp(sqlMap, party_id);
							t07_obj_rule.setParty_id(party_id);
							t07_obj_rule.setTablename("t07_blacklist");
							t07_obj_rule.setIscheck("3");  //审核不通过
							t07_obj_rule.setIsuse("1");
							t07_obj_rule.setModify_user(auth.getT00_user().getUsername());
							t07_obj_rule.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
							t07_obj_ruleDAO.modifyT07_OBJ_RULE_black_ischeck(sqlMap, t07_obj_rule);
					}
				}

			}

			sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
		// return new
		// ActionForward("/listmanager/t07_obj_rule_list.do?intPage="+request.getSession().getAttribute("intPage"));
	}

	/**
	 * 
	 * 审核操作 孙日朋 2009-6-26
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
	public ActionForward performModifyT07_OBJ_RULEDo_check(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_OBJ_RULEDAO t07_obj_ruleDAO = (T07_OBJ_RULEDAO) context
				.getBean("t07_obj_ruleDAO");
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();
		T07_pbcruleDAO t07_tpbcruleDAO = (T07_pbcruleDAO) context
				.getBean("t07_tpbcruleDAO");
		ArrayList t07_pbcruleList = new ArrayList();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			String[] party_ids = request.getParameterValues("selectedPartyId");
			String ischeck = request.getParameter("is_check");// 是否通过
			// yes：通过，no：不通过
			String isblack = request.getParameter("list_type");

			if (isblack.equals("2")) { // black
				if ("yes".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule.setTablename("t07_blacklist");
						t07_obj_rule.setIscheck("1");
						t07_obj_rule.setIsuse("0");
						t07_obj_rule.setModify_user(auth.getT00_user()
								.getUsername());
						t07_obj_rule.setModify_dt(DateUtils
								.stringToDateShort(DateUtils.getCurrTime()));
						t07_obj_ruleDAO.modifyT07_OBJ_RULE_black_ischeck(
								sqlMap, t07_obj_rule);
					}
				} else if ("no".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule.setTablename("t07_blacklist");
						t07_obj_rule = t07_obj_ruleDAO
								.getT07_OBJ_RULE_blackDisp(sqlMap, party_id);
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule.setTablename("t07_blacklist");
						t07_obj_rule.setIscheck("5");
						t07_obj_rule.setIsuse("0");
						t07_obj_rule.setModify_user(auth.getT00_user()
								.getUsername());
						t07_obj_rule.setModify_dt(DateUtils
								.stringToDateShort(DateUtils.getCurrTime()));
						t07_obj_ruleDAO.modifyT07_OBJ_RULE_black_ischeck(
								sqlMap, t07_obj_rule);
					}
				}

			}
			
			
			if (isblack.equals("1")) {
				if ("yes".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);
						t07_obj_rule = t07_obj_ruleDAO.getT07_OBJ_RULEDisp(
								sqlMap, t07_obj_rule);
							t07_obj_rule.setIscheck("1");
							t07_obj_rule.setIsuse("0"); // 启用
							t07_obj_rule.setModify_user(auth.getT00_user()
									.getUsername());
							t07_obj_rule
									.setModify_dt(DateUtils
											.stringToDateShort(DateUtils
													.getCurrTime()));
							t07_obj_ruleDAO.modifyT07_OBJ_RULE_ischeck(sqlMap,
									t07_obj_rule);

							t07_obj_rule.setPbc_type_cd(t07_obj_rule
									.getRule_type());
							if ("3".equals(t07_obj_rule.getRule_type())) {
								t07_obj_rule.setPbc_type_cd("1");
								t07_obj_rule.setPbc_cd("2");
							}
							
							
							// 删除入行规则表中记录
							t07_obj_ruleDAO.deleteT07_OBJ_RULES(sqlMap,
									t07_obj_rule.getParty_id());
							
							

								int rows = t07_obj_ruleDAO.insertT07_OBJ_RULES(
										sqlMap, t07_obj_rule);
								if (rows <= 0) {
									throw new Exception("");
								}
							}
					}
				else if ("no".equals(ischeck)) {
					for (int i = 0; party_ids != null && i < party_ids.length; i++) {
						String[] partyids = party_ids[i].split("-");
						String party_id = (String) partyids[0];
						String checkid = (String) partyids[1];

						t07_obj_rule = new T07_OBJ_RULE();
						t07_obj_rule.setParty_id(party_id);

						t07_obj_rule.setIscheck("5");
						t07_obj_rule.setIsuse("0");
						t07_obj_rule.setModify_user(auth.getT00_user()
								.getUsername());
						t07_obj_rule.setModify_dt(DateUtils
								.stringToDateShort(DateUtils.getCurrTime()));
						t07_obj_ruleDAO.modifyT07_OBJ_RULE_ischeckaddno(sqlMap,
								t07_obj_rule);
					}
				}
			}
			sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
		// return new
		// ActionForward("/listmanager/t07_obj_rule_list.do?intPage="+request.getSession().getAttribute("intPage"));
	}

}
