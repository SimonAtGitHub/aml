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
import java.util.TreeMap;



import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T47_transaction_ms;
import com.ist.aml.report.dao.T07_case_applicationDAO;

import com.ist.aml.report.dto.T07_case_application;

import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;


public class T07_ReportSearch_msDAO extends T07_case_applicationDAO {

	public T07_ReportSearch_msDAO() {
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
	public ArrayList getT47_transactionList_bs(SqlMapClient sqlMap,
			T07_case_application t07_case_application, int iStartRec,
			int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_transacionList_msbs", t07_case_application, iStartRec,
				iPageSize);
		ArrayList t07_transacionList = new ArrayList();
		
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay");
		LinkedHashMap casekindMap = cm.getMapFromCache("casecagetory1");
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
		LinkedHashMap currMap = cm.getMapFromCache("currency");
		LinkedHashMap accttypeMap = cm.getMapFromCache("pbc_catp");
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T47_transaction_ms caseapp = (T47_transaction_ms) iter.next();
			if (caseapp.getOverarea_ind() != null && !"".equals(caseapp.getOverarea_ind()))
			{
			if ("1".equals(caseapp.getOverarea_ind()))
				caseapp.setOverarea_ind("跨境");
			else caseapp.setOverarea_ind("非跨境");
			}
		if (caseapp.getCash_trans_flag() != null && !"".equals(caseapp.getCash_trans_flag()))
		{
		if ("1".equals(caseapp.getCash_trans_flag()))
			caseapp.setCash_trans_flag("现金");
		else caseapp.setCash_trans_flag("转账");
		}
			if (caseapp.getOpp_acct_type_cd() != null && !"".equals(caseapp.getOpp_acct_type_cd()))
				caseapp.setOpp_acct_type_cd((String) accttypeMap.get(caseapp
						.getOpp_acct_type_cd()));
			if (caseapp.getTx_dt() != null)
				caseapp.setTx_dt_disp(DateUtils.dateToStringShort(caseapp
						.getTx_dt()));
			
			//设置案例的筛选日期
			if (caseapp.getCase_date() != null)
				caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp.getCase_date()));
			
			if (caseapp.getOrgankey() != null
					&& !"".equals(caseapp.getOrgankey()))
				caseapp.setOrganName((String) organMap.get(caseapp
						.getOrgankey()));
			if (caseapp.getReceive_pay_cd() != null)
				caseapp.setReceive_pay_cd_disp((String)receive_payMap.get(caseapp.getReceive_pay_cd()));
			if (caseapp.getAmt() != null && caseapp.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(caseapp.getAmt()
						.doubleValue());
				caseapp.setAmt_disp(money);
			}
			if (caseapp.getCase_kind() != null && !"".equals(caseapp.getCase_kind()))
				caseapp.setCase_kind((String) casekindMap.get(caseapp
						.getCase_kind()));
			if (caseapp.getApp_state_cd() != null && !"".equals(caseapp.getApp_state_cd()))
				caseapp.setApp_state_cd((String) casestatusMap.get(caseapp
						.getApp_state_cd()));
			if (caseapp.getDate_status_cd() != null && !"".equals(caseapp.getDate_status_cd()))
				
				{if("1".equalsIgnoreCase(caseapp.getDate_status_cd()))
					caseapp.setDate_status_cd("人工新增");
				if("2".equalsIgnoreCase(caseapp.getDate_status_cd()))
					caseapp.setDate_status_cd("系统生成");
				}
			if (caseapp.getCurrency_cd() != null) {
			
				caseapp.setCurrency_cd_disp((String) currMap.get(caseapp
						.getCurrency_cd()));
			}
			if(caseapp.getStaffkey() != null){
				caseapp.setStaff_ind_disp("是");
			}else{
				caseapp.setStaff_ind_disp("否");
			}
			t07_transacionList.add(caseapp);
		}
		return t07_transacionList;
	}
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int getT07_transacionListCount_bs(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_transacionListCount_msbs", t07_case_application);
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
	
	public ArrayList getT47_transactionList_bh(SqlMapClient sqlMap,
			T07_case_application t07_case_application, int iStartRec,
			int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_transacionList_msbh", t07_case_application, iStartRec,
				iPageSize);
		ArrayList t07_transacionList = new ArrayList();
		
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay");
		LinkedHashMap casekindMap = cm.getMapFromCache("casecagetory1");
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
		LinkedHashMap currMap = cm.getMapFromCache("currency");
		LinkedHashMap accttypeMap = cm.getMapFromCache("pbc_catp");
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T47_transaction_ms caseapp = (T47_transaction_ms) iter.next();
			if (caseapp.getOverarea_ind() != null && !"".equals(caseapp.getOverarea_ind()))
				{
				if ("1".equals(caseapp.getOverarea_ind()))
					caseapp.setOverarea_ind("跨境");
				else caseapp.setOverarea_ind("非跨境");
				}
			if (caseapp.getCash_trans_flag() != null && !"".equals(caseapp.getCash_trans_flag()))
			{
			if ("1".equals(caseapp.getCash_trans_flag()))
				caseapp.setCash_trans_flag("现金");
			else caseapp.setCash_trans_flag("转账");
			}
			if (caseapp.getOpp_acct_type_cd() != null && !"".equals(caseapp.getOpp_acct_type_cd()))
				caseapp.setOpp_acct_type_cd((String) accttypeMap.get(caseapp
						.getOpp_acct_type_cd()));
			if (caseapp.getTx_dt() != null)
				caseapp.setTx_dt_disp(DateUtils.dateToStringShort(caseapp
						.getTx_dt()));
			if (caseapp.getOrgankey() != null
					&& !"".equals(caseapp.getOrgankey()))
				caseapp.setOrganName((String) organMap.get(caseapp
						.getOrgankey()));
			if (caseapp.getTx_dt() != null)
				caseapp.setReceive_pay_cd_disp((String)receive_payMap.get(caseapp.getReceive_pay_cd()));
			if (caseapp.getAmt() != null && caseapp.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(caseapp.getAmt()
						.doubleValue());
				caseapp.setAmt_disp(money);
			}
			if (caseapp.getCase_kind() != null && !"".equals(caseapp.getCase_kind()))
				caseapp.setCase_kind((String) casekindMap.get(caseapp
						.getCase_kind()));
			if (caseapp.getApp_state_cd() != null && !"".equals(caseapp.getApp_state_cd()))
				caseapp.setApp_state_cd((String) casestatusMap.get(caseapp
						.getApp_state_cd()));
			if (caseapp.getDate_status_cd() != null && !"".equals(caseapp.getDate_status_cd()))
				
				{if("1".equalsIgnoreCase(caseapp.getDate_status_cd()))
					caseapp.setDate_status_cd("人工新增");
				if("2".equalsIgnoreCase(caseapp.getDate_status_cd()))
					caseapp.setDate_status_cd("系统生成");
				}
			if (caseapp.getCurrency_cd() != null) {
				
				caseapp.setCurrency_cd_disp((String) currMap.get(caseapp
						.getCurrency_cd()));
		
			}
				if(caseapp.getStaffkey() != null){
					caseapp.setIs_staff("是");
				}else{
					caseapp.setIs_staff("否");
				}
			t07_transacionList.add(caseapp);
		}
		return t07_transacionList;
	}
	/**
	 * lp
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int getT07_transacionListCount_bh(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_transacionListCount_msbh", t07_case_application);
		return iCount.intValue();
	}
	
	
	public ArrayList search_allbsT07_case_applicationList(
			SqlMapClient sqlMap, T07_case_application t07_case_application,
			int iStartRec, int iPageSize) throws SQLException {
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"search_allbsT07_case_applicationList", t07_case_application,
				iStartRec, iPageSize);
		Iterator iter = list.iterator();
		//		 获取页面上需要的下拉菜单信息
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
//		 案例状态(已上报、未上报)
		LinkedHashMap casesearchtimeMap = cm.getMapFromCache("casesearchtime");
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

			if (caseapp.getApp_state_cd() != null
					&& !"".equals(caseapp.getApp_state_cd())) {
				caseapp.setApp_state_cd_s((String) casestatusMap.get(caseapp
						.getApp_state_cd()));
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
	public int search_allbsT07_case_applicationListCount(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"search_allbsT07_case_applicationListCount",
				t07_case_application);
		return iCount.intValue();
	}
}