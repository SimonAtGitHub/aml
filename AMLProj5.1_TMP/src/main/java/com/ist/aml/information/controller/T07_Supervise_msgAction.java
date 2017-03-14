/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2009/06/29 08:49:24 xzq Exp $
 * Created [2009-06-29] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.information.controller;

/**
 * <p>
 * T07_SUPervise_msgActoin.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: xzq $
 * @version $Revision: 1.1.1.1 $ $Date: 2009/06/29 08:49:24 $
 */

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.*;

import javax.servlet.http.*;

import java.util.*;

import com.ist.aml.information.dao.T07_Supervise_msgDAO;
import com.ist.aml.information.dto.T07_Supervise_msg;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_Supervise_msgAction extends BaseAction {

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

//		 查询结果--总行或分行查询
		if ("getT07_Supervise_msgList_do".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_Supervise_msgList_do(mapping, form, request,
					response);
		}
//	    查询结果--支行查询
		else if ("getT07_Supervise_msgList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_Supervise_msgList(mapping, form, request,
					response);
		}
		// 添加界面
		else if ("addT07_Supervise_msg".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_Supervise_msg(mapping, form, request,
					response);
		}
		// 添加动作
		else if ("addT07_Supervise_msgDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_Supervise_msgDo(mapping, form, request,
					response);
		}
		// 删除动作
		else if ("deleteT07_Supervise_msgDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_Supervise_msgDo(mapping, form,
					request, response);
		}
		//增加工作督办中的导出excl
		else if("exportT07_Supervise_msgList_do".equalsIgnoreCase(myaction)){
			myforward = performExportT07_Supervise_msgList_do(mapping,form,request,response);
		}
		//工作督办中的导出
		if ("exportT07_Supervise_msgList".equalsIgnoreCase(myaction)) {
			myforward = performExportT07_Supervise_msgList(mapping, form, request,
					response);
		}
//		 查询详细信息--支行查询
		else if ("getT07_supervise_msg_detail".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_Supervise_msgDetail(mapping, form, request,
					response);
		}
		// 查询详细信息--总行或分行查询
		else if ("getT07_Supervise_msgDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_Supervise_msgDisp(mapping, form, request,
					response);
		}
		//添加回执意见
		else if ("modifyT07_Supervise_msg1Do".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_Supervise_msg1Do(mapping, form,
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
	public ActionForward performGetT07_Supervise_msgList_do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		ArrayList t07_supervise_msgList = new ArrayList();
		T07_Supervise_msg t07_supervise_msg = new T07_Supervise_msg();
		String pageInfo = "";
		int totalRow = 0;
	
		try {
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
			form.setMsg_mode("");
			
			//督办类型
			LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
			request.setAttribute("msg_typeMap", this.getOptionsListByMap(
					msg_typeMap, null, true));
            //案例类型
			LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
			request.setAttribute("casetypeMap", this.getOptionsListByMap(
					casetypeMap, null, true));
			
		      //客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));
			
			LinkedHashMap postMap = cm.getMapFromCache("subpost");
			request.setAttribute("postMap", this.getOptionsListByMap(
					postMap, null, true));
			
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organkeys=auth.getOrganstr();	

			if (newsearchflag.equals("1")) {// 新的查询
				     MyBeanUtils.copyBean2Bean(t07_supervise_msg, form);
                     if(t07_supervise_msg.getStart_dt() != null && !t07_supervise_msg.getStart_dt().equals("")){
				    	 t07_supervise_msg.setDate_start_dt(DateUtils.stringToDateShort(t07_supervise_msg.getStart_dt()));
				     }
				     if(t07_supervise_msg.getEnd_dt() != null && !t07_supervise_msg.getEnd_dt().equals("")){
				    	 t07_supervise_msg.setDate_end_dt(DateUtils.stringToDateShort(t07_supervise_msg.getEnd_dt()));
				     }
				     if(t07_supervise_msg.getStart_dt_disp() != null && !t07_supervise_msg.getStart_dt_disp().equals("")){
				    	 t07_supervise_msg.setDate_start_validate(DateUtils.stringToDateShort(t07_supervise_msg.getStart_dt_disp()));
				     }
				     if(t07_supervise_msg.getEnd_dt_disp() != null && !t07_supervise_msg.getEnd_dt_disp().equals("")){
				    	 t07_supervise_msg.setDate_end_validate(DateUtils.stringToDateShort(t07_supervise_msg.getEnd_dt_disp()));
				     }
				     
		             session.setAttribute("t07_supervise_msgSearchObj", t07_supervise_msg);
				
			}else {// 翻页
				t07_supervise_msg = (T07_Supervise_msg) session.getAttribute("t07_supervise_msgSearchObj");
				MyBeanUtils.copyBean2Bean(form, t07_supervise_msg);
				session.setAttribute("t07_supervise_msgSearchObj", t07_supervise_msg);
			}
			if(t07_supervise_msg.getMsg_type().equals("")){
				t07_supervise_msg.setMsg_type("2");
				form.setMsg_type("2");
			}
			if(t07_supervise_msg.getMsg_type().equals("1")||t07_supervise_msg.getMsg_type().equals("6")){
				t07_supervise_msg.setParty_class_cd("");
				t07_supervise_msg.setCase_type("");
			}
			
			
			  t07_supervise_msg.setOrgankeys(organkeys);
			  t07_supervise_msg.setOrgankey(auth.getT00_user().getOrgankey());
				t07_supervise_msgList = t07_supervise_msgDAO.getT07_Supervise_msgList(sqlMap,t07_supervise_msg, this.getStartRec(intPage), this
									.getIntPageSize());

	             totalRow = t07_supervise_msgDAO.getT07_Supervise_msgListCount(sqlMap,t07_supervise_msg);
			
	             String url = request.getContextPath() + "/information"
				+ actionMapping.getPath() + ".do";

		pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		request.setAttribute("type", t07_supervise_msg.getMsg_type());
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_supervise_msgList", t07_supervise_msgList);
		request.setAttribute("pageInfo", pageInfo);
		
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
	public ActionForward performGetT07_Supervise_msgList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		ArrayList t07_supervise_msgList = new ArrayList();
		T07_Supervise_msg t07_supervise_msg = new T07_Supervise_msg();
		String pageInfo = "";
		int totalRow = 0;
		
        try {
        	// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organkeys=auth.getOrganstr();
			String msg_mode=(String)request.getParameter("msg_mode");
			if(msg_mode==null||msg_mode.equals("")){
				msg_mode="1";
			}
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
//			 督办类型
			LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
			request.setAttribute("msg_typeMap", this.getOptionsListByMap(
					msg_typeMap, null, true));
			  //案例类型
			LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
			request.setAttribute("casetypeMap", this.getOptionsListByMap(
					casetypeMap, null, true));
			
		      //客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
					clienttypeMap, null, true));

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			form.setMsg_mode(msg_mode);
			int intPage = PageUtils.intPage(request, newsearchflag);

			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t07_supervise_msg, form);
				intPage = 0;
				/*if (form.getMsg_name_s() != null
						&& !"".equals(form.getMsg_name_s())) {
					t07_supervise_msg.setMsg_name_s("%" + form.getMsg_name_s()
							+ "%");
				}*/
				 session.setAttribute("t07_supervise_msgSearchObj", t07_supervise_msg);
				
			}else {// 翻页
				t07_supervise_msg = (T07_Supervise_msg) session.getAttribute("t07_supervise_msgSearchObj");
				if(intPage!=0){
					t07_supervise_msg.setIntpage(intPage);
					session.setAttribute("t07_supervise_msgSearchObj", t07_supervise_msg);
					}
				MyBeanUtils.copyBean2Bean(form, t07_supervise_msg);
				
			}
				t07_supervise_msg.setOrgankeys(organkeys);
				t07_supervise_msgList = t07_supervise_msgDAO.getT07_Supervise_msgList_zh(sqlMap,t07_supervise_msg, this.getStartRec(intPage), this
									.getIntPageSize());
	             totalRow = t07_supervise_msgDAO.getT07_Supervise_msgListCount_zh(sqlMap,t07_supervise_msg);
				String url = request.getContextPath() + "/information"
				+ actionMapping.getPath() + ".do";

		       pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		       request.setAttribute("backurl", "t07_supervise_msg_list.do?msg_mode="+msg_mode);
	
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_supervise_msgList", t07_supervise_msgList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("msg_mode", t07_supervise_msg.getMsg_mode());
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
	public ActionForward performAddT07_Supervise_msg(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
//		 督办类型
		LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
		request.setAttribute("msg_typeMap", this.getOptionsListByMap(
				msg_typeMap, null, true));
		  //案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		request.setAttribute("casetypeMap", this.getOptionsListByMap(
				casetypeMap, null, true));
		
	      //客户类型
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
				clienttypeMap, null, true));
		
		
       String content=request.getParameter("content");
       if(content!=null&&!content.equals("")){
    	   String[] contents=content.split(",");
    	   form.setReceipt_org(contents[0]);
    	   form.setMsg_org_name(contents[1]);
    	   String dt=contents[2];
    	   String msg_typename=(String)msg_typeMap.get(form.getMsg_type());
    	   String str=dt+"日"+msg_typename;
    	   if(contents[3]!=null&&!contents[3].trim().equals("")){
    		   str=str+(String)casetypeMap.get(contents[3].trim()); 
    		   form.setCase_type(contents[3].trim());
    	   }
    	   
    	   if(contents.length >= 7&&contents[6]!=null&&!contents[6].trim().equals("")){
    		   str=str+(String)clienttypeMap.get(contents[6].trim())+"业务"; 
    		   form.setParty_class_cd(contents[6]);
    	   }
    	   if(contents[4]!=null&&!contents[4].trim().equals("")){
    		   str=str+contents[4].trim(); 
    	   }
    	   str=str+"有"+contents[5]+"记录未处理";
    	   form.setMsg_content(str);
    	   form.setMsg_name(dt+"日"+msg_typename+"督办");
    	  
       }
       String backurl=(String)request.getParameter("backurl");
       request.setAttribute("backurl", backurl);
       request.setAttribute("currdate", DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
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
	public ActionForward performAddT07_Supervise_msgDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		T07_Supervise_msg t07_Supervise_msg =new T07_Supervise_msg();
		T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
		try {
			
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			PropertyUtils.copyProperties(t07_Supervise_msg, form);
            //向t07_Supervise_msg中插入数据
            String msgid = this.getSequenceNextVal("t07_supervise_msg_seq");
            String msg_type=form.getMsg_type();
            t07_Supervise_msg.setMsg_id(msgid);//督办ID
            t07_Supervise_msg.setMsg_name(form.getMsg_name());//督办标题
            t07_Supervise_msg.setMsg_type(msg_type);//督办类型
            t07_Supervise_msg.setMsg_org(auth.getT00_user().getOrgankey());//督办机构
            t07_Supervise_msg.setReceipt_org(form.getReceipt_org());//接收机构
            t07_Supervise_msg.setMsg_content(form.getMsg_content());//督办内容
            t07_Supervise_msg.setMsg_state("0");//状态
            t07_Supervise_msg.setStatus("1");
            t07_Supervise_msg.setCreate_dt(DateUtils.getCurrTime().substring(0, 10));//督办时间
            t07_Supervise_msg.setCreate_user(auth.getT00_user().getUsername());//督办用户
			int rows = t07_supervise_msgDAO.insertT07_Supervise_msg(sqlMap, t07_Supervise_msg);
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
		return actionMapping.findForward("success"+form.getMsg_mode());
	}
	/**
	 * 删除操作
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
	public ActionForward performDeleteT07_Supervise_msgDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		try {
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
			String[] t07_msg_ids = form.getMsg_ids();
			for (int i = 0; i < t07_msg_ids.length; i++) {
 				String msg_id = t07_msg_ids[i];
 				
 				int rows  =t07_supervise_msgDAO.deleteT07_Supervise_msg(sqlMap, msg_id);
 				if (rows <= 0) {
 					throw new Exception("");
 				}
			}
			
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
	 * add bb shichao 2011-8-25
	 * 
	 * 增加工作督办中的导出excl
	 * 
	 * */
	public ActionForward performExportT07_Supervise_msgList_do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
			ActionErrors errors = new ActionErrors();
			HttpSession session = request.getSession();
			T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
			ArrayList t07_supervise_msgList = new ArrayList();
			T07_Supervise_msg t07_supervise_msg = new T07_Supervise_msg();
			 try {
				 T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
					
					//督办类型
				 LinkedHashMap msg_typeMap = cm.getMapFromCache("msg_type1");
					request.setAttribute("msg_typeMap", this.getOptionsListByMap(
							msg_typeMap, null, true));
		            //案例类型
					LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
					request.setAttribute("casetypeMap", this.getOptionsListByMap(
							casetypeMap, null, true));
					
				      //客户类型
					LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
					request.setAttribute("clienttypeMap", this.getOptionsListByMap(
							clienttypeMap, null, true));
					// 组织用户所属的机构ID
					AuthBean authBean = (AuthBean) session.getAttribute("authBean");
					Authorization auth = authBean.getAuthToken();
					String organkeys=auth.getOrganstr();	

					MyBeanUtils.copyBean2Bean(t07_supervise_msg, form);
					if(t07_supervise_msg.getStart_dt() != null && !t07_supervise_msg.getStart_dt().equals("")){
				    	 t07_supervise_msg.setDate_start_dt(DateUtils.stringToDateShort(t07_supervise_msg.getStart_dt()));
				     }
				     if(t07_supervise_msg.getEnd_dt() != null && !t07_supervise_msg.getEnd_dt().equals("")){
				    	 t07_supervise_msg.setDate_end_dt(DateUtils.stringToDateShort(t07_supervise_msg.getEnd_dt()));
				     }
				     if(t07_supervise_msg.getStart_dt_disp() != null && !t07_supervise_msg.getStart_dt_disp().equals("")){
				    	 t07_supervise_msg.setDate_start_validate(DateUtils.stringToDateShort(t07_supervise_msg.getStart_dt_disp()));
				     }
				     if(t07_supervise_msg.getEnd_dt_disp() != null && !t07_supervise_msg.getEnd_dt_disp().equals("")){
				    	 t07_supervise_msg.setDate_end_validate(DateUtils.stringToDateShort(t07_supervise_msg.getEnd_dt_disp()));
				     }
				     
		             session.setAttribute("t07_supervise_msgSearchObj", t07_supervise_msg);

					t07_supervise_msg.setOrgankeys(organkeys);
					 t07_supervise_msg.setOrgankey(auth.getT00_user().getOrgankey());
					t07_supervise_msgList = t07_supervise_msgDAO.getT07_Supervise_msgList_do_zh(sqlMap,t07_supervise_msg);
			
				} catch (Exception e) {
					e.printStackTrace();
					errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.common", e.getMessage()));
					saveMessages(request, errors);
					return actionMapping.findForward("failure");
				}

				request.setAttribute("t07_supervise_msgList", t07_supervise_msgList);
				if("2".equals(t07_supervise_msg.getMsg_type())){
					return actionMapping.findForward("success");
				}else if("1".equals(t07_supervise_msg.getMsg_type())){
					return actionMapping.findForward("success1");
				}else{
					return actionMapping.findForward("success2");
				}
				

	}
	/**
	 * 工作督办中的导出
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
	public ActionForward performExportT07_Supervise_msgList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		ArrayList t07_supervise_msgList = new ArrayList();
		T07_Supervise_msg t07_supervise_msg = new T07_Supervise_msg();
		String pageInfo = "";
		int totalRow = 0;
		
        try {
        	// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organkeys=auth.getOrganstr();
			String msg_mode=(String)request.getParameter("msg_mode");
			if(msg_mode==null||msg_mode.equals("")){
				msg_mode="1";
			}
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
//			 //督办类型
//			TreeMap msg_typeMap = cm.getColumnCatch("msg_type1", true);	
//			request.setAttribute("msg_typeMap", this.getOptionsListByMap(
//					msg_typeMap, null, true));

			form.setMsg_mode(msg_mode);

			MyBeanUtils.copyBean2Bean(t07_supervise_msg, form);
			/*if (form.getMsg_name() != null && !"".equals(form.getMsg_name())) {
				t07_supervise_msg.setMsg_name("%" + form.getMsg_name()
						+ "%");
			}*/
				
			t07_supervise_msg.setOrgankeys(organkeys);
			t07_supervise_msgList = t07_supervise_msgDAO.getT07_Supervise_msgList_zh(sqlMap,t07_supervise_msg);
	
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_supervise_msgList", t07_supervise_msgList);
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
	public ActionForward performGetT07_Supervise_msgDetail(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		T07_Supervise_msg t07_supervise_msg =new T07_Supervise_msg();
		try {
			
			String backurl=(String)request.getParameter("backurl");
		       request.setAttribute("backurl", backurl);
		    String flag="0";
		    if(request.getParameter("flag")!=null){
		    	flag="1";
		    }
		    request.setAttribute("flag", flag);
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
			String msg_id = form.getMsg_id();
			t07_supervise_msg = t07_supervise_msgDAO.getT07_Supervise_msgDisp(sqlMap, msg_id);
			String msg_mode=(String)request.getParameter("msg_mode");
			if(msg_mode!=null&&msg_mode.equals("2"))
			{
				if(t07_supervise_msg.getMsg_state().equals("0"))
				{
			   		int rows=t07_supervise_msgDAO.updateT07_Supervise_msgDisp(sqlMap, msg_id);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_supervise_msg", t07_supervise_msg);
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
	public ActionForward performGetT07_Supervise_msgDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		T07_Supervise_msg t07_supervise_msg =new T07_Supervise_msg();
		try {
			   String backurl=(String)request.getParameter("backurl");
		       request.setAttribute("backurl", backurl);
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
			String msg_id = form.getMsg_id();
			t07_supervise_msg = t07_supervise_msgDAO.getT07_Supervise_msgDisp(sqlMap, msg_id);
			if(t07_supervise_msg.getMsg_state().equals("0")){
			int rows=t07_supervise_msgDAO.updateT07_Supervise_msgDisp(sqlMap, msg_id);
			 if (rows <= 0) {
					throw new Exception("");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_supervise_msg", t07_supervise_msg);
		
		return actionMapping.findForward("success");
	}
	/**
	 * 添加回执意见
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performModifyT07_Supervise_msg1Do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_Supervise_msgDAO t07_supervise_msgDAO =(T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		T07_Supervise_msg t07_Supervise_msg =new T07_Supervise_msg();
		HttpSession session = request.getSession();
		try {
			T07_Supervise_msgActionForm form = (T07_Supervise_msgActionForm) actionForm;
			PropertyUtils.copyProperties(t07_Supervise_msg, form);
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String username=auth.getT00_user().getUsername();
			String deal_dt=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
			t07_Supervise_msg.setDeal_user(username);
			t07_Supervise_msg.setDeal_dt(deal_dt);
			t07_supervise_msgDAO.modifyT07_Supervise_msg1(sqlMap, t07_Supervise_msg);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

}
