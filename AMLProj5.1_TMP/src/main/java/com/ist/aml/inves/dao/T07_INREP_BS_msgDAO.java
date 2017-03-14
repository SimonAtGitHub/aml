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
 * <p>T07_INREP_BS_msgDAO.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.*;
import java.sql.*;

import org.apache.log4j.*;

import com.ist.common.util.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.util.MoneyUtils;
import com.ist.aml.inves.dto.*;
import com.ibatis.sqlmap.client.SqlMapClient;

public class T07_INREP_BS_msgDAO extends BaseDAO {

	/**
	 * 构造函数
	 */
	public T07_INREP_BS_msgDAO() {
	}

	/**
	 * 取得列表（可分页）
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_inrep_bs_msg
	 *            T07_INREP_BS_msg
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */

	public ArrayList getT07_INREP_BS_msgList(SqlMapClient sqlMap,
			T07_INREP_BS_msg t07_inrep_bs_msg, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList t07_inrep_bs_msgList = (ArrayList) sqlMap.queryForList(
				"getT07_INREP_BS_msgList", t07_inrep_bs_msg, iStartRec,
				iPageSize);
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = t07_inrep_bs_msgList.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T07_INREP_BS_msg t07_inrep_bs_msgl = (T07_INREP_BS_msg) iter.next();
			if (t07_inrep_bs_msgl.getOrgankey() != null
					&& !"".equals(t07_inrep_bs_msgl.getOrgankey())) {
				t07_inrep_bs_msgl.setOrganname((String) organMap
						.get(t07_inrep_bs_msgl.getOrgankey()));
			}
		}
		return t07_inrep_bs_msgList;
	}

	public int getT07_inrep_bs_msgListCount(SqlMapClient sqlMap,
			T07_INREP_BS_msg t07_inrep_bs_msg) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_INREP_BS_msgListCount", t07_inrep_bs_msg);
		return iCount.intValue();
	}

	public ArrayList getT07_inrep_bs_msgList_bs(SqlMapClient sqlMap,
			T07_INREP_BS_msg t07_inrep_bs_msg)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_INREP_BS_msgList", t07_inrep_bs_msg);
		ArrayList list1 = (ArrayList) sqlMap.queryForList(
				"getT07_inrep_bs_msgList_msbs", t07_inrep_bs_msg);
		ArrayList t07_inrep_bs_msgList = new ArrayList();

		LinkedHashMap organMap = cm.getMapFromCache("organ");
		Iterator iter = list.iterator();
		MoneyUtils mUtils = new MoneyUtils();
		while (iter.hasNext()) {
			T07_INREP_BS_msg t07_inrep_bs_msgl = (T07_INREP_BS_msg) iter.next();
			if (t07_inrep_bs_msgl.getOrgankey() != null
					&& !"".equals(t07_inrep_bs_msgl.getOrgankey())) {
				t07_inrep_bs_msgl.setOrganname((String) organMap
						.get(t07_inrep_bs_msgl.getOrgankey()));
			}
			t07_inrep_bs_msgList.add(t07_inrep_bs_msgl);
		}
		Iterator iter1=list1.iterator();
		while(iter1.hasNext()){
			T07_INREP_BS_msg t07_inrep_bs_msgl = (T07_INREP_BS_msg) iter1.next();
			t07_inrep_bs_msgl.setOrganname("合计");
			t07_inrep_bs_msgList.add(t07_inrep_bs_msgl);
		}
		return t07_inrep_bs_msgList;
	}
}
