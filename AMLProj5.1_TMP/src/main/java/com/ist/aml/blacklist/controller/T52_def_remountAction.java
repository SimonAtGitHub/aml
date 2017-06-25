package com.ist.aml.blacklist.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

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

import com.ist.aml.blacklist.dao.T52_def_remountDAO;
import com.ist.aml.blacklist.dto.T52_def_remount;
import com.ist.aml.report.controller.T47_partyActionForm;
import com.ist.aml.report.controller.T47_transactionActionForm;
import com.ist.aml.report.dao.T47_transactionDAO;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

/**
 * 名单回溯结果
 * @author liuzp
 *
 */
public class T52_def_remountAction extends BaseAction
{
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
			HttpServletRequest request, HttpServletResponse response)
	{
		
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag")))
		{
			return myforward;			
		}
		
		
		if ("getT52_b_remout_list".equalsIgnoreCase(myaction)) 					// 回溯结果
		{
			myforward = performGetT52_b_remout_list(mapping, form, request,
					response);
		}
		if ("getT52_remount_trans_list".equalsIgnoreCase(myaction)) 					// 查询交易信息
		{
			myforward = performGetT52_b_remout_trans_list(mapping, form, request,
					response);
		}
		
		return myforward;

	}

	/** 查询交易信息 */
	private ActionForward performGetT52_b_remout_trans_list(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t52_remount_transList;
		String pageInfo = "";
		
		T52_def_remountDAO t52_def_remountDAO = (T52_def_remountDAO)context.getBean("t52_def_remountDAO");
		T52_def_remount t52_def_remount = new T52_def_remount();
		
		

		try {
			T52_def_remountActionForm form = (T52_def_remountActionForm) actionForm;
			
		
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
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			//
			
			t52_def_remount.setOrgankeystr(org_id);
			t52_def_remount.setParty_id(form.getParty_id());
			if (newsearchflag.equals("1")) {// 新的查询
				MyBeanUtils.copyBean2Bean(t52_def_remount, form);
				t52_def_remount.setTransactionkey(form.getTransactionkey());
				if (form.getBus_type_cd().equals("1")) {// 限额
					t52_def_remount.setBus_type_cd("1%");
				} else if (form.getBus_type_cd().equals("2")) {// 定额
					t52_def_remount.setBus_type_cd("_1%");
				} else if (form.getBus_type_cd().equals("3")) {// 大额
					t52_def_remount.setBus_type_cd("__1%");
				} else if (form.getBus_type_cd().equals("4")) {// 信用卡
					t52_def_remount.setBus_type_cd("___1%");
				} else if (form.getBus_type_cd().equals("5")) {// 网银
					t52_def_remount.setBus_type_cd("____1%");
				}
				if(form.getChannel() != null && !form.getChannel().equals("")){
					t52_def_remount.setChannel(form.getChannel());
				}
				// 模糊匹配，需要特殊处理一下
				// if (t47_transaction.getRealname() != null) {
				// t47_transaction.setRealname("%" +
				// t47_transaction.getRealname() + "%");
				// }
				intPage = 0;
				session.setAttribute("t52_def_remountSearchObj",
						t52_def_remount);
			} else {// 翻页
				t52_def_remount = (T52_def_remount) session
						.getAttribute("t52_def_remountSearchObj");
			}
			
             if(t52_def_remount==null)t52_def_remount=new T52_def_remount();
             MyBeanUtils.copyBean2Bean(t52_def_remount, form);
             System.out.println(form.getParty_id()+"==="+form.getTransactionkey());
             logger.info("party_id:"+t52_def_remount.getParty_id()+"------"+t52_def_remount.getTransactionkey());
			t52_remount_transList = t52_def_remountDAO
					.getT52_remount_transList(sqlMap, t52_def_remount, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t52_def_remountDAO
					.getT52_remount_transListCount(sqlMap, t52_def_remount);
			String url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

			MyBeanUtils.copyBean2Bean(form,t52_def_remount);
			
			/*String debit_credit_disp_str=cm.getMapFromCacheToStr("trackflag", "debit_credit_disp", form.getDebit_credit_disp(),"", true);
			request.setAttribute("debit_credit_disp_str", debit_credit_disp_str);
String cash_trans_flag_str=cm.getMapFromCacheToStr("goflag", "cash_trans_flag_disp", form.getCash_trans_flag_disp(),"", true);
			request.setAttribute("cash_trans_flag_str", cash_trans_flag_str);
	String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_cd_str", party_class_cd_str);
			//对手客户类型
			String opp_party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "opp_party_class_cd", form.getOpp_party_class_cd(),"", true);
			request.setAttribute("opp_party_class_cd_str", opp_party_class_cd_str);
	String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);*/
			
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
		request.setAttribute("t52_remount_transList", t52_remount_transList);

		
		return actionMapping.findForward("success");
	}

	/** 回溯结果 */
	private ActionForward performGetT52_b_remout_list(ActionMapping mapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		ArrayList t52_def_remountList;
		String pageInfo = "";
		
		T52_def_remountDAO t52_def_remountDAO = (T52_def_remountDAO)context.getBean("t52_def_remountDAO");
		T52_def_remount t52_def_remount = new T52_def_remount();
		
		try {
			T52_def_remountActionForm form = (T52_def_remountActionForm) actionForm;
			// 客户类型
			LinkedHashMap party_classMap = cm.getMapFromCache("clienttype");
			request.setAttribute("party_classMap", this.getOptionsListByMap(
					party_classMap, null, true));
			// 客户证件类型
			LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
			request.setAttribute("card_typeMap", this.getOptionsListByMap(
					card_typeMap, null, true));

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);;

			
			if ("0".equals(newsearchflag)) {									// 从右侧菜单进入
				return mapping.findForward("success");
			} else if ("1".equals(newsearchflag)) {								// 新的查询
				MyBeanUtils.copyBean2Bean(t52_def_remount, form);
				// 用户认证类
				AuthBean authBean = (AuthBean) session.getAttribute("authBean");
				Authorization auth = authBean.getAuthToken();
				String organkeys = auth.getOrganstr();
				
				t52_def_remount.setOrgankeys(organkeys);
				
				// 模糊匹配客户中文名
				if (form.getParty_chn_name_s() != null) {
					t52_def_remount.setParty_chn_name(t52_def_remount.getParty_chn_name_s());
				}
				
				t52_def_remount.setIntPage(0);
				
				
				session.setAttribute("t52_def_remount", t52_def_remount);		// 设置案例下客户查询标志
				
			} else 																// 翻页
			{
				t52_def_remount = (T52_def_remount) session.getAttribute("t52_def_remount");
			   if(t52_def_remount!=null)
			   {
				   MyBeanUtils.copyBean2Bean(form,t52_def_remount);  
			   }
			   session.setAttribute("t52_def_remount", t52_def_remount);
			}
			// 执行查询动作
			t52_def_remountList = t52_def_remountDAO.getT52_def_remountList(sqlMap,
						t52_def_remount, this.getStartRec(intPage), this
								.getIntPageSize());
			int totalRow = t52_def_remountDAO.getT52_def_remountListCount(sqlMap,
						t52_def_remount);
			
			

			String url = request.getContextPath() + "/list"
					+ mapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t52_def_remountList", t52_def_remountList);
	
		return mapping.findForward("success");
	}
}
