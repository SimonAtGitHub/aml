/** 
 * Create by makecode program v2.0 
 * 日期             作者 		动作  
 * 2006-12-28   青蛙		创建  
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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_alert;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T18_OnlineServer;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;
import com.ist.util.StringUtils;

public class T07_alertDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7634941139406967917L;
	private static Logger logger = LogUtils.getLogger(T07_alertDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T07_alertDAO() {
	}
	/**
	 * Author Zk 2007-1-9
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_alert
	 *            T07_alert
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_alertList(SqlMapClient sqlMap, T07_alert t07_alert,
			int iStartRec, int iPageSize) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_alertList",
				t07_alert, iStartRec, iPageSize);
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap pbcruleMap = cm.getMapFromCache("pbcrule");
		
		LinkedHashMap dekyMap = cm.getMapFromCache("deky");
		ArrayList backlist = new ArrayList();
		MoneyUtils mUtils = new MoneyUtils();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_alert alert = (T07_alert) iter.next();
			if (alert.getOrgankey() != null
					&& !alert.getOrgankey().trim().equals("")) {
				alert.setOrganname((String) organMap.get(alert.getOrgankey()));
			}
		if (alert.getAmount() != null) {
			String money = mUtils.FormatMoney(alert.getAmount()
					.doubleValue());
			alert.setAmount_string(money);
		}
			if (alert.getPbckey() != null) {
				alert.setPbc_des((String) pbcruleMap.get(alert.getPbckey()));
			}
			if (alert.getRulekey() != null) {
				if (alert.getRulekey().substring(2, 3).equals("2")) {
					alert.setAlert_flag("1");
				} else
					alert.setAlert_flag("0");
			}
			alert.setAlert_dt_disp(DateUtils.dateToStringShort(alert
					.getAlert_dt()));
			
			String temp = alert.getRulekey();
			String name = temp;
			alert.setRulekey_disp(StringUtils.null2String((String) dekyMap
					.get(name.substring(0, 2)))
					+ name.substring(2));

			backlist.add(alert);
		}
		return backlist;
	}
	
	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_alert
	 *            T07_alert
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_alertListCount(SqlMapClient sqlMap, T07_alert t07_alert)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_alertListCount", t07_alert);
		return iCount.intValue();
	}
	
	public ArrayList getT07_alert_transNewList(SqlMapClient sqlMap,T07_alert t07_alert, int iStartRec,
			int iPageSize) throws SQLException {
		ArrayList t07_case_transList = (ArrayList) sqlMap.queryForList(
				"T07_alert_trans_list", t07_alert,iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap receive_pay_cdMap = cm.getMapFromCache("receive_pay");
		LinkedHashMap tx_typeMap = cm.getMapFromCache("tradetype");
		LinkedHashMap trackflagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap currMap = cm.getMapFromCache("curr_cd");
		LinkedHashMap aml_tx_cdMap = cm.getMapFromCache("aml_tx_cd");
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");
		LinkedHashMap t87_pbc_gjfsMap = cm.getMapFromCache("t87_pbc_gjfs");
		LinkedHashMap t87_pbc_gjfsMap1 = cm.getMapFromCache("t87_pbc_gjfs5");
		LinkedHashMap sysruleMap = cm.getMapFromCache("sysrule");
		for (int i = 0; i < t07_case_transList.size(); i++) {
			T47_transaction t47_transaction = (T47_transaction) t07_case_transList.get(i);
			if (t47_transaction.getOrgankey() != null) {
				t47_transaction.setOrganName((String) organMap.get(t47_transaction.getOrgankey()));
			}

			if (t47_transaction.getRulekey()!= null) {
				t47_transaction.setRulekey_disp(t47_transaction.getRulekey()+"--"+(String) sysruleMap.get(t47_transaction.getRulekey()));
				
			}
			if (t47_transaction.getOpp_organkey()!= null) {
				t47_transaction.setOpp_organname((String) organMap.get(t47_transaction.getOpp_organkey()));
				
			}
			if (t47_transaction.getTx_dt() != null) {
				t47_transaction.setTx_dt_disp(DateUtils.dateToStringShort(t47_transaction.getTx_dt()));
			}
			if (t47_transaction.getAlert_dt() != null) {
				t47_transaction.setAlert_mode_cd_disp(DateUtils.dateToStringShort(t47_transaction.getAlert_dt()));
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
			if (t47_transaction.getOpp_party_class_cd()!= null) {
				t47_transaction.setOpp_party_class_cd_disp((String) clienttypeMap.get(t47_transaction.getOpp_party_class_cd() ));
			}
			if (t47_transaction.getParty_class_cd() != null) {
				t47_transaction.setParty_class_cd((String) clienttypeMap.get(t47_transaction.getParty_class_cd() ));
			}
			if (t47_transaction.getTx_cd() != null) {
				t47_transaction.setTx_cd((String) aml_tx_cdMap.get(t47_transaction.getTx_cd()));
			}
			if (t47_transaction.getTx_type_cd() != null) {
				t47_transaction.setTx_type_cd((String) tx_typeMap.get(t47_transaction.getTx_type_cd()));
			}
			if (t47_transaction.getReceive_pay_cd() != null) {
				t47_transaction.setReceive_pay_cd((String)receive_pay_cdMap.get(t47_transaction.getReceive_pay_cd()));
			}
			if (t47_transaction.getDebit_credit() != null) {
				t47_transaction.setDebit_credit_disp((String)trackflagMap.get(t47_transaction.getDebit_credit()));
			}
			if (t47_transaction.getCash_trans_flag() != null) {
				t47_transaction.setCash_trans_flag_disp((String) goflagMap.get(t47_transaction.getCash_trans_flag()));
			}
			
			list.add(t47_transaction);
		}
		return list;
	}
	
	public T07_alert getT07_alertDispByHistoryCase(SqlMapClient sqlMap, T07_alert t07_alert1)
	throws SQLException {
T07_alert t07_alert = (T07_alert) sqlMap.queryForObject(
		"getT07_alertDispByHistoryCase", t07_alert1);
LinkedHashMap organMap = cm.getMapFromCache("organ");
LinkedHashMap pbcMap = cm.getMapFromCache("pbcrule");
LinkedHashMap sysMap = cm.getMapFromCache("sysrule");
MoneyUtils mUtils = new MoneyUtils();
if (t07_alert == null)
	t07_alert = new T07_alert();
t07_alert.setSysname((String) sysMap.get(t07_alert.getRulekey()));//去掉系统规则
t07_alert.setPbcname((String) pbcMap.get(t07_alert.getPbckey()));
t07_alert.setOrganname((String) organMap.get(t07_alert.getOrgankey()));
t07_alert.setAlert_dt_disp(DateUtils.dateToStringShort(t07_alert
		.getAlert_dt()));
t07_alert.setCreate_dt_disp(DateUtils.dateToStringShort(t07_alert
		.getCreate_dt()));
if (t07_alert.getAmount() != null) {
	t07_alert.setAmount_string((String) mUtils.FormatMoney(t07_alert
			.getAmount().doubleValue()));
}
return t07_alert;
}
	
	public ArrayList getT07_alert_indicList(SqlMapClient sqlMap,
			T07_alert t07_alert, String alertkey, int iStartRec, int iPageSize)
			throws SQLException {
		LinkedHashMap indictypeMap = cm.getMapFromCache("indictype");
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_alert_indicList", t07_alert);
		ArrayList list_new = new ArrayList();
		T07_alert t07_alert1;
		for (int i = 0; i < list.size(); i++) {
			t07_alert1 = (T07_alert) list.get(i);
			if (t07_alert1.getUnit() != null) {
				t07_alert1.setUnit((String) indictypeMap.get(t07_alert1
						.getUnit()));
			}
			list_new.add(t07_alert);
		}
		return list;
	}

	/**
	 * Author Zk 2007-1-8 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_alert
	 *            T07_alert
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_alert_transList(SqlMapClient sqlMap,
			T07_alert t07_alert, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_alert_transList = (ArrayList) sqlMap.queryForList(
				"getT07_alert_transList3", t07_alert, iStartRec, iPageSize);
		ArrayList list = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		LinkedHashMap flagMap = cm.getMapFromCache("trackflag");
		LinkedHashMap checkflagMap = cm.getMapFromCache("yesNo");
		LinkedHashMap tradetypeMap = cm.getMapFromCache("tradetype");
		LinkedHashMap currMap = cm.getMapFromCache("currency");
		LinkedHashMap transstateMap = cm.getMapFromCache("transstate");//交易状态
		LinkedHashMap goflagMap = cm.getMapFromCache("goflag");//现/转标志
		MoneyUtils mUtils = new MoneyUtils();

		
		for (int i = 0; i < t07_alert_transList.size(); i++) {
		
			T47_transaction t07_alert1 = (T47_transaction) t07_alert_transList
					.get(i);
			if (t07_alert1.getAmt() != null) {
				String money = mUtils.FormatMoney(t07_alert1.getAmt()
						.doubleValue());
				t07_alert1.setAmt_disp(money);
			}
			if (t07_alert1.getOrgankey() != null) {
				t07_alert1.setOrganName((String) organMap.get(t07_alert1
						.getOrgankey()));
			}
			if (t07_alert1.getTx_dt() != null) {
				//modify 2009.9.24
				//t07_alert1.setTx_dt_disp(DateUtils.dateToString(t07_alert1
						//.getTx_dt()));
				t07_alert1.setTx_dt_disp(DateUtils.dateToStringShort(t07_alert1
				.getTx_dt()));
			}
			if (t07_alert1.getDebit_credit() != null) {
				t07_alert1.setDebit_credit_disp((String) flagMap.get(t07_alert1
						.getDebit_credit()));
			}
			if (t07_alert1.getRe_ind() != null) {
				t07_alert1.setRe_ind_disp((String) checkflagMap.get(t07_alert1
						.getRe_ind()));
			}
			if (t07_alert1.getTx_type_cd() != null) {
				t07_alert1.setTx_type_cd_disp((String) tradetypeMap
						.get(t07_alert1.getTx_type_cd()));
			}
			if (t07_alert1.getCash_trans_flag() != null) {
				t07_alert1.setCash_trans_flag_disp((String) goflagMap
						.get(t07_alert1.getCash_trans_flag()));
			}
			if (t07_alert1.getCurrency_cd() != null) {
				t07_alert1.setCurrency_cd_disp((String) currMap.get(t07_alert1
						.getCurrency_cd()));
			}
			if (t07_alert1.getHandle_status_cd() != null) {
				t07_alert1.setStatus_cd_disp((String) transstateMap.get(t07_alert1
						.getStatus_cd()));
			}
			if(t07_alert.getAlertsearchtime() !=null){
				t07_alert1.setAlertsearchtime(t07_alert.getAlertsearchtime());
			}
			list.add(t07_alert1);
		}
		return list;
	}
	
	public int getT07_alert_transListCount(SqlMapClient sqlMap,
			T07_alert t07_alert)
			throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_alert_transListCount1", t07_alert);
		return iCount.intValue();
	}
}
