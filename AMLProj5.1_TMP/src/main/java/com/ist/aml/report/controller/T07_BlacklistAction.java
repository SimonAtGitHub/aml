/**
 * 2009—6-29   孙日朋		创建
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

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
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

import com.ist.aml.information.controller.T00_NOTICEActionForm;
import com.ist.aml.report.dao.T07_BlacklistDAO;

import com.ist.aml.report.dto.T07_Blacklist;
import com.ist.aml.report.dto.T07_OBJ_RULE;
import com.ist.aml.report.dto.T07_blacklist_addr;
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
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;

public class T07_BlacklistAction extends BaseAction {
	private static Logger logger = LogUtils.getLogger(T07_BlacklistAction.class
			.getName());

	/**
	 * Action执行入口 孙日朋 2009—6-29
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
		if ("searchT07_Blacklist".equalsIgnoreCase(myaction)) {
			myforward = performSearchT07_Blacklist(mapping, form, request,
					response);
		}
		// 查询结果
		else if ("getT07_BlacklistList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_BlacklistList(mapping, form, request,
					response);
		}
		// 查询详细信息
		else if ("getT07_BlacklistDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_BlacklistDisp(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT07_Blacklist".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_Blacklist(mapping, form, request,
					response);
		}
		// 添加动作
		else if ("addT07_BlacklistDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_BlacklistDo(mapping, form, request,
					response);
		}
		// 修改界面
		else if ("modifyT07_Blacklist".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_Blacklist(mapping, form, request,
					response);
		}
		// 修改动作
		else if ("modifyT07_BlacklistDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_BlacklistDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT07_BlacklistDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_BlacklistDo(mapping, form, request,
					response);
		}
		// 导入名单
		else if ("inportT07_BlacklistDo".equalsIgnoreCase(myaction)) {
			myforward = performInportT07_BlacklistDo(mapping, form, request,
					response);
		}
		// 导出名单
		else if ("exportT07_BlacklistDo".equalsIgnoreCase(myaction)) {
			myforward = performExportT07_BlacklistDo(mapping, form, request,
					response);
		}
		return myforward;

	}

	/**
	 * 
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
	public ActionForward performSearchT07_Blacklist(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_Blacklist t07_blacklist = (T07_Blacklist) session
				.getAttribute("t07_blacklistSearchObj");
		if (t07_blacklist == null) {
			t07_blacklist = new T07_Blacklist();
		}
		T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
		try {
			MyBeanUtils.copyBean2Bean(form, t07_blacklist);
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
	 * 查询列表 孙日朋 2009—6-29
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
	public ActionForward performGetT07_BlacklistList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_blacklistList = new ArrayList();
		String pageInfo = "";

		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		try {
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");

			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			if (t87_sysparaMap.containsKey("306")) {
				String isExist_nameList = t87_sysparaMap.get("306").toString();
				if ("1".equals(isExist_nameList)) {
					String url = request.getContextPath()
							+ "/platform/list/getCustBlackListFact.do?newsearchflag=1";
					String isquery = request.getParameter("isquery");
					if ("1".equals(isquery)) {
						url += "&isquery=1";
					}
					response.sendRedirect(url);
					return null;
				}
			}

			Authorization auth = authBean.getAuthToken();
			String organlevel = auth.getT00_user().getOrganlevel();
			request.setAttribute("organlevel", organlevel);
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String list_type = StringUtils.nullObject2String(request
					.getParameter("list_type"));
			if (list_type.equals("")) {
				list_type = StringUtils.nullObject2String(request
						.getAttribute("list_type"));
			}
			request.setAttribute("list_type", list_type);
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			
			
			String cartype = "";
			// 黑名单类型
			String lt = "m_list_type_b";
			LinkedHashMap m_list_typeMap = cm.getMapFromCache(lt);

			// start modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			// 审批状态

			LinkedHashMap ischeckforpartyMap = new LinkedHashMap();
			if ("1".equals(t87_sysparaMap.get("404"))) {
				ischeckforpartyMap = cm.getMapFromCache("ischeckforparty0");
			} else {
				ischeckforpartyMap = cm.getMapFromCache("ischeckforparty");
			}

			// end modify lixx 2011.09.26 名单管理 流程添加是否有审核操作

			request.setAttribute("ischeckforpartyMap", this
					.getOptionsListByMap(ischeckforpartyMap, null, true));
			request.setAttribute("m_list_typeMap", this.getOptionsListByMap(
					m_list_typeMap, null, true));
			// 查询排序
			String lst = "listsearch_type_b";

			LinkedHashMap listsearch_typeMap = cm.getMapFromCache(lst);
			request.setAttribute("listsearch_typeMap", this
					.getOptionsListByMap(listsearch_typeMap, null, true));
			// 是否启用
			LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
			request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
					null, true));

			// 新的查询
			if (newsearchflag.equals("1")) {
				if (form.getOrgankey() != null
						&& !"".equals(form.getOrgankey().trim())) {
					t07_blacklist.setOrgankey(form.getOrgankey());
				}
				if (form.getParty_class_cd() != null
						&& !"".equals(form.getParty_class_cd().trim())) {
					t07_blacklist.setParty_class_cd(form.getParty_class_cd());
				}
				if (form.getObj_name() != null
						&& !"".equals(form.getObj_name().trim())) {
					t07_blacklist.setObj_name(form.getObj_name());
				}
				if (form.getParty_id() != null
						&& !"".equals(form.getParty_id().trim())) {
					t07_blacklist.setParty_id(form.getParty_id());
				}
				if (t07_blacklist.getListsearch_type() != null
						&& !"".equals(form.getListsearch_type().trim())) {
					t07_blacklist.setListsearch_type(form.getListsearch_type());
				}
				if (form.getFashion() != null
						&& !"".equals(form.getFashion().trim())) {
					t07_blacklist.setFashion(form.getFashion());
				}
				if (form.getOrganname() != null
						&& !"".equals(form.getOrganname().trim())) {
					t07_blacklist.setOrganname(form.getOrganname());
				}
				// 日期型数据的转换
				if (form.getCreate_dt_disp() != null
						&& !"".equals(form.getCreate_dt_disp())) {
					t07_blacklist.setCreate_dt(DateUtils.stringToDateShort(form
							.getCreate_dt_disp()));
				}
				t07_blacklist.setCreate_dt_disp(form.getCreate_dt_disp());

				if (form.getCreate1_dt_disp() != null
						&& !"".equals(form.getCreate1_dt_disp())) {
					Date date = DateUtils.stringToDateShort(form
							.getCreate1_dt_disp());
					DateUtils d = new DateUtils();
					t07_blacklist.setCreate1_dt(d.getDateChangeTime(date, "d",
							1));
				}
				if (form.getM_list_type() != null
						|| !"".equals(form.getM_list_type())) {
					t07_blacklist.setM_list_type(form.getM_list_type());
				}
				t07_blacklist.setIscheck(form.getIscheck());
				t07_blacklist.setCard_type(cartype);
				session.setAttribute("t07_blacklistSearchObj", t07_blacklist);
			} else {// 翻页
				if (!newsearchflag.equals("2")) {
				t07_blacklist = (T07_Blacklist) session
						.getAttribute("t07_blacklistSearchObj");
				if (t07_blacklist == null) {
					t07_blacklist=new T07_Blacklist();
				}
				MyBeanUtils.copyBean2Bean(form, t07_blacklist);
				}
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
			request.setAttribute("check", check);
			if (!newsearchflag.equals("2")) {
				int totalRow = 0;
				if (t07_blacklist != null) {
					t07_blacklist.setOrgankeystr(auth.getOrganstr());
					t07_blacklistList = t07_blacklistDAO.getT07_BlacklistList(
							sqlMap, t07_blacklist, this.getStartRec(intPage),
							this.getIntPageSize());
					totalRow = t07_blacklistDAO.getT07_BlacklistListCount(
							sqlMap, t07_blacklist);
				}
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			
			// 客户类型
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
		request.setAttribute("t07_blacklistList", t07_blacklistList);
		return actionMapping.findForward("success");
	}

	/**
	 * 明细 孙日朋 2009—6-29
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
	public ActionForward performGetT07_BlacklistDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		String changeflag = StringUtils.nullObject2String(request
				.getParameter("changeflag"));
		// 管理页面
		if ("1".equals(changeflag))
			request.setAttribute("url", "t07_blacklist_list.do?intPage="
					+ request.getSession().getAttribute("intPage"));
		// 查询页面
		if ("2".equals(changeflag))
			request.setAttribute("url", "t07_blacklist_list_look.do?intPage="
					+ request.getSession().getAttribute("intPage"));
		// 审核页面
		if ("3".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list_check0.do?list_type=2&intPage="
					+ request.getSession().getAttribute("intPage"));
		// 审批页面
		if ("4".equals(changeflag))
			request.setAttribute("url", "t07_obj_rule_list_check.do?list_type=2&intPage="
					+ request.getSession().getAttribute("intPage"));

		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		try {
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			T07_Blacklist t07_Blacklist = new T07_Blacklist();

			String objkey = (String) request.getParameter("objkey");
			if (objkey != "" && objkey != null) {
				t07_Blacklist.setObjkey(objkey);
			}
			t07_Blacklist.setParty_id(form.getParty_id());
			t07_blacklist = t07_blacklistDAO.getT07_BlacklistDisp(sqlMap,
					t07_Blacklist);
			
			// 获取机构
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			t07_blacklist.setOrgankey((String) organMap.get(t07_blacklist
					.getOrgankey()));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_blacklist", t07_blacklist);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * 
	 * 添加页面 孙日朋 2009—6-29
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
	public ActionForward performAddT07_Blacklist(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organlevel = auth.getT00_user().getOrganlevel();
		String list_type = StringUtils.nullObject2String(request
				.getParameter("list_type"));
		request.setAttribute("list_type", list_type);
		String check = StringUtils.nullObject2String(request
				.getParameter("check"));
		request.setAttribute("check", check);

		// 客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));

		String lt = "";
		if (organlevel != null && organlevel.equals("3")) {
			lt = "m_list_type_d";
		} else {
			lt = "m_list_type_b";
		}
		LinkedHashMap m_list_typeMap = cm.getMapFromCache(lt);
		request.setAttribute("m_list_typeMap", this.getOptionsListByMap(
				m_list_typeMap, null, true));

		// 证件类型
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
				null, true));

		return actionMapping.findForward("success");
	}

	/**
	 * 新建名单 孙日朋 2009—6-29
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
	public ActionForward performAddT07_BlacklistDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		T07_OBJ_RULE t07_obj_rule = new T07_OBJ_RULE();

		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String path = "success";
		try {
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_blacklist, form);
			t07_blacklist.setList_type(t07_blacklist.getM_list_type());
			// 重复处理
			t07_obj_rule.setParty_id(form.getParty_id());
			
			t07_blacklist.setParty_id(form.getParty_id());
			String party_id = t07_blacklist.getParty_id();
			t07_blacklist.setIs_party_id("1");
			if(party_id==null || "".equals(party_id))
			{
				party_id ="B" + this.getSequenceNextVal("SEQ_T10_CHECK_ARTI_id");
				t07_blacklist.setParty_id(party_id);
				t07_blacklist.setIs_party_id("0");
			}
			
			
			
			
			t07_blacklist.setObjkey(t07_blacklist.getParty_id());
			t07_blacklist.setIsuse(form.getIsuse());
			
			// 查询该客户是否是黑、白名单客户
			boolean tag = t07_blacklistDAO.getT07_Listrealy(sqlMap, party_id);
			if (tag) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common", "客户已在黑白名单中，不允许添加！"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}

			t07_blacklist.setOrgankey(auth.getT00_user().getOrgankey());
			t07_blacklist.setParty_class_cd(t07_blacklist.getParty_class_cd());
			t07_blacklist.setCreate_user(auth.getT00_user().getUsername());

			t07_blacklist.setCreate_dt(DateUtils.stringToDateShort(DateUtils
					.getCurrTime()));
//			t07_blacklist.setModify_user(auth.getT00_user().getUsername());
//			t07_blacklist.setModify_dt(DateUtils.stringToDateShort(DateUtils
//					.getCurrTime()));
			
			String check = "";

			if(auth.getT00_user().getOrganlevel().equals("0")) {
				check = "check";
			}
			
			if ("check".equals(check)) {
				t07_blacklist.setIscheck("1");// 直接审批通过
//				t07_blacklist.setIsuse("1");
			} else {
				LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
				if ("1".equals(t87_sysparaMap.get("404"))) {
					//包含审核环节
					t07_blacklist.setIscheck("2");
				}
				else
					//待审批
					t07_blacklist.setIscheck("4");
			}
			
			
			int rows = t07_blacklistDAO.insertT07_Blacklist(sqlMap,
					t07_blacklist);
			if (rows <= 0) {
				throw new Exception("");
			}

			request.setAttribute("list_type", form.getList_type());

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward(path);
	}

	/**
	 * 
	 * 修改名单 孙日朋 2009-6-29
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
	public ActionForward performModifyT07_Blacklist(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organlevel = auth.getT00_user().getOrganlevel();
		String list_type = StringUtils.nullObject2String(request
				.getParameter("list_type"));
		request.setAttribute("list_type", list_type);
		String check = StringUtils.nullObject2String(request
				.getParameter("check"));
		request.setAttribute("check", check);

		// 客户类型
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		request.setAttribute("list_typeMap", this.getOptionsListByMap(
				list_typeMap, null, true));

		String lt = "";
		if (organlevel != null && organlevel.equals("3")) {
			lt = "m_list_type_d";
		} else {
			lt = "m_list_type_b";
		}
		LinkedHashMap m_list_typeMap = cm.getMapFromCache(lt);
		request.setAttribute("m_list_typeMap", this.getOptionsListByMap(
				m_list_typeMap, null, true));

		// 证件类型
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		request.setAttribute("card_typeMap", this.getOptionsListByMap(
				card_typeMap, null, true));
		// 是否启用
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		request.setAttribute("isuseMap", this.getOptionsListByMap(isuseMap,
				null, true));

		try {
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			String selectedPartyId = form.getSelectedPartyId()[0];
//			String party_id = selectedPartyId.split(";")[0];
//			String obj_name = selectedPartyId.split(";")[1];
//			String objkey = selectedPartyId.split(";")[2];
			T07_Blacklist temp = new T07_Blacklist();
			temp.setParty_id(selectedPartyId);
//			temp.setObj_name(obj_name);
//			temp.setObjkey(objkey);
			t07_blacklist = t07_blacklistDAO
					.getT07_BlacklistDisps(sqlMap, temp);
			String ischeck = t07_blacklist.getIscheck();
			request.setAttribute("ischeck", ischeck);
			MyBeanUtils.copyBean2Bean(form, t07_blacklist);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_blacklistname", t07_blacklist.getParty_id());
		return actionMapping.findForward("success");
	}

	/**
	 * 删除 孙日朋 2009—6-29
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
	public ActionForward performDeleteT07_BlacklistDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		try {
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			String[] selectedPartyIds = form.getSelectedPartyId();
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			for (int i = 0; i < selectedPartyIds.length; i++) {
				String party_id = selectedPartyIds[i];
				T07_Blacklist temp = new T07_Blacklist();
				temp.setParty_id(party_id);
				t07_blacklistDAO.deleteT07_Blacklist(sqlMap, temp);
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
		return actionMapping.findForward("success");
	}

	/**
	 * 导入名单 孙日朋 2009—6-29
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
	public ActionForward performInportT07_BlacklistDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		HttpSession session = request.getSession();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		// 获取当前用户信息
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		String listtype = StringUtils.nullObject2String(request
				.getParameter("list_type"));
		request.setAttribute("list_type", listtype);
		
		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			FormFile file = form.getFilename();
			// 获取文件名称
			String fname = file.getFileName();
			
			HSSFWorkbook workbook=this.uplodeFile(fname, file);
			HSSFSheet sheet = workbook.getSheetAt(0);
			
			int i = 0;
			for (i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
			if(row!=null){
				// 循环读一行的列
				HSSFCell cell = row.getCell((short) 0);
			
				String cellValue = this.getCellValue(cell);
				t07_blacklist.setObj_name((String) cellValue);
				if ("".equals(cellValue)) {
					continue;
				}
				cell = row.getCell((short) 1);
				if (cell != null)
					cellValue = this.getCellValue(cell);
				else
					cellValue = "";
				
				t07_blacklist.setParty_id((String) cellValue);
				cell = row.getCell((short) 2);
				cellValue = this.getCellValue(cell);
				if (cellValue.equals("对公"))
					t07_blacklist.setParty_class_cd("C");
				else
					t07_blacklist.setParty_class_cd("I");

				cell = row.getCell((short) 3);
				cellValue = this.getCellValue(cell);
				t07_blacklist.setList_type(cellValue);
				t07_blacklist.setM_list_type(cellValue);
				cell = row.getCell((short) 4);
				cellValue = this.getCellValue(cell);
				t07_blacklist.setCard_type(cellValue);
				cell = row.getCell((short) 5);
				cellValue = this.getCellValue(cell);
				t07_blacklist.setCard_no(cellValue);
				
				cell = row.getCell((short) 6);
				cellValue = this.getCellValue(cell);
				if (cellValue.equals("是"))
					t07_blacklist.setIsuse("0");
				else
					t07_blacklist.setIsuse("1");
				
				
		if(t07_blacklist.getParty_id()==null || t07_blacklist.getParty_id().equals("")){
//					String id = this.getSequenceNextVal("T87_BLSKLIST");
//					t07_blacklist.setObjkey("'" + id + "'");
					String party_id ="B" + this.getSequenceNextVal("SEQ_T10_CHECK_ARTI_id");
					t07_blacklist.setParty_id(party_id);
					t07_blacklist.setIs_party_id("0");
					
					
		  }else{
				
				if (!t07_blacklistDAO.getT07_BlacklistB(sqlMap, t07_blacklist)) {
					errors.add(errors.GLOBAL_ERROR, new ActionError(
							"error.pagertitle.common", "客户号是cellValue"
									+ "的黑名单已存，不允许添加！"));
					saveErrors(request, errors);
					return actionMapping.findForward("failure");
				}
		  }
				t07_blacklist.setCreate_dt(DateUtils
						.stringToDateShort(DateUtils.getCurrTime()));
				t07_blacklist.setOrgankey(auth.getT00_user().getOrgankey());
				t07_blacklist.setCreate_user(auth.getT00_user().getUsername());
				t07_blacklist.setObjkey(t07_blacklist.getParty_id());
				String check = request.getParameter("check");

				if ("check".equals(check)) {
					t07_blacklist.setIscheck("1");
				}
				
				check = "";
				if(auth.getT00_user().getOrganlevel().equals("0")) {
					check = "check";
				}
				if ("check".equals(check)) {
					t07_blacklist.setIscheck("1");// 直接审批通过
				}
				else {
					LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
					if ("1".equals(t87_sysparaMap.get("404"))) {
						//包含审核环节
						t07_blacklist.setIscheck("2");
					}
					else
						//待审批
						t07_blacklist.setIscheck("4");
				}

				int rows = t07_blacklistDAO.insertT07_Blacklist(sqlMap,
						t07_blacklist);
				if (rows <= 0) {
					throw new Exception("");
				}
			}
			}
			if (i < 2) {
				throw new Exception("");
			}
			sqlMap.commitTransaction();
			
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
	
	public ActionForward performExportT07_BlacklistDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_blacklistList = new ArrayList();

		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO) context
				.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();
		try {
			t07_blacklist.setIsuse("0");// 在使用
			t07_blacklist.setIscheck("1");//审核通过
			t07_blacklistList = t07_blacklistDAO.getT07_BlacklistList(
					sqlMap, t07_blacklist, this.getStartRec(intPage),
					0);
			
			String excelName = DateUtils.getDate10to8(DateUtils.getCurrTime())+"blacklist";
			request.setAttribute("excelName", excelName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} 
		request.setAttribute("t07_blacklistList", t07_blacklistList);
		return actionMapping.findForward("success");
	}
	
	public HSSFWorkbook  uplodeFile(String fname,FormFile file) throws Exception{
		InputStream streamIn = null;
		InputStream stream = null;
		HSSFWorkbook workbook=null;
		String fileName =""; 
		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			streamIn = file.getInputStream();
			String path = "blacklist";
			// 保存文件的主目录
			 fileName = fileUpload.uploadFile(fname, streamIn, path,
					"day");
				// 保存文件的主目录
				XMLProperties SysConfig = (XMLProperties) context
						.getBean("sysConfig");
				String attachDir = SysConfig.getProperty("data.import");
				fileName = attachDir + fileName;
				stream=new FileInputStream(fileName);
				 workbook = new HSSFWorkbook(stream);
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
		System.out.println("cell:::"+cell);
	  if(cell!=null){
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
		//if (cellvalue.indexOf('.') > 0)
		//	cellvalue = cellvalue.substring(0, cellvalue.indexOf('.'));
	  }
		return cellvalue;
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
	public ActionForward performModifyT07_BlacklistDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_BlacklistDAO t07_blacklistDAO = (T07_BlacklistDAO)context.getBean("t07_blacklistDAO");
		T07_Blacklist t07_blacklist = new T07_Blacklist();

		// 获取当前用户姓名
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String mdifyuser = auth.getT00_user().getUsername();
		String action = "t07_blacklist_list.do";
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		String ischeck = (String)request.getParameter("ischeck");
		
		try {
			T07_BlacklistActionForm form = (T07_BlacklistActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t07_blacklist, form);
			t07_blacklist.setModify_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_blacklist.setModify_user(mdifyuser);
			// 日期型数据的转换
			t07_blacklist.setValidate_dt(DateUtils.stringToDateShort(form
					.getValidate_dt_disp()));
			t07_blacklist.setInvalidate_dt(DateUtils.stringToDateShort(form
					.getInvalidate_dt_disp()));
			
			
			
			String check = request.getParameter("check");
			String validate_dt_disp = form.getValidate_dt_disp();
			String invalidate_dt_disp = form.getInvalidate_dt_disp();
			// 日期型数据的转换
			if (validate_dt_disp.equals("")) {
				validate_dt_disp = "2010-01-01";
			}
			if (invalidate_dt_disp.equals("")) {
				invalidate_dt_disp = "2030-01-01";
			}
			t07_blacklist.setValidate_dt(DateUtils
					.stringToDateShort(validate_dt_disp));
			t07_blacklist.setInvalidate_dt(DateUtils
					.stringToDateShort(invalidate_dt_disp));

			if ("check".equals(check)) {
				t07_blacklist.setIscheck("1");
			}else{
				if ("1".equals(t87_sysparaMap.get("404"))) {  //包含审核环节
					t07_blacklist.setIscheck("2");
				}
				else
					t07_blacklist.setIscheck("4");
			}
			t07_blacklistDAO.modifyT07_Blacklist(sqlMap, t07_blacklist);
			request.setAttribute("list_type", form.getList_type());
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return new ActionForward("/listmanager/" + action + "?intPage="
				+ request.getSession().getAttribute("intPage"));
	}

}
