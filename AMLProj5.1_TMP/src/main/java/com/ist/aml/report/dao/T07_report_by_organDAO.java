package com.ist.aml.report.dao;

/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: 北京银丰新融科技开发有限公司
 * </p>
 * 
 * @author 研发组-lijie
 * @version 4.0.1
 */

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.pbcreport.dto.T07_nbh_tsdt;
import com.ist.aml.report.dto.T07_report_by_organ;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;
import com.ist.util.MoneyUtils;
import com.ist.util.StringUtils;

public class T07_report_by_organDAO extends BaseDAO {

	private static Logger logger = LogUtils
			.getLogger(T07_report_by_organDAO.class.getName());

	/**
	 * 构造函数
	 */
	public T07_report_by_organDAO() {
	}

	public ArrayList getT07_sz_trans_report_List2(SqlMapClient sqlMap,
			T07_report_by_organ t07_report_by_organ) throws SQLException {
		if (t07_report_by_organ == null)
			t07_report_by_organ = new T07_report_by_organ();
		t07_report_by_organ.setType("CNY");
		t07_report_by_organ.setTableName("C.CNY_AMT");
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_sz_trans_report_List2", t07_report_by_organ);
		LinkedHashMap typeMap = cm.getMapFromCache("alertkind");
		MoneyUtils mUtils = new MoneyUtils();
		ArrayList list1 = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) list
					.get(i);

			if (t07_report_by_organ1.getCast_type() != null
					&& t07_report_by_organ1.getCast_type().equals("1")) {
				t07_report_by_organ1.setCast_type("大额交易");
			} else {
				t07_report_by_organ1.setCast_type("可疑交易");
			}
			if (t07_report_by_organ1.getCurrency_cd() != null
					&& t07_report_by_organ1.getCurrency_cd().equals("1")) {
				t07_report_by_organ1.setCurrency_cd("人民币");
			} else {
				t07_report_by_organ1.setCurrency_cd("外币");
			}

			if (t07_report_by_organ1.getCurrency_cd().equals("人民币")) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(元)");
			} else {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(美元)");
			}
			if (t07_report_by_organ1.getCurrency_cd().equals("人民币")) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(元)");
			} else {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(美元)");
			}
			t07_report_by_organ1.setOrganname(t07_report_by_organ1
					.getCurrency_cd()
					+ t07_report_by_organ1.getCast_type());
			list1.add(t07_report_by_organ1);
		}

		return list1;
	}

	public ArrayList getT07_sz_trans_report_List(SqlMapClient sqlMap,
			T07_report_by_organ t07_report_by_organ) throws SQLException {
		if (t07_report_by_organ == null)
			t07_report_by_organ = new T07_report_by_organ();
		t07_report_by_organ.setType("CNY");
		t07_report_by_organ.setTableName("C.CNY_AMT");
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_sz_trans_report_List", t07_report_by_organ);
		LinkedHashMap typeMap = cm.getMapFromCache("alertkind");
		MoneyUtils mUtils = new MoneyUtils();
		ArrayList list1 = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) list
					.get(i);

			if (t07_report_by_organ1.getCast_type() != null
					&& t07_report_by_organ1.getCast_type().equals("1")) {
				t07_report_by_organ1.setCast_type("大额交易");
			} else {
				t07_report_by_organ1.setCast_type("可疑交易");
			}
			if (t07_report_by_organ1.getCurrency_cd() != null
					&& t07_report_by_organ1.getCurrency_cd().equals("1")) {
				t07_report_by_organ1.setCurrency_cd("人民币");
			} else {
				t07_report_by_organ1.setCurrency_cd("外币");
			}

			if (t07_report_by_organ1.getCurrency_cd().equals("人民币")) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(元)");
			} else {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(美元)");
			}
			if (t07_report_by_organ1.getCurrency_cd().equals("人民币")) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(元)");
			} else {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(美元)");
			}
			t07_report_by_organ1.setOrganname(t07_report_by_organ1
					.getCurrency_cd()
					+ t07_report_by_organ1.getCast_type());
			list1.add(t07_report_by_organ1);
		}

		return list1;
	}

	public ArrayList getT07_sz_trans_report_List1(SqlMapClient sqlMap,
			T07_report_by_organ t07_report_by_organ) throws SQLException {
		if (t07_report_by_organ == null)
			t07_report_by_organ = new T07_report_by_organ();
		t07_report_by_organ.setType("1");
		t07_report_by_organ.setTableName("C.CNY_AMT");
		ArrayList deCnylist = (ArrayList) sqlMap.queryForList(
				"getT07_sz_detrans_report_List1", t07_report_by_organ);
		ArrayList kyCnylist = (ArrayList) sqlMap.queryForList(
				"getT07_sz_kytrans_report_List1", t07_report_by_organ);

		t07_report_by_organ.setType("2");
		t07_report_by_organ.setTableName("C.USD_AMT");
		ArrayList deYlist = (ArrayList) sqlMap.queryForList(
				"getT07_sz_detrans_report_List1", t07_report_by_organ);
		ArrayList kyYlist = (ArrayList) sqlMap.queryForList(
				"getT07_sz_kytrans_report_List1", t07_report_by_organ);
		LinkedHashMap typeMap = cm.getMapFromCache("alertkind");
		MoneyUtils mUtils = new MoneyUtils();
		ArrayList list1 = new ArrayList();
		for (int i = 0; i < deCnylist.size(); i++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) deCnylist
					.get(i);
			t07_report_by_organ1.setOrganname("人民币" + "大额交易");
			
			if (t07_report_by_organ1.getType_cd() != null) {
				t07_report_by_organ1.setType_cd_disp((String) typeMap
						.get(t07_report_by_organ1.getType_cd()));
			}
			if (t07_report_by_organ1.getAlertnvl() != null
					&& t07_report_by_organ1.getAlertnvl().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(元)");
			}
			if (t07_report_by_organ1.getTotal_val() != null
					&& t07_report_by_organ1.getTotal_val().doubleValue() >= 0) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(元)");
			}

			list1.add(t07_report_by_organ1);
		}
		for (int j = 0; j < deYlist.size(); j++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) deYlist
					.get(j);
			t07_report_by_organ1.setOrganname("外币" + "大额交易");
			
			if (t07_report_by_organ1.getType_cd() != null) {
				t07_report_by_organ1.setType_cd_disp((String) typeMap
						.get(t07_report_by_organ1.getType_cd()));
			}
			if (t07_report_by_organ1.getAlertnvl() != null
					&& t07_report_by_organ1.getAlertnvl().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(美元)");
			}
			if (t07_report_by_organ1.getTotal_val() != null
					&& t07_report_by_organ1.getTotal_val().doubleValue() >= 0) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(美元)");
			}

			list1.add(t07_report_by_organ1);
		}
		for (int i = 0; i < kyCnylist.size(); i++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) kyCnylist
					.get(i);
			t07_report_by_organ1.setOrganname("人民币" + "可疑交易");
			
			if (t07_report_by_organ1.getType_cd() != null) {
				t07_report_by_organ1.setType_cd_disp((String) typeMap
						.get(t07_report_by_organ1.getType_cd()));
			}
			if (t07_report_by_organ1.getAlertnvl() != null
					&& t07_report_by_organ1.getAlertnvl().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(元)");
			}
			if (t07_report_by_organ1.getTotal_val() != null
					&& t07_report_by_organ1.getTotal_val().doubleValue() >= 0) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(元)");
			}

			list1.add(t07_report_by_organ1);
		}
		for (int j = 0; j < kyYlist.size(); j++) {
			T07_report_by_organ t07_report_by_organ1 = (T07_report_by_organ) kyYlist
					.get(j);
			t07_report_by_organ1.setOrganname("外币" + "可疑交易");
			
			if (t07_report_by_organ1.getType_cd() != null) {
				t07_report_by_organ1.setType_cd_disp((String) typeMap
						.get(t07_report_by_organ1.getType_cd()));
			}
			if (t07_report_by_organ1.getAlertnvl() != null
					&& t07_report_by_organ1.getAlertnvl().doubleValue() >= 0) {
				String money = mUtils.FormatMoney(t07_report_by_organ1
						.getAlertnvl().doubleValue());
				t07_report_by_organ1.setAlert_val_string(money + "(美元)");
			}
			if (t07_report_by_organ1.getTotal_val() != null
					&& t07_report_by_organ1.getTotal_val().doubleValue() >= 0) {
				String money1 = mUtils.FormatMoney(t07_report_by_organ1
						.getTotal_val().doubleValue());
				t07_report_by_organ1.setTotal_val_string(money1 + "(美元)");
			}

			list1.add(t07_report_by_organ1);
		}
		return list1;
	}

	public ArrayList getT07_detrans_report_List(SqlMapClient sqlMap,
			T07_report_by_organ t07_report_by_organ, int iStartRec,
			int iPageSize) throws SQLException {

		ArrayList list=new ArrayList();
		if ("DE".equals(t07_report_by_organ.getType())) {
			if(t07_report_by_organ.getMsg_type_cd().equals("I")){
				list = (ArrayList) sqlMap.queryForList(
						"getT07_detrans_Ireport_List", t07_report_by_organ,
						iStartRec, iPageSize);
			}else
			if(t07_report_by_organ.getMsg_type_cd().equals("C")){
				list = (ArrayList) sqlMap.queryForList(
						"getT07_detrans_Creport_List", t07_report_by_organ,
						iStartRec, iPageSize);
			}else
			if(t07_report_by_organ.getMsg_type_cd().equals("D")){
				list = (ArrayList) sqlMap.queryForList(
						"getT07_detrans_Dreport_List", t07_report_by_organ,
						iStartRec, iPageSize);
			}
			else{
			list = (ArrayList) sqlMap.queryForList(
					"getT07_detrans_report_List", t07_report_by_organ,
					iStartRec, iPageSize);
			}
		} else if("KY".equals(t07_report_by_organ.getType())){
			list = (ArrayList) sqlMap.queryForList(
					"getT07_kytrans_report_List", t07_report_by_organ,
					iStartRec, iPageSize);
		}
		
		LinkedHashMap organMap = cm.getMapFromCache("organ");//机构
		LinkedHashMap currencytypeMap = cm.getMapFromCache("currencytype");//本外币
		LinkedHashMap pbc_currencyMap = cm.getMapFromCache("currency");//币种
		LinkedHashMap t87_pbc_cashMap = cm.getMapFromCache("t87_pbc_cash");//现金标志
		LinkedHashMap t87_pbc_gjfs1Map = cm.getMapFromCache("t87_pbc_gjfs");// 本币结算方式
		LinkedHashMap t87_pbc_gjfs2Map = cm.getMapFromCache("t87_pbc_gjfs2");// 外币结算方式
		LinkedHashMap txTypeCDMap = cm.getMapFromCache("tradetype");//交易类型
		LinkedHashMap receive_payMap = cm.getMapFromCache("receive_pay");//收付标志
		
		MoneyUtils mUtils = new MoneyUtils();
		ArrayList list1 = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			T07_nbh_tsdt t07_nbh_tsdt = (T07_nbh_tsdt) list.get(i);
			t07_nbh_tsdt.setCrcd_disp(mUtils.FormatMoney(t07_nbh_tsdt.getCrat()
					.doubleValue()));
			
			if(t07_nbh_tsdt.getTsdr()!=null&&!t07_nbh_tsdt.getTsdr().equals("")){
				t07_nbh_tsdt.setTsdr_disp((String)receive_payMap.get(t07_nbh_tsdt.getTsdr()));
			}
			if (t07_nbh_tsdt.getOrganStr() != null
					&& !"".equals(t07_nbh_tsdt.getOrganStr())) {
				t07_nbh_tsdt.setOrganStr((String) organMap.get(t07_nbh_tsdt
						.getOrganStr()));
			}
			if (t07_nbh_tsdt.getTstp() != null
					&& t07_nbh_tsdt.getTstp().length() == 6) {
				String cur = t07_nbh_tsdt.getTstp().substring(0, 2);
				String cur_disp = (String) currencytypeMap.get(cur);
			
				if (cur.equals("00")) {// 本币
					String cash = t07_nbh_tsdt.getTstp().substring(2, 4);
					String gsfs = t07_nbh_tsdt.getTstp().substring(4);
					String cash_disp = (String) t87_pbc_cashMap.get(cash);
					
					String gsfs_disp = (String) t87_pbc_gjfs1Map.get(gsfs);
					t07_nbh_tsdt.setTstp(cur_disp + cash_disp + gsfs_disp);
				}
				if (cur.equals("01")) {// 外币
					String gsfs = t07_nbh_tsdt.getTstp().substring(2);
					String gsfs_disp = (String) t87_pbc_gjfs2Map.get(gsfs);
					t07_nbh_tsdt.setTstp(cur_disp + gsfs_disp);
				}
			}
			if (t07_nbh_tsdt.getCrtp() != null) {
				t07_nbh_tsdt.setCrtp((String) pbc_currencyMap.get((t07_nbh_tsdt
						.getCrtp()).trim()));
			}
               //交易日期
			t07_nbh_tsdt.setTstm_disp(DateUtils.dateToStringShort(t07_nbh_tsdt
					.getTstm()));
			
			
			if (t07_nbh_tsdt.getTx_type_cd() != null
					&& !"".equals(t07_nbh_tsdt.getTx_type_cd())) {
				t07_nbh_tsdt.setTx_type_cd_disp((String) txTypeCDMap
						.get(t07_nbh_tsdt.getTx_type_cd()));
			}
			list1.add(t07_nbh_tsdt);
		}
		return list1;
	}
	
	public int getT07_detrans_report_ListCount(SqlMapClient sqlMap,
			T07_report_by_organ t07_report_by_organ) throws SQLException {
		Integer iCount = 0;
		if ("DE".equals(t07_report_by_organ.getType())) {
			if(t07_report_by_organ.getMsg_type_cd().equals("I")){
				iCount = (Integer) sqlMap.queryForObject(
						"getT07_detrans_Ireport_ListCount", t07_report_by_organ);
			}
			else if(t07_report_by_organ.getMsg_type_cd().equals("C")){
				iCount = (Integer) sqlMap.queryForObject(
						"getT07_detrans_Creport_ListCount", t07_report_by_organ);
			}else
			if(t07_report_by_organ.getMsg_type_cd().equals("D")){
				iCount = (Integer) sqlMap.queryForObject(
						"getT07_detrans_Dreport_ListCount", t07_report_by_organ);
			}
			else{
				iCount = (Integer) sqlMap.queryForObject(
						"getT07_detrans_report_ListCount", t07_report_by_organ);
			}
			
		} else if("KY".equals(t07_report_by_organ.getType())){
			iCount = (Integer) sqlMap.queryForObject(
					"getT07_kytrans_report_ListCount", t07_report_by_organ);
		}
		return iCount.intValue();
	}
	
}
	
