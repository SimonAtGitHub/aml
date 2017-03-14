package com.ist.aml.report.controller;


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
import com.ist.aml.report.dao.T07_case_AssistDAO;
import com.ist.aml.report.dto.T07_case_Assist;
import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T47_party;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.platform.dto.T00_organ;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_case_AssistAction extends BaseAction {
	private static Logger logger = LogUtils.getLogger(T07_case_AssistAction.class
			.getName()).getLogger(Constans.LOGGERNAMEA);

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
		 response);//如预处理中强行跳出
		if("false".equals(request.getAttribute("goWayFlag")))
		 return myforward;//查询界面
		if ("checkcase_list".equalsIgnoreCase(myaction)) {
			myforward = performGetCheckcase_list(mapping, form, request,
					response);
		}else if ("addT07_case_Assis".equalsIgnoreCase(myaction)) {
			myforward = performAddCheckcase(mapping, form, request,
					response);
		}
		else if ("addT07_case_AssisDo".equalsIgnoreCase(myaction)) {
			myforward = performaddcheckcaseDo(mapping, form, request,
					response);
		}else if ("checkcase_list1".equalsIgnoreCase(myaction)) {
			myforward = performGetCheckcase_list1(mapping, form, request,
					response);
		}
		else if ("updateT07_case_Assis".equalsIgnoreCase(myaction)) {
			myforward = performUpdateT07_case_Assis(mapping, form, request,
					response);
		}
		else if ("updateT07_case_AssisDo".equalsIgnoreCase(myaction)) {
			myforward = performUpdateT07_case_AssisDo(mapping, form, request,
					response);
		}
		else if ("delT07_case_AssisDo".equalsIgnoreCase(myaction)) {
			myforward = performDelT07_case_AssisDo(mapping, form, request,
					response);
		}else if ("getValidatedTrans".equalsIgnoreCase(myaction))
			myforward = performGetValidatedTrans(mapping, form,
					request, response);
		
		
		return myforward;

	}
	
	public ActionForward performGetCheckcase_list(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
			
		    HttpSession session = request.getSession();
		    CreditTask creditTask = (CreditTask) session.getAttribute("credittask");
		    String application_num = creditTask.getApplication_num();
		    String post_id = creditTask.getPost_id();
		    String party_id = creditTask.getParty_id();
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			
			String pageInfo = "";
			ArrayList t07_case_AssistList =new ArrayList();
			T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm;
			try{
				T07_case_Assist t07_case_Assist=new T07_case_Assist();
				t07_case_Assist.setApplication_num(application_num);
		    	
		    	 t07_case_AssistList = t07_case_AssistDao.getT07_case_AssistList(sqlMap,  t07_case_Assist,
						this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t07_case_AssistDao
						.getT07_case_AssistListCount(sqlMap, t07_case_Assist);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");		
				
			}catch(Exception e){
				e.printStackTrace();
			}
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("t07_case_AssistList", t07_case_AssistList);
		    request.setAttribute("application_num", application_num);
		    request.setAttribute("post_id", post_id);
		    request.setAttribute("party_id", party_id);
		    
		    return actionMapping.findForward("success");
	}
	public ActionForward performGetCheckcase_list1(ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
			ActionErrors errors = new ActionErrors();
			HttpSession session = request.getSession();
			
			String pageInfo = "" ;
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			
			ArrayList t07_case_AssistList =new ArrayList();
			try {
//				组织用户所属的机构ID
				AuthBean authBean = new AuthBean();
			    Authorization auth = new Authorization();
			    authBean = (AuthBean) session.getAttribute("authBean");
			    auth = authBean.getAuthToken();
				String org_id=auth.getOrganstr();

				T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm;
			String newsearchflag = StringUtils.nullObject2String( request.getParameter("newsearchflag") );
			int intPage =PageUtils.intPage(request, newsearchflag);;
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			if(newsearchflag.equals("1")){//新的查询
			MyBeanUtils.copyBean2Bean(t07_case_Assist,form);
			t07_case_Assist.setApplication_num(form.getApplication_num_s());
             if(t07_case_Assist.getReq_time_disp()!=null){
            	 t07_case_Assist.setReq_time(DateUtils.stringToDateShort(t07_case_Assist.getReq_time_disp()));
            	 t07_case_Assist.setReq_time_end(DateUtils.stringToDate(t07_case_Assist.getReq_time_disp()+" 24:59:59"));
             }
			session.setAttribute( "t07_case_AssistSearchObj",t07_case_Assist );
			}else{//翻页
				t07_case_Assist = (T07_case_Assist)session.getAttribute("t07_case_AssistSearchObj");
				MyBeanUtils.copyBean2Bean(form,t07_case_Assist);
			}
			t07_case_Assist.setDeal_organkeys(org_id);
			 t07_case_AssistList = t07_case_AssistDao.getT07_case_AssistList(sqlMap,  t07_case_Assist,
						this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t07_case_AssistDao
						.getT07_case_AssistListCount(sqlMap, t07_case_Assist);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";
			
			pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
		}
			catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
			}
			
		LinkedHashMap statusMap = cm.getMapFromCache("checkcasestatus");
		request.setAttribute("statusMap", this.getOptionsListByMap(statusMap, null, true));
			   
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("t07_case_AssistList", t07_case_AssistList);
			return actionMapping.findForward("success");
			}
	public ActionForward performAddCheckcase(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	
		    String application_num=request.getParameter("application_num");
		    String party_id=request.getParameter("party_id");
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			
			
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm;
			try{
				TreeMap leftHash=new TreeMap();
				// 查询客户的归属机构
				T47_partyDAO t47_partyDao=(T47_partyDAO)context.getBean("t47_partyDAO");
				T47_party t47_party=t47_partyDao.getT47_partyDispR1(sqlMap, party_id);
				String organkey=t47_party.getOrgankey();
				String organname=t47_party.getOrganname();
				leftHash.put(organkey, organname);
				//查询案例下客户交易机构
				t07_case_Assist.setApplication_num(application_num);
				ArrayList list=t07_case_AssistDao.getT07_case_tranOrganList(sqlMap, t07_case_Assist);
		    	
		        LinkedHashMap organMap = cm.getMapFromCache("organ");
		
			    	for(int i=0;i<list.size();i++){
			    		T47_transaction t47_transaction=(T47_transaction)list.get(i);
			    		if(t47_transaction.getOrgankey()!=null && !leftHash.containsKey(t47_transaction.getOrgankey())){
			    			leftHash.put(t47_transaction.getOrgankey(),(String)organMap.get(t47_transaction.getOrgankey()));
			    		}
			    		
			    		
			    	}
		
				//查询案例下交易的账户机构
			   ArrayList organList=t07_case_AssistDao.getT07_case_acctOrganList(sqlMap, application_num);	
		    	for(int i=0;i<organList.size();i++){
		    		T00_organ t00_organ=(T00_organ)organList.get(i);
		    		if(t00_organ.getOrgankey()!=null && !leftHash.containsKey(t00_organ.getOrgankey())){
		    		leftHash.put(t00_organ.getOrgankey(), t00_organ.getOrganname());
		    		}
		    	}
			
		    	TreeMap  rightHash= new TreeMap();
		          String multiSeHTMLStr = StaticMethod.getMultiSelHTML("list1", "list2", "hi", leftHash, rightHash, 8);

		          request.setAttribute("multiSeHTMLStr", multiSeHTMLStr);
			}catch(Exception e){
				logger.error("异常：", e);
				e.printStackTrace();
			}
			request.setAttribute("party_id", party_id);
			request.setAttribute("application_num", application_num);
		   
		    return actionMapping.findForward("success");
	}
	public ActionForward performaddcheckcaseDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	
		    String application_num=request.getParameter("application_num");
		    String party_id=request.getParameter("party_id");
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			HttpSession session = request.getSession();
			
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			
			try{
//				 组织用户所属的机构ID
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String userid=auth.getT00_user().getUsername();
				String req_organkey=auth.getT00_user().getOrgankey();
				T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm;
				
				String[] list2=request.getParameterValues("list2");
				for(int i=0;i<list2.length;i++){
					String organkey=(String)list2[i];
					//查询该案例该机构是否发起过协查
					t07_case_Assist.setApplication_num(application_num);
					t07_case_Assist.setDeal_organkey(organkey);
					t07_case_Assist.setReq_organkey(req_organkey);
					/*t07_case_Assist.setStatus("0");
					int count=t07_case_AssistDAO.getT07_case_AssistListCount(sqlMap, t07_case_Assist);
				   if(count==0){//插入协查表
*/					   //查询序号
					   int seq_num=t07_case_AssistDao.getMaxReqQueue(sqlMap, t07_case_Assist);
					   String assitno=this.getSequenceNextVal("t07_case_assist_seq");
						t07_case_Assist.setReasons(form.getReasons());
						t07_case_Assist.setReq_queue(seq_num+1);
						t07_case_Assist.setAssitno(assitno);
						t07_case_Assist.setStatus("0");
						t07_case_Assist.setReq_user(userid);
						t07_case_Assist.setReq_time(DateUtils.getCurrDateTime());
						t07_case_AssistDao.insertT07_Case_Assist(sqlMap, t07_case_Assist);
					   
				  // }
				}
				
				
			}catch(Exception e){
				System.out.println("e:"+e.getMessage());
			}
			request.setAttribute("party_id", party_id);
			request.setAttribute("application_num", application_num);
		   
		    return actionMapping.findForward("success");
	}
	
	public ActionForward performUpdateT07_case_Assis(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	
		    String application_num=request.getParameter("application_num");
		    String assitno=request.getParameter("assitno");
		   
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			HttpSession session = request.getSession();
			
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			
			try{

				T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm;
				/**2012.7.10 modified by lijie
				 * 查询案例信息:
				 * 1.首先查询该案例是否在当前表中，如果count1>0，跳转到2；否则，跳转到3
				 * 2.从T07_CASE_APPLICATION从获得明细
				 * 3.T07_CASE_APPLICATION_UU中获得明细
				 */
				T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
				T07_case_application t07_case_application = new T07_case_application();
				t07_case_application.setApplication_num(application_num);
				String casesearchtime = "";
				int amount = t07_case_applicationDAO.searchT07_case_applicationListCount(sqlMap, t07_case_application);
				if(amount>=1)
					casesearchtime = "0";
				else
					casesearchtime = "1";
				request.setAttribute("casesearchtime", casesearchtime);
				
				t07_case_application.setCasesearchtime(casesearchtime);
				t07_case_application = t07_case_applicationDAO.getT07_case_applicationDisp_assist(sqlMap, t07_case_application);
				t07_case_application.setCasesearchtime(casesearchtime);
				request.setAttribute("t07_case_application", t07_case_application);
				
			String party_id = "";
			if (t07_case_application.getParty_id() != null) {
				party_id = t07_case_application.getParty_id();
				request.setAttribute("party_id", party_id);
			}
			// 查询协查信息
			t07_case_Assist = t07_case_AssistDao.getT07_Case_Assist_disp(
					sqlMap, assitno);
			request.setAttribute("t07_case_Assist", t07_case_Assist);
			T07_case_stcr t07_case_stcr = new T07_case_stcr();
			t07_case_stcr.setApplication_num(application_num);
			t07_case_stcr.setCasesearchtime(casesearchtime);
			t07_case_stcr.setCase_type("2");
			
			ArrayList stcrList = t07_case_applicationDAO.getT07_stcrList(
					sqlMap, t07_case_stcr);
			request.setAttribute("stcrList", stcrList);
			}catch(Exception e){
				e.printStackTrace();
			}
		
			request.setAttribute("application_num", application_num);
		   
		    return actionMapping.findForward("success");
	}
	public ActionForward performUpdateT07_case_AssisDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	
		   
		   
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
			HttpSession session = request.getSession();
			
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			
			try{
				T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm; 
				 String assitno=request.getParameter("assitno");
				 String result=request.getParameter("result");
				 if(result!=null && !result.equals(form.getHandlereport())){
//				 组织用户所属的机构ID
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String userid=auth.getT00_user().getUsername();
					t07_case_Assist.setStatus("1");
				    t07_case_Assist.setHandlereport(form.getHandlereport());
					t07_case_Assist.setAssitno(assitno);
					t07_case_Assist.setDeal_user(userid);
					t07_case_Assist.setDeal_time(DateUtils.getCurrDateTime());
				int count=t07_case_AssistDao.updateT07_Case_Assist(sqlMap, t07_case_Assist);
				}	   
				 
				
				
			}catch(Exception e){
				System.out.println("e:"+e.getMessage());
			}
		
		    return actionMapping.findForward("success");
	}
	
	public ActionForward performDelT07_case_AssisDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
	
		   
		   
			T07_case_AssistDAO t07_case_AssistDao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
		
			
			T07_case_Assist t07_case_Assist=new T07_case_Assist();
			
			try{
				T07_case_AssistActionForm form=(T07_case_AssistActionForm)actionForm; 
				 String assitno=request.getParameter("assitno");
				 t07_case_Assist.setAssitno(assitno);
				// t07_case_Assist.setStatus("1");
				int count=t07_case_AssistDao.delT07_Case_Assist(sqlMap, t07_case_Assist);
			
				
			}catch(Exception e){
				System.out.println("e:"+e.getMessage());
			}
		
		    return actionMapping.findForward("success");
	}
	public ActionForward performGetValidatedTrans(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";
		T07_case_AssistDAO t07_case_analysedao=(T07_case_AssistDAO)context.getBean("t07_case_AssistDAO");
		T47_transaction t47_transaction = new T47_transaction();
		try {
			T47_transactionActionForm form = (T47_transactionActionForm) actionForm;
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String org_id = authBean.getAuthToken().getOrganstr();

			t47_transaction.setOrgankey(org_id);
			
			String application_num=request.getParameter("application_num");
			String party_id=request.getParameter("party_id");
			String casesearchtime = (String)request.getParameter("casesearchtime");
			
			request.setAttribute("application_num", application_num);
			request.setAttribute("party_id", party_id);
			request.setAttribute("casesearchtime", casesearchtime);
			
			t47_transaction.setApplication_num(application_num);	
			t47_transaction.setStatus("0");
			t47_transaction.setTrans_searchtime(casesearchtime);
			int intPage = StringUtils.nullObject2int( request.getParameter("intPage") ,0);
			String newsearchflag = StringUtils.nullObject2String( request.getParameter("newsearchflag") );
			if(newsearchflag.equals("1")){//新的查询
				t47_transaction.setValidate_ind(form.getValidate_ind());
			session.setAttribute( "t47_transaction",t47_transaction );
			}else{//翻页
				t47_transaction = (T47_transaction)session.getAttribute("t47_transaction");
			}
	  
	       int maxcount=this.intPageSize;
	    	int totalRow = t07_case_analysedao.getValidated_transactionListCount(sqlMap,t47_transaction);
	    	String url = request.getContextPath() +"/report"+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
			request.setAttribute("pageInfo", pageInfo);

	  
			t47_transactionList = t07_case_analysedao
					.getValidatedT47_case_transactionList(sqlMap, t47_transaction,this.getStartRec(intPage), maxcount);
			
			
			request.setAttribute("party_id", StringUtils.null2String((String)request.getParameter("party_id")));
	
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
	


}
