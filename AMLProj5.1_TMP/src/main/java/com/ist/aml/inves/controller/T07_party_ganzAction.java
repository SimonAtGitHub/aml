package com.ist.aml.inves.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.inves.dao.T07_party_ganzDAO;
import com.ist.aml.inves.dto.T07_party_ganz;
import com.ist.aml.report.dao.T47_partyDAO;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.util.DateUtils;
import com.ist.util.StringUtils;

@SuppressWarnings("serial")
public class T07_party_ganzAction extends BaseAction{
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
		this.formFieldsTrim(form);
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// 预处理
		myforward = this.preExecute(mapping, form, request, response);
		// 如预处理中强行跳出
		if ("false".equals(request.getAttribute("goWayFlag"))){
			return myforward;// 查询界面
		}
		// 跟踪客户信息列表
		if ("getT07_party_ganzList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_party_ganzList(mapping, form,
					request, response);
		}
		if ("getT07_party_ganzAdd".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_party_ganzAdd(mapping, form,
					request, response);
		}
		if ("getT07_party_ganzAddDo".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_party_ganzAddDo(mapping, form,
					request, response);
		}
		return myforward;

	}
	
	private ActionForward performGetT07_party_ganzAddDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			T07_party_ganzDAO t07_party_ganzDAO=(T07_party_ganzDAO)context.getBean("t07_party_ganzDAO");
			T47_partyDAO t47_partyDAO = (T47_partyDAO)context.getBean("t47_partyDAO");
			T07_party_ganz partyGanz = new T07_party_ganz();
			T07_party_ganzActionForm form = (T07_party_ganzActionForm)actionForm;
			request.setAttribute("statusMap", getOptionsListByMap(cm.getMapFromCache("inUse"), null, true));
			MyBeanUtils.copyBean2Bean(partyGanz, form);
			String genzNo = getSequenceNextVal("SEQ_T07_PARTY_GANZ");
			partyGanz.setGenz_no(genzNo);
			T47_party t47_party = t47_partyDAO.getT47_partyById(sqlMap,partyGanz.getParty_id());
			partyGanz.setCard_no(t47_party.getCard_no());
			partyGanz.setCard_type(t47_party.getCard_type());
			partyGanz.setParty_chn_name(t47_party.getParty_chn_name());
			partyGanz.setCreate_date_disp(DateUtils.getCurrDate());
			t07_party_ganzDAO.insertT07_party_ganz(sqlMap, partyGanz);
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
	private ActionForward performGetT07_party_ganzAdd(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			T07_party_ganz partyGanz = new T07_party_ganz();
			T07_party_ganzActionForm form = (T07_party_ganzActionForm)actionForm;
			request.setAttribute("statusMap", getOptionsListByMap(cm.getMapFromCache("inUse"), null, true));
			MyBeanUtils.copyBean2Bean(form, partyGanz);
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
	 * 接收页面参数，获得跟踪用户信息查询列表    条件查询 和 分页查询
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private ActionForward performGetT07_party_ganzList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap statusMap = cm.getMapFromCache("inUse");
		//List t07_party_ganzlist= null;
		List showList = new ArrayList();
		T07_party_ganzDAO t07_party_ganzDAO=(T07_party_ganzDAO)context.getBean("t07_party_ganzDAO");
		T07_party_ganz t07_party_ganz = new T07_party_ganz();
		String pageInfo="";
		try{
			T07_party_ganzActionForm form=(T07_party_ganzActionForm)actionForm;
		
		String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		int intPage = PageUtils.intPage(request, newsearchflag);
		
		if ("1".equals(newsearchflag) || "2".equals(newsearchflag)) {// 新的查询
			MyBeanUtils.copyBean2Bean(t07_party_ganz, form);
			session.setAttribute("t07_party_ganzSearchObj",t07_party_ganz);
		}else{
			t07_party_ganz=(T07_party_ganz)session.getAttribute("t07_party_ganzSearchObj");
			MyBeanUtils.copyBean2Bean(form, t07_party_ganz);
		}
//		取的当前用户信息
//		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
//		Authorization auth = authBean.getAuthToken();
//		String organStr = auth.getOrganstr();
//		t07_party_ganz.setOrganStr(organStr);
		List t07_party_ganzlist=t07_party_ganzDAO.getT07_party_ganzlist(sqlMap, t07_party_ganz, this.getStartRec(intPage), this.getIntPageSize());
		int totalRow=t07_party_ganzDAO.getT07_party_ganzCount(sqlMap, t07_party_ganz);
		String url = request.getContextPath()+"/inves" + actionMapping.getPath() + ".do";
		pageInfo = this.getPageInfoStr(totalRow,intPage,url,"");
		//String party_class_cd_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
		//request.setAttribute("party_class_cd_str", party_class_cd_str);

		if(null!=t07_party_ganzlist){
			for (Object obj : t07_party_ganzlist) {
				T07_party_ganz party_ganz = (T07_party_ganz)obj;
				if(null!=party_ganz.getParty_class_cd()){
					party_ganz.setParty_class_cd_disp((String)party_class_cdMap.get(party_ganz.getParty_class_cd()));
				}
				if(null!=party_ganz.getOrgankey()){
					party_ganz.setOrganname((String)organMap.get(party_ganz.getOrgankey()));
				}
				if(null!=party_ganz.getCard_type()){
					party_ganz.setCard_type_disp((String)card_typeMap.get(party_ganz.getCard_type()));
				}
				if(null!=party_ganz.getCreate_date()){
					party_ganz.setCreate_date_disp(DateUtils.dateToStringShort(party_ganz.getCreate_date()));
				}
				if(null!=party_ganz.getInfact_date()){
					party_ganz.setInfact_date_disp(DateUtils.dateToStringShort(party_ganz.getInfact_date()));
				}
				if(null!=party_ganz.getStatus_cd()){
					party_ganz.setStatus_cd_disp((String)statusMap.get(party_ganz.getStatus_cd()));
				}
				showList.add(party_ganz);
			}
		}
		}catch (Exception e) {
			e.printStackTrace();
			logger.error("异常",e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("statusMap", this.getOptionsListByMap(statusMap, null, true));
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_party_ganzlist",showList );
		return actionMapping.findForward("success");
	}
}
