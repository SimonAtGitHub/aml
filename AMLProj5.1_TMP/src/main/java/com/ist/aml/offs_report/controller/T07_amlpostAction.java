package com.ist.aml.offs_report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.offs_report.dao.T07_amlpostDAO;
import com.ist.aml.offs_report.dto.T07_amlpost;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_amlpostAction extends BaseAction {

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
		if ("getT07_amlpostList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_amlpostList(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT07_amlpost".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_amlpost(mapping, form, request, response);
		}
		// 添加动作
		else if ("addT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_amlpostDo(mapping, form, request,
					response);
		}
		// 修改界面
		else if ("modifyT07_amlpost".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_amlpost(mapping, form, request,
					response);
		} else if ("modifyT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_amlpostDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_amlpostDo(mapping, form, request,
					response);
		}
		// 导出xls文件:Ireport
		else if ("getT07_amlpost_xls".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_amlpost_xls(mapping, form, request,
					response);
		}
		//from 2012.7.6 modified by lijie
		// 导出xls文件:excel转化成jsp
		else if ("export_t07_amlpostList".equalsIgnoreCase(myaction)) {
			myforward = performExport_t07_amlpostList(mapping, form, request,
					response);
		}
		return myforward;

	}

	public ActionForward performGetT07_amlpostList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_amlpostList = new ArrayList();
		HttpSession session = request.getSession();
		LinkedHashMap map = new LinkedHashMap();
		String pageInfo = "";
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO) context
				.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();

		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;

			String url = request.getContextPath() + "/offs_report"
					+ actionMapping.getPath() + ".do";
			String reset = (String) request.getAttribute("reset");
			if (reset == null)
				reset = "";
			if (reset.equals("yes")) {// 如果从添加或修改动作跳转过来，需要进行初始化操作
				form.reset();
			}
			// 查询条件设置
			MyBeanUtils.copyBean2Bean(t07_amlpost, form);
			String uporgankey = StringUtils.null2String(
					(String) request.getParameter("uporgankey")).trim();
			t07_amlpost.setUporgankey(uporgankey);

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			AuthBean authBean = (AuthBean) request.getSession().getAttribute(
					"authBean");
			String orgStr = authBean.getAuthToken().getOrganstr();
			String os = orgStr.substring(orgStr.length() - 5,
					orgStr.length() - 1);
			session.setAttribute("os", os);
			t07_amlpost.setOrganstr(orgStr);// 过滤用户机构权限
			if (!newsearchflag.equals("2")) {
				if (newsearchflag.equals("1")) {// 新的查询
					String organSelected = this.getOrganSelected(request, map);// 用户选择查询的机构号
					t07_amlpost.setOrgankey(organSelected);
//					this.setSearchObj(t07_amlpost);
//					this.setSearchObj(t07_amlpost);
					request.getSession().setAttribute("t07_amlpostSearch",
							t07_amlpost);
				} else {// 返回或翻页
					T07_amlpost temp = (T07_amlpost) request.getSession()
							.getAttribute("t07_amlpostSearch");
					if (temp != null)
						t07_amlpost = temp;
					MyBeanUtils.copyBean2Bean(form, t07_amlpost);
					if (uporgankey.equals(""))
						uporgankey = t07_amlpost.getUporgankey();// 取得上次查询的上级机构号
					this.getOrganSelected(t07_amlpost.getOrgankey(), map);// 已选查询机构号
				}
				t07_amlpostList = t07_amlpostDAO.getT07_amlpostList(sqlMap,
						t07_amlpost, this.getStartRec(intPage), this
								.getIntPageSize());
				if (t07_amlpostList == null)
					t07_amlpostList = new ArrayList();
				if (newsearchflag.equals("1") || reset.equals("yes")) {
					request.getSession().setAttribute("t07_amlpostList",
							t07_amlpostList);
				}
				request.setAttribute("size", t07_amlpostList.size() + "");

				int totalRow = t07_amlpostDAO.getT07_amlpostListCount(sqlMap,
						t07_amlpost);
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			String organMultiSelHTMLStr = StaticMethod.getOrganMultiSelHTML(
					request, uporgankey, map, 10, cm);
			request.setAttribute("organMultiSelHTMLStr", organMultiSelHTMLStr);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_amlpostList", t07_amlpostList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}

	/**
	 *添加界面
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
	public ActionForward performAddT07_amlpost(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			T07_amlpost t07_amlpost = new T07_amlpost();
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(form, t07_amlpost);
			// 职位下拉复选框
			LinkedHashMap postitlemap = cm.getMapFromCache("postitle");
			request.setAttribute("postitlemap", this.getOptionsListByMap(
					postitlemap, null, true));
			// 职位状况下拉复选框
			LinkedHashMap us_statusmap = cm.getMapFromCache("us_status");
			request.setAttribute("us_statusmap", this.getOptionsListByMap(
					us_statusmap, null, true));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 添加动作
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
	public ActionForward performAddT07_amlpostDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			//
			PropertyUtils.copyProperties(t07_amlpost, form);
			String user_id = this.getSequenceNextVal("t07_amlpost_user_id");
			t07_amlpost.setUser_id(user_id);

			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// 操作用户相关信息
			t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());// 更新人DateUtils.getCurrDateTime()
			t07_amlpost.setLast_upd_dt(DateUtils.getCurrDateTime());// 更新时间
			t07_amlpost.setLast_upd_dt_disp(DateUtils
					.dateToStringShort(t07_amlpost.getLast_upd_dt()));
			// t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());//更新人
			t07_amlpost.setOrgankey(auth.getT00_user().getOrgankey());// 机构

			if (t07_amlpost.getFull_time_num() == null
					|| t07_amlpost.getFull_time_num().trim().equals("")) {
				t07_amlpost.setFull_time_num("0");
			}
			if (t07_amlpost.getPart_time_num() == null
					|| t07_amlpost.getPart_time_num().trim().equals("")) {
				t07_amlpost.setPart_time_num("0");
			}

			int rows = t07_amlpostDAO.insertT07_amlpost(sqlMap, t07_amlpost);
			if (rows <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}

	/**
	 * 修改界面
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
	public ActionForward performModifyT07_amlpost(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			String user_id_selected[] = form.getUser_id_selected();
			if (user_id_selected == null || user_id_selected.length != 1) {
				return actionMapping.findForward("failure");
			}
			String user_id = user_id_selected[0];
			t07_amlpost = t07_amlpostDAO.getT07_amlpostDisp(sqlMap, user_id);

			LinkedHashMap organ = cm.getMapFromCache("organ");

			t07_amlpost.setOrgankey_disp((String) organ.get(t07_amlpost
					.getOrgankey()));
			PropertyUtils.copyProperties(form, t07_amlpost);
			String ork = (String) session.getAttribute("os");
			session.setAttribute("os", ork);
			if (form.getOrgankey() != null || !form.getOrgankey().equals("")) {
				if (!ork.equals(form.getOrgankey())) {
					session.setAttribute("ork", "0");
				} else {
					session.setAttribute("ork", "1");
				}
			}

			request.setAttribute("t07_amlpostname", t07_amlpost.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * 修改动作
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
	public ActionForward performModifyT07_amlpostDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			PropertyUtils.copyProperties(t07_amlpost, form);
			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// 操作用户相关信息
			t07_amlpost.setLast_upd_dt(DateUtils.getCurrDateTime());// 更新时间
			t07_amlpost.setLast_upd_dt_disp(DateUtils
					.dateToStringShort(t07_amlpost.getLast_upd_dt()));
			t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());// 更新人
			t07_amlpost.setOrgankey(auth.getT00_user().getOrgankey());// 机构
			t07_amlpostDAO.modifyT07_amlpost(sqlMap, t07_amlpost);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_amlpostname", t07_amlpost.getUser_id());
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}

	/**
	 * 删除动作
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
	public ActionForward performDeleteT07_amlpostDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		HttpSession session = request.getSession();
		String os = (String) session.getAttribute("os");
		int l = 0;
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			String selectId[] = form.getUser_id_selected();
			if (selectId != null && selectId.length > 0) {
				for (int i = 0; i < selectId.length; i++) {
					String user_id = selectId[i];
					T07_amlpost t07_amlpost = t07_amlpostDAO
							.getT07_amlpostDisp(sqlMap, user_id);
					if (!os.equals(t07_amlpost.getOrgankey())) {
						l++;
					}
				}
				if (1 < 0) {
					request.setAttribute("tishi", "L");
				} else {
					for (int i = 0; i < selectId.length; i++) {
						String user_id = selectId[i];
						t07_amlpostDAO.deleteT07_amlpost(sqlMap, user_id);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}
	
	/**
	 * add by lijie 2012.7.6
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
	public ActionForward performExport_t07_amlpostList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_amlpostList = new ArrayList();
		HttpSession session = request.getSession();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO) context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();

		try {
			t07_amlpost = (T07_amlpost)session.getAttribute("t07_amlpostSearch");
        	if(t07_amlpost==null){
        		t07_amlpostList=new ArrayList();
        	}else{
        		t07_amlpostList=t07_amlpostDAO.getT07_amlpostList(sqlMap, t07_amlpost, 0, 5000);
        	}
//        	request.setAttribute("t07_amlpost", t07_amlpost);
        	request.setAttribute("t07_amlpostList", t07_amlpostList);
        	
        	
        	
        	
        	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
    		Authorization auth = authBean.getAuthToken();
			LinkedHashMap report_organ_mapMap = cm.getMapFromCache("report_organ_map");
			LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
			String user_organkey = auth.getT00_user().getOrgankey();

			//填报单位类别代码
			String report_organkey = "";
			if (report_organ_mapMap.containsKey(user_organkey)) {
				report_organkey = report_organ_mapMap.get(user_organkey).toString();
			}
			//填报单位名称
			String report_orgname = "";
			if (report_organMap.containsKey(report_organkey)) {
				report_orgname = report_organMap.get(report_organkey).toString();
			}
			// 填报日期
			String reportDate = DateUtils.dateToStringShort(new java.util.Date(System.currentTimeMillis()));
			//年度
			String year = reportDate.substring(0, reportDate.indexOf("-"));
			//制表人
			String realName = auth.getT00_user().getRealname();
			//联系电话
			String telephone = StringUtils.null2String(auth.getT00_user().getTelephone());
			request.setAttribute("year", year);
			request.setAttribute("reportDate", reportDate);
			request.setAttribute("report_organkey", report_organkey);
			request.setAttribute("report_orgname", report_orgname);
			request.setAttribute("realName", realName);
			request.setAttribute("telephone", telephone);
			
			
			String level = "F";// 商行使用分行
			String type_cd = "B";
			
			String downloadname = report_organkey + type_cd + year + "0" + level + "000";
			request.setAttribute("downloadname", downloadname);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {

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
	public ActionForward performGetT07_amlpost_xls(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			// 报表名称的前缀
			request.setAttribute("filehead", "amlpost_");
			// 报表文件路径
			String jasperpath = "/WEB-INF/reports/t07_amlpost.jasper";
			request.setAttribute("jasperpath", jasperpath);
			// 设置报表参数
			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			request.setAttribute("paramList", this.getParamList(auth));
			request.setAttribute("excelname", this.getExcelName(auth));
			request.setAttribute("isdel", "1");
			// 报表数据
			request.setAttribute("dataList", this.getReportDataList(request));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {

		}
		return actionMapping.findForward("success");
	}

	/**
	 * @since 设置iReport报表所需的参数
	 * @param t07_record
	 *            T07_record
	 * @return void
	 */
	public ArrayList getParamList(Authorization auth) {
		ArrayList paraList = new ArrayList();
		// 设置报表标题
		paraList.add("金融机构反洗钱机构和岗位设立情况");
		// 设置报文数据项
		this.setReportHead(paraList, auth);
		return paraList;
	}

	/**
	 * @since 设置iReport报文数据项
	 * @param record_type_cd
	 *            String 报表类别
	 * @param paraList
	 *            ArrayList 报表参数列表
	 * @return void
	 */
	public void setReportHead(ArrayList paraList, Authorization auth) {
		LinkedHashMap report_organ_mapMap = cm
				.getMapFromCache("report_organ_map");
		LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
		String user_organkey = auth.getT00_user().getOrgankey();

		String organkey = "";
		if (report_organ_mapMap.containsKey(user_organkey)) {
			organkey = report_organ_mapMap.get(user_organkey).toString();
		}
		String organname = "";
		if (report_organMap.containsKey(organkey)) {
			organname = report_organMap.get(organkey).toString();
		}
		// end by qiuyun

		String realName = auth.getT00_user().getRealname();// 制表人
		String telephone = auth.getT00_user().getTelephone();// 联系电话
		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// 填报日期
		String year = reportDate.substring(0, reportDate.indexOf("-"));// 年度
		if (reportDate.indexOf("-") != -1)
			reportDate = reportDate.replaceAll("-", "");
		// 数据来源
		String level = "";
		level = "F";// 商行使用分行
		paraList.add("B");// 数据类别
		paraList.add(organkey);// 填报单位代码
		paraList.add(realName);// 制表人
		paraList.add(level);// 数据来源
		paraList.add(organname);// 填报单位名称
		paraList.add(telephone);// 联系电话
		paraList.add(year);// 年度
		paraList.add(reportDate);// 填报日期
	}

	public String getExcelName(Authorization auth) {

		LinkedHashMap report_organ_mapMap = cm
				.getMapFromCache("report_organ_map");
		String user_organkey = auth.getT00_user().getOrgankey();

		String organkey = "";
		if (report_organ_mapMap.containsKey(user_organkey)) {
			organkey = report_organ_mapMap.get(user_organkey).toString();
		}

		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// 填报日期
		String year = reportDate.substring(0, reportDate.indexOf("-"));

		String level = "";
		level = "F";// 商行使用分行
		String type_cd = "B";
		String excelName = organkey + type_cd + year + "0" + level + "000";
		return excelName;
	}

	/**
	 * @since 取得报表数据源
	 * @param record_type_cd
	 *            String 报表类型
	 * @param request
	 *            HttpServletRequest 请求对象
	 * @return ArrayList
	 */
	public ArrayList getReportDataList(HttpServletRequest request)
			throws Exception {
		ArrayList dataList = new ArrayList();
		// ArrayList
		// t07_amlpostList=(ArrayList)request.getSession().getAttribute("t07_amlpostList");
		T07_amlpost searchObj = (T07_amlpost) request.getSession()
				.getAttribute("t07_amlpostSearch");
		if (searchObj == null)
			searchObj = new T07_amlpost();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		ArrayList t07_amlpostList = t07_amlpostDAO.getT07_amlpostList(sqlMap,
				searchObj);
		if (t07_amlpostList == null)
			t07_amlpostList = new ArrayList();

		for (int i = 0; i < t07_amlpostList.size(); i++) {
			T07_amlpost amlpost = (T07_amlpost) t07_amlpostList.get(i);
			if (amlpost == null)
				continue;
			ArrayList row = new ArrayList();
			row.add(amlpost.getDepartment());
			row.add(amlpost.getOrgan_username());
			row.add(amlpost.getOrgan_position());
			row.add(amlpost.getOrgan_telephone());
			row.add(amlpost.getDepart_username());
			row.add(amlpost.getDepart_telephone());
			row.add(amlpost.getFull_time_num());
			row.add(amlpost.getPart_time_num());
			dataList.add(row);
		}
		return dataList;
	}

	/**
	 * @since 取得用户选择的查询机构
	 * @param request
	 *            HttpServletRequest 请求对象
	 * @param map
	 *            HashMap 存放机构
	 * @return String
	 */
	public String getOrganSelected(HttpServletRequest request, HashMap map) {
		StringBuffer organSelected = new StringBuffer("");
		String organ[] = request.getParameterValues("list2");
		if (organ == null || organ.length < 1)
			return "";
		if (map == null)
			map = new HashMap();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if (organMap == null)
			organMap = new LinkedHashMap();
		for (int i = 0; i < organ.length; i++) {
			String oneOrgan = organ[i];
			if (oneOrgan == null || oneOrgan.trim().equals(""))
				continue;
			organSelected.append("'" + oneOrgan + "',");
			map.put(oneOrgan, organMap.get(oneOrgan));
		}
		if (organSelected.length() > 1)
			organSelected.deleteCharAt(organSelected.length() - 1);
		return organSelected.toString();
	}

	/**
	 *设置查询条件对象
	 * 
	 * @param mapping
	 *            ActionMapping
	 * @return void
	 */
	public void setSearchObj(T07_amlpost t07_amlpost) {
		if (t07_amlpost.getOrgan_username() != null
				&& !t07_amlpost.getOrgan_username().trim().equals("")) {// 单位负责人姓名
			t07_amlpost.setOrgan_username("%" + t07_amlpost.getOrgan_username()
					+ "%");
		}
		if (t07_amlpost.getOrgan_position() != null
				&& !t07_amlpost.getOrgan_position().trim().equals("")) {// 单位负责人职务名称
			t07_amlpost.setOrgan_position("%" + t07_amlpost.getOrgan_position()
					+ "%");
		}
		if (t07_amlpost.getDepartment() != null
				&& !t07_amlpost.getDepartment().trim().equals("")) {// 部门名称
			t07_amlpost.setDepartment("%" + t07_amlpost.getDepartment() + "%");
		}
		if (t07_amlpost.getOrgan_telephone() != null
				&& !t07_amlpost.getOrgan_telephone().trim().equals("")) {// 联系电话
			t07_amlpost.setOrgan_telephone("%"
					+ t07_amlpost.getOrgan_telephone() + "%");
		}
		if (t07_amlpost.getDepart_username() != null
				&& !t07_amlpost.getDepart_username().trim().equals("")) {// 反洗钱部门负责人
			t07_amlpost.setDepart_username("%"
					+ t07_amlpost.getDepart_username() + "%");
		}
		if (t07_amlpost.getDepart_telephone() != null
				&& !t07_amlpost.getDepart_telephone().trim().equals("")) {// 洗钱部门联系电话
			t07_amlpost.setDepart_telephone("%"
					+ t07_amlpost.getDepart_telephone() + "%");
		}
	}

	/**
	 * @since 翻页或跳转情况取得用户上次查询选择的查询机构
	 * @param organSelected
	 *            String 已选查询机构号
	 * @param map
	 *            HashMap 存放机构
	 * @return String
	 */
	public void getOrganSelected(String organSelected, HashMap map) {
		if (organSelected == null || organSelected.trim().equals(""))
			return;
		if (map == null)
			map = new HashMap();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if (organMap == null)
			organMap = new LinkedHashMap();
		String organ[] = organSelected.split(",");
		for (int i = 0; i < organ.length; i++) {
			String oneOrgan = organ[i];
			if (oneOrgan == null || oneOrgan.trim().equals(""))
				continue;
			oneOrgan = oneOrgan.replaceAll("'", "");
			oneOrgan = oneOrgan.trim();
			map.put(oneOrgan, organMap.get(oneOrgan));
		}
	}
}
