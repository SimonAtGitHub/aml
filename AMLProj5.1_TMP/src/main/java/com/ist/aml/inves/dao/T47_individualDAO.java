package com.ist.aml.inves.dao;

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
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.inves.dto.T47_corporation;
import com.ist.aml.inves.dto.T47_individual;
import com.ist.aml.report.dto.T47_party;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.util.DateUtils;

public class T47_individualDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 181241207575045198L;
	private static Logger logger = LogUtils.getLogger(T47_individualDAO.class
			.getName());

	/**
	 * 构造函数
	 */
	public T47_individualDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_individual
	 *            T47_individual
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT47_individualList(SqlMapClient sqlMap,
			T47_individual t47_individual, int iStartRec, int iPageSize)
			throws SQLException {
		/*
		 * ArrayList list =
		 * (ArrayList)sqlMap.queryForList("getT47_individualList"
		 * ,t47_individual,iStartRec,iPageSize);
		 */
		ArrayList t47_individualList = new ArrayList();
		// CatchManager cm = CatchManager.getInstance();
		// TreeMap flagMap = cm.getColumnCatch("flag",true);
		// Iterator iter = t47_individualList.iterator();
		// while(iter.hasNext()){
		// T47_individual t47_individual = (T47_individual)iter.next();
		// t47_individual.setFlag_disp( (String)flagMap.get(
		// t47_individual.getFlag() ) );
		// t47_individual.setCreatedate_disp( DateUtils.dateToString(
		// t47_individual.getCreatedate() ) );
		// t47_individualList1.add(t47_individual);
		// }
		return t47_individualList;
	}

	/**
	 * 取得记录总数
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_individual
	 *            T47_individual
	 * @throws SQLException
	 * @return int
	 */
	public int getT47_individualListCount(SqlMapClient sqlMap,
			T47_individual t47_individual) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT47_individualListCount", t47_individual);
		return iCount.intValue();
	}

	/**
	 * 取单条明细操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return T47_individual
	 */
	public T47_individual getT47_individualDisp(SqlMapClient sqlMap,
			String party_id) throws SQLException {
		LinkedHashMap sexMap = cm.getMapFromCache("sex");
		LinkedHashMap professionMapI = cm.getMapFromCache("pbc_ctvc_i");
		LinkedHashMap industryMap = cm.getMapFromCache("industry_i");
		LinkedHashMap comp_propMap = cm.getMapFromCache("comp_prop");
		T47_individual t47_individual = (T47_individual) sqlMap.queryForObject(
				"getT47_individualDisp", party_id);
		if (t47_individual == null) {
			t47_individual = new T47_individual();
		} else {
			if (t47_individual.getCard_end_dt() != null) {
				t47_individual.setCard_end_dt_disp(DateUtils
						.dateToStringShort(t47_individual.getCard_end_dt()));
			}
			if (t47_individual.getGender() != null
					&& !"".equalsIgnoreCase(t47_individual.getGender())) {
				t47_individual.setGender((String) sexMap.get(t47_individual
						.getGender()));
			}
			if (t47_individual.getOccupation() != null
					&& !"".equalsIgnoreCase(t47_individual.getOccupation())) {
				t47_individual.setOccupation((String) professionMapI
						.get(t47_individual.getOccupation()));
			}
			if (t47_individual.getIndustry() != null
					&& !"".equalsIgnoreCase(t47_individual.getIndustry())) {
				t47_individual.setIndustry((String) industryMap
						.get(t47_individual.getIndustry()));
			}
			if (t47_individual.getComp_prop() != null
					&& !"".equalsIgnoreCase(t47_individual.getComp_prop())) {
				t47_individual.setComp_prop((String) comp_propMap
						.get(t47_individual.getComp_prop()));
			}
		}
		return t47_individual;
	}

	/**
	 * 插入操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_individual
	 *            T47_individual
	 * @throws SQLException
	 * @return int
	 */
	public int insertT47_individual(SqlMapClient sqlMap,
			T47_individual t47_individual) throws SQLException {
		if (t47_individual.getIndiv_income() == null
				|| "".equals(t47_individual.getIndiv_income())) {
			t47_individual.setIndiv_income("0");
		}
		int i = sqlMap.update("insertT47_individual", t47_individual);
		return i;
	}

	/**
	 * 修改操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t47_individual
	 *            T47_individual
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT47_individual(SqlMapClient sqlMap,
			T47_individual t47_individual) throws SQLException {
		int i = sqlMap.update("modifyT47_individual", t47_individual);
		return i;
	}

	/**
	 * 删除操作
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT47_individual(SqlMapClient sqlMap, String party_id)
			throws SQLException {
		int i = sqlMap.update("deleteT47_individual", party_id);
		return i;
	}

	public int modifyValidatedT47_individual(SqlMapClient sqlMap,
			T47_party t47_party) throws SQLException {
		int i = sqlMap.update("modifyValidatedT47_individual", t47_party);
		return i;
	}
}