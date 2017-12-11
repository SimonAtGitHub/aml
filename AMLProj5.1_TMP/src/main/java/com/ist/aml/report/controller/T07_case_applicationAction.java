/**
 * Create by makecode program v2.0
 * 日期             作者 		动作
 * 2006-12-27   青蛙		创建
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
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T47_party;

import com.ist.aml.report.controller.T07_nbs_ctifActionForm;
import com.ist.aml.newrisk.dto.T37_appr_bas_rslt;
import com.ist.aml.pbcreport.bo.T07_ReportBo;
import com.ist.aml.pbcreport.dto.T07_interface;
import com.ist.aml.pbcreport.dto.T07_nbh_tsdt;
import com.ist.aml.pbcreport.dto.T07_report;
import com.ist.aml.pbcreport.dto.T47_agreement;
import com.ist.aml.report.bo.T07_FlowBo;

import com.ist.aml.report.dao.T07_alert_attachDAO;
import com.ist.aml.report.dao.T07_app_movefateDAO;
import com.ist.aml.report.dao.T07_case_stcrDAO;
import com.ist.aml.report.dao.T07_case_transactionDAO;

import com.ist.aml.report.dao.T07_case_applicationDAO;


import com.ist.aml.report.dao.T47_partyDAO;

import com.ist.aml.pbcreport.dao.T07_nbh_tsdtDAO;
import com.ist.aml.pbcreport.dao.T07_reportDAO;
import com.ist.aml.pbcreport.dao.T47_agreementDAO;

import com.ist.aml.report.dao.T47_transactionDAO;
import com.ist.aml.report.dto.CreditTask;

import com.ist.aml.report.dto.T07_app_movefate;
import com.ist.aml.report.dto.T07_case_advi;

import com.ist.aml.report.dto.T07_case_application;

import com.ist.aml.report.dto.T07_ATTENTION_purview;
import com.ist.aml.report.dto.T07_alert_attach;
import com.ist.aml.report.dto.T07_case_alert_advi;
import com.ist.aml.report.dto.T07_case_feature;
import com.ist.aml.report.dto.T07_case_module;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T07_case_transaction;
import com.ist.aml.report.dto.T07_node;

import com.ist.aml.rule.dao.T03_entity_kindDAO;
import com.ist.aml.rule.dao.T03_entity_kind_manDAO;
import com.ist.aml.rule.dto.T03_entity_kind;

import com.ist.aml.report.dto.T47_transaction;
import com.ist.bmp.hpom.bo.SetOnlineTask;

import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;

import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dao.T07_WORKDATEDAO;
import com.ist.platform.dao.T07_nbs_templetDAO;
import com.ist.platform.dto.T00_operate_log;
import com.ist.platform.dto.T00_organ;
import com.ist.platform.dto.T07_nbs_templet;

import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.MoneyUtils;
import com.ist.util.StringUtils;

public class T07_case_applicationAction extends BaseAction {
	private static Logger logger = LogUtils
			.getLogger(T07_case_applicationAction.class.getName()).getLogger(Constans.LOGGERNAMEA);

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
		myforward = this.preExecute(mapping, form, request,
		 response);
		//如预处理中强行跳出
		if("false".equals(request.getAttribute("goWayFlag")))
		 return myforward;//查询界面
		
		//案例处理时的案例及其预警详细信息
		 if ("getT07_caseDisp2".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_caseDisp2(mapping, form, request, response);
		}
		 //案例处理时的案例特征信息
		else if ("getT07_stcrDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcrDisp(mapping, form, request, response);
		}
		else if ("getT07_case_adviceMoreDisp".equalsIgnoreCase(myaction)) {
			myforward = getT07_case_adviceMoreDisp(mapping, form, request, response);
		}
		//案例处理时的案例特征对应的客户、帐号、交易主页面
		else if ("getT07_stcr_main_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_mainList(mapping, form, request, response);
		}
		//案例处理时的案例特征对应的客户信息
		else if ("getT07_stcr_party_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_partyList(mapping, form, request, response);
		}
		//案例处理时的案例特征对应的账户信息
		else if ("getT07_stcr_acct_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_acctList(mapping, form, request, response);
		}
		//案例处理时的案例特征对应的交易信息
		else if ("getT07_stcr_trans_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_transList(mapping, form, request, response);
		}
		//案例处理时的案例特征对应的交易信息
		else if ("getT07_stcr_trans_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_transList(mapping, form, request, response);
		}
		//案例处理时的案例特征交易的排除与恢复
		else if ("modifyT07_stcr_trans_advi".equalsIgnoreCase(myaction)) {
			myforward = performT07_stcr_trans_advi(mapping, form, request, response);
		}
		//案例处理时的案例特征交易的排除与恢复原因添加
		else if ("addT07_stcr_trans_advi".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_stcr_trans_advi(mapping, form, request, response);
		}
		
		//案例处理时的可疑案例特征的修改页面
		else if ("modifyT07_case_stcr".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_case_stcr(mapping, form, request, response);
		}
		//案例处理时的可疑案例特征的修改
		else if ("modifyT07_case_stcrDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_case_stcrDo(mapping, form, request, response);
		}
		//案例处理时的可疑案例特征的排除与恢复
		else if ("addT07_case_stcr_advi".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_case_stcr_advi(mapping, form, request, response);
		}
		//案例处理时的可疑案例特征的排除与恢复
		else if ("addT07_case_stcr_adviDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_case_stcr_adviDo(mapping, form, request, response);
		}
			//案例处理时的可疑案例特征的原因查看
		else if ("getT07_case_stcr_advi".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_stcr_advi(mapping, form, request, response);
		}
	
		//案例处理意见的添加
		else if ("addCase_advi".equalsIgnoreCase(myaction)) {
			myforward = performAddCase_advi(mapping, form, request, response);
		}
		//案例处理意见的添加动作
		else if ("addCase_adviDo".equalsIgnoreCase(myaction)) {
			myforward = performAddCase_adviDo(mapping, form, request, response);
		}
		//新增案例可疑完成
		else if ("getT07_case_app_add_ky_n_comp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_ky_n_comp(mapping, form, request, response);
		}
		//新增案例可疑页面
		else if ("getT07_case_app_add_ky_n".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_ky_n(mapping, form, request, response);
		}
		//可疑纠错案例 页面
		else if ("getT07_case_app_add_ky_c".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_ky_c(mapping, form, request, response);
		}
		  // 添加大额纠错案例动作
		else if ("T07_caseErrorDeDo_add".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_caseErrorD_applicationDo(mapping, form,
					request, response);
		}
		 // 添加可疑纠错案例动作
		else if ("T07_caseErrorKy_add".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_caseErrorK_applicationDo(mapping, form,
					request, response);
		}
		//添加删除报告案例信息	
		else if ("T07_caseDeleteDo_add".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_caseDelete_applicationDo(mapping, form,
					request, response);
		}
		//新增案例大额完成
		else if ("getT07_case_app_add_de_n_comp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_de_n_comp(mapping, form, request, response);
		}
		//新增案例大额页面
		else if ("getT07_case_app_add_de_n".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_de_n(mapping, form, request, response);
		}
		//大额删除案例 页面
		else if ("getT07_case_app_add_de_d".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_de_d(mapping, form, request, response);
		}
		//大额纠错案例 页面
		else if ("getT07_case_app_add_de_c".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_de_c(mapping, form, request, response);
		}
		//新增案例客户页面
		else if ("getT07_case_app_add_partyList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_partyList(mapping, form, request, response);
		}
		//添加客户动作
		else if ("addT07_case_app_add_partyList".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_case_app_add_partyList(mapping, form, request, response);
		}
		//删除客户动作
		else if ("delT07_case_app_add_partyList".equalsIgnoreCase(myaction)) {
			myforward = performDelT07_case_app_add_partyList(mapping, form, request, response);
		}
		//新增案例交易页面
		else if ("getT07_case_app_add_transList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_add_transList(mapping, form, request, response);
		}
		//添加交易动作
		else if ("addT07_case_app_add_transList".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_case_app_add_transList(mapping, form, request, response);
		}
		//删除交易动作
		else if ("delT07_case_app_add_transList".equalsIgnoreCase(myaction)) {
			myforward = performDelT07_case_app_add_transList(mapping, form, request, response);
		}//可疑案例排除列表
		else if ("getT07_case_app_ky_list".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_app_ky_list(mapping, form,
					request, response);
		}
		else if ("t07_case_huifu_commit".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_huifu_commit(mapping, form,
					request, response);
		}
		//可疑案例排除与恢复
		else if ("t07_case_app_ky_paichu_or_huifu".equalsIgnoreCase(myaction)) {
			myforward = performT07_case_app_ky_paichu_or_huifu1(mapping, form,
					request, response);
		}
		// 添加可疑案例其他信息
		else if ("addT07_case_ky_msg".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_casereason(mapping, form, request,
					response);
		}
		// 案例原因添加动作
		else if ("addT07_case_ky_msgDO".equalsIgnoreCase(myaction)) {
			myforward = performAddT47_casereasonDO(mapping, form, request,
					response);
		}
	
		else if ("getT07_caseMoreDisp".equalsIgnoreCase(myaction)) {
			myforward = getT07_caseMoreDisp(mapping, form, request, response);
		}
		else if ("exportT07_caseMoreDisp".equalsIgnoreCase(myaction)) {
			myforward = exportT07_caseMoreDisp(mapping, form, request, response);
		}//客户定位
		else if ("getT47_partyComm".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_partyComm(mapping, form, request,
					response);
		}
		else if ("getT08_partyriskresult_list".equalsIgnoreCase(myaction)) {
			
			myforward = performGetT08_partyriskresult_list(mapping, form,
					request, response);
		}
		 //案例处理时的案例场景分析
		else if ("getT07_caseAnalysis".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_caseAnalysis(mapping, form, request, response);
		}
		//add by qiuyun 2014-02-24
		//案例处理-->交易处理 增加交易补录控制按钮
		else if ("control_trans".equalsIgnoreCase(myaction)) {
			myforward = performControl_trans(mapping, form, request, response);
		}
	    //end by qiuyun 
		return myforward;

	}
	
	public ActionForward performAddT47_casereason(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		//added by shane at 140905 part1 start
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String organstr = auth.getOrganstr();
		//added by shane at 140905 part1 end
		
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		try {
			//获取案例基本信息
			CreditTask credittask = (CreditTask) session.getAttribute("credittask");
			String application_num = credittask.getApplication_num();
			
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			LinkedHashMap alert_levelMap = cm.getMapFromCache("ssdg"); 
			if("1".equals(sysparaMap.get("800")))
			{
				alert_levelMap.remove("01");
			}
			request.setAttribute("alert_levelMap", this.getOptionsListByMap(alert_levelMap, null, false));
			request.setAttribute("isVerifyAct_exp", sysparaMap.get("803"));
			// 案例信息
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			form.setAlert_level(credittask.getAlert_level());
			form.setTake_action(credittask.getTake_action());
			
			/* modify by lijie:页面上"可疑行为描述"字段的显示取决于附件列表中是否存在该案例的_DESCRIPE_ATTACH.TXT文件**/
			t07_alert_attach.setApplication_num(application_num);
			t07_alert_attach.setAttachkey("ADK");
			int i = t07_alert_attachDAO.getT07_alert_attachListCount(sqlMap, t07_alert_attach);
			if(i<=0)
				form.setAction_descrip(credittask.getAction_descrip());
			else
			{
				T07_alert_attach temp = t07_alert_attachDAO.getT07_alert_attachDisp(sqlMap, t07_alert_attach);
				
				XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
//				String fname = application_num + "_DESC.TXT";
//				String aa = DateUtils.dateToString(temp.getLoad_date()).substring(0,7) + File.separator ;
//				String attach_name = "amlattach" + File.separator;
				String path = sysConfig.getProperty("data.import") + temp.getAttach_name();
				String outString = FileUtils.readFile(path);
				form.setAction_descrip(outString);
			}
			
			form.setAction_explain(credittask.getAction_explain());
			T07_nbs_templetDAO t07_nbs_templetDAO = (T07_nbs_templetDAO)context.getBean("t07_nbs_templetDAO");
			T07_nbs_templet t07_nbs_templet = new T07_nbs_templet();
			//added by shane at 140905 part2 start
			t07_nbs_templet.setOrganstr(organstr);
			//added by shane at 140905 part2 end
			ArrayList templetlist = t07_nbs_templetDAO
					.getT07_nbs_templetListCASE(sqlMap, t07_nbs_templet);
			request.setAttribute("templetlist", templetlist);
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
	public ActionForward performAddT47_casereasonDO(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();

		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_alert_attach t07_alert_attach = new T07_alert_attach();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			T07_case_application t07_case_application = new T07_case_application();
			T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");

			//获取案例基本信息
			CreditTask credittask = (CreditTask) session
					.getAttribute("credittask");
			
	
			LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");// 可疑程度  2009.9.25
			t07_case_application.setApplication_num(credittask.getApplication_num());
			form.setApplication_num(credittask.getApplication_num());
			t07_case_application.setFlow_id(credittask.getFlow_id());
			t07_case_application.setTake_action(form.getTake_action());//采取措施
			t07_case_application.setAction_explain(form.getAction_explain());//可疑行为说明
			t07_case_application.setAlert_level(form.getAlert_level());//可疑级别
			t07_case_application.setAlert_level_disp((String) alert_leverMap
					.get(form.getAlert_level()));//可疑级别
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			/* modify by lijie:如果案例可疑行为描述超过500字符，则截取前400字符；如想阅读完整的可疑行为描述，需参阅案例附件，
			 * 该附件名称为：案例号 _descrip_attach.txt**/
			if(form.getAction_descrip().getBytes().length > 500)
			{
				String temp_part = form.getAction_descrip().substring(0, 210) + "..." + "\r\n" + "其余部分见附件";
				t07_case_application.setAction_descrip(temp_part);
				int row = performAddTxtToAttach(form,request,response);
			}
			else
			{
				t07_case_application.setAction_descrip(form.getAction_descrip());
				t07_alert_attach.setApplication_num(credittask.getApplication_num());
				t07_alert_attach.setAttachkey("ADK");
				int i = t07_alert_attachDAO.getT07_alert_attachListCount(sqlMap, t07_alert_attach);
				if(i>0)//字数不满500，且之前存在相关附件，则一并删除
				{
					T07_alert_attach temp = t07_alert_attachDAO.getT07_alert_attachDisp(sqlMap, t07_alert_attach);
					
					XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
					String fname = credittask.getApplication_num() + "_DESCRIPE_ATTACH.TXT";
					String aa = DateUtils.dateToString(temp.getLoad_date()).substring(0,7) + File.separator ;
					String attach_name = "amlattach" + File.separator;
					String path = sysConfig.getProperty("data.import") + attach_name + aa + fname;
					File storeFile = new File(path);
					if(storeFile.exists()){
						storeFile.delete();   //删除服务器上的文件
					}
					int j = t07_alert_attachDAO.deleteT07_alert_attach(sqlMap, t07_alert_attach);
				}
			}
			
			t07_case_applicationDAO.modifyT07_case_application(sqlMap,
					t07_case_application);
			credittask.setTake_action(form.getTake_action());
			credittask.setAlert_level(form.getAlert_level());
			credittask.setAction_descrip(t07_case_application.getAction_descrip());
			credittask.setAction_explain(form.getAction_explain());
			credittask.setAlert_level_disp(t07_case_application
					.getAlert_level_disp());
			session.setAttribute("credittask", credittask);
			
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("修改可疑程度信息");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(credittask.getApplication_num());//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("2");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc(t07_case_application.getAlert_level_disp());//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
			
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	private int performAddTxtToAttach(T07_case_applicationActionForm form, HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		ActionErrors errors = new ActionErrors();
		T07_alert_attach attach = new T07_alert_attach();
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		String separator = "\t";
		int rows = 0;
		String enter = "\r\n";
		try {
			String attachkey = "ADK"; //AttachDescripeKey
			String application_num = form.getApplication_num();
			XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
			
			attach.setApplication_num(application_num);
			attach.setAttachkey(attachkey);
			int i = t07_alert_attachDAO.getT07_alert_attachListCount(sqlMap, attach);
			if(i>0)
			{
				T07_alert_attach temp = t07_alert_attachDAO.getT07_alert_attachDisp(sqlMap, attach);
				
				String fname = application_num + "_DESC.TXT";
				String aa_old = DateUtils.dateToString(temp.getLoad_date()).substring(0,7) + File.separator ;
				String attach_name_old = "amlattach" + File.separator;
				String path_old = sysConfig.getProperty("data.import") + attach_name_old + aa_old + fname;
				File storeFile = new File(path_old);
				if(storeFile.exists()){
					storeFile.delete();   //删除服务器上的文件
				}
				int j = t07_alert_attachDAO.deleteT07_alert_attach(sqlMap, attach);
			}
			
			
			String name = application_num + "_DESC" + ".TXT";
			StringBuffer sb = new StringBuffer();
			String aa = DateUtils.getYear(DateUtils.getCurrDateTime()) + "-" + DateUtils.getMonth(DateUtils.getCurrDateTime()) + File.separator;
			String attach_name = "amlattach" + File.separator + aa;
			String path = sysConfig.getProperty("data.import") + attach_name;
			sb.append(form.getAction_descrip());
//			sb.append(enter);
			
			FileUtils.writeFile(path, name, sb.toString().trim());
			
			
			//组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			if (name != null && !"".equals(name)) {
//				File storeFile = new File(path);
//				if(storeFile.exists()){
//					storeFile.delete();   //删除服务器上的文件
//				}
//				int i = t07_alert_attachDAO.deleteT07_alert_attach(sqlMap, attach);
				
				T07_alert_attach ba_aml_attach = new T07_alert_attach();
				ba_aml_attach.setAttach_name(attach_name + name);
				ba_aml_attach.setAttach_realname(name);
				ba_aml_attach.setApplication_num(application_num);
				ba_aml_attach.setLoad_user(auth.getT00_user().getUsername());
				ba_aml_attach.setLoad_date(DateUtils.getCurrDateTime());
				ba_aml_attach.setAttachkey(attachkey);
				rows = t07_alert_attachDAO.insertT07_alert_attach(sqlMap, ba_aml_attach);
				// 1.初始化日志对象
				T00_operate_log t00_operate_log=new T00_operate_log();
				t00_operate_log.setModule_key_sub1("添加案例可疑描述附件");//子功能点1级
				t00_operate_log.setModule_key_sub2("");//子功能点2级
				t00_operate_log.setOperate_obj1(application_num);//操作对象1级
				t00_operate_log.setOperate_obj2("");//操作对象2级
				t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ(String.valueOf(rows));//操作结果 1：成功0：失败
				t00_operate_log.setOperate_desc(name);//操作描述(操作的表名，用"；"分割)
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);
				if (rows <= 0) {
					throw new Exception("");

				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);

		}

		return rows;
	}
	
	public ActionForward performGetT07_caseDisp2(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList getT07_alertList = new ArrayList();
		String pageInfo = "";
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_advi t07_case_advi = new T07_case_advi();
		
		String application_num1 = "";
		ArrayList stcrList = new ArrayList();
		ArrayList t07_stcr_transList  = new ArrayList();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// 新的查询
				// 从Session中取得Application_num的值
				CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
				String application_num = creditTask.getApplication_num();
				application_num1 = creditTask.getApplication_num();
				t07_case_application.setApplication_num(application_num);
				t07_case_application.setPost_id(creditTask.getPost_id());
				t07_case_application.setCase_name(creditTask.getCase_name());
				t07_case_application.setCase_kind_disp(creditTask.getCase_kind_disp());
				t07_case_application.setCast_type_disp(creditTask.getCast_type_disp());
				t07_case_application.setApp_state_cd_s(creditTask.getApp_state_cd_disp());
				t07_case_application.setApp_dt_disp(creditTask.getApp_dt_disp());
				t07_case_application.setCase_date_disp(creditTask.getCase_date_disp());
				t07_case_application.setAlert_level_disp(creditTask.getAlert_level_disp());
				t07_case_application.setTake_action(creditTask.getTake_action());
				t07_case_application.setAction_descrip(creditTask.getAction_descrip());
				t07_case_application.setCast_type(creditTask.getCast_type());
				t07_case_application.setApp_org_id(creditTask.getApp_org_id());
				t07_case_application.setApp_org_name(creditTask.getApp_org_id_disp());
				t07_case_application.setApp_state_cd(creditTask.getApp_state_cd());
				t07_case_application.setDate_status_cd(creditTask.getDate_status_cd());
				t07_case_application.setParty_id(creditTask.getParty_id());
				t07_case_application.setParty_chn_name(creditTask.getParty_name());
				MoneyUtils mUtils = new MoneyUtils();
				if(creditTask.getTrans_amt()!=null&&!creditTask.getTrans_amt().equals("")){
					String amt_money = mUtils.FormatMoney(Double.parseDouble(creditTask.getTrans_amt()));
				
					t07_case_application.setTrans_amt(amt_money);
				}
			
				
				t07_case_application.setTrans_count(creditTask.getTrans_count());
				
				t07_case_stcr.setApplication_num(creditTask.getApplication_num());
				t07_case_stcr.setCase_type(creditTask.getCast_type());
				stcrList = t07_case_applicationDAO.getT07_stcrList(sqlMap,t07_case_stcr);
				session.setAttribute("t07_case_application", t07_case_application);
				//add by zhanjin 2013-7-30 增加案例生成条件查询功能 begin
				T07_case_module t07CaseModule=new T07_case_module();
				t07CaseModule.setApplication_num(application_num1);
				ArrayList caseModuleList=t07_case_applicationDAO.getMODULESCORE_list(sqlMap, t07CaseModule);
				request.setAttribute("caseModuleList", caseModuleList);
				//add by zhanjin 2013-7-30 增加案例生成条件查询功能 end
			}else{
				t07_case_application = (T07_case_application) session.getAttribute("t07_case_application");
			}

		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("stcrList", stcrList);
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT07_stcrDisp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcrList = new ArrayList();
		String pageInfo = "";
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");

		CreditTask creditTask = new CreditTask();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			creditTask = (CreditTask) session.getAttribute("credittask");
			t07_case_stcr.setApplication_num(creditTask.getApplication_num());
			t07_case_stcr.setCase_type(creditTask.getCast_type());
			
			/***** 1.取得该案例下的所有预警的列表信息(案例处理-->特征信息处，当来源为模型时，特征list要加入T07_CASE_NET_INDIC部分)**/
			int intPageSize1 = 6;
			int totalRow = t07_case_applicationDAO.getT07_stcrListCount(sqlMap,t07_case_stcr);
			t07_stcrList = t07_case_applicationDAO.getT07_stcrList(sqlMap,t07_case_stcr,this.getStartRec1(intPage,intPageSize1),intPageSize1);
//			t07_stcrList = Adjust_for_gstype(actionMapping,request,sqlMap,t07_stcrList);
			String url = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr1(totalRow, intPage, url, "",intPageSize1);
		    session.setAttribute("t07_stcrList", t07_stcrList);
		    
		    
		    /***** 2.模型匹配度**/
		    String application_num = creditTask.getApplication_num();
		    String model_flag = "0";	//用于前台控制模型匹配度显示所用
		    Map<String,LinkedHashMap<String,String>> t07_case_model_strMap=new LinkedHashMap<String,LinkedHashMap<String,String>>();
		    ArrayList t07_case_model_strList = new ArrayList();
		    ArrayList modelList = new ArrayList();
		    
		    T07_case_stcr temp = new T07_case_stcr();
		    temp.setApplication_num(application_num);
		    modelList = t07_case_applicationDAO.getModel_list(sqlMap, temp);
		    if(modelList.size() > 0)
		    {
		    	model_flag = "1";
		    }
		    t07_case_model_strList = t07_case_applicationDAO.getT07_case_modelList(sqlMap, temp);
		    
		    
		    if(t07_case_model_strList.size() > 0 && t07_stcrList.size() > 0)
		    {
		    	Iterator iter1 = t07_stcrList.iterator();
				while (iter1.hasNext())
				{
					T07_case_stcr stcr1 = (T07_case_stcr) iter1.next();
					String key = stcr1.getStcr();
					LinkedHashMap modelMap = new LinkedHashMap();
					
					Iterator iter2 = t07_case_model_strList.iterator();
					while (iter2.hasNext())
					{
						T07_case_stcr stcr2 = (T07_case_stcr) iter2.next();
						if(key.equals(stcr2.getStcr()))
							modelMap.put(stcr2.getModel_no(), stcr2.getModel_no());
					}
					t07_case_model_strMap.put(key, modelMap);
				}
		    }
		   request.setAttribute("t07_case_model_strList", t07_case_model_strList);
		   request.setAttribute("modelList", modelList);
		   request.setAttribute("t07_case_model_strMap", t07_case_model_strMap);
		   request.setAttribute("model_flag", model_flag);
		   //add by qiuyun  交易补录是否由案例中 2014-02-13
		   Map sysparaMap=cm.getMapFromCache("t87_syspara");
		   
		   if("1".equals(sysparaMap.get("416")))
		   {
			   request.setAttribute("ctrl_trans", "1");
		   }
		   //end by qiuyun 
		   
		}catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("creditTask", creditTask);
		request.setAttribute("t07_stcrList", t07_stcrList);
		request.setAttribute("pageInfo",pageInfo);
		
		
		return actionMapping.findForward("success");
	}
	
	private ArrayList Adjust_for_gstype(ActionMapping actionMapping, HttpServletRequest request, SqlMapClient sqlMap,ArrayList t07_stcrList) throws SQLException {
		ActionErrors errors = new ActionErrors();
		
		ArrayList list = new ArrayList();
		T03_entity_kindDAO t03_entity_kindDAO = (T03_entity_kindDAO) context.getBean("t03_entity_kindDAO");
		T03_entity_kind t03_entity_kind = new T03_entity_kind();
		
		Iterator iter = t07_stcrList.iterator();
		while (iter.hasNext())
		{
			T07_case_stcr stcr = (T07_case_stcr) iter.next();
			String key = stcr.getStcr();
				list = t03_entity_kindDAO.getGstype(sqlMap,key);
				/** 同一pbcrule下的rule不可能出现不同的gstype*/
				if(list.size() > 1 || list.size() < 1)
				{
					errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.common", "可疑规则" + key + "下的系统规则配置有误！"));
					saveErrors(request, errors);
				}
		}
		return t07_stcrList;
	}

	public ActionForward getT07_case_adviceMoreDisp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
	    ArrayList getT07_case_adviList = new ArrayList();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
		T07_case_application t07_case_application = new T07_case_application();
		
		try {
			String fromcase = request.getParameter("fromcase");
			request.setAttribute("fromcase", fromcase);
			
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			// 从Session中取得Application_num的值
			CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
			String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
			String casesearchtime = StringUtils.null2String(request.getParameter("casesearchtime"));
			if(fromcase!=null && fromcase.equals("1")){
			 application_num = creditTask.getApplication_num();
			 cast_type=creditTask.getCast_type();
			t07_case_application.setCase_name(creditTask.getCase_name());
			t07_case_application.setCase_kind_disp(creditTask.getCase_kind_disp());
			t07_case_application.setCast_type_disp(creditTask.getCast_type_disp());
			t07_case_application.setApp_state_cd_s(creditTask.getApp_state_cd_disp());
			t07_case_application.setApp_dt_disp(creditTask.getApp_dt_disp());
			t07_case_application.setCase_date_disp(creditTask.getCase_date_disp());
			t07_case_application.setAlert_level_disp(creditTask.getAlert_level_disp());
			t07_case_application.setTake_action(creditTask.getTake_action());
			t07_case_application.setAction_descrip(creditTask.getAction_descrip());
			t07_case_application.setCast_type(creditTask.getCast_type());
			casesearchtime=creditTask.getCasesearchtime();
			}
		
			//获取附件列表
			if("2".equals(cast_type)){
			T07_alert_attach t07_alert_attach = new T07_alert_attach();
			
			t07_alert_attach.setApplication_num(application_num);
			ArrayList t07_alert_attachList = t07_alert_attachDAO.getT07_alert_attachList(sqlMap, t07_alert_attach,context);
			request.setAttribute("t07_alert_attachList", t07_alert_attachList);
			}
			// 取得该案例下的所有的案例意见
			t07_case_application.setApplication_num(application_num);
			if(casesearchtime != null){
				t07_case_application.setCasesearchtime(casesearchtime);//可疑案例查询用
			}
			getT07_case_adviList = t07_case_applicationDAO
					.getT07_case_adviList(sqlMap, t07_case_application,
							application_num);
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("getT07_case_adviList", getT07_case_adviList);
//		request.setAttribute("getT47_transaction_moreList",getT47_transaction_moreList);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_stcr_mainList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T03_entity_kindDAO t03_entity_kindDAO = (T03_entity_kindDAO) context.getBean("t03_entity_kindDAO");
		T03_entity_kind t03_entity_kind = new T03_entity_kind();
		try {
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			String tag = (String)sysparaMap.get("801");
			
			CreditTask creditTask = new CreditTask();
			creditTask = (CreditTask) session.getAttribute("credittask");
			String cast_type = creditTask.getCast_type();
			String post_id = creditTask.getPost_id();
			
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			
			/** 通过T21_PBCRULE、T21_RULE、T03_RULE_ENTITY_R获得实体key*/
			ArrayList rtettypekey_list = new ArrayList();
			/** 实体key、实体名称、实体对应的查证key*/
			ArrayList t03_entity_kindList = new ArrayList();
			/** 查证key对应的参数值和参数英文名称(一对多)*/
			Map<String,LinkedHashMap<String,String>> t02_page_in_parmMap = new LinkedHashMap<String,LinkedHashMap<String,String>>();
			if (tag.equals("1")) 
			{
				rtettypekey_list = t03_entity_kindDAO.getRtettypekey_list(sqlMap, stcr);
				if(rtettypekey_list.size()>0)
				{
					String key_str = "";
					Iterator iter = rtettypekey_list.iterator();
					while (iter.hasNext()) 
					{
						T03_entity_kind temp = (T03_entity_kind) iter.next();
						key_str += "'" + temp.getRtettypekey() + "',";
					}
					key_str = key_str.substring(0, key_str.length()-1);;
					t03_entity_kind.setRtettypekey_str(key_str);
					t03_entity_kindList = t03_entity_kindDAO.getT03_entity_kindList2(sqlMap, t03_entity_kind);
					Iterator iter2 = t03_entity_kindList.iterator();
					while (iter2.hasNext()) 
					{
						T03_entity_kind temp2 = (T03_entity_kind) iter2.next();
						String key = temp2.getTplakey();
						LinkedHashMap parmMap = new LinkedHashMap();
						/** 当主体是交易信息501时，需要分情况选择相对应的测试，分别是：可疑编辑岗，可疑非编辑岗，大额*/
						if(key.equals(Constans.TRANS_DE) || key.equals(Constans.TRANS_KY_1) ||key.equals(Constans.TRANS_KY_2))
						{
							if(cast_type.equals("1"))
							{
								key = Constans.TRANS_DE; //大额
							}
							else
								if(post_id.equals("P0102") || post_id.equals("P0302"))
									key = Constans.TRANS_KY_1; //可疑编辑岗
								else
									key = Constans.TRANS_KY_2; //可疑非编辑岗
							temp2.setTplakey(key);
						}
						/** 客户信息也需要分大额和可疑两种主体**/
						else if(key.equals(Constans.PARTY_DE) ||key.equals(Constans.PARTY_KY))
						{
							if(cast_type.equals("1"))
							{
								key = Constans.PARTY_DE; //大额
							}
							else
								key = Constans.PARTY_KY; //可疑
							temp2.setTplakey(key);
						}
						/** 账户信息也需要分大额和可疑两种主体**/
						else if(key.equals(Constans.ACCT_DE) ||key.equals(Constans.ACCT_KY))
						{
							if(cast_type.equals("1"))
							{
								key = Constans.ACCT_DE; //大额
							}
							else
								key = Constans.ACCT_KY; //可疑
							temp2.setTplakey(key);
							
						}
						ArrayList parmList = t03_entity_kindDAO.getT02_page_in_parmList(sqlMap, key);
						Iterator iter3 = parmList.iterator();
						while (iter3.hasNext()) 
						{
							T03_entity_kind temp3 = (T03_entity_kind) iter3.next();
							parmMap.put(temp3.getSysinparmcd(), temp3.getDispname());
						}
						
						t02_page_in_parmMap.put(key, parmMap);
						
					}
				}
				else
				{
					/** root5展示客户信息的链接,
					 *  root6展示账户信息的链接,
					 *  root7展示交易信息的链接,*/
					String root = request.getContextPath() + "/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=";
					String root5 = root + Constans.PARTY_KY + "&" + Constans.PARTY_KY_CASE + "=" + application_num + "&" + Constans.PARTY_KY_STCR + "=" + stcr;
					if(cast_type.equals("1"))
					{
						root5 = root + Constans.PARTY_DE + "&" + Constans.PARTY_DE_CASE + "=" + application_num + "&" + Constans.PARTY_DE_STCR + "=" + stcr;
						//root5 = root + "2474&p_2406=" + application_num + "&p_2407=" + stcr;
					}
					String root6 = root + Constans.ACCT_KY + "&"  +  Constans.ACCT_KY_CASE + "=" + application_num + "&" + Constans.ACCT_KY_STCR + "=" + stcr; 
					if(cast_type.equals("1"))
					{
						root6 = root + Constans.ACCT_DE + "&" + Constans.ACCT_DE_CASE + "=" + application_num + "&" + Constans.ACCT_DE_STCR + "=" + stcr;
						//root6 = root + "2475&p_2409=" + application_num + "&p_2410=" + stcr;
					}
					String root7 = "";
					if(cast_type.equals("1"))
					{
						root7 = root + Constans.TRANS_DE + "&" + Constans.TRANS_DE_CASE + "=" + application_num + "&" + Constans.TRANS_DE_STCR + "=" + stcr;;
						//root7 = root + "2429&p_2346=" + application_num + "&p_2347=" + stcr; //大额
					}
					else
						if(post_id.equals("P0102") || post_id.equals("P0302"))
							root7 = root + Constans.TRANS_KY_1 + "&" + Constans.TRANS_KY_1_CASE + "=" + application_num + "&" + Constans.TRANS_KY_1_STCR + "=" + stcr;//可疑编辑岗
						else
							root7 = root + Constans.TRANS_KY_2 + "&" + Constans.TRANS_KY_2_CASE + "=" + application_num + "&" + Constans.TRANS_KY_2_STCR + "=" + stcr; //可疑非编辑岗
					
					request.setAttribute("root5", root5);
					request.setAttribute("root6", root6);
					request.setAttribute("root7", root7);
				}
			}
			request.setAttribute("stcr", stcr);
			request.setAttribute("application_num", application_num);
			request.setAttribute("tag", tag);
			request.setAttribute("t03_entity_kindList", t03_entity_kindList);
			request.setAttribute("t02_page_in_parmMap", t02_page_in_parmMap);
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
	
	public ActionForward performGetT07_stcr_partyList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_partyList;
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_application = (T07_case_application) session.getAttribute("t07_case_application");
			if (newsearchflag.equals("1")) {// 新的查询
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCase_type(t07_case_application.getCast_type());
				session.setAttribute("t07_case_party", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_party");
			}
			t07_stcr_partyList = t07_case_applicationDAO.getT07_stcr_partyList(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_case_applicationDAO.getT07_stcr_partyListCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/report"
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
		request.setAttribute("t07_stcr_partyList", t07_stcr_partyList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_stcr_acctList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_acctList;
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_application = (T07_case_application) session.getAttribute("t07_case_application");
			if (newsearchflag.equals("1")) {// 新的查询
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCase_type(t07_case_application.getCast_type());
				session.setAttribute("t07_case_acct", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_acct");
			}
			t07_stcr_acctList = t07_case_applicationDAO.getT07_stcr_acctList(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_case_applicationDAO.getT07_stcr_acctListCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/report"
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
		request.setAttribute("t07_stcr_acctList", t07_stcr_acctList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_stcr_transList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_transList;
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
//			String party_id= request.getParameter("party_id");
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_application = (T07_case_application) session.getAttribute("t07_case_application");
			if (newsearchflag.equals("1")) {// 新的查询
				t07_case_stcr.setApplication_num(application_num);
//				t07_case_stcr.setParty_id(party_id);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCase_type(t07_case_application.getCast_type());
				session.setAttribute("t07_case_stran", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_stran");
			}
			t07_stcr_transList = t07_case_applicationDAO.getT07_stcr_transList(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_case_applicationDAO.getT07_stcr_transListCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		  //  session.setAttribute("pageInfo", pageInfo);
		  //  session.setAttribute("t07_stcr_transList", t07_stcr_transList);
		    
		    //在可疑案例认定环节，对于单笔交易删除功能对于明确规定了频繁作为可疑标准筛选条件的可疑标准（三、五、十四、十五、十六、十七）单笔交易的删除功能取消，其他标准可以开放此功能
		    String no_operStcr = "1103;1105;1114;1115;1116;1117";
		    if(stcr != null && !stcr.equals("") && no_operStcr.indexOf(stcr) != -1){
		    	request.setAttribute("no_oper", "true");
		    }
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_stcr_transList", t07_stcr_transList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_stcr_trans_advi(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_transaction t07_case_trans = new T07_case_transaction();

        try{
        	T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String application_num = StringUtils.nullObject2String(request
					.getParameter("application_num"));
			String transactionkey = StringUtils.nullObject2String(request
					.getParameter("transactionkey"));
			String stcr = StringUtils.nullObject2String(request
					.getParameter("stcr"));
			String party_id = StringUtils.nullObject2String(request
					.getParameter("party_id"));
			String acct_num = StringUtils.nullObject2String(request
					.getParameter("acct_num"));
			String flag = StringUtils.nullObject2String(request
					.getParameter("flag"));
			String val2 = StringUtils.nullObject2String(request.getParameter("val2"));
			request.setAttribute("application_num", application_num);
			request.setAttribute("transactionkey", transactionkey);
			request.setAttribute("stcr", stcr);
			request.setAttribute("flag", flag);
			request.setAttribute("party_id", party_id);	
			request.setAttribute("acct_num", acct_num);
			request.setAttribute("val2", val2);	
			CreditTask creditTask = new CreditTask();
			creditTask = (CreditTask) session.getAttribute("credittask");
			t07_case_trans.setCase_type(creditTask.getCast_type());
			String dealTranReason="";
			t07_case_trans.setApplication_num(application_num);
			t07_case_trans.setTransactionkey(transactionkey);
			t07_case_trans.setStcr(stcr);
//			t07_case_trans.setParty_id(party_id);
			t07_case_trans=t07_case_applicationDAO.getT07_case_transactionDisp(sqlMap, t07_case_trans);
			dealTranReason=t07_case_trans.getDealadvise();
			form.setReason(dealTranReason);
		   
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
	 * 特征交易的排除与恢复 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performT07_stcr_trans_advi(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_case_application t07_case_application = new T07_case_application();

		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");

		T07_case_transaction t07_case_trans = new T07_case_transaction();

		ArrayList t07_stcr_transList = new ArrayList();
		ArrayList t07_stcrList = new ArrayList();
		CreditTask creditTask = new CreditTask();
		ArrayList t07_transList = new ArrayList();
		ArrayList transList = new ArrayList();
		String pageInfo = "";
        try{
			String application_num = StringUtils.nullObject2String(request
					.getParameter("application_num"));
			String transactionkey = StringUtils.nullObject2String(request
					.getParameter("transactionkey"));
			String stcr = StringUtils.nullObject2String(request
					.getParameter("stcr"));
			String party_id = StringUtils.nullObject2String(request
					.getParameter("party_id"));
			String acct_num = StringUtils.nullObject2String(request
					.getParameter("acct_num"));
			String flag = StringUtils.nullObject2String(request
					.getParameter("flag"));
			String reason=request.getParameter("reason");
			t07_case_trans.setApplication_num(application_num);
			t07_case_trans.setTransactionkey(transactionkey);
//			t07_case_trans.setParty_id(party_id);
			t07_case_trans.setStcr(stcr);
			t07_case_trans.setDealadvise(reason);
			creditTask = (CreditTask) session.getAttribute("credittask");
			t07_case_trans.setCase_type(creditTask.getCast_type());
			//事务开始
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			if(flag.equals("1")){
				t07_case_trans.setStatus_cd("4");
				
				//修改当前交易表中的交易状态 
				t07_case_trans.setTrans("'"+transactionkey+"'");
				t07_transList = t07_case_applicationDAO.getT07_stcr_trans_notList(sqlMap, t07_case_trans);
				if(t07_transList != null && t07_transList.size() == 1){
					t07_case_applicationDAO.modifyT07_trans_uc_status(sqlMap, t07_case_trans);
				}
			}else{
				t07_case_trans.setStatus_cd("1");
//				t07_stcrList = (ArrayList) session.getAttribute("t07_stcrList");//取得特征列表信息
//			    //如果特征、客户、账户的状态为已排除，则修改为处理中
//				for(int i=0;i<t07_stcrList.size();i++){
//					//System.out.println(t07_stcrList.size());
//			    	T07_case_stcr t07_case_stcr = (T07_case_stcr) t07_stcrList.get(i);
//			    	if(t07_case_stcr.getApplication_num().equals(application_num) && t07_case_stcr.getStcr().equals(stcr)){
//			    		if(t07_case_stcr.getStatus().equals("4")){
//			    			t07_case_stcr.setStatus("1");
//			    			t07_case_stcr.setCase_type(creditTask.getCast_type());
//			    			int rows1 = t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
//							session.setAttribute("t07_stcrList", t07_stcrList);
//			    		}
//			    		break;
//			    	}
//			    }

				//修改当前交易表中的交易状态 
				t07_case_trans.setTrans("'"+transactionkey+"'");
				t07_case_applicationDAO.modifyT07_trans_uc_status(sqlMap, t07_case_trans);
				
			}
			if(flag.equals("1")){
				t07_case_trans.setStatus_cd("4");
			}else{
				t07_case_trans.setStatus_cd("1");
				//如果特征、客户、账户的状态为已排除，则修改为处理中
				T07_case_stcr t07_case_stcr = new T07_case_stcr(); 
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setParty_id(party_id);
				t07_case_stcr.setAcct_num(acct_num);
    			t07_case_stcr.setStatus("1");
    			t07_case_stcr.setCase_type(creditTask.getCast_type());
    			
				//1. 如果特征的状态为已排除，则修改为处理中
    			int rows1 = t07_case_applicationDAO.modifyT07_case_stcr_status1(sqlMap, t07_case_stcr);
    			
				//2. 如果客户的状态为已排除，则修改为处理中
    			rows1 = t07_case_applicationDAO.modifyT07_case_party_status(sqlMap, t07_case_stcr);
    			
				//3. 如果账户的状态为已排除，则修改为处理中
    			rows1 = t07_case_applicationDAO.modifyT07_case_acct_status(sqlMap, t07_case_stcr);
    			
    			//4.add by lee 如果恢复的该交易“验证未通过”0，且该案例目前的状态是”验证通过“1，则需将案例状态置为“未通过”0.案例验证状态的修改 不能在提交时处理
    			String val2 = StringUtils.nullObject2String(request.getParameter("val2"));
    			if(creditTask.getValidate_ind().equals("1") &&"0".equals(val2))
    			{
    				rows1 = t07_case_applicationDAO.modifyT07_case_app_val(sqlMap, application_num);
    			}
			}
			
			//4. 修改特征交易状态
			int row = t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
			
//			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
//			Authorization auth = authBean.getAuthToken();
//				
//			 // 1.初始化日志对象
//			T00_operate_log t00_operate_log=new T00_operate_log();
//			t00_operate_log.setModule_key_sub1("特征交易的排除与恢复 ");//子功能点1级
//			t00_operate_log.setModule_key_sub2("");//子功能点2级
//			t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
//			t00_operate_log.setOperate_obj2("");//操作对象2级
//			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
//			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
//			t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
//			// 2.写操作日志
//			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
		    sqlMap.commitTransaction();
		   
		    //事务结束
		    String loadurl="report/case/stcr_trans_list.do?stcr="+stcr+"&application_num="+application_num+"&newsearchflag=1";
		    request.setAttribute("loadurl", loadurl);
		    String check_flag=request.getParameter("check_flag");
		    request.setAttribute("check_flag", check_flag);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		request.setAttribute("t07_stcr_transList", t07_stcr_transList);
//		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	
	
	public ActionForward performModifyT07_case_stcr(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		String pageInfo = "";
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
        ArrayList t07_pbcruleList=new ArrayList();
		try {
			
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
//			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			String stcr = StringUtils.null2String(request.getParameter("stcr"));
 
			request.setAttribute("application_num", application_num);
//			request.setAttribute("party_id", party_id);
			request.setAttribute("stcr", stcr);
            

//            }
			t07_pbcruleList = t07_case_applicationDAO.getT07_pbcruleList2(sqlMap);

			request.setAttribute("t07_pbcruleList", t07_pbcruleList);
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
	
	private ActionForward performModifyT07_case_stcrDo(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		try{
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
			String stcr = StringUtils.null2String(request.getParameter("stcr"));
			String stcrkey = StringUtils.null2String(request.getParameter("stcrkey"));
//			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			
			t07_case_stcr.setApplication_num(application_num);
			t07_case_stcr.setStcr(stcr);
			t07_case_stcr.setStcrkey(stcrkey);
//			t07_case_stcr.setParty_id(party_id);
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			/** 修改可疑案例特征表中特征信息*/
			t07_case_applicationDAO.modifyT07_case_stcr(sqlMap, t07_case_stcr);
			/** 修改可疑案例交易表中特征信息*/
			t07_case_applicationDAO.modifyT07_case_trans_stcr(sqlMap, t07_case_stcr);
			
			sqlMap.commitTransaction();
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	

	
	
	public ActionForward performAddCase_advi(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_app_movefate t07_app_movefate = new T07_app_movefate();
		try {
			T07_app_movefateActionForm form = (T07_app_movefateActionForm) actionForm;
			// 组织用户所属的机构ID
			CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
			String application_num = creditTask.getApplication_num();
			String post_id = creditTask.getPost_id();
			String node_id = creditTask.getNode_id();
			String flow_id = creditTask.getFlow_id();
			t07_app_movefate.setApplication_num(application_num);
			t07_app_movefate.setCurr_post(post_id);
			t07_app_movefate.setCurr_node(node_id);
			t07_app_movefate.setFlow_id(flow_id);
			ArrayList t07_app_movefateList = t07_case_applicationDAO.getCase_advi(sqlMap, t07_app_movefate);
			if (t07_app_movefateList != null && t07_app_movefateList.size() > 0) {
				t07_app_movefate = (T07_app_movefate) t07_app_movefateList.get(0);
			}
			MyBeanUtils.copyBean2Bean(form, t07_app_movefate);
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

	public ActionForward performAddCase_adviDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_advi t07_case_advi = new T07_case_advi();
		T07_app_movefate t07_app_movefate = new T07_app_movefate();
		T07_FlowBo t07_flowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		try {
			T07_app_movefateActionForm form = (T07_app_movefateActionForm) actionForm;
			//当前登录用户
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String userName = auth.getT00_user().getUsername();
			t07_app_movefate.setLast_upd_user(userName);
			t07_app_movefate.setLast_upd_dt(DateUtils.getCurrDateTime());
			t07_app_movefate.setCreate_dt(DateUtils.getCurrDateTime());
			t07_app_movefate.setCurrent_ind("1");
			t07_app_movefate.setApplication_advice(request.getParameter("application_advice"));
			//从Session中取得Application_num等的值
			CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
			String application_num = creditTask.getApplication_num();
			String post_id = creditTask.getPost_id();
			String node_id = creditTask.getNode_id();
			String flow_id = creditTask.getFlow_id();
			String curr_org = creditTask.getApp_org_id();
			Long seq_num = t07_flowBo.getNex_seqNumValue(creditTask,sqlMap);
			t07_app_movefate.setApplication_num(application_num);
			t07_app_movefate.setCurr_node(node_id);
			t07_app_movefate.setCurr_post(post_id);
			t07_app_movefate.setFlow_id(flow_id);
			t07_app_movefate.setSeq_num(seq_num); // 流程序号
			t07_app_movefate.setCurr_org(curr_org); // 当前机构
			t07_app_movefate.setRecheck_num(Long.valueOf("0")); 
			ArrayList t07_app_movefateList = t07_case_applicationDAO.getCase_advi(sqlMap, t07_app_movefate);
			if (t07_app_movefateList != null && t07_app_movefateList.size() > 0) {
				int rows = t07_case_applicationDAO.modifyCase_advi(sqlMap,t07_app_movefate);
			} else {
				int rows = t07_case_applicationDAO.insertCase_advi(sqlMap,t07_app_movefate);
			}
            session.setAttribute("reason", "true");
            
         // 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("添加案例处理意见");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(application_num);//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc(t07_app_movefate.getApplication_advice());//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reason", "true");
		return actionMapping.findForward("success");
	}
	
	/** end by lixx **/
	
	/**
	 * 新增案例可疑完成
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
	public ActionForward performGetT07_case_app_add_ky_n_comp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
	
		T47_transactionDAO t47_transactionDao=(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T07_FlowBo flowbo=(T07_FlowBo)context.getBean("t07_flowBo");
		T07_case_stcrDAO  t07_case_stcrDAO=(T07_case_stcrDAO)context.getBean("t07_case_stcrDAO");
		T07_case_transactionDAO t07_case_transactionDao=(T07_case_transactionDAO)context.getBean("t07_case_transactionDAO");
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		try {	
			T07_nbs_ctifActionForm form =(T07_nbs_ctifActionForm)actionForm;
			Map transMap=(Map)session.getAttribute("case_transMap");
			Map partyMap=(Map)session.getAttribute("case_partyMap");
			
			String acct_num=""; String maxorgankey=""; double comp_amt=0;
			String[] stcrs=request.getParameterValues("list2");
			boolean isHasTrans=true;
			if(transMap==null||transMap.size()==0)
			{
				isHasTrans=false;
				//验证是否是可疑无交易的案例
				LinkedHashMap ky_no_trans= cm.getMapFromCache("ky_no_trans");			
				for(int i=0;i<stcrs.length;i++)
				{
					if(!ky_no_trans.containsKey(stcrs[i]))
					{
						throw new Exception(stcrs[i]+"不是可疑无交易的特征，请添加交易");
					}
				}
				
			}
			HashMap acctHash=new HashMap();
			
			//交易总金额
			double tran_amt=0;
			if(isHasTrans)
			{
				
				Iterator iter=transMap.values().iterator();
				while(iter.hasNext())					
				{
					T47_transaction temp=(T47_transaction)iter.next();
					acct_num=StringUtils.null2String(temp.getAcct_num());
					tran_amt+=temp.getAmt().doubleValue();	
					if(temp.getAmt().doubleValue()>comp_amt){
						comp_amt=temp.getAmt().doubleValue();	
						maxorgankey=StringUtils.null2String(temp.getOrgankey());
					}
					if(!acct_num.equals(""))
					acctHash.put(acct_num, "");
				}
			}
			String organkey=request.getParameter("organkey");
			String organtype=StringUtils.null2String(sysConfig.getProperty("rule.obj_type"));
		       if(!organtype.equals("")){
		    	   if(organtype.equals("3")){//交易金额最大的账户机构
		    		 if(!acct_num.equals("")) {
		    			 T47_agreementDAO t47_agreementDAO = (T47_agreementDAO)context.getBean("t47_agreementDAO");
		    			 T47_agreement t47_agreement =t47_agreementDAO.getT47_agreementDisp(sqlMap, acct_num);
		    			 if(t47_agreement.getOp_org_num()!=null && !t47_agreement.getOp_org_num().equals(""))
		    			 organkey=t47_agreement.getOp_org_num();
		    		 }
		    	   }
		    	   if(organtype.equals("4")){//交易金额最大的交易机构
		    		  if(!maxorgankey.equals("")) {
		    			  organkey= maxorgankey;
		    		  }
		    	   }
		    	   
		       }
			//保存数据
			//t47_party_uc			
			
					
//			if("".equals(form.getCsnm())){
//				
//				t47_party_uc.setParty_id("YC"+DateUtils.FormatDate(new Date(), "yyyyMMddhhmmss"));
//				
//			}
//			else
//			{
//				t47_party_uc.setParty_id(form.getCsnm());
//			}
//			t47_party_uc.setHost_cust_id(t47_party_uc.getParty_id());		
//			t47_party_uc.setAml2_type_cd(form.getCttp());
//			if("02".equals(form.getCttp()))
//			{
//				t47_party_uc.setParty_class_cd("I");	
//			}else
//			{
//				t47_party_uc.setParty_class_cd("C");	
//			}
			
//			t47_party_uc.setParty_chn_name(form.getCtnm());
			
//			if("19".equals(form.getCitp())||"29".equals(form.getCitp())){
//				t47_party_uc.setCard_type(form.getCitp()+form.getCard_type_inf());
//			}else
//			{
//				t47_party_uc.setCard_type(form.getCitp());
//			}
			
			
		
//			t47_party_uc.setCard_no(form.getCtid());
//			t47_party_uc.setCountry_cd(form.getCtnt());
//			t47_party_uc.setAddr1(StringUtils.nullToStr(form.getAddr1()));
//			t47_party_uc.setTel_no(StringUtils.nullToStr(form.getTel_no()));
//			t47_party_uc.setOrgankey(organkey);
//			t47_party_uc.setIndustrykey(form.getCtvc());
			
//			if(form.getEnrol_fund_amt()== null || (form.getEnrol_fund_amt()!= null&&"".equals(form.getEnrol_fund_amt()))) 
//			{
//				t47_party_uc.setEnrol_fund_amt("0");
//			}
//			else
//				t47_party_uc.setEnrol_fund_amt((form.getEnrol_fund_amt()));
//			t47_party_uc.setLegal_obj(StringUtils.nullToStr((form.getLegal_obj())));
//			if("19".equals(form.getLegal_card_type())||"29".equals(form.getLegal_card_type())){
//				t47_party_uc.setLegal_card_type(StringUtils.nullToStr(form.getLegal_card_type()+form.getLegal_card_type_inf()));
//			}else
//			{
//				t47_party_uc.setLegal_card_type(StringUtils.nullToStr(form.getLegal_card_type()));	
//			}
//				
//			t47_party_uc.setLegal_card_no(StringUtils.nullToStr(form.getLegal_card_no()));
//			t47_party_uc.setOccupation(StringUtils.nullToStr(form.getCtvc_i()));
//			t47_party_uc.setValidate_ind2("1");
			
		
			
			
			
			//t07_case_application
			T07_case_application t07_case_application=new T07_case_application();
			
			String currtime=DateUtils.getDate10to8(DateUtils.getCurrTime()); //当前时间
			String casenum=this.getSequenceNextVal("t07_case_application_app");
			String application_num= "C"+currtime+casenum;
			
			
			
			
			t07_case_application.setApplication_num(application_num);//案例编号
			t07_case_application.setRecheck_num(new Long(0));//上报次数
			t07_case_application.setFlow_id(this.getFlow_id("2", form.getCurr_cd(), ""));//流程id
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));//创建日期
			if(organkey == null || ("".equals(organkey) && organkey != null))
				organkey = form.getFicd();
			t07_case_application.setApp_org_id(organkey);//创建机构
			t07_case_application.setCase_name("BS"+application_num);//案例名称
			t07_case_application.setCast_type("2");//案例类型
			
			t07_case_application.setCase_level("0");//案例级别
			
			
			t07_case_application.setApp_state_cd("1");//状态
			t07_case_application.setDate_status_cd("1");//数据来源
			t07_case_application.setLast_upd_dt(new Date());//上次更新时间
			
			//modify by qiuyun 2011-07-04 如果配置了302（前台是否进行验证操作） 则新增的案例时生成到编辑岗，否则案例直接到审核岗
			LinkedHashMap sysparaMap=cm.getMapFromCache("t87_syspara");
			String flag=StringUtils.nullObject2String(sysparaMap.get("302"));
			if("1".equals(flag)){
				
				if("02".equals(t07_case_application.getFlow_id()))
				{
					t07_case_application.setPost_id("P0102");
				}else
				{
					t07_case_application.setPost_id("P0302");
				}
							
				
			}else
			{
				
				if("02".equals(t07_case_application.getFlow_id()))
				{
					t07_case_application.setPost_id("P0103");
				}else
				{
					t07_case_application.setPost_id("P0303");
				}
			}
			//end by qiuyun 
			
			if(isHasTrans)
			{
				t07_case_application.setTran_count(new Long(transMap.size()));
			}else
			{
				t07_case_application.setTran_count(new Long(0));
			}
			t07_case_application.setTran_amt(new Double(tran_amt));
			
			t07_case_application.setAcct_count(new Long(acctHash.size()));
			t07_case_application.setParty_count(new Long(1));
			//根据flow_id 和post_id 取节点id
		
			T07_node t07_node=new T07_node();
			t07_node.setFlow_id(t07_case_application.getFlow_id());
			t07_node.setPost_id(t07_case_application.getPost_id());
			t07_node.setIs_use("1");
			t07_case_application.setNode_id(flowbo.getNode_id(sqlMap, t07_node));
			
			AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());//上次更新用户
			//t07_case_application.setApp_case_reason();//申请原因
			
			//数据日期取所有交易的最大日期
			String validate_ind="1";
			Date data_dt=DateUtils.stringToDateShort(DateUtils.getCurrTime());
			if(isHasTrans)
			{
				Date mindate=null;
				Date maxdate=null;
				int i=0;
				Iterator iter=transMap.values().iterator();
				while(iter.hasNext())				{
					T47_transaction temp=(T47_transaction)iter.next();
					if(i==0){
						mindate=temp.getTx_dt();
						maxdate=temp.getTx_dt();
					}else{
						if(temp.getTx_dt().before(mindate))
						{
							mindate=temp.getTx_dt();
						}
						if(temp.getTx_dt().after(maxdate))
						{
							maxdate=temp.getTx_dt();
						}
					}
					i++;
				}
				t07_case_application.setCase_tran_mindate(mindate);//交易最小时间
				t07_case_application.setCase_tran_maxdate(maxdate);//交易最大时间
				data_dt=maxdate;
			}
			data_dt=DateUtils.stringToDateShort(DateUtils.dateToStringShort(data_dt));

			//失效日期
			
			String invalid_dt=this.getWorkDate(sqlMap,data_dt, "10", "C");		
			t07_case_application.setCase_date(data_dt);//案例时间
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(invalid_dt));//案例失效时间
			Date now=DateUtils.stringToDateShort(DateUtils.dateToStringShort(new Date()));
			if(now.compareTo(t07_case_application.getCase_end_date())<=0)
			{
				t07_case_application.setCase_kind("N");//案例种类 正常
			}else
			{
				t07_case_application.setCase_kind("A");//案例种类补报
			}
			
			t07_case_application.setCurr_cd(form.getCurr_cd());//币种
			t07_case_application.setParty_class_cd("");//公私标志
			t07_case_application.setTake_action(form.getTkms());//采取措施
			t07_case_application.setAction_descrip(form.getSsds());//可疑行为描述
			
			t07_case_application.setAlert_level(form.getSsdg());//可疑程度
			
			
			
			
			//写t07_case_stcr
			sqlMap.startTransaction();
			
			T07_case_stcr t07_case_stcr=new T07_case_stcr();
			t07_case_stcr.setApplication_num(application_num);
			t07_case_stcr.setStatus("1");
			t07_case_stcr.setCase_date(data_dt);
			if(isHasTrans){
				t07_case_stcr.setTfrans_count(transMap.size());
					
			}
			
			T47_partyDAO t47_party_ucdao=(T47_partyDAO)context.getBean("t47_partyDAO");
			String party_id="";
			String party_class_cd="";
			String party_name="";
			Iterator iter2=partyMap.values().iterator();
			while(iter2.hasNext())					
			{
				T47_party temp=(T47_party)iter2.next();
				int uc = 0;
				if(temp.getIs_party().equals("1"))
				{
					
					boolean isExist=t47_party_ucdao.isExist(sqlMap, temp);
					if(!isExist){
						uc=t47_party_ucdao.insertT47_party_uc(sqlMap, temp);
					}else{
						uc=t47_party_ucdao.modifyT47_party_uc2(sqlMap, temp);
					}
				}
				else
				{
					temp.setOrgankey(form.getFicd());
					uc = t47_party_ucdao.insertT47_party_uc(sqlMap, temp);
				}
				party_id=temp.getParty_id();
				party_class_cd=temp.getParty_class_cd();
				party_name=temp.getParty_chn_name();
				t07_case_stcr.setParty_id(temp.getParty_id());
				if(isHasTrans){
				
				}else
				{
					t07_case_stcr.setTfrans_count(0);
					for(int i=0;i<stcrs.length;i++)
					{
						t07_case_stcr.setStcr(stcrs[i]);
						
						t07_case_stcrDAO.insertT07_case_stcr_ky(sqlMap, t07_case_stcr);
					}
					
				}
				
			}
			t07_case_application.setParty_id(party_id);//客户ID
			t07_case_application.setObjkey(party_id);//客户ID
			t07_case_application.setParty_name(party_name);//客户名称
			t07_case_application.setParty_class_cd(party_class_cd);
			
			
			//当有交易的时候才写t07_case_transaction表和t47_transaction_uc表
			if(isHasTrans){
			//t07_case_transaction
			T07_case_transaction t07_case_transaction=new T07_case_transaction();
			
			t07_case_transaction.setApplication_num(application_num);
			t07_case_transaction.setStatus_cd("1");	
			
			t07_case_transaction.setCase_date(data_dt);
				for(int i=0;i<stcrs.length;i++)
				{
					t07_case_transaction.setStcr(stcrs[i]);
					
					{
						Iterator iter=transMap.values().iterator();
						while(iter.hasNext())
						{
							T47_transaction temp=(T47_transaction)iter.next();
							t07_case_transaction.setTransactionkey(temp.getTransactionkey());
							t07_case_transaction.setParty_id(temp.getParty_id());
							t07_case_transaction.setAcct_num(StringUtils.null2String(temp.getAcct_num()));
							t07_case_transaction.setAmt(temp.getAmt());
							t07_case_transactionDao.insertT07_case_transaction_ky(sqlMap, t07_case_transaction);
						}
						
					}
					
				}
				
				
				
				T47_agreementDAO t47_agreementDAO=new T47_agreementDAO();
				//t47_transaction_uc表 
				//如果有新增的交易则先插t47_transaction
				String transactionkeys="";
				String acctnums="";
				Iterator iter=transMap.values().iterator();				
				while(iter.hasNext())
				{
					T47_transaction temp=(T47_transaction)iter.next();
					String transactionkey=temp.getTransactionkey();				
					
					
					//是新增则插入
					//if(count==0)
					temp.setHandle_status_cd("1");
					if(temp.getTxt()!=null && temp.getTxt().equals("04"))
					{		
						
						int row=t47_transactionDao.insertT47_transaction_all_field(sqlMap, temp);
					}
					//判断是否在UC表中,在则更新 ，不在插入
										
					if(temp.getValidate_ind2()==null ||"".equals(temp.getValidate_ind2().trim())){
						temp.setValidate_ind2("0");
						validate_ind="0";
					}
					T47_transaction  uc= t47_transactionDao.getT47_transaction_uc_from_key(sqlMap,transactionkey);
					if(uc==null)
					{	
						transactionkeys=transactionkeys+",'"+transactionkey+"'"	;
						if(temp.getAcct_num()!=null && !temp.getAcct_num().equals("")){
							acctnums=acctnums+",'"+temp.getAcct_num()+"'";
//							查询账户在t47_acct_uc中是否存在
							T47_agreement t47_agreement =t47_agreementDAO.getT47_acct_ucDisp(sqlMap, temp.getAcct_num());
							if(t47_agreement!=null && t47_agreement.getAcct_num().equals("")){
							
							int row=t47_transactionDao.insertT47_acct_uc(sqlMap, acctnums.substring(1));
							if(row<=0){
								row=t47_transactionDao.insertT47_acct_uc1(sqlMap, temp);
							}
							}
						}
						
					}else						
					{	
						//可疑验证标志
						if(uc.getValidate_ind2()!=null&&!"".equals(uc.getValidate_ind2()))
						{
							temp.setValidate_ind2(StringUtils.null2String(uc.getValidate_ind2()));
							if(!uc.getValidate_ind2().equals("1")){
								validate_ind="0";
							}
						}else
						{
							temp.setValidate_ind2(StringUtils.null2String(temp.getValidate_ind2()));
						}
						//大额验证标志
						
						temp.setValidate_ind(StringUtils.null2String(uc.getValidate_ind()));
						
						int row=t47_transactionDao.updateT47_transaction_uc(sqlMap,temp);
					}
						
				}
				if(!transactionkeys.equals("")){
					transactionkeys=transactionkeys.substring(1);
					int row=t47_transactionDao.insertT47_transaction_uc_all_field1(sqlMap, transactionkeys);
					row=t47_transactionDao.updateT47_transaction_uc_2(sqlMap, transactionkeys);
				}
				//插入案例特征
				t07_case_stcrDAO.insertT07_case_stcr_ky1(sqlMap, t07_case_stcr);
			}
			
			
			T07_case_applicationDAO t07_case_applicationDao= (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
			//判断生成案例时的验证状态
			t07_case_application.setValidate_ind(validate_ind);//是否通过验证
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
		
            //查询该客户是否是白灰和我行账户名单
			t07_case_application=t07_case_applicationDao.getT07_writegrepList(sqlMap,t07_case_application);
			int app=t07_case_applicationDao.insertT07_case_application_all_field(sqlMap, t07_case_application);
			
			// 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("创建可疑案例信息");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
			sqlMap.commitTransaction();
			session.removeAttribute("case_transMap");
			session.removeAttribute("case_partyMap");
						
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.common","新增案例成功！"));			
			saveErrors(request, errors);
			
			
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.common",e.getMessage()));			
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();logger.error(e);
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common","插入数据失败！"));			
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
		}
		
		return actionMapping.findForward("success");
	}
	
	
	/**
	 * 新增案例大额完成
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
/*	public ActionForward performGetT07_case_app_add_de_n_comp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		
		
			T47_transactionDAO t47_transactionDao=(T47_transactionDAO)context.getBean("t47_transactionDAO");
			T07_FlowBo flowbo=(T07_FlowBo)context.getBean("t07_flowBo");
			XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		try {	
			T07_nbs_ctifActionForm form =(T07_nbs_ctifActionForm)actionForm;
			Map transMap=(Map)session.getAttribute("case_transMap");
			Map partyMap=(Map)session.getAttribute("case_partyMap");
			
			String acct_num=""; String maxorgankey=""; double comp_amt=0;
			//验证交易日期和交易金额
			double total_cny=0;
			double total_usd=0;
			double tran_amt=0;
			HashMap acctHash=new HashMap();
			boolean validate_date=false;
			String tx_dt_first="";
			Date data_dt=DateUtils.stringToDateShort(DateUtils.getCurrTime());
			{
			int i=0;
			Iterator iter =transMap.values().iterator();
			
			
			while(iter.hasNext())
			{
				T47_transaction temp=(T47_transaction)iter.next();
				data_dt=temp.getTx_dt();
				if(transMap.size()==1){
					validate_date=true;
				}else
				{
					String tx_dt_next=DateUtils.dateToStringShort(temp.getTx_dt());
					if(i==0)
					{
						tx_dt_first=tx_dt_next;
					}
					
					if(tx_dt_first.equals(tx_dt_next)){
						validate_date=true;
					}else
					{
						validate_date=false;
						break;
					}
				}
				acct_num=StringUtils.null2String(temp.getAcct_num());
				if(temp.getAmt().doubleValue()>comp_amt){
					comp_amt=temp.getAmt().doubleValue();
					
					maxorgankey=StringUtils.null2String(temp.getOrgankey());
				}
				if(!acct_num.equals(""))
				acctHash.put(acct_num, "");
				tran_amt+=temp.getAmt().doubleValue();
				total_cny+=temp.getCny_amt().doubleValue();
				total_usd+=temp.getUsd_amt().doubleValue();
				i++;
			}
			data_dt=DateUtils.stringToDateShort(DateUtils.dateToStringShort(data_dt));
			
			//验证交易日期必须为同一日期
			
			if(validate_date==false)
			{
				throw new Exception("所有交易日期必须相同！");
			}
			}
			//验证交易金额必须与特征的金额对应
			String errMes="";
			String stcr=form.getStcr();
			if("DE01".equals(stcr))
			{
				if(total_cny<Constans.cny_DE01 && total_usd<Constans.usd_DE01)
				{
					errMes="交易金额与大额交易特征0901不符!";
				}
			}else if("DE02".equals(stcr))
			{
				if(total_cny<Constans.cny_DE02 && total_usd<Constans.usd_DE02)
				{
					errMes="交易金额与大额交易特征0902不符!";
				}
			}
			else if("DE03".equals(stcr))
			{
				if(total_cny<Constans.cny_DE03 &&total_usd<Constans.usd_DE03)
				{
					errMes="交易金额与大额交易特征0903不符!";
				}
			}else
			{
				if(total_usd<Constans.usd_DE04)
				{
					errMes="交易金额与大额交易特征0904不符!";
				}
			}
			if(!"".equals(errMes))
			{
				throw new Exception(errMes);
			}
				
	     String organkey=request.getParameter("organkey"); //客户的归属机构
	       String organtype=StringUtils.null2String(sysConfig.getProperty("rule.obj_type"));
	       if(!organtype.equals("")){
	    	   if(organtype.equals("3")){//交易金额最大的账户机构
	    		 if(!acct_num.equals("")) {
	    			 T47_agreementDAO t47_agreementDAO = (T47_agreementDAO)context.getBean("t47_agreementDAO");
	    			 T47_agreement t47_agreement =t47_agreementDAO.getT47_agreementDisp(sqlMap, acct_num);
	    			 if(t47_agreement.getOp_org_num()!=null && !t47_agreement.getOp_org_num().equals(""))
	    			 organkey=t47_agreement.getOp_org_num();
	    		 }
	    	   }
	    	   if(organtype.equals("4")){//交易金额最大的交易机构
	    		  if(!maxorgankey.equals("")) {
	    			  organkey= maxorgankey;
	    		  }
	    	   }
	    	   
	       }
			
			//t47_party_uc			
			
					
//			if("".equals(form.getCsnm())){
//				
//				t47_party_uc.setParty_id("YC"+DateUtils.FormatDate(new Date(), "yyyyMMddhhmmss"));
//				
//			}
//			else
//			{
//				t47_party_uc.setParty_id(form.getCsnm());
//			}
//			t47_party_uc.setHost_cust_id(t47_party_uc.getParty_id());		
//			t47_party_uc.setAml2_type_cd(form.getCttp());
//			if("02".equals(form.getCttp()))
//			{
//				t47_party_uc.setParty_class_cd("I");	
//			}else
//			{
//				t47_party_uc.setParty_class_cd("C");	
//			}
//			
//			t47_party_uc.setParty_chn_name(form.getCtnm());
//			
//			if("19".equals(form.getCitp())||"29".equals(form.getCitp())){
//				t47_party_uc.setCard_type(form.getCitp()+form.getCard_type_inf());
//			}else
//			{
//				t47_party_uc.setCard_type(form.getCitp());
//			}
//			
//			
//			t47_party_uc.setCard_no(form.getCtid());
//			t47_party_uc.setCountry_cd(form.getCtnt());
//			t47_party_uc.setAddr1(form.getAddr1());
//			t47_party_uc.setTel_no(form.getTel_no());
//			t47_party_uc.setOrgankey(organkey);
//			t47_party_uc.setIndustrykey(form.getCtvc());						
//			
//			if(form.getEnrol_fund_amt()== null || (form.getEnrol_fund_amt()!= null&&"".equals(form.getEnrol_fund_amt()))) 
//			{
//				t47_party_uc.setEnrol_fund_amt("0");
//			}
//			else
//				t47_party_uc.setEnrol_fund_amt((form.getEnrol_fund_amt()));
//			t47_party_uc.setLegal_obj(form.getLegal_obj());
//			if("19".equals(form.getLegal_card_type())||"29".equals(form.getLegal_card_type())){
//				t47_party_uc.setLegal_card_type(form.getLegal_card_type()+form.getLegal_card_type_inf());
//			}else
//			{
//				t47_party_uc.setLegal_card_type(form.getLegal_card_type());	
//			}
//			t47_party_uc.setLegal_card_no(form.getLegal_card_no());
//			t47_party_uc.setOccupation(form.getCtvc_i());
//			t47_party_uc.setValidate_ind("1");
			
			T47_partyDAO t47_party_ucdao=(T47_partyDAO)context.getBean("t47_partyDAO");
			Iterator iter2=partyMap.values().iterator();
			while(iter2.hasNext())					
			{
				T47_party temp=(T47_party)iter2.next();
				int uc = 0;
				if(temp.getIs_party().equals("1"))
				{
					boolean isExist=t47_party_ucdao.isExist(sqlMap, temp);
					if(!isExist){
						uc=t47_party_ucdao.insertT47_party_uc(sqlMap, temp);
					}else{
						uc=t47_party_ucdao.modifyT47_party_uc2(sqlMap, temp);
					}
				}
				else
				{
					temp.setOrgankey(form.getFicd());
					uc = t47_party_ucdao.insertT47_party_uc(sqlMap, temp);
				}
			}
			
			//t07_case_application
			T07_case_application t07_case_application=new T07_case_application();
			String currtime=DateUtils.getDate10to8(DateUtils.getCurrTime()); //当前时间
			String casenum=this.getSequenceNextVal("t07_case_application_app");
			String application_num= "C"+currtime+casenum;
			t07_case_application.setApplication_num(application_num);//案例编号
			t07_case_application.setRecheck_num(new Long(0));//上报次数
			t07_case_application.setFlow_id(this.getFlow_id("1", form.getCurr_cd(), ""));//流程id
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));//创建日期				
			if(organkey == null || ("".equals(organkey) && organkey != null))
				organkey = form.getFicd();
			t07_case_application.setApp_org_id(organkey);//创建机构
			t07_case_application.setCase_name("BH"+application_num);//案例名称
			t07_case_application.setCast_type("1");//案例类型
			//t07_case_application.setCase_kind("N");//案例种类
			t07_case_application.setCase_level("0");//案例级别
			
			t07_case_application.setParty_id("");//客户ID
			t07_case_application.setObjkey("");
			t07_case_application.setParty_name("");//客户名称
			
			t07_case_application.setApp_state_cd("1");//状态：处理中
			
			//根据配置判断大额是否走流程，设置案例状态
			Map t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			if(t87_sysparaMap.containsKey("300"))
			{
				String para=(String)t87_sysparaMap.get("300");
				if("0".equals(para))//大额不走流程
				{
					t07_case_application.setApp_state_cd("2");//状态：已审批
				}
			}
			
			
			t07_case_application.setDate_status_cd("1");//数据来源
			t07_case_application.setLast_upd_dt(new Date());//上次更新时间
			
			//modify by qiuyun 2011-07-04 如果配置了302（前台是否进行验证操作） 则新增的案例时生成到编辑岗，否则案例直接到审核岗
	
			String flag=StringUtils.nullObject2String(t87_sysparaMap.get("302"));
			if("1".equals(flag)){
				
				if("01".equals(t07_case_application.getFlow_id()))
				{
					t07_case_application.setPost_id("P0102");
				}else
				{
					t07_case_application.setPost_id("P0302");
				}
							
				
			}else
			{
				
				if("01".equals(t07_case_application.getFlow_id()))
				{
					t07_case_application.setPost_id("P0103");
				}else
				{
					t07_case_application.setPost_id("P0303");
				}
			}
			//end by qiuyun 
			
			t07_case_application.setTran_count(new Long(transMap.size()));
			t07_case_application.setTran_amt(new Double(tran_amt));
			t07_case_application.setParty_count(new Long(1));
			t07_case_application.setAcct_count(new Long(acctHash.size()));
			//根据flow_id 和post_id 取节点id
		
			T07_node t07_node=new T07_node();
			t07_node.setFlow_id(t07_case_application.getFlow_id());
			t07_node.setPost_id(t07_case_application.getPost_id());
			t07_node.setIs_use("1");
			t07_case_application.setNode_id(flowbo.getNode_id(sqlMap, t07_node));
			
			
			AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());//上次更新用户
			//t07_case_application.setApp_case_reason();//申请原因
			
			//数据日期取所有交易的最大日期
			
			
			t07_case_application.setCase_tran_mindate(data_dt);//交易最小时间
			t07_case_application.setCase_tran_maxdate(data_dt);//交易最大时间
			//data_dt=maxdate;
			
			//失效日期
			
			String invalid_dt=this.getWorkDate(sqlMap,data_dt, "5", "C");
			t07_case_application.setCase_date(data_dt);//案例时间
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(invalid_dt));//案例失效时间
			if(new Date().compareTo(t07_case_application.getCase_end_date())<=0)
			{
				t07_case_application.setCase_kind("N");//案例种类 正常
			}else
			{
				t07_case_application.setCase_kind("A");//案例种类补报
			}
			
			t07_case_application.setCurr_cd(form.getCurr_cd());//币种
			t07_case_application.setParty_class_cd("");//公私标志
			
			//写t07_case_stcr
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			//sqlMap.startBatch();
			T07_case_stcr t07_case_stcr=new T07_case_stcr();
			t07_case_stcr.setApplication_num(application_num);
//			t07_case_stcr.setParty_id(t47_party_uc.getParty_id());
//			t07_case_stcr.setParty_class_cd(t47_party_uc.getParty_class_cd());
			t07_case_stcr.setStatus("1");
			t07_case_stcr.setStcr(form.getStcr());
			t07_case_stcr.setTfrans_count(transMap.size());
			t07_case_stcr.setCase_date(data_dt);
			
			
			
			//t07_case_transaction
			T07_case_transaction t07_case_transaction=new T07_case_transaction();
			T07_case_transactionDAO t07_case_transactionDao=new T07_case_transactionDAO();
			t07_case_transaction.setApplication_num(application_num);
			t07_case_transaction.setStatus_cd("1");	
			
			t07_case_transaction.setCase_date(data_dt)	;
			t07_case_transaction.setStcr(form.getStcr());
			
			{	Iterator iter =transMap.values().iterator();
				while(iter.hasNext())
				{
					T47_transaction temp=(T47_transaction)iter.next();
					t07_case_transaction.setTransactionkey(temp.getTransactionkey());
					t07_case_transaction.setParty_id(temp.getParty_id());
					t07_case_transaction.setAcct_num(StringUtils.null2String(temp.getAcct_num()));
					t07_case_transaction.setAmt(temp.getAmt());
					t07_case_transactionDao.insertT07_case_transaction_de(sqlMap, t07_case_transaction);
				}
				
			}
			T07_case_stcrDAO  t07_case_stcrDAO=new T07_case_stcrDAO();
			t07_case_stcrDAO.insertT07_case_stcr_de(sqlMap, t07_case_stcr);
			
			//t47_transaction_uc表
			
			T47_agreementDAO t47_agreementDAO=new T47_agreementDAO();
			//t47_transaction_uc表 
			//如果有新增的交易则先插t47_transaction
			String validate_ind="1";
			String transactionkeys="";
			String acctnums="";
			Iterator iter =transMap.values().iterator();		
			while(iter.hasNext())
			{
				T47_transaction temp=(T47_transaction)iter.next();
				String transactionkey=temp.getTransactionkey();				
				
				temp.setHandle_status_cd("1");
				if(temp.getTxt()!=null && temp.getTxt().equals("04"))
				{ 
			
					int row=t47_transactionDao.insertT47_transaction_all_field(sqlMap, temp);
				}
				
				if(temp.getValidate_ind()==null ||"".equals(temp.getValidate_ind().trim())){
					temp.setValidate_ind("0");
					validate_ind="0";
				}
				
				//判断是否在UC表中,在则更新 ，不在插入
				T47_transaction  uc= t47_transactionDao.getT47_transaction_uc_from_key(sqlMap,transactionkey);
				if(uc==null)
				{   
					transactionkeys=transactionkeys+",'"+transactionkey+"'"	;
					if(temp.getAcct_num()!=null && !temp.getAcct_num().equals("")){
					acctnums=acctnums+",'"+temp.getAcct_num()+"'";
					//查询账户在t47_acct_uc中是否存在
					T47_agreement t47_agreement =t47_agreementDAO.getT47_acct_ucDisp(sqlMap, temp.getAcct_num());
					if(t47_agreement!=null && t47_agreement.getAcct_num().equals("")){
					
					int row=t47_transactionDao.insertT47_acct_uc(sqlMap, acctnums.substring(1));
					if(row<=0){
						row=t47_transactionDao.insertT47_acct_uc1(sqlMap, temp);
					 }
					 }
					}
					
					//int row=t47_transactionDao.insertT47_transaction_uc_all_field(sqlMap, temp);
				}else						
				{	
					//大额验证标志
					if(uc.getValidate_ind()!=null && !"".equals(uc.getValidate_ind()))
					{
						temp.setValidate_ind(StringUtils.null2String(uc.getValidate_ind()));
						if(!uc.getValidate_ind().equals("1")){
							validate_ind="0";
						}
					}else
					{
						temp.setValidate_ind(StringUtils.null2String(temp.getValidate_ind()));
					}
					//可疑验证标志
					temp.setValidate_ind2(StringUtils.null2String(uc.getValidate_ind2()));
					int row=t47_transactionDao.updateT47_transaction_uc(sqlMap,temp);
				}
					
			}
			if(!transactionkeys.equals("")){
				transactionkeys=transactionkeys.substring(1);
				int row=t47_transactionDao.insertT47_transaction_uc_all_field1(sqlMap, transactionkeys);
				row=t47_transactionDao.updateT47_transaction_uc_1(sqlMap, transactionkeys);
//				if(!acctnums.equals("")){
//					acctnums=acctnums.substring(1);//插入账户信息表
//					row=t47_transactionDao.insertT47_acct_uc(sqlMap, acctnums);
//				}
			}
			
			
			//判断生成案例时的验证状态
			//默认设置1
			t07_case_application.setValidate_ind(validate_ind);//是否通过验证
			Iterator iterKey=transMap.keySet().iterator();
			String transactionkeys="";
			while(iterKey.hasNext())
			{
				String key=(String)iterKey.next();
				transactionkeys+="'"+key+"',";
			}
			transactionkeys=transactionkeys.substring(0, transactionkeys.length()-1);
			ArrayList ucList=t47_transactionDao.getT47_transaction_ucList(sqlMap,transactionkeys);
			Iterator ucIter=ucList.iterator();
			while(ucIter.hasNext())
			{
				T47_transaction t47_transaction=(T47_transaction)ucIter.next();
				if(!"1".equals(t47_transaction.getValidate_ind()))
				{
					t07_case_application.setValidate_ind("0");//是否通过验证
					break;
				}
			}
			
			T07_case_applicationDAO t07_case_applicationDao= (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
			  //查询该客户是否是白灰和我行账户名单
			t07_case_application=t07_case_applicationDao.getT07_writegrepList(sqlMap,t07_case_application);
			int app=t07_case_applicationDao.insertT07_case_application_all_field(sqlMap, t07_case_application);
			//sqlMap.executeBatch();
			
			// 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("创建大额案例信息");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
			sqlMap.commitTransaction();
			
			session.removeAttribute("case_transMap");
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.common","新增案例成功！"));			
			saveErrors(request, errors);
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.common",e.getMessage()));			
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();logger.error(e);
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common","插入数据失败！"));			
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
		}

		return actionMapping.findForward("success");
	}*/
	
	public ActionForward performGetT07_case_app_add_de_n_comp(                                                                                                                      
			ActionMapping actionMapping, ActionForm actionForm,                                                                                                                         
			HttpServletRequest request, HttpServletResponse response) {                                                                                                                 
		ActionErrors errors = new ActionErrors();                                                                                                                                     
		HttpSession session = request.getSession();                                                                                                                                   
		                                                                                                                                                                              
		                                                                                                                                                                              
		                                                                                                                                                                              
			T47_transactionDAO t47_transactionDao=(T47_transactionDAO)context.getBean("t47_transactionDAO");                                                                            
			T07_FlowBo flowbo=(T07_FlowBo)context.getBean("t07_flowBo");                                                                                                                
			XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");                                                                                                        
		try {	
			String errMes="";       
			T07_nbs_ctifActionForm form =(T07_nbs_ctifActionForm)actionForm;                                                                                                            
			Map transMap=(Map)session.getAttribute("case_transMap");	                                                                                                                  
			String acct_num=""; String maxorgankey=""; double comp_amt=0;  
			String curr_cd=form.getCurr_cd();
			//验证交易日期和交易金额                                                                                                                                                    
			double total_cny=0;                                                                                                                                                         
			double total_usd=0;                                                                                                                                                         
			double tran_amt=0;  
			//add ljd start 
			String is_local_1="";//本外币标示 1：本币 0：外币 2：本外币
			//付
			double total_cny2=0;                                                                                                                                                         
			double total_usd2=0;                                                                                                                                                         
			double tran_amt2=0;
			String is_local_2="";//本外币标示 1：本币 0：外币 2：本外币
			//add ljd end
			HashMap acctHash=new HashMap();                                                                                                                                             
			boolean validate_date=false;                                                                                                                                                
			String tx_dt_first="";  
			String stcr=form.getStcr();                                                                                                                                                     
			Date data_dt=DateUtils.stringToDateShort(DateUtils.getCurrTime());                                                                                                          
			{                                                                                                                                                                           
			int i=0;     
			String party_id=form.getCsnm();
			HashMap newtransMap=new HashMap();
			
			Iterator iter =transMap.values().iterator();                                                                                                                                
			                                                                                                                                                                            
			                                                                                                                                                                            
			while(iter.hasNext())                                                                                                                                                       
			{                                                                                                                                                                           
				T47_transaction temp=(T47_transaction)iter.next();   
				String trans_currcd=temp.getCurr_cd();
				
					/*ljd 注释 if(!curr_cd.equals(trans_currcd)){
					errMes="交易的币种必须和案例币种相同！";  	
				}*/
				String  cashtransflag=temp.getCash_trans_flag();
				//mod ljd stcr 为 CPDE- 开头
				if("CPDE-DE01".equals(stcr)){
					if(cashtransflag.equals("01")){
						errMes="必须是现金交易！";  	
						break;
					}
				}
				if("CPDE-DE02".equals(stcr)||"CPDE-DE03".equals(stcr)){
					if(cashtransflag.equals("00")){
						errMes="必须是非现金交易！";  	
						break;
					}
				}
				//mod ljd end stcr 为 CPDE- 开头
			  if(temp.getParty_id().equals(party_id)){
					newtransMap.put(temp.getTransactionkey(), temp);
	
				data_dt=temp.getTx_dt();                                                                                                                                                  
				if(transMap.size()==1){                                                                                                                                                   
					validate_date=true;                                                                                                                                                     
				}else                                                                                                                                                                     
				{                                                                                                                                                                         
					String tx_dt_next=DateUtils.dateToStringShort(temp.getTx_dt());                                                                                                         
					if(i==0)                                                                                                                                                                
					{                                                                                                                                                                       
						tx_dt_first=tx_dt_next;                                                                                                                                               
					}                                                                                                                                                                       
					                                                                                                                                                                        
					if(tx_dt_first.equals(tx_dt_next)){                                                                                                                                     
						validate_date=true;                                                                                                                                                   
					}else                                                                                                                                                                   
					{                                                                                                                                                                       
						validate_date=false;                                                                                                                                                  
						break;                                                                                                                                                                
					}                                                                                                                                                                       
				}                                                                                                                                                                         
				acct_num=StringUtils.null2String(temp.getAcct_num());                                                                                                                     
				if(temp.getAmt().doubleValue()>comp_amt){                                                                                                                                 
					comp_amt=temp.getAmt().doubleValue();                                                                                                                                   
					                                                                                                                                                                        
					maxorgankey=StringUtils.null2String(temp.getOrgankey());                                                                                                                
				}                                                                                                                                                                         
				if(!acct_num.equals(""))                                                                                                                                                  
				acctHash.put(acct_num, ""); 
				//ljd 注释
				/*                                                                                                                                              
				tran_amt+=temp.getAmt().doubleValue();                                                                                                                                    
				total_cny+=temp.getCny_amt().doubleValue();   
				if(temp.getUsd_amt()!=null)
				total_usd+=temp.getUsd_amt().doubleValue();   */
				//add ljd start 2017-06-10
				//收
				tran_amt+=temp.getAmt().doubleValue();                                                                                                                                    
				total_cny+=temp.getCny_amt().doubleValue();   
			if(temp.getUsd_amt()!=null){
				total_usd+=temp.getUsd_amt().doubleValue(); 
		    if("".equals(is_local_1)||is_local_1==null ){
			   is_local_1=temp.getCurr_cd();
		    }else if(!is_local_1.equals(temp.getCurr_cd())){
			    is_local_1="3";
		    }
			//付
			}else if(temp.getReceive_pay_cd().equals("02")){
				tran_amt2+=temp.getAmt().doubleValue();                                                                                                                                    
				total_cny2+=temp.getCny_amt().doubleValue();   
			if(temp.getUsd_amt()!=null){
			total_usd2+=temp.getUsd_amt().doubleValue(); 
			}
		    if("".equals(is_local_2)||is_local_2==null ){
			   is_local_2=temp.getCurr_cd();
		    }else if(!is_local_2.equals(temp.getCurr_cd())){
			   is_local_2="3";
		    }
			}
			//add ljd end 2017-06-10
				i++;  
			}
			} 
			
			transMap=newtransMap;
			data_dt=DateUtils.stringToDateShort(DateUtils.dateToStringShort(data_dt));                                                                                                  
			                                                                                                                                                                            
			//验证交易日期必须为同一日期                                                                                                                                                
			                                                                                                                                                                           
			if(validate_date==false)                                                                                                                                                    
			{      
				errMes="所有交易日期必须相同！";  
				                                                                                                             
			}                                                                                                                                                                           
			}                                                                                                                                                                           
			//验证交易金额必须与特征的金额对应 
			//ljd add start
			String destcr = form.getStcr();
			Map dataMap = new HashMap();
			//特征
		    dataMap.put("destcr", destcr);
		    dataMap.put("cust_id",form.getCsnm());   //客户号
		    dataMap.put("cust_name",form.getCtnm());//客户名称
		    Map resultMap = new HashMap();
			if(total_cny>0 && total_usd>0){
				//收
				//本外币标示 1：本币 0：外币 2：本外币
				if(is_local_1!=null&&!"".equals(is_local_1)){
					dataMap.put("is_local_curr",is_local_1);
				}
				dataMap.put("total_cny",total_cny);
			    dataMap.put("total_usd",total_usd);  
			    resultMap=ValidateBhRule(dataMap);
				} 
			if(resultMap.get("isValidBhTrans")==null||"".equals(resultMap.get("isValidBhTrans"))){
				resultMap.put("isValidBhTrans","false"); 
			if(resultMap.get("isValidBhTrans").toString().equals("false")){
				if(total_cny2>0 && total_usd2>0 ){
			    //付
				if(is_local_2!=null&&!"".equals(is_local_2)){
					dataMap.put("is_local_curr",is_local_2);
				}
			    dataMap.put("total_cny",total_cny2);
			    dataMap.put("total_usd",total_usd2);  
			    resultMap=ValidateBhRule(dataMap);
			}
			}
		}
			String isValidBhTrans="";
			if(resultMap!=null&&!"".equals(resultMap)){
				isValidBhTrans = resultMap.get("isValidBhTrans").toString();
			}
			if(isValidBhTrans.equals("false")){
				errMes = resultMap.get("errorMsg").toString();
			}
			//ljd add end
		                                                                                                                                                     
			/* ljd 注释String stcr=form.getStcr();  
		
			if("DE01".equals(stcr))                                                                                                                                                     
			{                                                                                                                                                                           
				if((curr_cd.equals("1")&&total_cny<Constans.cny_DE01) || (curr_cd.equals("2")&&total_usd<Constans.usd_DE01))                                                                                                           
				{                                                                                                                                                                         
					errMes="交易金额与大额交易特征0901不符!";                                                                                                                               
				}                                                                                                                                                                         
			}else if("DE02".equals(stcr))                                                                                                                                               
			{                                                                                                                                                                           
				if((curr_cd.equals("1")&&total_cny<Constans.cny_DE02)||(curr_cd.equals("2")&& total_usd<Constans.usd_DE02))                                                                                                           
				{                                                                                                                                                                         
					errMes="交易金额与大额交易特征0902不符!";                                                                                                                               
				}                                                                                                                                                                         
			}                                                                                                                                                                           
			else if("DE03".equals(stcr))                                                                                                                                                
			{                                                                                                                                                                           
				if((curr_cd.equals("1")&&total_cny<Constans.cny_DE03)||(curr_cd.equals("2")&&total_usd<Constans.usd_DE03))                                                                                                             
				{                                                                                                                                                                         
					errMes="交易金额与大额交易特征0903不符!";                                                                                                                               
				}                                                                                                                                                                         
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				if((curr_cd.equals("2")&&total_usd<Constans.usd_DE04))                                                                                                                                           
				{                                                                                                                                                                         
					errMes="交易金额与大额交易特征0904不符!";                                                                                                                               
				}                                                                                                                                                                         
			}    */                                                                                                                                                                       
			if(!"".equals(errMes))                                                                                                                                                      
			{                                                                                                                                                                           
				//throw new Exception(errMes); 
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",errMes));
		         saveErrors(request, errors);
		return actionMapping.findForward("failure");
			}                                                                                                                                                                           
				                                                                                                                                                                          
	     String organkey=request.getParameter("organkey"); //客户的归属机构                                                                                                         
	       String organtype=StringUtils.null2String(sysConfig.getProperty("rule.obj_type"));                                                                                        
	       if(!organtype.equals("")){                                                                                                                                               
	    	   if(organtype.equals("3")){//交易金额最大的账户机构                                                                                                                     
	    		 if(!acct_num.equals("")) {                                                                                                                                             
	    			 T47_agreementDAO t47_agreementDAO = (T47_agreementDAO)context.getBean("t47_agreementDAO");                                                                           
	    			 T47_agreement t47_agreement =t47_agreementDAO.getT47_agreementDisp(sqlMap, acct_num);                                                                                
	    			 if(t47_agreement.getOp_org_num()!=null && !t47_agreement.getOp_org_num().equals(""))                                                                                 
	    			 organkey=t47_agreement.getOp_org_num();                                                                                                                              
	    		 }                                                                                                                                                                      
	    	   }                                                                                                                                                                      
	    	   if(organtype.equals("4")){//交易金额最大的交易机构                                                                                                                     
	    		  if(!maxorgankey.equals("")) {                                                                                                                                         
	    			  organkey= maxorgankey;                                                                                                                                              
	    		  }                                                                                                                                                                     
	    	   }                                                                                                                                                                      
	    	                                                                                                                                                                          
	       }                                                                                                                                                                        
			                                                                                                                                                                            
			if(form.getIs_party().equals("0")){//若不是本行客户去页面上的机构                                                                                                           
				organkey=form.getFicd();                                                                                                                                                  
			}                                                                                                                                                                           
			//                                                                                                                                                                          
			//t47_party_uc			                                                                                                                                                        
			T47_party t47_party_uc =new T47_party();                                                                                                                                    
			                                                                                                                                                                            
					                                                                                                                                                                        
			if("".equals(form.getCsnm())){                                                                                                                                              
				                                                                                                                                                                          
				t47_party_uc.setParty_id("YC"+DateUtils.FormatDate(new Date(), "yyyyMMddhhmmss"));                                                                                        
				                                                                                                                                                                          
			}                                                                                                                                                                           
			else                                                                                                                                                                        
			{                                                                                                                                                                           
				t47_party_uc.setParty_id(form.getCsnm());                                                                                                                                 
			}                                                                                                                                                                           
			t47_party_uc.setHost_cust_id(t47_party_uc.getParty_id());		                                                                                                                
			t47_party_uc.setAml2_type_cd(form.getCttp());                                                                                                                               
			if("02".equals(form.getCttp()))                                                                                                                                             
			{                                                                                                                                                                           
				t47_party_uc.setParty_class_cd("I");	                                                                                                                                    
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				t47_party_uc.setParty_class_cd("C");	                                                                                                                                    
			}                                                                                                                                                                           
			                                                                                                                                                                            
			t47_party_uc.setParty_chn_name(form.getCtnm());                                                                                                                             
			                                                                                                                                                                            
			//处理证件类型为19或29的情况			                                                                                                                                          
			if("19".equals(form.getCitp())||"29".equals(form.getCitp())){                                                                                                               
				t47_party_uc.setCard_type(form.getCitp()+form.getCard_type_inf());                                                                                                        
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				t47_party_uc.setCard_type(form.getCitp());                                                                                                                                
			}                                                                                                                                                                           
			                                                                                                                                                                            
			                                                                                                                                                                            
			//t47_party_uc.setCard_type(form.getCitp());                                                                                                                                
			t47_party_uc.setCard_no(form.getCtid());                                                                                                                                    
			t47_party_uc.setCountry_cd(form.getCtnt());                                                                                                                                 
			t47_party_uc.setAddr1(form.getAddr1());                                                                                                                                     
			t47_party_uc.setTel_no(form.getTel_no());                                                                                                                                   
			//t47_party_uc.setCell_no(form.getCell_no());//移动电话                                                                                                                     
			//t47_party_uc.setEmail_addr(form.getEmail_addr());//电子邮件                                                                                                               
			t47_party_uc.setOrgankey(organkey);                                                                                                                                         
			t47_party_uc.setIndustrykey(form.getCtvc());						                                                                                                                    
			                                                                                                                                                                            
			if(form.getEnrol_fund_amt()== null || (form.getEnrol_fund_amt()!= null&&"".equals(form.getEnrol_fund_amt())))                                                               
			{                                                                                                                                                                           
				t47_party_uc.setEnrol_fund_amt("0");                                                                                                                                      
			}                                                                                                                                                                           
			else                                                                                                                                                                        
				t47_party_uc.setEnrol_fund_amt((form.getEnrol_fund_amt()));                                                                                                               
			//t47_party_uc.setEnrol_fund_currency_cd(form.getEnrol_fund_currency_cd());	//	注册资本币别代码	                                                                          
			t47_party_uc.setLegal_obj(form.getLegal_obj());                                                                                                                             
			if("19".equals(form.getLegal_card_type())||"29".equals(form.getLegal_card_type())){                                                                                         
				t47_party_uc.setLegal_card_type(form.getLegal_card_type()+form.getLegal_card_type_inf());                                                                                 
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				t47_party_uc.setLegal_card_type(form.getLegal_card_type());	                                                                                                              
			}                                                                                                                                                                           
			//t47_party_uc.setLegal_card_type(form.getLegal_card_type());			                                                                                                          
			t47_party_uc.setLegal_card_no(form.getLegal_card_no());                                                                                                                     
			t47_party_uc.setOccupation(form.getCtvc_i());                                                                                                                               
			t47_party_uc.setValidate_ind("1");                                                                                                                                          
			                                                                                                                                                                            
			                                                                                                                                                                            
			                                                                                                                                                                            
			//t07_case_application                                                                                                                                                      
			T07_case_application t07_case_application=new T07_case_application();                                                                                                       
			String currtime=DateUtils.getDate10to8(DateUtils.getCurrTime()); //当前时间                                                                                                 
			String casenum=this.getSequenceNextVal("t07_case_application_app");                                                                                                         
			String application_num= "C"+currtime+casenum;                                                                                                                               
			t07_case_application.setApplication_num(application_num);//案例编号                                                                                                         
			t07_case_application.setRecheck_num(new Long(0));//上报次数                                                                                                                 
			t07_case_application.setFlow_id(this.getFlow_id("1", form.getCurr_cd(), t47_party_uc.getParty_class_cd()));//流程id                                                         
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));//创建日期				                                                                      
			t07_case_application.setApp_org_id(organkey);//创建机构                                                                                                                     
			t07_case_application.setCase_name("BH"+form.getCtnm());//案例名称                                                                                                           
			t07_case_application.setCast_type("1");//案例类型                                                                                                                           
			//t07_case_application.setCase_kind("N");//案例种类                                                                                                                         
			t07_case_application.setCase_level("0");//案例级别                                                                                                                          
			                                                                                                                                                                            
			t07_case_application.setParty_id(t47_party_uc.getParty_id());//客户ID                                                                                                       
			t07_case_application.setParty_class_cd(t47_party_uc.getParty_class_cd());
			t07_case_application.setObjkey(t47_party_uc.getParty_id());                                                                                                                 
			t07_case_application.setParty_name(form.getCtnm());//客户名称                                                                                                               
			                                                                                                                                                                            
			t07_case_application.setApp_state_cd("1");//状态：处理中                                                                                                                    
			                                                                                                                                                                            
			//根据配置判断大额是否走流程，设置案例状态                                                                                                                                  
			Map t87_sysparaMap=cm.getMapFromCache("t87_syspara");                                                                                                                       
			if(t87_sysparaMap.containsKey("300"))                                                                                                                                       
			{                                                                                                                                                                           
				String para=(String)t87_sysparaMap.get("300");                                                                                                                            
				if("0".equals(para))//大额不走流程                                                                                                                                        
				{                                                                                                                                                                         
					t07_case_application.setApp_state_cd("2");//状态：已审批                                                                                                                
				}                                                                                                                                                                         
			}                                                                                                                                                                           
			                                                                                                                                                                            
			                                                                                                                                                                            
			t07_case_application.setDate_status_cd("1");//数据来源                                                                                                                      
			t07_case_application.setLast_upd_dt(new Date());//上次更新时间                                                                                                              
			                                                                                                                                                                            
			//modify by qiuyun 2011-07-04 如果配置了302（前台是否进行验证操作） 则新增的案例时生成到编辑岗，否则案例直接到审核岗                                                        
	                                                                                                                                                                                
			String flag=StringUtils.nullObject2String(t87_sysparaMap.get("302"));                                                                                                       
			if("1".equals(flag)){                                                                                                                                                       
				                                                                                                                                                                          
				if("01".equals(t07_case_application.getFlow_id()))                                                                                                                        
				{                                                                                                                                                                         
					t07_case_application.setPost_id("P0102");                                                                                                                               
				}else                                                                                                                                                                     
				{                                                                                                                                                                         
					t07_case_application.setPost_id("P0302");                                                                                                                               
				}                                                                                                                                                                         
							                                                                                                                                                                    
				                                                                                                                                                                          
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				                                                                                                                                                                          
				if("01".equals(t07_case_application.getFlow_id()))                                                                                                                        
				{                                                                                                                                                                         
					t07_case_application.setPost_id("P0103");                                                                                                                               
				}else                                                                                                                                                                     
				{                                                                                                                                                                         
					t07_case_application.setPost_id("P0303");                                                                                                                               
				}                                                                                                                                                                         
			}                                                                                                                                                                           
			//end by qiuyun                                                                                                                                                             
			                                                                                                                                                                            
			t07_case_application.setTran_count(new Long(transMap.size()));                                                                                                            
			t07_case_application.setTran_amt(new Double(tran_amt));                                                                                                                     
			t07_case_application.setParty_count(new Long(1));                                                                                                                         
			t07_case_application.setAcct_count(new Long(acctHash.size()));                                                                                                            
			//根据flow_id 和post_id 取节点id                                                                                                                                            
		                                                                                                                                                                              
			T07_node t07_node=new T07_node();                                                                                                                                           
			t07_node.setFlow_id(t07_case_application.getFlow_id());                                                                                                                     
			t07_node.setPost_id(t07_case_application.getPost_id());                                                                                                                     
			t07_node.setIs_use("1");                                                                                                                                                    
			t07_case_application.setNode_id(flowbo.getNode_id(sqlMap, t07_node));                                                                                                       
			                                                                                                                                                                            
			                                                                                                                                                                            
			AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");                                                                                                
			Authorization auth = authBean.getAuthToken();                                                                                                                               
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());//上次更新用户                                                                                      
			//t07_case_application.setApp_case_reason();//申请原因                                                                                                                      
			                                                                                                                                                                            
			//数据日期取所有交易的最大日期                                                                                                                                              
			                                                                                                                                                                            
			                                                                                                                                                                            
			                                                                                                                                                                            
			/*Date mindate=null;                                                                                                                                                        
			Date maxdate=null;                                                                                                                                                          
			for(int i=0;i<t47_transactionList.size();i++)                                                                                                                               
			{                                                                                                                                                                           
				T47_transaction temp=(T47_transaction)t47_transactionList.get(i);                                                                                                         
				if(i==0){                                                                                                                                                                 
					mindate=temp.getTx_dt();                                                                                                                                                
					maxdate=temp.getTx_dt();                                                                                                                                                
				}else{                                                                                                                                                                    
					if(temp.getTx_dt().before(mindate))                                                                                                                                     
					{                                                                                                                                                                       
						mindate=temp.getTx_dt();                                                                                                                                              
					}                                                                                                                                                                       
					if(temp.getTx_dt().after(maxdate))                                                                                                                                      
					{                                                                                                                                                                       
						maxdate=temp.getTx_dt();                                                                                                                                              
					}                                                                                                                                                                       
				}                                                                                                                                                                         
			}*/                                                                                                                                                                         
			t07_case_application.setCase_tran_mindate(data_dt);//交易最小时间                                                                                                           
			t07_case_application.setCase_tran_maxdate(data_dt);//交易最大时间                                                                                                           
			//data_dt=maxdate;                                                                                                                                                          
			                                                                                                                                                                            
			//失效日期                                                                                                                                                                  
			                                                                                                                                                                            
			String invalid_dt=this.getWorkDate(sqlMap,data_dt, "5", t47_party_uc.getParty_class_cd());                                                                                  
			t07_case_application.setCase_date(data_dt);//案例时间                                                                                                                       
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(invalid_dt));//案例失效时间    
			Date now=DateUtils.stringToDateShort(DateUtils.dateToStringShort(new Date()));
			if(now.compareTo(t07_case_application.getCase_end_date())<=0)                                                                                                        
			{                                                                                                                                                                           
				t07_case_application.setCase_kind("N");//案例种类 正常                                                                                                                    
			}else                                                                                                                                                                       
			{                                                                                                                                                                           
				t07_case_application.setCase_kind("A");//案例种类补报                                                                                                                     
			}                                                                                                                                                                           
			                                                                                                                                                                            
			t07_case_application.setCurr_cd(form.getCurr_cd());//币种                                                                                                                   
			t07_case_application.setParty_class_cd(t47_party_uc.getParty_class_cd());//公私标志                                                                                         
			//t07_case_application.setTake_action(form.getTkms());//采取措施                                                                                                            
			//t07_case_application.setAction_descrip(form.getSsds());//可疑行为描述                                                                                                     
			                                                                                                                                                                            
			//t07_case_application.setAlert_level(form.getSsdg());//可疑程度                                                                                                            
			//t07_case_application.setPost_id("P0102");                                                                                                                                 
			//t07_case_application.setNode_id("N0102");                                                                                                                                 
			                                                                                                                                                                            
			//写t07_case_stcr                                                                                                                                                           
			sqlMap.endTransaction();                                                                                                                                                    
			sqlMap.startTransaction();                                                                                                                                                  
			//sqlMap.startBatch();                                                                                                                                                      
			T07_case_stcr t07_case_stcr=new T07_case_stcr();                                                                                                                            
			t07_case_stcr.setApplication_num(application_num);                                                                                                                          
			t07_case_stcr.setParty_id(t47_party_uc.getParty_id());                                                                                                                      
			t07_case_stcr.setParty_class_cd(t47_party_uc.getParty_class_cd());                                                                                                          
			t07_case_stcr.setStatus("1");                                                                                                                                               
			t07_case_stcr.setStcr(form.getStcr());                                                                                                                                      
			t07_case_stcr.setTfrans_count(transMap.size());                                                                                                                             
			//t07_case_stcr.setCreate_date(DateUtils.dateToStringShort(new Date()));		                                                                                                
			t07_case_stcr.setCase_date(data_dt);                                                                                                                                        
			                                                                                                                                                                            
			                                                                                                                                                                            
			                                                                                                                                                                            
			//t07_case_transaction                                                                                                                                                      
			T07_case_transaction t07_case_transaction=new T07_case_transaction();                                                                                                       
			T07_case_transactionDAO t07_case_transactionDao=new T07_case_transactionDAO();                                                                                              
			t07_case_transaction.setApplication_num(application_num);                                                                                                                   
			t07_case_transaction.setStatus_cd("1");	                                                                                                                                    
			t07_case_transaction.setParty_id(t47_party_uc.getParty_id());                                                                                                               
			t07_case_transaction.setCase_date(data_dt)	;                                                                                                                               
			t07_case_transaction.setStcr(form.getStcr());                                                                                                                               
			                                                                                                                                                                            
			{	Iterator iter =transMap.values().iterator();                                                                                                                              
				while(iter.hasNext())                                                                                                                                                     
				{                                                                                                                                                                         
					T47_transaction temp=(T47_transaction)iter.next();                                                                                                                      
					t07_case_transaction.setTransactionkey(temp.getTransactionkey());                                                                                                       
					t07_case_transaction.setAcct_num(StringUtils.null2String(temp.getAcct_num()));                                                                                          
					t07_case_transaction.setAmt(temp.getAmt());                                                                                                                             
					t07_case_transactionDao.insertT07_case_transaction_de(sqlMap, t07_case_transaction);                                                                                    
				}                                                                                                                                                                         
				                                                                                                                                                                          
			}                                                                                                                                                                           
			T07_case_stcrDAO  t07_case_stcrDAO=new T07_case_stcrDAO();                                                                                                                  
			t07_case_stcrDAO.insertT07_case_stcr_de(sqlMap, t07_case_stcr);                                                                                                             
			                                                                                                                                                                            
			//t47_transaction_uc表                                                                                                                                                      
			                                                                                                                                                                            
			T47_agreementDAO t47_agreementDAO=new T47_agreementDAO();                                                                                                                   
			//t47_transaction_uc表                                                                                                                                                      
			//如果有新增的交易则先插t47_transaction                                                                                                                                     
			String validate_ind="1";                                                                                                                                                    
			String transactionkeys="";                                                                                                                                                  
			String acctnums="";                                                                                                                                                         
			Iterator iter =transMap.values().iterator();		                                                                                                                            
			while(iter.hasNext())                                                                                                                                                       
			{                                                                                                                                                                           
				T47_transaction temp=(T47_transaction)iter.next();                                                                                                                        
				String transactionkey=temp.getTransactionkey();				                                                                                                                    
				                                                                                                                                                                          
				                                                                                                                                                                          
				                                                                                                                                                                          
				//判断是否是新增交易                                                                                                                                                      
				//int count=t47_transactionDao.isExist_t47_transaction(sqlMap,transactionkey);                                                                                            
				                                                                                                                                                                          
				//是新增则插入                                                                                                                                                            
				//if(count==0)                                                                                                                                                            
				temp.setHandle_status_cd("1");                                                                                                                                            
				if(temp.getTxt()!=null && temp.getTxt().equals("04"))                                                                                                                     
				{                                                                                                                                                                         
			                                                                                                                                                                            
					int row=t47_transactionDao.insertT47_transaction_all_field(sqlMap, temp);                                                                                               
				}                                                                                                                                                                         
				                                                                                                                                                                          
				if(temp.getValidate_ind()==null ||"".equals(temp.getValidate_ind().trim())){                                                                                              
					temp.setValidate_ind("0");                                                                                                                                              
					validate_ind="0";                                                                                                                                                       
				}                                                                                                                                                                         
				                                                                                                                                                                          
				//判断是否在UC表中,在则更新 ，不在插入                                                                                                                                    
				T47_transaction  uc= t47_transactionDao.getT47_transaction_uc_from_key(sqlMap,transactionkey);                                                                            
				if(uc==null)                                                                                                                                                              
				{                                                                                                                                                                         
					transactionkeys=transactionkeys+",'"+transactionkey+"'"	;                                                                                                               
					if(temp.getAcct_num()!=null && !temp.getAcct_num().equals("")){                                                                                                         
					acctnums=acctnums+",'"+temp.getAcct_num()+"'";                                                                                                                          
					//查询账户在t47_acct_uc中是否存在                                                                                                                                       
					T47_agreement t47_agreement =t47_agreementDAO.getT47_acct_ucDisp(sqlMap, temp.getAcct_num());                                                                           
					if(t47_agreement!=null && t47_agreement.getAcct_num().equals("")){                                                                                                      
					                                                                                                                                                                        
					int row=t47_transactionDao.insertT47_acct_uc(sqlMap, acctnums.substring(1));                                                                                            
					if(row<=0){                                                                                                                                                             
						row=t47_transactionDao.insertT47_acct_uc1(sqlMap, temp);                                                                                                              
					 }                                                                                                                                                                      
					 }                                                                                                                                                                      
					}                                                                                                                                                                       
					                                                                                                                                                                        
					//int row=t47_transactionDao.insertT47_transaction_uc_all_field(sqlMap, temp);                                                                                          
				}else						                                                                                                                                                          
				{	                                                                                                                                                                        
					//大额验证标志                                                                                                                                                          
					if(uc.getValidate_ind()!=null && !"".equals(uc.getValidate_ind()))                                                                                                      
					{                                                                                                                                                                       
						temp.setValidate_ind(StringUtils.null2String(uc.getValidate_ind()));                                                                                                  
						if(!uc.getValidate_ind().equals("1")){                                                                                                                                
							validate_ind="0";                                                                                                                                                   
						}                                                                                                                                                                     
					}else                                                                                                                                                                   
					{                                                                                                                                                                       
						temp.setValidate_ind(StringUtils.null2String(temp.getValidate_ind()));                                                                                                
					}                                                                                                                                                                       
					//可疑验证标志                                                                                                                                                          
					temp.setValidate_ind2(StringUtils.null2String(uc.getValidate_ind2()));                                                                                                  
					int row=t47_transactionDao.updateT47_transaction_uc(sqlMap,temp);                                                                                                       
				}                                                                                                                                                                         
					                                                                                                                                                                        
			}                                                                                                                                                                           
			if(!transactionkeys.equals("")){                                                                                                                                            
				transactionkeys=transactionkeys.substring(1);                                                                                                                             
				int row=t47_transactionDao.insertT47_transaction_uc_all_field1(sqlMap, transactionkeys);                                                                                  
				row=t47_transactionDao.updateT47_transaction_uc_1(sqlMap, transactionkeys);                                                                                               
//				if(!acctnums.equals("")){                                                                                                                                               
//					acctnums=acctnums.substring(1);//插入账户信息表                                                                                                                       
//					row=t47_transactionDao.insertT47_acct_uc(sqlMap, acctnums);                                                                                                           
//				}                                                                                                                                                                       
			}                                                                                                                                                                           
			                                                                                                                                                                            
			T47_partyDAO t47_party_ucdao=(T47_partyDAO)context.getBean("t47_partyDAO");                                                                                                 
			boolean isExist=t47_party_ucdao.isExist(sqlMap, t47_party_uc);                                                                                                              
			if(!isExist){                                                                                                                                                               
				int uc=t47_party_ucdao.insertT47_party_uc(sqlMap, t47_party_uc);                                                                                                          
			}else{                                                                                                                                                                      
				int uc=t47_party_ucdao.modifyT47_party_uc1(sqlMap, t47_party_uc);                                                                                                         
			}                                                                                                                                                                           
			                                                                                                                                                                            
			//判断生成案例时的验证状态                                                                                                                                                  
			//默认设置1                                                                                                                                                                 
			t07_case_application.setValidate_ind(validate_ind);//是否通过验证                                                                                                           
			/*Iterator iterKey=transMap.keySet().iterator();                                                                                                                            
			String transactionkeys="";                                                                                                                                                  
			while(iterKey.hasNext())                                                                                                                                                    
			{                                                                                                                                                                           
				String key=(String)iterKey.next();                                                                                                                                        
				transactionkeys+="'"+key+"',";                                                                                                                                            
			}                                                                                                                                                                           
			transactionkeys=transactionkeys.substring(0, transactionkeys.length()-1);                                                                                                   
			ArrayList ucList=t47_transactionDao.getT47_transaction_ucList(sqlMap,transactionkeys);                                                                                      
			Iterator ucIter=ucList.iterator();                                                                                                                                          
			while(ucIter.hasNext())                                                                                                                                                     
			{                                                                                                                                                                           
				T47_transaction t47_transaction=(T47_transaction)ucIter.next();                                                                                                           
				if(!"1".equals(t47_transaction.getValidate_ind()))                                                                                                                        
				{                                                                                                                                                                         
					t07_case_application.setValidate_ind("0");//是否通过验证                                                                                                                
					break;                                                                                                                                                                  
				}                                                                                                                                                                         
			}*/                                                                                                                                                                         
			                                                                                                                                                                            
			T07_case_applicationDAO t07_case_applicationDao= (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");                                                       
			//人工新增案例，案例来源均为"规则"                                                                                                                                          
			t07_case_application.setCase_source("1");                                                                                                                                   
			  //查询该客户是否是白灰和我行账户名单                                                                                                                                      
			t07_case_application=t07_case_applicationDao.getT07_writegrepList(sqlMap,t07_case_application);                                                                             
			int app=t07_case_applicationDao.insertT07_case_application_all_field(sqlMap, t07_case_application);                                                                         
			//sqlMap.executeBatch();                                                                                                                                                    
			                                                                                                                                                                            
			// 1.初始化日志对象                                                                                                                                                         
			T00_operate_log t00_operate_log=new T00_operate_log();                                                                                                                      
			t00_operate_log.setModule_key_sub1("创建大额案例信息");//子功能点1级                                                                                                        
			t00_operate_log.setModule_key_sub2("");//子功能点2级                                                                                                                        
			t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级                                                                                    
			t00_operate_log.setOperate_obj2("");//操作对象2级                                                                                                                           
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）                                                                                          
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败                                                                                                                   
			t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)                                                                                  
			// 2.写操作日志                                                                                                                                                             
			this.writeOperLog(auth, sqlMap, t00_operate_log);                                                                                                                           
			                                                                                                                                                                            
			sqlMap.commitTransaction();                                                                                                                                                 
			                                                                                                                                                                            
			session.removeAttribute("case_transMap");                                                                                                                                   
			errors.add(errors.GLOBAL_ERROR, new ActionError(                                                                                                                            
					"error.common","新增案例成功！"));			                                                                                                                                
			saveErrors(request, errors);                                                                                                                                                
			                                                                                                                                                                            
			                                                                                                                                                                            
			                                                                                                                                                                            
			                                                                                                                                                                            
		} catch (Exception e) {                                                                                                                                                       
			e.printStackTrace();logger.error(e);                                                                                                                                        
			errors.add(errors.GLOBAL_ERROR, new ActionError(                                                                                                                            
					"error.pagertitle.common",e.getMessage()));			                                                                                                                        
			saveErrors(request, errors);                                                                                                                                                
			return actionMapping.findForward("failure");                                                                                                                                
		}finally{                                                                                                                                                                     
			try {                                                                                                                                                                       
				sqlMap.endTransaction();                                                                                                                                                  
			} catch (SQLException e) {                                                                                                                                                  
				e.printStackTrace();logger.error(e);                                                                                                                                      
				errors.add(errors.GLOBAL_ERROR, new ActionError(                                                                                                                          
						"error.pagertitle.common","插入数据失败！"));			                                                                                                                    
				saveErrors(request, errors);                                                                                                                                              
				return actionMapping.findForward("failure");                                                                                                                              
			}                                                                                                                                                                           
		}                                                                                                                                                                             
                                                                                                                                                                                  
		return actionMapping.findForward("success");                                                                                                                                  
	}   
	
	public ActionForward performGetT07_case_app_add_ky_n(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		 
		try {
			
			T07_nbs_ctifActionForm form= (T07_nbs_ctifActionForm)actionForm;
			session.removeAttribute("case_partyMap");
			session.removeAttribute("case_transMap");
			
			// 对机构设置默认值
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			String ficd=StringUtils.null2String((String)request.getParameter("ficd"));
			String finm=StringUtils.null2String((String)request.getParameter("finm"));
			if("".equals(ficd)||ficd==null)ficd=auth.getT00_user().getOrgankey();
			if("".equals(finm)||finm==null)finm= (String)organMap.get(auth.getT00_user().getOrgankey());
			request.setAttribute("ficd", ficd);
			request.setAttribute("finm",finm); 
			
			//如果是从完成页面跳转过来就清空FORM的值
			if(request.getParameter("refresh")==null){
				form=new T07_nbs_ctifActionForm();
				request.setAttribute("T07_nbs_ctifActionForm", form);
				request.getSession().removeAttribute("case_transMap");
				}
			if(form.getCsnm().length()==18)
			{
				form.setIs_party("0");
			}
			if("".equals(form.getCttp()))
			{
				form.setCttp("02");//默认显示客户类型为自然人
			}
			if("".equals(form.getCase_kind()))
			{
				if("a".equals(request.getParameter("type")))
				{
					form.setCase_kind("A");
				}else
				{
					form.setCase_kind("N");
				}
			}
			
			HashMap notinMap=new HashMap();
			notinMap.put("D", "删除");
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory"); // 案例种类
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap, notinMap, false));			
			
			LinkedHashMap currcdMap = cm.getMapFromCache("curr_cd"); // 币种
			request.setAttribute("currcdMap", this.getOptionsListByMap(
					currcdMap, null, false));
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("partytypeMap",partytypeMap);
			
			Map countryMap = cm.getMapFromCache("country"); // 国籍
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null,true));
			LinkedHashMap cardtypeMap = cm.getMapFromCache("card_type"); // 证件类型
			request.setAttribute("cardtypeMap", this.getOptionsListByMap(
					cardtypeMap, null,true));
			LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i"); //对私职业
			request.setAttribute("pbc_ctvc_iMap", this.getOptionsListByMap(
					pbc_ctvc_iMap, null,true));
			LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c"); //对公行业
			request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(
					pbc_ctvc_cMap, null,true));
			LinkedHashMap bi_card_typeMap = cm.getMapFromCache("BITP");//法定代表人证件类型
			request.setAttribute("bi_card_typeMap", this.getOptionsListByMap(
					bi_card_typeMap, null,true));
//			LinkedHashMap bs_tezhengMap = cm.getMapFromCache("bs_tezheng"); // 可疑特征
			LinkedHashMap bs_tezhengMap = cm.getMapFromCache("bs_tezheng1"); // 国籍
					
//			String multiSeHTMLStr = StaticMethod.getMultiSelHTML2("list1","list2", "hi", bs_tezhengMap, null, 15);
			String multiSeHTMLStr = StaticMethod.getMultiSelHTML3("list1","list2", "hi", bs_tezhengMap, null, 15);
			request.setAttribute("multiSeHTMLStr", multiSeHTMLStr);
			
			//注册资本币种
			//LinkedHashMap pbc_currencyMap=cm.getMapFromCache("currency", true);
			//request.setAttribute("pbc_currencyMap", this.getOptionsListByMap(
			//		pbc_currencyMap, null, true));
			
			LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg"); //可疑程度
			request.setAttribute("ssdgMap", this.getOptionsListByMap(
					ssdgMap, null, false));
			form=(T07_nbs_ctifActionForm)actionForm;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_app_add_de_n(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
	
		try {
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			T07_nbs_ctifActionForm form= (T07_nbs_ctifActionForm)actionForm;
			session.removeAttribute("case_partyMap");
			session.removeAttribute("case_transMap");
			
			// 对机构设置默认值
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			String ficd=StringUtils.null2String((String)request.getParameter("ficd"));
			String finm=StringUtils.null2String((String)request.getParameter("finm"));
			if("".equals(ficd)||ficd==null)ficd=auth.getT00_user().getOrgankey();
			if("".equals(finm)||finm==null)finm= (String)organMap.get(auth.getT00_user().getOrgankey());
	
			//如果是从完成页面跳转过来就清空FORM的值和session中的值交易对象
			if(request.getParameter("refresh")==null){
				form=new T07_nbs_ctifActionForm();
				request.setAttribute("T07_nbs_ctifActionForm", form);
				request.getSession().removeAttribute("case_transMap");
			}
			form.setFicd(ficd);
			form.setFinm(finm);
			if(form.getCsnm().length()==18)
			{
				form.setIs_party("0");
			}
			if("".equals(form.getCttp()))
			{
				form.setCttp("02");//默认显示客户类型为自然人
			}
			if("".equals(form.getCase_kind()))
			{
				if("a".equals(request.getParameter("type")))
				{
				form.setCase_kind("A");
				}else
				{
					form.setCase_kind("N");
				}
			}
			LinkedHashMap bh_tezhengMap = cm.getMapFromCache("bh_tezheng"); // 大额特征
			request.setAttribute("bh_tezhengMap", this.getOptionsListByMap(
					bh_tezhengMap, null, false));
			
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory"); // 案例种类
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap, null, false));			
			
			LinkedHashMap currcdMap = cm.getMapFromCache("curr_cd"); // 币种
			request.setAttribute("currcdMap", this.getOptionsListByMap(
					currcdMap, null, false));
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("partytypeMap",partytypeMap);
			
			LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国籍
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap cardtypeMap = cm.getMapFromCache("card_type"); // 证件类型
			request.setAttribute("cardtypeMap", this.getOptionsListByMap(
					cardtypeMap, null, true));
			LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i"); //对私职业
			request.setAttribute("pbc_ctvc_iMap", this.getOptionsListByMap(
					pbc_ctvc_iMap, null, true));
			LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c"); //对公行业
			request.setAttribute("pbc_ctvc_cMap", this.getOptionsListByMap(
					pbc_ctvc_cMap, null, true));
			LinkedHashMap bi_card_typeMap = cm.getMapFromCache("BITP");//法定代表人证件类型
			request.setAttribute("bi_card_typeMap", this.getOptionsListByMap(
					bi_card_typeMap, null, true));
			
			
		
			
		
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_app_add_de_d(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		try {
			
			T07_nbs_ctifActionForm form= (T07_nbs_ctifActionForm)actionForm;
		
			if("".equals(form.getCase_kind()))
			{
				form.setCase_kind("D");
			}
			
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory"); // 案例种类
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap, null, false));			
			
			
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("partytypeMap",partytypeMap);
	
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_app_add_de_c(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		try {
			
			T07_nbs_ctifActionForm form= (T07_nbs_ctifActionForm)actionForm;
		
			if("".equals(form.getCase_kind()))
			{
				form.setCase_kind("C");
			}
			
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory"); // 案例种类
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap, null, false));			
			
			
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("partytypeMap",partytypeMap);
	
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_app_add_ky_c(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		try {
			
			T07_nbs_ctifActionForm form= (T07_nbs_ctifActionForm)actionForm;
		
			if("".equals(form.getCase_kind()))
			{
				form.setCase_kind("C");
			}
			
			HashMap notinMap=new HashMap();
			notinMap.put("D", "删除");
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory"); // 案例种类
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap, notinMap, false));	
			
			
			LinkedHashMap partytypeMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("partytypeMap",partytypeMap);
	
			
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
	 * add by lijie 2013-8-1
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_case_app_add_partyList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList = new ArrayList();
		
		T47_partyDAO  t47_partyDAO=(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			
			
			ArrayList	case_partyList = (ArrayList) session.getAttribute("case_partyList");
		
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_partyList", t47_partyList);

		return actionMapping.findForward("success");
	}
	/**
	 * add by lijie 2013-8-5
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
	public ActionForward performAddT07_case_app_add_partyList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_party t47_party = new T47_party();
		T47_partyDAO  t47_partyDAO=(T47_partyDAO)context.getBean("t47_partyDAO");
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String[] keys= form.getPartyCheckBox();
			
			Map partyMap=(Map) session.getAttribute("case_partyMap");
			
			if(partyMap==null)
			{
				partyMap=new HashMap();
			}
			
			ArrayList keyList=new ArrayList();
			for(int i=0;i<keys.length;i++)
			{	
				if(!partyMap.containsKey(keys[i]))
				{
					keyList.add(keys[i]);
				}
				
			}
			
			if(keyList.size()!=0){
				t47_party.setParty_class_cd(form.getParty_class_cd());
				t47_party.setSelectList(keyList);	
				
				ArrayList t47_partyList = t47_partyDAO.getT47_partyList_for_case(sqlMap, t47_party);
				for(int i=0;i<t47_partyList.size();i++)
				{	
					T47_party temp=(T47_party)t47_partyList.get(i);
					partyMap.put(temp.getParty_id(),temp);
				}
			}
			
			session.setAttribute("case_partyMap", partyMap);
			
			request.setAttribute("url", "t07_case_app_add_party.do");
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}
	
	/**
	 * add by lijie 2013-8-5
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
	public ActionForward performDelT07_case_app_add_partyList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			//这里只可以单独删除
			String party_id = form.getParty_id();
			party_id = party_id.substring(0, party_id.indexOf("--"));
			Map partyMap=(Map) session.getAttribute("case_partyMap");
			if(partyMap==null)
			{
				throw new Exception("案例客户列表为空！");
			}
			if(party_id!=null&&!"".equals(party_id))
			{
				partyMap.remove(party_id);	
				
			Map transMap=(Map)session.getAttribute("case_transMap");
			HashMap newtransMap=new HashMap();
			if(transMap!=null){
			Iterator iter =transMap.values().iterator();                                                                                                                                                                                                                                                                                                         
			    while(iter.hasNext())                                                                                                                                                       
			   {                                                                                                                                                                           
				T47_transaction temp=(T47_transaction)iter.next(); 
				if(!temp.getParty_id().equals(party_id)){
					newtransMap.put(temp.getTransactionkey(), temp);
				}
				
			    }
			    session.setAttribute("case_transMap", newtransMap);
			}
				session.setAttribute("case_partyMap", partyMap);
				
			}
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}
	/**
	 * add by qiuyun2011-03-22
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
	public ActionForward performGetT07_case_app_add_transList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		
		T47_transactionDAO t47_transactionDAO = new T47_transactionDAO();
		T47_transaction t47_transaction = new T47_transaction();
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			
			ArrayList	case_transList = (ArrayList) session.getAttribute("case_transList");
				/*if(case_transList!=null&&case_transList.size()>0)
				{
					t47_transaction.setList(case_transList);					
					t47_transactionList = t47_transactionDAO.getT47_transactionList_for_case(
					          sqlMap, t47_transaction);
				}*/
		
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transactionList", t47_transactionList);

		return actionMapping.findForward("success");
	}
	
	/**
	 * add by qiuyun2011-03-22
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
	public ActionForward performAddT07_case_app_add_transList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_transaction t47_transaction=new T47_transaction();
		T47_transactionDAO  t47_transactionDAO=(T47_transactionDAO)context.getBean("t47_transactionDAO");
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String[] keys= form.getTransactionkeyCheckBox();
							
			
			Map transMap=(Map) session.getAttribute("case_transMap");
			
			if(transMap==null)
			{
				transMap=new HashMap();
			}
			
			ArrayList keyList=new ArrayList();
			for(int i=0;i<keys.length;i++)
			{	
				if(!transMap.containsKey(keys[i]))
				{
					keyList.add(keys[i]);
				}
				
			}
			
			if(keyList.size()!=0){
							
				t47_transaction.setList(keyList);	
				
				ArrayList t47_transactionList = t47_transactionDAO.getT47_transactionList_for_case(
				          sqlMap, t47_transaction);
				for(int i=0;i<t47_transactionList.size();i++)
				{	
					T47_transaction temp=(T47_transaction)t47_transactionList.get(i);
					transMap.put(temp.getTransactionkey(),temp);
				}
			}
			
			session.setAttribute("case_transMap", transMap);
			
			
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}

	/**
	 * add by qiuyun2011-03-22
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
	public ActionForward performDelT07_case_app_add_transList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			Map transMap=(Map) session.getAttribute("case_transMap");
			if(transMap==null)
			{
				throw new Exception("案例交易列表为空！");
			}
			String[] trans= form.getTransactionkeyCheckBox();
			if(trans!=null&&trans.length>0)
			{
				for(int i=0;i<trans.length;i++)
				{	
					transMap.remove(trans[i]);					
				}
				
				session.setAttribute("case_transMap", transMap);
			}
			

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");
	}
	
	
	public String getFlow_id(String caseType,String curr_cd,String party_class_cd ){
		String flow_id="01";
		if("1".equals(caseType))
		{
			if("1".equals(curr_cd)){
				flow_id="01";//大额本币
			}else
			{
				flow_id="03";//大额外币
			}
		}else{
			if("1".equals(curr_cd))
			{
				flow_id="02";//可疑本币
			}else
			{
				//if("I".equals(party_class_cd))
				//{
				//	flow_id="05";//可疑外币对私
				//}else
				//{
					flow_id="04";//可疑外币对公
				//}
			}
		}
		
		return flow_id;
	}
	
	public ActionForward performGetT07_case_app_ky_list(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList searchT07_case_applicationList = new ArrayList();
		String pageInfo = "";
		
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		ArrayList t07_case_applicationList=new ArrayList();
		
		// 获取页面上需要的下拉菜单信息
	
		
		// 案例种类
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		request.setAttribute("casetypeMap", this.getOptionsListByMap(
				casetypeMap, null, true));

		//币种
		LinkedHashMap  curr_cdMap=cm.getMapFromCache("curr_cd");//币种
		request.setAttribute("curr_cdMap", this.getOptionsListByMap(
				curr_cdMap, null, true));
		LinkedHashMap  postMap=cm.getMapFromCache("post");//岗位名称
		request.setAttribute("postMap", this.getOptionsListByMap(postMap, null,
				true));

		LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");// 是否
		request.setAttribute("is_menuMap", this.getOptionsListByMap(
				is_menuMap, null,true));

//		LinkedHashMap  stateMap=cm.getMapFromCache("casestatus1",true);
//		HashMap notinMap=new HashMap();
//		notinMap.put("2", "已审批");
//		request.setAttribute("stateMap", this.getOptionsListByMap(
//				stateMap, notinMap, true));
		LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
		request.setAttribute("is_white", sysparaMap.get("303"));
		request.setAttribute("huifuflag", sysparaMap.get("805"));
	
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			form.setCase_kind("");
			
			String backstr=StringUtils.null2String((String)request.getAttribute("backstr"));
			if(!backstr.equals("")){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",backstr));
		          saveErrors(request, errors);
			}
			request.setAttribute("backstr", backstr);
						
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			
			if (newsearchflag.equals("2")) {
				session.removeAttribute("pageInfo");
				return  actionMapping.findForward("success");
			}
			else if (newsearchflag.equals("1")) {// 新的查询
				intPage=1;
				MyBeanUtils.copyBean2Bean(t07_case_application, form);
				// 模糊匹配，需要特殊处理一下
				
				if (t07_case_application.getParty_name() != null
						&& !t07_case_application.getParty_name().trim().equals("")) {
					t07_case_application.setParty_name("%"+ t07_case_application.getParty_name() + "%");
				}
				
				if (t07_case_application.getCase_date_start_disp() != null&&!t07_case_application.getCase_date_start_disp().trim().equals("")) {
				t07_case_application.setCase_date_start(DateUtils
						.stringToDateShort(t07_case_application.getCase_date_start_disp()));
				}
				if (t07_case_application.getCase_date_end_disp() !=null && !t07_case_application.getCase_date_end_disp().trim().equals("")){
				t07_case_application.setCase_date_end(DateUtils
						.stringToDateShort(t07_case_application.getCase_date_end_disp()));
				}
				
				t07_case_application.setDelete_flag("1");
				
				session.setAttribute("t07_case_applicationSearchObj",
						t07_case_application);
			} else {// 翻页
				t07_case_application = (T07_case_application) session
						.getAttribute("t07_case_applicationSearchObj");
			}
			// 组织用户所属的机构ID
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();
			t07_case_application.setOrgankey(org_id);
			if( sysparaMap.get("500")!=null &&  sysparaMap.get("500").equals("1")){
			t07_case_application.setCasesearchtime("1");//当前案例表
			}else{
				t07_case_application.setCasesearchtime("0");	
			}
			//t07_case_application.setType("2");//可疑
			t07_case_application.setCase_kind("'N','A'");
			//t07_case_application.setState("1");//处理中
			t07_case_applicationList = t07_case_applicationDAO
					.getT07_case_app_ky_list(sqlMap,
							t07_case_application, this.getStartRec(intPage),
							this.getIntPageSize());
			int totalRow = t07_case_applicationDAO
					.searchT07_case_applicationListCount(sqlMap,
							t07_case_application);
			String url ="";
			 url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";
			
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			request.setAttribute("intPage", intPage+"");
		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_applicationList",
				t07_case_applicationList);
		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_huifu_commit(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
	
		HttpSession session = request.getSession();
		try {

			// 获取登录用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
		
			SetOnlineTask bmClient =new SetOnlineTask();
				//	XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
					String str="";
					
				
						   HashMap factMap=new HashMap();
						   factMap.put("businesskey", "40");
						   factMap.put("statisticdate",DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
						   factMap.put("creatuser", auth.getT00_user().getUsername());
						   factMap.put("tasktype", "40");
			
						 str = bmClient.insertOnlineTask(sqlMap, cm, factMap,null);
						
				
					request.setAttribute("backstr", str);
				
	
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	
	public ActionForward performT07_case_app_ky_paichu_or_huifu(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
			
		T07_case_applicationDAO t07_case_applicationDAO= (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		HttpSession session = request.getSession();
		String flag = "";
		try {
			// 获取登录用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			
//			sqlMap.startTransaction();
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String application_num = StringUtils.null2String(request
					.getParameter("application_num"));
			String party_id = StringUtils.null2String(request
					.getParameter("party_id"));
			t07_case_application.setApp_state_cd(form.getApp_state_cd());
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setCast_type("2");
			t07_case_application.setLast_upd_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());
		
		/*	String post_id=request.getParameter("post_id");
			if(post_id!=null&&!post_id.equals("")){
				t07_case_application.setPost_id(post_id);
			}*/
			String curr_cd=request.getParameter("curr_cd");
			if(curr_cd!=null && !curr_cd.equals("")){
				String post_id="";
				String node_id="";
				if(curr_cd.equals("2")){
				 post_id="P0302";
				 node_id="N0402";
				}else{
					post_id="P0102";
					node_id="N0202";
				}
				t07_case_application.setPost_id(post_id);
				t07_case_application.setNode_id(node_id);
			}
			t07_case_application.setParty_id(party_id);
			
			flag = this.modifyT07_case_app_ky(t07_case_application);
//			ArrayList application_numList=new ArrayList();
//			application_numList.add(application_num);
//			t07_case_application.setApplication_numList(application_numList);
//			t07_case_applicationDAO.modifyBatchT07_case_appstatus(sqlMap, t07_case_application);
//            sqlMap.commitTransaction();

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
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

        if(flag.equals("true")){
        	return actionMapping.findForward("success");
        }else{
        	return actionMapping.findForward("failure");
        }
		
	}
	
	/**
	 * 案例排除操作
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @param t07_case_application
	 * @return
	 */
	public String modifyT07_case_app_ky(T07_case_application t07_case_application)throws Exception {
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_app_movefateDAO t07_app_movefateDAO = new T07_app_movefateDAO();
		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		T07_case_transaction t07_case_trans = new T07_case_transaction();
		ArrayList t07_transList = new ArrayList();
		try{
			
			t07_case_stcr.setApplication_num(t07_case_application.getApplication_num());
			t07_case_stcr.setCase_type(t07_case_application.getCast_type());
			t07_case_stcr.setStatus(t07_case_application.getApp_state_cd());
			
			t07_case_trans.setApplication_num(t07_case_application.getApplication_num());
			t07_case_trans.setCase_type(t07_case_application.getCast_type());
			t07_case_trans.setStatus_cd(t07_case_application.getApp_state_cd());
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();

			// 处理客户表(T07_CASE_PARTY)状态  add by liujun  只处理已排除案例，把客户状态设为已排除(状态：0-处理中，1-已排除)
//			if (status != null && status.equals("4")) { // 案例被排除，相应的客户关系表状态改为1
//				//
//				t07_case_application.setApp_state_cd("1");
//				t07_case_applicationDAO.updateT07_case_partyStatus(sqlMap,t07_case_application);
//			}
			
			/** 1. 修改案例申请主表案例状态*/
			int rows = t07_case_applicationDAO.modifyT07_case_appstatus(sqlMap,t07_case_application);
			
			/** 2. 修改案例特征表中特征信息*/
			t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
			/** 4. 修改案例交易表中特征信息*/
			t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
			
			
			/** 3. 修改当前交易表中的交易状态*/
			if(t07_case_application.getApp_state_cd().equals("4")){
				
//			    t07_transList = t07_case_applicationDAO.getT07_stcr_trans_notList1(sqlMap, t07_case_trans);
//			    Iterator iter = t07_transList.iterator();
//			    ArrayList not_list = new ArrayList();
//			    ArrayList list = new ArrayList();
//			    String trans = "";
//	            while(iter.hasNext()){
//	        	   T07_case_transaction t07_case_trans1 = (T07_case_transaction) iter.next();
//	        	   if(t07_case_trans1.getApplication_num().equals(t07_case_application.getApplication_num())){
//	        		   
//	        	   }else{
//	        		   if(!not_list.contains(t07_case_trans1.getTransactionkey())){
//	            		   not_list.add(t07_case_trans1.getTransactionkey());
//	        		   }
//	        	   }
//	    		   if(!list.contains(t07_case_trans1.getTransactionkey())){
//	        		   list.add(t07_case_trans1.getTransactionkey());
//	    		   }
//	            }
//	           if(not_list != null){
//	              for(int i=0;i<not_list.size();i++){
//	        	     String trankey = (String) not_list.get(i);
//	                 list.remove(trankey);
//	              }
//	           }
//	           if(list != null){
//	              for(int i=0;i<list.size();i++){
//	           	     String trankey = (String) list.get(i);
//	                 trans += "'" + trankey + "',";
//	              }
//	           }
//	           if(trans != null && !trans.equals("")){
//	               trans = trans.substring(0, trans.length()-1);
//	               t07_case_trans.setTrans(trans);
//	               t07_case_applicationDAO.modifyT07_trans_uc_status(sqlMap, t07_case_trans);
//	           }
				t07_case_trans.setParty_id(t07_case_application.getParty_id());
	           t07_case_applicationDAO.updatet47_trans_uc(t07_case_trans, sqlMap);
			}else if(t07_case_application.getApp_state_cd().equals("1")){
				t07_case_applicationDAO.modifyT07_trans_uc_status1(sqlMap, t07_case_trans);
			}
			
			
			sqlMap.commitTransaction();

		}
		catch (Exception e) {
		e.printStackTrace();logger.error(e);
		errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
		return "false";
		}finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return "true";
	}
	public String dealTransaction(LinkedHashMap transMap,String validate_ind,String case_flag)throws Exception{
//		t47_transaction_uc表 
		//如果有新增的交易则先插t47_transaction
			T47_transactionDAO t47_transactionDao=(T47_transactionDAO)context.getBean("t47_transactionDAO");
		String transactionkeys="";
		Iterator iter=transMap.values().iterator();				
		while(iter.hasNext())
		{
			T47_transaction temp=(T47_transaction)iter.next();
			String transactionkey=temp.getTransactionkey();				
			
			//判断是否是新增交易
			//int count=t47_transactionDao.isExist_t47_transaction(sqlMap,transactionkey);
			
			//是新增则插入
			//if(count==0)
			if(temp.getTxt()!=null && temp.getTxt().equals("04"))
			{				
				int row=t47_transactionDao.insertT47_transaction_all_field(sqlMap, temp);
			}
			//判断是否在UC表中,在则更新 ，不在插入
								
			if(temp.getValidate_ind2()==null ||"".equals(temp.getValidate_ind2().trim())){
				temp.setValidate_ind2("0");
				validate_ind="0";
			}
			T47_transaction  uc= t47_transactionDao.getT47_transaction_uc_from_key(sqlMap,transactionkey);
			if(uc==null)
			{	
				transactionkeys=",'"+transactionkeys+"'"	;	
				//int row=t47_transactionDao.insertT47_transaction_uc_all_field(sqlMap, temp);
			}else						
			{	//更新处理状态
				if(!"4".equals(uc.getHandle_status_cd()))
				{
					temp.setHandle_status_cd(uc.getHandle_status_cd());
				}
				//可疑验证标志
				if(uc.getValidate_ind2()!=null&&!"".equals(uc.getValidate_ind2()))
				{
					temp.setValidate_ind2(StringUtils.null2String(uc.getValidate_ind2()));
					if(!uc.getValidate_ind2().equals("1")){
						validate_ind="0";
					}
				}else
				{
					temp.setValidate_ind2(StringUtils.null2String(temp.getValidate_ind2()));
				}
				//大额验证标志
				
				temp.setValidate_ind(StringUtils.null2String(uc.getValidate_ind()));
				
				int row=t47_transactionDao.updateT47_transaction_uc(sqlMap,temp);
			}
				
		}
		if(!transactionkeys.equals("")){
			transactionkeys=transactionkeys.substring(1);
			int row=t47_transactionDao.insertT47_transaction_uc_all_field1(sqlMap, transactionkeys);
		}
		return validate_ind;
		
	}
	
	public ActionForward performT07_case_app_ky_paichu_or_huifu1(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		HttpSession session = request.getSession();
	
		try {
			// 获取登录用户信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			
//			sqlMap.startTransaction();
//			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String application_num = StringUtils.null2String(request
					.getParameter("application_num_s"));
			String party_id = StringUtils.null2String(request
					.getParameter("party_id_s"));
			String app_state_cd = StringUtils.null2String(request.getParameter("app_state_cd"));
			
			t07_case_application.setApp_state_cd(app_state_cd);
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setLast_upd_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());
			String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
			t07_case_application.setCast_type(cast_type);
		/*	String post_id=request.getParameter("post_id");
			if(post_id!=null&&!post_id.equals("")){
				t07_case_application.setPost_id(post_id);
			}*/
			String post_id="";
			String node_id="";
			String flow_id="";
			String curr_cd=request.getParameter("curr_cd");
			 flow_id=request.getParameter("flow_id");
	     if(flow_id!=null && !flow_id.equals("05")){
			if(curr_cd!=null && !curr_cd.equals("")){
				
				if(curr_cd.equals("2")){
					 post_id="P0302";
					if(cast_type!=null&& cast_type.equals("1")){
					     node_id="N0302";
					}else{
				       node_id="N0402";
					} 
				}else{
					post_id="P0102";
					if(cast_type!=null&& cast_type.equals("1")){
					node_id="N0102";
					}else{
					node_id="N0202";
					}
				}
				
			}
	     }else{
	    	 post_id="P0102";
	    	 node_id="N0502";
	     }
			t07_case_application.setPost_id(post_id);
			t07_case_application.setNode_id(node_id);
			t07_case_application.setParty_id(party_id);
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			if( sysparaMap.get("500")!=null &&  sysparaMap.get("500").equals("1")){
			   this.modifyT07_case_app_ky_uh(t07_case_application);		
			}else{
				t07_case_application.setApp_state_cd("1");
				String flag = this.modifyT07_case_app_ky(t07_case_application);
            }

			// 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("排除案例恢复");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
		

		} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
        
        	return actionMapping.findForward("success");
        
		
	}
	
	public void modifyT07_case_app_ky_uh(T07_case_application t07_case_application)throws Exception{
		T07_app_movefateDAO t07_app_movefateDAO = new T07_app_movefateDAO();
		T07_FlowBo t07_FlowBo = (T07_FlowBo)context.getBean("t07_flowBo");
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		
		try{
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			//将历史表中案例相关的数据放到当前表
			T07_case_stcr t07_case_stcr = new T07_case_stcr();
			T07_case_transaction t07_case_trans = new T07_case_transaction();
			  ArrayList t07_transList = new ArrayList();
				
				t07_case_stcr.setApplication_num(t07_case_application.getApplication_num());
				t07_case_stcr.setCase_type(t07_case_application.getCast_type());
				t07_case_stcr.setStatus(t07_case_application.getApp_state_cd());
				
				t07_case_trans.setApplication_num(t07_case_application.getApplication_num());
				t07_case_trans.setCase_type(t07_case_application.getCast_type());
				t07_case_trans.setStatus_cd(t07_case_application.getApp_state_cd());

			t07_case_trans.setParty_id(t07_case_application.getParty_id());
		
			/** 3. 修改当前交易表中的交易状态*/
			if(t07_case_application.getApp_state_cd().equals("4")){
				/** 1. 修改案例申请主表案例状态*/
				int rows = t07_case_applicationDAO.modifyT07_case_appstatus(sqlMap,t07_case_application);
				
				/** 2. 修改案例特征表中特征信息*/
				int count=t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
				/** 4. 修改案例交易表中特征信息*/
				 count=t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
				
				t07_case_applicationDAO.updatet47_trans_uc(t07_case_trans, sqlMap);
			}else if(t07_case_application.getApp_state_cd().equals("8")){
				 int count2=t07_case_applicationDAO.modifyT07_case_app_UHstatus(sqlMap, t07_case_application);
			}
			sqlMap.commitTransaction();
	}
			catch (Exception e) {
				e.printStackTrace();logger.error(e);
				throw e;
			}finally {
					try {
						sqlMap.endTransaction();
					} catch (Exception e) {
					}
				}
	}
	
	/*public String getWorkDate(Date startdate, String number, String tabletype) {
		String beginDate = "";
		String tablename = "";
		if (tabletype != null && tabletype.equals("C")) {
			tablename = "T07_CP_WORKDATE";
		} else {
			tablename = "T07_ID_WORKDATE";
		}
		try {
			T07_WORKDATEDAO t07_workdateDAO =(T07_WORKDATEDAO)context.getBean("t07_workdateDAO");
			beginDate = t07_workdateDAO.getT07_WORKDATE(sqlMap, startdate,
					number, tablename);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			logger.error(e);
		}
		return beginDate;
	}*/
	
	/**
	 * 取得工作日后的时间
	 * @param startdate 取得工作日的开始时间
	 * @param number 工作日天数
	 * @param tabletype 1取对公日期，其它取对私日期
	 * @return 起始时间
	 */
    public String getWorkDate(SqlMapClient sqlMap, Date startdate, String number,
		String tabletype) {
	String beginDate = "";
	String tablename = "";
	try {
		T07_WORKDATEDAO t07_workdateDAO =(T07_WORKDATEDAO)context.getBean("t07_workdateDAO");
		HashMap map = t07_workdateDAO.getBegin(sqlMap, DateUtils
				.dateToStringShort(startdate), Integer.parseInt(number),
				tabletype);
		Iterator iter = map.keySet().iterator();
		while (iter.hasNext()) {
			Integer index = (Integer) iter.next();
			beginDate = (String) map.get(index);
		}
	} catch (Exception e) {
		logger.error(e.getMessage());
		e.printStackTrace();
		logger.error(e);
	}
	return beginDate;
}
	
	public ActionForward performAddT07_case_stcr_advi(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_alert_advi t07_case_alert_advi = new T07_case_alert_advi();
		String reason = "";
		try {
			T07_case_alert_adviActionForm form = (T07_case_alert_adviActionForm) actionForm;
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
//			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			String stcr = StringUtils.null2String(request.getParameter("stcr"));
			String flag = StringUtils.null2String(request.getParameter("flag"));
			String objtype = StringUtils.null2String(request.getParameter("objtype"));
			
			request.setAttribute("application_num", application_num);
//			request.setAttribute("party_id", party_id);
			request.setAttribute("stcr", stcr);
			request.setAttribute("flag", flag);
			request.setAttribute("objtype", objtype);
		
			t07_case_alert_advi.setApplication_num(application_num);
//			t07_case_alert_advi.setParty_id(party_id);
//			t07_case_alert_advi.setStcr(stcr);
			t07_case_alert_advi.setObjkey(stcr);
			t07_case_alert_advi.setObjtype(objtype);
			t07_case_alert_advi.setOpertype(flag);
			
			T07_case_alert_advi t07_case_alert_advi1 = t07_case_applicationDAO
					.getT07_case_stcr_adviDisp1(sqlMap, t07_case_alert_advi);
			if(t07_case_alert_advi1!=null) t07_case_alert_advi1 = t07_case_alert_advi1;
			
//			session.setAttribute("t07_case_alert_advi", t07_case_alert_advi);
			MyBeanUtils.copyBean2Bean(form, t07_case_alert_advi1);
			
			String seq_num = String.valueOf(t07_case_alert_advi1.getSeq_num());
			request.setAttribute("seq_num", seq_num);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		//request.setAttribute("reason", reason);
//		request.setAttribute("t07_case_alert_advi", t07_case_alert_advi);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_case_stcr_adviDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_alert_advi t07_case_alert_advi = new T07_case_alert_advi();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		T07_case_transaction t07_case_trans = new T07_case_transaction();
		ArrayList getT07_alert_transList = new ArrayList();
		ArrayList t07_transList = new ArrayList();
		ArrayList t07_stcr_transList = new ArrayList();
		HttpSession session = request.getSession();
		try {
			T07_case_alert_adviActionForm form = (T07_case_alert_adviActionForm) actionForm;
			
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
//			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			String stcr = StringUtils.null2String(request.getParameter("stcr"));
			String flag = StringUtils.null2String(request.getParameter("flag"));
			String objtype = StringUtils.null2String(request.getParameter("objtype"));
			String seq_num = StringUtils.null2String(request.getParameter("seq_num"));
			if(seq_num == null || seq_num.equals("null") || seq_num.equals("")){
				seq_num = "0";
			}else{
				seq_num = String.valueOf((Integer.parseInt(seq_num) + 1));
			}

			CreditTask credittask = (CreditTask) session.getAttribute("credittask");
			String post_idStr = credittask.getPost_id();
			String case_type = credittask.getCast_type();
			
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String username = auth.getT00_user().getUsername();

			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			/** 1. 添加案例特征的原因信息*/
			t07_case_alert_advi.setApplication_num(application_num);
			t07_case_alert_advi.setObjkey(stcr);
			t07_case_alert_advi.setPost_id(post_idStr);
			t07_case_alert_advi.setCreate_dt(DateUtils.getCurrDateTime());
			t07_case_alert_advi.setCreate_user(username);
			t07_case_alert_advi.setSeq_num(Long.valueOf(seq_num));
			t07_case_alert_advi.setReason(request.getParameter("reason"));
			t07_case_alert_advi.setObjtype(objtype);
			t07_case_alert_advi.setOpertype(flag);
			int rows2 = t07_case_applicationDAO.insertT07_case_stcr_advi(sqlMap, t07_case_alert_advi);
			
			/** 2. 修改案例特征表中特征、客户、账户信息*/
			t07_case_stcr.setApplication_num(application_num);
//			t07_case_stcr.setParty_id(party_id);
			t07_case_stcr.setStcr(stcr);
			t07_case_stcr.setCase_type(case_type);
			if(flag != null && flag.equals("1")){
				t07_case_stcr.setStatus("4");
			}else{
				t07_case_stcr.setStatus("1");
			}
			
			t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
			
			/** 3. 修改案例交易表中特征信息*/
			t07_case_trans.setApplication_num(application_num);
//			t07_case_trans.setParty_id(party_id);
			t07_case_trans.setStcr(stcr);
			t07_case_trans.setCase_type(case_type);
			if(flag.equals("1")){
				t07_case_trans.setStatus_cd("4");
			}else{
				t07_case_trans.setStatus_cd("1");			
			}
			
			t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
			
			if(flag.equals("1")){
				t07_case_applicationDAO.updatet47_trans_uc(t07_case_trans, sqlMap);
			}else{
				int count=t07_case_applicationDAO.modifyT07_trans_uc_status1(sqlMap, t07_case_trans);//恢复交易
				//System.out.print("count::::"+count);
			}
			
			
			sqlMap.commitTransaction();
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public ActionForward performGetT07_case_stcr_advi(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_alert_advi t07_case_alert_advi = new T07_case_alert_advi();
		ArrayList adviList = new ArrayList();
		try {
			T07_case_alert_adviActionForm form = (T07_case_alert_adviActionForm) actionForm;
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
//			String party_id = StringUtils.null2String(request.getParameter("party_id"));
			String stcr = StringUtils.null2String(request.getParameter("stcr"));
			String objtype = StringUtils.null2String(request.getParameter("objtype"));
			
			t07_case_alert_advi.setApplication_num(application_num);
//			t07_case_alert_advi.setParty_id(party_id);
//			t07_case_alert_advi.setStcr(stcr);
			t07_case_alert_advi.setObjkey(stcr);
			t07_case_alert_advi.setObjtype(objtype);
			adviList = t07_case_applicationDAO.getT07_case_stcr_adviList(sqlMap, t07_case_alert_advi);
//			MyBeanUtils.copyBean2Bean(form, t07_case_alert_advi);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
//		session.removeAttribute("t07_case_alert_advi");
		request.setAttribute("adviList", adviList);
		return actionMapping.findForward("success");
	}
	
	
	public ActionForward getT07_caseMoreDisp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		ArrayList getT07_alertList = new ArrayList();
		ArrayList getT07_alertList1 = new ArrayList();
		ArrayList getAlert_caseList = new ArrayList();
		List getT47_transactionList = new ArrayList();
		ArrayList getT07_case_adviList = new ArrayList();
		ArrayList getT47_transaction_moreList = new ArrayList();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		
		try {
			T07_case_applicationActionForm t07_case_applicationActionForm=(T07_case_applicationActionForm)actionForm;
			String application_num=request.getParameter("application_num");
			t07_case_applicationActionForm.setApplication_num(application_num);
			String validate_ind=request.getParameter("validate_ind");
			String cast_type=request.getParameter("cast_type");
			request.setAttribute("cast_type", cast_type);
			t07_case_applicationActionForm.setValidate_ind(validate_ind);
			String newsearchflag = StringUtils.nullObject2String( request.getParameter("newsearchflag") );

			//取得案例状态(0当前1历史)
			String casesearchtime = request.getParameter("casesearchtime");
			request.setAttribute("casesearchtime", casesearchtime);
			LinkedHashMap statusMap = cm.getMapFromCache("yesNo");
			request.setAttribute("statusMap", this.getOptionsListByMap(
					statusMap, null, true));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
					String pageInfo="";
		if("1".equals(newsearchflag) ){//新的查询
			// 取得该案例下的所有预警的列表信息
			t07_case_application.setApplication_num(application_num);
			if( (casesearchtime != null && casesearchtime.equals("0")) ||
				(casesearchtime != null && casesearchtime.equals("1"))	){
				t07_case_application.setCasesearchtime(casesearchtime);
			}else{//当不是从案例查询进来的时候为空
				t07_case_application.setCasesearchtime("0");
			}

				t07_case_application.setValidate_ind(validate_ind);
				t07_case_application.setCast_type(cast_type);

			session.setAttribute("searcht07_case_application", t07_case_application);
		}else{
			t07_case_application=(T07_case_application)session.getAttribute("searcht07_case_application");
		}
			int totalRow=0;

				// 取得该案例下的所有预警下的所有的交易信息
			totalRow=t07_case_applicationDAO.getT07_transacionList2Count(sqlMap, t07_case_application);	
			
			getT47_transaction_moreList = t07_case_applicationDAO.getT07_transacionList2(sqlMap,t07_case_application,this.getStartRec(intPage),this.getIntPageSize());
				
//			}
		
			String url = request.getContextPath() + "/report"
			+ actionMapping.getPath() + ".do";
	      
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			request.setAttribute("pageInfo", pageInfo);
			
			request.setAttribute("getT47_transaction_moreList", getT47_transaction_moreList);
			request.setAttribute("casesearchtime", casesearchtime);
			} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	public ActionForward exportT07_caseMoreDisp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		
		ArrayList t47_transactionList = new ArrayList();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		
		try {
			t07_case_application = (T07_case_application)session.getAttribute("searcht07_case_application");
			if(t07_case_application == null){
				t07_case_application = new T07_case_application();
			}
			t47_transactionList = t07_case_applicationDAO.getT07_transacionList2(sqlMap,t07_case_application,0,5000);
			if(t47_transactionList.size() > 5000){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","一次导出交易不得超过5000条！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			request.setAttribute("t47_transactionList", t47_transactionList);
			String excelName = "t47_transExcel_"+DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
			request.setAttribute("excelName", excelName);
			
			} catch (Exception e) {
			e.printStackTrace();logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT47_partyComm(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_partyList = new ArrayList();
		String pageInfo = "";
	
		T47_partyDAO t47_partyDAO =(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_party t47_party = new T47_party();
		try {
			T47_partyActionForm form = (T47_partyActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			 //
            String input_name = StringUtils.nullObject2String( request.getParameter("input_name") );
            String input_name_disp = StringUtils.nullObject2String( request.getParameter("input_name_disp") );
            String type = StringUtils.nullObject2String( request.getParameter("type") );
            request.setAttribute("input_name",input_name);
            request.setAttribute("input_name_disp",input_name_disp);
            
			
			if ("I".equals(type)){
				TreeMap	clienttypeMap=new TreeMap();
				clienttypeMap.put("I", "对私");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(clienttypeMap, null,false));
			}else {
				LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(clienttypeMap, null,false));
			}
			
         
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_party, form);
				if(form.getParty_id_s()!=null) {
					t47_party.setParty_id(form.getParty_id_s());
				}
				// 模糊匹配，需要特殊处理一下
//				if (!form.getParty_chn_name_search().equals("")) {
//					t47_party.setParty_chn_name("%"
//							+ form.getParty_chn_name_search() + "%");
//				}
				t47_party.setParty_chn_name(form.getParty_chn_name_search());
				session.setAttribute("t47_partySearchObj", t47_party);
			} else {// 翻页
				t47_party = (T47_party) session
						.getAttribute("t47_partySearchObj");
			}
			if (t47_party == null) {
				T47_party t47_party1 = new T47_party();
				t47_party = t47_party1;
			}

			// 机构范围
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();

			//村镇银行定位客户号只定位本村镇银行的，根据t87_syspara的400参数判断
			LinkedHashMap t87_sysparaMap=cm.getMapFromCache("t87_syspara");
			if(t87_sysparaMap.containsKey("400")&&"1".equals(t87_sysparaMap.get("400")))
			{
				String user_org=auth.getT00_user().getOrgankey();//用户机构
				List organList=auth.getOrganList();
				Iterator iter=organList.iterator();
				String organLevel="";//用户机构所属级别
				while(iter.hasNext())
				{
					T00_organ organ=(T00_organ)iter.next();
					String organkey=organ.getOrgankey();
					if(organkey.equals(user_org)){
						
						organLevel=organ.getOrganlevel();
					}
					
				}
				StringBuffer organstr=new StringBuffer();//通过用户机构找到用户的上级再找到所有下级作为机构权限
				organstr.append("select p.suborgankey ");
				organstr.append("from t00_organ t, t87_organ_map m,t87_organ_map p ");
				organstr.append("where m.organkey=t.organkey ");
				organstr.append("  and m.organkey=p.organkey ");
				organstr.append("  and m.suborgankey='"+user_org+"' ");
				
				if(!"0".equals(organLevel))//如果不是总行级别的需要加上条件
				{
					organstr.append(" and t.organlevel='1' ");
				}
				
				t47_party.setOrgankey(organstr.toString());
			}
			
			//end by qiuyun 
			String searchtype=request.getParameter("type");
			if(searchtype!=null&&searchtype.equals("search")||intPage>=1)
			{
			
			t47_partyList = t47_partyDAO.getT47_partyCommForCase(sqlMap, t47_party,
					this.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t47_partyDAO
					.getT47_partyCommForCaseCount(sqlMap, t47_party);
			
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			  }
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
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
	public ActionForward performAddT07_caseErrorD_applicationDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_reportDAO t07_reportDAO=(T07_reportDAO)context.getBean("t07_reportDAO");
		T07_ReportBo t07_ReportBo=(T07_ReportBo)context.getBean("t07_ReportBo");
		T07_case_application t07_case_application = new T07_case_application();
		T07_report t07_report=new T07_report();
		
		String modify = "";
		try {
			String reportkeys= request.getParameter("reportkey1");
			
		sqlMap.startTransaction();
			
			// 案例信息
			String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
								+ this.getSequenceNextVal("t07_case_application_app");
			t07_case_application.setApplication_num(caseId);
			t07_case_application.setFlow_id("10");
			t07_case_application.setCase_name(caseId+"_DE");
			t07_case_application.setCast_type("1");
			t07_case_application.setCase_kind("C");
			t07_case_application.setApp_org_id(request.getParameter("ficd"));
			t07_case_application.setApp_org_name(request.getParameter("finm"));
			t07_case_application.setPost_id("P0102");
			t07_case_application.setNode_id("N1001");
			t07_case_application.setParty_class_cd(StringUtils.null2String(request.getParameter("party_class_cd")));
			t07_case_application.setCurr_cd(StringUtils.null2String(request.getParameter("curr_cd")));
			
			// 取该用户的信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String username = auth.getT00_user().getUsername();
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setApp_state_cd("1");
			t07_case_application.setDate_status_cd("1");
			t07_case_application.setLast_upd_user(username);
			t07_case_application.setCase_date(DateUtils.getCurrDateTime());
			t07_case_application.setRecheck_num(Long.valueOf("0"));
			t07_case_application.setValidate_ind("1");

			//取得大额纠错报告信息
			
			t07_report=new T07_report();
			String type=request.getParameter("type");
			HashMap tsdtHash=(HashMap)session.getAttribute("tsdtHash");
			String[] reportkeyCheckBox =reportkeys.split(",");
			HashMap tsdtHashnew=new HashMap();
			
			if (type!=null&&type.equals("all")){
				tsdtHashnew=tsdtHash;
			}else{
				for (int i=0;i<reportkeyCheckBox.length;i++){
				String repor_kkey = reportkeyCheckBox[i];
				tsdtHashnew.put(repor_kkey, tsdtHash.get(repor_kkey)); 
			   }
			}
			t07_report=t07_ReportBo.getErrorReportD(tsdtHashnew, t07_case_application);
			//写入大额纠错报告信息
			boolean issuss=t07_ReportBo.addReportError(sqlMap, t07_report, t07_case_application, auth, context);
			if(!issuss){
				throw new Exception("写入大额纠错报告信息失败！");
			}
			//写入案例基本信息
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
			int rows = t07_case_applicationDAO.insertT07_case_application(
						sqlMap, t07_case_application);
			if(rows<1){
				throw new Exception("写入大额纠错案例信息失败！");
			}
			
				
				/** *写操作日志************************************************/
				// 1.初始化日志对象
				T00_operate_log t00_operate_log=new T00_operate_log();
				t00_operate_log.setModule_key_sub1("创建大额纠错案例");//子功能点1级
				t00_operate_log.setModule_key_sub2("");//子功能点2级
				t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
				t00_operate_log.setOperate_obj2("");//操作对象2级
				t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ(String.valueOf(rows));//操作结果 1：成功0：失败
				t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);

		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		
			return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_caseErrorK_applicationDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_reportDAO t07_reportDAO=(T07_reportDAO)context.getBean("t07_reportDAO");
		T07_ReportBo t07_ReportBo=(T07_ReportBo)context.getBean("t07_ReportBo");
		T07_case_application t07_case_application = new T07_case_application();
		String modify = "";
		T07_report t07_report=new T07_report();
	
		try {
			String reportkeys= request.getParameter("reportkey1");
			//获取源案例信息
			t07_report = t07_reportDAO.getT07_reportDisp1(sqlMap,
					reportkeys);
			T07_case_application t07_case_application1 = t07_case_applicationDAO
			.getT07_case_applicationDisp1(sqlMap,
					t07_report.getApplication_num());
			t07_case_application.setParty_id(t07_case_application1.getParty_id());
			t07_case_application.setParty_name(t07_case_application1.getParty_name());
			t07_case_application.setCurr_cd(t07_case_application1.getCurr_cd());
			t07_case_application.setParty_class_cd(t07_case_application1.getParty_class_cd());
			t07_case_application.setAlert_level(t07_case_application1.getAlert_level());
			t07_case_application.setTran_count(t07_case_application1.getTran_count());
			t07_case_application.setTran_amt(t07_case_application1.getTran_amt());
			t07_case_application.setAcct_count(t07_case_application1.getAcct_count());
			t07_case_application.setParty_count(t07_case_application1.getParty_count());
			t07_case_application.setObjkey(StringUtils.null2String(t07_case_application1.getObjkey()));
			sqlMap.startTransaction();		
			// 案例信息
			String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
								+ this.getSequenceNextVal("t07_case_application_app");
			t07_case_application.setApplication_num(caseId);
			t07_case_application.setFlow_id("10");
			t07_case_application.setCase_name(caseId+"_KY");
			t07_case_application.setCast_type("2");
			t07_case_application.setCase_kind("C");
			t07_case_application.setApp_org_id(request.getParameter("ficd"));
			t07_case_application.setApp_org_name(request.getParameter("finm"));
			t07_case_application.setNode_id("N1001");
			t07_case_application.setPost_id("P0102");
			// 取该用户的信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String username = auth.getT00_user().getUsername();
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setApp_state_cd("1");
			t07_case_application.setDate_status_cd("1");
			t07_case_application.setLast_upd_user(username);			
			t07_case_application.setRecheck_num(Long.valueOf("0"));
			t07_case_application.setValidate_ind("1");
			
			//写入可疑纠错报告信息
			String reportkeyCheckBox=request.getParameter("reportkey1");
			boolean issuss=t07_ReportBo.addReportErrorK(sqlMap, reportkeyCheckBox, t07_case_application, auth,context);
			if(!issuss){
				throw new Exception("写入大额纠错报告信息失败！");
			}
			if(t07_case_application.getTran_amt()==null){
			t07_case_application.setTran_amt(Double.valueOf("0"));
			}
			if(t07_case_application.getTran_count()==null){
				t07_case_application.setTran_count(Long.valueOf("0"));
				}
			//写入案例基本信息
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
			int rows = t07_case_applicationDAO.insertT07_case_application_all_field(
						sqlMap, t07_case_application);
			if(rows<1){
				throw new Exception("写入大额纠错案例信息失败！");
			}
				
				/** *写操作日志************************************************/
				// 1.初始化日志对象
				T00_operate_log t00_operate_log=new T00_operate_log();
				t00_operate_log.setModule_key_sub1("创建可疑纠错案例");//子功能点1级
				t00_operate_log.setModule_key_sub2("");//子功能点2级
				t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
				t00_operate_log.setOperate_obj2("");//操作对象2级
				t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ(String.valueOf(rows));//操作结果 1：成功0：失败
				t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);

			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);

		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		
			return actionMapping.findForward("success");
	}
	
	public ActionForward performAddT07_caseDelete_applicationDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		String modify = "";
	 		T07_report t07_report=new T07_report();
			T07_reportDAO t07_reportDAO=new T07_reportDAO();
			try {
				String reportkeys= request.getParameter("reportkey1");
			
				t07_case_application.setParty_class_cd(StringUtils.null2String(request.getParameter("party_class_cd")));
				t07_case_application.setCurr_cd(StringUtils.null2String(request.getParameter("curr_cd")));
			sqlMap.startTransaction();
			// 案例信息			
			String caseId = "C"	+ DateUtils.FormatDate(DateUtils.getCurrDateTime(),	"yyyymmdd")
								+ this.getSequenceNextVal("t07_case_application_app");
			t07_case_application.setApplication_num(caseId);
			t07_case_application.setFlow_id("11");
			t07_case_application.setCase_name(caseId+"_DE");
			t07_case_application.setCast_type("1");
			t07_case_application.setCase_kind("D");
			t07_case_application.setApp_org_id(request.getParameter("ficd"));
			t07_case_application.setApp_org_name(request.getParameter("finm"));
			t07_case_application.setNode_id("N1101");
			t07_case_application.setPost_id("P0102");
			// 取该用户的信息
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String username = auth.getT00_user().getUsername();
			t07_case_application.setApp_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setCase_end_date(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setApp_state_cd("1");
			t07_case_application.setDate_status_cd("1");
			t07_case_application.setLast_upd_user(username);
			t07_case_application.setCase_date(DateUtils.getCurrDateTime());
			t07_case_application.setRecheck_num(Long.valueOf("0"));
			t07_case_application.setValidate_ind("1");
			

			//取得大额删除报告信息
			T07_ReportBo t07_ReportBo=(T07_ReportBo)context.getBean("t07_ReportBo");
			t07_report=new T07_report();
			String searchtype=request.getParameter("searchtype");
			String type=request.getParameter("type");
			HashMap tsdtHash=(HashMap)session.getAttribute("tsdtHash");
		 
			String[] reportkeyCheckBox=reportkeys.split(",");
			HashMap tsdtHashnew=new HashMap();

		    if (type!=null&&type.equals("all")||(searchtype!=null&&!"1".equals(searchtype))){
		    	T07_nbh_tsdtDAO t07_nbh_tsdtDAO=(T07_nbh_tsdtDAO)context.getBean("t07_nbh_tsdtDAO");
		    	T07_nbh_tsdt t07_nbh_tsdt = (T07_nbh_tsdt)session.getAttribute("t07_nbh_tsdtSearchObj");
		    	ArrayList t07_nbh_tsdtList = t07_nbh_tsdtDAO.getT07_nbh_tsdtList_R_all(sqlMap, t07_nbh_tsdt);
		    	for(int i=0;i<t07_nbh_tsdtList.size();i++){
		    		T07_nbh_tsdt  t07_nbh_tsdt1=(T07_nbh_tsdt)t07_nbh_tsdtList.get(i);
		    		tsdtHashnew.put(t07_nbh_tsdt1.getReportkey()+t07_nbh_tsdt1.getCati_seqno()+t07_nbh_tsdt1.getCrcd()+t07_nbh_tsdt1.getTsdt_seqno(), t07_nbh_tsdt1);
		    	}
			}else{
			  for(int i=0;i<reportkeyCheckBox.length;i++){
				String repor_kkey = reportkeyCheckBox[i];
				tsdtHashnew.put(repor_kkey, tsdtHash.get(repor_kkey)); 
			   }
			}
			//写入大额纠错报告信息
			boolean issuss=t07_ReportBo.addReportDelete(sqlMap, "1", tsdtHashnew, t07_case_application, auth,context);
			if(!issuss){
				throw new Exception("写入大额删除报告信息失败！");
			}
			//写入案例基本信息
			//人工新增案例，案例来源均为"规则"
			t07_case_application.setCase_source("1");
			int rows = t07_case_applicationDAO.insertT07_case_application(
						sqlMap, t07_case_application);
			if(rows<1){
				throw new Exception("写入大额删除案例信息失败！");
			}
				// 向任务流转记录表中插入数据
				/*CreditTask creditTask = new CreditTask();
				T07_FlowBo flowBo = new T07_FlowBo();
				creditTask.setApplication_num(caseId);
				Long seqnum = flowBo.getNex_seqNumValue(creditTask);
				creditTask.setFlow_id(t07_case_application.getFlow_id());
				creditTask.setSeq_num(seqnum);
				creditTask.setOper_id("");
				creditTask.setApp_org_id(t07_case_application.getApp_org_id());
				creditTask.setApp_org_id(t07_case_application.getApp_org_id());
				boolean isSucc = flowBo.updRM_appMovefact1(auth, creditTask,
						sqlMap);
				System.out.println("boolean::::::;" + isSucc);*/
				/** *写操作日志************************************************/
				// 1.初始化日志对象
				T00_operate_log t00_operate_log=new T00_operate_log();
				t00_operate_log.setModule_key_sub1("创建大额删除案例");//子功能点1级
				t00_operate_log.setModule_key_sub2("");//子功能点2级
				t00_operate_log.setOperate_obj1(t07_case_application.getApplication_num());//操作对象1级
				t00_operate_log.setOperate_obj2("");//操作对象2级
				t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ(String.valueOf(rows));//操作结果 1：成功0：失败
				t00_operate_log.setOperate_desc("t07_case_application");//操作描述(操作的表名，用"；"分割)
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);

			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常：",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);

		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		
			return actionMapping.findForward("success");
	}
	
	
	
	public ActionForward performGetT08_partyriskresult_list(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_partyList;
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		CreditTask creditTask = new CreditTask();
	
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			creditTask = (CreditTask) session.getAttribute("credittask");
			String application_num=creditTask.getApplication_num();
			String case_type=creditTask.getCast_type();
			
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
		
			if (newsearchflag.equals("1")) {// 新的查询
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setCase_type(case_type);
				t07_case_stcr.setIntPage(0);
				session.setAttribute("t07_case_party_risk", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_party_risk");
				if(intPage!=0){
					t07_case_stcr.setIntPage(intPage);
					session.setAttribute("t07_case_party_risk",
							t07_case_stcr);
					}
				if(t07_case_stcr!=null)intPage=t07_case_stcr.getIntPage();
				
			}
			
			t07_stcr_partyList = t07_case_applicationDAO.getT07_risk_partyList(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_case_applicationDAO.getT07_risk_partyListCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/report"
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
		request.setAttribute("t07_stcr_partyList", t07_stcr_partyList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		//add by qiuyun 2014-02-13 判断当前案例是否可加入关注库
		List atten_typeList=new ArrayList();
		
		List<T07_ATTENTION_purview>  purviewList=cm.getListFromCache("t07_attention_purview");
		String curr_post=creditTask.getPost_id();
		
		for(T07_ATTENTION_purview purview: purviewList)
		{
			if(purview.getAdd_post().equals(curr_post))
			{
				atten_typeList.add(purview.getAdd_post());
			}
		}
		if(atten_typeList.size()>0)
		{
			request.setAttribute("add_atten_lib", "1");
		}
		//end by qiuyun 2014-02-13
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_caseAnalysis(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList getT07_alertList = new ArrayList();
		String pageInfo = "";
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_feature t07_case_feature = new T07_case_feature();
		
		String application_num1 = "";
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			
				// 从Session中取得Application_num的值
				CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
				String application_num = creditTask.getApplication_num();
				application_num1 = creditTask.getApplication_num();
				
				t07_case_feature = t07_case_applicationDAO.getT07_case_featureDisp(sqlMap, application_num);
				
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_feature", t07_case_feature);
		return actionMapping.findForward("success");
	}
	
	
	public ActionForward performControl_trans(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO)context.
		                                             getBean("t07_case_applicationDAO");
		
		try {
			   //T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			
				// 从Session中取得Application_num的值
				CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
				String application_num = creditTask.getApplication_num();
				String is_grey=request.getParameter("is_grey");
				T07_case_application t07_case_application= new T07_case_application();
				t07_case_application.setApplication_num(application_num);
				//如果已经控制了则更新成未控制
				String upd_target="1".equals(is_grey)?"0":"1";
				t07_case_application.setIs_grey(upd_target);
				t07_case_application.setCast_type(creditTask.getCast_type());
				
				sqlMap.startTransaction();				
				t07_case_applicationDAO.modifyT07_case_application_is_grey(sqlMap, t07_case_application);
				t07_case_applicationDAO.modifyT47_transaction_uc_isrecordflag(sqlMap, t07_case_application);
				sqlMap.commitTransaction();
				
				//更新SESSION 中的值
				creditTask.setIs_grey(upd_target);
				
			
		} catch (Exception e) {
			e.printStackTrace();logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally
		{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return actionMapping.findForward("success");
	}
/**
 * @author ljd
 * @param 三号令 大额特征验证
 * */
	//add ljd start
	public  Map ValidateBhRule(Map dataMap){
		 Map resultMap = new HashMap();
		//获取大额特征标志
		 String destcr =(String) dataMap.get("destcr");
		//获取本外币标志 1:本币 2：外币 3：本外币
		 String is_local_curr =  (String) dataMap.get("is_local_curr");
		 //获取折合人民币金额
		 Double total_cny = (Double) dataMap.get("total_cny");
		//获取折合美元金额
		 Double total_usd =  (Double) dataMap.get("total_usd");
		 String cust_id = (String) dataMap.get("cust_id");
		 String cust_name = (String) dataMap.get("cust_name");
		 //大额01验证
		 if(destcr.equals("CPDE-DE01")){
			 if(is_local_curr.equals("1") && total_cny<50000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额01标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("2") && total_usd<10000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额01标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("3")){
				 if(total_usd<10000.0D && total_cny<50000.0D){
					 resultMap.put("isValidBhTrans","false"); 
			         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额01标准！");
			         return resultMap; 
				 }
			 } 
				  resultMap.put("isValidBhTrans","true");
			 }
		
		//大额02验证
		 if(destcr.equals("CPDE-DE02")){
			 if(is_local_curr.equals("1") && total_cny<2000000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额02标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("2") && total_usd<200000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额02标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("3")){
				 if(total_usd<200000.0D && total_cny<2000000.0D){
					 resultMap.put("isValidBhTrans","false"); 
			         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额02标准！");
			         return resultMap; 
				 }
			 } 
				  resultMap.put("isValidBhTrans","true");
			 }
		//大额03验证
		 if(destcr.equals("CPDE-DE03")){
			 if(is_local_curr.equals("1") && total_cny<500000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额03标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("2") && total_usd<100000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额03标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("3")){
				 if(total_usd<100000.0D && total_cny<500000.0D){
					 resultMap.put("isValidBhTrans","false"); 
			         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额03标准！");
			         return resultMap; 
				 }
			 } 
				  resultMap.put("isValidBhTrans","true");
			 }
		
		//大额04验证
		 if(destcr.equals("CPDE-DE04")){
			 if(is_local_curr.equals("1") && total_cny<200000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额04标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("2") && total_usd<10000.0D){
				 resultMap.put("isValidBhTrans","false"); 
		         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额04标准！");
		         return resultMap; 
			 }
			 if(is_local_curr.equals("3")){
				 if(total_usd<10000.0D && total_cny<200000.0D){
					 resultMap.put("isValidBhTrans","false"); 
			         resultMap.put("errorMsg","客户:"+cust_name+"("+cust_id+")，交易不满足大额04标准！");
			         return resultMap; 
				 }
			 } 
				  resultMap.put("isValidBhTrans","true");
			 }
		
		 return resultMap;
	 }
//add ljd end
	
	
}