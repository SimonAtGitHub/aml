package com.ist.aml.blacklist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.blacklist.dto.T52_def_remount;
import com.ist.aml.report.dto.T47_transaction;
import com.ist.common.base.BaseDAO;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;

public class T52_def_remountDAO extends BaseDAO
{
	/** 回溯结果 */
	public ArrayList getT52_def_remountList(SqlMapClient sqlMap,
			T52_def_remount t52_def_remout, int iStartRec, int iPageSize)
			throws SQLException
	{
		ArrayList list = (ArrayList) sqlMap.queryForList("getT52_def_remountList",
				t52_def_remout, iStartRec, iPageSize);
		ArrayList t52_def_remountList = new ArrayList();

		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap card_typeMap = cm.getMapFromCache("card_type");
		LinkedHashMap countryMap = cm.getMapFromCache("country");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T52_def_remount t52_def_remount1 = (T52_def_remount) iter.next();
			// 把客户对象类型进行转换，以供显示
			if (t52_def_remount1.getParty_class_cd() != null) {
				t52_def_remount1.setParty_class_cd((String) clienttypeMap
						.get(t52_def_remount1.getParty_class_cd()));
			}
			if (t52_def_remount1.getCard_type() != null
					&& !t52_def_remount1.getCard_type().equals("")) {
				t52_def_remount1.setCard_type((String) card_typeMap.get(t52_def_remount1
						.getCard_type()));
			}
			if (t52_def_remount1.getCountry_cd() != null) {
				t52_def_remount1.setCountry_cd((String) countryMap.get(t52_def_remount1
						.getCountry_cd()));
			}
			
			t52_def_remountList.add(t52_def_remount1);
		}
		return list;
	}
	
	
	/** 总记录数 */
	public int getT52_def_remountListCount(SqlMapClient sqlMap,
			T52_def_remount t52_def_remout) throws SQLException
	{
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT52_def_remountListCount", t52_def_remout);
		return iCount.intValue();
	}
	
	
	public ArrayList getT52_remount_transList(SqlMapClient sqlMap,
			T52_def_remount t52_def_remout, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT52_remount_trans_list", t52_def_remout, iStartRec,
				iPageSize);
		ArrayList t52_remount_transList = new ArrayList();
	
	
		//add zhaowei end
		MoneyUtils mUtils = new MoneyUtils();

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T52_def_remount t52_def_remount = (T52_def_remount) iter.next();
//			if (t52_def_remount.getTx_type_cd() != null
//					&& !"".equals(t52_def_remount.getTx_type_cd())) {
//				t52_def_remount.setTx_type_cd_disp((String) tradetypeMap
//						.get(t52_def_remount.getTx_type_cd()));
//			}
//			if (t52_def_remount.getOrgankey() != null
//					&& !"".equals(t52_def_remount.getOrgankey())) {
//				t52_def_remount.setOrganName((String) organlMap
//						.get(t52_def_remount.getOrgankey()));
//			}
//			if (t52_def_remount.getDebit_credit() != null
//					&& !"".equals(t52_def_remount.getDebit_credit())) {
//				t52_def_remount.setDebit_credit_disp((String) trackflagMap
//						.get(t52_def_remount.getDebit_credit()));
//			}
//			if (t52_def_remount.getCurrency_cd() != null
//					&& !"".equals(t52_def_remount.getCurrency_cd())) {
//				t52_def_remount.setCurrency_cd_disp((String) currencyMap
//						.get(t52_def_remount.getCurrency_cd()));
//			}
			if (t52_def_remount.getAmt() != null
					&& t52_def_remount.getAmt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t52_def_remount.getAmt()
						.doubleValue());
				t52_def_remount.setAmt_disp(money);
			}
			if (t52_def_remount.getCny_amt() != null
					&& t52_def_remount.getCny_amt().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t52_def_remount
						.getCny_amt().doubleValue());
				t52_def_remount.setCny_amt_disp(money);
			}
//			if (t52_def_remount.getCash_trans_flag() != null
//					&& !"".equals(t52_def_remount.getCash_trans_flag())) {
//				t52_def_remount.setCash_trans_flag_disp((String) goflagMap
//						.get(t52_def_remount.getCash_trans_flag()));
//			}
			if (t52_def_remount.getTx_dt() != null) {
				t52_def_remount.setTx_dt_disp(DateUtils
						.dateToStringShort(t52_def_remount.getTx_dt()));
			}
			if (t52_def_remount.getDt_time() != null) {
				t52_def_remount.setDt_time_disp(DateUtils.dateToString(
						t52_def_remount.getDt_time()).substring(11, 19));
			}
//			if (t52_def_remount.getValidate_flag() != null
//					&& !"".equals(t52_def_remount.getValidate_flag())) {
//				t52_def_remount.setValidate_flag_disp((String) validateflagMap
//						.get(t52_def_remount.getValidate_flag()));
//			}
//			if(!com.ist.common.util.StringUtils.isEmpty(t52_def_remount.getCard_style())){
//				t52_def_remount.setCard_styleDisp((String) card_styleMap.get(t52_def_remount.getCard_style()));
//			}if(!com.ist.common.util.StringUtils.isEmpty(t52_def_remount.getRcv_pay_type())){
//				t52_def_remount.setRcv_pay_typeDisp((String) rcv_pay_typeMap.get(t52_def_remount.getRcv_pay_type()));
//			}if(!com.ist.common.util.StringUtils.isEmpty(t52_def_remount.getNon_dept_type())){
//				t52_def_remount.setNon_dept_typeDisp((String) non_dept_typeMap.get(t52_def_remount.getNon_dept_type()));
//			}
			t52_remount_transList.add(t52_def_remount);
		}
		return t52_remount_transList;
	}
	
	public int getT52_remount_transListCount(SqlMapClient sqlMap,
			T52_def_remount T52_def_remount) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT52_remount_trans_listCount", T52_def_remount);
		return iCount.intValue();
	}
	
}
