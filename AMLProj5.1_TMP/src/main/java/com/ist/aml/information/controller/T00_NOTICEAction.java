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

import java.io.File;
import java.io.InputStream;
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
import org.apache.struts.upload.FormFile;

import bsh.StringUtil;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.aml.information.dao.T00_NOTICEDAO;
import com.ist.aml.information.dto.T00_NOTICE;
import com.ist.platform.dto.T00_user;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;
import com.ist.common.properties.XMLProperties;

public class T00_NOTICEAction extends BaseAction {

	private static Logger logger = LogUtils.getLogger(T00_NOTICEAction.class.getName());

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
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		// 查询界面
		if ("searchT00_NOTICE".equalsIgnoreCase(myaction)) {
			myforward = performSearchT00_NOTICE(mapping, form, request, response);
		}
		// 查询结果
		else if ("getT00_NOTICEList".equalsIgnoreCase(myaction)) {
			myforward = performGetT00_NOTICEList(mapping, form, request, response);
		}
		// 添加界面
		else if ("addT00_NOTICE".equalsIgnoreCase(myaction)) {
			myforward = performAddT00_NOTICE(mapping, form, request, response);
		}
		// 添加动作
		else if ("addT00_NOTICEDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT00_NOTICEDo(mapping, form, request, response);
		}
		// 修改界面
		else if ("modifyT00_NOTICE".equalsIgnoreCase(myaction)) {
			myforward = performModifyT00_NOTICE(mapping, form, request, response);
		}
		// 修改动作
		else if ("modifyT00_NOTICEDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT00_NOTICEDo(mapping, form, request, response);
		}
		// 删除动作
		else if ("deleteT00_NOTICEDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT00_NOTICEDo(mapping, form, request, response);
		}
		// 查询详细信息
		else if ("getT00_NOTICEDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT00_NOTICEDisp(mapping, form, request, response);
		}

		return myforward;

	}

	/**
	 * <p>
	 * 查看界面
	 * </p>
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
	public ActionForward performSearchT00_NOTICE(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T00_NOTICE t00_notice = (T00_NOTICE) session.getAttribute("t00_noticeSearchObj");
		if (t00_notice == null) {
			t00_notice = new T00_NOTICE();
		}

		T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
		try {
			// formbean 与 dto 的转换
			MyBeanUtils.copyBean2Bean(form, t00_notice);
			// 从xml中把下拉列表框中取出放到treeMap中
			LinkedHashMap typeMap = cm.getMapFromCache("notice_style");
			request.setAttribute("typeMap", this.getOptionsListByMap(typeMap, null, true));

			LinkedHashMap flagMap = cm.getMapFromCache("notice_states");
			request.setAttribute("flagMap", this.getOptionsListByMap(flagMap, null, true));

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

	/**
	 * <p>
	 * 查询结果
	 * </p>
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
	public ActionForward performGetT00_NOTICEList(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t00_noticeList = new ArrayList();
		String pageInfo = "";
		// 从xml中把下拉列表框中取出放到treeMap中
		LinkedHashMap typeMap = cm.getMapFromCache("notice_style");
		request.setAttribute("typeMap", this.getOptionsListByMap(typeMap, null, true));
		LinkedHashMap flagMap = cm.getMapFromCache("notice_states");
		request.setAttribute("flagMap", this.getOptionsListByMap(flagMap, null, true));

		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();
		String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		try {
			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			int intPage = PageUtils.intPage(request, newsearchflag);

			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organkeys = auth.getOrganstr();
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t00_notice, form);
				if (!t00_notice.getTitle_s().equals("")) {
					t00_notice.setTitle("%" + t00_notice.getTitle_s() + "%");
				}
				intPage = 0;
				t00_notice.setIntPage("0");
				session.setAttribute("t00_noticeSearchObj", t00_notice);

			} else {// 翻页
				t00_notice = (T00_NOTICE) session.getAttribute("t00_noticeSearchObj");

				if (t00_notice == null) {
					t00_notice = new T00_NOTICE();
				}
				if (intPage != 0)
					t00_notice.setIntPage("" + intPage);
				if ("2".equals(newsearchflag)) {
					intPage = StringUtils.nullObject2int(t00_notice.getIntPage());
				}
				MyBeanUtils.copyBean2Bean(form, t00_notice);
			}
			t00_notice.setOrgankeys(organkeys);
			// 取得信息的列表
			t00_noticeList = t00_noticeDAO.getT00_NOTICEList(sqlMap, t00_notice, this.getStartRec(intPage),
					this.getIntPageSize(), context);
			// 取得记录数
			int totalRow = t00_noticeDAO.getT00_NOTICEListCount(sqlMap, t00_notice);
			// 跳转页面的地址
			String url = request.getContextPath() + "/information" + actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		// 把信息返回前台页面

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t00_noticeList", t00_noticeList);
		return actionMapping.findForward("success");

	}

	/**
	 * <p>
	 * 添加界面
	 * </p>
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
	public ActionForward performAddT00_NOTICE(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
		try {
			Authorization auth = new Authorization();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String username = auth.getT00_user().getRealname();
			String organkey = auth.getT00_user().getOrgankey();
			String organname = auth.getT00_user().getOrganname();
			form.setCreator(username);
			form.setCreateorgan(organkey);
			form.setOrganame(organname);
			form.setCreatedate(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));

			LinkedHashMap typeMap = cm.getMapFromCache("notice_style");
			request.setAttribute("typeMap", this.getOptionsListByMap(typeMap, null, true));

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");

	}

	/**
	 * <p>
	 * 添加动作
	 * </p>
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
	public ActionForward performAddT00_NOTICEDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		FileUpload fileUpload = (FileUpload) context.getBean("fileUpload");

		XMLProperties xmlReader = (XMLProperties) context.getBean("busiConfig");

		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();

		try {

			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t00_notice, form);

			String rolekey = this.getSequenceNextVal("NOTICESEQ");
			FormFile file = form.getFilename1();

			String i = xmlReader.getProperty("reportXML.NOTICEMaxSize");
			if (file.getFileSize() > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common", "文件大小不能超过4M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}

			// 获取文件名称和文件大小
			String fname = file.getFileName();
			String newFilePathAndPath = "";
			if (fname != null && !fname.equals("")) {
//				InputStream streamIn = file.getInputStream();
//				FileUtils fileUtils = new FileUtils();
//				String newfname = fileUtils.makeSaveFileName("notice_",rolekey,fname);
//				newFilePathAndPath = fileUpload.uploadFile(newfname, streamIn, "noticeattach", "month");
				newFilePathAndPath=this.uplodeFile(fname, file, form);
				
				if (newFilePathAndPath.equals("") || newFilePathAndPath == null) {
					errors.add(errors.GLOBAL_ERROR, new ActionError("error.common", "上传失败!"));
					saveErrors(request, errors);
					return actionMapping.findForward("failure");
				}
			}
			t00_notice.setNoteice_no(rolekey);
			t00_notice.setFilepath(newFilePathAndPath);
			t00_notice.setFilename(fname);
			t00_notice.setNotice_type("2");
			t00_notice.setFlag("1");
			int rows = t00_noticeDAO.insertT00_NOTICE(sqlMap, t00_notice);
			if (rows <= 0) {
				throw new Exception("");

			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
		}
		return actionMapping.findForward("success");
	}

	/**
	 * <p>
	 * 修改界面
	 * </p>
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
	public ActionForward performModifyT00_NOTICE(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();
		try {
			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			String noteice_no = form.getNoteice_no();
			t00_notice = t00_noticeDAO.getT00_NOTICEDisp(sqlMap, noteice_no, context);
			MyBeanUtils.copyBean2Bean(form, t00_notice);
			LinkedHashMap typeMap = cm.getMapFromCache("notice_style");
			request.setAttribute("typeMap", this.getOptionsListByMap(typeMap, null, true));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

	/**
	 * <p>
	 * 修改动作
	 * </p>
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
	public ActionForward performModifyT00_NOTICEDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response){
		ActionErrors errors = new ActionErrors();
		XMLProperties xmlReader = (XMLProperties) context.getBean("busiConfig");
		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();
		
		try {
			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t00_notice, form);
			FormFile file = form.getFilename1();
			String i = xmlReader.getProperty("reportXML.NOTICEMaxSize");
			int size = file.getFileSize();
			if (size > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common", "文件大小不能超过4M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}

			// 获取文件名称和文件大小
			String fname = file.getFileName();
			if (fname != null && !"".equals(fname)) {
				T00_NOTICE notice=t00_noticeDAO.getT00_NOTICEDisp(sqlMap, form.getNoteice_no());
				// 取得根路径
				XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
				String root = sysConfig.getProperty("data.import");
				
				String path=root+notice.getFilepath();
				File storeFile = new File(path);
				if(storeFile.exists()){
					storeFile.delete();   //删除服务器上的文件
				}
				String newFilePathAndPath=this.uplodeFile(fname, file, form);
				t00_notice.setFilepath(newFilePathAndPath);
				t00_notice.setFilename(fname);
			}
			int rows = t00_noticeDAO.modifyT00_NOTICE(sqlMap, t00_notice);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	public String  uplodeFile(String fname,FormFile file,T00_NOTICEActionForm form) throws Exception{
		InputStream streamIn = null;
		String newFilePathAndPath =""; 
		try{
			
			FileUpload fileUpload = (FileUpload) context.getBean("fileUpload");
				FileUtils fileUtils = new FileUtils();
				String newfname = fileUtils.makeSaveFileName("notice_",form.getNoteice_no(),fname);
				
				 streamIn = file.getInputStream();
				 newFilePathAndPath = fileUpload.uploadFile(newfname, streamIn, "noticeattach", "month");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
		}
		return  newFilePathAndPath;
	}
	

	/**
	 * <p>
	 * 删除动作
	 * </p>
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
	public ActionForward performDeleteT00_NOTICEDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");

		try {

			String flag = (String) request.getParameter("status");
			// 根据编号删除数据库的信息
			String ids[] = request.getParameterValues("noteice_no");
			for (int i = 0; ids != null && i < ids.length; i++) {
				String id = ids[i];
				T00_NOTICE t00_notice = new T00_NOTICE();
				t00_notice.setNoteice_no(id);
				t00_notice.setFlag(flag);
				// 更加编号修改维护表的信息
				int rows = t00_noticeDAO.updateT00_NOTICEFlag(sqlMap, t00_notice);
				if (rows <= 0) {
					throw new Exception("");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
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
	public ActionForward performGetT00_NOTICEDisp(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();
		try {
			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			String noteice_no = form.getNoteice_no();
			t00_notice = t00_noticeDAO.getT00_NOTICEDisp(sqlMap, noteice_no, context);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		Object gory = cm.getMapFromCache("notice_style").get(t00_notice.getNotice_gory());
		request.setAttribute("notice_gory", gory == null ? "" : gory);
		request.setAttribute("t00_notice", t00_notice);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * <p>
	 * 上传附件
	 * </p>
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performAddT07_receiptDo(ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {

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
	public ActionForward performGetT00_NOTICEList1(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t00_noticeList = new ArrayList();
		String pageInfo = "";

		LinkedHashMap typeMap = cm.getMapFromCache("flag");
		request.setAttribute("typeMap", this.getOptionsListByMap(typeMap, null, true));
		LinkedHashMap flagMap = cm.getMapFromCache("flag");
		request.setAttribute("flagMap", this.getOptionsListByMap(flagMap, null, true));
		String searchType = request.getParameter("searchType");
		T00_NOTICEDAO t00_noticeDAO = (T00_NOTICEDAO) context.getBean("t00_noticeDAO");
		T00_NOTICE t00_notice = new T00_NOTICE();
		try {
			T00_NOTICEActionForm form = (T00_NOTICEActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);

			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t00_notice, form);
				intPage = 0;
				t00_notice.setIntPage("0");
				session.setAttribute("t00_noticeSearchObj", t00_notice);
			} else {// 翻页
				t00_notice = (T00_NOTICE) session.getAttribute("t00_noticeSearchObj");
				intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
				if (intPage == 0) {// 如果是从其他页面返回（从其他页面返回时不能带inpPage参数）
					intPage = StringUtils.nullObject2int(t00_notice.getIntPage());
				}
				t00_notice.setIntPage("" + intPage);
				session.setAttribute("t00_roleSearchObj", t00_notice);
			}
			// 取得信息的列表
			t00_noticeList = t00_noticeDAO.getT00_NOTICEList(sqlMap, t00_notice, this.getStartRec(intPage),
					this.getIntPageSize(), context);
			// 取得所有的记录
			int totalRow = t00_noticeDAO.getT00_NOTICEListCount(sqlMap, t00_notice);
			String url = request.getContextPath() + "/information" + actionMapping.getPath() + ".do";
			// 下一页操作
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		// 把数据返回前台页面
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t00_noticeList", t00_noticeList);
		return actionMapping.findForward("success");
	}
}
