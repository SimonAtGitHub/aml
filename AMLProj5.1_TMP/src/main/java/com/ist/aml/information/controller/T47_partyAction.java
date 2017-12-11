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

package com.ist.aml.information.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
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
import org.apache.struts.upload.FormFile;

import com.ist.aml.information.dao.T47_Opp_infoDAO;
import com.ist.aml.information.dto.T47_Opp_info;
import com.ist.aml.inves.dao.T47_corporationDAO;
import com.ist.aml.inves.dao.T47_individualDAO;
import com.ist.aml.inves.dto.T47_corporation;
import com.ist.aml.inves.dto.T47_individual;
import com.ist.aml.report.bo.CountryComparator;
import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.util.Constans;

public class T47_partyAction extends BaseAction {

	private static final long serialVersionUID = -6839709577564579408L;

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
		// 查询界面
		if ("searchT47_party".equalsIgnoreCase(myaction)) {
			myforward = performSearchT47_party(mapping, form, request, response);
		}
		// 查询结果
		else if ("getT47_partyList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_partyList(mapping, form, request,
					response);
		}
		// 查询详细信息
		else if ("getT47_partyDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_partyDisp(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT47_party".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_party(mapping, form, request, response);
		}
		// 添加动作
		else if ("addT47_partyDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_partyDo(mapping, form, request, response);
		}
		// 对私客户修改界面
		else if ("modifyT47_party".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_party(mapping, form, request, response);
		}
		// 对公客户修改界面
		else if ("modify1T47_party".equalsIgnoreCase(myaction)) {
			myforward = performModify1T47_party(mapping, form, request,
					response);
		}
		// 对私客户修改动作
		else if ("modifyT47_partyDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_partyDo(mapping, form, request,
					response);
		}
		// 对公客户修改动作
		else if ("modify1T47_partyDo".equalsIgnoreCase(myaction)) {
			myforward = performModify1T47_partyDo(mapping, form, request,
					response);
		}
		
		else if ("T07_modify_partyorganList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_modify_partyorganList(mapping, form, request,
					response);
		}
		else if ("addT07_modify_partyorgan".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_modify_partyorgan(mapping, form, request, response);
		}
		else if ("addT07_modify_partyorganDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_modify_partyorganDo(mapping, form, request,
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
	public ActionForward performGetT47_partyDisp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party  t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String party_id = form.getParty_id();
			t47_party = t47_partyDAO.getT47_partyDisp(sqlMap, party_id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_party", t47_party);
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
	public ActionForward performSearchT47_party(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_party t47_party = (T47_party) session
				.getAttribute("t47_partySearchObj");
		if (t47_party == null) {
			t47_party = new T47_party();
		}
		T47_partyActionForm form = (T47_partyActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t47_party);

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
	public ActionForward performGetT47_partyList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		ArrayList t47_partyList = new ArrayList();
		String pageInfo = "";
		T47_partyDAO t47_partyDAO = (T47_partyDAO) context
				.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();

		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			// 获取登录用户信息
			AuthBean authBean = new AuthBean();
			Authorization auther = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auther = authBean.getAuthToken();
			auther = authBean.getAuthToken();
			String organstr = auther.getOrganstr();
			// 客户类型
			LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
			request.setAttribute("party_classMap", this.getOptionsListByMap(
					party_classMap, null, true));
			// 客户状态
			LinkedHashMap party_statusMap = cm.getMapFromCache("clientstatus");
			request.setAttribute("party_statusMap", this.getOptionsListByMap(
					party_statusMap, null, true));
			// 客户证件类型
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));

			LinkedHashMap organMap = cm.getMapFromCache("organ");
			request.setAttribute("organMap", this.getOptionsListByMap(organMap,
					null, true));
			// 客户排序
			LinkedHashMap customerorderMap = cm
					.getMapFromCache("customerorder");
			request.setAttribute("customerorderMap", this.getOptionsListByMap(
					customerorderMap, null, true));

			String newenterflag = StringUtils.nullObject2String(request
					.getParameter("newenterflag"));
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);

			if (newsearchflag.equals("1") || newenterflag.equals("1")) {// 新的查询
				
				MyBeanUtils.copyBean2Bean(t47_party, form);
				if (t47_party.getParty_class_cd_s() != null) {
					t47_party
							.setParty_class_cd(t47_party.getParty_class_cd_s());
				}
				if (t47_party.getParty_chn_name_s() != null) {
					t47_party
							.setParty_chn_name(t47_party.getParty_chn_name_s());
				}
				if (t47_party.getCard_no_s() != null) {
					t47_party.setCard_no(t47_party.getCard_no_s());
				}
				if (t47_party.getCard_type_s() != null) {
					t47_party.setCard_type(t47_party.getCard_type_s());
				}
				
				if (form.getParty_id_s() != null) {
					t47_party.setParty_id(form.getParty_id_s());
				}
				logger.debug("=================================getParty_id:"
								+ t47_party.getParty_id());
				// 模糊匹配，需要特殊处理一下
				if (!t47_party.getParty_chn_name().equals("")) {
					t47_party.setParty_chn_name(t47_party.getParty_chn_name());
					
				}
				session.setAttribute("t47_partySearchObj", t47_party);
			} else if (newsearchflag.equals("0")) {// 如果从左侧菜单进入，则直接进行下一步处理
				// 暂时什么都不做
			} else {// 翻页
				t47_party = (T47_party) session
						.getAttribute("t47_partySearchObj");
				
			}
			
			// 组织用户所属的机构ID

			Authorization auth = authBean.getAuthToken();
			String org_id = auth.getOrganstr();
			t47_party.setOrgan_id(org_id);
			// end 组织用户所属的机构ID
			t47_party.setOrgan_id(organstr);
			int totalRow = 0;
			if (!newsearchflag.equals("0")) {// 按条件查询的情况
				t47_partyList = t47_partyDAO.getT47_customerList(sqlMap,
						t47_party, this.getStartRec(intPage), this
								.getIntPageSize());
				totalRow = t47_partyDAO.getT47_customerListCount(sqlMap,
						t47_party);
				String url = request.getContextPath() + "/information"
				+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			} 
			MyBeanUtils.copyBean2Bean(form,t47_party);
			

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_partyList", t47_partyList);
		//
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
	public ActionForward performAddT47_party(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		String party_class_cd = StringUtils.nullObject2String(request
				.getParameter("party_class_cd"));
		request.setAttribute("party_class_cd", party_class_cd);
		//金融机构类型
		LinkedHashMap organtypeMap = cm.getMapFromCache("organ_type"); 
		request.setAttribute("organtypeMap", this.getOptionsListByMap(
				organtypeMap, null, true));
		
		// AML2对公客户类型
		LinkedHashMap pbc_cttp2Map = cm.getMapFromCache("pbc_cttp2");
		request.setAttribute("pbc_cttp2Map", this.getOptionsListByMap(
				pbc_cttp2Map, null, true));
		
		// 对公证件类型
		LinkedHashMap card_type_cMap = cm.getMapFromCache("card_type_c");
		request.setAttribute("card_type_cMap", this.getOptionsListByMap(
				card_type_cMap, null, true));
		
		//对私证件类型
		LinkedHashMap card_type_iMap = cm.getMapFromCache("card_type_i");
		request.setAttribute("card_type_iMap", this.getOptionsListByMap(
				card_type_iMap, null, true));
		
		// 代办人证件类型
		LinkedHashMap agent_typeMap = cm.getMapFromCache("BITP");
		request.setAttribute("agent_typeMap", this.getOptionsListByMap(
				agent_typeMap, null, true));
		
		// 交易国家
		LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
		request.setAttribute("nationalityMap", this.getOptionsListByMap(
				nationalityMap, null, true));
		
		// 国籍
		Map map = cm.getMapFromCache("country");
		LinkedHashMap country_map = new LinkedHashMap();
		country_map.putAll(map);
		LinkedHashMap countryMap = country_map;
		request.setAttribute("countryMap", this.getOptionsListByMap(countryMap,
				null, true));
		
		// 对公行业
		LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c");
		request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(
				pbc_ctvc_cMap, null, true));

		// AML1公司类型
		LinkedHashMap aml1_corpMap = cm.getMapFromCache("aml1_corp");
		request.setAttribute("aml1_corpMap", this.getOptionsListByMap(
				aml1_corpMap, null, true));
		
		// 注册资金币种
		LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");
		request.setAttribute("pbc_currencyMap", this.getOptionsListByMap(
				pbc_currencyMap, null, true));
		
		// 对私客户类型
		LinkedHashMap pbc_cttp1Map = cm.getMapFromCache("pbc_cttp1");
		request.setAttribute("pbc_cttp1Map", this.getOptionsListByMap(
				pbc_cttp1Map, null, true));
		
		// 对私客户职业
		LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i");
		request.setAttribute("pbc_ctvc_iMap", this.getOptionsListByMap(
				pbc_ctvc_iMap, null, true));
		
		// 对私系统客户类型
		LinkedHashMap aml1_indiMap = cm.getMapFromCache("aml1_indi");
		request.setAttribute("aml1_indiMap", this.getOptionsListByMap(
				aml1_indiMap, null, true));
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
	public ActionForward performAddT47_partyDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		T47_corporationDAO t47_corporationDAO = (T47_corporationDAO)context.getBean("t47_corporationDAO");
		T47_individualDAO T47_individualDAO = (T47_individualDAO)context.getBean("t47_individualDAO");
		T47_corporation corporation = new T47_corporation();
		T47_individual individual = new T47_individual();
		boolean isSucc = false;
		try {
			String party_class_cd = StringUtils.nullObject2String(request
					.getParameter("party_class_cd"));
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_party, form);
			t47_party.setParty_id("MP"
					+ this.getSequenceNextVal("t47_partykey_mp"));
			t47_party.setHost_cust_id(t47_party.getParty_id());
			t47_party.setParty_class_cd(party_class_cd);
			t47_party.setObjorgankey(t47_party.getOrgankey());
			if (t47_party.getCard_type().equals("19")
					|| t47_party.getCard_type().equals("29"))
				t47_party.setCard_type(t47_party.getCard_type()
						+ t47_party.getCard_type_inf());
			if (t47_party.getLegal_card_type().equals("19")
					|| t47_party.getLegal_card_type().equals("29"))
				t47_party.setLegal_card_type(t47_party.getLegal_card_type()
						+ t47_party.getLegal_card_type_inf());
			int count = t47_partyDAO.checkT47_party(sqlMap, t47_party);
			if (count > 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"此客户已存在！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			int rows = t47_partyDAO.insertT47_party(sqlMap, t47_party);
			if (party_class_cd.equals("C")) {
				MyBeanUtils.copyBean2Bean(corporation, t47_party);
				if (corporation.getOrg_credit_vt_disp() != null && !"".equals(corporation.getOrg_credit_vt_disp())) {
					corporation.setOrg_credit_vt(DateUtils.stringToDateShort(corporation.getOrg_credit_vt_disp()));
				}
				int row1 = t47_corporationDAO.insertT47_corporation(sqlMap,corporation);
			}
			if (party_class_cd.equals("I")) {
				MyBeanUtils.copyBean2Bean(individual, t47_party);
				int row2 = T47_individualDAO.insertT47_individual(sqlMap,
						individual);
			}
			if (rows <= 0) {
				throw new Exception("");
			}
			sqlMap.commitTransaction();
			
			form.setParty_id_s(t47_party.getParty_id());
			request.setAttribute("party_id", t47_party.getParty_id());
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	public ActionForward performModifyT47_party(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party;

		try {
			// AML2客户类型
			LinkedHashMap pbc_cttp1Map = cm.getMapFromCache("pbc_cttp1");
			request.setAttribute("pbc_cttp1Map", this.getOptionsListByMap(
					pbc_cttp1Map, null, true));
			// 证件类型
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type_i");
			// cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			// 交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			// 国家
			Map map = cm.getMapFromCache("country");
			LinkedHashMap country_map = new LinkedHashMap();
			country_map.putAll(map);
			LinkedHashMap countryMap = country_map;
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			// 对私客户职业
			LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i");
			request.setAttribute("pbc_ctvc_iMap", this.getOptionsListByMap(
					pbc_ctvc_iMap, null, true));
			// AML1对私客户类型
			LinkedHashMap aml1_indiMap = cm.getMapFromCache("aml1_indi");
			request.setAttribute("aml1_indiMap", this.getOptionsListByMap(
					aml1_indiMap, null, true));
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String party_id = form.getParty_id();
			t47_party = t47_partyDAO.getT47_corporationDisp1(sqlMap, party_id);
			if (t47_party.getCard_type() != null
					&& !t47_party.getCard_type().equals("")) {
				String card_type08 = t47_party.getCard_type().substring(0, 2);
				String card_type_inf08 = t47_party.getCard_type().substring(2);
				t47_party.setCard_type(card_type08);
				t47_party.setCard_type_inf(card_type_inf08);
			}
			// 查询限制表的信息
			ArrayList List = cm.getListFromCache("getT07_party_restricModifyFlag_forall");

			T47_party t47_party1;
			for (int i = 0; i < List.size(); i++) {
				t47_party1 = (T47_party) List.get(i);
				// =========organkey归属机构
				if (t47_party1.getField_id().equals("organkey")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setOrgankey_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getOrgankey() == null) {
						t47_party.setOrgankey(t47_party1.getDefault_val());

					}
				}
				// =========party_chn_name 客户名称
				if (t47_party1.getField_id().equals("party_chn_name")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party
							.setParty_chn_name_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getParty_chn_name() == null) {
						t47_party
								.setParty_chn_name(t47_party1.getDefault_val());

					}
				}
				// =========card_type 证件类型
				if (t47_party1.getField_id().equals("card_type")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setCard_type_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCard_type() == null) {
						t47_party.setCard_type(t47_party1.getDefault_val());

					}
				}
				// =========host_cust_id 客户号
				if (t47_party1.getField_id().equals("host_cust_id")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setHost_cust_id_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getHost_cust_id() == null) {
						t47_party.setHost_cust_id(t47_party1.getDefault_val());

					}
				}
				// =========card_no 证件号码
				if (t47_party1.getField_id().equals("card_no")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setCard_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCard_no() == null) {
						t47_party.setCard_no(t47_party1.getDefault_val());

					}
				}

				// =========country_cd 国籍
				if (t47_party1.getField_id().equals("country_cd")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setCountry_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCountry_cd() == null) {
						t47_party.setCountry_cd(t47_party1.getDefault_val());

					}
				}

				// =========aml2_type_cd客户类型
				if (t47_party1.getField_id().equals("aml2_type_cd")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setAml2_type_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAml2_type_cd() == null) {
						t47_party.setAml2_type_cd(t47_party1.getDefault_val());

					}
				}
				// =========aml1_type_cd 客户类型
				if (t47_party1.getField_id().equals("aml1_type_cd")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setAml1_type_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAml1_type_cd() == null) {
						t47_party.setAml1_type_cd(t47_party1.getDefault_val());

					}
				}
				// =========addr1
				if (t47_party1.getField_id().equals("addr1")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setAddr1_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAddr1() == null) {
						t47_party.setAddr1(t47_party1.getDefault_val());

					}
				}
				// =========addr2
				if (t47_party1.getField_id().equals("addr2")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setAddr2_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAddr2() == null) {
						t47_party.setAddr2(t47_party1.getDefault_val());

					}

				}
				// =========cell_no
				if (t47_party1.getField_id().equals("cell_no")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setCell_no_flag(t47_party1.getModify_ind());

					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCell_no() == null) {
						t47_party.setCell_no(t47_party1.getDefault_val());

					}

				}
				// =========tel_no
				if (t47_party1.getField_id().equals("tel_no")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setTel_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getTel_no() == null) {
						t47_party.setTel_no(t47_party1.getDefault_val());

					}
				}
				// =========net_address
				if (t47_party1.getField_id().equals("net_address")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setNet_address_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getNet_address() == null) {
						t47_party.setNet_address(t47_party1.getDefault_val());

					}
				}
				// =========email_addr
				if (t47_party1.getField_id().equals("email_addr")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setEmail_addr_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getEmail_addr() == null) {
						t47_party.setEmail_addr(t47_party1.getDefault_val());

					}
				}
				// =========postalcode
				if (t47_party1.getField_id().equals("postalcode")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setPostalcode_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getPostalcode() == null) {
						t47_party.setPostalcode(t47_party1.getDefault_val());

					}
				}
				// =========occupation
				if (t47_party1.getField_id().equals("occupation")
						&& t47_party1.getParty_cd().equals("I")) {
					t47_party.setOccupation_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getOccupation() == null) {
						t47_party.setOccupation(t47_party1.getDefault_val());

					}
				}

			}
			System.out
					.println("==========================================Organkey_flag():"
							+ t47_party.getOrgankey_flag());
			MyBeanUtils.copyBean2Bean(form, t47_party);
			request.setAttribute("t47_party", t47_party);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request.setAttribute("t47_partyname", t47_party.getParty_id());
		return actionMapping.findForward("success");
	}

	public ActionForward performModify1T47_party(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();

		try {
			// AML2对公客户类型
			LinkedHashMap pbc_cttp2Map = cm.getMapFromCache("pbc_cttp2");
			request.setAttribute("pbc_cttp2Map", this.getOptionsListByMap(
					pbc_cttp2Map, null, true));
			// 证件类型
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type_c");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			// 证件类型
			LinkedHashMap agent_typeMap = cm.getMapFromCache("BITP");
			request.setAttribute("agent_typeMap", this.getOptionsListByMap(
					agent_typeMap, null, true));
			// 交易国家
			LinkedHashMap nationalityMap = cm.getMapFromCache("nationality");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			// 国家
			Map map = cm.getMapFromCache("country");
			LinkedHashMap country_map = new LinkedHashMap();
			country_map.putAll(map);
			LinkedHashMap countryMap = country_map;
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			// 对公行业
			LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c");
			request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(
					pbc_ctvc_cMap, null, true));

			// AML1对公客户类型
			LinkedHashMap aml1_corpMap = cm.getMapFromCache("aml1_corp");
			request.setAttribute("aml1_corpMap", this.getOptionsListByMap(
					aml1_corpMap, null, true));
			// 币种
			LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");
			request.setAttribute("pbc_currencyMap", this.getOptionsListByMap(
					pbc_currencyMap, null, true));
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			form.setParty_id(request.getParameter("party_id"));
			String party_id = form.getParty_id();

			t47_party = t47_partyDAO.getT47_corporationDisp(sqlMap, party_id);
			// 机构信用代码有效期
			if (t47_party.getOrg_credit_vt()!= null) {
				t47_party.setOrg_credit_vt_disp(DateUtils.dateToStringShort(t47_party.getOrg_credit_vt()));
			}

			ArrayList List = cm.getListFromCache("getT07_party_restricModifyFlag_forall");

			for (int i = 0; i < List.size(); i++) {

				T47_party t47_party1 = (T47_party) List.get(i);
				// =========organkey归属机构
				if (t47_party1.getField_id().equals("organkey")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setOrgankey_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getOrgankey() == null) {
						t47_party.setOrgankey(t47_party1.getDefault_val());

					}
				}
				// =========party_chn_name 客户名称
				if (t47_party1.getField_id().equals("party_chn_name")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party
							.setParty_chn_name_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getParty_chn_name() == null) {
						t47_party
								.setParty_chn_name(t47_party1.getDefault_val());

					}

				}
				// =========card_type 证件类型
				if (t47_party1.getField_id().equals("card_type")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setCard_type_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCard_type() == null) {
						t47_party.setCard_type(t47_party1.getDefault_val());

					}
				}
				// =========host_cust_id 客户号
				if (t47_party1.getField_id().equals("host_cust_id")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setHost_cust_id_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getHost_cust_id() == null) {
						t47_party.setHost_cust_id(t47_party1.getDefault_val());

					}
				}
				// =========card_no 证件号码
				if (t47_party1.getField_id().equals("card_no")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setCard_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCard_no() == null) {
						t47_party.setCard_no(t47_party1.getDefault_val());

					}
				}
				// =========country_cd 国籍
				if (t47_party1.getField_id().equals("country_cd")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setCountry_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCountry_cd() == null) {
						t47_party.setCountry_cd(t47_party1.getDefault_val());

					}
				}
				// =========aml2_type_cd客户类型
				if (t47_party1.getField_id().equals("aml2_type_cd")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setAml2_type_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAml2_type_cd() == null) {
						t47_party.setAml2_type_cd(t47_party1.getDefault_val());

					}
				}
				// =========aml1_type_cd 客户类型
				if (t47_party1.getField_id().equals("aml1_type_cd")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setAml1_type_cd_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAml1_type_cd() == null) {
						t47_party.setAml1_type_cd(t47_party1.getDefault_val());

					}
				}
				// =========addr1
				if (t47_party1.getField_id().equals("addr1")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setAddr1_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAddr1() == null) {
						t47_party.setAddr1(t47_party1.getDefault_val());

					}
				}
				// =========addr2
				if (t47_party1.getField_id().equals("addr2")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setAddr2_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getAddr2() == null) {
						t47_party.setAddr2(t47_party1.getDefault_val());

					}
				}
				// =========cell_no
				if (t47_party1.getField_id().equals("cell_no")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setCell_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getCell_no() == null) {
						t47_party.setCell_no(t47_party1.getDefault_val());

					}
				}
				// =========tel_no
				if (t47_party1.getField_id().equals("tel_no")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setTel_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getTel_no() == null) {
						t47_party.setTel_no(t47_party1.getDefault_val());

					}
				}
				// =========net_address
				if (t47_party1.getField_id().equals("net_address")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setNet_address_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getNet_address() == null) {
						t47_party.setNet_address(t47_party1.getDefault_val());

					}
				}
				// =========email_addr
				if (t47_party1.getField_id().equals("email_addr")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setEmail_addr_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getEmail_addr() == null) {
						t47_party.setEmail_addr(t47_party1.getDefault_val());

					}
				}
				// =========postalcode
				if (t47_party1.getField_id().equals("postalcode")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setPostalcode_flag(t47_party1.getModify_ind());

					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getPostalcode() == null) {
						t47_party.setPostalcode(t47_party1.getDefault_val());

					}
				}
				// =========industrykey
				if (t47_party1.getField_id().equals("industrykey")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setIndustrykey_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getIndustrykey() == null) {
						t47_party.setIndustrykey(t47_party1.getDefault_val());

					}
				}
				// =========enrol_fund_amt
				if (t47_party1.getField_id().equals("enrol_fund_amt")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party
							.setEnrol_fund_amt_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getEnrol_fund_amt() == null) {
						t47_party
								.setEnrol_fund_amt(t47_party1.getDefault_val());

					}
				}
				// =========legal_obj
				if (t47_party1.getField_id().equals("legal_obj")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setLegal_obj_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getLegal_obj() == null) {
						t47_party.setLegal_obj(t47_party1.getDefault_val());

					}
				}
				// =========legal_card_type
				if (t47_party1.getField_id().equals("legal_card_type")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setLegal_card_type_flag(t47_party1
							.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getLegal_card_type() == null) {
						t47_party.setLegal_card_type(t47_party1
								.getDefault_val());

					}
				}
				// =========legal_card_no
				if (t47_party1.getField_id().equals("legal_card_no")
						&& t47_party1.getParty_cd().equals("C")) {
					t47_party.setLegal_card_no_flag(t47_party1.getModify_ind());
					if (t47_party1.getModify_ind().equals("2")
							&& t47_party.getLegal_card_no() == null) {
						t47_party.setLegal_card_no(t47_party1.getDefault_val());

					}
				}

			}

			MyBeanUtils.copyBean2Bean(form, t47_party);
			form.setOrgan_name(t47_party.getOrganname());
			request.setAttribute("t47_party", t47_party);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		request.setAttribute("t47_partyname", t47_party.getParty_id());
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
	public ActionForward performModifyT47_partyDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;

			MyBeanUtils.copyBean2Bean(t47_party, form);
			if(t47_party.getCard_type()!=null&&t47_party.getCard_type().equals("19")){
				t47_party.setCard_type(t47_party.getCard_type()+t47_party.getCard_type_inf());
			}
			int rows = t47_partyDAO.modifyT47_client(sqlMap, t47_party);
			int row = t47_partyDAO.modifyT47_indi(sqlMap, t47_party);
			if ((rows <= 0) || (row <= 0)) {
				throw new Exception("");
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

	public ActionForward performModify1T47_partyDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_party, form);
			// t47_party.setModifydate( DateUtils.stringToDateShort(
			// form.getModifydate_disp() ) );
			//
			if (t47_party.getLegal_card_type()!=null&&t47_party.getLegal_card_type().equals("19"))
				t47_party.setLegal_card_type(t47_party.getLegal_card_type()
						+ t47_party.getLegal_card_type_inf());
			if(t47_party.getCard_type()!=null&&t47_party.getCard_type().equals("29")){
				t47_party.setCard_type(t47_party.getCard_type()+t47_party.getCard_type_inf());
			}
			if(t47_party.getOrg_credit_vt_disp()!=null && !t47_party.getOrg_credit_vt_disp().equals("")){
				t47_party.setOrg_credit_vt(DateUtils.stringToDateShort(t47_party.getOrg_credit_vt_disp()));
			}else{
				t47_party.setOrg_credit_vt(DateUtils.stringToDateShort("3000-12-31"));
			}
		    
			int rows = t47_partyDAO.modifyT47_client(sqlMap, t47_party);
			int row = t47_partyDAO.modifyT47_corp(sqlMap, t47_party);
			if ((rows <= 0) || (row <= 0)) {
				throw new Exception("");
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

	public ActionForward performGetT07_modify_partyorganList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_opp_infoList = new ArrayList();
		String pageInfo = "";
		//
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {

			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); //客户类型
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));
//			LinkedHashMap organMap = cm.getCodeTable2HashCatch("organ", true); //合并机构
//			request.setAttribute("organMap", this.getOptionsListByMap(
//					organMap, null, true));
//			LinkedHashMap opporganMap = cm.getCodeTable2HashCatch("organ", true); //被合并机构
//			request.setAttribute("opporganMap", this.getOptionsListByMap(
//					opporganMap, null, true));
//		
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
		
			
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);

			if (newsearchflag.equals("1")) {//新的查询
				MyBeanUtils.copyBean2Bean(t47_party, form);
				intPage = 0;
				t47_party.setIntPage("0"); //
				session.setAttribute("t07_modify_partyorganSearchObj", t47_party); //
			} else {//翻页
				t47_party = (T47_party) session
						.getAttribute("t07_modify_partyorganSearchObj");
				
			}
		
				t47_opp_infoList = t47_partyDAO.getT07_modify_partyorganList(sqlMap,
						t47_party, this.getStartRec(intPage), this
								.getIntPageSize());
				int	totalRow = t47_partyDAO.getT07_modify_partyorganCount(sqlMap,
						t47_party);
	
			String url = request.getContextPath() + "/information"
					+ actionMapping.getPath() + ".do";

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
		request.setAttribute("t47_opp_infoList", t47_opp_infoList);

		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_modify_partyorgan(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); //客户类型
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));

		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_modify_partyorganDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		HttpSession session = request.getSession();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_party,form);
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			//修改客户的归属机构
			int count=t47_partyDAO.modifyT47_party_organ(sqlMap, t47_party);
			String party_class_cd=StringUtils.null2String(form.getParty_class_cd());
			//修改对公账户的归属机构
			if(party_class_cd.equals("I")||party_class_cd.equals(""))
			count=t47_partyDAO.modifyT47_agreement_I(sqlMap, t47_party);
			//修改对私账户的归属机构
			if(party_class_cd.equals("C")||party_class_cd.equals(""))
				count=t47_partyDAO.modifyT47_agreement_C(sqlMap, t47_party);
			//修改贷款账户的归属机构
			count=t47_partyDAO.modifyT47_agreement_D(sqlMap, t47_party);
           
			//插入记录表
			t47_party.setParty_class_cd(party_class_cd);
			t47_party.setCreate_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			//当前登录用户
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String userName = auth.getT00_user().getUsername();
			t47_party.setCreate_user(userName);
			count=t47_partyDAO.insertT07_modify_partyorgan(sqlMap, t47_party);
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
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
	
}