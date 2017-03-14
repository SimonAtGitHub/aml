/**
 * 
 */
package com.ist.aml.offs_report.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
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
import com.ist.aml.offs_report.dao.T07_user_identityDAO;
import com.ist.aml.offs_report.dao.T07_user_identityUrgeDAO;
import com.ist.aml.offs_report.dto.T07_user_identity;
import com.ist.aml.offs_report.dto.T07_user_identityUrge;
import com.ist.aml.report.controller.T07_post_operatorActionForm;
import com.ist.aml.report.controller.T47_partyActionForm;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dto.T00_organ;
import com.ist.platform.dto.T00_user;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

/**
 * @author Administrator
 * 
 */
public class T07_user_identityUrgeAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static Logger logger = LogUtils
			.getLogger(T07_user_identityUrgeAction.class.getName());

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();

		if ("t07_user_identityUrgeList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_user_identityUrgelist(mapping, form, request,
					response);
		}	
		if ("urgeSearchOrgan".equalsIgnoreCase(myaction)) {
			myforward = performGetUrgeSearchOrgan(mapping, form, request,
					response);
		}
		return myforward;
	}

	/**
	 * 前台列表查询 -- 统计查询
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_user_identityUrgelist(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T07_user_identityUrgeDAO t07_user_indenttyUrgeDao = (T07_user_identityUrgeDAO)context.getBean("t07_user_identityUrgeDAO");
        //取得数据时间下拉列表
		LinkedHashMap ymMap = new LinkedHashMap();
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		int curryear = Integer.parseInt(DateUtils.getYear( DateUtils.getCurrDateTime() ));
		int currmonth = Integer.parseInt(DateUtils.getMonth(DateUtils.getCurrDateTime() ));
        int startyear = Integer.parseInt(sysConfig.getProperty("sysparam.datastartyear"));
        while(curryear>=startyear){
            ymMap.put(""+startyear, ""+startyear);
            startyear++;
        }
        request.setAttribute("dataYmMap",this.getOptionsListByMap(ymMap,null,false));
        //获取页面上需要的下拉菜单信息
        LinkedHashMap seasonMap=cm.getMapFromCache("seasonlist");
        LinkedHashMap identitytypeMap=cm.getMapFromCache("identitytype");
		
		request.setAttribute("seasonMap", this.getOptionsListByMap(seasonMap, null, false));
		request.setAttribute("identitytypeMap", this.getOptionsListByMap(identitytypeMap, null, false));
		
		T07_user_identityUrge t07_user_identityUrge = new T07_user_identityUrge();

		try{
			T07_user_identityUrgeActionForm form=(T07_user_identityUrgeActionForm)actionForm;
			String newsearchflag=StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			if(newsearchflag.equals("0")){//从左侧菜单进入
		        //初始化页面表单
		        int iseason=currmonth/3;
		        form.setStartyear(""+curryear);
		        form.setStartseason("01");
		        form.setEndseason("0"+iseason);
		        form.setEndyear(""+curryear);
		        request.setAttribute("display", "true");
			} else if (newsearchflag.equals("1")) {
				MyBeanUtils.copyBean2Bean(t07_user_identityUrge, form);
				t07_user_identityUrge.setStartdate(Integer.parseInt(form.getStartyear() + form.getStartseason()));

				// 组织用户所属的机构ID
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) request.getSession().getAttribute("authBean");//(取出组织用户所有信息)
				auth = authBean.getAuthToken();
				//获得该组织机构下属的所有机构
				String organkey = auth.getT00_user().getOrgankey();
				ArrayList listorgan = new ArrayList();
				ArrayList list = new ArrayList();
				listorgan = authBean.getAuthToken().getOrganList();//t07_user_indenttyUrgeDao.getUnderlingOrgan(sqlMap, organkey);
	        	for(int i=0;i<listorgan.size();i++){
	        		T00_organ t00_organ = (T00_organ)listorgan.get(i);
	        		list.add(t00_organ.getOrgankey());
	        	}
//				t07_user_identityUrge.setUnderOrganList(list);
				 auth = authBean.getAuthToken(); 
				 t07_user_identityUrge.setOrgankey(auth.getOrganstr());
				
			
				//查询出其下属共有多少机构
				int allUnderOrgan = list.size();
				StringBuffer allUnderOrgankey = new StringBuffer();
				for(int i = 0; i < list.size(); i++){
					allUnderOrgankey.append((String)list.get(i) + ",");
				}
				request.setAttribute("allUnderOrgankey", allUnderOrgankey.toString());
				form.setAllUnderOrgankey(allUnderOrgankey.toString());
				request.setAttribute("allUnderOrgan", Integer.toString(allUnderOrgan));
				//查询出已经填报完成的下属
				ArrayList listComplete = new ArrayList();
				listComplete.add("1");
				listComplete.add("2");
				listComplete.add("3");
				t07_user_identityUrge.setStatus_arrayList(listComplete);
				listComplete = t07_user_indenttyUrgeDao.getT07_user_identityUrgeCount(sqlMap, t07_user_identityUrge);
				StringBuffer completeUnderOrgankey = new StringBuffer();
				for(int i = 0; i < listComplete.size(); i++){
					completeUnderOrgankey.append( (String)listComplete.get(i) + "," );
				}
				int underOrganComplete = listComplete.size();
				request.setAttribute("completeUnderOrgankey", completeUnderOrgankey.toString());
				request.setAttribute("underOrganComplete", Integer.toString(underOrganComplete));
				//查询出正在填报中的下属
				ArrayList listFill = new ArrayList();
				listFill.add("0");
				listFill.add("4");
				t07_user_identityUrge.setStatus_arrayList(listFill);
				listFill = t07_user_indenttyUrgeDao.getT07_user_identityUrgeCount(sqlMap, t07_user_identityUrge);
				StringBuffer fillUnderOrgankey = new StringBuffer();
				for(int i = 0; i < listFill.size(); i++){
					fillUnderOrgankey.append( (String)listFill.get(i) + ",");
				}
				int underOrganFill = listFill.size();
				request.setAttribute("fillUnderOrgankey", fillUnderOrgankey.toString());
				request.setAttribute("underOrganFill", Integer.toString(underOrganFill));
				//查询出未填报的下属
				int underOrganLeave = allUnderOrgan - underOrganComplete - underOrganFill;
				for(int i = 0; i < listComplete.size(); i++){
					if(list.indexOf(listComplete.get(i)) >= 0){
						list.remove(listComplete.get(i));
					}
				}
				for(int i = 0; i < listFill.size(); i++){
					if(list.indexOf(listFill.get(i)) >= 0){
						list.remove(listFill.get(i));
					}
				}
				StringBuffer leaveUnderOrgankey = new StringBuffer();
				for(int i = 0; i < list.size(); i++){
					leaveUnderOrgankey.append( (String)list.get(i) + ",");
				}
				request.setAttribute("leaveUnderOrgankey", leaveUnderOrgankey.toString());
				request.setAttribute("underOrganLeave", Integer.toString(underOrganLeave));
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
	 * 机构信息查询
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	private ActionForward performGetUrgeSearchOrgan(ActionMapping mapping, 
			ActionForm actionForm, HttpServletRequest request, 
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		AuthBean authBean = new AuthBean();
		Authorization auth = new Authorization();
		authBean = (AuthBean) request.getSession().getAttribute("authBean");//(取出组织用户所有信息)
		auth = authBean.getAuthToken();
		String organstrAll = auth.getOrganstr();
		String pageInfo = "";
		String organstr = "";
		
		T07_user_identityUrge t07_user_identityUrge = new T07_user_identityUrge();
		T07_user_identityUrge temp = new T07_user_identityUrge();
		T07_user_identityUrgeDAO t07_user_identityUrgeDAO = (T07_user_identityUrgeDAO)context.getBean("t07_user_identityUrgeDAO");
		
		ArrayList organList = new ArrayList();
		try {
			/** modify by lijie 2013.07.29:原方法中underOgans的获取通过url链接参数underOganList，出现截断，不能获得全部有效机构号******/
			T07_user_identityUrgeActionForm form=(T07_user_identityUrgeActionForm)actionForm;
			String type = request.getParameter("type");
			String identitytype = request.getParameter("identitytype");
			String start_year = request.getParameter("start_year");
			String start_season = request.getParameter("start_season");
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			
			
			if (newsearchflag.equals("1")) {// 新的查询
				form.setStartyear(start_year);
				form.setStartseason(start_season);
				form.setStartdate(Integer.parseInt(start_year + start_season));
				form.setIdentitytype(identitytype);
				form.setType(type);
				
				organstr = getOrganstr(form,auth);
				
				
				
				
				
				
				form.setOrganstr(organstr);
				MyBeanUtils.copyBean2Bean(temp, form);
				
				session.setAttribute("t00_organSearchObj", temp);
			} else {// 翻页
				temp = (T07_user_identityUrge) session.getAttribute("t00_organSearchObj");

			}
			organList = t07_user_identityUrgeDAO.getT00_organList(sqlMap, temp, this.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t07_user_identityUrgeDAO.getT00_organListCount(sqlMap, temp);
			String url = request.getContextPath() + "/offs_report" + mapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("异常", e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}
		
		request.setAttribute("organList", organList);
		request.setAttribute("pageInfo", pageInfo);
		
		return mapping.findForward("success");
	}

	private String getOrganstr(T07_user_identityUrgeActionForm form, Authorization auth) throws SQLException {
		String organstr = "";
		String organstrAll = auth.getOrganstr();
		T07_user_identityUrge t07_user_identityUrge = new T07_user_identityUrge();
		T07_user_identityUrgeDAO t07_user_identityUrgeDAO = (T07_user_identityUrgeDAO)context.getBean("t07_user_identityUrgeDAO");
		
		String type = form.getType();
		String identitytype = form.getIdentitytype();
		String start_year = form.getStartyear();
		String start_season = form.getStartseason();
		t07_user_identityUrge.setStartdate(Integer.parseInt(start_year + start_season));
		t07_user_identityUrge.setIdentitytype(identitytype);
		
		t07_user_identityUrge.setOrgankey(auth.getOrganstr());
		
		//1.汇总的所有机构数
		ArrayList listorgan = new ArrayList();
		ArrayList list = new ArrayList();
		
		listorgan = auth.getOrganList();
    	for(int i=0;i<listorgan.size();i++){
    		T00_organ t00_organ = (T00_organ)listorgan.get(i);
    		list.add(t00_organ.getOrgankey());
    	}
    	StringBuffer allUnderOrgankey = new StringBuffer();
		for(int i = 0; i < list.size(); i++){
			allUnderOrgankey.append((String)list.get(i) + ",");
		}
		
		//2.查询出已经填报完成的下属
		ArrayList listComplete = new ArrayList();
		listComplete.add("1");
		listComplete.add("2");
		listComplete.add("3");
		t07_user_identityUrge.setStatus_arrayList(listComplete);
		listComplete = t07_user_identityUrgeDAO.getT07_user_identityUrgeCount(sqlMap, t07_user_identityUrge);
		StringBuffer completeUnderOrgankey = new StringBuffer();
		for(int i = 0; i < listComplete.size(); i++){
			completeUnderOrgankey.append( (String)listComplete.get(i) + "," );
		}
		//3.查询出正在填报中的下属
		ArrayList listFill = new ArrayList();
		listFill.add("0");
		listFill.add("4");
		t07_user_identityUrge.setStatus_arrayList(listFill);
		listFill = t07_user_identityUrgeDAO.getT07_user_identityUrgeCount(sqlMap, t07_user_identityUrge);
		StringBuffer fillUnderOrgankey = new StringBuffer();
		for(int i = 0; i < listFill.size(); i++){
			fillUnderOrgankey.append( (String)listFill.get(i) + ",");
		}
		//4.查询出未填报的下属
		for(int i = 0; i < listComplete.size(); i++){
			if(list.indexOf(listComplete.get(i)) >= 0){
				list.remove(listComplete.get(i));
			}
		}
		for(int i = 0; i < listFill.size(); i++){
			if(list.indexOf(listFill.get(i)) >= 0){
				list.remove(listFill.get(i));
			}
		}
		StringBuffer leaveUnderOrgankey = new StringBuffer();
		for(int i = 0; i < list.size(); i++){
			leaveUnderOrgankey.append( (String)list.get(i) + ",");
		}
		
		
		if(type.equals("1"))
			organstr = organstrAll;
		else if(type.equals("2"))
		{
			String temp2 = completeUnderOrgankey.toString();
			organstr = temp2.substring(0, temp2.length()-1);
		}
			
		else if(type.equals("3"))
		{
			String temp3 = fillUnderOrgankey.toString();
			organstr = temp3.substring(0, temp3.length()-1);
		}
		else if(type.equals("4"))
		{
			String temp4 = leaveUnderOrgankey.toString();
			organstr = temp4.substring(0, temp4.length()-1);
		}
		
		return organstr;
	}

}
