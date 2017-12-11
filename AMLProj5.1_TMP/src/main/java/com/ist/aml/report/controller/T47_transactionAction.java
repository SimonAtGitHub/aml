/**
 * Create by makecode program v2.0
 * 日期             作者 		动作
 * 2006-12-29   青蛙		创建
 */

package com.ist.aml.report.controller;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:t47_transaction_modify_do
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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import com.ist.platform.dto.T00_operate_log;
import com.ist.platform.dto.T00_organ;
import com.ist.aml.inves.dao.T47_cp_depositDAO;
import com.ist.aml.inves.dao.T47_id_depositDAO;
import com.ist.aml.inves.dto.T47_cp_deposit;
import com.ist.aml.inves.dto.T47_id_deposit;
import com.ist.aml.information.dao.T07_Supervise_msgDAO;
import com.ist.aml.information.dao.T47_OPP_bankDAO;
import com.ist.aml.information.dao.T47_Opp_infoDAO;
import com.ist.aml.information.dto.T47_OPP_bank;
import com.ist.aml.information.dto.T47_Opp_info;
import com.ist.aml.pbcreport.dao.T47_agreementDAO;
import com.ist.aml.report.bo.CountryComparator;
import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dao.T47_transactionDAO;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_trans_recordLog;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.ObjectCompare;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;

import com.ist.util.StringUtils;

public class T47_transactionAction extends BaseAction {


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
		
		if ("searchT47_transaction".equalsIgnoreCase(myaction)) {
			myforward = performSearchT47_transaction(mapping, form, request,
					response);
		}
		// 查询结果lp
		else if ("getT47_transactionList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList(mapping, form, request,
					response);
		}
		//按客户查询交易
		else if ("getT47_transaction_ucList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionUCList(mapping, form, request,
					response);
		}
		else if ("getT47_transactionList2".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList2(mapping, form, request,
					response);
		}else if ("getT47_transactionList_tpla".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList_tpla(mapping, form, request,
					response);
	     // 案例处理添加交易动作
		}else if ("getT47_transactionList_tpla_addDo".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList_tpla_addDo(mapping, form, request,
					response);
		}
		else
		// 一补交易查询界面
	      if ("searchT47_alert_transaction".equalsIgnoreCase(myaction))
			myforward = performSearchT47_alerttransaction(mapping, form,
					request, response);
		// 一补交易查询结果
		else if ("getT47_alert_transactionList".equalsIgnoreCase(myaction))
			myforward = performGetT47_alerttransactionList(mapping, form,
					request, response);
	  	// 一补修改界面
		else if ("modifyT47_transaction".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_transactioncqc(mapping, form, request,
					response);
		}	// 一补修改动作
		else if ("modifyT47_transactionDo".equalsIgnoreCase(myaction)) {
			myforward = cqcperformModifyT47_transactionDo(mapping, form,
					request, response);
		}//二补页面
		else if ("getT47_transaction_SE_List1".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transaction_SE_List1(mapping, form,
					request, response);
		}//二补修改页面 
		else if ("modifySeT47_transaction1".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_SEtransaction(mapping, form, request,
					response);
		}//二补修改动作
		else if ("saveSecondTransDo1".equalsIgnoreCase(myaction)) {
			myforward = performModifySecondTransDo(mapping, form, request,
					response);
		} 
	   // 新增交易查询
		else if ("getT47_transaction_newList".equalsIgnoreCase(myaction)) {
			myforward = performGetnewT47_transactionList(mapping, form,
					request, response);
		}// 案例添加交易页面
		else if ("case_new_trans_add".equalsIgnoreCase(myaction)) {
			myforward = performCase_new_trans_add(mapping, form, request,
					response);
		}
		// 案例添加交易保存
		else if ("case_new_trans_add_do".equalsIgnoreCase(myaction)) {
			myforward = performCase_new_trans_add_do(mapping, form, request,
					response);
		}
		//新增交易删除
		else if ("case_new_trans_delete_do".equalsIgnoreCase(myaction)) {
			myforward = performCase_new_trans_delete_do(mapping, form, request,
					response);
		}
		// 交易查询中导出Excel lp
		else if ("getT47_transactionExcelList".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionExcelList2(mapping, form,
					request, response);
		}
		// 查询详细信息lp
		else if ("getT47_transactionDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionDisp(mapping, form, request,
					response);
		}
		// 新增交易修改界面
		else if ("modifyT47_transaction_new".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_transaction_new(mapping, form,
					request, response);
		}
		else if ("modifyT47_transaction_new_do".equalsIgnoreCase(myaction)) {
			myforward = performModifyT47_transaction_newDo(mapping, form,
					request, response);
		}
		return myforward;
		
	}
	
	
	public ActionForward performSearchT47_transaction(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		//ActionErrors errors = new ActionErrors();
		String pageInfo = "";

		
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			if ("".equals(form.getSearchPurpose())) {
				form.setSearchPurpose("1");

			}
			String searchtype = request.getParameter("searchtype");
			String bustypecd = "";
			if ("".equals(searchtype)) {
				searchtype = "all";
				form.setSearchtype(searchtype);
			} else if ("cash".equals(searchtype)) {
				searchtype = "cash";
				form.setSearchtype(searchtype);
				form.setCash_trans_flag_disp("0");
			} else if ("trans".equals(searchtype)) {
				searchtype = "trans";
				form.setSearchtype(searchtype);
				form.setCash_trans_flag_disp("1");
			} else if ("overarea".equals(searchtype)) {
				searchtype = "overarea";
				form.setSearchtype(searchtype);
				form.setOverarea_ind("1");
			} else if ("bustype1".equals(searchtype)) {
				bustypecd = "1";
				form.setBus_type_cd(bustypecd);
			} else if ("bustype2".equals(searchtype)) {
				bustypecd = "2";
				form.setBus_type_cd(bustypecd);
			} else if ("bustype3".equals(searchtype)) {
				bustypecd = "3";
				form.setBus_type_cd(bustypecd);
			} else {
				searchtype = "all";
				form.setSearchtype(searchtype);
			}

			/**
			 * add by ljd start 2017-06-10
			 * */
			String stcr=request.getParameter("stcr");
			/**
			 * add by ljd end 2017-06-10
			 * */
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			request.setAttribute("intPage", new Integer(intPage));
			request.setAttribute("searchtype", searchtype);
			request.setAttribute("bus_type_cd", bustypecd);
			
		
			LinkedHashMap channelMap = cm.getMapFromCache("channel");
			request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));
			LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
			request.setAttribute("tradesortMap", this.getOptionsListByMap(
					tradesortMap, null, true));
			LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
			request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
					null, true));
			//借贷标志
//			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//			request.setAttribute("trackflagMap", this.getOptionsListByMap(
//					trackflagMap, null, true));
			String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);

			/* ljd 注释//现转标记
			String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);

			
			// 客户类型
//		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); 
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
			String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cd_str", party_class_cd_str);*/
			
			
			/**
			 * ljd add start
			 * 2017-06-10
			 * */
			//现转标记
			String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", "1","", true);
			if("CPDE-DE01".equals(stcr)){
				cash_trans_flag_str= "<input  type='hidden'  name='cash_trans_flag_disp' value='1'/> <span class='choose'><div><span class='selected'>现金</span></div></span>";
			}else if("CPDE-DE02".equals(stcr)||"CPDE-DE03".equals(stcr)||"CPDE-DE04".equals(stcr)){
				cash_trans_flag_str= "<input  type='hidden'  name='cash_trans_flag_disp' value='2'/> <span class='choose'><div><span class='selected'>转账</span></div></span>";
			}else{
				cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			}
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);

		
			// 客户类型
			String party_class_cd_str="";
				//cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			if("CPDE-DE02".equals(stcr)){
				party_class_cd_str="<input  type='hidden'  name='party_class_cd' value='C'/><span class='choose'><div><span class='selected'>对公</span></div></span>"; 
			}else if("CPDE-DE03".equals(stcr)||"CPDE-DE04".equals(stcr)){
				party_class_cd_str="<input  type='hidden'  name='party_class_cd' value='I'/><span class='choose'><div><span class='selected'>对私</span></div></span>"; 
			}else{
				party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			}
			request.setAttribute("party_class_cd_str", party_class_cd_str);
			
			//是否跨境
			String overarea_ind_str=cm.getMapFromCacheToStr("yesNo", "overarea_ind", form.getOverarea_ind(),"", true);
			request.setAttribute("overarea_ind_str", overarea_ind_str);
			/**
			 * ljd add end
			 * 2017-06-10
			 * */
			//对手客户类型
			String opp_party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "opp_party_class_cd", form.getOpp_party_class_cd(),"", true);
			request.setAttribute("opp_party_class_cd_str", opp_party_class_cd_str);

			
			//本外币
//		LinkedHashMap currencytypeMap = cm.getMapFromCache("curr_cd"); // 客户类型
//			request.setAttribute("currencytypeMap", this.getOptionsListByMap(
//					currencytypeMap, null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);

			
			request.setAttribute("pageInfo", pageInfo);
			String party_id=request.getParameter("party_id");
			request.setAttribute("party_id", party_id);
			form.setParty_id(party_id);
			//add ljd start
			request.setAttribute("stcr", stcr);
			form.setStcr(stcr);
			//add ljd end	
			String today = DateUtils.getCurrTime();
			DateUtils dateUtils = new DateUtils();
			String tendaybefor = dateUtils.getDateChangeTime(today, "d",
					-183);
			tendaybefor = tendaybefor.substring(0, 10);
			today = today.substring(0, 10);
			if("".equals(form.getTx_dt_disp()))
			{
				form.setTx_dt_disp(tendaybefor);
			}
			if("".equals(form.getTx_enddt_disp()))
			{
				form.setTx_enddt_disp(today);
			}
			if("".equals(form.getTerr_update_dt_disp()))
			{
				form.setTerr_update_dt_disp(today);
			}
		} catch (Exception e) {
		
			return actionMapping.findForward("failure");
		}
		//
		return actionMapping.findForward("success");
	}
	/**
	 * modify by zhangyang 2007-01-06 交易查询结果
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
	public ActionForward performGetT47_transactionList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		String pageInfo = "";
		
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		
		T47_transaction t47_transaction = new T47_transaction();
		// 借贷标志
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
				null, true));
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
		LinkedHashMap channelMap = cm.getMapFromCache("channel");
		request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));


		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			//借贷标志
//			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//			request.setAttribute("trackflagMap", this.getOptionsListByMap(
//					trackflagMap, null, true));
		
			//现转标记
			LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
			request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
					null, true));
			
			
			// 客户类型
//			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); 
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
		
			
			//本外币
//			LinkedHashMap currencytypeMap = cm.getMapFromCache("curr_cd"); // 客户类型
//			request.setAttribute("currencytypeMap", this.getOptionsListByMap(
//					currencytypeMap, null, true));
			
			request.setAttribute("bus_type_cd", form.getBus_type_cd());

			form.setTx_dt(DateUtils.stringToDateShort(form.getTx_dt_disp()));
			form.setTx_dtEnd(DateUtils.stringToDateShort(form
					.getTx_enddt_disp()));
			form.setTerr_update_dt(DateUtils.stringToDateShort(form.getTerr_update_dt_disp()));
			form.setDebit_credit(form.getDebit_credit_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_disp());
			if (form.getAmt_start_search() != null
					&& !"".equals(form.getAmt_start_search())) {
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search() != null
					&& !"".equals(form.getAmt_end_search())) {
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
			} else {
				form.setAmt_max_value(null);
			}
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				// System.out.println("=====================================form.getBus_type_cd()::"+form.getBus_type_cd());
				if (form.getBus_type_cd().equals("1")) {// 限额
					t47_transaction.setBus_type_cd("1%");
				} else if (form.getBus_type_cd().equals("2")) {// 定额
					t47_transaction.setBus_type_cd("_1%");
				} else if (form.getBus_type_cd().equals("3")) {// 大额
					t47_transaction.setBus_type_cd("__1%");
				} else if (form.getBus_type_cd().equals("4")) {// 信用卡
					t47_transaction.setBus_type_cd("___1%");
				} else if (form.getBus_type_cd().equals("5")) {// 网银
					t47_transaction.setBus_type_cd("____1%");
				}
				if(form.getChannel() != null && !form.getChannel().equals("")){
					t47_transaction.setChannel(form.getChannel());
				}
				// 模糊匹配，需要特殊处理一下
				// if (t47_transaction.getRealname() != null) {
				// t47_transaction.setRealname("%" +
				// t47_transaction.getRealname() + "%");
				// }
				intPage = 0;
				session.setAttribute("t47_transactionSearchObj",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObj");
			}
			// String str=SysConfig.getProperty("substring");
			// t47_transaction.setBus_type_cd(str+"(A.BUS_TYPE_CD,"+form.getBus_type_cd()+",1)");
             if(t47_transaction==null)t47_transaction=new T47_transaction();

			t47_transactionList = t47_transactionDAO
					.getT47_trade_transactionList1(sqlMap, t47_transaction, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t47_transactionDAO
					.getT47_trade_transactionListCount1(sqlMap, t47_transaction);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form,t47_transaction);
			String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);
String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);
	String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cd_str", party_class_cd_str);
			//对手客户类型
			String opp_party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "opp_party_class_cd", form.getOpp_party_class_cd(),"", true);
			request.setAttribute("opp_party_class_cd_str", opp_party_class_cd_str);
	String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			request.setAttribute("totalRow", totalRow);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		String searchtype = request.getParameter("searchtype");
		request.setAttribute("searchtype", searchtype);
		request.setAttribute("intPage", new Integer(intPage));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);

		
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT47_transactionUCList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		String pageInfo = "";
		
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		
		T47_transaction t47_transaction = new T47_transaction();
		// 借贷标志
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
				null, true));
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
		LinkedHashMap channelMap = cm.getMapFromCache("channel");
		request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));


		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			//现转标记
			LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
			request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
					null, true));
			request.setAttribute("bus_type_cd", form.getBus_type_cd());

			form.setTx_dt(DateUtils.stringToDateShort(form.getTx_dt_disp()));
			form.setTx_dtEnd(DateUtils.stringToDateShort(form
					.getTx_enddt_disp()));
			form.setDebit_credit(form.getDebit_credit_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_disp());
			if (form.getAmt_start_search() != null
					&& !"".equals(form.getAmt_start_search())) {
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search() != null
					&& !"".equals(form.getAmt_end_search())) {
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
			} else {
				form.setAmt_max_value(null);
			}
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				
				if(form.getChannel() != null && !form.getChannel().equals("")){
					t47_transaction.setChannel(form.getChannel());
				}
				
				session.setAttribute("t47_transaction_ucSearchObj",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transaction_ucSearchObj");
			}
			
             if(t47_transaction==null)t47_transaction=new T47_transaction();

			t47_transactionList = t47_transactionDAO
					.getT47_transactionUCList(sqlMap, t47_transaction, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t47_transactionDAO
					.getT47_transactionUCCount(sqlMap, t47_transaction);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form,t47_transaction);
			String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);
            String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);
	         String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cd_str", party_class_cd_str);
			//对手客户类型
			String opp_party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "opp_party_class_cd", form.getOpp_party_class_cd(),"", true);
			request.setAttribute("opp_party_class_cd_str", opp_party_class_cd_str);
	        String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		String searchtype = request.getParameter("searchtype");
		request.setAttribute("searchtype", searchtype);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);

		//
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT47_transactionList2(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		String pageInfo = "";

		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();

		LinkedHashMap channelMap = cm.getMapFromCache("channel");
	
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
	
		request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
				null, true));
		request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));

	
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			request.setAttribute("bus_type_cd", form.getBus_type_cd());

			form.setTx_dt(DateUtils.stringToDateShort(form.getTx_dt_disp()));
			form.setTx_dtEnd(DateUtils.stringToDateShort(form
					.getTx_enddt_disp()));
			form.setDebit_credit(form.getDebit_credit_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_disp());
			if (form.getAmt_start_search() != null
					&& !"".equals(form.getAmt_start_search())) {
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search() != null
					&& !"".equals(form.getAmt_end_search())) {
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
			} else {
				form.setAmt_max_value(null);
			}
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				// System.out.println("=====================================form.getBus_type_cd()::"+form.getBus_type_cd());
				if (form.getBus_type_cd().equals("1")) {// 限额
					t47_transaction.setBus_type_cd("1%");
				} else if (form.getBus_type_cd().equals("2")) {// 定额
					t47_transaction.setBus_type_cd("_1%");
				} else if (form.getBus_type_cd().equals("3")) {// 大额
					t47_transaction.setBus_type_cd("__1%");
				} else if (form.getBus_type_cd().equals("4")) {// 信用卡
					t47_transaction.setBus_type_cd("___1%");
				} else if (form.getBus_type_cd().equals("5")) {// 网银
					t47_transaction.setBus_type_cd("____1%");
				}
				if(form.getChannel() != null && !form.getChannel().equals("")){
					t47_transaction.setChannel(form.getChannel());
				}
				// 模糊匹配，需要特殊处理一下
				// if (t47_transaction.getRealname() != null) {
				// t47_transaction.setRealname("%" +
				// t47_transaction.getRealname() + "%");
				// }
				intPage = 0;
				session.setAttribute("t47_transactionSearchObj",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObj");
			}	
			//去掉已经添加过的交易，并把transactionkey转成LIST
			Map map=(Map)request.getSession().getAttribute("case_transMap");
			if(map==null)
			{
				map=new HashMap();
			}
			Iterator iter=map.keySet().iterator();			
			ArrayList list=new ArrayList();
			while(iter.hasNext())
			{
				String key=(String)iter.next();
				list.add(key);
			}
			t47_transaction.setList(list);
			//查询不在list中的交易
			t47_transactionList = t47_transactionDAO
					.getT47_trade_transactionList1(sqlMap, t47_transaction, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t47_transactionDAO
					.getT47_trade_transactionListCount1(sqlMap, t47_transaction);
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			
			//借贷标志
//			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//			request.setAttribute("trackflagMap", this.getOptionsListByMap(
//					trackflagMap, null, true));
			String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);
			 System.out.println("=====================================form.getStcr()::"+form.getStcr());
			/**
			 * add ljd start 2017-06-10
			 * */
			if(form.getStcr().equals("CPDE-DE01")||form.getStcr().equals("CPDE-DE02")||form.getStcr().equals("CPDE-DE03")||form.getStcr().equals("CPDE-DE04")){
				//现转标记
				String cash_trans_flag_str="";
				if(form.getCash_trans_flag_disp()!=null&&!"".equals(form.getCash_trans_flag_disp())){
					if(form.getCash_trans_flag_disp().equals("1")){
						cash_trans_flag_str= "<input  type='hidden'  name='cash_trans_flag_disp' value='1'/> <span class='choose'><div><span class='selected'>现金</span></div></span>";
					}else if(form.getCash_trans_flag_disp().equals("2")){
						cash_trans_flag_str= "<input  type='hidden'  name='cash_trans_flag_disp' value='2'/> <span class='choose'><div><span class='selected'>转账</span></div></span>";
					}
				}else {
				cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
				}
				request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);
				// 客户类型
				String party_class_cd_str="";
				if(form.getParty_class_cd()!=null&&!"".equals(form.getParty_class_cd())){
					if(form.getParty_class_cd().equalsIgnoreCase("C")){
						party_class_cd_str="<input  type='hidden'  name='party_class_cd' value='C'/><span class='choose'><div><span class='selected'>对公</span></div></span>";
					}else if(form.getParty_class_cd().equalsIgnoreCase("I")){
						party_class_cd_str="<input  type='hidden'  name='party_class_cd' value='I'/><span class='choose'><div><span class='selected'>对私</span></div></span>"; 
					}
				}else{
					party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
				}
				request.setAttribute("party_class_cd_str", party_class_cd_str);
			}else {
				//现转标记
				LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
				request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
						null, true));
				String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
				request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);
				// 客户类型
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); 
				request.setAttribute("clienttypeMap", this.getOptionsListByMap(
						clienttypeMap, null, true));
				String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
				request.setAttribute("party_class_cd_str", party_class_cd_str);
				
			}
				//是否跨境
			String overarea_ind_str=cm.getMapFromCacheToStr("yesNo", "overarea_ind", form.getOverarea_ind(),"", true);
			request.setAttribute("overarea_ind_str", overarea_ind_str);
			/**
			 * add ljd end 2017-06-10
			 * */
			
			/* ljd 注释
			//现转标记
//			LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
//			request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
//					null, true));
			String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);

			
			// 客户类型
//		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); 
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
			String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cd_str", party_class_cd_str);*/
			//对手客户类型
			String opp_party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "opp_party_class_cd", form.getOpp_party_class_cd(),"", true);
			request.setAttribute("opp_party_class_cd_str", opp_party_class_cd_str);

			
			//本外币
//		LinkedHashMap currencytypeMap = cm.getMapFromCache("curr_cd"); // 客户类型
//			request.setAttribute("currencytypeMap", this.getOptionsListByMap(
//					currencytypeMap, null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		String searchtype = request.getParameter("searchtype");
		request.setAttribute("searchtype", searchtype);
		request.setAttribute("intPage", new Integer(intPage));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);

		//
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT47_transactionList_tpla(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";

		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();

		LinkedHashMap channelMap = cm.getMapFromCache("channel");
	
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
	
		request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
				null, true));
		request.setAttribute("channelMap", this.getOptionsListByMap(channelMap, null, true));

	
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			request.setAttribute("bus_type_cd", form.getBus_type_cd());

			form.setTx_dt(DateUtils.stringToDateShort(form.getTx_dt_disp()));
			form.setTx_dtEnd(DateUtils.stringToDateShort(form
					.getTx_enddt_disp()));
			form.setDebit_credit(form.getDebit_credit_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_disp());
			if (form.getAmt_start_search() != null
					&& !"".equals(form.getAmt_start_search())) {
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search() != null
					&& !"".equals(form.getAmt_end_search())) {
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
			} else {
				form.setAmt_max_value(null);
			}
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//
			String application_num=StringUtils.nullObject2String(request.getParameter("p_2329"));
			String stcr=StringUtils.nullObject2String(request.getParameter("p_2330"));
			form.setApplication_num(application_num);
			form.setStcr(stcr);
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				// System.out.println("=====================================form.getBus_type_cd()::"+form.getBus_type_cd());
				if (form.getBus_type_cd().equals("1")) {// 限额
					t47_transaction.setBus_type_cd("1%");
				} else if (form.getBus_type_cd().equals("2")) {// 定额
					t47_transaction.setBus_type_cd("_1%");
				} else if (form.getBus_type_cd().equals("3")) {// 大额
					t47_transaction.setBus_type_cd("__1%");
				} else if (form.getBus_type_cd().equals("4")) {// 信用卡
					t47_transaction.setBus_type_cd("___1%");
				} else if (form.getBus_type_cd().equals("5")) {// 网银
					t47_transaction.setBus_type_cd("____1%");
				}
				if(form.getChannel() != null && !form.getChannel().equals("")){
					t47_transaction.setChannel(form.getChannel());
				}
				String application_num_s=StringUtils.nullObject2String(request.getParameter("application_num"));
				String stcr_s=StringUtils.nullObject2String(request.getParameter("stcr"));
				t47_transaction.setApplication_num(application_num_s);
				t47_transaction.setStcr(stcr_s);
				
				session.setAttribute("t47_transactionSearchObjByParty_id",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObjByParty_id");
			}	
			if (!"0".equals(newsearchflag) ) {
				t47_transactionList = t47_transactionDAO
						.getT47_trade_transactionList_tpla(sqlMap, t47_transaction, this
								.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t47_transactionDAO
						.getT47_trade_transactionListCount_tpla(sqlMap, t47_transaction);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";
	
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form,t47_transaction);
			}
			//借贷标志

			String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("intPage", new Integer(intPage));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);

		//
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT47_transactionList_tpla_addDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";

		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_partyDAO t47_party_ucdao=(T47_partyDAO)context.getBean("t47_partyDAO");
		T47_transaction t47_transaction = new T47_transaction();
		T47_party t47_party_uc =new T47_party();

		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String[] transactionkeyCheckBox = form.getTransactionkeyCheckBox();
			ArrayList insert_transList = new ArrayList();
			ArrayList update_transList = new ArrayList();
			ArrayList transList = new ArrayList();
			for (String key : transactionkeyCheckBox) {
				if (org.apache.commons.lang.StringUtils.isNotEmpty(key)) {
					T47_transaction  uc= t47_transactionDAO.getT47_transaction_uc_from_key(sqlMap,key);
					if(uc==null){
						insert_transList.add(key);
					}else{
						update_transList.add(key);
					}
					transList.add(key);
				}
			}
			//判断是否在T47_TRANSACTION_UC表中,在则更新 ，不在插入
			sqlMap.startTransaction();
			if(update_transList.size()>0){
				/** 更新案例交易表**/
				String transactionkeys=this.formatStr(convertListToArray(update_transList), ",", "'");
				t47_transactionDAO.updateT47_transaction_uc_2(sqlMap,transactionkeys);
			}
			if(insert_transList.size()>0){
				/** 插入案例交易表**/
				T47_transaction t47_trans_acct_insert = new T47_transaction();
				t47_trans_acct_insert.setList(insert_transList);
				t47_transactionDAO.insertT47_transaction_sel_tpla(sqlMap, t47_trans_acct_insert);
			}
			if(transList.size()>0){
				/** 案例交易中间表**/
				t47_transaction.setList(transList);
				t47_transaction.setApplication_num(form.getApplication_num());
				t47_transaction.setStcr(form.getStcr());
				t47_transactionDAO.insertT07_case_transaction_ky_tpla(sqlMap, t47_transaction);
				
				ArrayList trans_acct_numList = t47_transactionDAO.getT47_transactionList_acct_num_tpla(sqlMap, t47_transaction);
				ArrayList acct_numList = new ArrayList();
				for(int i=0;i<trans_acct_numList.size();i++){
					T47_transaction t47_trans=(T47_transaction)trans_acct_numList.get(i);
					acct_numList.add(t47_trans.getAcct_num());
				}
				/** 案例账户表**/
			    String acctnums=this.formatStr(convertListToArray(acct_numList), ",", "'");
			    if(!"".equals(acctnums)){
			    	t47_transactionDAO.insertT47_acct_uc(sqlMap, acctnums);
			    }
				if(acct_numList.size()>0){
					T47_transaction t47_trans_acct = new T47_transaction();
					t47_trans_acct.setList(acct_numList);
					t47_trans_acct.setApplication_num(form.getApplication_num());
					t47_trans_acct.setStcr(form.getStcr());
					t47_transactionDAO.insertT07_case_stcr_ky_by_acct_num_tpla(sqlMap,t47_trans_acct);
				}
			}
			t47_party_uc.setParty_id(form.getParty_id());
			boolean isExist=t47_party_ucdao.isExist(sqlMap, t47_party_uc);
			if(!isExist){
				/** 案例客户表**/
				t47_party_ucdao.insertT47_party_uc_tpla(sqlMap, t47_party_uc);
			}
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			    errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			            "error.common", e.getMessage()));
			    saveMessages(request, errors);
			    return actionMapping.findForward("failure");
			}
		}

		return actionMapping.findForward("success");
	}
	 /** List to String[] */
    public String[] convertListToArray(List list) {
        String[] result = null;
        if (list != null) {
            Iterator it = list.iterator();
            result = new String[list.size()];
            int i = 0;
            while (it.hasNext()) {
                result[i] = (String) it.next();
                i++;
            }
        }
        return result;
    }
	/**
	 * add by zhangyang 2007-01-09 预警补录交易查询界面
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
	public ActionForward performSearchT47_alerttransaction(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		//ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ActionErrors errors = new ActionErrors();
		String pageInfo = "";
		T47_transaction t47_transaction = null;
		
		try {
			t47_transaction = (T47_transaction) session
					.getAttribute("t47_transactionSearchObj");
		
		if (t47_transaction == null) {
			t47_transaction = new T47_transaction();
		}
		T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
		if ("".equals(form.getOrder())) {
			form.setOrder("2");

		}
		String searchtype = request.getParameter("searchtype");
		t47_transaction.setSearchtype(searchtype);
		request.setAttribute("t47_transaction", t47_transaction);

		int intPage = StringUtils.nullObject2int(request
				.getParameter("intPage"), 0);
		// 把页码放入，方便其他返回使用
		request.getSession().setAttribute("intPage", intPage + "");
//		request.setAttribute("intPage", new Integer(intPage));
		if ("".equals(searchtype)) {
			searchtype = "all";
			form.setSearchtype(searchtype);
		} else if ("today".equals(searchtype)) {
			searchtype = "today";
			form.setSearchtype(searchtype);
			Date today = new Date(System.currentTimeMillis());
			form.setTx_today_disp(DateUtils.dateToStringShort(today));
			// form.setTx_dt_search_disp(DateUtils.dateToStringShort(today));
			// form.setTx_enddt_search_disp(DateUtils.dateToStringShort(today));
		} else if ("complete".equals(searchtype)) {
			searchtype = "complete";
			form.setSearchtype(searchtype);
			String s = "1";
			form.setAddtional_search(s);
		} else {
			searchtype = "all";
			form.setSearchtype(searchtype);
		}
		request.setAttribute("searchtype", searchtype);
		
		// 借贷标志
//		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//		request.setAttribute("trackflagMap", this.getOptionsListByMap(
//				trackflagMap, null, true));
		
//		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
//		request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
//				null, true));
		//排序
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		request.setAttribute("tradesortMap", this.getOptionsListByMap(tradesortMap,
				null, false));
		
//		LinkedHashMap statusMap = cm.getMapFromCache("yesNo");
//		request.setAttribute("statusMap", this.getOptionsListByMap(statusMap,
//				null, false));
		
//		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
//		request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//				clienttypeMap, null, true));
		
//		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//		request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//				null, true));
		
		
		
		
		
		//验证状态
//		String status_str=cm.getMapFromCacheToStr("status1", "validate_ind", form.getValidate_ind(),"", true); 
//		request.setAttribute("status_str", status_str);
		//是否已补录
		if(form.getAddtional_search().equals("")){
			form.setAddtional_search("0");
		}
		String yesNo_str=cm.getMapFromCacheToStr("yesNo", "addtional_search", form.getAddtional_search(),"", false); 
		request.setAttribute("yesNo_str", yesNo_str);
		
		//特征类型
		String deky_str=cm.getMapFromCacheToStr("deky", "alert_type_cd", form.getAlert_type_cd(),"", true); 
		request.setAttribute("deky_str", deky_str);
		
		//现转标记1
		String goflag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_search_disp", form.getCash_trans_flag_search_disp(),"", true); 
		request.setAttribute("goflag_str", goflag_str);
		
		//本外币1
		String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd_search", form.getCurr_cd_search(),"", true); 
		request.setAttribute("curr_cd_str", curr_cd_str);
		
		//借贷标志1
		String trackflag_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_search_disp", form.getDebit_credit_search_disp(),"", true); 
		request.setAttribute("trackflag_str", trackflag_str);
		
		//客户类型1
		String clienttype_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd_search", form.getParty_class_cd_search(),"", true); 
		request.setAttribute("clienttype_str", clienttype_str);
		

		
		
		pageInfo = this.getPageInfoStr(0, intPage, "", "");
		request.setAttribute("pageInfo", pageInfo);
		form.setRe_ind_search("1");
		
		//  Date time=new Date(); time=DateUtils.getCurrDateTime();
		 
		String today = DateUtils.getCurrTime();
		DateUtils dateUtils = new DateUtils();
		String tendaybefor = dateUtils.getDateChangeTime(today, "d",
				-Constans.BEFOREDAY);
		tendaybefor = tendaybefor.substring(0, 10);
		today = today.substring(0, 10);
		form.setTx_dt_search_disp(tendaybefor);
		form.setTx_enddt_search_disp(today);
		
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		//
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT47_alerttransactionList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
	
		ArrayList t47_transactionList;
		String pageInfo = "";
		//
		String querytype = request.getParameter("searchtype");
		T07_Supervise_msgDAO t07_supervise_msgDAO = (T07_Supervise_msgDAO)context.getBean("t07_Supervise_msgDAO");
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
		
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			
			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			if (form.getTx_dt_search_disp() != null)
				form.setTx_dt(DateUtils.stringToDateShort(form
						.getTx_dt_search_disp()));
			if (form.getTx_enddt_search_disp() != null)
				form.setTx_dtEnd(DateUtils.stringToDateShort(form
						.getTx_enddt_search_disp()));
			if (form.getTx_today_disp() != null)
				form.setTx_today(DateUtils.stringToDateShort(form
						.getTx_today_disp()));
			form.setDebit_credit(form.getDebit_credit_search_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_search_disp());

			if (form.getAmt_start_search().trim() != null
					&& !"".equals(form.getAmt_start_search().trim())) {
				form.setAmt(new Double(Double.parseDouble(form
						.getAmt_start_search())));
				form.setAmt_start(Double.valueOf(form.getAmt_start_search().trim()));

			} else {
				form.setAmt_start(null);
			}
			if (form.getAmt_end_search().trim() != null
					&& !"".equals(form.getAmt_end_search().trim())) {
				form.setAmt_max_value(new Double(Double.parseDouble(form
						.getAmt_end_search().trim())));
				form.setAmt_end(Double.valueOf(form.getAmt_end_search().trim()));

			} else {
				form.setAmt_end(null);
			}
			// 账户
			form.setAcct_num(form.getAcct_num_search());
			// 客户
			form.setParty_id(form.getParty_id_search());
			// 机构
			form.setOrgankey(form.getOrgankey_search());
			
			// 修改标志
			form.setAddtional(form.getAddtional_search());
			//
			form.setRe_ind(form.getRe_ind_search());
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();


			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			
			int intPage=PageUtils.intPage(request, newsearchflag);
			HashMap dateMap=t07_supervise_msgDAO.getT07_Sysdate(sqlMap, new ArrayList());
			
		
			String sysdatedisp =(String)dateMap.get(Constans.SYSTEM_KEYY);

			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				if (querytype.equals("today")) {
					t47_transaction.setTx_today(DateUtils.stringToDateShort(sysdatedisp));
				}
				if (!form.getCurr_cd_search().equals("")) {
					t47_transaction.setCurr_cd(form.getCurr_cd_search());
				}
				if (!form.getParty_class_cd_search().equals("")) {
					t47_transaction.setParty_class_cd(form
							.getParty_class_cd_search());
				}if (!form.getAddtional_search().equals("")) {
					t47_transaction.setAddtional(form
							.getAddtional_search());
				}

				session.setAttribute("t47_transactionSearchObj",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObj");
			}


			t47_transactionList = t47_transactionDAO
					.getT47_trade_transactionList_1b(sqlMap, t47_transaction, this
							.getStartRec(intPage), this.getIntPageSize());

			String strSessionkey = "";
			for (int k = 0; k < t47_transactionList.size(); k++) {
				T47_transaction t47_transactioninfo = (T47_transaction) t47_transactionList
						.get(k);
				// logger.info("-------["+k+"]--------"+t47_transactioninfo.getTransactionkey());
				if (k == t47_transactionList.size() - 1) {
					strSessionkey += ""
							+ t47_transactioninfo.getTransactionkey() + "";
				} else {
					strSessionkey += ""
							+ t47_transactioninfo.getTransactionkey() + "@";
				}

			}
			if (session.getAttribute("transListKey") != null) {
				session.removeAttribute("transListKey");
			}
			session.setAttribute("transListKey", strSessionkey);
			// end

			int totalRow = t47_transactionDAO
					.getT47_trade_transactionListCount_1b(sqlMap, t47_transaction);
			// int totalRow=0;
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do?newsearchflag=2";

	
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form, t47_transaction);
			if (t47_transaction.getTx_dt() != null)
				form.setTx_dt_start_disp(DateUtils.dateToStringShort(t47_transaction
						.getTx_dt()));
			if (t47_transaction.getTx_dtEnd() != null)
				form.setTx_enddt_search_disp(DateUtils.dateToStringShort(t47_transaction
						.getTx_dtEnd()));
			//是否已补录
			String yesNo_str=cm.getMapFromCacheToStr("yesNo", "addtional_search", form.getAddtional_search(),"", false); 
			request.setAttribute("yesNo_str", yesNo_str);
			
			//特征类型
			String deky_str=cm.getMapFromCacheToStr("deky", "alert_type_cd", form.getAlert_type_cd(),"", true); 
			request.setAttribute("deky_str", deky_str);
			
			//现转标记1
			String goflag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_search_disp", form.getCash_trans_flag_search_disp(),"", true); 
			request.setAttribute("goflag_str", goflag_str);
			
			//本外币1
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd_search", form.getCurr_cd_search(),"", true); 
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			//借贷标志1
			String trackflag_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_search_disp", form.getDebit_credit_search_disp(),"", true); 
			request.setAttribute("trackflag_str", trackflag_str);
			
			//客户类型1
			String clienttype_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd_search", form.getParty_class_cd_search(),"", true); 
			request.setAttribute("clienttype_str", clienttype_str);
			
			
			request.setAttribute("t47_transaction", t47_transaction);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
	
		String searchtype = request.getParameter("searchtype");
		request.setAttribute("searchtype", searchtype);
		request.setAttribute("pageInfo", pageInfo);

		request.setAttribute("t47_transactionList", t47_transactionList);
		//
		return actionMapping.findForward("success");
	}
	
	public ActionForward performModifyT47_transactioncqc(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			String url = StringUtils.null2String(request.getParameter("url")) + "&" + "intPage=" + request.getSession().getAttribute("intPage");
//			String intPage = StringUtils.null2String(request
//					.getParameter("intPage"));
//			String intPage = (String)request.getSession().getAttribute("intPage");
			LinkedHashMap opp_organ_typeMap = cm.getMapFromCache(
					"cfct_hash"); // 对手行行号类型

			request.setAttribute("opp_organ_typeMap", this.getOptionsListByMap(
					opp_organ_typeMap, null, true));
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type"); // 证件类型
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			LinkedHashMap currencyMap = cm.getMapFromCache("currency");
			request.setAttribute("currencyMap", this.getOptionsListByMap(
					currencyMap, null, false));
			
			
			LinkedHashMap statusMap = cm.getMapFromCache("yesNo");
			request.setAttribute("statusMap", this.getOptionsListByMap(
					statusMap, null, true));
			if(form.getStatus()==null || "".equals(form.getStatus()))
				form.setStatus("0");
			 String yesNo_str=cm.getMapFromCacheToStr("yesNo", "status", form.getStatus(),"", false); //是否保存对手信息
			 request.setAttribute("yesNo_str", yesNo_str);
			
			 if(form.getCal_ind()==null || "".equals(form.getCal_ind()))
					form.setCal_ind("0");
			 String cal_ind_str=cm.getMapFromCacheToStr("yesNo", "cal_ind", form.getCal_ind(),"", false); //是否计算
			 request.setAttribute("cal_ind_str", cal_ind_str);
			 
			LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay"); // 收付类型
			request.setAttribute("receive_payMap", this.getOptionsListByMap(
					receive_payMap, null, false));
			LinkedHashMap debit_creditMap = cm.getMapFromCache("trackflag"); // 借贷类型
			request.setAttribute("debit_creditMap", this.getOptionsListByMap(
					debit_creditMap, null, false));
			// 获取交易发生地国别
			LinkedHashMap nationalityMap = cm.getMapFromCache("country");
			request.setAttribute("countryMap", this.getOptionsListByMap(
					nationalityMap, null, true));

			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			LinkedHashMap pbc_catpMap = cm.getMapFromCache("pbc_catp"); // 帐户类型
			request.setAttribute("pbc_catpMap", this.getOptionsListByMap(
					pbc_catpMap, null, true));
			LinkedHashMap pbc_cttpMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("pbc_cttpMap", this.getOptionsListByMap(
					pbc_cttpMap, null, true));
			LinkedHashMap t87_pbc_cashMap = cm.getMapFromCache("t87_pbc_cash"); // 现钞标志
			request.setAttribute("t87_pbc_cashMap", this.getOptionsListByMap(
					t87_pbc_cashMap, null, false));

			LinkedHashMap BITPMap = cm.getMapFromCache("BITP"); // 代办人证件类型
			request.setAttribute("BITPMap", this.getOptionsListByMap(BITPMap,
					null, true));
			LinkedHashMap PBC_SWSZ1Map = cm.getMapFromCache("PBC_SWSZ1"); // 境内外汇收支交易
			request.setAttribute("PBC_SWSZ1Map", this.getOptionsListByMap(
					PBC_SWSZ1Map, null, true));
			LinkedHashMap union_organMap = cm.getMapFromCache("t87_union_organ");// 机构对应的行政地区
			LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea"); // 行政信息
			LinkedHashMap upareaMap = cm.getMapFromCache("areaid"); // 行政信息
			LinkedHashMap org_trans_relaMap = cm.getMapFromCache("rltp_hash");// 机构与大额交易的关系
			LinkedHashMap overareaMap = cm.getMapFromCache("yesNo"); // 是否跨境
			request.setAttribute("overareaMap", this.getOptionsListByMap(
					overareaMap, null, false));
			request.setAttribute("oppoffMap", this.getOptionsListByMap(
					overareaMap, null, false));// 是否离岸账户
			LinkedHashMap tx_typeMap = cm.getMapFromCache("tradetype"); // 交易类型
			request.setAttribute("tx_typeMap", this.getOptionsListByMap(
					tx_typeMap, null, false));
			LinkedHashMap tx_cdMap = cm.getMapFromCache("aml_tx_cd"); // 交易代码
			request.setAttribute("tx_cdMap", this.getOptionsListByMap(tx_cdMap,
					null, false));
			LinkedHashMap tsctMap = cm.getMapFromCache("tsct_hash1");
			request.setAttribute("tsctMap", this.getOptionsListByMap(tsctMap,
					null, true));
			
			String transactionkey = StringUtils.null2String(request
					.getParameter("transactionkey"));
			String trans_key = StringUtils.null2String(request
					.getParameter("trans_key"));

			String tag = "0";
			ArrayList transkeyMap = new ArrayList();
			if (session.getAttribute("transListKey") != null) {
				String strTransListkey = (String) session
						.getAttribute("transListKey");
				// logger.info("-------取得SESSION------["+strTransListkey+"]-----");
				if (strTransListkey.indexOf("@") != -1) {
					String[] listkey = StringUtils.split(strTransListkey, "@");
					for (int i = 0; i < listkey.length; i++) {
						String transkey = listkey[i];
						if (transactionkey.equals(transkey)) {
							tag = "1";
						} else {
							String transkey1 = listkey[0];
							t47_transaction.setTransactionkey(transkey1);
						}
						transkeyMap.add(transkey);
					}

				} else {
					t47_transaction.setTransactionkey(strTransListkey);
					transkeyMap.add(strTransListkey);
				}

			}
			if (tag.equals("1")) {
				t47_transaction.setTransactionkey(transactionkey);
			}
			String flag = StringUtils.null2String((String) request
					.getParameter("flag"));
			if (!trans_key.equals("") && flag.equals("1")) {
				t47_transaction.setTransactionkey(trans_key);
			}
			request.setAttribute("transkeyMap", this.getOptionsByList(
					transkeyMap, transkeyMap, false));
			String tableName = StringUtils.null2String(request.getParameter("tableName"));	// 针对t47_transaction_ub,t47_transaction_uc
			t47_transaction = t47_transactionDAO.getT47_transactionFillDisp11(
					sqlMap, t47_transaction.getTransactionkey(), tableName);
			if (t47_transaction.getAgent_card_type() != null
					&& !t47_transaction.getAgent_card_type().trim().equals("")
					&& t47_transaction.getAgent_card_type().length() > 2) {
				String type08 = t47_transaction.getAgent_card_type().substring(
						0, 2);
				String info08 = t47_transaction.getAgent_card_type().substring(
						2);
				t47_transaction.setAgent_card_type(type08);
				t47_transaction.setCard_inf(info08);
			}
			if (t47_transaction.getOpp_card_type() != null
					&& !t47_transaction.getOpp_card_type().trim().equals("")
					&& t47_transaction.getOpp_card_type().length() > 2) {
				String opp_type08 = t47_transaction.getOpp_card_type()
						.substring(0, 2);
				String opp_info08 = t47_transaction.getOpp_card_type()
						.substring(2);
				t47_transaction.setOpp_card_type(opp_type08);
				t47_transaction.setOpp_card_inf(opp_info08);
			}
			// 将查询出来的值拼成字符串用#分开
			String saveString = "|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOrg_trans_rela()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getAgent_name()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getAgent_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getAgent_card_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getAgent_card_no()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getParty_chn_name()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getHost_cust_id()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getAcct_num()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getSettle_type_cd()))
					+ "@|"
					+ java.net.URLEncoder
							.encode(StringUtils.null2String(t47_transaction
									.getOpp_off_shore_ind()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTx_type_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTx_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getCash_ind()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTx_go_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTx_go_area()))
					+ "@|"
					+ java.net.URLEncoder
							.encode(StringUtils.null2String(t47_transaction
									.getTx_occur_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTx_occur_area()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getUse_des()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getTsctkey()))
					+ "@|"
					+ java.net.URLEncoder
							.encode(StringUtils.null2String(t47_transaction
									.getOpp_acct_type_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_acct_num()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_card_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_name()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_card_no()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_organname()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_organ_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_organkey()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_area()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction
									.getOpp_pbc_party_class_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction
									.getOpp_party_class_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getCal_ind()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_sys_id()))
					+ "@|"
					+ java.net.URLEncoder.encode(StringUtils
							.null2String(t47_transaction.getOpp_party_id()))
			+ "@|"
			+ java.net.URLEncoder.encode(StringUtils
					.null2String(t47_transaction.getCurrency_cd()));

			request.setAttribute("saveString", saveString);

		
				if (t47_transaction.getOrgankey()!=null) {
						String org_area = (String) union_organMap.get(t47_transaction.getOrgankey());
						String updaid2 = (String) upareaMap.get(org_area);
						String comstr = org_area.substring(
								org_area.length() - 2, org_area.length());
						String comstr1 = org_area.substring(
								org_area.length() - 4, org_area.length());
						if (comstr.equals("00")) {
							if (comstr1.equals("0000")) {
								t47_transaction.setOrg_area((String) pbcareaMap
										.get(org_area));
							} else {
								t47_transaction.setOrg_area((String) pbcareaMap
										.get(updaid2)
										+ "-"
										+ (String) pbcareaMap.get(org_area));
							}
						}
						if (!comstr.equals("00")) {
							String updaid1="";
							if(updaid2!=null){
							 updaid1 = (String) upareaMap.get(updaid2);
							
							
							t47_transaction.setOrg_area(StringUtils.nullObject2String( pbcareaMap
									.get(updaid1))
									+ "-"
									+ (String) pbcareaMap.get(updaid2)
									+ "-"
									+ (String) pbcareaMap.get(org_area));
							}
							
						}
				
				}
		

			// t47_transaction =
			// t47_transactionDAO.getT47_transactionFillDisp12(t47_transaction);

			LinkedHashMap t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs1"); // 交易方式
			if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& !t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("00")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs2");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& !t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("01")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs4");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("00")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs1");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("01")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs3");
			}
			request.setAttribute("t87_pbc_gjfsMap", this.getOptionsListByMap(
					t87_pbc_gjfsMap, null, true));

			// 查询交易限制表的信息
			ArrayList tranList = cm.getListFromCache("getT47_transactionModifyFlag_forall");

			for (int i = 0; i < tranList.size(); i++) {
				T47_transaction trans = (T47_transaction) tranList.get(i);
				// =========Party_id 我行客户号
				if (trans.getTrans_field().equals("party_id")) {
					t47_transaction.setParty_id_flag(trans.getModify_ind());
					t47_transaction.setParty_id_value(trans.getDefault_val());
				}
				// ===============tsctkey //客户号

				if (trans.getTrans_field().trim().equals("host_cust_id")) {
					t47_transaction.setHost_cust_id_flag(trans.getModify_ind());

				}
				// =========Party_chn_name 我行客户名称
				if (trans.getTrans_field().equals("party_chn_name")) {
					t47_transaction.setParty_chn_name_flag(trans
							.getModify_ind());
					t47_transaction.setParty_chn_name_value(trans
							.getDefault_val());
				}
				// =========Acct_num 我行账号
				if (trans.getTrans_field().equals("acct_num")) {
					t47_transaction.setAcct_num_flag(trans.getModify_ind());
					t47_transaction.setAcct_num_value(trans.getDefault_val());
				}
				if (trans.getTrans_field().equals("org_trans_rela")) {
					t47_transaction.setOrg_trans_rela_flag(trans
							.getModify_ind());

				}
				// =========Party_class_cd 我行客户类型
				if (trans.getTrans_field().equals("party_class_cd")) {
					t47_transaction.setParty_class_cd_flag(trans
							.getModify_ind());
					t47_transaction.setParty_class_cd_value(trans
							.getDefault_val());
				}

				// =========card_type 我行客户证件类型
				if (trans.getTrans_field().equals("card_type")) {
					t47_transaction.setCard_type_flag(trans.getModify_ind());
					t47_transaction.setCard_type_value(trans.getDefault_val());
				}

				// =========card_no 我行客户证件号码
				if (trans.getTrans_field().equals("card_no")) {
					t47_transaction.setCard_no_flag(trans.getModify_ind());
					t47_transaction.setCard_no_value(trans.getDefault_val());
				}
				// =========Tx_dt 交易日期
				if (trans.getTrans_field().equals("tx_dt")) {
					t47_transaction.setTx_dt_flag(trans.getModify_ind());
					t47_transaction.setTx_dt_value(trans.getDefault_val());
				}
				// =========借/贷
				if (trans.getTrans_field().equals("debit_credit")) {
					t47_transaction.setDebit_credit_flag(trans.getModify_ind());

				}
				// =========收/付
				if (trans.getTrans_field().equals("receive_pay_cd")) {
					t47_transaction.setReceive_pay_cd_flag(trans
							.getModify_ind());

				}
				// =========Currency_cd 货币符号
				if (trans.getTrans_field().equals("currency_cd")) {
					t47_transaction.setCurrency_cd_flag(trans.getModify_ind());
					t47_transaction
							.setCurrency_cd_value(trans.getDefault_val());
				}

				// =========Opp_organkey 对方行行号
				if (trans.getTrans_field().equals("opp_organkey")) {
					t47_transaction.setOpp_organkey_flag(trans.getModify_ind());
					t47_transaction.setOpp_organkey_value(trans
							.getDefault_val());
				}
				// =========Opp_organ_type 对方行行号类型
				if (trans.getTrans_field().equals("opp_organ_type")) {
					t47_transaction.setOpp_organ_type_flag(trans
							.getModify_ind());
					t47_transaction.setOpp_organ_type_value(trans
							.getDefault_val());
				}
				// =========Opp_name 对方人名称
				if (trans.getTrans_field().equals("opp_name")) {
					t47_transaction.setOpp_name_flag(trans.getModify_ind());
					t47_transaction.setOpp_name_value(trans.getDefault_val());
				}
				// =========Opp_acct_num 对方账号
				if (trans.getTrans_field().equals("opp_acct_num")) {
					t47_transaction.setOpp_acct_num_flag(trans.getModify_ind());
					t47_transaction.setOpp_acct_num_value(trans
							.getDefault_val());
				}
				// opp_acct_type_cd_flag 对手帐户类型
				if (trans.getTrans_field().equals("opp_acct_type_cd")) {
					t47_transaction.setOpp_acct_type_cd_flag(trans
							.getModify_ind());

				}
				//				

				// =========opp_pbc_party_class_cd 对手客户类型
				if (trans.getTrans_field().equals("opp_pbc_party_class_cd")) {
					t47_transaction.setOpp_pbc_party_class_cd_flag(trans
							.getModify_ind());

				}
				// =========Opp_Card_type 对手客户证件类型
				if (trans.getTrans_field().equals("opp_card_type")) {
					t47_transaction
							.setOpp_Card_type_flag(trans.getModify_ind());
					t47_transaction.setOpp_Card_type_value(trans
							.getDefault_val());
				}
				// =========Opp_Card_no 对手客户证件号码
				if (trans.getTrans_field().equals("opp_card_no")) {
					t47_transaction.setOpp_Card_no_flag(trans.getModify_ind());
					t47_transaction
							.setOpp_Card_no_value(trans.getDefault_val());
				}
				// =========Opp_tx_dt 对手交易日期
				/*
				 * if(trans.getTrans_field().equals("opp_tx_dt")){
				 * t47_transaction.setOpp_tx_dt_flag(trans.getModify_ind());
				 * t47_transaction.setOpp_tx_dt_value(trans.getDefault_val()); }
				 */

				// =========Use_des 用途或来源
				if (trans.getTrans_field().equals("use_des")) {
					t47_transaction.setUse_des_flag(trans.getModify_ind());
					t47_transaction.setUse_des_value(trans.getDefault_val());
				}
				// =========agent_name //代办人姓名
				if (trans.getTrans_field().equals("agent_name")) {
					t47_transaction.setAgent_name_flag(trans.getModify_ind());

				}
				// =========agent_card_type //代办人身份证件/证明文件类型
				if (trans.getTrans_field().equals("agent_card_type")) {
					t47_transaction.setAgent_card_type_flag(trans
							.getModify_ind());

				}
				// =========agent_card_no //代办人身份证件/证明文件号码
				if (trans.getTrans_field().equals("agent_card_no")) {
					t47_transaction
							.setAgent_card_no_flag(trans.getModify_ind());

				}
				// =========agent_country //代办人国籍
				if (trans.getTrans_field().equals("agent_country")) {
					t47_transaction
							.setAgent_country_flag(trans.getModify_ind());

				}

				// ===============settle_type_cd 结算方式
				if (trans.getTrans_field().equals("settle_type_cd")) {
					t47_transaction.setSettle_type_cd_flag(trans
							.getModify_ind());

				}
				// ===============tsctkey //涉外收支交易代码
				if (trans.getTrans_field().equals("tsctkey")) {
					t47_transaction.setTsctkey_flag(trans.getModify_ind());

				}
				// ===============tsctkey //现钞标志
				if (trans.getTrans_field().equals("cash_ind")) {
					t47_transaction.setCash_ind_flag(trans.getModify_ind());

				}
				// ===============opp_off_shore_ind //是否离岸帐户
				if (trans.getTrans_field().equals("opp_off_shore_ind")) {
					t47_transaction.setOpp_off_shore_ind_flag(trans
							.getModify_ind());

				}
				// ===============tx_cd //交易代码
				if (trans.getTrans_field().equals("tx_cd")) {
					t47_transaction.setTx_cd_flag(trans.getModify_ind());

				}
				// ===============tx_type_cd //交易类型
				if (trans.getTrans_field().equals("tx_type_cd")) {
					t47_transaction.setTx_type_cd_flag(trans.getModify_ind());

				}
				// ===============overarea_ind //是否跨境
				if (trans.getTrans_field().equals("overarea_ind")) {
					t47_transaction.setOverarea_ind_flag(trans.getModify_ind());

				}

			}
			// 交易发生地默认为中国的某地区

			if (t47_transaction.getTx_occur_area() == null
					|| t47_transaction.getTx_occur_area().equals("")) {
				t47_transaction.setTx_occur_country(Constans.CHINA);
				t47_transaction.setTx_occur_area1(Constans.tx_occur_area);
			}
//			if (t47_transaction.getOpp_area() == null
//					|| t47_transaction.getOpp_area().equals("")) {
//				t47_transaction.setOpp_coutry(Constans.CHINA);
//			}
			request.setAttribute("occur_area", t47_transaction
					.getTx_occur_area());
			MyBeanUtils.copyBean2Bean(form, t47_transaction);
			form.setTrans_key(t47_transaction.getTransactionkey());

			request.setAttribute("url", url);
//			request.setAttribute("intPage", intPage);

			String chinavalue = Constans.AREAVALUE;
			request.setAttribute("chinavalue", chinavalue);
			request.setAttribute("org_trans_relaMap", org_trans_relaMap);
			String taskkeyflag = Constans.TASKKEYFLAG;
			request.setAttribute("taskkeyflag", taskkeyflag);
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transaction", t47_transaction);
		return actionMapping.findForward("success");
	}
	
	public ActionForward cqcperformModifyT47_transactionDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();

		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_id_depositDAO t47_id_deposiDao  = (T47_id_depositDAO)context.getBean("t47_id_depositDAO");
		T47_cp_depositDAO t47_cp_depositDao  = (T47_cp_depositDAO)context.getBean("t47_cp_depositDAO");
		T47_Opp_infoDAO t47_opp_infoDAO = (T47_Opp_infoDAO)context.getBean("t47_Opp_infoDAO");
		T47_OPP_bankDAO bankdao =(T47_OPP_bankDAO)context.getBean("t47_opp_bankDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();
		authBean = (AuthBean) session.getAttribute("authBean");
		auth = authBean.getAuthToken();
		try {
			// 事务开始
			sqlMap.endTransaction();
			sqlMap.startTransaction();

			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;

			MyBeanUtils.copyBean2Bean(t47_transaction, form);
			t47_transaction.setTx_dt(DateUtils.stringToDateShort(form
					.getTx_dt_disp()));
			t47_transaction.setAddtional("0");
			t47_transaction.setRe_dt(DateUtils.getCurrDateTime());
			t47_transaction.setParty_id(form.getParty_id1());
			if (t47_transaction.getAgent_card_type().equals("19")
					|| t47_transaction.getAgent_card_type().equals("29"))
				t47_transaction.setAgent_card_type(t47_transaction
						.getAgent_card_type()
						+ t47_transaction.getCard_inf());
			if (t47_transaction.getOpp_card_type().equals("19")
					|| t47_transaction.getOpp_card_type().equals("29"))
				t47_transaction.setOpp_card_type(t47_transaction
						.getOpp_card_type()
						+ t47_transaction.getOpp_card_inf());
			if (!t47_transaction.getOpp_coutry().equals("")) {
				if (!t47_transaction.getOpp_coutry().equals(Constans.CHINA)
						&& !t47_transaction.getOpp_coutry().equals(
								Constans.CHINA_Bonded)
						&& !t47_transaction.getOpp_coutry().equals(
								Constans.CHINA_Processing)
						&& !t47_transaction.getOpp_coutry().equals(
								Constans.CHINA_Diamond)) {
					t47_transaction.setOpp_area(Constans.AREAVALUE);
				} else {
					if (t47_transaction.getOpp_area().equals("")) {
						if (!t47_transaction.getOpp_area2().equals("")) {
							t47_transaction.setOpp_area(t47_transaction
									.getOpp_area2());
						} else {
							if (!t47_transaction.getOpp_area1().equals("")) {
								t47_transaction.setOpp_area(t47_transaction
										.getOpp_area1());
							}
						}

					}
				}
			}

			if (t47_transaction.getTx_go_country() != null
					&& !"".equals(t47_transaction.getTx_go_country().trim())) {
				if (!t47_transaction.getTx_go_country().equals(Constans.CHINA)
						&& !t47_transaction.getTx_go_country().equals(
								Constans.CHINA_Bonded)
						&& !t47_transaction.getTx_go_country().equals(
								Constans.CHINA_Processing)
						&& !t47_transaction.getTx_go_country().equals(
								Constans.CHINA_Diamond)) {
					t47_transaction.setTx_go_area(Constans.AREAVALUE);
				} else {
					if (t47_transaction.getTx_go_area().equals("")) {
						if (!t47_transaction.getTx_go_area2().equals("")) {
							t47_transaction.setTx_go_area(t47_transaction
									.getTx_go_area2());
						} else {
							if (!t47_transaction.getTx_go_area1().equals("")) {
								t47_transaction.setTx_go_area(t47_transaction
										.getTx_go_area1());
							}
						}

					}
				}
			}
			if (!t47_transaction.getTx_occur_country().equals("")) {
				if (!t47_transaction.getTx_occur_country().equals(
						Constans.CHINA)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Bonded)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Processing)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Diamond)) {
					t47_transaction.setTx_occur_area(Constans.AREAVALUE);
				} else {
					if (t47_transaction.getTx_occur_area().equals("")) {
						if (!t47_transaction.getTx_occur_area2().equals("")) {
							t47_transaction.setTx_occur_area(t47_transaction
									.getTx_occur_area2());
						} else {
							if (!t47_transaction.getTx_occur_area1().equals("")) {
								t47_transaction
										.setTx_occur_area(t47_transaction
												.getTx_occur_area1());
							}
						}

					}
				}
			}
			
			// 查询约束字段
	
			ArrayList tranList = cm.getListFromCache(
					"getT47_transactionModifyFlag_forall");
			for (int i = 0; i < tranList.size(); i++) {
				T47_transaction trans = (T47_transaction) tranList.get(i);
				
				// =========Acct_num 我行账号
				if (trans.getTrans_field().equals("acct_num")) {
					t47_transaction.setAcct_num_flag(trans.getModify_ind());

				}
				if (trans.getTrans_field().equals("org_trans_rela")) {
					t47_transaction.setOrg_trans_rela_flag(trans
							.getModify_ind());

				}

				// =========Tx_dt 交易日期
				if (trans.getTrans_field().equals("tx_dt")) {
					t47_transaction.setTx_dt_flag(trans.getModify_ind());

				}
				// =========借/贷
				if (trans.getTrans_field().equals("debit_credit")) {
					t47_transaction.setDebit_credit_flag(trans.getModify_ind());

				}
				// =========收/付
				if (trans.getTrans_field().equals("receive_pay_cd")) {
					t47_transaction.setReceive_pay_cd_flag(trans
							.getModify_ind());

				}
				// =========Currency_cd 货币符号
				if (trans.getTrans_field().equals("currency_cd")) {
					t47_transaction.setCurrency_cd_flag(trans.getModify_ind());

				}

				// =========Opp_organkey 对方行行号
				if (trans.getTrans_field().equals("opp_organkey")) {
					t47_transaction.setOpp_organkey_flag(trans.getModify_ind());

				}
				if (trans.getTrans_field().equals("opp_organname")) {
					t47_transaction
							.setOpp_organname_flag(trans.getModify_ind());

				}
				// =========Opp_organ_type 对方行行号类型
				if (trans.getTrans_field().equals("opp_organ_type")) {
					t47_transaction.setOpp_organ_type_flag(trans
							.getModify_ind());

				}
				// =========Opp_name 对方人名称
				if (trans.getTrans_field().equals("opp_name")) {
					t47_transaction.setOpp_name_flag(trans.getModify_ind());

				}
				// =========Opp_acct_num 对方账号
				if (trans.getTrans_field().equals("opp_acct_num")) {
					t47_transaction.setOpp_acct_num_flag(trans.getModify_ind());

				}

				//			
				// =========opp_pbc_party_class_cd 对手客户类型
				if (trans.getTrans_field().equals("opp_pbc_party_class_cd")) {
					t47_transaction.setOpp_pbc_party_class_cd_flag(trans
							.getModify_ind());

				}
				// =========opp_acct_type_cd_flag 对手帐户类型
				if (trans.getTrans_field().equals("opp_acct_type_cd")) {
					t47_transaction.setOpp_acct_type_cd_flag(trans
							.getModify_ind());

				}
				// =========Opp_Card_type 对手客户证件类型
				if (trans.getTrans_field().equals("opp_card_type")) {
					t47_transaction
							.setOpp_Card_type_flag(trans.getModify_ind());

				}
				// =========Opp_Card_no 对手客户证件号码
				if (trans.getTrans_field().equals("opp_card_no")) {
					t47_transaction.setOpp_Card_no_flag(trans.getModify_ind());

				}
				//		

				// =========Use_des 用途或来源
				if (trans.getTrans_field().equals("use_des")) {
					t47_transaction.setUse_des_flag(trans.getModify_ind());

				}
				// =========agent_name //代办人姓名
				if (trans.getTrans_field().equals("agent_name")) {
					t47_transaction.setAgent_name_flag(trans.getModify_ind());

				}
				// =========agent_card_type //代办人身份证件/证明文件类型
				if (trans.getTrans_field().equals("agent_card_type")) {
					t47_transaction.setAgent_card_type_flag(trans
							.getModify_ind());

				}
				// =========agent_card_no //代办人身份证件/证明文件号码
				if (trans.getTrans_field().equals("agent_card_no")) {
					t47_transaction
							.setAgent_card_no_flag(trans.getModify_ind());

				}
				// =========agent_country //代办人国籍
				if (trans.getTrans_field().equals("agent_country")) {
					t47_transaction
							.setAgent_country_flag(trans.getModify_ind());

				}

				// ===============settle_type_cd 结算方式
				if (trans.getTrans_field().equals("settle_type_cd")) {
					t47_transaction.setSettle_type_cd_flag(trans
							.getModify_ind());

				}
				// ===============tsctkey //涉外收支交易代码
				if (trans.getTrans_field().equals("tsctkey")) {
					t47_transaction.setTsctkey_flag(trans.getModify_ind());

				}
				// ===============tsctkey //现钞标志
				if (trans.getTrans_field().equals("cash_ind")) {
					t47_transaction.setCash_ind_flag(trans.getModify_ind());

				}
				// ===============opp_off_shore_ind //是否离岸帐户
				if (trans.getTrans_field().equals("opp_off_shore_ind")) {
					t47_transaction.setOpp_off_shore_ind_flag(trans
							.getModify_ind());

				}
				// ===============tx_cd //交易代码
				if (trans.getTrans_field().equals("tx_cd")) {
					t47_transaction.setTx_cd_flag(trans.getModify_ind());

				}
				// ===============tx_type_cd //交易类型
				if (trans.getTrans_field().equals("tx_type_cd")) {
					t47_transaction.setTx_type_cd_flag(trans.getModify_ind());

				}
				// ===============overarea_ind //是否跨境
				if (trans.getTrans_field().equals("overarea_ind")) {
					t47_transaction.setOverarea_ind_flag(trans.getModify_ind());

				}
			}
			String saveString = StringUtils.null2String((String) request
					.getParameter("saveString"));
			String[] saveStrings = saveString.split("@");

			String sysid = "";
			String status = t47_transaction.getStatus();
			String opp_sys_id = t47_transaction.getOpp_sys_id();
			String opp_party_id = t47_transaction.getOpp_party_id();
			String opp_acct_num = t47_transaction.getOpp_acct_num();

			String opp_pbc_party_class_cd = t47_transaction
					.getOpp_pbc_party_class_cd();
			if (opp_pbc_party_class_cd != null
					&& !opp_pbc_party_class_cd.equals("")) {
				if (opp_pbc_party_class_cd.equals(Constans.PARTY_CLASS_CD_I)) {
					t47_transaction
							.setOpp_party_class_cd(Constans.PARTY_CLASS_CDI);
				} else {
					t47_transaction
							.setOpp_party_class_cd(Constans.PARTY_CLASS_CDC);
				}
			}
			// if(!opp_acct_num.equals("")){
			if (opp_sys_id.equals("")) {
				sysid = this.getSequenceNextVal("t07_opp_info");
				t47_transaction.setOpp_sys_id(sysid);

			}
			// if(opp_party_id.equals("")||opp_party_id.trim().equals("OP")){
			int length = t47_transaction.getOpp_name().length();
			String opname = "";
//			if (length >= 12) {
//				opname = t47_transaction.getOpp_name().substring(0, 12);
//			} else {
//				opname = t47_transaction.getOpp_name().trim();
//			}
			// 查询是否有该帐号
			if (!opp_acct_num.equals("")) {
				int length1 = opp_acct_num.length();
				String opacctnum = "";
				if (length1 >= 12) {
					opacctnum = opp_acct_num.substring(0, 12);
				} else {
					opacctnum = opp_acct_num.trim();
				}
				if (!StringUtils.null2String(t47_transaction.getOpp_acct_num())
						.equals(
								java.net.URLDecoder.decode(saveStrings[20]
										.substring(1)))) {
					if (opp_pbc_party_class_cd != null
							&& !opp_pbc_party_class_cd.equals("")) {
						if (opp_pbc_party_class_cd
								.equals(Constans.PARTY_CLASS_CD_I)) {

						
							T47_id_deposit t47_id_deposit = t47_id_deposiDao
									.getT47_id_depositDisp(sqlMap, opp_acct_num);
							if (t47_id_deposit == null
									|| t47_id_deposit.getParty_id().equals("")) {
								opp_party_id = com.ist.util.Constans.OPFLAG
										+ opacctnum + opname;

							} else {
								opp_party_id = t47_id_deposit.getParty_id();
							}

						} else {
							T47_cp_deposit t47_cp_deposit = t47_cp_depositDao
									.getT47_cp_depositDisp(sqlMap, opp_acct_num);
							if (t47_cp_deposit == null
									|| t47_cp_deposit.getParty_id().equals("")) {
								opp_party_id = com.ist.util.Constans.OPFLAG
										+ opacctnum + opname;

							} else {
								opp_party_id = t47_cp_deposit.getParty_id();
							}
						}
					}
				} else {
					opp_party_id = com.ist.util.Constans.OPFLAG + opacctnum
							+ opname;
				}
			} else {
				opp_party_id = com.ist.util.Constans.OPFLAG + opname;
			}

			t47_transaction.setOpp_party_id(opp_party_id);
			// }
			// }

			if (saveStrings.length > 0) {
				if (StringUtils
						.null2String(t47_transaction.getOrg_trans_rela())
						.equals(
								java.net.URLDecoder.decode(saveStrings[0]
										.substring(1)))) {
					t47_transaction.setOrg_trans_rela("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_name())
						.equals(
								java.net.URLDecoder.decode(saveStrings[1]
										.substring(1)))) {
					t47_transaction.setAgent_name("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_country())
						.equals(
								java.net.URLDecoder.decode(saveStrings[2]
										.substring(1)))) {
					t47_transaction.setAgent_country("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getAgent_card_type())
						.equals(
								java.net.URLDecoder.decode(saveStrings[3]
										.substring(1)))) {
					t47_transaction.setAgent_card_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_card_no())
						.equals(
								java.net.URLDecoder.decode(saveStrings[4]
										.substring(1)))) {
					t47_transaction.setAgent_card_no("#");
				}
				if (StringUtils
						.null2String(t47_transaction.getParty_chn_name())
						.equals(
								java.net.URLDecoder.decode(saveStrings[5]
										.substring(1)))) {
					t47_transaction.setParty_chn_name("#");
				}
				if (StringUtils.null2String(t47_transaction.getHost_cust_id())
						.equals(
								java.net.URLDecoder.decode(saveStrings[6]
										.substring(1)))) {
					t47_transaction.setHost_cust_id("#");
				}
				if (StringUtils.null2String(t47_transaction.getAcct_num())
						.equals(
								java.net.URLDecoder.decode(saveStrings[7]
										.substring(1)))) {
					t47_transaction.setAcct_num("#");
				}
				if (StringUtils
						.null2String(t47_transaction.getSettle_type_cd())
						.equals(
								java.net.URLDecoder.decode(saveStrings[8]
										.substring(1)))) {
					t47_transaction.setSettle_type_cd("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getOpp_off_shore_ind())
						.equals(
								java.net.URLDecoder.decode(saveStrings[9]
										.substring(1)))) {
					t47_transaction.setOpp_off_shore_ind("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_type_cd())
						.equals(
								java.net.URLDecoder.decode(saveStrings[10]
										.substring(1)))) {
					t47_transaction.setTx_type_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_cd()).equals(
						java.net.URLDecoder
								.decode(saveStrings[11].substring(1)))) {
					t47_transaction.setTx_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getCash_ind())
						.equals(
								java.net.URLDecoder.decode(saveStrings[12]
										.substring(1)))) {
					t47_transaction.setCash_ind("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_go_country())
						.equals(
								java.net.URLDecoder.decode(saveStrings[13]
										.substring(1)))) {
					t47_transaction.setTx_go_country("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_go_area())
						.equals(
								java.net.URLDecoder.decode(saveStrings[14]
										.substring(1)))) {
					t47_transaction.setTx_go_area("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getTx_occur_country()).equals(
						java.net.URLDecoder
								.decode(saveStrings[15].substring(1)))) {
					t47_transaction.setTx_occur_country("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_occur_area())
						.equals(
								java.net.URLDecoder.decode(saveStrings[16]
										.substring(1)))) {
					t47_transaction.setTx_occur_area("#");
				}
				if (StringUtils.null2String(t47_transaction.getUse_des())
						.equals(
								java.net.URLDecoder.decode(saveStrings[17]
										.substring(1)))) {
					t47_transaction.setUse_des("#");
				}
				if (StringUtils.null2String(t47_transaction.getTsctkey())
						.equals(
								java.net.URLDecoder.decode(saveStrings[18]
										.substring(1)))) {
					t47_transaction.setTsctkey("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getOpp_acct_type_cd()).equals(
						java.net.URLDecoder
								.decode(saveStrings[19].substring(1)))) {
					t47_transaction.setOpp_acct_type_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_acct_num())
						.equals(
								java.net.URLDecoder.decode(saveStrings[20]
										.substring(1)))) {
					t47_transaction.setOpp_acct_num("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_card_type())
						.equals(
								java.net.URLDecoder.decode(saveStrings[21]
										.substring(1)))) {
					t47_transaction.setOpp_card_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_name())
						.equals(
								java.net.URLDecoder.decode(saveStrings[22]
										.substring(1)))) {
					t47_transaction.setOpp_name("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_card_no())
						.equals(
								java.net.URLDecoder.decode(saveStrings[23]
										.substring(1)))) {
					t47_transaction.setOpp_card_no("#");
				}

				if (StringUtils.null2String(t47_transaction.getOpp_organname())
						.equals(
								java.net.URLDecoder.decode(saveStrings[24]
										.substring(1)))) {
					t47_transaction.setOpp_organname("#");
				}
				if (StringUtils
						.null2String(t47_transaction.getOpp_organ_type())
						.equals(
								java.net.URLDecoder.decode(saveStrings[25]
										.substring(1)))) {
					t47_transaction.setOpp_organ_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_organkey())
						.equals(
								java.net.URLDecoder.decode(saveStrings[26]
										.substring(1)))) {
					t47_transaction.setOpp_organkey("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_coutry())
						.equals(
								java.net.URLDecoder.decode(saveStrings[27]
										.substring(1)))) {
					t47_transaction.setOpp_coutry("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_area())
						.equals(
								java.net.URLDecoder.decode(saveStrings[28]
										.substring(1)))) {
					t47_transaction.setOpp_area("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getOpp_pbc_party_class_cd()).equals(
						java.net.URLDecoder
								.decode(saveStrings[29].substring(1)))) {
					t47_transaction.setOpp_pbc_party_class_cd("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getOpp_party_class_cd()).equals(
						java.net.URLDecoder
								.decode(saveStrings[30].substring(1)))) {
					t47_transaction.setOpp_party_class_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getCal_ind())
						.equals(
								java.net.URLDecoder.decode(saveStrings[31]
										.substring(1)))) {
					t47_transaction.setCal_ind("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_sys_id())
						.equals(
								java.net.URLDecoder.decode(saveStrings[32]
										.substring(1)))) {
					t47_transaction.setOpp_sys_id("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_party_id())
						.equals(
								java.net.URLDecoder.decode(saveStrings[33]
										.substring(1)))) {
					t47_transaction.setOpp_party_id("#");
				}
				if (StringUtils.null2String(t47_transaction.getCurrency_cd())
						.equals(
								java.net.URLDecoder.decode(saveStrings[34]
										.substring(1)))) {
					t47_transaction.setCurrency_cd("#");
				}
			}
			if(t47_transaction.getCurrency_cd().equals("CNY")){
				t47_transaction.setCurr_cd("1");
			}else{
				t47_transaction.setCurr_cd("2");
			}

			String tableName = StringUtils.null2String(request.getParameter("tableName"));	// 针对一补t47_transaction_ub, 二补t47_transaction_uctem

			int rows = t47_transactionDAO.cqcmodifyT47_transaction(sqlMap,
					t47_transaction, "0", tableName);
			if (rows <= 0) {
				throw new Exception("");
			}
			if (session.getAttribute("transListKey") != null) {
				String strTransListkey = (String) session
						.getAttribute("transListKey");
				String transkeys = "";
				if (strTransListkey.indexOf("@") != -1) {
					String[] listkey = StringUtils.split(strTransListkey, "@");
					for (int i = 0; i < listkey.length; i++) {
						String transkey = listkey[i];

						if (!transkey.equals(t47_transaction
								.getTransactionkey())) {
							transkeys = transkeys + "@" + transkey;
						}
					}
					if (!transkeys.equals("")) {
						transkeys = transkeys.substring(1);
						session.setAttribute("transListKey", transkeys);
					}
				} else {
					session.removeAttribute("transListKey");
					sqlMap.commitTransaction();
					return actionMapping.findForward("failure");
				}
			}

			if (status.equals("1")) {
				if (t47_transaction.getOpp_acct_num().equals("#")) {
					t47_transaction.setOpp_acct_num(form.getOpp_acct_num());
				}
				if (t47_transaction.getOpp_card_no().equals("#")) {
					t47_transaction.setOpp_card_no(form.getOpp_card_no());
				}
				if (t47_transaction.getOpp_card_type().equals("#")) {
					t47_transaction.setOpp_card_type(form.getOpp_card_type());
				}
				if (t47_transaction.getOpp_name().equals("#")) {
					t47_transaction.setOpp_name(form.getOpp_name());
				}
				if (t47_transaction.getOpp_acct_type_cd().equals("#")) {
					t47_transaction.setOpp_acct_type_cd(form
							.getOpp_acct_type_cd());
				}
				if (t47_transaction.getOpp_pbc_party_class_cd().equals("#")) {
					t47_transaction.setOpp_pbc_party_class_cd(form
							.getOpp_pbc_party_class_cd());
				}
				
				if (opp_sys_id.equals("")) {

					T47_Opp_info t47_opp_info = new T47_Opp_info();
					t47_opp_info.setCreate_dt(DateUtils.getCurrDateTime());
					/*
					 * AuthBean authBean = (AuthBean)
					 * session.getAttribute("authBean"); Authorization auth =
					 * authBean.getAuthToken();
					 */
					t47_opp_info.setOpp_acct_num(t47_transaction
							.getOpp_acct_num());
					t47_opp_info.setOpp_card_no(t47_transaction
							.getOpp_card_no());
					t47_opp_info.setOpp_card_type(t47_transaction
							.getOpp_card_type());
					t47_opp_info.setOpp_name(t47_transaction.getOpp_name());
					t47_opp_info.setOpp_acct_type_cd(t47_transaction
							.getOpp_acct_type_cd());
					t47_opp_info.setOpp_pbc_party_class_cd(t47_transaction
							.getOpp_pbc_party_class_cd());
					// String sysid=this.getSequenceNextVal("t07_opp_info");

					t47_opp_info.setOpp_sys_id(sysid);
					t47_opp_info.setOpp_party_id(opp_party_id);
					int rows1 = t47_opp_infoDAO.insertT47_Opp_info(sqlMap,
							t47_opp_info);
				} else {
					T47_Opp_info t47_opp_info = new T47_Opp_info();
					t47_opp_info.setOpp_acct_num(t47_transaction.getAcct_num());
					t47_opp_info.setOpp_card_no(t47_transaction
							.getOpp_card_no());
					t47_opp_info.setOpp_card_type(t47_transaction
							.getOpp_card_type());
					t47_opp_info.setOpp_sys_id(t47_transaction.getOpp_sys_id());
					t47_opp_info.setOpp_name(t47_transaction.getOpp_name());
					t47_opp_info.setOpp_acct_type_cd(t47_transaction
							.getOpp_acct_type_cd());
					t47_opp_info.setOpp_pbc_party_class_cd(t47_transaction
							.getOpp_pbc_party_class_cd());
					int rows2 = t47_opp_infoDAO.modifyT47_Opp_info1(sqlMap,
							t47_opp_info);
				}
				if (t47_transaction.getOpp_organkey().equals("#")) {
					t47_transaction.setOpp_organkey(form.getOpp_organkey());
				}
				if (t47_transaction.getOpp_organ_type().equals("#")) {
					t47_transaction.setOpp_organ_type(form.getOpp_organ_type());
				}
				if (t47_transaction.getOpp_organname().equals("#")) {
					t47_transaction.setOpp_organname(form.getOpp_organname());
				}
				if (t47_transaction.getOpp_coutry().equals("#")) {
					t47_transaction.setOpp_coutry(form.getOpp_country());
				}
				if (t47_transaction.getOpp_area().equals("#")) {
					t47_transaction.setOpp_area(form.getOpp_area());
				}

				String opp_organkey = t47_transaction.getOpp_organkey();
				if (!opp_organkey.equals("")) {
					
					T47_OPP_bank t47_opp_bank1 = new T47_OPP_bank();
					t47_opp_bank1.setUnionorgkey(opp_organkey);
					t47_opp_bank1.setUnion_type(t47_transaction
							.getOpp_organ_type());
					T47_OPP_bank bank = bankdao.getT87_UnionDisp(sqlMap,
							t47_opp_bank1);
					T47_OPP_bank t47_opp_bank = new T47_OPP_bank();
					t47_opp_bank.setUnionorgkey(opp_organkey);
					t47_opp_bank.setUnion_name(t47_transaction
							.getOpp_organname());
					t47_opp_bank.setUnion_type(t47_transaction
							.getOpp_organ_type());
					t47_opp_bank.setCountry_cd(t47_transaction.getOpp_coutry());
					if (!t47_transaction.getOpp_coutry().equals(Constans.CHINA)
							&& !t47_transaction.getOpp_coutry().equals(
									Constans.CHINA_Bonded)
							&& !t47_transaction.getOpp_coutry().equals(
									Constans.CHINA_Processing)
							&& !t47_transaction.getOpp_coutry().equals(
									Constans.CHINA_Diamond)) {
						t47_transaction.setOpp_area(Constans.AREAVALUE);
					}
					t47_opp_bank.setCity_cd(t47_transaction.getOpp_area());
					if (bank == null || bank.getUnionorgkey().equals("")) {
						int rows3 = bankdao.insertT847_Union(sqlMap,
								t47_opp_bank);
					} else {
						int row4 = bankdao
								.modifyT87_Union(sqlMap, t47_opp_bank);
					}

				}

				// 1.初始化日志对象
				T00_operate_log t00_operate_log = new T00_operate_log();
				t00_operate_log.setModule_key_sub1("交易补录修改信息");// 子功能点1级
				t00_operate_log.setModule_key_sub2("");// 子功能点2级
				t00_operate_log.setOperate_obj1(t47_transaction
						.getTransactionkey());// 操作对象1级
				t00_operate_log.setOperate_obj2("");// 操作对象2级
				t00_operate_log.setOperate_type("2");// 操作类型
				// 1:添加2:修改3:删除4:查询（暂不记）
				t00_operate_log.setIs_succ("");// 操作结果 1：成功0：失败
				if (!opp_organkey.equals("")) {
					t00_operate_log
							.setOperate_desc("t47_transaction;t47_opp_info;t47_opp_bank");// 操作描述(操作的表名，用"；"分割)
				} else {
					t00_operate_log
							.setOperate_desc("t47_transaction;t47_opp_info");
				}
				// 2.写操作日志
				this.writeOperLog(auth, sqlMap, t00_operate_log);
			}

			// 提交事务
			sqlMap.commitTransaction();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}

		return actionMapping.findForward("success");
		// return null;
	}
	
	public ActionForward performGetT47_transaction_SE_List1(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";

		
		
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		
		
		String teller=request.getParameter("teller");
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			// 借贷标志
//			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//			request.setAttribute("trackflagMap", this.getOptionsListByMap(
//					trackflagMap, null, true));
			
//			LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
//			request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
//					null, true));
			
			LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
			request.setAttribute("tradesortMap", this.getOptionsListByMap(
					tradesortMap, null, true));
			
//			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
//			
//			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//			request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//					null, true));
			
//			LinkedHashMap dekyMap = cm.getMapFromCache("deky");
//			request.setAttribute("dekyMap", this.getOptionsListByMap(dekyMap, null,
//					true));
			
//			LinkedHashMap statusMap = cm.getMapFromCache("status1");
//			request.setAttribute("statusMap", this.getOptionsListByMap(statusMap,
//					null, false));
			if(form.getValidate_ind().equals("")){
				form.setValidate_ind("0");
			}
			
			
			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			if (form.getTx_dt_search_disp() != null)
				form.setTx_dt(DateUtils.stringToDateShort(form
						.getTx_dt_search_disp()));
			if (form.getTx_enddt_search_disp() != null)
				form.setTx_dtEnd(DateUtils.stringToDateShort(form
						.getTx_enddt_search_disp()));

			form.setDebit_credit(form.getDebit_credit_search_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_search_disp());

			if (form.getAmt_start_search().trim() != null
					&& !"".equals(form.getAmt_start_search().trim())) {
				form.setAmt(new Double(Double.parseDouble(form
						.getAmt_start_search())));
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));

			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search().trim() != null
					&& !"".equals(form.getAmt_end_search().trim())) {
				form.setAmt_max_value(new Double(Double.parseDouble(form
						.getAmt_end_search())));
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));

			} else {
				form.setAmt_max_value(null);
			}
			// 账户
			form.setAcct_num(form.getAcct_num_search());
			// 客户
			form.setParty_id(form.getParty_id_search());
			// 机构
			form.setOrgankey(form.getOrgankey_search());
			// 修改标志
			form.setAddtional(form.getAddtional_search());
			// 本外币标志
			form.setCurr_cd(form.getCurr_cd_search());
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String tag = StringUtils.nullObject2String(request
					.getParameter("tag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			request.getSession().setAttribute("intPage", intPage + "");
			
//			if ("".equals(newsearchflag)) {
//				session.removeAttribute("t47_transactionSearchObjb");
//			}
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				if(form.getStart_time()!=null  ){
					t47_transaction.setStarttime(DateUtils.stringToDateShort(form.getStart_time()));
					
				}
				if(form.getStart_time2()!=null ){
					t47_transaction.setStarttime2(DateUtils.stringToDateShort(form.getStart_time2()));
				}
				String validate_ind = StringUtils.null2String(request
						.getParameter("validate_ind"));
				if ("".equals(validate_ind)) {
					validate_ind = "0";
				}
				t47_transaction.setOrgankeystr(org_id);
				t47_transaction.setValidate_ind(validate_ind);
//				t47_transaction.setIntpage(String.valueOf(intPage));
				if(teller != null || !"".equals(teller)){
					t47_transaction.setTeller(teller);
				}
				t47_transaction.setIntpage("0");
				session.setAttribute("t47_transactionSearchObjb",
						t47_transaction);
			} else {//  翻页
				t47_transaction = (T47_transaction) session.getAttribute("t47_transactionSearchObjb");
//				MyBeanUtils.copyBean2Bean(form, t47_transaction);
				if(intPage!=0){
					t47_transaction.setIntpage(String.valueOf(intPage));
					session.setAttribute("t47_transactionSearchObjb",
							t47_transaction);
					}
			}
			if (tag.equals("1")) {
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObjb");
				MyBeanUtils.copyBean2Bean(form, t47_transaction);
			}
			//验证状态
			String status_str=cm.getMapFromCacheToStr("status1", "validate_ind", form.getValidate_ind(),"", false); 
			request.setAttribute("status_str", status_str);
			
			//特征类型
			String deky_str=cm.getMapFromCacheToStr("deky", "alert_type_cd", form.getAlert_type_cd(),"", true); 
			request.setAttribute("deky_str", deky_str);
			
			//现转标记
			String goflag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_search_disp", form.getCash_trans_flag_search_disp(),"", true); 
			request.setAttribute("goflag_str", goflag_str);
			
			//本外币
			String clienttype_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd_search", form.getCurr_cd_search(),"", true); 
			request.setAttribute("clienttype_str", clienttype_str);
			
			//客户类型
			String curr_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd_search", form.getParty_class_cd_search(),"", true); 
			request.setAttribute("curr_cd_str", curr_cd_str);
			int page = 0;
			if (t47_transaction != null && t47_transaction.getIntpage() != null
					&& !"".equals(t47_transaction.getIntpage())) {
				page = Integer.parseInt(t47_transaction.getIntpage());
			}
			/*edit begin helong 2014/2/19 根据t87_syspara判断是否允许二次补录*/
			if(t47_transaction != null){
				Map sysparaMap=cm.getMapFromCache("t87_syspara");
				String is_recordflag=(String)sysparaMap.get("416");
				String de_is_flow=(String)sysparaMap.get("300");
								
				if("1".equals(is_recordflag) ){//控制交易补录
					if("1".equals(de_is_flow)){//大额走流程
						t47_transaction.setIs_recordflag(is_recordflag);
					}else//只控制可疑的
					{
						t47_transaction.setIs_recordflag("2");
					}
				}
			}
			/*edit end helong 2014/2/19*/
			int totalRow = 0;
			if (newsearchflag.equals("1") ||newsearchflag.equals("2")|| tag.equals("1")) {
				t47_transaction.setHandle_status_cd("1");
				
				t47_transactionList = t47_transactionDAO
						.getT47_trade_transactionList_2b(sqlMap,
								t47_transaction, this.getStartRec(page), this
										.getIntPageSize());				

				totalRow = t47_transactionDAO
						.getT47_trade_transactionListCount_2b(sqlMap,
								t47_transaction);
			}
			String url = request.getContextPath() + "/report"
					+ actionMapping.getPath() + ".do?newsearchflag=2";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);

		request.setAttribute("t47_transactionList", t47_transactionList);

		return actionMapping.findForward("success");
	}
	public ActionForward performModifyT47_SEtransaction(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T47_transaction t47_transaction = new T47_transaction();

		String transactionkey;

		
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_agreementDAO agreementDAO =(T47_agreementDAO)context.getBean("t47_agreementDAO");
		try {
			String saveType=request.getParameter("saveType");
			if("2".equals(saveType))
			{				
				t47_transaction = (T47_transaction) session.getAttribute("t47_transactionSearchObjb");
				
				if(t47_transaction==null)
				{
					t47_transaction=new T47_transaction();
				}
				if("1".equals(t47_transaction.getValidate_ind()))
				{	
					request.setAttribute("valfalg", "1");
					return actionMapping.findForward("finash");
				}	
			}else
			{
				transactionkey = StringUtils.null2String((String) request
						.getParameter("transactionkey"));
				t47_transaction.setTransactionkey(transactionkey);
				
			}
		
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			LinkedHashMap agent_card_typeMap = cm.getMapFromCache("BITP");
			Map agent_countryMap = cm.getMapFromCache("country");
			LinkedHashMap opp_organ_typeMap = cm.getMapFromCache("cfct_hash");
			LinkedHashMap org_trans_relaMap = cm.getMapFromCache("rltp_hash");
			LinkedHashMap acct_typeMap = cm.getMapFromCache("pbc_catp");
			LinkedHashMap receive_pay_cdMap = cm.getMapFromCache("receive_pay");
			LinkedHashMap currency_cdMap = cm.getMapFromCache("currency");
			LinkedHashMap PBC_SWSZ1Map = cm.getMapFromCache("PBC_SWSZ1"); // 境内外汇收支交易
			request.setAttribute("PBC_SWSZ1Map", this.getOptionsListByMap(
					PBC_SWSZ1Map, null, true));
			// 交易国家
			Map nationalityMap = cm.getMapFromCache("country");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					nationalityMap, null, true));
	
			request.setAttribute("countryMap", this.getOptionsListByMap(
					nationalityMap, null, true));
			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			LinkedHashMap t87_pbc_cashMap = cm.getMapFromCache("t87_pbc_cash"); // 现钞标志
			request.setAttribute("t87_pbc_cashMap", this.getOptionsListByMap(
					t87_pbc_cashMap, null, true));

			request.setAttribute("agent_card_typeMap", this
					.getOptionsListByMap(agent_card_typeMap, null, true));
			request.setAttribute("legal_card_typeMap", this
					.getOptionsListByMap(card_typeMap, null, true));
			request.setAttribute("agent_countryMap", this.getOptionsListByMap(
					agent_countryMap, null, true));
			request.setAttribute("opp_organ_typeMap", this.getOptionsListByMap(
					opp_organ_typeMap, null, true));
			request.setAttribute("opp_card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			request.setAttribute("opp_acct_type_cdMap", this
					.getOptionsListByMap(acct_typeMap, null, true));
			request.setAttribute("org_trans_relaMap", this.getOptionsListByMap(
					org_trans_relaMap, null, true));
			request.setAttribute("acct_typeMap", this.getOptionsListByMap(
					acct_typeMap, null, true));
			request.setAttribute("receive_pay_cdMap", receive_pay_cdMap);
			request.setAttribute("currency_cdMap", currency_cdMap);
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;

		
			
			t47_transaction = t47_transactionDAO.getModifySET47_transaction(
					sqlMap, t47_transaction,agreementDAO);
			//如果补完了当前查询的所有交易则弹出提示框
			if("".equals(t47_transaction.getTransactionkey()))
			{				
				return actionMapping.findForward("finash");
			}			
			//String t47_transactionString = ObjectCompare.ObjectToFormatStr(t47_transaction, "#_#", "@_@");
			request.setAttribute("t47_transactionString", StringUtils.null2String(t47_transaction.getAcct_type()));

			// 将查询出来的值拼成字符串用#分开
			String saveString = "|"
					+ java.net.URLEncoder.encode(NullToString(t47_transaction.getOrg_trans_rela()))
					+ "@|"
					+ java.net.URLEncoder.encode(NullToString(t47_transaction.getAgent_name()))
					+ "@|"
					+ java.net.URLEncoder.encode(NullToString(t47_transaction.getAgent_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(NullToString(t47_transaction.getAgent_card_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(NullToString(t47_transaction.getAgent_card_no()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getAcct_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getAcct_num()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpen_dt_disp()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getClose_dt_disp()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getCurrency_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getCash_ind()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getSettle_type_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getTsctkey()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getReceive_pay_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getUse_des()))
					+ "@|"
					+ java.net.URLEncoder
							.encode(NullToString(t47_transaction
									.getTx_occur_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getTx_occur_area()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getTx_go_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getTx_go_area()))
					+ "@|"
					+ java.net.URLEncoder
							.encode(NullToString(t47_transaction
									.getOpp_acct_type_cd()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_acct_num()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_card_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_name()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_card_no()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_organname()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_organ_type()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_organkey()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_country()))
					+ "@|"
					+ java.net.URLEncoder.encode(
							NullToString(t47_transaction.getOpp_area()));

			request.setAttribute("saveString", saveString);

			LinkedHashMap t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs1"); // 交易方式
			if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& !t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("00")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs2");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& !t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("01")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs4");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("00")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs1");
			} else if (t47_transaction.getCurr_cd() != null
					&& !"".equals(t47_transaction.getCurr_cd())
					&& t47_transaction.getCurr_cd().equals("1")
					&& t47_transaction.getCash_ind().equals("01")) {
				t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs3");
	}
			if (t47_transaction.getAgent_card_type() != null
					&& !t47_transaction.getAgent_card_type().equals("")) {
				String type08 = t47_transaction.getAgent_card_type().substring(
						0, 2);
				String info08 = t47_transaction.getAgent_card_type().substring(
						2);
				t47_transaction.setAgent_card_type(type08);
				t47_transaction.setCard_inf(info08);
			}
			if (t47_transaction.getOpp_card_type() != null
					&& !t47_transaction.getOpp_card_type().equals("")) {
				String opp_type08 = t47_transaction.getOpp_card_type()
						.substring(0, 2);
				String opp_info08 = t47_transaction.getOpp_card_type()
						.substring(2);
				t47_transaction.setOpp_card_type(opp_type08);
				t47_transaction.setOpp_card_inf(opp_info08);
			}
			request.setAttribute("t87_pbc_gjfsMap", this.getOptionsListByMap(
					t87_pbc_gjfsMap, null, true));

			/*
			 * ArrayList areaList=cm.getCodeTable2ListCatch("getArea_forall",
			 * true); request.setAttribute("areaList", areaList); ArrayList
			 * tsctList=cm.getCodeTable2ListCatch("getT87_pbc_tsct_forall",
			 * true); request.setAttribute("tsctList", tsctList);
			 */
			LinkedHashMap tsctMap = cm.getMapFromCache("tsct_hash1");
			request.setAttribute("tsctMap", this.getOptionsListByMap(tsctMap,
					null, true));

			// 交易发生地默认为中国的某地区

			if (t47_transaction.getTx_occur_area() == null
					|| t47_transaction.getTx_occur_area().equals("")) {
				t47_transaction.setTx_occur_country(Constans.CHINA);
				t47_transaction.setTx_occur_area1(Constans.tx_occur_area);
			}
			request.setAttribute("occur_area", t47_transaction
					.getTx_occur_area());
			MyBeanUtils.copyBean2Bean(form, t47_transaction);
			// form.setTransactionkey(transactionkey);
			form.setTrans_key(t47_transaction.getTransactionkey());

			String areavalue = Constans.AREAVALUE;
			request.setAttribute("p_areavalue", areavalue);

			Map sysparaMap=cm.getMapFromCache("t87_syspara");
			request.setAttribute("isTestPoint", (String)sysparaMap.get("800"));
			request.setAttribute("isHasImage", (String)sysparaMap.get("415"));
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transaction", t47_transaction);

		//
		return actionMapping.findForward("success");
	}
	
	public ActionForward performModifySecondTransDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_id_depositDAO t47_id_depositDAO = (T47_id_depositDAO)context.getBean("t47_id_depositDAO");
		T47_partyDAO t47_partydao = (T47_partyDAO)context.getBean("t47_partyDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();
		authBean = (AuthBean) session.getAttribute("authBean");
		auth = authBean.getAuthToken();

		try {

			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;

			MyBeanUtils.copyBean2Bean(t47_transaction, form);
			String validateflag = t47_transaction.getValidateflag();
			if (!t47_transaction.getDt_time_disp().equals("")) {
				t47_transaction.setDt_time(DateUtils
						.stringToDateShort(t47_transaction.getDt_time_disp()));
			}
			//判断帐户是否修改，如果未修改则不更新表
			String t47_agreementString = request.getParameter("t47_transactionString");
			//T47_transaction t47_transaction_org = new T47_transaction();
			//ObjectCompare.StrToFormatObject(t47_transaction_org, t47_agreementString, "#_#", "@_@");
			boolean bool = true;
			if(!t47_agreementString.equals(t47_transaction.getAcct_type())) {
				bool = false;
			}
			if(!bool) { //不相等修改账户表
				// 帐户
				//System.out.println("=================="
						//+ t47_transaction.getParty_class_cd());
				int row=0;
				
				T47_id_deposit t47_id_deposit = new T47_id_deposit();
				t47_id_deposit.setAcct_num(t47_transaction.getAcct_num());
				t47_id_deposit.setAml_acct_type_cd(t47_transaction
						.getAcct_type());
				
				 row = t47_id_depositDAO.modifyT47_acct_uc(sqlMap, t47_id_deposit);
				 if(row<=0){
					 t47_transactionDAO.insertT47_acct_uc1(sqlMap, t47_transaction);
				 }
			}
			//end判断
			
			//判断客户是否存在
//			
//			T47_party t47_party = t47_partydao.getT47_partyById(sqlMap, t47_transaction.getParty_id());
//			if(t47_party==null || t47_party.getParty_id()==null || t47_party.getParty_id().equals("")) {
//				
//				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
//				        "error.pagertitle.common", t47_party.getParty_id()+"更新失败！"));
//				saveMessages(request, errors);
//				
//				return actionMapping.findForward("failure");
//			}
			//end判断客户是否存在
			
			if (t47_transaction.getAgent_card_type().equals("19")
					|| t47_transaction.getAgent_card_type().equals("29")) {
				t47_transaction.setAgent_card_type(t47_transaction
						.getAgent_card_type()
						+ t47_transaction.getCard_inf());
			}
			if (t47_transaction.getOpp_card_type().equals("19")
					|| t47_transaction.getOpp_card_type().equals("29")) {
				t47_transaction.setOpp_card_type(t47_transaction
						.getOpp_card_type()
						+ t47_transaction.getOpp_card_inf());
			}
			
			

			if (validateflag.equals("2") || validateflag.equals("3")) {
				if (!t47_transaction.getOpp_country().equals("")) {
					if (!t47_transaction.getOpp_country()
							.equals(Constans.CHINA)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Bonded)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Processing)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Diamond)) {
						t47_transaction.setOpp_area(Constans.AREAVALUE);
					} else {
						if (t47_transaction.getOpp_area().equals("")) {
							if (!t47_transaction.getOpp_area2().equals("")) {
								t47_transaction.setOpp_area(t47_transaction
										.getOpp_area2());
							} else {
								if (!t47_transaction.getOpp_area1().equals("")) {
									t47_transaction.setOpp_area(t47_transaction
											.getOpp_area1());
								}
							}

						}
					}
				}
			}
			if (validateflag.equals("1") || validateflag.equals("3")) {
				if (!t47_transaction.getTx_go_country().equals("")) {
					if (!t47_transaction.getTx_go_country().equals(
							Constans.CHINA)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Bonded)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Processing)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Diamond)) {
						t47_transaction.setTx_go_area(Constans.AREAVALUE);
					} else {
						if (t47_transaction.getTx_go_area().equals("")) {
							if (!t47_transaction.getTx_go_area2().equals("")) {
								t47_transaction.setTx_go_area(t47_transaction
										.getTx_go_area2());
							} else {
								if (!t47_transaction.getTx_go_area1()
										.equals("")) {
									t47_transaction
											.setTx_go_area(t47_transaction
													.getTx_go_area1());
								}
							}

						}
					}
				}
			}
			if (!t47_transaction.getTx_occur_country().equals("")) {
				if (!t47_transaction.getTx_occur_country().equals(
						Constans.CHINA)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Bonded)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Processing)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Diamond)) {
					t47_transaction.setTx_occur_area(Constans.AREAVALUE);
				} else {
					if (t47_transaction.getTx_occur_area().equals("")) {
						if (!t47_transaction.getTx_occur_area2().equals("")) {
							t47_transaction.setTx_occur_area(t47_transaction
									.getTx_occur_area2());
						} else {
							if (!t47_transaction.getTx_occur_area1().equals("")) {
								t47_transaction
										.setTx_occur_area(t47_transaction
												.getTx_occur_area1());
							}
						}

					}
				}
			}
			
			//add by qiuyun 2013-3-22 启用试点程序时，交易方式为20（网上支付）时，涉外交易代码填写IP地址
			Map sysparaMap=cm.getMapFromCache("t87_syspara");
			String isTestPoint=(String)sysparaMap.get("800");
			if("1".equals(isTestPoint))
			{
				if("20".equals(t47_transaction.getSettle_type_cd()))
				{
					t47_transaction.setTsctkey(request.getParameter("ipaddr"));
				}
			}			
			//end  by qiuyun 
			
			// 保存 修改
			String validate_ind = t47_transaction.getValidate_ind();
			String validate_ind2 = t47_transaction.getValidate_ind2();

			String saveString = (String) request.getParameter("saveString");

			String[] saveStrs = saveString.split("@");
			if (saveStrs.length > 0) {
				if ((StringUtils.null2String(t47_transaction
						.getOrg_trans_rela())).equals(java.net.URLDecoder
						.decode(saveStrs[0].substring(1)))) {
					t47_transaction.setOrg_trans_rela("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_name())
						.equals(
								java.net.URLDecoder.decode(saveStrs[1]
										.substring(1)))) {
					t47_transaction.setAgent_name("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_country())
						.equals(
								java.net.URLDecoder.decode(saveStrs[2]
										.substring(1)))) {
					t47_transaction.setAgent_country("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getAgent_card_type()).equals(
						java.net.URLDecoder.decode(saveStrs[3].substring(1)))) {
					t47_transaction.setAgent_card_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getAgent_card_no())
						.equals(
								java.net.URLDecoder.decode(saveStrs[4]
										.substring(1)))) {
					t47_transaction.setAgent_card_no("#");
				}
				if (StringUtils.null2String(t47_transaction.getAcct_type())
						.equals(
								java.net.URLDecoder.decode(saveStrs[5]
										.substring(1)))) {
					t47_transaction.setAcct_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getAcct_num())
						.equals(
								java.net.URLDecoder.decode(saveStrs[6]
										.substring(1)))) {
					t47_transaction.setAcct_num("#");
				}
				/*
				 * if(StringUtils.null2String(t47_transaction.getOpen_dt_disp()).equals(java.net.URLDecoder.decode(saveStrs[7].substring(1)))){
				 * t47_transaction.setOpen_dt_disp(""); }
				 * if(StringUtils.null2String(t47_transaction.getClose_dt_disp()).equals(java.net.URLDecoder.decode(saveStrs[8].substring(1)))){
				 * t47_transaction.setClose_dt_disp(""); }
				 */
				/*
				 * if(StringUtils.null2String(t47_transaction.getCurrency_cd()).equals(java.net.URLDecoder.decode(saveStrs[9].substring(1)))){
				 * t47_transaction.setCurrency_cd(""); }
				 * if(StringUtils.null2String(t47_transaction.getCash_ind()).equals(java.net.URLDecoder.decode(saveStrs[10].substring(1)))){
				 * t47_transaction.setCash_ind(""); }
				 */
				if (StringUtils
						.null2String(t47_transaction.getSettle_type_cd())
						.equals(
								java.net.URLDecoder.decode(saveStrs[11]
										.substring(1)))) {
					t47_transaction.setSettle_type_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getTsctkey())
						.equals(
								java.net.URLDecoder.decode(saveStrs[12]
										.substring(1)))) {
					t47_transaction.setTsctkey("#");
				}
				/*
				 * if(StringUtils.null2String(t47_transaction.getReceive_pay_cd()).equals(java.net.URLDecoder.decode(saveStrs[13].substring(1)))){
				 * t47_transaction.setReceive_pay_cd(""); }
				 */
				if (StringUtils.null2String(t47_transaction.getUse_des())
						.equals(
								java.net.URLDecoder.decode(saveStrs[14]
										.substring(1)))) {
					t47_transaction.setUse_des("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getTx_occur_country()).equals(
						java.net.URLDecoder.decode(saveStrs[15].substring(1)))) {
					t47_transaction.setTx_occur_country("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_occur_area())
						.equals(
								java.net.URLDecoder.decode(saveStrs[16]
										.substring(1)))) {
					t47_transaction.setTx_occur_area("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_go_country())
						.equals(
								java.net.URLDecoder.decode(saveStrs[17]
										.substring(1)))) {
					t47_transaction.setTx_go_country("#");
				}
				if (StringUtils.null2String(t47_transaction.getTx_go_area())
						.equals(
								java.net.URLDecoder.decode(saveStrs[18]
										.substring(1)))) {
					t47_transaction.setTx_go_area("#");
				}
				if (StringUtils.null2String(
						t47_transaction.getOpp_acct_type_cd()).equals(
						java.net.URLDecoder.decode(saveStrs[19].substring(1)))) {
					t47_transaction.setOpp_acct_type_cd("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_acct_num())
						.equals(
								java.net.URLDecoder.decode(saveStrs[20]
										.substring(1)))) {
					t47_transaction.setOpp_acct_num("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_card_type())
						.equals(
								java.net.URLDecoder.decode(saveStrs[21]
										.substring(1)))) {
					t47_transaction.setOpp_card_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_name())
						.equals(
								java.net.URLDecoder.decode(saveStrs[22]
										.substring(1)))) {
					t47_transaction.setOpp_name("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_card_no())
						.equals(
								java.net.URLDecoder.decode(saveStrs[23]
										.substring(1)))) {
					t47_transaction.setOpp_card_no("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_organname())
						.equals(
								java.net.URLDecoder.decode(saveStrs[24]
										.substring(1)))) {
					t47_transaction.setOpp_organname("#");
				}
				if (StringUtils
						.null2String(t47_transaction.getOpp_organ_type())
						.equals(
								java.net.URLDecoder.decode(saveStrs[25]
										.substring(1)))) {
					t47_transaction.setOpp_organ_type("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_organkey())
						.equals(
								java.net.URLDecoder.decode(saveStrs[26]
										.substring(1)))) {
					t47_transaction.setOpp_organkey("#");
				}
				if (StringUtils.null2String(t47_transaction.getOpp_country())
						.equals(
								java.net.URLDecoder.decode(saveStrs[27]
										.substring(1)))) {
					t47_transaction.setOpp_country("#");
				}

				if (StringUtils.null2String(t47_transaction.getOpp_area())
						.equals(
								java.net.URLDecoder.decode(saveStrs[28]
										.substring(1)))) {
					t47_transaction.setOpp_area("#");
				}
			}

			t47_transactionDAO.modifyT47_transactionDo(sqlMap, t47_transaction);

			// 1.初始化日志对象
			/*T00_operate_log t00_operate_log = new T00_operate_log();
			t00_operate_log.setModule_key_sub1("第二次补录交易信息");// 子功能点1级
			t00_operate_log.setModule_key_sub2("");// 子功能点2级
			t00_operate_log
					.setOperate_obj1(t47_transaction.getTransactionkey());// 操作对象1级
			t00_operate_log.setOperate_type("2");// 操作类型
			// 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("");// 操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc("t47_transaction_uc");// 操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);*/
			//写操作日志
			//modify by zhanjin 2013-08-08 begin
			if("1".equals(sysparaMap.get("408"))){
				this.writeT47_trans_recordLog(t47_transaction,request);
			}
			//modify by zhanjin 2013-08-08 end
		} catch (Exception e) {

			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
		

	}
	private void writeT47_trans_recordLog(T47_transaction t47_transaction,
			HttpServletRequest request)throws Exception{
		Authorization auth = this.getAuthorization(request);
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_trans_recordLog t47_trans_recordLog = new T47_trans_recordLog();
		String currentTime=DateUtils.dateToStringShort(DateUtils.getCurrDateTime());
		String userName=auth.getT00_user().getUsername();
		
		t47_trans_recordLog.setTransactionkey(t47_transaction.getTransactionkey());
		t47_trans_recordLog.setTx_no(t47_transaction.getTx_no());
		t47_trans_recordLog.setTx_dt(t47_transaction.getDt_time());
		t47_trans_recordLog.setAcct_num(t47_transaction.getAcct_num());
		t47_trans_recordLog.setParty_id(t47_transaction.getParty_id());
		t47_trans_recordLog.setOper_des("二次交易补录信息");
		t47_trans_recordLog.setOper_obj_type("2");
		t47_trans_recordLog.setCreate_dt(currentTime);
		t47_trans_recordLog.setCreate_usr(userName);
		int i = t47_transactionDAO.insertT47_trans_recordLog(sqlMap, t47_trans_recordLog);
		if(i < 0) {
   	 		throw new Exception("写入二次交易补录日志出错!");
   	 	}
	}
	public ActionForward performGetnewT47_transactionList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";
		
		
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap tradesortMap = cm.getMapFromCache("tradesort");
		LinkedHashMap cal_indMap = cm.getMapFromCache("yesNo");

		request.setAttribute("cal_indMap", this.getOptionsListByMap(cal_indMap,
				null, true));
		request.setAttribute("goflagMap", this.getOptionsListByMap(goflagMap,
				null, true));
		
		request.setAttribute("tradesortMap", this.getOptionsListByMap(
				tradesortMap, null, true));
		
		
		 
		
		int totalRow = 0;
		
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
//			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("clienttypeMap", this.getOptionsListByMap(
//					clienttypeMap, null, true));
			
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
//			String newenterflag = StringUtils.nullObject2String(request
//					.getParameter("newenterflag"));
//			int intPage = StringUtils.nullObject2int(request
//					.getParameter("intPage"), 0);
			int intPage = PageUtils.intPage(request, newsearchflag);
			//左侧菜单进入
			if("0".equals(newsearchflag)){
				return actionMapping.findForward("success");
			}
			
			//当第一次进入页面时，不进行查询，直接进入 add by lixx 2009.8.6
			DateUtils du = new DateUtils();
			if(newsearchflag.equals("2")){
				session.removeAttribute("t47_transactionSearchObj11");
//				return actionMapping.findForward("success");
			}
			
			if ("1".equals(newsearchflag)) {// 新的查询
				if (form.getTx_dt_disp() != null
						&& !"".equals(form.getTx_dt_disp())) {
					form
							.setTx_dt(DateUtils.stringToDateShort(form
									.getTx_dt_disp()));
				}
				if (form.getTx_enddt_disp() != null
						&& !"".equals(form.getTx_enddt_disp())) {
					form.setTx_dtEnd(DateUtils.stringToDateShort(form
							.getTx_enddt_disp()));
				}
				form.setDebit_credit(form.getDebit_credit_disp());
				form.setCash_trans_flag(form.getCash_trans_flag_disp());
				if (form.getAmt_start_search()!= null
						&& !"".equals(form.getAmt_start_search().trim())) {
					form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
				} else {
					form.setAmt(null);
				}
				if (form.getAmt_end_search() != null
						&& !"".equals(form.getAmt_end_search().trim())) {
					form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
				} else {
					form.setAmt_max_value(null);
				}
				MyBeanUtils.copyBean2Bean(t47_transaction, form);
				t47_transaction.setOrgankeystr(org_id);
				intPage = 0;
				session.setAttribute("t47_transactionSearchObj11",
						t47_transaction);
			} else {// 翻页
				t47_transaction = (T47_transaction) session
						.getAttribute("t47_transactionSearchObj11");
			}
			if (!newsearchflag.equals("2")) {
				if (t47_transaction == null)
					t47_transaction = new T47_transaction();
				t47_transactionList = t47_transactionDAO
						.getT47_transaction_newList(sqlMap, t47_transaction,
								this.getStartRec(intPage), this
										.getIntPageSize());
				totalRow = t47_transactionDAO.getT47_transaction_newListCount(
						sqlMap, t47_transaction);
				String url = request.getContextPath() + "/report"
				+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				
				MyBeanUtils.copyBean2Bean(form, t47_transaction);
			}
			
			 //客户类型
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_str", party_class_str);
			
			
			// 借贷标志
//			LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
//			request.setAttribute("trackflagMap", this.getOptionsListByMap(
//					trackflagMap, null, true));
			String debit_credit_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_str", debit_credit_str);
			
			//本外币标志
//			LinkedHashMap currencytypeMap = cm.getMapFromCache("curr_cd"); 
//			request.setAttribute("currencytypeMap", this.getOptionsListByMap(
//					currencytypeMap, null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		String searchtype = request.getParameter("searchtype");
		request.setAttribute("searchtype", searchtype);
		request.setAttribute("intPage", new Integer(intPage));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t47_transactionList", t47_transactionList);

		//
		return actionMapping.findForward("success");
	}
	public ActionForward performCase_new_trans_add(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_transaction t47_transaction = new T47_transaction();
		
		try {
			LinkedHashMap party_typeMap = cm.getMapFromCache("clienttype"); // 对私对公客户类型
			request.setAttribute("party_typeMap", this.getOptionsListByMap(
					party_typeMap, null, true));
			
			LinkedHashMap debit_creditMap = cm.getMapFromCache("trackflag"); // 借贷类型
			request.setAttribute("debit_creditMap", this.getOptionsListByMap(
					debit_creditMap, null, false));
			
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			LinkedHashMap agent_card_typeMap = cm.getMapFromCache("BITP");
			LinkedHashMap opp_organ_typeMap = cm.getMapFromCache("cfct_hash");
			LinkedHashMap opp_acct_type_cdMap = cm.getMapFromCache("pbc_catp");
			LinkedHashMap org_trans_relaMap = cm.getMapFromCache("rltp_hash");
			LinkedHashMap acct_typeMap = cm.getMapFromCache("pbc_catp");
			LinkedHashMap receive_pay_cdMap = cm.getMapFromCache("receive_pay");
			LinkedHashMap currency_cdMap = cm.getMapFromCache("currency");
			LinkedHashMap PBC_SWSZ1Map = cm.getMapFromCache("PBC_SWSZ1"); // 境内外汇收支交易
			request.setAttribute("PBC_SWSZ1Map", this.getOptionsListByMap(
					PBC_SWSZ1Map, null, true));
			// 交易国家
			
			LinkedHashMap countryMap = cm.getMapFromCache("country");
			request.setAttribute("nationalityMap", this.getOptionsListByMap(
					countryMap, null, true));
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			LinkedHashMap t87_pbc_cashMap = cm.getMapFromCache("t87_pbc_cash"); // 现钞标志
			request.setAttribute("t87_pbc_cashMap", this.getOptionsListByMap(
					t87_pbc_cashMap, null, false));

			request.setAttribute("agent_card_typeMap", this
					.getOptionsListByMap(agent_card_typeMap, null, true));
			request.setAttribute("legal_card_typeMap", this
					.getOptionsListByMap(card_typeMap, null, true));
			request.setAttribute("agent_countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			request.setAttribute("opp_organ_typeMap", this.getOptionsListByMap(
					opp_organ_typeMap, null, true));
			request.setAttribute("opp_card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			request.setAttribute("opp_acct_type_cdMap", this
					.getOptionsListByMap(opp_acct_type_cdMap, null, true));
			request.setAttribute("org_trans_relaMap", this.getOptionsListByMap(
					org_trans_relaMap, null, true));
			request.setAttribute("acct_typeMap", this.getOptionsListByMap(
					acct_typeMap, null, true));
			request.setAttribute("receive_pay_cdMap", receive_pay_cdMap);
			request.setAttribute("currency_cdMap", currency_cdMap);
			LinkedHashMap tx_cdMap = cm.getMapFromCache("aml_tx_cd"); // 交易代码
			request.setAttribute("tx_cdMap", this.getOptionsListByMap(tx_cdMap,
					null, true));
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
            
			
			// 交易方式
			
			LinkedHashMap 	t87_pbc_gjfs2Map = cm.getMapFromCache("t87_pbc_gjfs2");
					
			LinkedHashMap 	t87_pbc_gjfs4Map = cm.getMapFromCache("t87_pbc_gjfs4");
			
			LinkedHashMap 	t87_pbc_gjfs1Map = cm.getMapFromCache("t87_pbc_gjfs1");
				
			LinkedHashMap 	t87_pbc_gjfs3Map = cm.getMapFromCache("t87_pbc_gjfs3");
			
			request.setAttribute("t87_pbc_gjfs1Map", this.getOptionsListByMap(
					t87_pbc_gjfs1Map, null, true));
			request.setAttribute("t87_pbc_gjfs2Map", this.getOptionsListByMap(
					t87_pbc_gjfs2Map, null, true));
			request.setAttribute("t87_pbc_gjfs3Map", this.getOptionsListByMap(
					t87_pbc_gjfs3Map, null, true));
			request.setAttribute("t87_pbc_gjfs4Map", this.getOptionsListByMap(
					t87_pbc_gjfs4Map, null, true));

		
			LinkedHashMap tsctMap = cm.getMapFromCache("tsct_hash1");
			request.setAttribute("tsctMap", this.getOptionsListByMap(tsctMap,
					null, true));

			// 交易发生地默认为中国的某地区
			MyBeanUtils.copyBean2Bean(t47_transaction,form );
			if (t47_transaction.getTx_occur_area() == null
					|| t47_transaction.getTx_occur_area().equals("")) {
				t47_transaction.setTx_occur_country(Constans.CHINA);
				t47_transaction.setTx_occur_area1(Constans.tx_occur_area);
			}
			request.setAttribute("occur_area", t47_transaction
					.getTx_occur_area());
			//案例类型    1大额   2可疑
			String caseType= request.getParameter("caseType");
			if ("1".equals(caseType))
			{
				t47_transaction.setValidateflag("1");
				t47_transaction.setTx_go_country("CHN");
			}else if("2".equals(caseType))
			{
				t47_transaction.setValidateflag("2");
				
			}else  if("3".equals(caseType)){
				
				t47_transaction.setValidateflag("3");
			}
			//默认币种为人民币
			t47_transaction.setCurrency_cd("CNY");
			t47_transaction.setParty_chn_name(java.net.URLDecoder.decode(form.getParty_chn_name(),"utf-8"));
			t47_transaction.setParty_id(form.getHost_cust_id());
			t47_transaction.setParty_class_cd(form.getParty_class_cd());
			t47_transaction.setOrgan_name(java.net.URLDecoder.decode(form.getOrgan_name(),"utf-8"));
			t47_transaction.setOrgan_code(t47_transaction.getOrgankey());
			t47_transaction.setOrgankey_new(t47_transaction.getOrgankey());
			t47_transaction.setOrganname(java.net.URLDecoder.decode(form.getOrgan_name(),"utf-8"));
			MyBeanUtils.copyBean2Bean(form, t47_transaction);
		
			LinkedHashMap t87_union_organMap=cm.getMapFromCache("t87_union_organ");
			if(t87_union_organMap.containsKey(form.getOrgan_code())){
				form.setOrgan_area((String)t87_union_organMap.get(form.getOrgan_code()));
				
				LinkedHashMap pbcareaMap=cm.getMapFromCache("pbcarea");
				if(pbcareaMap.containsKey(form.getOrgan_area())){
					form.setOrgan_area_disp((String)pbcareaMap.get(form.getOrgan_area()));
				}
				
			}
			form.setOrgan_code_type("00");
			if(form.getDebit_credit().equals("")){
				form.setDebit_credit("C");
			}
			String areavalue = Constans.AREAVALUE;
			request.setAttribute("p_areavalue", areavalue);
			Map sysparaMap=cm.getMapFromCache("t87_syspara");
			request.setAttribute("isTestPoint", (String)sysparaMap.get("800"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transaction", t47_transaction);
	
		return actionMapping.findForward("success");
	}
	public ActionForward performCase_new_trans_add_do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		
		try {
			
			LinkedHashMap exchange_rateMap = cm.getMapFromCache("exchange_rate"); // 汇率
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			
			MyBeanUtils.copyBean2Bean(t47_transaction, form);
			
			String validateflag = t47_transaction.getValidateflag();
			//交易日期和交易时间
			if (!t47_transaction.getDt_time_disp().equals("")) {
				t47_transaction.setDt_time(DateUtils
						.stringToDateShort(t47_transaction.getDt_time_disp()));
				t47_transaction.setTx_dt(DateUtils
						.stringToDateShort(t47_transaction.getDt_time_disp()));
			}
			//本外币
			if("CNY".equals(t47_transaction.getCurrency_cd()))
			{
				t47_transaction.setCurr_cd("1");
			}else
			{
				t47_transaction.setCurr_cd("2");
			}
			//交易金额
			if(!"".equals(t47_transaction.getAmt_disp()))
			{
				double amt=Double.parseDouble(t47_transaction.getAmt_disp());
				Double temp_amt=new Double(amt);
				t47_transaction.setAmt(temp_amt);
				
			}
			
			//原币折美元、RMB
			if (t47_transaction.getCurr_cd().equals("2")) {// 外币
				if (t47_transaction.getTsctkey() == null
						|| t47_transaction.getTsctkey().equals("")) {
					t47_transaction.setTsctkey("000000");
				}
				if(exchange_rateMap.containsKey(t47_transaction.getCurrency_cd())){
				double rate=Double.parseDouble(String.valueOf(exchange_rateMap.get(t47_transaction.getCurrency_cd())));
				double res=Double.parseDouble(String.valueOf(t47_transaction.getAmt()))*rate/Constans.CURRENCY_UNIT;
				Double d = new Double(res); 
				t47_transaction.setUsd_amt(d);
				double usd_rate=Double.parseDouble(String.valueOf(exchange_rateMap.get("CNY")));
				t47_transaction.setCny_amt(Double.valueOf(String.valueOf(t47_transaction.getUsd_amt().doubleValue()*Constans.CURRENCY_UNIT/usd_rate)));
				}
				if("00".equals(t47_transaction.getCash_ind())){//现钞
					//外现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd2());
				}else{
					//外非现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd4());
				}
				
			}else {
				String usd_rate_str=StringUtils.nullObject2String(exchange_rateMap.get("CNY"));
				if(usd_rate_str.equals(""))
				{
					usd_rate_str="0";
				}
				double usd_rate=Double.parseDouble(String.valueOf(usd_rate_str));
				t47_transaction.setCny_amt(t47_transaction.getAmt());
				t47_transaction.setUsd_amt(Double.valueOf(String.valueOf(t47_transaction.getCny_amt().doubleValue()/Constans.CURRENCY_UNIT*usd_rate)));
				
				if("00".equals(t47_transaction.getCash_ind())){//现钞
					//本现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd1());
				}else{
					//本非现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd3());
				}
			}
			
			//现转标志
			if (t47_transaction.getCash_ind().equals("00"))
			{
				t47_transaction.setCash_trans_flag("1");
			}else{
				t47_transaction.setCash_trans_flag("2");
			}
				
			//是否跨境交易
			if(!"".equals(t47_transaction.getTx_go_country())&&!"CHN".equals(t47_transaction.getTx_go_country())
			  ||!"".equals(t47_transaction.getTx_occur_country())&& !"CHN".equals(t47_transaction.getTx_occur_country()))
			{
				t47_transaction.setOverarea_ind("1");
			}else
			{
				t47_transaction.setOverarea_ind("0");
			}
			
			//是否需补录
			t47_transaction.setRe_ind("0");
			//是否计算
			t47_transaction.setCal_ind("1");
			//处理状态 处理中
			t47_transaction.setHandle_status_cd("1");
			//原客户号
			t47_transaction.setHost_cust_id(t47_transaction.getParty_id());
			//机构名称
			t47_transaction.setOrgankey(t47_transaction.getOrgankey_new());
			t47_transaction.setOrganname(t47_transaction.getOrgan_name());
			t47_transaction.setOrganName(t47_transaction.getOrganname());		
			
			if (t47_transaction.getAgent_card_type().equals("19")
					|| t47_transaction.getAgent_card_type().equals("29")) {
				t47_transaction.setAgent_card_type(t47_transaction
						.getAgent_card_type()
						+ t47_transaction.getCard_inf());
			}
			if (t47_transaction.getOpp_card_type().equals("19")
					|| t47_transaction.getOpp_card_type().equals("29")) {
				t47_transaction.setOpp_card_type(t47_transaction
						.getOpp_card_type()
						+ t47_transaction.getOpp_card_inf());
			}
			//add by qiuyun 2013-3-22 启用试点程序时，交易方式为20（网上支付）时，涉外交易代码填写IP地址
			Map sysparaMap=cm.getMapFromCache("t87_syspara");
			String isTestPoint=(String)sysparaMap.get("800");
			if("1".equals(isTestPoint))
			{
				if("20".equals(t47_transaction.getSettle_type_cd()))
				{
					t47_transaction.setTsctkey(request.getParameter("ipaddr"));
				}
			}			
			//end  by qiuyun 

			if (validateflag.equals("2") || validateflag.equals("3")) {
				if (!t47_transaction.getOpp_country().equals("")) {
					if (!t47_transaction.getOpp_country()
							.equals(Constans.CHINA)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Bonded)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Processing)
							&& !t47_transaction.getOpp_country().equals(
									Constans.CHINA_Diamond)) {
						t47_transaction.setOpp_area(Constans.AREAVALUE);
					} else {
						if (t47_transaction.getOpp_area().equals("")) {
							if (!t47_transaction.getOpp_area2().equals("")) {
								t47_transaction.setOpp_area(t47_transaction
										.getOpp_area2());
							} else {
								if (!t47_transaction.getOpp_area1().equals("")) {
									t47_transaction.setOpp_area(t47_transaction
											.getOpp_area1());
								}
							}

						}
					}
				}
			}
			if (validateflag.equals("1") || validateflag.equals("3")) {
				if (!t47_transaction.getTx_go_country().equals("")) {
					if (!t47_transaction.getTx_go_country().equals(
							Constans.CHINA)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Bonded)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Processing)
							&& !t47_transaction.getTx_go_country().equals(
									Constans.CHINA_Diamond)) {
						t47_transaction.setTx_go_area(Constans.AREAVALUE);
					} else {
						if (t47_transaction.getTx_go_area().equals("")) {
							if (!t47_transaction.getTx_go_area2().equals("")) {
								t47_transaction.setTx_go_area(t47_transaction
										.getTx_go_area2());
							} else {
								if (!t47_transaction.getTx_go_area1()
										.equals("")) {
									t47_transaction
											.setTx_go_area(t47_transaction
													.getTx_go_area1());
								}
							}

						}
					}
				}
			}
			if (!t47_transaction.getTx_occur_country().equals("")) {
				if (!t47_transaction.getTx_occur_country().equals(
						Constans.CHINA)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Bonded)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Processing)
						&& !t47_transaction.getTx_occur_country().equals(
								Constans.CHINA_Diamond)) {
					t47_transaction.setTx_occur_area(Constans.AREAVALUE);
				} else {
					if (t47_transaction.getTx_occur_area().equals("")) {
						if (!t47_transaction.getTx_occur_area2().equals("")) {
							t47_transaction.setTx_occur_area(t47_transaction
									.getTx_occur_area2());
						} else {
							if (!t47_transaction.getTx_occur_area1().equals("")) {
								t47_transaction
										.setTx_occur_area(t47_transaction
												.getTx_occur_area1());
							}
						}

					}
				}
			}
			
			t47_transaction.setTransactionkey("MT"
					+ this.getSequenceNextVal("t47_transactionkey_mt"));
			
			//设置验证标志
			if("1".equals(validateflag))
			{
				t47_transaction.setValidate_ind("1");
			}else if("2".equals(validateflag))
			{
				t47_transaction.setValidate_ind2("1");
			}else if("3".equals(validateflag))
			{
				t47_transaction.setValidate_ind("1");
				t47_transaction.setValidate_ind2("1");
			}
			
			//为了与添加交易的查询结果页面显示统一，需要转换显示的字段
			//把货币转换成标准格式
			MoneyUtils mUtils = new MoneyUtils();

			if (t47_transaction.getAmt() != null) {
				String amt_money = mUtils.FormatMoney(t47_transaction.getAmt()
						.doubleValue());
				t47_transaction.setAmt_disp(amt_money);
			}

			if (t47_transaction.getCny_amt() != null) {
				String cnyamt_money = mUtils.FormatMoney(t47_transaction
						.getCny_amt().doubleValue());
				t47_transaction.setCny_amtDisp(cnyamt_money);
			}
			
			t47_transaction.setTx_dt_disp(t47_transaction.getDt_time_disp());
			
			LinkedHashMap currency_cdMap=cm.getMapFromCache("currency");
			t47_transaction.setCurrency_cd_disp((String)currency_cdMap.get(t47_transaction.getCurrency_cd()));
			
			LinkedHashMap debit_creditMap = cm.getMapFromCache("trackflag"); // 
			t47_transaction.setDebit_credit_disp((String)debit_creditMap.get(t47_transaction.getDebit_credit()));
			//END
			t47_transaction.setTxt("04");
			//新增交易的新增跳转过来的
			if("3".equals(validateflag))
			{  t47_transaction.setOpp_isparty(form.getIs_party());
			   t47_transaction.setRe_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
				T47_transactionDAO t47_transactionDao=new T47_transactionDAO();
				int row=t47_transactionDao.insertT47_transaction_all_field(sqlMap, t47_transaction);
				
			}else//新增案例的新增按钮添砖过来
			{
				Map transMap=(Map) session.getAttribute("case_transMap");
				
				if(transMap==null)
				{
					transMap=new HashMap();
				}
				
				transMap.put(t47_transaction.getTransactionkey(), t47_transaction);				
				session.setAttribute("case_transMap", transMap);
		
			}
			//t47_transactionDAO.modifyT47_transactionDo(sqlMap, t47_transaction);
			
			AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			
			// 1.初始化日志对象
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub1("添加交易信息");//子功能点1级
			t00_operate_log.setModule_key_sub2("");//子功能点2级
			t00_operate_log.setOperate_obj1(t47_transaction.getTransactionkey());//操作对象1级
			t00_operate_log.setOperate_obj2("");//操作对象2级
			t00_operate_log.setOperate_type("1");//操作类型 1:添加2:修改3:删除4:查询（暂不记）
			t00_operate_log.setIs_succ("1");//操作结果 1：成功0：失败
			t00_operate_log.setOperate_desc("t47_transaction");//操作描述(操作的表名，用"；"分割)
			// 2.写操作日志
			this.writeOperLog(auth, sqlMap, t00_operate_log);
		
		} catch (Exception e) {

			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		return actionMapping.findForward("success");

	}
	/**
	 * 新增交易删除
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performCase_new_trans_delete_do(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();

		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String trankey = (String)request.getParameter("transactionkey");
			t47_transaction.setTransactionkey(trankey);
			t47_transaction = t47_transactionDAO.getT47_transactionDisp(sqlMap,trankey,"T47_TRANSACTION");
			String re_dt_disp=DateUtils.dateToStringShort((t47_transaction.getRe_dt()));
			String currdate=DateUtils.getCurrTime();
			if(re_dt_disp.equals(currdate.substring(0, 10))){
				String hour=DateUtils.getHour(DateUtils.getCurrDateTime());
				if(Integer.parseInt(hour)>17){
					errors.add(errors.GLOBAL_ERROR, new ActionError(
							"error.pagertitle.common", "该交易超过时间不可进行删除！"));
					saveErrors(request, errors);
				
				}else{
				t47_transactionDAO.deleteT47_transaction(sqlMap,trankey);
				}
			}else{
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.pagertitle.common", "该交易超过时间不可进行删除！"));
				saveErrors(request, errors);
				
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
	 * 调查管理组-交易 导出excel
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT47_transactionExcelList2(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();

		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			request.setAttribute("bus_type_cd", form.getBus_type_cd());

			form.setTx_dt(DateUtils.stringToDateShort(form.getTx_dt_disp()));
			form.setTx_dtEnd(DateUtils.stringToDateShort(form
					.getTx_enddt_disp()));
			form.setDebit_credit(form.getDebit_credit_disp());
			form.setCash_trans_flag(form.getCash_trans_flag_disp());
			if (form.getAmt_start_search() != null
					&& !"".equals(form.getAmt_start_search())) {
				form.setAmt_start(Double.valueOf(form.getAmt_start_search()));
			} else {
				form.setAmt(null);
			}
			if (form.getAmt_end_search() != null
					&& !"".equals(form.getAmt_end_search())) {
				form.setAmt_end(Double.valueOf(form.getAmt_end_search()));
			} else {
				form.setAmt_max_value(null);
			}
			// 组织用户所属的机构ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();

			if ("".equals(form.getOrder())) {
				form.setOrder("2");

			}
			//
			MyBeanUtils.copyBean2Bean(t47_transaction, form);
			t47_transaction.setOrgankeystr(org_id);
			if (form.getBus_type_cd().equals("1")) {// 限额
				t47_transaction.setBus_type_cd("1%");
			} else if (form.getBus_type_cd().equals("2")) {// 定额
				t47_transaction.setBus_type_cd("_1%");
			} else if (form.getBus_type_cd().equals("3")) {// 大额
				t47_transaction.setBus_type_cd("__1%");
			} else if (form.getBus_type_cd().equals("4")) {// 信用卡
				t47_transaction.setBus_type_cd("___1%");
			} else if (form.getBus_type_cd().equals("5")) {// 网银
				t47_transaction.setBus_type_cd("____1%");
			}

			t47_transactionList = t47_transactionDAO.getT47_trade_transactionExcelList(sqlMap, t47_transaction);
			if(t47_transactionList.size() > 5000){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","一次导出交易不得超过5000条！"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			String excelName = "t47_transExcel";
			request.setAttribute("excelName", excelName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transactionList", t47_transactionList);

		return actionMapping.findForward("success");
	}
	/**
	 * modify by zhangyang 2007-01-09 交易明细查询
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
	public ActionForward performGetT47_transactionDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_transactionDAO t47_transactionDAO =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction;
		try {

			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String transactionkey = form.getTransactionkey();
			String tableName = StringUtils.null2String(request.getParameter("tableName"));	// 针对t47_transaction_ub,t47_transaction_uc
			String new_case = StringUtils.null2String(request.getParameter("new_case"));	// 针对创建案例里添加交易的交易信息
			
		    //添加条件查询当前和历史交易信息，modify by lixx 2009.8.4
			//t47_transaction = t47_transactionDAO.getT47_transactionDisp(sqlMap, transactionkey, tableName);
			//T47_transaction t47_transaction1 = t47_transactionDAO.getT47_transactionFillDisp(sqlMap, transactionkey, tableName);
			//t47_transaction.setOrgankeystr(t47_transaction1.getUnionorgkey());
			//if(!tableName.equals("") && tableName != null){//针对创建案例里添加交易的交易信息
			if((!tableName.equals("")&&!tableName.equals("ls")) || (!new_case.equals("") && new_case != null && new_case.equals("1"))){
				t47_transaction = t47_transactionDAO.getT47_transactionDisp(sqlMap, transactionkey, tableName);
				//T47_transaction t47_transaction1 = t47_transactionDAO.getT47_transactionFillDisp(sqlMap, transactionkey, tableName);
				//t47_transaction.setOrgankeystr(t47_transaction1.getUnionorgkey());
			}else if(tableName.equals("ls")){
				t47_transaction = new T47_transaction();
				t47_transaction.setAlertsearchtime("1");
				t47_transaction.setTransactionkey(StringUtils.null2String(request.getParameter("transactionkey")));
				t47_transaction = t47_transactionDAO.getT47_transactionDisp1(sqlMap,t47_transaction);
			}else{
				t47_transaction = new T47_transaction();
				HttpSession session = request.getSession();
				String alertsearchtime = (String) session.getAttribute("alertsearchtime");
				String casesearchtime = request.getParameter("casesearchtime");
				if(null!=casesearchtime) {
					alertsearchtime = casesearchtime;
				}
				t47_transaction.setTransactionkey(transactionkey);
				t47_transaction.setAlertsearchtime(alertsearchtime);
			
				t47_transaction = t47_transactionDAO.getT47_transactionDisp1(sqlMap,t47_transaction);
				//t47_transaction.setAlertsearchtime(alertsearchtime);
				//T47_transaction t47_transaction1 = t47_transactionDAO.getT47_transactionFillDisp2(sqlMap, t47_transaction);
				//t47_transaction.setOrgankeystr(t47_transaction1.getUnionorgkey());
			}
            //end modify by lixx 
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_transaction", t47_transaction);
		//
		return actionMapping.findForward("success");
	}
	
	
	
	public ActionForward performModifyT47_transaction_new(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		try {
			LinkedHashMap opp_organ_typeMap = cm.getMapFromCache("cfct_hash"); // 对手行行号类型
			LinkedHashMap organMap = cm.getMapFromCache("organ"); // 机构
			request.setAttribute("opp_organ_typeMap", this.getOptionsListByMap(
					opp_organ_typeMap, null, true));
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type"); // 证件类型
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));
			LinkedHashMap currencyMap = cm.getMapFromCache("curr_cd");
			request.setAttribute("currencyMap", this.getOptionsListByMap(
					currencyMap, null, false));
			LinkedHashMap statusMap = cm.getMapFromCache("status");
			request.setAttribute("statusMap", this.getOptionsListByMap(
					statusMap, null, true));
			LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay"); // 收付类型
			request.setAttribute("receive_payMap", this.getOptionsListByMap(
					receive_payMap, null, false));
			LinkedHashMap debit_creditMap = cm.getMapFromCache("trackflag"); // 借贷类型
			request.setAttribute("debit_creditMap", this.getOptionsListByMap(
					debit_creditMap, null, false));
			
			/** add by ZEW */
			Map countryMap = cm.getMapFromCache("country");
			request.setAttribute("countryMap", this.getOptionsListByMap(
					countryMap, null, true));
			LinkedHashMap area1Map = cm.getMapFromCache("area1"); // 省信息
			LinkedHashMap area23Map = cm.getMapFromCache("area23"); // 2,3地区信息
			LinkedHashMap area3Map = cm.getMapFromCache("pbcarea3"); // 地区信息
			LinkedHashMap areaupMap = cm.getMapFromCache("areaid"); // 上级地区信息
			request.setAttribute("area1Map", this.getOptionsListByMap(area1Map,
					null, true));
			LinkedHashMap pbc_catpMap = cm.getMapFromCache("pbc_catp"); // 帐户类型
			request.setAttribute("pbc_catpMap", this.getOptionsListByMap(
					pbc_catpMap, null, true));
			LinkedHashMap pbc_cttpMap = cm.getMapFromCache("pbc_cttp"); // 客户类型
			request.setAttribute("pbc_cttpMap", this.getOptionsListByMap(
					pbc_cttpMap, null, false));
			LinkedHashMap t87_pbc_cashMap = cm.getMapFromCache("t87_pbc_cash"); // 现钞标志
			request.setAttribute("t87_pbc_cashMap", this.getOptionsListByMap(
					t87_pbc_cashMap, null, false));

			LinkedHashMap BITPMap = cm.getMapFromCache("BITP"); // 代办人证件类型
			request.setAttribute("BITPMap", this.getOptionsListByMap(BITPMap,
					null, true));
			LinkedHashMap PBC_SWSZ1Map = cm.getMapFromCache("PBC_SWSZ1"); // 境内外汇收支交易
			request.setAttribute("PBC_SWSZ1Map", this.getOptionsListByMap(
					PBC_SWSZ1Map, null, true));
			ArrayList organunionList = cm.getListFromCache("getT87_union_organList");// 机构对应的行政地区
			LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea"); // 行政信息
			LinkedHashMap upareaMap = cm.getMapFromCache("areaid"); // 行政信息
			LinkedHashMap org_trans_relaMap = cm.getMapFromCache("rltp_hash");// 机构与大额交易的关系
			request.setAttribute("org_trans_relaMap", this.getOptionsListByMap(
					org_trans_relaMap, null, true));
			LinkedHashMap overareaMap = cm.getMapFromCache("yesNo"); // 是否跨境
			request.setAttribute("overareaMap", this.getOptionsListByMap(
					overareaMap, null, false));
			request.setAttribute("oppoffMap", this.getOptionsListByMap(
					overareaMap, null, false));// 是否离岸账户
			LinkedHashMap tx_typeMap = cm.getMapFromCache("tradetype"); // 交易类型
			request.setAttribute("tx_typeMap", this.getOptionsListByMap(
					tx_typeMap, null, false));
			LinkedHashMap tx_cdMap = cm.getMapFromCache("aml_tx_cd"); // 交易代码
			request.setAttribute("tx_cdMap", this.getOptionsListByMap(tx_cdMap,
					null, true));
			LinkedHashMap tsctMap = cm.getMapFromCache("tsct_hash1");
			request.setAttribute("tsctMap", this.getOptionsListByMap(tsctMap,
					null, true));
			LinkedHashMap t87_pbc_gjfs1Map = cm.getMapFromCache("t87_pbc_gjfs1"); // 本币现金结算方式
			request.setAttribute("t87_pbc_gjfs1Map", this.getOptionsListByMap(
					t87_pbc_gjfs1Map, null, true));
			LinkedHashMap t87_pbc_gjfs2Map = cm.getMapFromCache("t87_pbc_gjfs2"); // 本币非现金结算方式
			request.setAttribute("t87_pbc_gjfs2Map", this.getOptionsListByMap(
					t87_pbc_gjfs2Map, null, true));
			LinkedHashMap t87_pbc_gjfs3Map = cm.getMapFromCache("t87_pbc_gjfs3"); // 外币现金结算方式
			request.setAttribute("t87_pbc_gjfs3Map", this.getOptionsListByMap(
					t87_pbc_gjfs3Map, null, true));
			LinkedHashMap t87_pbc_gjfs4Map = cm.getMapFromCache("t87_pbc_gjfs4"); // 外币非现金结算方式
			request.setAttribute("t87_pbc_gjfs4Map", this.getOptionsListByMap(
					t87_pbc_gjfs4Map, null, true));
			//
			LinkedHashMap party_typeMap = cm.getMapFromCache("clienttype"); // 对私对公客户类型
			request.setAttribute("party_typeMap", this.getOptionsListByMap(
					party_typeMap, null, true));
			
//			
//			Map map = cm.getMapFromCache("country");
//			TreeMap country_map = new TreeMap(new CountryComparator(map));
//			country_map.putAll(map);
//			TreeMap legal_country_cdMap = country_map;
//			request.setAttribute("legal_country_cdMap", legal_country_cdMap);
//			request.setAttribute("agent_countryMap", this.getOptionsListByMap(
//					legal_country_cdMap, null, true));
			
			
			LinkedHashMap currency_typeMap = cm.getMapFromCache("currency");
			request.setAttribute("currency_typeMap", this.getOptionsListByMap(
					currency_typeMap, null, true));
			
			
			
			ArrayList areaList = cm.getListFromCache("getArea_forall");
			request.setAttribute("areaList", areaList);
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			String transactionkey = StringUtils.null2String(request
					.getParameter("transactionkey"));
			t47_transaction = t47_transactionDAO.getT47_transactionFillDisp(
					sqlMap, transactionkey, "t47_transaction");
			if (t47_transaction.getAgent_card_type() != null
					&& !t47_transaction.getAgent_card_type().trim().equals("")) {
				String type08 = t47_transaction.getAgent_card_type().substring(
						0, 2);
				String info08 = t47_transaction.getAgent_card_type().substring(
						2);
				t47_transaction.setAgent_card_type(type08);
				t47_transaction.setCard_inf(info08);
			}
			if (t47_transaction.getOpp_card_type() != null
					&& !t47_transaction.getOpp_card_type().trim().equals("")) {
				String opp_type08 = t47_transaction.getOpp_card_type()
						.substring(0, 2);
				String opp_info08 = t47_transaction.getOpp_card_type()
						.substring(2);
				t47_transaction.setOpp_card_type(opp_type08);
				t47_transaction.setOpp_card_inf(opp_info08);
			}
			t47_transaction.setOrganName((String) organMap.get(t47_transaction
					.getOrgankey()));
			t47_transaction.setTx_dt_disp(DateUtils
					.dateToStringShort(t47_transaction.getTx_dt()));
			if (t47_transaction.getTx_go_area() != null) {
				if ((String) area3Map.get(t47_transaction.getTx_go_area()) != null) {// 第三级
					t47_transaction.setTx_go_area2(t47_transaction
							.getTx_go_area());
					t47_transaction.setTx_go_area1((String) areaupMap
							.get(t47_transaction.getTx_go_area()));
					t47_transaction.setTx_go_area((String) areaupMap
							.get(t47_transaction.getTx_go_area1()));
				} else if ((String) area23Map.get(t47_transaction
						.getTx_go_area()) != null
						&& (String) area3Map.get(t47_transaction
								.getTx_go_area()) == null) {// 第二级
					t47_transaction.setTx_go_area1(t47_transaction
							.getTx_go_area());
					t47_transaction.setTx_go_area((String) areaupMap
							.get(t47_transaction.getTx_go_area()));
				}
			}
			if (t47_transaction.getTx_occur_area() != null) {
				if ((String) area3Map.get(t47_transaction.getTx_occur_area()) != null) {// 第三级
					t47_transaction.setTx_occur_area2(t47_transaction
							.getTx_occur_area());
					t47_transaction.setTx_occur_area1((String) areaupMap
							.get(t47_transaction.getTx_occur_area()));
					t47_transaction.setTx_occur_area((String) areaupMap
							.get(t47_transaction.getTx_occur_area1()));
				} else if ((String) area23Map.get(t47_transaction
						.getTx_occur_area()) != null
						&& (String) area3Map.get(t47_transaction
								.getTx_occur_area()) == null) {// 第二级
					t47_transaction.setTx_occur_area1(t47_transaction
							.getTx_occur_area());
					t47_transaction.setTx_occur_area((String) areaupMap
							.get(t47_transaction.getTx_occur_area()));
				}
			}
			if (t47_transaction.getOpp_area() != null) {
				if ((String) area3Map.get(t47_transaction.getOpp_area()) != null) {// 第三级
					t47_transaction.setOpp_area2(t47_transaction.getOpp_area());
					t47_transaction.setOpp_area1((String) areaupMap
							.get(t47_transaction.getOpp_area()));
					t47_transaction.setOpp_area((String) areaupMap
							.get(t47_transaction.getOpp_area1()));
				} else if ((String) area23Map
						.get(t47_transaction.getOpp_area()) != null
						&& (String) area3Map.get(t47_transaction.getOpp_area()) == null) {// 第二级
					t47_transaction.setTx_occur_area1(t47_transaction
							.getOpp_area());
					t47_transaction.setOpp_area((String) areaupMap
							.get(t47_transaction.getOpp_area()));
				}
			}
			if (t47_transaction.getCurr_cd().equals("2")) {
				t47_transaction.setSettle_type_cd1(t47_transaction
						.getSettle_type_cd());
			}
			MyBeanUtils.copyBean2Bean(form, t47_transaction);
			form.setSettle_type_cd1(t47_transaction.getSettle_type_cd());
			form.setSettle_type_cd2(t47_transaction.getSettle_type_cd());
			form.setSettle_type_cd3(t47_transaction.getSettle_type_cd());
			form.setSettle_type_cd4(t47_transaction.getSettle_type_cd());
			if(t47_transaction.getParty_id().length()==18)
			{
				form.setIs_party("0");
			}
			request.setAttribute("transactionkey", transactionkey);
		}

		catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transaction", t47_transaction);
		return actionMapping.findForward("success");
	}
	
	
	
	public ActionForward performModifyT47_transaction_newDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		T47_transactionDAO t47_transactionDAO = (T47_transactionDAO)context.getBean("t47_transactionDAO");
		T47_transaction t47_transaction = new T47_transaction();
		HttpSession session = request.getSession();
		try {
			LinkedHashMap exchange_rateMap = cm.getMapFromCache("exchange_rate");
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t47_transaction, form);
			if(t47_transaction.getAmt_disp() != "" && t47_transaction.getAmt_disp() != null){
				Double money1=null; 
				money1 = Double.valueOf(t47_transaction.getAmt_disp());
				t47_transaction.setAmt(money1);
			}
			if (t47_transaction.getAgent_card_type().equals("19")
					|| t47_transaction.getAgent_card_type().equals("29"))
				t47_transaction.setAgent_card_type(t47_transaction
						.getAgent_card_type()
						+ t47_transaction.getCard_inf());
			if (t47_transaction.getOpp_card_type().equals("19")
					|| t47_transaction.getOpp_card_type().equals("29"))
				t47_transaction.setOpp_card_type(t47_transaction
						.getOpp_card_type()
						+ t47_transaction.getOpp_card_inf());
			t47_transaction.setParty_id(t47_transaction.getHost_cust_id());
			// 折算金额
			// 交易时间
			if (t47_transaction.getTx_dt_disp() != null
					&& !t47_transaction.getTx_dt_disp().equals("")) {
				t47_transaction.setTx_dt(DateUtils
						.stringToDateShort(t47_transaction.getTx_dt_disp()));
				t47_transaction.setDt_time(t47_transaction.getTx_dt());
			}
			// 交易去向
			if (t47_transaction.getTx_go_country() != null
					&& t47_transaction.getTx_go_country().equals("CHN")) {
				if (t47_transaction.getTx_go_area2().length() == 6) {
					t47_transaction.setTx_go_area(t47_transaction
							.getTx_go_area2());
				} else if (t47_transaction.getTx_go_area1().length() == 6) {
					t47_transaction.setTx_go_area(t47_transaction
							.getTx_go_area1());
				}
			} else if (t47_transaction.getTx_go_country() != null
					&& t47_transaction.getTx_go_country().length() == 3) {
				t47_transaction.setTx_go_area("000000");
			}
			// 交易发生地
			if (t47_transaction.getTx_occur_country() != null
					&& t47_transaction.getTx_occur_country().equals("CHN")) {
				if (t47_transaction.getTx_occur_area2().length() == 6) {
					t47_transaction.setTx_occur_area(t47_transaction
							.getTx_occur_area2());
				} else if (t47_transaction.getTx_occur_area1().length() == 6) {
					t47_transaction.setTx_occur_area(t47_transaction
							.getTx_occur_area1());
				}
			} else if (t47_transaction.getTx_occur_country() != null
					&& t47_transaction.getTx_occur_country().length() == 3) {
				t47_transaction.setTx_occur_area("000000");
			}
			// 对方机构行政区代码
			if (t47_transaction.getOpp_country() != null
					&& t47_transaction.getOpp_country().equals("CHN")) {
				if (t47_transaction.getOpp_area2().length() == 6) {
					t47_transaction.setOpp_area(t47_transaction.getOpp_area2());
				} else if (t47_transaction.getOpp_area1().length() == 6) {
					t47_transaction.setOpp_area(t47_transaction.getOpp_area1());
				}
			} else if (t47_transaction.getOpp_country() != null
					&& t47_transaction.getOpp_country().length() == 3) {
				t47_transaction.setOpp_area("000000");
			}
			if (t47_transaction.getCurr_cd().equals("2")) {// 外币
				if (t47_transaction.getTsctkey() == null
						|| t47_transaction.getTsctkey().equals("")) {
					t47_transaction.setTsctkey("000000");
				}
				double rate = Double.parseDouble(String
						.valueOf(exchange_rateMap.get(t47_transaction
								.getCurrency_cd())));
				double res = Double.parseDouble(String.valueOf(t47_transaction
						.getAmt()))
						* rate / Constans.CURRENCY_UNIT;
				Double d = new Double(res);
				t47_transaction.setUsd_amt(d);
//				t47_transaction.setSettle_type_cd(t47_transaction
//						.getSettle_type_cd1());
				if("00".equals(t47_transaction.getCash_ind())){//现钞
					//外现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd2());
				}else{
					//外非现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd4());
				}
				double usd_rate = Double.parseDouble(String
						.valueOf(exchange_rateMap.get("CNY")));
				t47_transaction.setCny_amt(Double.valueOf(String
						.valueOf(t47_transaction.getUsd_amt().doubleValue()
								* Constans.CURRENCY_UNIT / usd_rate)));

			} else {
				double usd_rate = Double.parseDouble(String
						.valueOf(exchange_rateMap.get("CNY")));
				t47_transaction.setUsd_amt(Double.valueOf(String
						.valueOf(t47_transaction.getCny_amt().doubleValue()
								/ Constans.CURRENCY_UNIT * usd_rate)));
				t47_transaction.setCny_amt(t47_transaction.getAmt());
				if("00".equals(t47_transaction.getCash_ind())){//现钞
					//本现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd1());
				}else{
					//本非现
					t47_transaction.setSettle_type_cd(form.getSettle_type_cd3());
				}
			}
			if (t47_transaction.getCash_ind().equals("00"))
				t47_transaction.setCash_trans_flag("1");
			else
				t47_transaction.setCash_trans_flag("2");
			t47_transaction.setOpp_isparty(form.getIs_party());
			int i = t47_transactionDAO.modifyT47_transactiondo(sqlMap,
					t47_transaction);

		}

		catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t47_transaction", t47_transaction);
		return actionMapping.findForward("success");
	}
	
	public String NullToString(String str){
		if(str==null)str="";
		return str;
	}
	
}