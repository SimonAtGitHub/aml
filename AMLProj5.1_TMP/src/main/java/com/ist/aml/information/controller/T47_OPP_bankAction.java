package com.ist.aml.information.controller;
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
import java.util.LinkedHashMap;
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
import com.ist.aml.information.dao.T47_OPP_bankDAO;
import com.ist.aml.information.dto.T47_OPP_bank;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.util.Constans;
import com.ist.util.StringUtils;

public class T47_OPP_bankAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 0;
	private static Logger logger = LogUtils.getLogger(
			T47_OPP_bankAction.class.getName()).getLogger(Constans.LOGGERNAMEA);

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
		// 预处理myforward = this.preExecute(mapping, form, request,
		// response);//如预处理中强行跳出if("false".equals(request.getAttribute("goWayFlag")))
		// return myforward;//查询界面
		if ("searchT47_OPP_bank".equalsIgnoreCase(myaction)) {
			myforward = performSearchT47_OPP_bank(mapping, form, request,
					response);
		}
		// 查询结果
		else if ("getT47_Opp_bankList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_OPP_bankList(mapping, form, request,
					response);
		}
		// 案例中定位对方交易机构信息
		else if ("getT47case_Opp_bankList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47case_Opp_bankList(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT47_OPP_bank".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_OPP_bank(mapping, form, request, response);
		}
		// 添加动作
		else if ("addT47_OPP_bankDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_OPP_bankDo(mapping, form, request,
					response);
		}
		// 修改界面
		else if ("modifyT47_OPP_bank".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_OPP_bank(mapping, form, request,
					response);
		}
		// 修改界面1
		else if ("modify1T47_OPP_bank".equalsIgnoreCase(myaction)) {
			myforward = performModify1T47_OPP_bank(mapping, form, request,
					response);
		}
		// 修改动作
		else if ("modifyT47_OPP_bankDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_OPP_bankDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT47_OPP_bankDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT47_OPP_bankDo(mapping, form, request,
					response);
		}
		// 查询详细信息
		else if ("getT47_OPP_bankDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_OPP_bankDisp(mapping, form, request,
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
	public ActionForward performSearchT47_OPP_bank(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_OPP_bank t47_opp_bank = (T47_OPP_bank) session
				.getAttribute("t47_opp_bankSearchObj");
		if (t47_opp_bank == null) {
			t47_opp_bank = new T47_OPP_bank();
		}
		T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t47_opp_bank);
			// 模糊匹配，需要特殊处理一下
			// form.setRealname(StringUtils.replaceString(t47_opp_bank.getRealname(),
			// "%", ""));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	public ActionForward performGetT47_OPP_bankList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_opp_bankList = new ArrayList();
		String pageInfo = "";
		//
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
		try {
			LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
			request.setAttribute("organtypeMap", this.getOptionsListByMap(
					organtypeMap, null, true));
			//			交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("country");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国家
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap banksortMap = cm.getMapFromCache("banksort"); // 排序
			request.setAttribute("banksortMap", this.getOptionsListByMap(
					banksortMap, null, true));
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String sflag = StringUtils.nullObject2String(request
					.getParameter("sflag"));
			String newenterflag = StringUtils.nullObject2String(request
					.getParameter("newenterflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1") || newenterflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_opp_bank, form);
				// 模糊匹配，需要特殊处理一下
				if (form.getOpp_organkey_s() != null
						&& !"".equals(form.getOpp_organkey_s())) {
					t47_opp_bank.setUnionorgkey("%" + form.getOpp_organkey_s()
							+ "%");
				}
				if (!t47_opp_bank.getOpp_orgname_s().equals("")) {
					t47_opp_bank.setUnion_name("%"
							+ t47_opp_bank.getOpp_orgname_s() + "%");
				}
				if (form.getOpp_code_type_cd_s() != null) {
					t47_opp_bank.setUnion_type(form.getOpp_code_type_cd_s());
				}
				if (form.getOpp_country_s() != null) {
					t47_opp_bank.setCountry_cd(form.getOpp_country_s());
				}
				intPage = 0;
				t47_opp_bank.setIntPage("0");
				session.setAttribute("t47_opp_bankSearchObj", t47_opp_bank);
			} else {// 翻页
				t47_opp_bank = (T47_OPP_bank) session
						.getAttribute("t47_opp_bankSearchObj");
				intPage = StringUtils.nullObject2int(request
						.getParameter("intPage"), 0);
				if (intPage == 0) {// 如果是从其他页面返回（从其他页面返回时不能带inpPage参数）
					intPage = StringUtils.nullObject2int(t47_opp_bank
							.getIntPage());
				}
				t47_opp_bank.setIntPage("" + intPage);
				session.setAttribute("t47_opp_bankSearchObj", t47_opp_bank);
			}
			int totalRow = 0;
			if (!newenterflag.equals("1") || sflag.equals("1")) {
				t47_opp_bankList = t47_opp_bankDAO.getT87_UnionList(sqlMap,
						t47_opp_bank, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_opp_bankDAO.getT87_UnionListCount(sqlMap,
						t47_opp_bank);
			}
			String url = request.getContextPath() + "/information"
					+ actionMapping.getPath() + ".do?sflag=1";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_opp_bankList", t47_opp_bankList);
		//
		return actionMapping.findForward("success");
	}

	public ActionForward performGetT47case_Opp_bankList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_opp_bankList = new ArrayList();
		String pageInfo = "";
		//
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
		String newflag = StringUtils.nullObject2String(request
				.getParameter("newflag"));
		try {
			LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
			request.setAttribute("organtypeMap", this.getOptionsListByMap(
					organtypeMap, null, true));
			//			交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国家
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String sflag = StringUtils.nullObject2String(request
					.getParameter("sflag"));

			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_opp_bank, form);
				// 模糊匹配，需要特殊处理一下

				if (form.getOpp_organkey_s() != null
						&& !"".equals(form.getOpp_organkey_s())) {
					t47_opp_bank.setUnionorgkey("%" + form.getOpp_organkey_s()
							+ "%");
				}
				if (!t47_opp_bank.getOpp_orgname_s().equals("")) {
					t47_opp_bank.setUnion_name("%"
							+ t47_opp_bank.getOpp_orgname_s() + "%");
				}
				if (form.getOpp_code_type_cd_s() != null) {
					t47_opp_bank.setUnion_type(form.getOpp_code_type_cd_s());
				}
				if (form.getOpp_country_s() != null) {
					t47_opp_bank.setCountry_cd(form.getOpp_country_s());
				}
				session.setAttribute("t47_opp_bankSearchObj_1", t47_opp_bank);
			} else {// 翻页
				t47_opp_bank = (T47_OPP_bank) session
						.getAttribute("t47_opp_bankSearchObj_1");
			}
			int totalRow = 0;
			if (newsearchflag.equals("1") || sflag.equals("1")) {
				t47_opp_bankList = t47_opp_bankDAO.getT47_OPP_bankList1(sqlMap,
						t47_opp_bank, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_opp_bankDAO.getT47_OPP_bankListCount(sqlMap,
						t47_opp_bank);
			}
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do?sflag=1";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_opp_bankList", t47_opp_bankList);
		request.setAttribute("newflag", newflag);
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
	public ActionForward performAddT47_OPP_bank(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		LinkedHashMap organtypeMap = cm.getMapFromCache("organ_type"); // 金融机构类型
		request.setAttribute("organtypeMap", this.getOptionsListByMap(
				organtypeMap, null, true));
		//		交易国家
//		LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
//		request.setAttribute("nationalityMap", this.getOptionsListByMap(
//				nationalityMap, null, true));
		LinkedHashMap countryMap = cm.getMapFromCache("nationality"); // 国家信息
		request.setAttribute("countryMap", this.getOptionsListByMap(countryMap,
				null, true));
		LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
		request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
				null, true));
		ArrayList areaList = cm.getListFromCache("getArea_forall");
		request.setAttribute("areaList", areaList);

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
	public ActionForward performAddT47_OPP_bankDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
		boolean isSucc = false;
		try {
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_opp_bank, form);
			T47_OPP_bank opp_bank = new T47_OPP_bank();
			opp_bank.setUnionorgkey(form.getUnionorgkey());
			//opp_bank.setUnion_type(form.getUnion_type());
			T47_OPP_bank bank = t47_opp_bankDAO.getT87_UnionDisp(sqlMap,
					opp_bank);
			if (!bank.getUnionorgkey().equals("")) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"此金融机构存在"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");

			} else {

				t47_opp_bank.setOpp_organkey(form.getUnionorgkey());
				if (!form.getCountry_cd().equals("CHN")) {//外国
					t47_opp_bank.setCity_cd("000000");
				} else {
					if (form.getOpp_area().equals("-1")) {//中国
						if (form.getOpp_area2().equals("-1")) {
							t47_opp_bank.setCity_cd(form.getOpp_area1());//如果二、三级都空则为第一级
						} else {
							t47_opp_bank.setCity_cd(form.getOpp_area2());//如果三级都空则为第二级
						}
					} else
						t47_opp_bank.setCity_cd(form.getOpp_area());
				}
				int rows = t47_opp_bankDAO.insertT847_Union(sqlMap,
						t47_opp_bank);

			}

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
	public ActionForward performModifyT47_OPP_bank(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank;
		try {
			LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
			request.setAttribute("organtypeMap", this.getOptionsListByMap(
					organtypeMap, null, true));
			//			交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			LinkedHashMap countryMap = cm.getMapFromCache("nationality"); // 国家信息
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			ArrayList areaList = cm.getListFromCache("getArea_forall");
			request.setAttribute("areaList", areaList);
			LinkedHashMap up_areaMap = cm.getMapFromCache("areaid"); // 上级省信息
			request.setAttribute("up_areaMap", this.getOptionsListByMap(
					up_areaMap, null, true));
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			String[] opp_organkeys = form.getOpp_organkeys();
			T47_OPP_bank opp_bank = new T47_OPP_bank();

			opp_bank.setUnionorgkey(opp_organkeys[0].substring(0,
					opp_organkeys[0].indexOf(",")));
			opp_bank.setUnion_type(opp_organkeys[0].substring(opp_organkeys[0]
					.indexOf(",") + 1));
			t47_opp_bank = t47_opp_bankDAO.getT87_UnionDisp(sqlMap, opp_bank);
			if (t47_opp_bank.getUnion_type() != null) {
				t47_opp_bank.setOpp_code_type_cd_disp((String) organtypeMap
						.get(t47_opp_bank.getUnion_type()));
			}

			MyBeanUtils.copyBean2Bean(form, t47_opp_bank);
			form.setUnion_type(t47_opp_bank.getUnion_type());
			String areakey = t47_opp_bank.getCity_cd();// 取出第一＼二＼三级地区
			if (areakey != null && !"".equals(areakey) && !areakey.equals("-1")
					&& !areakey.equals("000000")) {
				if (!areakey.substring(4).equals("00")) {//三级
					String area2 = (String) up_areaMap.get(areakey);
					String area1 = (String) up_areaMap.get(area2);
					form.setOpp_area1(area1);
					request.setAttribute("area2", area2);
				} else if ((areakey.substring(4).equals("00") || areakey
						.substring(3).equals("000"))
						&& !areakey.substring(2).equals("0000")) {//二级
					String area1 = (String) up_areaMap.get(areakey);
					form.setOpp_area1(area1);
					request.setAttribute("area2", areakey);
					areakey = "-1";
				} else if (areakey.substring(2).equals("0000")
						|| areakey.equals("500000")) {//一级
					form.setOpp_area1(areakey);
					request.setAttribute("area2", "-1");
					areakey = "-1";
				}
			}
			request.setAttribute("areakey", areakey);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request
				.setAttribute("t47_opp_bankname", t47_opp_bank
						.getOpp_organkey());
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
	public ActionForward performModify1T47_OPP_bank(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank;
		try {
			LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
			request.setAttribute("organtypeMap", this.getOptionsListByMap(
					organtypeMap, null, true));
			//			交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国家信息
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			ArrayList areaList = cm.getListFromCache("getArea_forall");
			request.setAttribute("areaList", areaList);
			LinkedHashMap up_areaMap = cm.getMapFromCache("areaid"); // 上级省信息
			request.setAttribute("up_areaMap", this.getOptionsListByMap(
					up_areaMap, null, true));
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			T47_OPP_bank opp_bank = new T47_OPP_bank();
			opp_bank.setUnionorgkey(form.getUnionorgkey());
			opp_bank.setUnion_type(form.getUnion_type());
			t47_opp_bank = t47_opp_bankDAO.getT87_UnionDisp(sqlMap, opp_bank);
			MyBeanUtils.copyBean2Bean(form, t47_opp_bank);
			String areakey = t47_opp_bank.getCity_cd();// 取出第一＼二＼三级地区
			if (areakey != null && !"".equals(areakey) && !areakey.equals("-1")
					&& !areakey.equals("000000")) {
				if (!areakey.substring(4).equals("00")) {//三级
					String area2 = (String) up_areaMap.get(areakey);
					String area1 = (String) up_areaMap.get(area2);
					form.setOpp_area1(area1);
					request.setAttribute("area2", area2);
				} else if ((areakey.substring(4).equals("00") || areakey
						.substring(3).equals("000"))
						&& !areakey.substring(2).equals("0000")) {//二级
					String area1 = (String) up_areaMap.get(areakey);
					form.setOpp_area1(area1);
					request.setAttribute("area2", areakey);
					areakey = "-1";
				} else if (areakey.substring(2).equals("0000")
						|| areakey.equals("500000")) {//一级
					form.setOpp_area1(areakey);
					request.setAttribute("area2", "-1");
					areakey = "-1";
				}
			}
			request.setAttribute("areakey", areakey);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request
				.setAttribute("t47_opp_bankname", t47_opp_bank
						.getOpp_organkey());
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
	public ActionForward performModifyT47_OPP_bankDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
		try {
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			System.out.println("===================================Union_type:"
					+ form.getUnion_type());
			MyBeanUtils.copyBean2Bean(t47_opp_bank, form);
			if (!form.getCountry_cd().equals("CHN")) {
				t47_opp_bank.setCity_cd("000000");
			} else {
				if (form.getOpp_area().equals("-1")) {//中国
					if (form.getOpp_area2().equals("-1")) {
						t47_opp_bank.setCity_cd(form.getOpp_area1());//如果二、三级都空则为第一级
					} else {
						t47_opp_bank.setCity_cd(form.getOpp_area2());//如果三级都空则为第二级
					}
				} else
					t47_opp_bank.setCity_cd(form.getOpp_area());
			}

			int rows = t47_opp_bankDAO.modifyT87_Union(sqlMap, t47_opp_bank);
			if (rows <= 0) {
				throw new Exception("");
			}
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
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
	public ActionForward performDeleteT47_OPP_bankDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		try {
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			String[] opp_organkeys = form.getOpp_organkeys();
			for (int i = 0; i < opp_organkeys.length; i++) {
				String opp_organkey = opp_organkeys[i].substring(0,
						opp_organkeys[i].indexOf(","));
				String opp_organtype = opp_organkeys[i]
						.substring(opp_organkeys[i].indexOf(",") + 1);
				T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
				t47_opp_bank.setUnionorgkey(opp_organkey);
				t47_opp_bank.setUnion_type(opp_organtype);
				int rows = t47_opp_bankDAO
						.deleteT87_Union(sqlMap, t47_opp_bank);
			}

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
	public ActionForward performGetT47_OPP_bankDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_OPP_bankDAO t47_opp_bankDAO = (T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_OPP_bank t47_opp_bank;
		try {
			T47_OPP_bankActionForm form = (T47_OPP_bankActionForm) actionForm;
			String opp_organkey = form.getOpp_organkey();
			t47_opp_bank = t47_opp_bankDAO.getT47_OPP_bankDisp(sqlMap,
					opp_organkey);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_opp_bank", t47_opp_bank);
		//
		return actionMapping.findForward("success");
	}
}
