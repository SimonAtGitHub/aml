/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-27   青蛙		创建  
 */

package com.ist.aml.inves.dao;

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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.pbcreport.dto.T47_agreement;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_party_trans;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T47_party;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;
import com.ist.common.base.*;
public class T07_reportSearchDAO extends BaseDAO{

	public T07_reportSearchDAO() {
	}
	
	
	
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @param iStartRec
	 * @param iPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList search_t07_case_reportList(
			SqlMapClient sqlMap, T07_case_application t07_case_application,
			int iStartRec, int iPageSize) throws SQLException {
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"search_t07_casereportList", t07_case_application,
				iStartRec, iPageSize);
		Iterator iter = list.iterator();
		//		 获取页面上需要的下拉菜单信息
		
//		 案例状态(已上报、未上报)
		
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		// 案例级别
		// 案例种类
		// 可疑级别
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");
		//机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		while (iter.hasNext()) {
			T07_case_application caseapp = (T07_case_application) iter.next();
			if (caseapp.getCase_date() != null) {
				caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp
						.getCase_date()));
			}
			if (caseapp.getApp_org_id() != null
					&& !"".equals(caseapp.getApp_org_id())) {
				caseapp.setApp_org_name((String) organMap.get(caseapp
						.getApp_org_id()));
			}
			if (caseapp.getCase_kind() != null
					&& !"".equals(caseapp.getCase_kind())) {
				caseapp.setCase_kind_disp((String) casecagetoryMap.get(caseapp
						.getCase_kind()));
			}

			if (t07_case_application.getCasesearchtime() != null
					&& !"".equals(t07_case_application.getCasesearchtime())) {
				caseapp.setCasesearchtime(t07_case_application.getCasesearchtime());
			}
			if (caseapp.getCast_type() != null
					&& !"".equals(caseapp.getCast_type())) {
				caseapp.setCast_type_disp((String) casetypeMap.get(caseapp
						.getCast_type()));
			}
			if (caseapp.getCurr_cd() != null
					&& !"".equals(caseapp.getCurr_cd())) {
				caseapp.setCurrency_cd_disp((String) curr_cdMap.get(caseapp
						.getCurr_cd()));
			}
			if (caseapp.getAlert_level() != null
					&& !"".equals(caseapp.getAlert_level())) {
				caseapp.setAlert_level_disp((String) alert_leverMap.get(caseapp
						.getAlert_level()));
			}
			if(caseapp.getDate_status_cd()!=null){
				if(caseapp.getDate_status_cd().equals("1")){
					caseapp.setDate_status_cd("人工新增");
				}else if(caseapp.getDate_status_cd().equals("2")){
					caseapp.setDate_status_cd("系统筛选");
				}
			}
		}
		return list;
	}
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int search_t07_case_reportListCount(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"search_t07_casereportCount",
				t07_case_application);
		return iCount.intValue();
	}
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @param iStartRec
	 * @param iPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList search_t07_case_applicationList(
			SqlMapClient sqlMap, T07_case_application t07_case_application,
			int iStartRec, int iPageSize) throws SQLException {
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"search_t07_case_applicationList", t07_case_application,
				iStartRec, iPageSize);
		Iterator iter = list.iterator();
		//		 获取页面上需要的下拉菜单信息
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
//		 案例状态(已上报、未上报)
		
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		// 案例级别
		LinkedHashMap caselevelMap = cm.getMapFromCache("caselevel");
		// 案例种类
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		// 可疑级别
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");
		//机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		while (iter.hasNext()) {
			T07_case_application caseapp = (T07_case_application) iter.next();
			if (caseapp.getApp_dt() != null) {
				caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp
						.getApp_dt()));
			}
			if (caseapp.getCase_date() != null) {
				caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp
						.getCase_date()));
			}
			if (caseapp.getLast_upd_dt() != null) {
				caseapp.setLast_upd_dt_disp(DateUtils.dateToStringShort(caseapp
						.getLast_upd_dt()));
			}
			if (caseapp.getCase_end_date() != null) {
				caseapp.setCase_end_date_disp(DateUtils
						.dateToStringShort(caseapp.getCase_end_date()));
			}
			if (caseapp.getLast_upd_dt() != null) {
				caseapp.setLast_upd_dt_disp(DateUtils
						.dateToStringShort(caseapp.getLast_upd_dt()));
			}
			if (caseapp.getApp_org_id() != null
					&& !"".equals(caseapp.getApp_org_id())) {
				caseapp.setApp_org_name((String) organMap.get(caseapp
						.getApp_org_id()));
			}
			if (caseapp.getCase_kind() != null
					&& !"".equals(caseapp.getCase_kind())) {
				caseapp.setCase_kind_disp((String) casecagetoryMap.get(caseapp
						.getCase_kind()));
			}
			if (caseapp.getCase_kind().equals("A") || caseapp.getCase_kind().equals("N"))
				caseapp.setCase_kind_flag("0");
			else
				caseapp.setCase_kind_flag("1");

			if (caseapp.getApp_state_cd() != null
					&& !"".equals(caseapp.getApp_state_cd())) {
				String status_cd=caseapp.getApp_state_cd();
				caseapp.setApp_state_cd_s((String) casestatusMap.get(status_cd));
			}
			if (t07_case_application.getCasesearchtime() != null
					&& !"".equals(t07_case_application.getCasesearchtime())) {
				caseapp.setCasesearchtime(t07_case_application.getCasesearchtime());
				//caseapp.setCasesearchtime((String) casesearchtimeMap.get(t07_case_application.getCasesearchtime()));
			}
			if (caseapp.getCast_type() != null
					&& !"".equals(caseapp.getCast_type())) {
				caseapp.setCast_type_disp((String) casetypeMap.get(caseapp
						.getCast_type()));
			}
			if (caseapp.getCase_level() != null
					&& !"".equals(caseapp.getCase_level())) {
				caseapp.setCase_leval_disp((String) caselevelMap.get(caseapp
						.getCase_level()));
			}
			if (caseapp.getCurr_cd() != null
					&& !"".equals(caseapp.getCurr_cd())) {
				caseapp.setCurrency_cd_disp((String) curr_cdMap.get(caseapp
						.getCurr_cd()));
			}
			if (caseapp.getAlert_level() != null
					&& !"".equals(caseapp.getAlert_level())) {
				caseapp.setAlert_level_disp((String) alert_leverMap.get(caseapp
						.getAlert_level()));
			}
			if(caseapp.getDate_status_cd()!=null){
				if(caseapp.getDate_status_cd().equals("1")){
					caseapp.setDate_status_cd("人工新增");
				}else if(caseapp.getDate_status_cd().equals("2")){
					caseapp.setDate_status_cd("系统筛选");
				}
			}
		}
		return list;
	}
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int search_t07_case_applicationListCount(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"search_t07_case_applicationListCount",
				t07_case_application);
		return iCount.intValue();
	}
	/**
	 * LP
	 * @param sqlMap
	 * @param app
	 * @return
	 * @throws SQLException
	 */
	public T07_case_application getT07_case_applicationDisp(
			SqlMapClient sqlMap, T07_case_application app) throws SQLException {
		T07_case_application caseapp = (T07_case_application) sqlMap
				.queryForObject("getT07_case_applicationDisp", app);
		//		 获取页面上需要的下拉菜单信息
		// 可疑级别
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");
		if (caseapp == null)
			caseapp = new T07_case_application();
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
	
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		// 案例级别
		LinkedHashMap caselevelMap = cm.getMapFromCache("caselevel");
		// 案例种类
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		//币种
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		// 机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if (caseapp.getApp_dt() != null) {
			caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp
					.getApp_dt()));
		}
		if (caseapp.getCase_date() != null) {
			caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp
					.getCase_date()));
		}
		if (caseapp.getCase_kind() != null
				&& !"".equals(caseapp.getCase_kind())) {
			caseapp.setCase_kind_disp((String) casecagetoryMap.get(caseapp
					.getCase_kind()));
		}
		

		if (caseapp.getApp_state_cd() != null
				&& !"".equals(caseapp.getApp_state_cd())) {
			caseapp.setApp_state_cd_s((String) casestatusMap.get(caseapp.getApp_state_cd()));
		}
	
		if (caseapp.getCast_type() != null
				&& !"".equals(caseapp.getCast_type())) {
			caseapp.setCast_type_disp((String) casetypeMap.get(caseapp
					.getCast_type()));
		}
		if (caseapp.getCase_level() != null
				&& !"".equals(caseapp.getCase_level())) {
			caseapp.setCase_leval_disp((String) caselevelMap.get(caseapp
					.getCase_level()));
		}
		if(caseapp.getTran_amt()!=null){
			MoneyUtils mUtils = new MoneyUtils();
		  String money = mUtils.FormatMoney(caseapp.getTran_amt().toString());
		  caseapp.setTrans_amt(money);
		}
		if (caseapp.getCurr_cd() != null && !"".equals(caseapp.getCurr_cd())) {
			caseapp.setCurrency_cd_disp((String) curr_cdMap.get(caseapp
					.getCurr_cd()));
			caseapp.setApp_org_name((String) organMap.get(caseapp
					.getApp_org_id()));
		}
		if (caseapp.getAlert_level() != null
				&& !"".equals(caseapp.getAlert_level())) {
			caseapp.setAlert_level_disp((String) alert_leverMap.get(caseapp
					.getAlert_level()));
		}

		if (app.getCasesearchtime() != null && !"".equals(app.getCasesearchtime())) {
			caseapp.setCasesearchtime(app.getCasesearchtime());
		}
		if(caseapp.getDate_status_cd()!=null){
			if(caseapp.getDate_status_cd().equals("1")){
				caseapp.setDate_status_cd("人工新增");
			}else if(caseapp.getDate_status_cd().equals("2")){
				caseapp.setDate_status_cd("系统筛选");
			}
		}
		return caseapp;
	}
	public ArrayList getT07_case_application_exportList(
			SqlMapClient sqlMap, T07_case_application t07_case_application,int iStartRec, int iPageSize) throws SQLException {
		ArrayList caseappList = (ArrayList) sqlMap.queryForList("getT07_case_applicationexportList", t07_case_application,iStartRec,iPageSize);
		
		ArrayList list=new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");// 可疑级别
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
	
		// 案例种类
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");//币种
		LinkedHashMap organMap = cm.getMapFromCache("organ");// 机构
		LinkedHashMap union_organMap = cm.getMapFromCache("t87_union_organ");// 机构地区对应码
		//数据性质
	
		LinkedHashMap postMap = cm.getMapFromCache("post");
		LinkedHashMap t07_n_moveMap = cm.getMapFromCache("t07_n_moveList");// 所有操作对应表
		//LinkedHashMap is_menuMap = cm.getMapFromCache("status");// 是否
		//LinkedHashMap date_status_cdMap = cm.getMapFromCache("date_status"); //数据性质：人工新增 2：系统筛选
	  for(int i=0;i<caseappList.size();i++){
		  T07_case_party_trans caseapp = (T07_case_party_trans) caseappList.get(i);
		if( caseapp.getParty_class_cd() != null){
			caseapp.setParty_class_cd((String)clienttypeMap.get(caseapp.getParty_class_cd()));
		}

		if (caseapp.getCase_date() != null) {
			caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp
					.getCase_date()));
		}
	
		if (caseapp.getCase_kind() != null
				&& !"".equals(caseapp.getCase_kind())) {
			caseapp.setCase_kind((String) casecagetoryMap.get(caseapp
					.getCase_kind()));
		}
//		if (caseapp.getApp_state_cd() != null
//				&& !"".equals(caseapp.getApp_state_cd())) {
//			caseapp.setApp_state_cd((String) casestatusMap.get(caseapp
//					.getApp_state_cd()));
//		}
		if (caseapp.getApp_state_cd() != null
				&& !"".equals(caseapp.getApp_state_cd())) {
			String status_cd=caseapp.getApp_state_cd();
		
			caseapp.setApp_state_cd((String) casestatusMap.get(status_cd));
		}
	
		if (caseapp.getCase_level() != null
				&& !"".equals(caseapp.getCase_level())) {
			caseapp.setCase_level((String) alert_leverMap.get(caseapp
					.getCase_level()));
		}
		if (caseapp.getCurr_cd() != null && !"".equals(caseapp.getCurr_cd())) {
			caseapp.setCurr_cd((String) curr_cdMap.get(caseapp
					.getCurr_cd()));
		}
		if(caseapp.getApp_org_id() != null && !"".equals(caseapp.getApp_org_id())){
			caseapp.setApporganname((String) organMap.get(caseapp
					.getApp_org_id()));
			caseapp.setUnion_organ((String) union_organMap.get(caseapp
					.getApp_org_id()));
		}
//		if (t07_case_application.getCasesearchtime() != null && !"".equals(t07_case_application.getCasesearchtime())) {
//			caseapp.setApp_state_cd((String) casesearchtimeMap.get(t07_case_application.getCasesearchtime()));
//		}
		if(caseapp.getCurr_post() != null && !caseapp.getCurr_post().equals("")){
			   String curr_post=caseapp.getCurr_post();
				if(caseapp.getCurr_oper_id() != null && !caseapp.getCurr_oper_id().equals("")){
					caseapp.setLast_upd_dt_disp(DateUtils.dateToStringShort(caseapp.getLast_upd_dt()));
					caseapp.setCurr_oper_id((String)t07_n_moveMap.get(caseapp.getCurr_oper_id()));
				}
				caseapp.setCurr_post((String)postMap.get(curr_post));
			
		}

		list.add(caseapp);
	  }
		return list;
	}
	public ArrayList getT07_case_transList(SqlMapClient sqlMap,T07_case_application t07_case_application, int iStartRec,
			int iPageSize) throws SQLException {
		String sqlstr="getT07_case_partytransList";
		if(t07_case_application.getCasesearchtime().equals("1")){
			if(t07_case_application.getParty_class_cd().equals("I")){
				sqlstr="getT07_case_partytransListI";
			}else{
				sqlstr="getT07_case_partytransListC";
			}
				
		}
		ArrayList t07_case_transList = (ArrayList) sqlMap.queryForList(
				sqlstr, t07_case_application,iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap alert_leverMap = cm.getMapFromCache("caselevel");
		LinkedHashMap receive_pay_cdMap = cm.getMapFromCache("receive_pay");
		LinkedHashMap opp_organ_typeMap = cm.getMapFromCache(
				"cfct_hash"); // 对手行行号类型
		LinkedHashMap tx_typeMap = cm.getMapFromCache("tradetype"); // 交易类型
		LinkedHashMap currMap = cm.getMapFromCache("curr_cd");
		//LinkedHashMap aml_tx_cdMap = cm.getMapFromCache("aml_tx_cd");
		LinkedHashMap transstateMap = cm.getMapFromCache("casestatus");//交易状态
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");//现/转标志
		LinkedHashMap union_organMap = cm.getMapFromCache("t87_union_organ");// 机构地区对应码
		LinkedHashMap t87_pbc_gjfsMap = cm.getMapFromCache(
				"t87_pbc_gjfs"); // 交易方式
		LinkedHashMap t87_pbc_gjfsMap1 = cm.getMapFromCache("t87_pbc_gjfs5");
		LinkedHashMap t07_n_moveMap = cm.getMapFromCache("t07_n_moveList");// 所有操作对应表
		LinkedHashMap postMap = cm.getMapFromCache("post");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		LinkedHashMap opp_acct_type_cdMap = cm.getMapFromCache("pbc_catp");
		LinkedHashMap pbc_ctvc_cMap = cm.getMapFromCache("pbc_ctvc_c"); //行业
		LinkedHashMap pbc_ctvc_iMap = cm.getMapFromCache("pbc_ctvc_i"); //职业
//		 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
		
		//MoneyUtils mUtils = new MoneyUtils();

		for (int i = 0; i < t07_case_transList.size(); i++) {
			T07_case_party_trans t47_transaction = (T07_case_party_trans) t07_case_transList.get(i);
			if (t47_transaction.getOrgankey() != null) {
				t47_transaction.setOrganName((String) organMap.get(t47_transaction.getOrgankey()));
				t47_transaction.setUnion_organ((String) union_organMap.get(t47_transaction.getOrgankey()));
			}
			if (t47_transaction.getApp_org_id()!= null) {
				t47_transaction.setApporganname((String) organMap.get(t47_transaction.getApp_org_id()));
				
			}
			if (t47_transaction.getOpp_organkey()!= null) {
				t47_transaction.setOpp_organname((String) organMap.get(t47_transaction.getOpp_organkey()));
				
			}
			if(t47_transaction.getOpp_area()!=null){
				t47_transaction.setOpp_area((String) union_organMap.get(t47_transaction.getOpp_area()));
			}
			if(t47_transaction.getOpp_organ_type()!=null){
				t47_transaction.setOpp_organ_type((String) opp_organ_typeMap.get(t47_transaction.getOpp_organ_type()));
			}
			if(t47_transaction.getOpp_acct_type_cd()!=null){
				t47_transaction.setOpp_acct_type_cd((String) opp_acct_type_cdMap.get(t47_transaction.getOpp_acct_type_cd()));
			}
			if (t47_transaction.getTx_dt() != null) {
				t47_transaction.setTx_dt_disp(DateUtils.dateToStringShort(t47_transaction.getTx_dt()));
			}
			if (t47_transaction.getCase_date() != null) {
				t47_transaction.setCase_date_disp(DateUtils.dateToStringShort(t47_transaction.getCase_date()));
			}
			if (t47_transaction.getSettle_type_cd() != null) {
				if(t47_transaction.getCurr_cd().equals("1")){
				t47_transaction.setSettle_type_cd((String) t87_pbc_gjfsMap.get(t47_transaction.getSettle_type_cd()));
				}else{
				t47_transaction.setSettle_type_cd((String) t87_pbc_gjfsMap1.get(t47_transaction.getSettle_type_cd()));
				}
			}
		
			if (t47_transaction.getCurr_cd() != null) {
				t47_transaction.setCurr_cd((String) currMap.get(t47_transaction.getCurr_cd()));
			}
			if (t47_transaction.getCase_level()!= null) {
				t47_transaction.setCase_level((String) alert_leverMap.get(t47_transaction.getCase_level()));
			}
			if (t47_transaction.getCard_type() != null) {
				if(!t47_transaction.getCard_type().equals("19") && !t47_transaction.getCard_type().equals("29")){
				t47_transaction.setCard_type((String) card_typeMap.get(t47_transaction.getCard_type() ));
				}
			}
			if (t47_transaction.getAgent_card_type() != null) {
				if(!t47_transaction.getAgent_card_type().equals("19") && !t47_transaction.getAgent_card_type().equals("29")){
				t47_transaction.setAgent_card_type((String) card_typeMap.get(t47_transaction.getAgent_card_type() ));
				}
			}
			if (t47_transaction.getOpp_card_type() != null) {
				if(!t47_transaction.getOpp_card_type().equals("19") && !t47_transaction.getOpp_card_type().equals("29")){
				t47_transaction.setOpp_card_type((String) card_typeMap.get(t47_transaction.getOpp_card_type() ));
				}
			}
			if (t47_transaction.getParty_class_cd() != null) {
		
					if(t47_transaction.getParty_class_cd().equals("I")){
					  if(t47_transaction.getOccupation()!=null && !t47_transaction.getOccupation().equals("")){	
							t47_transaction.setOccupation((String)pbc_ctvc_iMap.get(t47_transaction.getOccupation()));		
						
					}
					}else{
						if(t47_transaction.getIndustrykey()!=null && !t47_transaction.getIndustrykey().equals("")){
							t47_transaction.setOccupation((String)pbc_ctvc_cMap.get(t47_transaction.getIndustrykey()));
						}
					}
			
				t47_transaction.setParty_class_cd((String) clienttypeMap.get(t47_transaction.getParty_class_cd() ));
				
			}
//			if (t47_transaction.getTx_cd() != null) {
//				t47_transaction.setTx_cd((String) aml_tx_cdMap.get(t47_transaction.getTx_cd()));
//			}
			
			if (t47_transaction.getTx_type_cd() != null) {
				t47_transaction.setTx_type_cd((String) tx_typeMap.get(t47_transaction.getTx_type_cd()));
			}
			if (t47_transaction.getReceive_pay_cd() != null) {
				t47_transaction.setReceive_pay_cd((String)receive_pay_cdMap.get(t47_transaction.getReceive_pay_cd()));
			}
			
			if (t47_transaction.getCountry_cd() != null) {
				t47_transaction.setCountry_cd((String) countryMap.get(t47_transaction.getCountry_cd()));
			}
			if (t47_transaction.getAgent_country() != null) {
				t47_transaction.setAgent_country((String) countryMap.get(t47_transaction.getAgent_country()));
			}
			if (t47_transaction.getHandle_status_cd() != null) {
				t47_transaction.setHandle_status_cd((String) transstateMap.get(t47_transaction.getHandle_status_cd()));
			}
			if (t47_transaction.getCash_trans_flag() != null) {
				t47_transaction.setCash_trans_flag_disp((String) goflagMap.get(t47_transaction.getCash_trans_flag()));
			}
	
			if (t47_transaction.getApp_state_cd() != null
					&& !"".equals(t47_transaction.getApp_state_cd())) {
				String status_cd=t47_transaction.getApp_state_cd();
				t47_transaction.setApp_state_cd((String) casestatusMap.get(status_cd));
			}
			
			if(t47_transaction.getCurr_post() != null && !t47_transaction.getCurr_post().equals("")){
				   String curr_post=t47_transaction.getCurr_post();
					if(t47_transaction.getCurr_oper_id() != null && !t47_transaction.getCurr_oper_id().equals("")){
						t47_transaction.setLast_upd_dt_disp(DateUtils.dateToStringShort(t47_transaction.getLast_upd_dt()));
						t47_transaction.setCurr_oper_id((String)t07_n_moveMap.get(t47_transaction.getCurr_oper_id()));
					}
					t47_transaction.setCurr_post((String)postMap.get(curr_post));
				
			}
			list.add(t47_transaction);
		}
		return list;
	}
	public ArrayList getT07_stcr_partySearch(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_partyList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_partyList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");   //客户类型
		LinkedHashMap partystateMap = cm.getMapFromCache("casestatus");//客户处理状态

		for (int i = 0; i < t07_stcr_partyList.size(); i++) {
			T47_party t47_party = (T47_party) t07_stcr_partyList.get(i);
			if (t47_party.getParty_status() != null) {
				t47_party.setParty_status_disp((String) partystateMap.get(t47_party.getParty_status()));
			}
			if (t47_party.getParty_class_cd() != null) {
				t47_party.setParty_class_cd_disp((String) clienttypeMap.get(t47_party.getParty_class_cd()));
			}
			list.add(t47_party);
		}
		return list;
	}
	
	public int getT07_stcr_partyCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_stcr_partyListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public ArrayList getT07_stcr_acctSearch(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_acctList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_acctList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap acctstateMap = cm.getMapFromCache("casestatus");//帐户状态
		LinkedHashMap stateMap = cm.getMapFromCache("casestatus");//帐户处理状态
		
		for (int i = 0; i < t07_stcr_acctList.size(); i++) {
			T47_agreement t47_agreement = (T47_agreement) t07_stcr_acctList.get(i);
			if (t47_agreement.getOrgankey() != null) {
				t47_agreement.setOrganName((String) organMap.get(t47_agreement.getOrgankey()));
			}
			if (t47_agreement.getOpen_dt() != null) {
				t47_agreement.setOpen_dt_disp(DateUtils.dateToStringShort(t47_agreement.getOpen_dt()));
			}
			if (t47_agreement.getClose_dt() != null) {
				t47_agreement.setClose_dt_disp(DateUtils.dateToStringShort(t47_agreement.getClose_dt()));
			}
			if (t47_agreement.getAcct_status_cd() != null) {
				t47_agreement.setAcct_status_cd_disp((String) acctstateMap.get(t47_agreement.getAcct_status_cd()));
			}
			if (t47_agreement.getAcct_status() != null) {
				t47_agreement.setAcct_status_disp((String) stateMap.get(t47_agreement.getAcct_status()));
			}
			list.add(t47_agreement);
		}
		return list;
	}
	
	public int getT07_stcr_acctCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_stcr_acctListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public String getReportKeyByMsg(SqlMapClient sqlMap,T07_case_application caseApp)throws SQLException {
		ArrayList list=(ArrayList)sqlMap.queryForList("getReportKeyByMsg", caseApp);
		String keys="";
		for(int i=0;i<list.size();i++){
			keys=","+"'"+list.get(i)+"'";
		}
		if(keys.length()>0){
			keys=keys.substring(1);
		}
		return keys;
	}
}