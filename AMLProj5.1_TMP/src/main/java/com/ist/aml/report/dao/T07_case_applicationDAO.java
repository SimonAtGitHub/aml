/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-27   青蛙		创建  
 */

package com.ist.aml.report.dao;

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
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;

import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.aml.pbcreport.dto.T47_agreement;
import com.ist.aml.report.dto.CreditTask;

import com.ist.aml.report.dto.T07_app_movefate;

import com.ist.aml.report.dto.T07_case_alert_advi;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_feature;
import com.ist.aml.report.dto.T07_case_module;
import com.ist.aml.report.dto.T47_party;

import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T07_case_transaction;

import com.ist.aml.rule.dao.T03_entity_kindDAO;
import com.ist.aml.rule.dto.T03_entity_kind;
import com.ist.aml.report.dto.T10_check_cust_ke;
import com.ist.aml.report.dto.T47_transaction;

import com.ist.common.base.BaseDAO;

import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;


/**
 * @author Administrator
 *
 */
public class T07_case_applicationDAO extends BaseDAO {


	/**
	 * 构造函数
	 */
	public T07_case_applicationDAO() {
	}
	
	public ArrayList getN_mt_restrictList(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getN_mt_restrictList", credittask);

		return list;
	}
	public ArrayList getTaskList(SqlMapClient sqlMap,
			CreditTask credittask) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getTaskList", credittask);

		return list;
	}
	
	public int modifyT07_case_appstatus(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		int i = sqlMap.update("modifyT07_case_appstatus", t07_case_application);
		return i;
	}

		public int modifyBatchT07_case_appstatus2(SqlMapClient sqlMap,
				T07_case_application t07_case_application) throws SQLException {
			int i = sqlMap.update("modifyBatchT07_case_appstatus2",
					t07_case_application);
			return i;
		}
		public int modifyBatchT07_case_appstatus1(SqlMapClient sqlMap,
				T07_case_application t07_case_application) throws SQLException {
			int i = sqlMap.update("modifyBatchT07_case_appstatus1",
					t07_case_application);
			return i;
		}
		public int modifyBatchT07_case_appstatus(SqlMapClient sqlMap,
				T07_case_application t07_case_application) throws SQLException {
			int i = sqlMap.update("modifyBatchT07_case_appstatus",
					t07_case_application);
			return i;
		}
		public int modifyBatchT07_reportstatus(SqlMapClient sqlMap,
				T07_case_application t07_case_application) throws SQLException {
			int i = sqlMap.update("modifyBatchT07_reportstatus",
					t07_case_application);
			return i;
		}


    /**
     * 修改案例流转表状态
     * @param sqlMap
     * @param t07_case_application
     * @return
     * @throws SQLException
     */
	public int modifyT07_app_movefate2(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		int i = sqlMap.update("modifyT07_app_movefate2", t07_case_application);
		return i;
	}
	
	public int updateT07_case_partyStatus(SqlMapClient sqlMap,
			T07_case_application t07_case_application)
	throws SQLException {
		int i = sqlMap.update("updateT07_case_partyStatus",
				t07_case_application);
		return i;
	}
	
	public ArrayList getCase_advi(SqlMapClient sqlMap,T07_app_movefate t07_app_movefate) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getCase_advi",t07_app_movefate);
		return list;
	}
	public int modifyApp_movefate(SqlMapClient sqlMap,
			T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("modifyApp_movefate", t07_app_movefate);
		return i;
	}
	
	public int insertApp_movefate(SqlMapClient sqlMap,
			T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("insertApp_movefate", t07_app_movefate);
		return i;
	}
	public int modifyT07_case_stcr_status(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_stcr_status", t07_case_stcr);
		return i;
	}
	public int modifyT07_case_stcr_status1(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_stcr_status1", t07_case_stcr);
		return i;
	}
	public int modifyT07_case_party_status(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_party_status", t07_case_stcr);
		return i;
	}
	public int modifyT07_case_acct_status(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_acct_status", t07_case_stcr);
		return i;
	}
	public int modifyT07_stcr_trans_status(SqlMapClient sqlMap,
			T07_case_transaction t07_case_trans) throws SQLException {
		int i = sqlMap.update("modifyT07_stcr_trans_status", t07_case_trans);
		return i;
	}
	public int modifyT07_trans_uc_status1(SqlMapClient sqlMap,T07_case_transaction t07_case_trans) throws SQLException {
		int i = sqlMap.update("modifyT07_trans_uc_status1", t07_case_trans);
		return i;
	}
	
	public void updatet47_trans_uc(T07_case_transaction  t07_case_trans,SqlMapClient sqlMap)throws Exception{
		/** 3. 修改当前交易表中的交易状态 */
		String trans = "";
		ArrayList list = new ArrayList();
		// 查询所有排除的交易
		t07_case_trans.setStatus_cd("4");
		list = getT07_stcr_trans_notList2(sqlMap, t07_case_trans);

		if (list != null && list.size() > 0) {
			ArrayList list1 = new ArrayList();
			int num = list.size();
			if (list.size() > 1000)
				num = 1000;
			for (int i = 0; i < num; i++) {
				String trankey = (String) list.get(i);
				trans += "'" + trankey + "',";
				list1.add(trankey);
			}

			ArrayList t07_transList = new ArrayList();
			if (trans != null && !trans.equals("")) {
				trans = trans.substring(0, trans.length() - 1);
				t07_case_trans.setTrans(trans);
				// 查询不能被排除的交易
				t07_transList = getT07_stcr_trans_notList1(sqlMap,
						t07_case_trans);
				if (t07_transList != null && t07_transList.size() > 0) {
					list1.removeAll(t07_transList);
				}

			}

			trans = "";

			for (int i = 0; i < list1.size(); i++) {
				String trankey = (String) list1.get(i);
				trans += "'" + trankey + "',";
			}

			if (trans != null && !trans.equals("")) {
				trans = trans.substring(0, trans.length() - 1);
				t07_case_trans.setTrans(trans);
				modifyT07_trans_uc_status(sqlMap, t07_case_trans);
			}
		}
	}
	
	public ArrayList getT07_stcr_trans_notList2(SqlMapClient sqlMap,T07_case_transaction t07_case_trans)throws SQLException {
		ArrayList t07_stcr_transList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_trans_notList2", t07_case_trans);
		return t07_stcr_transList;
	}
	public ArrayList getT07_stcr_trans_notList1(SqlMapClient sqlMap,T07_case_transaction t07_case_trans)throws SQLException {
		ArrayList t07_stcr_transList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_trans_notList1", t07_case_trans);
		return t07_stcr_transList;
	}
	public int modifyT07_trans_uc_status(SqlMapClient sqlMap,T07_case_transaction t07_case_trans) throws SQLException {
		int i = sqlMap.update("modifyT07_trans_uc_status", t07_case_trans);
		return i;
	}
	public ArrayList getT07_stcrList(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {	//modify by 20130814
		ArrayList t07_stcrList = (ArrayList) sqlMap.queryForList(
				"getCase_stcrList1", t07_case_stcr);
		ArrayList stcrList = new ArrayList();
		LinkedHashMap statusMap = cm.getMapFromCache("casestatus");
		
		LinkedHashMap pbcruleMap = null;
		if("1".equals(t07_case_stcr.getCase_type())){
			pbcruleMap=cm.getMapFromCache("pbcrulerh_de");// 交易特征码
		}else
		{
			pbcruleMap=cm.getMapFromCache("pbcrulerh_ky");
		}
		Iterator iter = t07_stcrList.iterator();
		
		while (iter.hasNext()) {
			T07_case_stcr stcr = (T07_case_stcr) iter.next();
			if("1".equals(t07_case_stcr.getCase_type())){
			    stcrList.add("客户号："+stcr.getParty_id()+"  大额特征:"+stcr.getStcr() + "(" + (String) pbcruleMap.get(stcr.getStcr())+")");
			}else{
				String str=stcr.getStcr() + "    " + (String) pbcruleMap.get(stcr.getStcr());
				if(!stcrList.contains(str)){
				stcrList.add(str);
				}
			}
		}
		return stcrList;
	}

	public ArrayList getT07_stcrList(SqlMapClient sqlMap, T07_case_stcr t07_case_stcr,int iStartRec,int iPageSize)	throws SQLException {
		ArrayList t07_stcrList = (ArrayList) sqlMap.queryForList("getCase_stcrList", t07_case_stcr,iStartRec,iPageSize);
		
		ArrayList gstype_list = new ArrayList();
		
		LinkedHashMap statusMap = cm.getMapFromCache("casestatus");
//		LinkedHashMap t21_pbcruleMap = cm.getMapFromCache("t21_pbcrule");
		LinkedHashMap pbcruleMap = null;
		if("1".equals(t07_case_stcr.getCase_type())){
			pbcruleMap=cm.getMapFromCache("pbcrulerh_de");// 交易特征码
		}else
		{
			pbcruleMap=cm.getMapFromCache("pbcrulerh_ky");
		}
		
		Iterator iter = t07_stcrList.iterator();
		while (iter.hasNext()) {
			T07_case_stcr stcr = (T07_case_stcr) iter.next();
			String key = stcr.getStcr();
			
//			if(t21_pbcruleMap.containsKey(key))
//				stcr.setTag("2");
//			else
//				stcr.setTag("1");
			
			/** 1.来源于规则，2.来源于模型*/
			if(stcr.getFlag().equals("1"))
			{
				if (stcr.getStcr() != null
						&& !"".equals(stcr.getStcr())) {
					stcr.setStcr_disp((String) pbcruleMap.get(stcr.getStcr()));
				}
				if (stcr.getStatus() != null
						&& !"".equals(stcr.getStatus())) {
					stcr.setStatus_disp((String) statusMap.get(stcr.getStatus()));
				}
			}
		}
		return t07_stcrList;
	}

	public int getT07_stcrListCount(SqlMapClient sqlMap, T07_case_stcr t07_case_stcr)	throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getCase_stcrListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public ArrayList getT07_case_adviList(SqlMapClient sqlMap,
			T07_case_application t07_case_application, String application_num)
			throws SQLException {
		ArrayList getT07_case_adviList = (ArrayList) sqlMap.queryForList(
				"getCase_adviList", t07_case_application);
		if (!t07_case_application.getApplication_num().equals(application_num)) {
			t07_case_application.setApplication_num(application_num);
			ArrayList getT07_case_adviList1 = (ArrayList) sqlMap.queryForList(
					"getCase_adviList", t07_case_application);
			int length = getT07_case_adviList.size();
			for (int i = 0; i < getT07_case_adviList1.size(); i++) {
				getT07_case_adviList.add(length, getT07_case_adviList1.get(i));
			}
		}
		ArrayList list = new ArrayList();
		LinkedHashMap postMap = cm.getMapFromCache("post");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = getT07_case_adviList.iterator();
		while (iter.hasNext()) {
			T07_case_application caseapp = (T07_case_application) iter.next();
			if (caseapp.getCurr_post() != null
					&& !"".equals(caseapp.getCurr_post()))
				caseapp.setPost_name((String) postMap.get(caseapp
						.getCurr_post()));
			if (caseapp.getCurr_org() != null
					&& !"".equals(caseapp.getCurr_org()))
				caseapp.setOrganname((String) organMap.get(caseapp
						.getCurr_org()));
			list.add(caseapp);
		}
		return list;
	}
	
	public ArrayList getT07_stcr_partyList(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_partyList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_partyList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");   //客户类型
		LinkedHashMap partystateMap = cm.getMapFromCache("casestatus");//客户处理状态
		
        String cast_type=t07_case_stcr.getCase_type();
		for (int i = 0; i < t07_stcr_partyList.size(); i++) {
			T47_party t47_party = (T47_party) t07_stcr_partyList.get(i);
			if (t47_party.getParty_status() != null) {
				t47_party.setParty_status_disp((String) partystateMap.get(t47_party.getParty_status()));
			}
			if (t47_party.getParty_class_cd() != null) {
				t47_party.setParty_class_cd_disp((String) clienttypeMap.get(t47_party.getParty_class_cd()));
			}
			String validate_ind="0";
			if(cast_type.equals("1")){
				validate_ind=t47_party.getValidate_ind();
			}else{
				validate_ind=t47_party.getValidate_ind2();
			}
			if(validate_ind!=null){
				t47_party.setValidate(validate_ind);
			}
			list.add(t47_party);
		}
		return list;
	}
	
	public int getT07_stcr_partyListCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_stcr_partyListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public ArrayList getT07_stcr_acctList(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_acctList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_acctList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
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
			if (t47_agreement.getAcct_status() != null) {
				t47_agreement.setAcct_status_disp((String) stateMap.get(t47_agreement.getAcct_status()));
			}
			list.add(t47_agreement);
		}
		return list;
	}
	
	public int getT07_stcr_acctListCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_stcr_acctListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public ArrayList getT07_stcr_transList(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_transList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_transList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap flagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap checkflagMap = cm.getMapFromCache("yesNo");
		LinkedHashMap currMap = cm.getMapFromCache("currency");
		LinkedHashMap transstateMap = cm.getMapFromCache("casestatus");//交易状态
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");//现/转标志
		MoneyUtils mUtils = new MoneyUtils();

		for (int i = 0; i < t07_stcr_transList.size(); i++) {
			T47_transaction t47_transaction = (T47_transaction) t07_stcr_transList.get(i);
			if (t47_transaction.getAmt() != null) {
				String money = mUtils.FormatMoney(t47_transaction.getAmt().doubleValue());
				t47_transaction.setAmt_disp(money);
			}
			if (t47_transaction.getOrgankey() != null) {
				t47_transaction.setOrganName((String) organMap.get(t47_transaction.getOrgankey()));
			}
			if (t47_transaction.getTx_dt() != null) {
				t47_transaction.setTx_dt_disp(DateUtils.dateToStringShort(t47_transaction.getTx_dt()));
			}
			if (t47_transaction.getDebit_credit() != null) {
				t47_transaction.setDebit_credit_disp((String) flagMap.get(t47_transaction.getDebit_credit()));
			}
			if (t47_transaction.getRe_ind() != null) {
				t47_transaction.setRe_ind_disp((String) checkflagMap.get(t47_transaction.getRe_ind()));
			}
			if (t47_transaction.getCash_trans_flag() != null) {
				t47_transaction.setCash_trans_flag_disp((String) goflagMap.get(t47_transaction.getCash_trans_flag()));
			}
			if (t47_transaction.getCurrency_cd() != null) {
				t47_transaction.setCurrency_cd_disp((String) currMap.get(t47_transaction.getCurrency_cd()));
			}
			if (t47_transaction.getStatus_cd() != null) {
				t47_transaction.setStatus_cd_disp((String) transstateMap.get(t47_transaction.getStatus_cd()));
			}
			list.add(t47_transaction);
		}
		return list;
	}
	public int getT07_stcr_transListCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_stcr_transListCount", t07_case_stcr);
		return iCount.intValue();
	}
	
	public T07_case_transaction getT07_case_transactionDisp(
			SqlMapClient sqlMap, T07_case_transaction t07_case_transaction1) throws SQLException {
		T07_case_transaction t07_case_transaction = (T07_case_transaction) sqlMap
				.queryForObject("getT07_case_transactionDisp", t07_case_transaction1);
		if (t07_case_transaction == null)
			t07_case_transaction = new T07_case_transaction();
		return t07_case_transaction;
	}
	public ArrayList getT07_stcr_trans_notList(SqlMapClient sqlMap,T07_case_transaction t07_case_trans)throws SQLException {
		ArrayList t07_stcr_transList = (ArrayList) sqlMap.queryForList(
				"getT07_stcr_trans_notList", t07_case_trans);
		return t07_stcr_transList;
	}
	public static ArrayList getT07_pbcruleList2(SqlMapClient sqlMap) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_pbcruleList2",null);
		return list;
	}
	
	public int modifyT07_case_stcr(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_stcr", t07_case_stcr);
		return i;
	}
	public int modifyT07_case_trans_stcr(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr) throws SQLException {
		int i = sqlMap.update("modifyT07_case_trans_stcr", t07_case_stcr);
		return i;
	}
	public int modifyCase_advi(SqlMapClient sqlMap,T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("modifyCase_advi", t07_app_movefate);
		return i;
	}
	public int insertCase_advi(SqlMapClient sqlMap,T07_app_movefate t07_app_movefate) throws SQLException {
		int i = sqlMap.update("insertCase_advi", t07_app_movefate);
		return i;
	}
	
	public T07_case_application getT07_writegrepList(SqlMapClient sqlMap,
			T07_case_application t07_case_application)
			throws SQLException {
		String party_id=t07_case_application.getParty_id();
		String ismenu="0";
		String isgrep="0";
		
		ArrayList t07_List = (ArrayList) sqlMap.queryForList(
				"gett07_lip_view", party_id);	
		Iterator iter = t07_List.iterator();
		while (iter.hasNext()) {
			T10_check_cust_ke lip = (T10_check_cust_ke) iter.next();
			String lipflag=lip.getLip_flag();
			if(lipflag!=null && lipflag.equals("1")){
				ismenu="1";
			}
			if(lipflag!=null && lipflag.equals("3")){
				isgrep="1";
			}
			
		}
		t07_case_application.setIs_menu(ismenu);
		t07_case_application.setIs_grey(isgrep);
		t07_case_application.setIs_staff("0");
		return t07_case_application;
	}
	
	public int insertT07_case_application_all_field(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		if (t07_case_application.getRecheck_num() == null)
			t07_case_application.setRecheck_num(Long.valueOf("0"));
		if(t07_case_application.getTran_count()==null){
			t07_case_application.setTran_count(Long.valueOf("0"));
		}
	
		int i = sqlMap.update("insertT07_case_application_all_field",
				t07_case_application);
		return i;
	}
	
	public ArrayList getT07_case_app_ky_list(SqlMapClient sqlMap,
			T07_case_application t07_case_application, int iStartRec,
			int iPageSize) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"searchT07_case_applicationList_new", t07_case_application,
				iStartRec, iPageSize);
		ArrayList list1 = new ArrayList();
	
	
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		// 案例级别
		LinkedHashMap caselevelMap = cm.getMapFromCache("caselevel");
		// 案例种类
		//LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory", true);
		//机构
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");//币种
		
		LinkedHashMap  postMap=cm.getMapFromCache("post");//岗位名称
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_case_application caseapp = (T07_case_application) iter.next();
			if (caseapp.getCase_date() != null) {
				caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp
						.getCase_date()));
			}
			if (caseapp.getApp_org_id() != null
					&& !"".equals(caseapp.getApp_org_id())) {
				caseapp.setApp_org_name((String) organMap.get(caseapp
						.getApp_org_id()));
			}
			if (caseapp.getCase_end_date() != null) {
				caseapp.setCase_end_date_disp(DateUtils
						.dateToStringShort(caseapp.getCase_end_date()));
			}
//			if (caseapp.getCase_kind() != null
//					&& !"".equals(caseapp.getCase_kind())) {
//				caseapp.setCase_kind_disp((String) casecagetoryMap.get(caseapp
//						.getCase_kind()));
//			}
//			if (caseapp.getApp_state_cd() != null
//					&& !"".equals(caseapp.getApp_state_cd())) {
//				caseapp.setApp_state_cd_s((String) casestatusMap.get(caseapp
//						.getApp_state_cd()));
//			}
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
			if (caseapp.getPost_id() != null
					&& !"".equals(caseapp.getPost_id())) {
				String post=caseapp.getPost_id();
				if(post.equals("4")){
					if(caseapp.getCurr_cd()!=null &&caseapp.getCurr_cd().equals("2")){
						post="P0304";
					}else{
						post="P0104";
					}
					caseapp.setPost_id(post);
				}
				caseapp.setPost_name((String) postMap.get(post));
			}

			if (caseapp.getCase_date()!= null	) {
				caseapp.setCase_date_disp(DateUtils.dateToStringShort(caseapp.getCase_date()));
			}
			list1.add(caseapp);
		}

		return list1;
	}
	
	public int searchT07_case_applicationListCount(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"searchT07_case_applicationListCount_new", t07_case_application);
		return iCount.intValue();
	}
	public int modifyT07_case_app_UHstatus(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		int i = sqlMap.update("modifyT07_case_app_UHstatus", t07_case_application);
		return i;
	}
	public int modifyT07_case_application(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		
		int i = sqlMap.update("modifyT07_case_application",
				t07_case_application);
		return i;
	}
	public T07_case_alert_advi getT07_case_stcr_adviDisp(SqlMapClient sqlMap,
			T07_case_alert_advi t07_case_alert_adv2) throws SQLException {
		T07_case_alert_advi t07_case_alert_advi = (T07_case_alert_advi) sqlMap
				.queryForObject("getT07_case_stcr_adviDisp",
						t07_case_alert_adv2);
		LinkedHashMap postMap = cm.getMapFromCache("post");
		if(t07_case_alert_advi != null){
			t07_case_alert_advi.setPost_name((String) postMap.get(t07_case_alert_advi.getPost_id()));
		}
		return t07_case_alert_advi;
	}
	
	public T07_case_alert_advi getT07_case_stcr_adviDisp1(SqlMapClient sqlMap,
			T07_case_alert_advi t07_case_alert_adv2) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_case_stcr_adviDisp1",
						t07_case_alert_adv2);
		T07_case_alert_advi t07_case_alert_advi= new T07_case_alert_advi(); 
		Iterator iter = list.iterator();
		if(iter.hasNext()) {
			t07_case_alert_advi= (T07_case_alert_advi) iter.next();
		}
		return t07_case_alert_advi;
	}
	
	public ArrayList getT07_case_stcr_adviList(SqlMapClient sqlMap,
			T07_case_alert_advi t07_case_alert_adv2) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_case_stcr_adviList",
						t07_case_alert_adv2);
		ArrayList list1 = new ArrayList();
		LinkedHashMap postMap = cm.getMapFromCache("post");
		LinkedHashMap opertypeMap = cm.getMapFromCache("opertype"); //操作类型
		Iterator iter = list.iterator();
		while(iter.hasNext()) {
			T07_case_alert_advi t07_case_alert_advi= (T07_case_alert_advi) iter.next();
			if(t07_case_alert_advi.getPost_id() != null && !t07_case_alert_advi.getPost_id().equals("")){
				t07_case_alert_advi.setPost_name((String) postMap.get(t07_case_alert_advi.getPost_id()));
			}
			if(t07_case_alert_advi.getOpertype() != null && !t07_case_alert_advi.getOpertype().equals("")){
				t07_case_alert_advi.setOpertype_disp((String) opertypeMap.get(t07_case_alert_advi.getOpertype()));
			}
			if (t07_case_alert_advi.getCreate_dt() != null) {
				t07_case_alert_advi.setCreate_dt_disp(DateUtils.dateToStringShort(t07_case_alert_advi.getCreate_dt()));
			}
			list1.add(t07_case_alert_advi);
		}
		return list1;
	}
	
	public int modifyT07_case_stcr_advi(SqlMapClient sqlMap,
			T07_case_alert_advi t07_case_alert_advi) throws SQLException {
		int i = sqlMap.update("modifyT07_case_stcr_advi", t07_case_alert_advi);
		return i;
	}
	
	/** 
	 * 插入操作 
	 * @param sqlMap SqlMapClient 
	 * @param t07_case_alert_advi T07_case_alert_advi 
	 * @throws SQLException   
	 * @return int  
	 */
	public int insertT07_case_stcr_advi(SqlMapClient sqlMap,
			T07_case_alert_advi t07_case_alert_advi) throws SQLException {
		int i = sqlMap.update("insertT07_case_stcr_advi", t07_case_alert_advi);
		return i;
	}
	
	public T07_case_application getT07_case_applicationDisp_assist(
			SqlMapClient sqlMap, T07_case_application t07_case_application) throws SQLException {
		T07_case_application caseapp = (T07_case_application) sqlMap
				.queryForObject("getT07_case_applicationDisp", t07_case_application);
		
		if (caseapp == null)
			caseapp = new T07_case_application();
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("casestatus");
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");// 可疑级别
		// 案例种类
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		//币种
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");//币种
		LinkedHashMap organMap = cm.getMapFromCache("organ");// 机构
		
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
			caseapp.setApp_state_cd_s((String) casestatusMap.get(caseapp
					.getApp_state_cd()));
		}
		if (caseapp.getCast_type() != null
				&& !"".equals(caseapp.getCast_type())) {
			caseapp.setCast_type_disp((String) casetypeMap.get(caseapp
					.getCast_type()));
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
		
		return caseapp;
	}
	//反洗钱改造 修改 20090514
	public T07_case_application getT07_case_applicationDisp(
			SqlMapClient sqlMap, T07_case_application app) throws SQLException {
		T07_case_application caseapp = (T07_case_application) sqlMap
				.queryForObject("getT07_case_applicationDisp", app);
		//		 获取页面上需要的下拉菜单信息
		// 可疑级别
		LinkedHashMap alert_leverMap = cm.getMapFromCache("alert_lever");
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
		
		return caseapp;
	}

	
	
	
	public ArrayList getT08_party_tmpl_inds(SqlMapClient sqlMap,
			String  gskey)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT08_party_tmpl_indsByCase",gskey);

		return list;
	}
	
	
	
	public ArrayList getT08_def_catResultList(SqlMapClient sqlMap,
			String resultKey) throws SQLException {
		ArrayList t08_def_catList = (ArrayList) sqlMap.queryForList(
				"getT08_def_catResultListByCase", resultKey);
		return t08_def_catList;
	}
	public ArrayList getT08_def_basicResultList(SqlMapClient sqlMap,
			String resultKey) throws SQLException {
		ArrayList t08_def_catList = (ArrayList) sqlMap.queryForList(
				"getT08_def_basicResultListByCase", resultKey);
		return t08_def_catList;
	}
	public int getT07_transacionList2Count(SqlMapClient sqlMap,
			T07_case_application t07_case_application)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_transacionList2Count", t07_case_application);
		return iCount.intValue();
	}
	public ArrayList getT07_transacionList2(SqlMapClient sqlMap,
			T07_case_application t07_case_application,int iStartRec,
			int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_transacionList2", t07_case_application,iStartRec,iPageSize);
		ArrayList t07_transacionList = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap flagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap checkflagMap = cm.getMapFromCache("yesNo");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		LinkedHashMap currMap = cm.getMapFromCache("curr_cd");
		LinkedHashMap pbc_catpMap = cm.getMapFromCache("pbc_catp");
		LinkedHashMap pbc_cttpMap = cm.getMapFromCache("pbc_cttp");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T47_transaction caseapp = (T47_transaction) iter.next();
			if (caseapp.getOrgankey() != null
					&& !"".equals(caseapp.getOrgankey()))
				caseapp.setOrganName((String) organMap.get(caseapp
						.getOrgankey()));
			if (caseapp.getTx_dt() != null)
				caseapp.setTx_dt_disp(DateUtils.dateToStringShort(caseapp
						.getTx_dt()));
			if (caseapp.getDebit_credit() != null
					&& !"".equals(caseapp.getDebit_credit())) {
				caseapp.setDebit_credit_disp((String) flagMap.get(caseapp
						.getDebit_credit()));
			}
			if (caseapp.getAmt() != null && caseapp.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(caseapp.getAmt()
						.doubleValue());
				caseapp.setAmt_disp(money);
			}
			if (caseapp.getRe_ind() != null && !"".equals(caseapp.getRe_ind()))
				caseapp.setRe_ind_disp((String) checkflagMap.get(caseapp
						.getRe_ind()));
			if (caseapp.getTx_type_cd() != null
					&& !"".equals(caseapp.getTx_type_cd()))
				caseapp.setTx_type_cd_disp((String) tradetypeMap.get(caseapp
						.getTx_type_cd()));
			if (caseapp.getCurrency_cd() != null) {
				
				caseapp.setCurrency_cd_disp((String) currMap.get(caseapp.getCurr_cd()));
				
			}
			// 现金标志
			if (caseapp.getCash_trans_flag() != null && !"".equals(caseapp.getCash_trans_flag())) {
				caseapp.setCash_trans_flag_disp((String) goflagMap.get(caseapp.getCash_trans_flag()));
			}

			// 对方客户类型
			if (caseapp.getOpp_party_class_cd() != null) {
				caseapp.setOpp_party_class_cd_disp((String) pbc_cttpMap.get(caseapp.getOpp_party_class_cd()));
			}
			
			// 对方帐户类型
			if (caseapp.getOpp_acct_type_cd() != null) {
				caseapp.setOpp_acct_type_cd_string((String) pbc_catpMap.get(caseapp.getOpp_acct_type_cd()));
			}
			// 对方机构类型
			if (caseapp.getOpp_organ_type() != null) {
				caseapp.setOpp_organ_type_value((String) organMap.get(caseapp.getOpp_organ_type()));
			}
			t07_transacionList.add(caseapp);
		}
		return t07_transacionList;
	}
	
	public int insertT07_case_application(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		if (t07_case_application.getRecheck_num() == null)
			t07_case_application.setRecheck_num(Long.valueOf("0"));
		int i = sqlMap.update("insertT07_case_application",
				t07_case_application);
		return i;
	}
	
	public T07_case_application getT07_case_applicationDisp1(
			SqlMapClient sqlMap, String application_num) throws SQLException {
		T07_case_application t07_case_application = new T07_case_application();
		t07_case_application.setApplication_num(application_num);
		T07_case_application caseapp = (T07_case_application) sqlMap
				.queryForObject("getT07_case_applicationDisp", t07_case_application);
		if (caseapp == null) {
			caseapp = new T07_case_application();
		}
		return caseapp;
	}
	public ArrayList getT07_caseApplicationList(SqlMapClient sqlMap,
			T07_case_application t07_case_application)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_case_applicationList", t07_case_application);
		if(list==null){
			list=new ArrayList();
		}
		return list;
	}
	public T07_case_application getT07_case_applicationDisp_read(
			SqlMapClient sqlMap, String application_num) throws SQLException {
		T07_case_application t07_case_application=new T07_case_application();
		t07_case_application.setApplication_num(application_num);
		t07_case_application.setCasesearchtime("0");
		T07_case_application caseapp = (T07_case_application) sqlMap
				.queryForObject("getT07_case_applicationDisp", t07_case_application);
		return caseapp;
	}
	public int insertT07_case_application_R(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		int i = sqlMap.update("insertT07_case_application_R",
				t07_case_application);
		return i;
	}
	
	/**lp
	 * 取得案例的特征信息 
	 */
	public ArrayList getT07_stcrList1(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		ArrayList t07_stcrList = (ArrayList) sqlMap.queryForList(
				"getCase_stcrList", t07_case_stcr);
		LinkedHashMap statusMap = cm.getMapFromCache("casestatus");
		LinkedHashMap pbcruleMap = null;
		if("1".equals(t07_case_stcr.getCase_type())){
			pbcruleMap=cm.getMapFromCache("pbcrulerh_de");// 交易特征码
			
		}else
		{
			pbcruleMap=cm.getMapFromCache("pbcrulerh_ky");
		}
		Iterator iter = t07_stcrList.iterator();
		
		while (iter.hasNext()) {
			T07_case_stcr stcr = (T07_case_stcr) iter.next();
			if(stcr.getFlag().equals("1"))
			{
				if (stcr.getStcr() != null && !"".equals(stcr.getStcr())) {
					stcr.setStcr_disp((String) pbcruleMap.get(stcr.getStcr()));
				}
				if (stcr.getStatus() != null && !"".equals(stcr.getStatus())) {
					stcr.setStatus_disp((String) statusMap
							.get(stcr.getStatus()));
				}
			}
		}
		return t07_stcrList;
	}

	public ArrayList getT07_risk_case_List(SqlMapClient sqlMap,
			T07_case_application t07_case_application, int iStartRec,
			int iPageSize) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_risk_case_applicationList", t07_case_application, iStartRec,
				iPageSize);
		Iterator iter = list.iterator();
		ArrayList list1 = new ArrayList();
		//		 获取页面上需要的下拉菜单信息
		// 案例状态
		LinkedHashMap casestatusMap = cm.getMapFromCache("repoetsearch_state");
		// 案例类型
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		// 案例级别
		LinkedHashMap alert_leverMap = cm.getMapFromCache("ssdg");// 可疑级别
	
			LinkedHashMap pbcruleDeMap=cm.getMapFromCache("pbcrulerh_de");// 交易特征码
		
			LinkedHashMap pbcruleKyMap=cm.getMapFromCache("pbcrulerh_ky");
		

		while (iter.hasNext()) {
			T07_case_application caseapp = (T07_case_application) iter.next();
			if (caseapp.getCase_date() != null) {
				caseapp.setApp_dt_disp(DateUtils.dateToStringShort(caseapp
						.getCase_date()));
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
//			if (caseapp.getCase_level() != null
//					&& !"".equals(caseapp.getCase_level())) {
//				caseapp.setCase_level_disp((String) caselevelMap.get(caseapp
//						.getAlert_level()));
//			}
			if (caseapp.getAlert_level() != null
					&& !"".equals(caseapp.getAlert_level())) {
				caseapp.setAlert_level_disp((String) alert_leverMap.get(caseapp
						.getAlert_level()));
			}
		 if(caseapp.getCast_type()!=null){
			if(caseapp.getCast_type().equals("1")){
				
				
				if(caseapp.getStcr()!=null){
					caseapp.setStcr((String) pbcruleDeMap.get(caseapp
							.getStcr()));
				}
			}else{
				if(caseapp.getStcr()!=null){
					caseapp.setStcr((String) pbcruleKyMap.get(caseapp
							.getStcr()));
				}
			}
			}
		 MoneyUtils mUtils = new MoneyUtils();
			if (caseapp.getTran_amt() != null) {
				String money = mUtils.FormatMoney(caseapp.getTran_amt().doubleValue());
				caseapp.setAmt_disp(money);
			}

			list1.add(caseapp);
		}
		return list1;
	}


	public int getT07_risk_case_applicationListCount(SqlMapClient sqlMap,
			T07_case_application t07_case_application) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_risk_case_applicationListCount", t07_case_application);
		return iCount.intValue();
	}
	
	public ArrayList getT07_risk_partyList(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr , int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_stcr_partyList = (ArrayList) sqlMap.queryForList(
				"getT07_risk_partyList", t07_case_stcr, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");   //客户类型
		LinkedHashMap partystateMap = cm.getMapFromCache("casestatus");//客户处理状态

		LinkedHashMap orgMap = cm.getMapFromCache("organ");// 机构
	//	LinkedHashMap risklevelMap = cm.getMapFromCache("risk_level");
	//	LinkedHashMap countryMap = cm.getMapFromCache("country");// 国家
	//	LinkedHashMap postmap = cm.getMapFromCache("t08_post");
		for (int i = 0; i < t07_stcr_partyList.size(); i++) {
			T47_party t47_party = (T47_party) t07_stcr_partyList.get(i);
		
			if (t47_party.getOrgankey() != null
					&& !"".equals(t47_party.getOrgankey())) {
				t47_party.setOrgan_name((String) orgMap.get(t47_party.getOrgankey()));
			}
			if (t47_party.getParty_class_cd() != null
					&& !"".equals(t47_party.getParty_class_cd())) {
				t47_party.setParty_class_cd_disp((String) clienttypeMap.get(t47_party
						.getParty_class_cd()));
			}
			if (t47_party.getParty_status() != null
					&& !"".equals(t47_party.getParty_status())) {
				t47_party.setParty_status_disp((String) partystateMap.get(t47_party
						.getParty_status()));
			}
//			if (t47_party.getPostalcode() != null
//					&& !"".equals(t47_party.getParty_status())) {
//				t47_party.setPostalcode_flag((String) postmap.get(t47_party
//						.getPostalcode()));
//			}
			
			if (t47_party.getCreate_dt()!= null) {
				t47_party.setCreate_dt_disp(DateUtils.dateToStringShort(t47_party
						.getCreate_dt()));
			}
			
			
//			if(t47_party.getBirth_dt_disp()!=null && !t47_party.equals("")){
//				t47_party.setBirth_dt_disp((String)risklevelMap.get(t47_party.getBirth_dt_disp()));
//			}
//			if (t47_party.getCountry_cd() != null
//					&& !"".equals(t47_party.getCountry_cd())) {
//				t47_party.setCountry_cd_disp((String) countryMap.get(t47_party
//						.getCountry_cd()));
//			}
			list.add(t47_party);
		}
		return list;
	}
	
	public int getT07_risk_partyListCount(SqlMapClient sqlMap,
			T07_case_stcr t07_case_stcr)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_risk_partyListCount", t07_case_stcr);
		return iCount.intValue();
	}
	/**
	 * 案例处理，场景分析
	 * @param sqlMap
	 * @param applicationNum
	 * @return
	 * @throws SQLException
	 */
	public T07_case_feature getT07_case_featureDisp(SqlMapClient sqlMap,String applicationNum) throws SQLException {
		T07_case_feature t07_case_feature = (T07_case_feature) sqlMap.queryForObject("getT07_case_featureDisp", applicationNum);
		MoneyUtils mUtils = new MoneyUtils();
		
		if (t07_case_feature != null)
		{
			if(t07_case_feature.getTotalcount_in() != null)
				t07_case_feature.setTotalcount_in_str(String.valueOf(t07_case_feature.getTotalcount_in()));
			if(t07_case_feature.getTotalcount_out() != null)
				t07_case_feature.setTotalcount_out_str(String.valueOf(t07_case_feature.getTotalcount_out()));
			if(t07_case_feature.getTotalamt_in()!=null && t07_case_feature.getTotalamt_in().doubleValue()>=0){
				t07_case_feature.setTotalamt_in_str(mUtils.FormatMoney(t07_case_feature.getTotalamt_in().doubleValue()));
			}
			if(t07_case_feature.getTotalamt_out()!=null && t07_case_feature.getTotalamt_out().doubleValue()>=0){
				t07_case_feature.setTotalamt_out_str(mUtils.FormatMoney(t07_case_feature.getTotalamt_out().doubleValue()));
			}
			if(t07_case_feature.getNetamt()!=null){
				t07_case_feature.setNetamt_str(mUtils.FormatMoney(t07_case_feature.getNetamt().doubleValue()));
			}
			if(t07_case_feature.getAvgamt_in()!=null && t07_case_feature.getAvgamt_in().doubleValue()>=0){
				t07_case_feature.setAvgamt_in_str(mUtils.FormatMoney(t07_case_feature.getAvgamt_in().doubleValue()));
			}
			if(t07_case_feature.getAvgamt_out()!=null && t07_case_feature.getAvgamt_out().doubleValue()>=0){
				t07_case_feature.setAvgamt_out_str(mUtils.FormatMoney(t07_case_feature.getAvgamt_out().doubleValue()));
			}
			if(t07_case_feature.getAvgamt()!=null && t07_case_feature.getAvgamt().doubleValue()>=0){
				t07_case_feature.setAvgamt_str(mUtils.FormatMoney(t07_case_feature.getAvgamt().doubleValue()));
			}
			if(t07_case_feature.getSpeed()!=null && t07_case_feature.getSpeed().doubleValue()>=0){
				t07_case_feature.setSpeed_str(mUtils.FormatMoney(t07_case_feature.getSpeed().doubleValue()));
			}
			if(t07_case_feature.getSpeed_in()!=null && t07_case_feature.getSpeed_in().doubleValue()>=0){
				t07_case_feature.setSpeed_in_str(mUtils.FormatMoney(t07_case_feature.getSpeed_in().doubleValue()));
			}
			if(t07_case_feature.getSpeed_out()!=null && t07_case_feature.getSpeed_out().doubleValue()>=0){
				t07_case_feature.setSpeed_out_str(mUtils.FormatMoney(t07_case_feature.getSpeed_out().doubleValue()));
			}
			
			LinkedHashMap directionMap = cm.getMapFromCache("direction");  //add 20130712
			if(t07_case_feature.getDirection()!=null && !t07_case_feature.getDirection().equals("")){
				t07_case_feature.setDirection((String)directionMap.get(t07_case_feature.getDirection()));
			}
				
		}
		
		if (t07_case_feature == null)
			t07_case_feature = new T07_case_feature();
		return t07_case_feature;
	}

	/**
	 * 案例处理，特征信息，获得模型
	 * @param sqlMap
	 * @param temp
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_case_modelList(SqlMapClient sqlMap,T07_case_stcr temp) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_case_modelList", temp);

		return list;
	}

	public ArrayList getModel_list(SqlMapClient sqlMap, T07_case_stcr temp) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getModel_list", temp);

		return list;
	}
	
	/**
	 * 查询案例生成条件
	 * @param sqlMap
	 * @param t07CaseModule
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getMODULESCORE_list(SqlMapClient sqlMap, T07_case_module t07CaseModule)throws SQLException{
		LinkedHashMap linkedHashMap=cm.getMapFromCache("caseModule");
		ArrayList list = (ArrayList) sqlMap.queryForList("getMODULESCORE_list", t07CaseModule);
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while(iter.hasNext())
		{
			T07_case_module temp = (T07_case_module) iter.next();
			if (temp.getModule_no() != null) {
				temp.setModule_name((String)linkedHashMap.get(temp.getModule_no()));
			}
			if(temp.getTrans_amt()!=null){
				String amt_money = mUtils.FormatMoney(temp.getTrans_amt()
						.doubleValue());
				temp.setTrans_amt_disp(amt_money);
			}
		}
		return list;
	}
	
	/**
	 * add by qiuyun 
	 * 关注库排除动作中，通过客户号取得一段时间内的最后一个案例
	 * @param sqlMap
	 * @param party_id
	 * @return
	 * @throws SQLException
	 */
	
	public String  getMax_app_num(SqlMapClient sqlMap,T07_case_application t07_case_application) throws SQLException 
	{
		List list=sqlMap.queryForList("getMax_app_num",t07_case_application);
		
		String app_num="";
		if(list.size()>0)
		{
			app_num=(String)list.get(0);
		}
		return app_num;
	}
	/**
	 * add by qiyun 
	 * 通过案例编号，更新案例的状态，用于关注库
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int modifyT07_case_appstatus_by_app_num(SqlMapClient sqlMap,T07_case_application t07_case_application) throws SQLException 
	{
	   return 	sqlMap.update("modifyT07_case_appstatus_by_app_num", t07_case_application);
	}
	
	/**
	 * add by qiyun
	 * 通过案例编号，更新案例的isstaff(用于控制二补交易)字段
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int modifyT07_case_application_is_grey(SqlMapClient sqlMap,T07_case_application t07_case_application) throws SQLException 
	{
	   return 	sqlMap.update("modifyT07_case_application_is_grey", t07_case_application);
	}
	/**
	 * add by qiyun
	 * 通过案例编号，更新T47_transaction_uc的isrecordflag(是否允许二次补录)字段
	 * @param sqlMap
	 * @param t07_case_application
	 * @return
	 * @throws SQLException
	 */
	public int modifyT47_transaction_uc_isrecordflag(SqlMapClient sqlMap,T07_case_application t07_case_application) throws SQLException 
	{
	   return 	sqlMap.update("modifyT47_transaction_uc_isrecordflag", t07_case_application);
	}
	
	public int modifyT07_case_app_val(SqlMapClient sqlMap, String applicationNum) throws SQLException {
		int i = sqlMap.update("modifyT07_case_app_val", applicationNum);
		return i;
	}
	public int getCase_stcr_passCount(SqlMapClient sqlMap,CreditTask credittask)throws SQLException{
		Integer count=(Integer)sqlMap.queryForObject("getCase_stcr_passCount",credittask);
		return count.intValue();
	}
}