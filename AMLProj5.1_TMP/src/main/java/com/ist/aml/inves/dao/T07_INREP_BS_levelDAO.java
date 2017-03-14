/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2014-02-10] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.inves.dao;

/**
 * <p>T07_INREP_BS_levelDAO.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.*;
import java.sql.*;

import com.ist.common.base.*;
import com.ist.util.MoneyUtils;
import com.ist.aml.inves.dto.*;
import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_INREP_BS_levelDAO extends BaseDAO {

	/**
	 * 构造函数
	 */
	public T07_INREP_BS_levelDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_inrep_bs_level
	 *            T07_INREP_BS_level
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_INREP_BS_levelList(SqlMapClient sqlMap,
			T07_INREP_BS_level t07_inrep_bs_level, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_inrep_bs_levelList = (ArrayList) sqlMap.queryForList(
				"getT07_INREP_BS_levelList", t07_inrep_bs_level, iStartRec,
				iPageSize);
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = t07_inrep_bs_levelList.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T07_INREP_BS_level t07_inrep_bs_level1 = (T07_INREP_BS_level) iter.next();
			if (t07_inrep_bs_level1.getOrgankey() != null
					&& !"".equals(t07_inrep_bs_level1.getOrgankey())) {
				t07_inrep_bs_level1.setOrganname((String) organMap
						.get(t07_inrep_bs_level1.getOrgankey()));
			}
		}
		return t07_inrep_bs_levelList;
	}

	public int getT07_INREP_BS_levelListCount(SqlMapClient sqlMap,
			T07_INREP_BS_level t07_inrep_bs_level) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_INREP_BS_levelListCount", t07_inrep_bs_level);
		return iCount.intValue();
	}

	public ArrayList getT07_inrep_bs_levelList_bs(SqlMapClient sqlMap,
			T07_INREP_BS_level t07_inrep_bs_level)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_INREP_BS_levelList", t07_inrep_bs_level);
		ArrayList list1 = (ArrayList) sqlMap.queryForList(
				"getT07_INREP_BS_levelList_msbh", t07_inrep_bs_level);
		ArrayList t07_inrep_bs_levelList = new ArrayList();

		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T07_INREP_BS_level t07_inrep_bs_levell = (T07_INREP_BS_level) iter.next();
			if (t07_inrep_bs_levell.getOrgankey() != null
					&& !"".equals(t07_inrep_bs_levell.getOrgankey())) {
				t07_inrep_bs_levell.setOrganname((String) organMap
						.get(t07_inrep_bs_levell.getOrgankey()));
			}
			t07_inrep_bs_levelList.add(t07_inrep_bs_levell);
		}
		Iterator iter1=list1.iterator();
		while(iter1.hasNext()){
			T07_INREP_BS_level t07_inrep_bs_levell = (T07_INREP_BS_level) iter1.next();
			t07_inrep_bs_levell.setOrganname("合计");
			t07_inrep_bs_levelList.add(t07_inrep_bs_levell);
		}
		return t07_inrep_bs_levelList;
	}
}
