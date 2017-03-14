package com.ist.aml.information.dao;

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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.information.dto.T47_OPP_bank;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;

public class T47_OPP_bankDAO extends BaseDAO {
	/**
		 * 
		 */
	private static final long serialVersionUID = 8273478610943850147L;
	private static Logger logger = LogUtils.getLogger(T47_OPP_bankDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T47_OPP_bankDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_opp_bank
	 *            T47_OPP_bank
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT87_UnionList(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT87_UnionList",
				t47_opp_bank, iStartRec, iPageSize);
		ArrayList t47_opp_bankList = new ArrayList();
		LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
		LinkedHashMap countryMap = cm.getMapFromCache("nationality"); // 国家
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea"); // 地区

		// Iterator iter = t47_opp_bankList.iterator();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_OPP_bank t47_opp_bank1 = (T47_OPP_bank) iter.next();
			if (t47_opp_bank1.getCountry_cd() != null) {
				t47_opp_bank1.setOpp_country_disp((String) countryMap
						.get((t47_opp_bank1.getCountry_cd())));
			}
			if (t47_opp_bank1.getUnion_type() != null) {
				t47_opp_bank1.setOpp_code_type_cd_disp((String) organtypeMap
						.get((t47_opp_bank1.getUnion_type())));
			}
			if (t47_opp_bank1.getCity_cd() != null) {
				t47_opp_bank1.setOpp_areaname((String) pbcareaMap
						.get((t47_opp_bank1.getCity_cd())));
			}
			t47_opp_bankList.add(t47_opp_bank1);
		}
		return t47_opp_bankList;
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_opp_bank
	 *            T47_OPP_bank
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT47_OPP_bankList(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_OPP_bankList",
				t47_opp_bank, iStartRec, iPageSize);
		ArrayList t47_opp_bankList = new ArrayList();
		LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
		LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国家
		LinkedHashMap pbcareaMap = cm.getMapFromCache("pbcarea"); // 地区

		// Iterator iter = t47_opp_bankList.iterator();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_OPP_bank t47_opp_bank1 = (T47_OPP_bank) iter.next();
			if (t47_opp_bank1.getOpp_country() != null) {
				t47_opp_bank1.setOpp_country_disp((String) countryMap
						.get((t47_opp_bank1.getOpp_country())));
			}
			if (t47_opp_bank1.getOpp_code_type_cd() != null) {
				t47_opp_bank1.setOpp_code_type_cd_disp((String) organtypeMap
						.get((t47_opp_bank1.getOpp_code_type_cd())));
			}
			if (t47_opp_bank1.getOpp_area() != null) {
				t47_opp_bank1.setOpp_areaname((String) pbcareaMap
						.get((t47_opp_bank1.getOpp_area())));
			}
			t47_opp_bankList.add(t47_opp_bank1);
		}
		return t47_opp_bankList;
	}

	/**
	 * add by dingke
	 * 
	 * @param sqlMap
	 * @param t47_opp_bank
	 * @param iStartRec
	 * @param iPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT47_OPP_bankList1(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT47_OPP_bankList1",
				t47_opp_bank, iStartRec, iPageSize);
		ArrayList t47_opp_bankList = new ArrayList();
		LinkedHashMap organtypeMap = cm.getMapFromCache("cfct_hash"); // 金融机构类型
		LinkedHashMap countryMap = cm.getMapFromCache("country"); // 国家
		LinkedHashMap areaidMap = cm.getMapFromCache("areaid"); //
		LinkedHashMap areaMap = cm.getMapFromCache("area23");

		// Iterator iter = t47_opp_bankList.iterator();
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T47_OPP_bank t47_opp_bank1 = (T47_OPP_bank) iter.next();
			if (t47_opp_bank1.getCountry_cd() != null) {
				t47_opp_bank1.setOpp_country_disp((String) countryMap
						.get((t47_opp_bank1.getCountry_cd())));
			}
			if (t47_opp_bank1.getUnion_type() != null) {
				t47_opp_bank1.setOpp_code_type_cd_disp((String) organtypeMap
						.get((t47_opp_bank1.getUnion_type())));
			}
			if (t47_opp_bank1.getCity_cd() != null
					&& !"".equals(t47_opp_bank1.getCity_cd())
					&& !"-1".equals(t47_opp_bank1.getCity_cd())
					&& !t47_opp_bank1.getCity_cd().equals("000000")) {
				String op_areaid = t47_opp_bank1.getCity_cd();
				String op_areaupid = (String) areaidMap.get(op_areaid);
				String comstr = op_areaid.substring(op_areaid.length() - 2,
						op_areaid.length());
				String comstr1 = op_areaid.substring(op_areaid.length() - 4,
						op_areaid.length());
				if (comstr.equals("00")) {
					if (comstr1.equals("0000")) {
						t47_opp_bank1.setOpp_area1(op_areaid);
					} else {
						t47_opp_bank1.setOpp_area2(op_areaid);
						t47_opp_bank1.setOpp_area2name((String) areaMap
								.get(op_areaid));
						t47_opp_bank1.setOpp_area1(op_areaupid);
						t47_opp_bank1.setOpp_areaname((String) areaMap
								.get(op_areaid));
					}
				} else {
					t47_opp_bank1.setOpp_areaname((String) areaMap
							.get(op_areaid));
					t47_opp_bank1.setOpp_area(op_areaid);
					if (op_areaupid != null) {
						t47_opp_bank1.setOpp_area2(op_areaupid);
						t47_opp_bank1.setOpp_area2name((String) areaMap
								.get(op_areaupid));
						t47_opp_bank1.setOpp_area1((String) areaidMap
								.get(op_areaupid));
					}
				}
			}
			t47_opp_bankList.add(t47_opp_bank1);
		}
		
		return t47_opp_bankList;
	}
	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_opp_bank
	 *            T47_OPP_bank
	 * @throws SQLException
	 * @return int
	 */
	public int getT47_OPP_bankListCount(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_OPP_bankListCount", t47_opp_bank);
		return iCount.intValue();
	}

	public int getT47_OPP_bankListCount1(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_OPP_bankListCount1", t47_opp_bank);
		return iCount.intValue();
	}
	public int getT87_UnionListCount(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT87_UnionListCount", t47_opp_bank);
		return iCount.intValue();
	}
	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Opp_organkey
	 *            String
	 * @throws SQLException
	 * @return T47_OPP_bank
	 */
	public T47_OPP_bank getT47_OPP_bankDisp(SqlMapClient sqlMap,
			String opp_organkey) throws SQLException {
		T47_OPP_bank t47_opp_bank = (T47_OPP_bank) sqlMap.queryForObject(
				"getT47_OPP_bankDisp", opp_organkey);
		if (t47_opp_bank == null)
			t47_opp_bank = new T47_OPP_bank();
		return t47_opp_bank;
	}

	public T47_OPP_bank getT87_UnionDisp(SqlMapClient sqlMap,
			T47_OPP_bank t47_opp_bank) throws SQLException {
		ArrayList t47_opp_bank1List = (ArrayList) sqlMap.queryForList(
				"getT87_UnionDisp", t47_opp_bank);
		T47_OPP_bank t47_opp_bank1 = new T47_OPP_bank();
		if (t47_opp_bank1List != null && t47_opp_bank1List.size() > 0)
			t47_opp_bank1 = (T47_OPP_bank) t47_opp_bank1List.get(0);
		if (t47_opp_bank1 == null)
			t47_opp_bank1 = new T47_OPP_bank();
		return t47_opp_bank1;
	}

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_opp_bank
	 *            T47_OPP_bank
	 * @throws SQLException
	 * @return int
	 */
	public int insertT47_OPP_bank(SqlMapClient sqlMap, T47_OPP_bank t47_opp_bank)
			throws SQLException {
		int i = sqlMap.update("insertT47_OPP_bank", t47_opp_bank);
		return i;
	}

	public int insertT847_Union(SqlMapClient sqlMap, T47_OPP_bank t47_opp_bank)
			throws SQLException {
		int i = sqlMap.update("insertT847_Union", t47_opp_bank);
		return i;
	}

	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_opp_bank
	 *            T47_OPP_bank
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT47_OPP_bank(SqlMapClient sqlMap, T47_OPP_bank t47_opp_bank)
			throws SQLException {
		int i = sqlMap.update("modifyT47_OPP_bank", t47_opp_bank);
		return i;
	}

	public int modifyT87_Union(SqlMapClient sqlMap, T47_OPP_bank t47_opp_bank)
			throws SQLException {
		int i = sqlMap.update("modifyT87_Union", t47_opp_bank);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Opp_organkey
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT47_OPP_bank(SqlMapClient sqlMap, String opp_organkey)
			throws SQLException {
		int i = sqlMap.update("deleteT47_OPP_bank", opp_organkey);
		return i;
	}

	public int deleteT87_Union(SqlMapClient sqlMap, T47_OPP_bank t47_opp_bank)
			throws SQLException {
		int i = sqlMap.update("deleteT87_Union", t47_opp_bank);
		return i;
	}
}
